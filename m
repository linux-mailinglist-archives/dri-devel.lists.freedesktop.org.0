Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 668CE6520DA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 13:39:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDB410E3DC;
	Tue, 20 Dec 2022 12:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2584010E37D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 12:36:55 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 i187-20020a1c3bc4000000b003d1e906ca23so8101754wma.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 04:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iKsehGcz374PW4Oaqc03FTNTJ/WJN4Esos64GXOFLAY=;
 b=h2sziuXwG6sjPr+BLoosxPre5o0Zs1SnFy6sNIMS1Z7mXntNvSk7VogqF3ISC572TB
 rvxRhnehnxmnmAgIxciV/rfrRqoQh2uiNBL6gKkCUygHoVmNkqlvbxaDRAnwlMR43aJP
 faLB6JAAdr19rgg3l7RCeVMJxbRCbL252wKrvvdao/eFKbeHhcjQX5RraERSmF65Efw6
 Fzoal6V45HaCqM1EWA+scwPqPuIHdD1s44USd9gHHZnRUNCDwdBMUBVEnlm6r7qmZpk/
 p9quS9ss8Hx333VgUmlZ2l+TAIK4xgF9tFc6bhteGcO2mFLGqQG/3yo6mX1EZVKwsOcn
 gyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iKsehGcz374PW4Oaqc03FTNTJ/WJN4Esos64GXOFLAY=;
 b=q40DEF+I+VXbxsei05/5WDbNElh0RR76ysdiq1u8hiMupWJpO3p4WKu4NFYP13mnGJ
 ZUlmk64232iKpjCJha9MSKd4U36pY4+ILIa5+VCN58fYO+OfpaeZz8i4QR4ne1Ac82J8
 SzNuw9oR9T95fiLEaRNjsJe2lRGUbXLn6MQZ1C/ZEg/HZJTqrZpRW0Fa//WMi3Ga6Sv4
 FKUsmtKa11bT44TS2/k4sFTKZLT6wMQbCIZ65MwTLND0BhK5toj24gJJkMjrgjRTL3Qt
 oSF9zFwoe9HYuesEvk8+G5NE2O7/DwIZtJ8cHgaUE+ulACN7Ym+yIDgZwieJU4kniIJr
 wA3A==
X-Gm-Message-State: ANoB5pml3Cv4oae7/ab0Jh2LhWrmFBsJrBRr/Lyj+xRsznjH/q5p25O8
 Qt6jHHImKD5UltzRM0UZhMU0Cw==
X-Google-Smtp-Source: AA0mqf74KclPWOpqVvzCUumx4JRwY1BH8ImGDpuAhQaKiXZgfqUWUxLsUGnA2RmHz8bZMGUHSnfsPw==
X-Received: by 2002:a7b:c40c:0:b0:3d2:392b:3169 with SMTP id
 k12-20020a7bc40c000000b003d2392b3169mr18519561wmi.28.1671539814709; 
 Tue, 20 Dec 2022 04:36:54 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:36:54 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v5 15/21] arm64: dts: qcom: msm8996: Add compat qcom,
 msm8996-dsi-ctrl
Date: Tue, 20 Dec 2022 12:36:28 +0000
Message-Id: <20221220123634.382970-16-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,msm8996-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for msm8996 against the yaml documentation.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index d31464204f696..c6d8371043a9a 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -989,7 +989,8 @@ mdp5_intf2_out: endpoint {
 			};
 
 			dsi0: dsi@994000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8996-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x00994000 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -1056,7 +1057,8 @@ dsi0_phy: phy@994400 {
 			};
 
 			dsi1: dsi@996000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8996-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x00996000 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

