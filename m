Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2DB4667E2
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 17:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD7C56FB0F;
	Thu,  2 Dec 2021 16:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7534C6FB0F
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 16:25:19 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id l22so72779115lfg.7
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 08:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vxGUSMvrOv7nlYjHA3TMjrIWjar7r9+1jQfmAuKVGRM=;
 b=W43m5jocQ289+28xlZ6+uA9a7QkX28CBnvzxIO8HGfGCH2lzrvrfK0M42wuQ0y3UxL
 P2tnTL3d/0/zKvCyAxJnKtSwqsl7d4NwRwg9oRo1gDeJsCbtzKjS5QrQI4TrdTQCfNzK
 c77s94pgRlxq27g6Iy11JgH7cn6Haa/QAbBngTF1a/ELy75WWNA5JlpTwwfFaZEzqnV2
 tyjpz+TJSwoyz1REURW2JQZuZy4GQGg2EkUqRhnHS//r1Cifs5nBmgFKvfH6miWtR/xu
 aUnhsVig1xfgANJNXFwrKHwVB0gVBid+3H3xpSDXKygC9sLHGsevH+s8518vsqdFSib3
 LxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vxGUSMvrOv7nlYjHA3TMjrIWjar7r9+1jQfmAuKVGRM=;
 b=6nu0EUpg54DbeNmk6l21nraIvaIvlOAgfDfUcm7Hif5FSYJ3TJgaJBbHiohTHLYmru
 l/tBsFGOFHZkd+R9WD0RTb8okp+rrwvYUaCiIcvQ6NgVuuZFWFkkxXnalWVVZ2QFJ25o
 jGqFqQyDoIRpXWGxUNNlN97B17qa+nu9+HyC7tHQZ1IPbd8kX0ZWSc/g5jkK47bcEif0
 PB956renX6SRAHhMBTT1Ryd8lP1ctGNccGngyOt+z845kou188Vv3qhnQJzQlyyNYDs9
 4N+v70gh+I5UbQrOGy3GFaQNddMc7TILJxJGX7GeZWBIfT1ewKzit0qD27a94V1aPVHX
 PK9g==
X-Gm-Message-State: AOAM533bBnyDhrfQN6bLEaDbs52tCl0bu/V+79gnUCTIXaiyY1WInUjf
 tRjiJ+yZhRiRld7GOmtCWp8=
X-Google-Smtp-Source: ABdhPJwq2SpoAfSQL23cz1xKV9VZxeJ1OEVvlCmGgz7Z+pAzoGdFLVFZhRV/ER/vZsDh1+jYUXg54g==
X-Received: by 2002:ac2:4e07:: with SMTP id e7mr12687162lfr.632.1638462317737; 
 Thu, 02 Dec 2021 08:25:17 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:17 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 02/20] ASoC: dt-bindings: tegra20-i2s: Convert to schema
Date: Thu,  2 Dec 2021 19:23:23 +0300
Message-Id: <20211202162341.1791-3-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211202162341.1791-1-digetx@gmail.com>
References: <20211202162341.1791-1-digetx@gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert NVIDIA Tegra20 I2S binding to schema.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/sound/nvidia,tegra20-i2s.txt     | 30 --------
 .../bindings/sound/nvidia,tegra20-i2s.yaml    | 70 +++++++++++++++++++
 2 files changed, 70 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt
deleted file mode 100644
index dc30c6bfbe95..000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-NVIDIA Tegra 20 I2S controller
-
-Required properties:
-- compatible : "nvidia,tegra20-i2s"
-- reg : Should contain I2S registers location and length
-- interrupts : Should contain I2S interrupt
-- resets : Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names : Must include the following entries:
-  - i2s
-- dmas : Must contain an entry for each entry in clock-names.
-  See ../dma/dma.txt for details.
-- dma-names : Must include the following entries:
-  - rx
-  - tx
-- clocks : Must contain one entry, for the module clock.
-  See ../clocks/clock-bindings.txt for details.
-
-Example:
-
-i2s@70002800 {
-	compatible = "nvidia,tegra20-i2s";
-	reg = <0x70002800 0x200>;
-	interrupts = < 45 >;
-	clocks = <&tegra_car 11>;
-	resets = <&tegra_car 11>;
-	reset-names = "i2s";
-	dmas = <&apbdma 21>, <&apbdma 21>;
-	dma-names = "rx", "tx";
-};
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
new file mode 100644
index 000000000000..ad43b237d9af
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra20-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra20 I2S Controller
+
+description: |
+  The I2S Controller streams synchronous serial audio data between system
+  memory and an external audio device. The controller supports the I2S Left
+  Justified Mode, Right Justified Mode, and DSP mode formats.
+
+maintainers:
+  - Thierry Reding <treding@nvidia.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    const: nvidia,tegra20-i2s
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: i2s
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+
+  dmas:
+    minItems: 2
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - resets
+  - reset-names
+  - interrupts
+  - clocks
+  - dmas
+  - dma-names
+
+additionalProperties: false
+
+examples:
+  - |
+    i2s@70002800 {
+        compatible = "nvidia,tegra20-i2s";
+        reg = <0x70002800 0x200>;
+        interrupts = <45>;
+        clocks = <&tegra_car 11>;
+        resets = <&tegra_car 11>;
+        reset-names = "i2s";
+        dmas = <&apbdma 21>, <&apbdma 21>;
+        dma-names = "rx", "tx";
+    };
+
+...
-- 
2.33.1

