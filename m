Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AEB56799A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 23:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C37B91A45;
	Tue,  5 Jul 2022 21:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA3891A2F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 21:52:30 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 u12-20020a05600c210c00b003a02b16d2b8so7996241wml.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jul 2022 14:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2GzPXU6fxlhRLcLCzHAtBw9aqp9IODNCeRsuQO5lcpY=;
 b=XT7ASFf1nIxEfdXiclNYpFSfVq9s4C412d1OLgO/lRLR31n5QoYTHi2w0+p6vqybbX
 L8rsroWGHmISyxXwTMLY5Pxl0TOG8uaNtgvh3ABkRgQei276FZRvd10cHmCHvrO97nSs
 X1TOJ070+O3zWigaRb5S9HsAQ7feSkeZGigRifEXpzQYhOCweEjRkKfebf8ovWlSg9Sm
 MATg8gxg3oOtY6sR8l+nawtwKUugNgrjxosw3dX9AbAQmizt8wGPJ0C0+p2XxxuR4VYQ
 cB+b97WOaIvDgK7CYap6O6H46outSUnrjdgeLqMg7CbGejFauZTBHZWOALqxV0SFuBD2
 cSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2GzPXU6fxlhRLcLCzHAtBw9aqp9IODNCeRsuQO5lcpY=;
 b=08vnRj4+nrsjh/6Qn4F67m8Jyok3ez6o7Nr8nxY968Gs3KMtbL/x0Usa0zsv0HePxG
 jsmrf1GnY2bQALCKWixBFU92+DZdimxF7WwtxOA6ptGqfNyWNTsiNdTR37sA4ezXqM3s
 mJ3rJ8FimnmgNlBfW7ykGiId/KkfXDXAFfUjvGvOjEO/OzcKBUSzh0HHcNO9HbIm83fD
 PcZiZuVabDm1u2eyPZ6w5/5o3JcOuVlTFzmeHnc/JVx/ykncPBIs5SM5xIVjlLbFYble
 o0PInB/bVjf5q8aIy2sVodDqsh8RjSnXunBA48k/wpgqdoeQ7Ec+BPMi4NtCcHd//x0s
 croQ==
X-Gm-Message-State: AJIora/24TbmFUoxn4tyKrDLg1u9PEvfjgMzXilq+aR68ScfkdfVwE6u
 BnZn9HtYkWCKc7ttwLvefrA6kg==
X-Google-Smtp-Source: AGRyM1uhOixFRoKPZ9r+xlFuyTA+0x5iwS5mflmn1FfFUubL8NnF+MTFXr4CI29OWbYvLWfq3Ui0Iw==
X-Received: by 2002:a7b:ce0e:0:b0:3a0:4623:86b7 with SMTP id
 m14-20020a7bce0e000000b003a0462386b7mr39641466wmc.62.1657057949473; 
 Tue, 05 Jul 2022 14:52:29 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 g34-20020a05600c4ca200b0039c7dbafa7asm18353920wmp.19.2022.07.05.14.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 14:52:29 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v5 04/13] dt-bindings: memory-controllers: add canaan k210
 sram controller
Date: Tue,  5 Jul 2022 22:52:05 +0100
Message-Id: <20220705215213.1802496-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705215213.1802496-1-mail@conchuod.ie>
References: <20220705215213.1802496-1-mail@conchuod.ie>
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, dmaengine@vger.kernel.org,
 linux-riscv@lists.infradead.org, Dillon Min <dillon.minfei@gmail.com>,
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
index 000000000000..f81fb866e319
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
+description:
+  The Canaan K210 SRAM memory controller is responsible for the system's 8 MiB
+  of SRAM. The controller is initialised by the bootloader, which configures
+  its clocks, before OS bringup.
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
2.37.0

