Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A64381906
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 15:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6836E1A7;
	Sat, 15 May 2021 13:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86FD86E159
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 13:12:24 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id u20so1740488ljo.4
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 06:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VZ0geH6BqMBlmbQ30iyES93D0PKaLEePFxddTMOy9xQ=;
 b=Uv6MazY9XNEXNTEONgwnHe0oOXRGuDo0b633L9TmxeAMKHNMdElnpQxc2m11x78BYE
 XsSy6yfX2SvK/BgTmrn1J+s2NUMEJKYmoAxYLf0D7JeJl92OGakS/oSEAvVKZL3QByMH
 gGy/uqAHHAoHnQ9vV8Jt2YXxwltQIDRHJpHVVmtHtoYp5lq04Wo12RpE5dRWHsxR7g9G
 l+gsLXbS7ua17YOR02tNw+LaE0KKvchfT5UG7lQoFraNajjYCWV4bPbLhP83+qzT0Gzs
 WyJWGBHoB+CfG9QtkL4n+ROCRcCEn7iR3E33bnvly3COciRyXZSSOiHN+9Wz5ibSU96O
 QoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VZ0geH6BqMBlmbQ30iyES93D0PKaLEePFxddTMOy9xQ=;
 b=ga3S+2bhF2gBC2mZvIneVCoUrzTjge3DCun2S7clspMbPIIv3lIT4hIehW8nJxlpqW
 qLTEXwIUM78Vw7+O0MvPeHb1RtzWhw2eKSApUCrcRIUpbjPXXTsCn74c0i/y4P/qKrEY
 e5gVAKvUlT8n5sjoF/ZKrZQKl973Xp7jQb3FPXUhrG3dlRsq9+Z8BYWS72mXs4Z/+Izx
 EwNrWJaMNaIC9RNE602j/pGHsKKWVJ8K1y7awbSD+LoV3Joim06/dfyFS1pKK0M45BAf
 t/RnpWa18WXDM7k/cxfbb76FEVTkwf5TbD3vdrbaCbZ4bUou1e48GHmVHzniT37SKS0f
 0wtA==
X-Gm-Message-State: AOAM533aVsjuAiAxcclX8dsaucN0iPi6z1urCGvyUohoKOofSAhVJ6i+
 0LwFV9qdzOqFQLgbg4lnDPzePw==
X-Google-Smtp-Source: ABdhPJx4JwjGkjf2+ERd282AHyLy6MuHHJwWFDuM056vtz6NXfDNDM1FmZ5MZCoMRJln3Seq4wYFqw==
X-Received: by 2002:a2e:7a0f:: with SMTP id v15mr41795283ljc.242.1621084342980; 
 Sat, 15 May 2021 06:12:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id m4sm2061865ljp.9.2021.05.15.06.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 06:12:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 4/8] arm64: dts: qcom: sm8250: assign DSI clock source parents
Date: Sat, 15 May 2021 16:12:13 +0300
Message-Id: <20210515131217.1540412-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
References: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
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

