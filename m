Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A139A805E01
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 19:48:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D275910E529;
	Tue,  5 Dec 2023 18:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D5E10E51C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 18:48:03 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-58de9deec94so470694eaf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 10:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701802082; x=1702406882; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3yo/8ZmNje/AkOSBdLfHDekA/ocrjIlQeNPj2jTmzrw=;
 b=JJPrn0gjcRKuw7wHl5RHUkkJhVXHZ1zdj1oJCdLauWIaCs13IsgSaGOR+gHI3/7jar
 5xXEjAWttxqzJqPIBXAed86JCUF2k4IJuYtz8M1UzKD7raj+tpUYW4Dn5KOMok88yjlT
 2yIlxocyNuTQMZNixqyJujSnFV0zWg0DmgHmPlrnLhoUGYLPRYr4PNUU3Z2QztF9NBEV
 686x/i6BezD7vw7IewIbKroV+fbCpatbRzp7mU5LpVPFYqjwhLRhdDqDFl7bUexsbjL4
 baYPyYeh3MFczuxRHyXwCB4erAWHNSSSAdWYYTqysi+liOyLljpnz1Rq16xMSEeQnF+4
 aKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701802082; x=1702406882;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3yo/8ZmNje/AkOSBdLfHDekA/ocrjIlQeNPj2jTmzrw=;
 b=E7uQFUXrCCksnu0XyC81CQQE7xg87bPEM2McanR7Ib6pGazkohPneTGh7vlx2ph2cs
 KIIVZ2kbqKj4Ukbq/yI7sUxKOrZT3nDACB55g7APj1ykgxzC7Nl0dacL4rZ+ffTLYRNl
 6kyGk3iqEFdjjuyqv7ME3qf7We/L6Ka2NAaLm1bF5/aTR8XRjRsjeFVN4Gg4JQD5gFuG
 U1aAI4x1ME5hC3nWvZvej7QlrlyKnDnlqWgb5ilBEDCbamJCW4+TfGXTzOLyq4ywK9O4
 MMHaUzGTLwcMkw3ErTeAyJ1L4L3Zs/yloeWpeHiPQXlLTZGkLbAFRADtEkhiYJORAjYa
 05qA==
X-Gm-Message-State: AOJu0YxWMRr8ZrzpqIQ+YQ9G9a9ltKOySrNM7BaWSyKmo6CnRsrdPRPx
 J/Q5wGdWxGsF05OyXaWOtjk=
X-Google-Smtp-Source: AGHT+IG7LZP+nPfWZFPMEx8CBW4KwsTUvCOwcR2ZXcbweGMxxyKNVfhFNuAah8Zuo3C3qujHiRVlyg==
X-Received: by 2002:a05:6359:2c9a:b0:16f:fa02:fff0 with SMTP id
 qw26-20020a0563592c9a00b0016ffa02fff0mr13075536rwb.3.1701802082520; 
 Tue, 05 Dec 2023 10:48:02 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:52c5:3315:40:a897])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a635008000000b0059d219cb359sm9688946pgb.9.2023.12.05.10.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 10:48:02 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: marex@denx.de
Subject: [PATCH v2] dt-bindings: lcdif: Properly describe the i.MX23 interrupts
Date: Tue,  5 Dec 2023 15:47:48 -0300
Message-Id: <20231205184748.2103321-1-festevam@gmail.com>
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
---
Changes since v1:
- Fix typo in commit log (i.MX23 has two LCDIF interrupts).

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

