Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D9E806DCF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 12:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A34310E42F;
	Wed,  6 Dec 2023 11:23:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D5510E42F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 11:23:56 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6ce6b9f3764so312564b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 03:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701861836; x=1702466636; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mFCukuSdWsuRhvFe3mgqtOXnJmu9VjUJaxtlOP7dBQI=;
 b=hvMXu1x1EgNKFEZeJAzujjVkNKwEBCxnGvDjJqiaZRLdmAbxUIQMhPFLkXfILqM4rQ
 NxgmCSqptPP8JNt50/G/W0nkKZWbIt4xRVPkHRGFW9qp3DzLr4tRhi6/wyYpce/UWxqi
 EuPdnQIFrg1f9AEKidQItaS9NdfxEki/YDNT9VVxq4wHMbJHjuETt6RCY5PKRLnxYt3h
 isw1J4CwyMdcviMAtQBE3E2KdeJ5guLxrRj4BMJdC16QhMjBFgkpxRUvuV6VMnFEG6Rv
 v+Sm1Im8cDlDhzl9bdzmGvTWY5jw5D9ZrtxPuOykSMd/WpkR2UUjd816060JKnSgfziP
 YkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701861836; x=1702466636;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mFCukuSdWsuRhvFe3mgqtOXnJmu9VjUJaxtlOP7dBQI=;
 b=TPSxGKyJM3Crox8f887TnFkK+2iqZX8tbQl4OxtrwNnhTZ//51UQsPijz6NoJUagYM
 g0CRedbLtxhreEYlj1vVtuv+TFq8/htrb20moR75Hl5E5RHKOjfcAuFtuqzn+lsF8/L3
 eOSWYQHXTKK7htQQ7rllqHnuN23aVR0io0bYiawgxSfA+PSLR8P7q+9YEahZP7jsBqPK
 xHGvAhAm1oFD5JqESNd010GpwrxDuzskXpZTpr8Jbt/rFh+An2MriUea4UbxDOf/DprX
 4XA5T+hPvp/wbI+H8tLGhqSo7EX1fnXlGcFiCDy0OGLdzPKgMWVeI69qIpYksC56NJj9
 UILA==
X-Gm-Message-State: AOJu0YxD46JEfO0uODw/1T6oYLzGOWR4y9URg2CModY+xHPoL9cDtRWy
 4yvkZ6ZTaOhXSZrNOS5mfxKMCooEdLA=
X-Google-Smtp-Source: AGHT+IErRb2I0j2INI9Zc3pcAIFqg2Ge+UJaxEcBqAcuwEjcZmUXjdWj53TzibB9k2rKIMD4NHNEOQ==
X-Received: by 2002:a05:6a00:2d11:b0:6ce:68a5:757 with SMTP id
 fa17-20020a056a002d1100b006ce68a50757mr1433588pfb.0.1701861835628; 
 Wed, 06 Dec 2023 03:23:55 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:6764:e124:5ffc:3f5])
 by smtp.gmail.com with ESMTPSA id
 i128-20020a62c186000000b006ce5300ddacsm1876723pfg.5.2023.12.06.03.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 03:23:55 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: marex@denx.de
Subject: [PATCH v2] dt-bindings: lcdif: Properly describe the i.MX23 interrupts
Date: Wed,  6 Dec 2023 08:23:37 -0300
Message-Id: <20231206112337.2234849-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Fabio Estevam <festevam@denx.de>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

i.MX23 has two LCDIF interrupts instead of a single one like other
i.MX devices.

Take this into account for properly describing the i.MX23 LCDIF
interrupts.

This fixes the following dt-schema warning:

imx23-olinuxino.dtb: lcdif@80030000: interrupts: [[46], [45]] is too long
        from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
        
Signed-off-by: Fabio Estevam <festevam@denx.de>
Reviewed-by: Marek Vasut <marex@denx.de>
---
Changes since v1:
- Add missing else to limit the number of irqs for the other variants. (Krzysztof)

 .../bindings/display/fsl,lcdif.yaml           | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index fc11ab5fc465..1c2be8d6f633 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -51,7 +51,10 @@ properties:
     minItems: 1
 
   interrupts:
-    maxItems: 1
+    items:
+      - description: LCDIF DMA interrupt
+      - description: LCDIF Error interrupt
+    minItems: 1
 
   power-domains:
     maxItems: 1
@@ -131,6 +134,21 @@ allOf:
     then:
       required:
         - power-domains
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx23-lcdif
+    then:
+      properties:
+        interrupts:
+          minItems: 2
+          maxItems: 2
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
 
 examples:
   - |
-- 
2.34.1

