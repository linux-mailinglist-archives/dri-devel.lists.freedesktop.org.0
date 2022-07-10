Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 976D256CDF8
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 10:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A878411BF6C;
	Sun, 10 Jul 2022 08:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3CA11BEB4
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 08:41:41 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id e12so4237197lfr.6
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 01:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4OZQG4ziutxO+vr4IL5ovGIJyJUy264W5pL1ERzKToc=;
 b=aSnR1KlqkJAwzidfnsEtuoVyifv19Ox8XAsqdSeYtG1gY5vZD7VRZySSfWjelSxiQn
 qv8G3t7EDTg+w/iNuDWKfD/EeQlOYihRLqSdpv8Gqg4TiEN+ZFTwjXamioNIo5LzxOwz
 DTwxCu7BWw7wIcJTwT31ufCDknzXPjy3YT5lw2KGNMvjuRn2Q7VB6cg008oMcgPwc63d
 X2ewPJoHDMKX1wVrqmHsLNWTSaLOwLxfvFTdGPFiLRNG0SHDGpaEYSzeu2ZY3Z2z7TJ3
 gcnUPXrvSgp8EV7XW6HW23x7baoU+3idrt/YP+cjaPE3tUsWAX1VJRPEbb7/3T9io0Ve
 Snrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4OZQG4ziutxO+vr4IL5ovGIJyJUy264W5pL1ERzKToc=;
 b=Ao7UKNtnnoyopjDwdlIkhkSNsut4YVQxRar8LRPBdxn6yU/PzTkuMBrC1ctf3ZVsT/
 N3DL7mvgc5f28x2izXkwAsXx82cI/5zZAZ4g828vjHgGN2mwKceyIOXkzIOW6iDHVRx9
 ynWPD7wX0+PoNY8tbvjiUqxDWWioN7fVOkGbqYej9ZKKPnoKdyMlGcXR7QCvWbb3Xa99
 LMkjCcoCfNe0KhdyVv/UbE1cduILHSfTeG1YtdtbR3dZT0oM7XYfI1MvARnHpoN6tqoZ
 2GK5plNNxxSTTwYr3aT30Gz5Sm5nx0hMXpq1nAmyXmidGXSPQNPdGmMpbz39jOG7hWnD
 1vmQ==
X-Gm-Message-State: AJIora8mpomWEqSdCeuqz25v6hlxbzQRNP/sc62IOoYI0Fps3JIsEwSC
 0dYUU/dF7C94RjZrseyaJRA0EA==
X-Google-Smtp-Source: AGRyM1vjwaXauptf9hMMQNsrlj0OmtsRIyP1YM4c/ZfAhApj4tbXxqwM6A77bt447uzqxOg9fH3HaA==
X-Received: by 2002:a19:f208:0:b0:481:163a:b07c with SMTP id
 q8-20020a19f208000000b00481163ab07cmr8585126lfh.613.1657442499446; 
 Sun, 10 Jul 2022 01:41:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 i21-20020a2ea235000000b0025d4addbad4sm912536ljm.91.2022.07.10.01.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 01:41:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 4/9] arm64: dts: qcom: sc7280: drop #clock-cells from
 displayport-controller
Date: Sun, 10 Jul 2022 11:41:28 +0300
Message-Id: <20220710084133.30976-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop #clock-cells from DP device node. It is a leftover from the times
before splitting the deviice into controller and PHY devices. Now the
clocks are provided by the PHY, while the controller doesn't provide any
clocks.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index e54c2000b098..a55e6caaaadc 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3730,7 +3730,6 @@ mdss_edp: edp@aea0000 {
 					      "ctrl_link",
 					      "ctrl_link_iface",
 					      "stream_pixel";
-				#clock-cells = <1>;
 				assigned-clocks = <&dispcc DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
 				assigned-clock-parents = <&mdss_edp_phy 0>, <&mdss_edp_phy 1>;
@@ -3829,7 +3828,6 @@ mdss_dp: displayport-controller@ae90000 {
 						"ctrl_link",
 						"ctrl_link_iface",
 						"stream_pixel";
-				#clock-cells = <1>;
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
 				assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
-- 
2.35.1

