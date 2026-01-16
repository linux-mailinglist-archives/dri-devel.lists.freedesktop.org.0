Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE7BD2CF6E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 08:10:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407F210E7FF;
	Fri, 16 Jan 2026 07:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="mXNE8yHP";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="h1s4936+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF2910E7FE
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1768547278; bh=EwLy3thexIFvKpK2xg4+tHj
 kVfjlA8BeeqelEzYnxLY=; b=mXNE8yHP4KFTq+OL7fX6islFuIS9Vn9LiFh8Tqa+cAKRsb3H2d
 yXgmN6Kjb6fFcGlWu121x+8Ig9+xrrIYsRzNKw0ltYYosYoJT7/h6gE6LlVSRU2En6/ut18izPq
 VFm1APEjGBvofbcwCPRUFh/n3Nqm75We57KCTTHfTBkKgHAHEerlzU0ciDxqiZCL/M4xcMbD8fn
 GkxRtlgy1iO7jnbLQs2c7N7uWZ+E59dU6iAwqxonrvejN2DZeYGTFxeAsg34EbBq+CulppTm5lS
 mw37wyUbnPXWECXzKqeQvGqDzNY1amVgU7uCW32BRMGgPkWs408+WOQZg12VOHDR5BQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1768547278; bh=EwLy3thexIFvKpK2xg4+tHj
 kVfjlA8BeeqelEzYnxLY=; b=h1s4936+KEGbNC+J4hr+YXYAnDdPCdxMM3wdc+0nRWc5grszjJ
 BiQ+ftvRTLSalIz8RiK+K1GhtOO8flCtY9BQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Date: Fri, 16 Jan 2026 08:07:33 +0100
Subject: [PATCH v3 1/7] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8994
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260116-pmi8950-wled-v3-1-e6c93de84079@mainlining.org>
References: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
In-Reply-To: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>, 
 Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>, 
 Eugene Lepshy <fekz115@gmail.com>, Gianluca Boiano <morf3089@gmail.com>, 
 Alejandro Tafalla <atafalla@dnyon.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Thompson <daniel.thompson@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768547276; l=1588;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=PidD8m5Mw2TKAXvnhCtNThX7/HJ7hIwRGosYDb9dcWc=;
 b=h4XJe8lzk8hkUVV7y2UtZJJa53nhVHGPNNXRtwTDsk2TBYBiTkX5kYSphfzJirqsp59gRtoxT
 QE5ibAbM2pqCuPT5illFr9zj6rs6tLWfJnPpUsZJOOVdXNK8X+drukw
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document ovp values supported by wled found in PMI8994.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 .../bindings/leds/backlight/qcom-wled.yaml         | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
index a8490781011d..19166186a1ff 100644
--- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
@@ -98,8 +98,8 @@ properties:
     description: |
       Over-voltage protection limit. This property is for WLED4 only.
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [ 18100, 19600, 29600, 31100 ]
-    default: 29600
+    minimum: 17800
+    maximum: 31100
 
   qcom,num-strings:
     description: |
@@ -239,6 +239,24 @@ allOf:
           minimum: 0
           maximum: 4095
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,pmi8994-wled
+
+    then:
+      properties:
+        qcom,ovp-millivolt:
+          enum: [ 17800, 19400, 29500, 31000 ]
+          default: 29500
+
+    else:
+      properties:
+        qcom,ovp-millivolt:
+          enum: [ 18100, 19600, 29600, 31100 ]
+          default: 29600
+
 required:
   - compatible
   - reg

-- 
2.52.0
