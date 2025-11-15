Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C06E1C5FF09
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 03:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B60B10E28B;
	Sat, 15 Nov 2025 02:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MwKoUC4j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4CC10E28B
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 02:58:33 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-298456bb53aso28706005ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 18:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763175513; x=1763780313; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HaKlOOe8PG+1WJEBDWO8CZyWUDBqxc5etFMnzffAPZo=;
 b=MwKoUC4jLDOCPLl3ezgGdsWKWObWVCNLZrBt92Qu1ywagswiR3yVojGAk1GvR80+yM
 KpL7XBm8Whw+0xtrRwSofEPdA2KLIrcfr40loI4VTn9JF1aMREHm0KSTbNz93IhYtKpK
 5Bd3vryl0fdIe04kF3VLvpTNRST2ImM7uAC5PuY9ICQpTPE9THdjud4DSy2m0WngcVsb
 Al2SCofkeTC5pApJHHdEtsNw+0wkLARI2kbDRprYTze/LaLuhzBsZ0JbjKuzAvt7+1MI
 OtUd/UiWVrKSX7ZnfUGKC9MeZLnNTbmvpN+jx6ZuhnXPCc0tk00usZpMzSUdMzhfSFqG
 Puqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763175513; x=1763780313;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HaKlOOe8PG+1WJEBDWO8CZyWUDBqxc5etFMnzffAPZo=;
 b=bDQXOHxekUlzMO1IJU5238+M4jv7zWUR1rN7dQXDHSOUZeah3L/M3oHA28WQO7TKXv
 0ShHgDFHogynmzMpTLbFUT/wi35PuyxbBO33TKBjEIio5xMskgxF1P7wAlteRSo1H3OU
 2e6srtq5c96kVibEfxySQkgE6jMmd4ddO3pN8MDcK8LtZ21P2NcR2g+TZ/fDj+R/z9GT
 BT2Wt6RAAYVFdYanFJB2SC/NjwufwelnvDdpUW48dE93t+qAr4XXtgSKVWaXQt4OQmTD
 /HNzZkMPOHe9C2/m4MKjwmtuUz1s+fBl+qqsZZdMpHjTvUsGSQO4chJTi391JL5LP0m+
 Hjvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA0hmAORkx9D+nMBZN1oL13FavA+rD6auDBsPdsLqr3FB1ripkcLKL5fFlWrodI2ZfSkrZtT1A7r0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVzL/8UvIHg415zisZb0Rr6djxGeft/OBQvBCcD5oxL1v8XDC3
 ifgOFSfLWTV9ef3JsHihkAReQJPoIW8mDgFKFTRpVk4fEImja3laAZ9f
X-Gm-Gg: ASbGncvZkIllGKR4Bh2RrGmSZBv2CbmrdJlEFOlup0XSAEiuXIvDERfzOqaJbVm98OB
 Wt3lwpWArhAeCZpcnJI1e5OyaFdmM4gz2JKpzmpJnTFHdj2MAdpXyu7Cr9rh8XuiH6Io/qQiae4
 MXONMJ1HZ2RN8PHHT5COLHFfpCeXR0o5wTDZWHSHevG5Ax1HQrlBMmrfhLo/nZed43Z+kb9kdur
 d7y4EOjVWIngmErdze1AgJPtKx6HCIOaYui/RmgdTFt7ieUp+AJHpYsr5XpBH67mGidfAZW2tg7
 ZBMCmQdL5TnKniBDLjIFk1kM3w7GG4awqHI/LJGke5FpI0rnQhCN1cejCP82i2xPMlgccdSQK7x
 Egv39Uig1B1aFb4QQp/TtSyUDZE5agEED3QYqIIzIAq7oqTR4g4OpAr5SKy6EivigVnoGWyIK4q
 iXet7mjXLvNcXemjNKlK8vO2TAckFC3WffmKs=
X-Google-Smtp-Source: AGHT+IHKlxZsii9JW5aWv73UUgouY+qMMyR2lx+Nbu0qmZxDu/y7ZT2bZ44uInHdZ8oV9LE49XHmgQ==
X-Received: by 2002:a05:7022:6885:b0:119:e569:f609 with SMTP id
 a92af1059eb24-11b40f9b6a9mr2151042c88.2.1763175513243; 
 Fri, 14 Nov 2025 18:58:33 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:735a:fcf2:fc15:89cd])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11b86afe12esm4215227c88.6.2025.11.14.18.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 18:58:32 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Raystar Optronics, Inc
Date: Fri, 14 Nov 2025 23:58:25 -0300
Message-Id: <20251115025827.3113790-1-festevam@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@nabladev.com>

Raystar Optronics is an LCD manufacturer based in Taiwan:
https://www.raystar-optronics.com/

Add a vendor prefix for it.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 42d2bc0ce027..781bf2be88d6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1335,6 +1335,8 @@ patternProperties:
     description: Raumfeld GmbH
   "^raydium,.*":
     description: Raydium Semiconductor Corp.
+  "^raystar,.*":
+    description: Raystar Optronics, Inc.
   "^rda,.*":
     description: Unisoc Communications, Inc.
   "^realtek,.*":
-- 
2.34.1

