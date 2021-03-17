Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4695F33F32C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 15:41:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C416E5CF;
	Wed, 17 Mar 2021 14:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E726E5CD
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 14:40:52 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id u4so3370801lfs.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 07:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VZ0geH6BqMBlmbQ30iyES93D0PKaLEePFxddTMOy9xQ=;
 b=no1y5QTnePloWF6Kf5NJI+KW4hcc8iSa7md8U/h+236ztkxrCWmLM76BfogRg1Ve16
 ic8UeNY3CQvCIj7LBtJihb+1OVqWASBOHdzCyKDLDy2js/EZ90sO55MK70CNPfwgfQ0a
 L2Ye9KT0n0j0ihVSz+W9IqJqF/4X+TVYMGXigMPr7xBd603Q3UKwoLSy1ZnSjHuDVLX3
 wB6Ft/pYSwnaePxzAXT2IVJjEc4Pd7OaiabwwFxAGW3m7GcKKh/1U4ti1HXk8/Lz0stZ
 FzhGd5BZYHT9Drn7Av/GitUBhlueIZEfh1k7Yi53NqZX4V+p+Ljn4mSKTUE5WiRPZfgn
 zoPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VZ0geH6BqMBlmbQ30iyES93D0PKaLEePFxddTMOy9xQ=;
 b=fk+y3oFpbduhls6iAqR0Uc8CYPfx+zMQgAh+r7JhEt6jmexuhQXEo+2vYj8WixSwID
 YnLnnMCTv4JpGtTDDQmaTmhnrWSiPLNvkJ9UiYHuYB+w9pVQHahtnxaoBL1wUzLzbc3t
 oC4aS6I7CYQj+Sx5tt2n0yikDevsPT5sswVtMW3+NHnQe0Ik8arViJ3lpCUjBFM8ktt1
 B11jQ7DP0oR9WxjNI5vOEKRlw8wi0ZmD8WO7TdWAfhWu0ARgTLsXInHrQKAbGMSHFog9
 S8JOOhLzD/aGp71ubTVJufhiI8yE7Ay8Ef9kShKgESNaffnQqeYvx2rJAAgBEIP1cmYE
 xlyw==
X-Gm-Message-State: AOAM530UusqNBhnEQ6fQWTo1s0WbRLQZBuHWrfovu6nf1jOIsmv9xz+u
 SDocTFx2K2jNgfL0fLw2hBvUsg==
X-Google-Smtp-Source: ABdhPJw5jus2v3pxW594CEk+SrRrg9htGKBQ1CbmXj1XxLuT4EdAEgnqIByVfE0lXaRf41wydng6qw==
X-Received: by 2002:a19:44:: with SMTP id 65mr2673123lfa.104.1615992050905;
 Wed, 17 Mar 2021 07:40:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 07:40:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v1 09/26] arm64: dts: qcom: sm8250: assign DSI clock source
 parents
Date: Wed, 17 Mar 2021 17:40:22 +0300
Message-Id: <20210317144039.556409-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
References: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Assign DSI clock source parents to DSI PHY clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 947e1accae3a..b6ed94497e8a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2445,6 +2445,9 @@ dsi0: dsi@ae94000 {
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SM8250_MMCX>;
 
@@ -2512,6 +2515,9 @@ dsi1: dsi@ae96000 {
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SM8250_MMCX>;
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
