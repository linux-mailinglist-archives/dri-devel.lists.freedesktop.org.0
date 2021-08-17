Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 219243EE288
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 03:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4B66E0C2;
	Tue, 17 Aug 2021 01:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4462E6E0A6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 01:30:10 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id t9so38198547lfc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 18:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1rOuTQcx9Elf9jGsA5Ck42tuk06UuZfodHaWyKuopa4=;
 b=nLg7hn8A5q/Vx/CDPzbsu0UZcMhezzX4poGP9+aJl2GMGcJhQYqkUnj5Qjl2cn36JS
 TRG8tU87zTvHq5zgQXHaUfSGmd+O/0lOIjEqYc1BrK9zX8G0pOagT0C0wooOsAF5RN7B
 yK/7WuO8b06VawvO6kBp681V6kBFyVQi0S6F6onYaebnZX8T/ICfdcFvXSYrhsgVKUYL
 K9LhVT6ka2mjmSQGZXodX88ijX4Dp4wQUWAkjBdKY6Y5GWYluTSb3kBlJweMyYfHhACG
 IxdIRBbwpMCTUUHhK75ttkWtdcgq0pw9a09WmdFz57TCTIW/Tn8SPuEy+khxI9rWUJ9M
 eM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1rOuTQcx9Elf9jGsA5Ck42tuk06UuZfodHaWyKuopa4=;
 b=CaThVaTN27HktEOIzY1Q9nC6fBVqh6sluJJQsjvcIwVL+2w5lrmGmM1RXNLXPKB86P
 d6RFOn0CN/130SIEJcccz7HJ8gPMHVP5MfYi2px9M6iCV4CQqARnS7CbkCEwHdx8K8VH
 e/Ws4r+R/hGwgzTFtdxoP+Js0/mzJTfzEONZoEhvp5FL+YOsdMn1jsDXsicdXWwel7ud
 xIhb2xcWwLGU++WeAnH0XT+gGBjCLl3TsVymb77WUSV6Ns2/9PLznoUoQrh3g6EHawwE
 fOz5Lmqa8xY/IKDrZWHxBhmKbP/WJDsPGHfjeDOOWiButAUK4vo2Dvpa6mFsxpzNYiw3
 B/Lw==
X-Gm-Message-State: AOAM533aigakngmnoN/bapiPlDXbC4gpgd1VE6C7WiMpotZC0birh3Y9
 a8zhm2JJA51r0SyZdYhXkPk=
X-Google-Smtp-Source: ABdhPJwYUUWzqvmh2TbyZ8slt93fpku6uQ4CmSmfQ4fl39kgqkYGTl90+c9np45vo/m/xAMOfWGCEg==
X-Received: by 2002:ac2:43c4:: with SMTP id u4mr476965lfl.357.1629163808543;
 Mon, 16 Aug 2021 18:30:08 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:08 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v8 06/34] dt-bindings: clock: tegra-car: Document new
 tegra-clocks sub-node
Date: Tue, 17 Aug 2021 04:27:26 +0300
Message-Id: <20210817012754.8710-7-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
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

Document tegra-clocks sub-node which describes Tegra SoC clocks that
require a higher voltage of the core power domain in order to operate
properly on a higher clock rates.  Each node contains a phandle to OPP
table and power domain.

The root PLLs and system clocks don't have any specific device dedicated
to them, clock controller is in charge of managing power for them.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/clock/nvidia,tegra20-car.yaml    | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
index 459d2a525393..7f5cd27e4ce0 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
@@ -42,6 +42,48 @@ properties:
   "#reset-cells":
     const: 1
 
+  tegra-clocks:
+    description: child nodes are the output clocks from the CAR
+    type: object
+
+    patternProperties:
+      "^[a-z]+[0-9]+$":
+        type: object
+        properties:
+          compatible:
+            allOf:
+              - items:
+                  - enum:
+                      - nvidia,tegra20-sclk
+                      - nvidia,tegra30-sclk
+                      - nvidia,tegra30-pllc
+                      - nvidia,tegra30-plle
+                      - nvidia,tegra30-pllm
+              - const: nvidia,tegra-clock
+
+          operating-points-v2:
+            $ref: /schemas/types.yaml#/definitions/phandle
+            description:
+              Phandle to OPP table that contains frequencies, voltages and
+              opp-supported-hw property, which is a bitfield indicating
+              SoC process or speedo ID mask.
+
+          clocks:
+            items:
+              - description: node's clock
+
+          power-domains:
+            maxItems: 1
+            description: phandle to the core SoC power domain
+
+        required:
+          - compatible
+          - operating-points-v2
+          - clocks
+          - power-domains
+
+        additionalProperties: false
+
 required:
   - compatible
   - reg
@@ -59,6 +101,15 @@ examples:
         reg = <0x60006000 0x1000>;
         #clock-cells = <1>;
         #reset-cells = <1>;
+
+        tegra-clocks {
+            sclk {
+                compatible = "nvidia,tegra20-sclk", "nvidia,tegra-clock";
+                operating-points-v2 = <&opp_table>;
+                clocks = <&tegra_car TEGRA20_CLK_SCLK>;
+                power-domains = <&domain>;
+            };
+        };
     };
 
     usb-controller@c5004000 {
-- 
2.32.0

