Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE3FCE9B7B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 13:59:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A2910E0EE;
	Tue, 30 Dec 2025 12:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VL69Cv92";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A858510E0EE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 12:59:25 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-bc09b3d3afeso5591543a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 04:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767099565; x=1767704365; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yp750MWINpgK2NvZnHynlpix3A6wZrIevbzSXr0Mmu0=;
 b=VL69Cv922EOpJfsu3AeiV8w8IAQNxHADAwiIBTh95fOx2jrFLtqPapI7at54EDlNd8
 cOUZl4ljiY8/UhEQitD4Y9E1NJpiw+oyCt7//fvDPBuXYbJEUCAHZ6rairlIcHeKjq09
 oT7wSfTOLodD/aulquzcCukXQeAFdyplVrk8w6hMgy6PpdkmsHqv/mFmr77nz83gBEb7
 A+baKzWrBHyz8P7iwekidaE4yuQzDhZbLASK4ofOjBhilsa3UWkay2Ahi2kIsEz1chbJ
 4j0BPvWqobbPv3xkRQY+iTx+LhoZWbyeQ/dDXvHyiDMlaVjA1acBLbcE3Se0wImUkw4b
 t9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767099565; x=1767704365;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yp750MWINpgK2NvZnHynlpix3A6wZrIevbzSXr0Mmu0=;
 b=E0q1DHNAjZ15de244p0wzkgSklcGYBPQHZ78MVnF1vOHrdUcuNlW9SxWguWSE/r/Cc
 xFVgCTWgx5dDiMEiu89yTdbmlVIetut1UXo11dfkN6l3SzjdKlGuq34qxy0t4U6HliQV
 gSaqfFVqacPTyasmiGc1lkQvVNZriucXhX2BrwgE5xapLPK7thUJ8j+Hdka5qXsR7y2q
 7q9calCQFo+v1+U4XiWKam1uHS3watGetoO0fxNHNRnV6R8Vh8r9B5zEk9RwzJ2iR3aC
 6VSCv9zHcMArAo2Ld3XS3sA1WaVbZTqg2709QOKOluZtFwejqdUR+SH8TtTiY2IOpuoS
 sWww==
X-Gm-Message-State: AOJu0YwGdA/6Zar15iFouCyHnoH0fPxAdujgRIXauUgk4oeowDNWe4/2
 umvIMQvSMzBa3rhVYTZPJMWHpOh9O9RceejUiLbShN4f+XQSnc5XNEJu
X-Gm-Gg: AY/fxX4mLAMF+sq8zCyTTRbMdHV1baILe7d19d0SJ6p76o96p6p5kB7/Sd5j6gZR5Jp
 3Xa7+94ynd9nbNCpXXFdPUnYyobrgA06yXMGfqeUF/QY14FW2S8awWBz80EKqGg0qQchz6nIEdx
 40HPthXJ/SXfxrSyGiFGgpIza/qX/AlWG+CufOtvXTICpU33ikzPJrSKN2LuxUp57Gi381OVN+a
 46DllhsDpJfukviGaMaxTFbGq4utV9xgDnOfMsxl1RriaIk/a1agrc2LtO311lx4h3MdFzOZ2+S
 j8rVbEhNumzmNBJRCkiTiZRZI63U2r/EpzcDqh6V3J8tQTT74FFI1mW2xsO1190/FnJhyKFonLo
 CD41kSbpdtD/1A4ZNz7mJ4b2VE7DC3V8cOkxsjAAQ1xsjVAr3RdzgEDlynl/xi2KfiY/iFGKNhs
 Im9kQrwS3DHFbXDFwVgt5wohfMY4ZpbsFEQvw=
X-Google-Smtp-Source: AGHT+IFVA/XRBrsi2Ymbd2HIl3yOZ4AY8cnV20h/KUg9ayosmMMcaXvzbDNTtg3adl/AvO8djXMVGg==
X-Received: by 2002:a05:7301:1a12:b0:2a4:3593:ddd6 with SMTP id
 5a478bee46e88-2b05ebb6038mr24493296eec.3.1767099564970; 
 Tue, 30 Dec 2025 04:59:24 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:ae10:4ecf:7e5a:aa6f])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b05ffad66fsm75132634eec.4.2025.12.30.04.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 04:59:24 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH 1/2] dt-bindings: display: simple: Add Innolux G150XGE-L05
 panel
Date: Tue, 30 Dec 2025 09:59:12 -0300
Message-Id: <20251230125913.3670617-1-festevam@gmail.com>
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

Add Innolux G150XGE-L05 15.0" TFT 1024x768 LVDS panel compatible string.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index fc244fbb5a54..3b7550f09936 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -182,6 +182,8 @@ properties:
       - innolux,g156hce-l01
         # InnoLux 13.3" FHD (1920x1080) TFT LCD panel
       - innolux,n133hse-ea1
+        # InnoLux 15.0" G150XGE-l05 XGA (1024x768) TFT LCD panel
+      - innolux,g150xge-l05
         # InnoLux 15.6" WXGA TFT LCD panel
       - innolux,n156bge-l21
         # Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
-- 
2.34.1

