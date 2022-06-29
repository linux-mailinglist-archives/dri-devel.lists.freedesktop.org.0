Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AA656096B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 20:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE64E10E3E9;
	Wed, 29 Jun 2022 18:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553BB10E3E9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 18:44:46 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d17so18141591wrc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 11:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XaslqtLsV+OGpzKiKNY3XRrWRC9HWQsSJkmanlRgE+c=;
 b=PZV96m+zSyDuombLQGewWnFBGvnedyQ3+dI1hcr7LVvBrxTm/bGvVqpkPGNxe9GZuS
 fRsI5nulPZJ86uidhXVECCni41C0vA1BzT5G0jxBqiaoo7CX3Kxq3zMyJrX0vHpp6Txf
 p44qFHV0ArI/Y05Xelf6D6yAh06YaA1xxlvz9miA+iu0m+pfBrQ47FFpznq0DZKe/hy4
 SUAN6ilIXPV9TpJlClLX0/YNPHZSgZOrl/1hoPuZDPhRyM7csXJ0DbpLgqJpVUzMy2eM
 +/w65a7y1Ox3yxOnJdn2omseoOfCdKxZv0N5ZS2ufAnjnfGQ7/aqoSXEVEQbgXX6e8nd
 76kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XaslqtLsV+OGpzKiKNY3XRrWRC9HWQsSJkmanlRgE+c=;
 b=DB2vqNbj2K/ae2uZKsyvl1wJKkcQlHfpIBkhqcrtyPMba6apmXWURAKQd1+sBHOzfB
 oGJpDBuUV6ajpHv9kJhn3hfNOoNW2BioxqAbdd3w/+9WQeFVLrvn54ps49Cx84erpknV
 KJX0CcSac36ePd9jjOhgk7fG7lYuHDtaAlrf8XAWOgijEsMfh4UVU6nBUk1AYdOrB1ra
 +ZSZhtxijLJC+JWHHLMM3xcJwpKmqYYmsFaL0pj3MIS5+BMRJE+NgLPGeHgIQKZvAxb7
 1o0EfdLSn6PAfHMv5hkwfaeBg7707kwHlc2jNeZAccBv5qcaJjClRDzUuPdApeZaA7rp
 DZiQ==
X-Gm-Message-State: AJIora9jAnRJt79jf88yCvbyQ4xTS9XY6reSNgeFiNmqzJ+Bd4gDYdbc
 wvM/0iCB6AGX5LYLiXkKlqdD/g==
X-Google-Smtp-Source: AGRyM1tKU6P+9J1S7EvrvcajpfEPLPWHYJ9QIIulL1WwyNt4gXk7nuljdIlSl36redwFztsprn60iw==
X-Received: by 2002:a5d:64cc:0:b0:21b:ba06:4d4d with SMTP id
 f12-20020a5d64cc000000b0021bba064d4dmr4603873wri.157.1656528285879; 
 Wed, 29 Jun 2022 11:44:45 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 u23-20020a7bcb17000000b0039aef592ca0sm3834371wmj.35.2022.06.29.11.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 11:44:45 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3 06/15] dt-bindings: memory-controllers: add canaan k210
 sram controller
Date: Wed, 29 Jun 2022 19:43:35 +0100
Message-Id: <20220629184343.3438856-7-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629184343.3438856-1-mail@conchuod.ie>
References: <20220629184343.3438856-1-mail@conchuod.ie>
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
Cc: linux-riscv@lists.infradead.org, Niklas Cassel <niklas.cassel@wdc.com>,
 alsa-devel@alsa-project.org, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Jose Abreu <joabreu@synopsys.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, dmaengine@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Conor Dooley <conor.dooley@microchip.com>

The k210 U-Boot port has been using the clocks defined in the
devicetree to bring up the board's SRAM, but this violates the
dt-schema. As such, move the clocks to a dedicated node with
the same compatible string & document it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../memory-controllers/canaan,k210-sram.yaml  | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml b/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
new file mode 100644
index 000000000000..82be32757713
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/canaan,k210-sram.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Canaan K210 SRAM memory controller
+
+description: |
+  The Canaan K210 SRAM memory controller is initialised and programmed by
+  firmware, but an OS might want to read its registers for error reporting
+  purposes and to learn about the DRAM topology.
+
+maintainers:
+  - Conor Dooley <conor@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - canaan,k210-sram
+
+  clocks:
+    minItems: 1
+    items:
+      - description: sram0 clock
+      - description: sram1 clock
+      - description: aisram clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: sram0
+      - const: sram1
+      - const: aisram
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/k210-clk.h>
+    memory-controller {
+        compatible = "canaan,k210-sram";
+        clocks = <&sysclk K210_CLK_SRAM0>,
+                 <&sysclk K210_CLK_SRAM1>,
+                 <&sysclk K210_CLK_AI>;
+        clock-names = "sram0", "sram1", "aisram";
+    };
-- 
2.36.1

