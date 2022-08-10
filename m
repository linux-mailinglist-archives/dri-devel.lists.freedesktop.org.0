Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7725158F001
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 18:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D712AC2D;
	Wed, 10 Aug 2022 16:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762951131CC
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 16:03:47 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id p9so7282946ilq.13
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 09:03:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=IrtUFJXfmfdQKeaT5ZVd35+tzRi7zWIlb+Wsybvtzfw=;
 b=1a++R6NSM4i2Z0UK5Kpi4yi5z8EkQIFtuuGfIlepRecPKYgivmT5Kg2dOOmddtXsEr
 dXbj8MpsPfmJtJx/l8fAoocQyNwbo2G1BfpJ/TcWJfYcqVUkWNkXihtIBqKlyk7fk1JM
 p08NyHlK7p2+KfNy0dD94iM8cvVYLdbRYfP8zZjYuBSOvhQWohgSi0voY08NBmJraEMF
 siz98xeT/HMIFdLs7jhoRwMOMrbjmeINF+oySD177DArfnokrUFKjNUUWacAeLtcYCZ5
 N6LRjnXTKpSoW/IOo1umkQ0drcAAbnh4cICPPDKYIKTxds3bAyniiRDB9/qVPq6+qmr0
 kX8w==
X-Gm-Message-State: ACgBeo0mlS+G6I8YFinikOAaEn9bidS9hS4NplHjMLukQM/Gy9FVrBcO
 Fm25TQz9UMu3BrZsFfwkRw==
X-Google-Smtp-Source: AA6agR5L6UDKesXHoDGK9TS6LftDSNWSGOXJ/sv+fkC0JxoXQwGpeO5paASudn/YE/O29MWZ9eM0Eg==
X-Received: by 2002:a05:6e02:198b:b0:2e0:d13c:b508 with SMTP id
 g11-20020a056e02198b00b002e0d13cb508mr8053060ilf.315.1660147426681; 
 Wed, 10 Aug 2022 09:03:46 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
 by smtp.googlemail.com with ESMTPSA id
 a27-20020a02735b000000b00341a215d3cesm7617629jae.63.2022.08.10.09.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 09:03:46 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 2/2] dt-bindings: arm,
 versatile-sysreg: Convert to DT schema format
Date: Wed, 10 Aug 2022 10:03:41 -0600
Message-Id: <20220810160341.51995-3-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220810160341.51995-1-robh@kernel.org>
References: <20220810160341.51995-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the arm,versatile-sysreg binding to DT schema format.

The original binding was missing 'simple-mfd' and a 'panel' sub node which
the only user (versatile-ab.dts) of this binding has.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/arm/arm,versatile-sysreg.yaml    | 35 +++++++++++++++++++
 .../bindings/arm/versatile-sysreg.txt         | 10 ------
 2 files changed, 35 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,versatile-sysreg.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/versatile-sysreg.txt

diff --git a/Documentation/devicetree/bindings/arm/arm,versatile-sysreg.yaml b/Documentation/devicetree/bindings/arm/arm,versatile-sysreg.yaml
new file mode 100644
index 000000000000..491eef1e1b10
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,versatile-sysreg.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,versatile-sysreg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Versatile system registers
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description:
+  This is a system control registers block, providing multiple low level
+  platform functions like board detection and identification, software
+  interrupt generation, MMC and NOR Flash control, etc.
+
+properties:
+  compatible:
+    items:
+      - const: arm,versatile-sysreg
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  panel:
+    type: object
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+...
diff --git a/Documentation/devicetree/bindings/arm/versatile-sysreg.txt b/Documentation/devicetree/bindings/arm/versatile-sysreg.txt
deleted file mode 100644
index a4f15262d717..000000000000
--- a/Documentation/devicetree/bindings/arm/versatile-sysreg.txt
+++ /dev/null
@@ -1,10 +0,0 @@
-ARM Versatile system registers
---------------------------------------
-
-This is a system control registers block, providing multiple low level
-platform functions like board detection and identification, software
-interrupt generation, MMC and NOR Flash control etc.
-
-Required node properties:
-- compatible value : = "arm,versatile-sysreg", "syscon"
-- reg : physical base address and the size of the registers window
-- 
2.34.1

