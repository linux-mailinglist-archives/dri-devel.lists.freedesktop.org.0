Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AA2CFDFC7
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 14:38:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6382610E5D7;
	Wed,  7 Jan 2026 13:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="ltDKaNuY";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="wfJCZuig";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 395 seconds by postgrey-1.36 at gabe;
 Wed, 07 Jan 2026 13:38:03 UTC
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948EB10E5CC
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 13:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1767792673; bh=uqqoupHuz5q+FhYfRmGG1xu
 6sV1Pynys3Jf3ygjytGc=; b=ltDKaNuYevLunHgGBnQsQtp3fePjrtUlzk74lNOn/LxUhWob2O
 fZ/xqM+/xRG41nvDbfKQ+Gl4Z66H/Gy18X3MApEHHfmBSZ7AM7k8CsULCb590y0kdVJFxtQ17hZ
 MkIsaBuodJ1/yEoR4ub3MdAqUp1DwugSm8PyoAdlJze62L8XHG1X3sJU72V1xhiak8atlv4j5MC
 EmTgBCF2c4xrsDMCr6lCAe0rTqbMpsql16f9Ly1rY5qvvHf/AKflSt8fkyuE0/nPD5kols58YWr
 hs8QUzLTrgpvx1iPSHboayYiYgSfAbL+RuDOqxpCHQqblAD6wBa+O2I1mKxs5U+Ut7g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1767792673; bh=uqqoupHuz5q+FhYfRmGG1xu
 6sV1Pynys3Jf3ygjytGc=; b=wfJCZuigWTplWp/itIvuYfdAaOBv+CFYgvwK2sV80AhJRnuM/Y
 MQyTs2uMQyPoRwCD/SQC9c59gjC0E9b+ucBw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Date: Wed, 07 Jan 2026 14:31:05 +0100
Subject: [PATCH 1/5] dt-bindings: backlight: qcom-wled: Document ovp values
 for PMI8950
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260107-pmi8950-wled-v1-1-5e52f5caa39c@mainlining.org>
References: <20260107-pmi8950-wled-v1-0-5e52f5caa39c@mainlining.org>
In-Reply-To: <20260107-pmi8950-wled-v1-0-5e52f5caa39c@mainlining.org>
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
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767792671; l=1412;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=j0wARNgyBwNrwja4s6edywoSF9O2PWD3jbvuDFwhujk=;
 b=hD0UQniE76+D+waZhCOZPHGQ+ZR8xVVp0HDOnsdn6pEUyqQmFoYqzSp+VFB0tP/h+akiycXVp
 7L6BIVDKXSoCP1Vh2nAzr1rKQ6gKjRrtpH3nsrLzdLHuOXr0kdIRL0p
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

Document ovp values supported by wled found in PMI8950.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 .../bindings/leds/backlight/qcom-wled.yaml           | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
index a8490781011d..306fb6642617 100644
--- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
@@ -98,8 +98,6 @@ properties:
     description: |
       Over-voltage protection limit. This property is for WLED4 only.
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [ 18100, 19600, 29600, 31100 ]
-    default: 29600
 
   qcom,num-strings:
     description: |
@@ -239,6 +237,24 @@ allOf:
           minimum: 0
           maximum: 4095
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,pmi8950-wled
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
