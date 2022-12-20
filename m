Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 342296520D7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 13:39:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27E010E3DE;
	Tue, 20 Dec 2022 12:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F4E10E379
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 12:36:46 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id z10so1024222wrh.10
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 04:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EavGT4Puc+h0aZwFuDS/6S+WtpAyzJabS4DGaf73BZA=;
 b=vgdU3XWqu/RW55vCO1V8u3uh4aqfe3fEWyt0nWEWzNKlcuRmo3+H1wIoA0a/5atI0X
 Ejs6K/19fjsIzBWlQe8/MxNQTEBfydeKnapHyWTB6MXU4Omt4Zz60GMGt7ppDSR1rovj
 ntTMkDsJA6wiZnSqMJTSgF1vtrHD7zHtJFic5vw4FRkjY9VdCg9KvBYZBAVOV2+eQVT7
 RdhDsHwZitdjwPySCQ8qAct7j8hUhzBZVvNbVTQlRP+oB0HCMvDtUv6NWtcGyfUmeaym
 Ch7od+XnAy5J4nM83XUuRIhSjXj6wPXtWRE+poaHo9x3/SXO9aPod2AVuT6d7XekaARL
 1srA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EavGT4Puc+h0aZwFuDS/6S+WtpAyzJabS4DGaf73BZA=;
 b=LwAVkfX5qLAvZDHWfsyWsmCpgPj4Pn5vkavjjLLg82PZHktkKkriH59QJfy9dYERcc
 MM56VWBmG5X5B5N1ILhAAV66yone8JNCzCBNuNHhB7ZRTysvLoX5Pwc55k2/ss3MEW6D
 tMhFwSEtN0MPZTjnx3HshAkAipIQ5jo7ZBXqWbOvWtssPFDUTMfgW8NMRFmaFUelGa93
 B8Pc/O54XCepkMAJSR2NDEcN6HYRCoZJumhZbZO5M5Fh/Rpg8aiLU33e0hEVf9eS07xT
 uWTDmZytJ5xn380b1Cjzr+43wI/YFe53c4xXTckmJXtKHVcSdbO2LDkBPFf2a5PE+UR3
 UopQ==
X-Gm-Message-State: AFqh2kpA4iWTwsI0TyxPmHhjuH0l9u9Jqv4oEIiUtRG5EG6b02X+f2PM
 Hzwv8BRKDT6KFY7WQYeS1d6xYg==
X-Google-Smtp-Source: AMrXdXsDDzoMbqCmHInHOLoltwk/aIaW47vjVs1GGTqe7ReSVl+1Q8AG6gLhjJymA7qTamaL/6j8gg==
X-Received: by 2002:adf:cc83:0:b0:242:8d5:c6ee with SMTP id
 p3-20020adfcc83000000b0024208d5c6eemr1458540wrj.15.1671539806390; 
 Tue, 20 Dec 2022 04:36:46 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:36:46 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v5 08/21] dt-bindings: msm: dsi-controller-main: Add vdd*
 descriptions back in
Date: Tue, 20 Dec 2022 12:36:21 +0000
Message-Id: <20221220123634.382970-9-bryan.odonoghue@linaro.org>
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

When converting from .txt to .yaml we didn't include descriptions for the
existing regulator supplies.

- vdd
- vdda
- vddio

Add those descriptions into the yaml now as they were prior to the
conversion. In the .txt description we marked these regulators as required,
however, that requirement appears to have been in error.

Taking the example of sc7180-trogdor-wormdingler.dtsi. The avdd and avee
come from GPIO controlled external regulators, not the SoC and in this case
there's no need for vddio to power an I/O bus. Similarly the regulators for
the LCD are controlled by the panel driver not by the dsi-ctrl driver.

It would be possible to connect a different type of panel to the DSI bus
here in which case we may or may not want to make use of vdd, vdda or
vddio.

This is also the case for older chipsets like apq8064, msm8916 etc the vdd*
regulators in the dsi-ctrl block are helpers not dependencies.

Add the description of vdd, vdda and vddio back in for the existing
upstream dts where vdd, vdda or vddio are already declared but, don't
declare those regulators required - they are not SoC requirements.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 4116b3010219a..785cc51838f07 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -143,6 +143,18 @@ properties:
       - port@0
       - port@1
 
+  vdd-supply:
+    description:
+      VDD regulator
+
+  vddio-supply:
+    description:
+      VDD-IO regulator
+
+  vdda-supply:
+    description:
+      VDDA regulator
+
 required:
   - compatible
   - reg
-- 
2.38.1

