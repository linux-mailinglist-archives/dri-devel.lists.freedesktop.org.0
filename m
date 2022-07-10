Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A43B756CDFD
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 10:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B362411BFF5;
	Sun, 10 Jul 2022 08:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E259F11BE97
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 08:41:38 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id w17so1469998ljh.6
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 01:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7M3y/J4ATzgpaOrUJ14mMptYBHdlqkPMj1D3F6zPoH4=;
 b=cH002AB92AASL9wrQ5HxkfCa6l25MS5KotB317WZgLYyFbYY7PtrWaswbjbokpxtE0
 SlR3+x8WxzRH0oTX1am2pz/YVj2TJyRIntMHEVJP08zV7/BcsLa44o43EPN+vdXqgR64
 pxOZH2IcIW2KaAOM9Xlfpmi3DG3E/DMGYM/zhIxJmb8zOMLDO9ymiEqKBSBi9y8TkeZA
 8yYOCWdFhb0wBUTu8gan61Ib1Uy+oNnhlzxZPaUaofkWQj7akL/0zFkq35pUCm170g3L
 JhTOjDJuX2EDADtrNiLbajb1Sa2VQo61pCmJGKN3SIjq+jiIRcJ9RjlamPXho0fO9R/G
 OZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7M3y/J4ATzgpaOrUJ14mMptYBHdlqkPMj1D3F6zPoH4=;
 b=7OTG8hmPBjOo9aIQJadgq6C9enYVQzbH0d9b5e8kGLOBdvCF5TFHLulNO7pIX+ajmJ
 CQbJOysnaqAXPk7iku2vG19hC+9lBCEp/EvWUPBLvH83k26ETI4ZJUi5u0PWDgzCS7xW
 hn4Oiqk3VtXaci0OQmauvk5+OLyncghda3Eu9cOzNNAtTIy8VgWRlBAwH1MhQfSoajpr
 N+3uarmpQfUO4AvNt/ssOw6ooSOP4pCpGFsyt7HgOvS5L/SVRc2cTTnWMEqNgcWUbmeY
 4CoFCe2JmMd4vGI3m6TRBV60XJOvbZEn/CzGGQL8OO+EHv2IK4mrJhlVlqZDB2wyl62b
 Qotw==
X-Gm-Message-State: AJIora+IpSA4CCNaLyfDrCse3wZdHsQrz0o0VXBdLCzkP8/Q5HzOTbjg
 T+q5v1CRV5/FHb6IF4UVCx/jRQ==
X-Google-Smtp-Source: AGRyM1sl9NGcTZmyumXtmZ2RVVLDVy2Mq/fdERhaARyqxx6aJwhnlr2/a6sqie0ewZ8peKHzAcxh0w==
X-Received: by 2002:a05:651c:248:b0:25d:4f99:683d with SMTP id
 x8-20020a05651c024800b0025d4f99683dmr7040851ljn.366.1657442497254; 
 Sun, 10 Jul 2022 01:41:37 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 i21-20020a2ea235000000b0025d4addbad4sm912536ljm.91.2022.07.10.01.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 01:41:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 2/9] arm64: dts: qcom: sc7180: drop #clock-cells from
 displayport-controller
Date: Sun, 10 Jul 2022 11:41:26 +0300
Message-Id: <20220710084133.30976-3-dmitry.baryshkov@linaro.org>
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
before splitting the device into controller and PHY devices. Now the
clocks are provided by the PHY, while the controller doesn't provide any
clocks.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 875808cf0614..72994f599825 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3096,7 +3096,6 @@ mdss_dp: displayport-controller@ae90000 {
 					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
 				clock-names = "core_iface", "core_aux", "ctrl_link",
 					      "ctrl_link_iface", "stream_pixel";
-				#clock-cells = <1>;
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
 				assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
-- 
2.35.1

