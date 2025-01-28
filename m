Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC69A207A1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 10:47:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB6810E61D;
	Tue, 28 Jan 2025 09:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wl+1xQ+y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F7E10E61D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 09:47:24 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4363299010dso4623715e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 01:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738057643; x=1738662443; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lTmfrndiqp9foNBlo0TFMcTfyEKWgHjTbx0OZ/UMQ8s=;
 b=wl+1xQ+yzkBZoCtr3+Yy6MYWBnChPZ6WXFNX5lnm/GG+bIb++vw1Y4QHDuqlUHes+h
 P95dXjDVJPe8FGAtaTv3y8TMpoUGlvDrPfG7VVx8tjvvpoy35pZV3Zs37DGi59p86S9i
 oYCCR3EqdIhv6Zl5YBSxvmB9jZP5wOUBAUl9aCF3gx1LPf4ih3G/Gi4f05hrgcj3l29t
 tNLGfPkUcmbBvNfUbKYxfPJSAkqsOOZdK5Ghrsec6/AErP70Ta/0hhu/MlENqVaj1E8p
 VbJ2jh/VTND9dwcJsZXYFfqb1JVIOX8Att0jrheq0sfShGuPZkSICT2rMqtdMwhV+mIC
 1teg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738057643; x=1738662443;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lTmfrndiqp9foNBlo0TFMcTfyEKWgHjTbx0OZ/UMQ8s=;
 b=ijLiPjSzJMu+WXOkmcuJGFWAUg27iPG8IBTt9xQLPL4eJ/gjMaF4uWP5oVjhX+sVTe
 7DBTFWSbsklCAAhtvQ3MKN7J9A2WceclJcjD569VolotOSjDVn7xu4ylp2Zo4pCr5VqU
 dZsLzZgLi4PMn4zvyuOSrvsDsyE6IyCJy5P6qfRmZM9dqHTVuQWp/nuxSTV5uvPDZpi4
 t9sVtANRH+J5KJOaxUAs02jwVdQuLnVM1CCO+hFOwYAYQ0i1QbwSqGPaXUbpKFHmVDRf
 tT6gmL47IMKh5Rw6OtQEIhQvhz9hKeM9AVQcavUpIdWzsnzpfSGp5IcoOpufSF5nPYCC
 mZ2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGfUl3N7s7IW6MGC9LwapVjRfWp+lXAy81t5NGamI+4ESjtTlUSinG0oI2uiVp8Mlq/svaHs1ES7I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1mDlKNybZltEEVkIHfyVSXoRJ30ozLFd1yzmGuZMRx+NTJJlQ
 HU5PgnHfig+Hhqg0Ks9C5QPFOW+hGodnRKh0q6p45r+SSevx3++SgxJhFtQZRyg=
X-Gm-Gg: ASbGncuzMoaBpQprMeokJ4A1VZkhRJUCLW7vTLS2RNJ8DQ+n9CXWbYHpnL4nkyPs95q
 JmvJPcOR84CldCpKVAa1ZA8k0S45nWKxZr3bj4AGmCBRcOzlLGdpLhPbhe2i3Db8cZysV8NgudF
 +8X5gi1p1cYkB87QQGidNw9xTkSfqmuRxSzGOG9A4M57vFgZS24BMX5UKaJPyJkYtAV2w4GCH26
 Mxerpxu0l2RFwuoKIGtikBiPChtwhGeWQdlEH/xgPQRH6gsZhXvCVCvw+ecBFm56BHfNr1bJjJ1
 iPrAHtYhf8fD4kCCUp+gGoZEfStb
X-Google-Smtp-Source: AGHT+IGphrYVnQBNjNT6KJSZMftjAwxom8RcLx/vroNRf4BTwzMuXyMxnbel4sP5xzTO3KWriWLgAg==
X-Received: by 2002:a05:600c:350a:b0:436:17f4:9b1b with SMTP id
 5b1f17b1804b1-43891476efamr162532165e9.6.1738057642769; 
 Tue, 28 Jan 2025 01:47:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.98]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd50233dsm159711095e9.15.2025.01.28.01.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 01:47:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: display: renesas,
 du: narrow interrupts and resets per variants
Date: Tue, 28 Jan 2025 10:47:18 +0100
Message-ID: <20250128094719.63776-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
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

Each variable-length property like interrupts or resets must have fixed
constraints on number of items for given variant in binding.  The
clauses in "if:then:" block should define both limits: upper and lower.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This was sent already in August 2024 (!) and still not picked up. Thus
some other people started doing similar in December.

Can this be finally merged?
https://lore.kernel.org/all/20240818173003.122025-1-krzysztof.kozlowski@linaro.org/

Changes in v2:
1. Add Ack
2. Rebase
---
 .../devicetree/bindings/display/renesas,du.yaml      | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index 3880b4c2ea9a..88ecabc4348d 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -174,6 +174,7 @@ allOf:
             - pattern: '^dclkin\.[01]$'
 
         interrupts:
+          minItems: 2
           maxItems: 2
 
         resets:
@@ -229,6 +230,7 @@ allOf:
             - pattern: '^dclkin\.[01]$'
 
         interrupts:
+          minItems: 2
           maxItems: 2
 
         resets:
@@ -282,6 +284,7 @@ allOf:
             - pattern: '^dclkin\.[01]$'
 
         interrupts:
+          minItems: 2
           maxItems: 2
 
         resets:
@@ -336,6 +339,7 @@ allOf:
             - pattern: '^dclkin\.[01]$'
 
         interrupts:
+          minItems: 2
           maxItems: 2
 
         resets:
@@ -397,6 +401,7 @@ allOf:
             - pattern: '^dclkin\.[012]$'
 
         interrupts:
+          minItems: 3
           maxItems: 3
 
         resets:
@@ -461,9 +466,11 @@ allOf:
             - pattern: '^dclkin\.[0123]$'
 
         interrupts:
+          minItems: 4
           maxItems: 4
 
         resets:
+          minItems: 2
           maxItems: 2
 
         reset-names:
@@ -534,9 +541,11 @@ allOf:
             - pattern: '^dclkin\.[012]$'
 
         interrupts:
+          minItems: 3
           maxItems: 3
 
         resets:
+          minItems: 2
           maxItems: 2
 
         reset-names:
@@ -605,9 +614,11 @@ allOf:
             - pattern: '^dclkin\.[013]$'
 
         interrupts:
+          minItems: 3
           maxItems: 3
 
         resets:
+          minItems: 2
           maxItems: 2
 
         reset-names:
@@ -726,6 +737,7 @@ allOf:
             - pattern: '^dclkin\.[01]$'
 
         interrupts:
+          minItems: 2
           maxItems: 2
 
         resets:
-- 
2.43.0

