Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE4941222C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 20:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BBC6E5CC;
	Mon, 20 Sep 2021 18:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13436E5CA
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 18:12:06 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id e15so32422952lfr.10
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 11:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XIkaLltNAZEHFO/c9xmZHlt7cmXZw7U8aSqzSL63yiM=;
 b=QR7crULn70ioVU6cJO0TUJsZOug/kx8+q0kdL8r3yyOOhbJN1xwnsdqK3YFwYnPO1D
 YPRF2iN6UbB7tDMpSwsmRjNwuyn/xchFCV6zGvl+2ldyfEWNopx/xNPrLySVMeAuU1Md
 6y5mk7LvKPQ3mE69ZMmjY1QMoMADHlYmx2FPB0mSw3t9bUBYvBy+B/8zIAwOBCecVKn/
 dbTVsIP2LIV22P4iv5OwK15ctcxda++XsuBLn7j53nYXsh5jp8rcWmbmXY3wnBZNtJuU
 wPTLW4O+tCatbuutLuvqrGe5pN4z16nHuxgLrLutnhJQRbzpEDMbOuNz1sArrkzi2/Rz
 6KZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XIkaLltNAZEHFO/c9xmZHlt7cmXZw7U8aSqzSL63yiM=;
 b=u6XTAnZIizz6DpUulAq128z/PCTp8mR5LYiHrn383LEiRV8Xkwsb8dmRK8oioX3o5M
 2m4c1eftKUWGakDX+asARZk+zxmD4lC/zxXuYDQ5KCnF/tA5tbPyj6OgX0aVe11C5MWK
 p2djr18PwkxlR3OEGOg2RizVZy7BnaqBS6Ynp8rBu2tP8fy4lup1iUxR7qkFUB2fkzl5
 o3C0QQeU/0XUAJL0pFrX9fswWeHMcRLZcc5iH8R1D0YiGWPZEqj7sGvpozAVkmQK5H8L
 qYMsJGsAbpDc9m3znJFbP6OWQJguM8K7fymRQV1OvHitxCeHIZ50ORW7Ps+JFQHLoYIf
 qUdg==
X-Gm-Message-State: AOAM533N+od10YHV7jpiFRQFCVxKsuC8/0maDDEsF2kfG5S3ha/k1+jg
 NyPrVtf/or/JQm7kCnJ2zLo=
X-Google-Smtp-Source: ABdhPJzdPPIUbg2iHniLs9xciDT3bW0EtPPoQm7NGnWQa4QJPeZfcF+zbA9DAs7CR26Xo7o9MypucA==
X-Received: by 2002:a2e:300c:: with SMTP id w12mr5558269ljw.302.1632161524353; 
 Mon, 20 Sep 2021 11:12:04 -0700 (PDT)
Received: from localhost.localdomain (46-138-151-206.dynamic.spd-mgts.ru.
 [46.138.151.206])
 by smtp.gmail.com with ESMTPSA id u3sm1775677lju.107.2021.09.20.11.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 11:12:04 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Heidelberg <david@ixit.cz>
Subject: [PATCH v12 05/35] dt-bindings: clock: tegra-car: Document new clock
 sub-nodes
Date: Mon, 20 Sep 2021 21:11:15 +0300
Message-Id: <20210920181145.19543-6-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210920181145.19543-1-digetx@gmail.com>
References: <20210920181145.19543-1-digetx@gmail.com>
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

Document sub-nodes which describe Tegra SoC clocks that require a higher
voltage of the core power domain in order to operate properly on a higher
clock rates.  Each node contains a phandle to OPP table and power domain.

The root PLLs and system clocks don't have any specific device dedicated
to them, clock controller is in charge of managing power for them.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/clock/nvidia,tegra20-car.yaml    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
index 459d2a525393..f832abb7f11a 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
@@ -42,6 +42,36 @@ properties:
   "#reset-cells":
     const: 1
 
+patternProperties:
+  "^(sclk)|(pll-[cem])$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - nvidia,tegra20-sclk
+          - nvidia,tegra30-sclk
+          - nvidia,tegra30-pllc
+          - nvidia,tegra30-plle
+          - nvidia,tegra30-pllm
+
+      operating-points-v2: true
+
+      clocks:
+        items:
+          - description: node's clock
+
+      power-domains:
+        maxItems: 1
+        description: phandle to the core SoC power domain
+
+    required:
+      - compatible
+      - operating-points-v2
+      - clocks
+      - power-domains
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
@@ -59,6 +89,13 @@ examples:
         reg = <0x60006000 0x1000>;
         #clock-cells = <1>;
         #reset-cells = <1>;
+
+        sclk {
+            compatible = "nvidia,tegra20-sclk";
+            operating-points-v2 = <&opp_table>;
+            clocks = <&tegra_car TEGRA20_CLK_SCLK>;
+            power-domains = <&domain>;
+        };
     };
 
     usb-controller@c5004000 {
-- 
2.32.0

