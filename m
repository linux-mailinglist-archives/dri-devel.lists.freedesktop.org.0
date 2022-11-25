Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD59638A44
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 13:38:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A0A10E74B;
	Fri, 25 Nov 2022 12:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B6310E756
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 12:37:04 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v1so6543430wrt.11
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 04:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fJAlFZkHe4ktdw1E/cS67Ub6i2g6utdoyS6sjNqUgDg=;
 b=mVuinoJgB7IthUjEQhTD3EMD0e6+DnGe4ZmuRbJDAXx8EPbM9lfIGQ49m2ohc+f34o
 9InsAJ7BMUJs8k9Rd47KHPOAvnkoyZNVJC1X0aKvVYNn6ZyflmE6SKGBIpP+Wvj+DxPN
 EgOhi2QzJ68zFFGnrUTA7X+3v+z49LxSZmLmdurSO2Dc4XHdEmw1niicgFfUxm4wCtLK
 8IwefwpQ8Xf6Yip+S4+Vh5rzMqYUPwBmr1XHzt6z8zKh3fuM8RR1pShep+aCx0Y6a9rG
 05vb1co4p5rsDYn49s18Lri8HxG24HQBbvZfj+mAkmfAkyk/Ng8O2avZlbwKJJc0ALRy
 /dLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fJAlFZkHe4ktdw1E/cS67Ub6i2g6utdoyS6sjNqUgDg=;
 b=U9RgLPtpVw+1KlFHHwVnQekqk5cet3rS8/LN/V/2a7M8aifE02uIO4g5l60scFkBWt
 NF2y1vC6jEMpDeo9Hffj5mTB4+2ElCB0YkEV3RIZ9Jkf9lPhtTEJWC/hl/SY35f0FrE0
 +LlrDyy5cGRRaB1BcdOsPjuZ0BWlbK3+Pt1EWuW3onpHxyFoKU1lMvPZLx5uEwdjWCC0
 lOfC4eiZM1UfuhKRXUquTUrgrCSQw5pNmAN6WN6DK6XUZC4BM5XftnuW4GRz/IMKlppt
 fHvDkle5JIUQD7SAN2Vuu1DdpYRxS0P5DeVBwurG3XGDzrN4xGxAXKVw0cXZxu/JvSdP
 NCGA==
X-Gm-Message-State: ANoB5pk/I9bZy8T6xanlndZWB80QpmMGEZTRDBn3O1+pO5UeVRxDdksn
 0nK3LqrZ0gMx+iPzLAv4jr1Iqg==
X-Google-Smtp-Source: AA0mqf5o4GXzn2rwCzo4feptXecVWUcVKuDVfArlCF6nlH1io+wxtYfxtih7DQD6/ykjZzuqflnvng==
X-Received: by 2002:adf:ed4b:0:b0:241:d4c2:e741 with SMTP id
 u11-20020adfed4b000000b00241d4c2e741mr14849813wro.628.1669379823882; 
 Fri, 25 Nov 2022 04:37:03 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 04:37:03 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v4 18/18] arm64: dts: qcom: sm8250: Add compat qcom,
 sm8250-dsi-ctrl
Date: Fri, 25 Nov 2022 12:36:38 +0000
Message-Id: <20221125123638.823261-19-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 bryan.odonoghue@linaro.org, swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add silicon specific compatible qcom,sm8250-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sm8250 against the yaml documentation.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 0d47c5b7148e1..8a73f1b487043 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3528,7 +3528,8 @@ opp-460000000 {
 			};
 
 			dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8250-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -3619,7 +3620,8 @@ dsi0_phy: dsi-phy@ae94400 {
 			};
 
 			dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8250-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

