Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9914053493B
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 05:16:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E76B10E222;
	Thu, 26 May 2022 03:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBA210E222
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 03:16:47 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id b135so610105pfb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 20:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gJkpAY5J5OYSDURsc529cHvymHUqP4kRqRfmka6ZmsE=;
 b=Jk45dUi05epNEnQ36gijQX1NTzUXD12rkoFLcqm8oqmaTFnvBHCdCZQAy96Z4Npq46
 VMh8/2W+NmJGoOdR93zVjJIt+Gz7u4CIaB1V1vt2/Vh9Q8BrZa1eINivIkxRaiWCxYJO
 pGC3vPyFzs5ynmUKlCRC9AziQLPA/A3T4t1gjD50EIw8jOjMBYlQGrgDkpmhpNkyzlZm
 pOQeHmTtiYZCIWi0N8EQVWLKlut/jMETw/Rf13/zJTpEbZUc6YzhhnJ4wYVrviup8E9G
 Qd6EiTalyqlocZCiiHk6Y23sjKQ8rAW/P+ImhKqmvBrmMhxiAS086hmv0rtsER8+VQnF
 cP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gJkpAY5J5OYSDURsc529cHvymHUqP4kRqRfmka6ZmsE=;
 b=knpeoJ3hnzjriHVXRjjzABogIK6e3NahFFgGNNrqVWh5OWO9J6pTY/9Pi2Lltp2qVJ
 dQbkGPibXu1BdoIpRoUQdHi9ZLblSyfhNOG5EDxQex8dO/5nEH4z9ZuE9bzgP9ALLR/J
 7PJJuvVTNaGEJAo4NNvUR5VU2wgWbXYvOASRolKSxU/rfp3AGwkFLBpAwyV5WIn6EJxC
 cog9nn2HrCwAIDyZGTEA2XNRo7WM2ip3PKEXCRhfL3NfdepO4KZD5cJqlWgqmhA18/TO
 83NXk6pME3jJD2nmaNOGrI1t7AlTM7LU+FCbX7IGaqvlvRq730YKgOTq0E+ePf6KDRjR
 Onxg==
X-Gm-Message-State: AOAM531edOMPEEwR15bx2zFhJRajGP3+CAasvimFV1a6svzpspaxyJx4
 CgmbjppA77yWCS/mkWX8GhE=
X-Google-Smtp-Source: ABdhPJwX32UAU3Bp3W9+y/lNWbYLb1ZL1Eord0ZY0yd4gzpVlC3AhrFJI1Wn7OP4oyRPTLFJD4K8vA==
X-Received: by 2002:a63:28c:0:b0:3c1:6f72:7288 with SMTP id
 134-20020a63028c000000b003c16f727288mr30961365pgc.564.1653535007427; 
 Wed, 25 May 2022 20:16:47 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:569:6b12:f420:101e:bfc0:b57c])
 by smtp.gmail.com with ESMTPSA id
 t25-20020aa79479000000b0050dc7628181sm152964pfq.91.2022.05.25.20.16.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 May 2022 20:16:47 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: [PATCH 1/2] dt-bindings: backlight: rt4831: Add the new property for
 ocp level selection
Date: Thu, 26 May 2022 11:16:34 +0800
Message-Id: <1653534995-30794-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1653534995-30794-1-git-send-email-u0084500@gmail.com>
References: <1653534995-30794-1-git-send-email-u0084500@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 lucas_tsai@richtek.com, deller@gmx.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com, pavel@ucw.cz,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Add the new property for ocp level selection.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 .../bindings/leds/backlight/richtek,rt4831-backlight.yaml         | 8 ++++++++
 include/dt-bindings/leds/rt4831-backlight.h                       | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
index e0ac686..c1c59de 100644
--- a/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
@@ -47,6 +47,14 @@ properties:
     minimum: 0
     maximum: 3
 
+  richtek,bled-ocp-sel:
+    description: |
+      Backlight OCP level selection, currently support 0.9A/1.2A/1.5A/1.8A
+    $ref: /schemas/types.yaml#/definitions/uint8
+    default: 1
+    minimum: 0
+    maximum: 3
+
   richtek,channel-use:
     description: |
       Backlight LED channel to be used.
diff --git a/include/dt-bindings/leds/rt4831-backlight.h b/include/dt-bindings/leds/rt4831-backlight.h
index 125c635..e8b8609 100644
--- a/include/dt-bindings/leds/rt4831-backlight.h
+++ b/include/dt-bindings/leds/rt4831-backlight.h
@@ -14,6 +14,11 @@
 #define RT4831_BLOVPLVL_25V	2
 #define RT4831_BLOVPLVL_29V	3
 
+#define RT4831_BLOCPLVL_0P9A	0
+#define RT4831_BLOCPLVL_1P2A	1
+#define RT4831_BLOCPLVL_1P5A	2
+#define RT4831_BLOCPLVL_1P8A	3
+
 #define RT4831_BLED_CH1EN	(1 << 0)
 #define RT4831_BLED_CH2EN	(1 << 1)
 #define RT4831_BLED_CH3EN	(1 << 2)
-- 
2.7.4

