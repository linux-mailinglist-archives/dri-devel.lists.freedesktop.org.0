Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B1E128E22
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2019 14:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65EBC6E526;
	Sun, 22 Dec 2019 13:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53EE26E526
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2019 13:29:31 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id s7so6274152pjc.0
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2019 05:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yZ8n1dFGNqx9MjMWepdptN60E7TYxz6HFWUIoiztPpA=;
 b=CrIi6L/++ZVUaxwSl7hMrcWzqn+AgARP/aDXgQhVDwayW9WwQjGIHVxOKVjmIs/LRU
 xRuzF+iEeSKXzPJ+uOS+jjwNozOdDnDRYA7/uQFxKE42sPXGKDftuDxi7JKTOTmROyrf
 laM6qMlWuFedzbEVUgqszL/8rFagkferTXcG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yZ8n1dFGNqx9MjMWepdptN60E7TYxz6HFWUIoiztPpA=;
 b=dDW611amDJWYzuA8yeq/x5QVlyqWXZ6rAzqgA6tYtZzGiMLgiQvO10KL1YRC2+UOZL
 dbNi58s8w7Htd9KhnPvJnAJ3iRyN56wbrbfUxeVUijF1x/LPFxswxAHCokAloEMVVp4n
 MxYCuJJ9Nd8DfxgQ0cQnugcRH+qBzgQ5HHF6peaumwD5JH+uNcBt4+k8D+zM5JsaUHh+
 vZc2e7B7lB7lvRA8z2VnxHOUtZLcmYAkM6DD2P44xz0WGOKjcfrQCUCKGsLscAVjz6Np
 Yfx8mG8eMx2MLXZeUHRLIyo38BcqF1a4VmvJc9sYZSk2gQ8hJ3m2D2L/Kb564QClUtC6
 ZMKw==
X-Gm-Message-State: APjAAAUVLkj5Vb6s5Lu9brFRi/FqKt061cZimVGLKKu8UwLRXdzobojj
 HWuITgbUpq/M4+aPKWTeBXB6tA==
X-Google-Smtp-Source: APXvYqx8VhsvVjyJ4/Sp6CH68k0bIUCH7wuk1lY1KWY5L9o3lzkZKagxgPGCiUmA9dsys23cSvHb8g==
X-Received: by 2002:a17:90a:9c1:: with SMTP id
 59mr28516972pjo.65.1577021370933; 
 Sun, 22 Dec 2019 05:29:30 -0800 (PST)
Received: from localhost.localdomain ([49.206.202.16])
 by smtp.gmail.com with ESMTPSA id o2sm12073058pjo.26.2019.12.22.05.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2019 05:29:30 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v14 1/7] dt-bindings: sun6i-dsi: Document A64 MIPI-DSI
 controller
Date: Sun, 22 Dec 2019 18:52:23 +0530
Message-Id: <20191222132229.30276-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191222132229.30276-1-jagan@amarulasolutions.com>
References: <20191222132229.30276-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MIPI DSI controller in Allwinner A64 is similar to A33.

But unlike A33, A64 doesn't have DSI_SCLK gating so it is valid
to have separate compatible for A64 on the same driver.

DSI_SCLK uses mod clock-names on dt-bindings, so the same
is not required for A64.

On that note
- A64 require minimum of 1 clock like the bus clock
- A33 require minimum of 2 clocks like both bus, mod clocks

So, update dt-bindings so-that it can document both A33,
A64 bindings requirements.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v14:
- none

 .../display/allwinner,sun6i-a31-mipi-dsi.yaml | 33 +++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
index dafc0980c4fa..d41ecb5e7f7c 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
@@ -15,7 +15,9 @@ properties:
   "#size-cells": true
 
   compatible:
-    const: allwinner,sun6i-a31-mipi-dsi
+    enum:
+      - allwinner,sun6i-a31-mipi-dsi
+      - allwinner,sun50i-a64-mipi-dsi
 
   reg:
     maxItems: 1
@@ -24,6 +26,8 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 1
+    maxItems: 2
     items:
       - description: Bus Clock
       - description: Module Clock
@@ -63,13 +67,38 @@ required:
   - reg
   - interrupts
   - clocks
-  - clock-names
   - phys
   - phy-names
   - resets
   - vcc-dsi-supply
   - port
 
+allOf:
+  - if:
+      properties:
+         compatible:
+           contains:
+             const: allwinner,sun6i-a31-mipi-dsi
+
+    then:
+        properties:
+          clocks:
+            minItems: 2
+
+        required:
+          - clock-names
+
+  - if:
+      properties:
+         compatible:
+           contains:
+             const: allwinner,sun50i-a64-mipi-dsi
+
+    then:
+        properties:
+          clocks:
+            minItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.18.0.321.gffc6fa0e3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
