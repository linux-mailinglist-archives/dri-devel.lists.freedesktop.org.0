Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DD5805C6C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 18:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8532210E5C7;
	Tue,  5 Dec 2023 17:50:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CE810E5C7
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 17:50:16 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-58962bf3f89so571959a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 09:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701798616; x=1702403416; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oaHh/9z/u07z1omVzaZJZGd/gWpYBcwFLuPZ4nY+ApE=;
 b=cOzymfa9nub6jQtO36DF7WiGqCd8MGeutD8diV38OfZiteJcGU07xXdPVBoBdz9Qcs
 JCROMBoruVclNwM8qWrykkz2fvv78vhebcuFnLX3k5xJ7iq6ku+GHEnXOZ+8kGYRMHiU
 4Pr/2zioPB6qHT+iKbJOcUpOhvegfgkhuE1iz48bwBLCxDjm96YIjO15IY5vmxlXYEST
 m+5N1751inZesMBGvxgkvFhuNjOsgfhs7TqqtwPB08b7GE6myuhaXUbZFbi/QgS98HhZ
 crOt966TXzHtVr0TEmDIvCG1vNXgY1AJg89rTkd5QI2SkDMrcigy0yGtPBdfsliUj9c+
 MUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701798616; x=1702403416;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oaHh/9z/u07z1omVzaZJZGd/gWpYBcwFLuPZ4nY+ApE=;
 b=u4aDRV54YHhl6AvxjU92gjcDxGPOK37COd99fcZ/wCuHXxtJSvgCa5cxasIu3GGbmg
 68//tEIlQi/CQN68aqfseLVGVJkwNeqTUZvaOw/iaGHGjVsBRGTLP2TNYS4tdA386Kw0
 gnRJRLY/kzNp7beXDNFd7B0Twu7JL2Jonjn0SF5fznC8W9WJp4vh4U2PjiW/2WrH5UiR
 tQ49nEWCvvsm4Hx0Wta2XhDqXTPp2XAgtcFsnV0fr7M3ZjUvTtWzENwbCEe7xiWfaTOY
 m1nLo5+C7Z7idvPzOrYNyKLbGcPSIKIs85eNKT2BGGf3vlkUvCf7qq9cAFhLw2KHZRkU
 1Bcg==
X-Gm-Message-State: AOJu0YykMgIGT+8nqy//TXsx11m3j1SPUOSTYt1foLWF10SerinxTz3G
 qYH78xNwGN55HYPCpgCHMAs=
X-Google-Smtp-Source: AGHT+IGLLb8FZ18uWCHWyjAJgJBhSMOURCWI+4+kzyw7QkFOYmoH5dB8KTwBkHgkz2tYLI2S70XP2w==
X-Received: by 2002:a17:90a:4094:b0:286:bf9e:a6 with SMTP id
 l20-20020a17090a409400b00286bf9e00a6mr5164540pjg.4.1701798615751; 
 Tue, 05 Dec 2023 09:50:15 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:52c5:3315:40:a897])
 by smtp.gmail.com with ESMTPSA id
 nu8-20020a17090b1b0800b002839d7d8bf3sm8985219pjb.55.2023.12.05.09.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 09:50:15 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: marex@denx.de
Subject: [PATCH] dt-bindings: lcdif: Properly describe the i.MX23 interrupts
Date: Tue,  5 Dec 2023 14:49:49 -0300
Message-Id: <20231205174949.2091953-1-festevam@gmail.com>
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

i.MX23 has two i.MX23 interrupts instead of a single one like other
i.MX devices.

Take this into account for properly describing the i.MX23 LCDIF
interrupts.

This fixes the following dt-schema warning:

imx23-olinuxino.dtb: lcdif@80030000: interrupts: [[46], [45]] is too long
	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../devicetree/bindings/display/fsl,lcdif.yaml   | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index fc11ab5fc465..c4228b893766 100644
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
@@ -131,6 +134,17 @@ allOf:
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
 
 examples:
   - |
-- 
2.34.1

