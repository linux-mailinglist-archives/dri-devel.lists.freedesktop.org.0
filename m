Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB13756AD90
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 23:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579D611B6F0;
	Thu,  7 Jul 2022 21:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B9211AFE5
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 21:32:12 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id t24so33339886lfr.4
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 14:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IhjBNRgDY3D4V2rQwtlvIRuVCHJhruesxJluDAINOWs=;
 b=VUbk51kgK6DWakFxbopkmxoVeUdQfuTBMzzkRp1o9o0TohK4VU5w6H0cmE9AGZ/IgD
 5zFriWo3SMyG9WWdwzHFq+HAHv28Y1gLiWW8GxYjMVpjuS1LJFxYkryE1PmDoGTYp451
 z4dts5pr+AxlcwoM0jDhH96C/wiYS+kL/sJG4MQTHbzc8nil0XiZ1LtYJuSW0bXYk9cA
 95YOvAJJWSWwNCkJqN0k6RUh54ADoFCr6z2cNdvqxmCFU97OZwsHL+/GcElb1I94kOgx
 h1cgYs/y5OFeYYfYtVDyhG0D3/BDp3gTQCbOdqN0Ejv9M2m5ypPZ7KoF19Fq44nV6SwH
 XvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IhjBNRgDY3D4V2rQwtlvIRuVCHJhruesxJluDAINOWs=;
 b=OKTkdIp+M4nICPPr8kMipEyp3MEekgAliff94oPlgAkl5TvOtSwyItqOrXD72b88lH
 BiYzxtIcWtWFVYSKzT+UE3Kas0d9Bwv8cLsYaK41etcLA99YLfHjRstS+U2QWwJImSpF
 t4NnGUHAu6hqUC6iYm1VLK3pHjW9sQSNVhEZixPnCpRt/Hi9kAnvN107vXpDk5YA8N2C
 z2rMW8rPVdEAFKIgffxk/77bOFFBHr795H8HHMMlmcCXPCNL7w3sHfYKHH9M2omcGW35
 LmGlIs4MQN7cgMH87UI+ywgJAa8cJyD2jo4VRBVVRttnVdAAQy22Ey3HROuyFa5D+v7m
 2nGA==
X-Gm-Message-State: AJIora8evtTQaLbcp1ywyPyU+F8K6wAVYq+Cbmsazm/WYPXDuBIbCTkM
 vt8HbB6ehmCnF9NkDiQRYgcGYw==
X-Google-Smtp-Source: AGRyM1vTK4quBnMmp1glbsvEm1q+zLVGJvI7AgXn5761ZrteP/d/rp7gn6cwUMDjPfLOSwVH2NZtsQ==
X-Received: by 2002:a05:6512:1043:b0:481:31f:5505 with SMTP id
 c3-20020a056512104300b00481031f5505mr163208lfb.112.1657229532475; 
 Thu, 07 Jul 2022 14:32:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o19-20020ac24e93000000b0047f8cb94004sm7046709lfr.35.2022.07.07.14.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 14:32:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 7/9] arm64: dts: qcom: sc7180: drop #clock-cells from
 displayport-controller
Date: Fri,  8 Jul 2022 00:32:02 +0300
Message-Id: <20220707213204.2605816-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop #clock-cells from DP device node. It is a leftover from the times
before splitting the it into controller and PHY devices. Now clocks are
provided by the PHY, while the controller doesn't provide any clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 47ce5787ed5b..dc2767cd852d 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3092,7 +3092,6 @@ mdss_dp: displayport-controller@ae90000 {
 					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
 				clock-names = "core_iface", "core_aux", "ctrl_link",
 					      "ctrl_link_iface", "stream_pixel";
-				#clock-cells = <1>;
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
 				assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
-- 
2.35.1

