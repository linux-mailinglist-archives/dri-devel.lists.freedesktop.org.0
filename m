Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 309BE66C386
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 16:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF8510E456;
	Mon, 16 Jan 2023 15:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750E510E2AE
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 15:21:35 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r2so27802078wrv.7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 07:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Svkhj0q099C0FoiRDtRciP7InWwLuxVC/46qIXiovr8=;
 b=XiGm3zMYMyDlv0c1X9o6TrBRuEi/kQNHOp2u5zNrD/sHrcPgWC/YQ/eJBFnht6Mb0G
 7JyVb+VWubkM5kfO/7JWgXzV2g2htARtzz231Cmbk4MTMuaJiVD5thwlWO/UIfvu3ndH
 uuYJrVBv4HFOTASO57osvW7iv9jTr4wMmlUqwG+mHAPAEeWDK/dSC2mMwXfQ/GexI2p0
 Kb9K1wtezdR3/8pNSs+1gk8qczjQMUIOUVUn6LGSzrEb1T+G2+ojZLQUUCE7i/g7WRFp
 rkiq9hVAv22X1l3gQ785eU+a2D/UNP/0WsnYcbDpN9nCB5Pv8RF4Knl00AV3QT1y4v8U
 GFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Svkhj0q099C0FoiRDtRciP7InWwLuxVC/46qIXiovr8=;
 b=nwr8fMGLxv5gF/2Gfc81hqnVrByoPNb8ytJ/TMqhuV7h6J4CQfIregCGh1HbQ0aemn
 pVzIUdvAyhtswhuZSxfAXtn4o7w/BBx89hgkpvxPs8aW/Fwu9ofqtqrEpeXtOf1nAm0N
 yKeBQmQkKVlb19Nc7/iYm9Z//zyVktYif57eU3aQsk0sINNudFQR9nB+Ry+OWNxqZGMD
 jXPvOvIs/eVrIStctU2ko/SGBqJrh0XIICAjHECln90UDwsOYAEGJbskk43xKzBiQddE
 GXZr4FP9fWgrKyZRgFqk1BeSkei5B7Oso8PpkZZiCOSq3/KeH2njta/Yh4R6Ak588ylh
 C5kQ==
X-Gm-Message-State: AFqh2ko6IwuW+15iWLHQVlQis5Kui3sBoRxrQDQ5ou39ztUjYcAu14P/
 9lcaIvBecnrWMPGr2W8NWHYD7A==
X-Google-Smtp-Source: AMrXdXvYYOSm7wWeXzSebG8PvNN7IVXYycMtduzO2ztLQ2GdkIaw7bdJ3YsodsbHgkLl8/KqxPfYug==
X-Received: by 2002:a05:6000:884:b0:2a3:ac90:dda3 with SMTP id
 ca4-20020a056000088400b002a3ac90dda3mr34494653wrb.35.1673882495009; 
 Mon, 16 Jan 2023 07:21:35 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 u18-20020adff892000000b002bded7da2b8sm6874686wrp.102.2023.01.16.07.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 07:21:34 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v7 3/4] dt-bindings: msm: dsi-controller-main: Add vdd*
 descriptions back in
Date: Mon, 16 Jan 2023 15:21:27 +0000
Message-Id: <20230116152128.909646-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230116152128.909646-1-bryan.odonoghue@linaro.org>
References: <20230116152128.909646-1-bryan.odonoghue@linaro.org>
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
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 47faf08a37443..7b849c8f119a7 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -147,6 +147,18 @@ properties:
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

