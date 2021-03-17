Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A6033F33C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 15:41:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB63B6E7D0;
	Wed, 17 Mar 2021 14:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52316E5C6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 14:40:53 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id k9so3297281lfo.12
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 07:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UAQa/+HPZGb9w4gbaD2aOLSU7WxeXPAw6Cdwe97w/Q4=;
 b=eXP/TledxAPTdTLVmvjWNrnuZ/q0OFDG8H8Gqxj0LKAqVsIpvu5tTqTIgswDK3CeS0
 JWDh9i/7xcJi3WcsKO/Tlly97uR125Ij5vcDkA3bTqdgv2HHcVGvyDYlKZLOC4thwk7Q
 UpKymK7LwNVk9U2XQM4tBKconFpeO8znWGb7iTxgc/lPPDH7U8LYareV88zndg+UAwnv
 UYCxmNTVmvb5F9KfQ7LCvpGlyFyQJLBSwVuI39YvhjVqPqnth0tmnMlKFhiDMqllriGY
 j1cbGp/4XM/2T1BmXPbL5nDwPsyjsvEIgqjoTkZ0f3KIDIW+nQShkGozV3lXxoT6Fr4W
 3Q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UAQa/+HPZGb9w4gbaD2aOLSU7WxeXPAw6Cdwe97w/Q4=;
 b=NmPfLom9P5FoKgNV3xoTWeUKvkfw9TaY/3qd1ONyOuQxNtcZtIlU4vkydEyPqCad5P
 My9pBuXbGX4+HY5voyqlT/fQXiPj38UipFPwfAUxponGe33WImyYqGXFj3r9AESipfLA
 E6S6MjikY9+FHNO4iwCbkCFUL3qEGeBdYl+ByKT228qz0iF992lwnkdTpyPkOKvN3g+S
 RJPlC8fru47dt9g++ednH9JV4bRvtKdxhnm/Q+Org2KvewkEG9iyzLshHy+xjLg9YXKM
 VRm0su/46NvJAirrWArNEKaCkW1Z+bo4tdWMQZESAikZf58425pzjCUCHcs9sbFeOMGX
 o3vg==
X-Gm-Message-State: AOAM533ALrRY0tJ24JPtArVIHOJHvOMnti46MVeacsAqfQD+UFj3Xghp
 dRpBtYfA5/S7NVqGYfMUkwPVng==
X-Google-Smtp-Source: ABdhPJw4euHwBGmi07h52o4jzm1u82sY8Mak58T89zORmZtairSuAVrS4Ctn8CvJZPTrJNViVGwA8A==
X-Received: by 2002:ac2:5e6a:: with SMTP id a10mr2559303lfr.181.1615992052285; 
 Wed, 17 Mar 2021 07:40:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 07:40:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v1 10/26] arm64: dts: qcom: sdm845: assign DSI clock source
 parents
Date: Wed, 17 Mar 2021 17:40:23 +0300
Message-Id: <20210317144039.556409-11-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 454f794af547..2166549382c1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4113,6 +4113,9 @@ dsi0: dsi@ae94000 {
 					      "core",
 					      "iface",
 					      "bus";
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SDM845_CX>;
 
@@ -4179,6 +4182,9 @@ dsi1: dsi@ae96000 {
 					      "core",
 					      "iface",
 					      "bus";
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SDM845_CX>;
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
