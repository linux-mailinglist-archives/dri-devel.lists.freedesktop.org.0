Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDED638A45
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 13:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760BB10E76E;
	Fri, 25 Nov 2022 12:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAD810E757
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 12:37:04 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id t1so3342799wmi.4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 04:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dx2lQyIeBTqpqJ7X6Q0LzKVhxGjP5f4ToZ9EXleXAr8=;
 b=zL1kLPDxZd8QFdr1kbsDaEbxJo5nPTa3ap05Rfe4QZjimKYqzsubfXUXxysfcNGUI+
 TsW4yI7Kzs8nDVwrQCnVJyQqek0Fv2wvN8u3eSloAP++Hk5YBQOg97G2zypVK2hFEWlA
 ElowF0V6CwhPaRUoQdIlKf4vdF34xCPdpVGV/HCrNI5rApZXWeWb6CmcvtWeslRMqLe2
 kXRULzCzdCnsyuYMLGKO3CIsXdFQGp97A6jmOPJiZXHyItAvK7b8wp/2Bu4EQ9nni+1l
 KYqD/HgkrlVjlSbE+DxAcMffIasPjPybObBNNSxtk3n9p9I8+BWwUz+uBe+PvGTRSIaC
 HV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dx2lQyIeBTqpqJ7X6Q0LzKVhxGjP5f4ToZ9EXleXAr8=;
 b=1pGiCm4kYFRyRiD/CHd6zO8hLB8BmQLb1yOpxK1OIHnH1MPDfjPpHq5BjNAEcLpm1J
 g8Tolw3AoExlkiIC/J62Lg7VK8dRpFVifycSVCn9qrYI792af6/PBOI9buNOFviKVwj7
 EHIcS1KZDADU9IAXDLKFf2A/ClXNtuJWPuAmJTzLJwGMlv2qPbnNb9CytP3tsBlq+f1C
 fETxpAPwafceuh+vX5seNBPzsOSlDi19UQ5qWe/EoGiBmtq4nAQYeYzzOR3ZvPCaYdrs
 9OnrLqyEMbDt3wwIxzKCmy7iTc8eCPierbArNyTj90BKoakmluh/9rEvwidT4J31xaBD
 sTMQ==
X-Gm-Message-State: ANoB5plI2fkGNckqGHFqU15WaMdgq3p6Boo4idKYOJTul0uJHvuJ3Est
 uvU55XM3jwv+QwU7/8sE2+X3cg==
X-Google-Smtp-Source: AA0mqf5x4cWUrXL5IEWLm84sdI/yALSHQjV/u+S/A6ZSDK1EiE1plFgxTlYUNwfJSCErQBdxPi3WTA==
X-Received: by 2002:a7b:c048:0:b0:3a8:3e58:bb9b with SMTP id
 u8-20020a7bc048000000b003a83e58bb9bmr17356780wmc.168.1669379822645; 
 Fri, 25 Nov 2022 04:37:02 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 04:37:02 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v4 17/18] arm64: dts: qcom: sdm845: Add compat qcom,
 sdm845-dsi-ctrl
Date: Fri, 25 Nov 2022 12:36:37 +0000
Message-Id: <20221125123638.823261-18-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,sdm845-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sdm845 against the yaml documentation.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 5420205417c81..c14e49c9655c3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4522,7 +4522,8 @@ opp-430000000 {
 			};
 
 			dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sdm845-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -4593,7 +4594,8 @@ dsi0_phy: dsi-phy@ae94400 {
 			};
 
 			dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sdm845-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

