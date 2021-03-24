Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A704347C05
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:19:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA076EC81;
	Wed, 24 Mar 2021 15:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEFCD6EC87
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:19:24 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id z25so30671052lja.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uOwO8iANW7saI2yo/rKV3plq3B/8JH8KOWGKGoDTU2M=;
 b=HSrTD8Xdjt+QEKCvw5WgkS71Vcl/EUopfIf3Af5r8fWOFz5Cym7/FQ+BFQIbmz8GFm
 cx296qZIIxdNR+2dlViqrjUNR3z6Ny7uz1sRisaFEpwEZL36NaNh6HQVdamNVdDzYEXF
 Ou2rzif4QfT4B4Dw22StjRHcQzPJCR0NSZ/TGTarLcPlvTEBDDQMnVdHqagDh51mfDBR
 KK3H86b9Dp5r4fZnexUoHrDBp9KArCKfj+sDZhBejAl5NfoNc/VLLZOQgKWcwV+xE/58
 Y0bOgbHVSax9IPD4RGuNie0gL1y/QMv60SLXAj9nKUyvgapz5z+gUlaJKH9llFBMXT2h
 Pvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uOwO8iANW7saI2yo/rKV3plq3B/8JH8KOWGKGoDTU2M=;
 b=XwKp89Bw2RB5HzCXa5a7trcbVp+eB9dYHw72b7L4n1TDt3KGk41etZi17+4l+6DkGH
 lX8vZrN5KYU/e1mdEUWQCVvU2H2ZHVB8mNEMIopz5E+c9NXWX/fU/dEUXA6YbMw1RaMW
 +2SwlhZNHxc+McBGZZjtobfo1nZXcf+jSAdOXzRvXXRI0jFPVG2VyXSPSUYsFiVK5zgu
 EsaODNoAJLwMv1n5hn0rN0Jax9FzC7GetnIIvRjixr3CYyd4xXDh4S0QkR7TIOVVDmEw
 a/qussdQRLCBjBlagle6puY5QO5hA12jL6uNa5zfUZKbahUqUQ30MHOWU7v8v0oMcvMW
 1Kaw==
X-Gm-Message-State: AOAM533ys7yDTEOt4FECdzpvBYK7CIlxFaSV3T/cfKO0Ub6ETRCj7+kL
 iZ3FUEcDUJjR8vDRNNWQNpGFvA==
X-Google-Smtp-Source: ABdhPJxJPE/lsidWG4sbxqSE0fAKJ8DVwJ4yZRMkgFbAdV1HDkewtc2cAtHfGeQhL7IK39T6JBQWAA==
X-Received: by 2002:a2e:b6c7:: with SMTP id m7mr2386715ljo.241.1616599163322; 
 Wed, 24 Mar 2021 08:19:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:19:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 12/28] arm64: dts: qcom: sdm845: assign DSI clock source
 parents
Date: Wed, 24 Mar 2021 18:18:30 +0300
Message-Id: <20210324151846.2774204-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
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
index bcf888381f14..8e0c5dfbd639 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4115,6 +4115,9 @@ dsi0: dsi@ae94000 {
 					      "core",
 					      "iface",
 					      "bus";
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SDM845_CX>;
 
@@ -4181,6 +4184,9 @@ dsi1: dsi@ae96000 {
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
