Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351C7418BD4
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 00:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A088B6E5BE;
	Sun, 26 Sep 2021 22:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E836E5AB
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 22:42:33 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id g41so68398644lfv.1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 15:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yMo8zD+Y4gBSxPVZ+67KkVYFkJ7TR9WX94Fb70e9izk=;
 b=fcIYQRh9XxRIRXB/80/nSQZZbSclhF1IL2Ysssmz6UKjW/8VpVzXFUvmz9grBShsTu
 VY5ke319Yg3BYCLYbFEy5O8IeLmQn9yib7lZ2ftgx2+fIKvsmLFpV0gXmKw3cSgiighL
 z44ewmkuBPt55RT3SFFzXQ3xeJSsGDr0R4F5fmCAgEZ3Efq3SxBDHo37JYtEBEgNhF5e
 sqYnRxIxZOHNZc31mQcCtuct8H5wSkbK0FZqVF2bFwuxog0VZwrjfcsus/XQPqBML4Qq
 L8c/AYAqg5mMqw1TOVr8DG9+zLXCh6uEPr60TGhx0UtzFD0QyNg5T/qESzi3qS9Skfa2
 9UHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yMo8zD+Y4gBSxPVZ+67KkVYFkJ7TR9WX94Fb70e9izk=;
 b=tqhVODKjd/ZTvAA75ZCxNNkImzBGmtI6BQxTNZMAMf6KMRLaYXSeXKqJgHd+NvNPg5
 PLe/rHS+OUBdLbVEroAtmUZFeI7hmiOw8mOQRbfFY8cYmHLH6cSrS0cVv9/cABgkDDo0
 Za+3KfmkQ5qajMRxpso34KlhsNOFkrCz/kOqCSXfKcP7sP/cmkcD7LDXw6wZgtqE3xmF
 LPcOrcANgqdtb84fA2Etz7kskCUKqTZxp11O/lh9RRnwfWfI6PDklC2J4LKIJeAMkGOi
 0e0uctxitLRVucfrtjKTFrJ8wslNcVkOLIS4MZtkOTXbW/obt68/TnO6ftgp6trSx+ON
 WnUA==
X-Gm-Message-State: AOAM530Ufs9HQ9EiFctArwQzWuTRTXawI9yeGSPQZZP3Lo3YIsa8t0HR
 +Iz1W/cEGkGDbckzBaMm4UU=
X-Google-Smtp-Source: ABdhPJxo7iqkV9l9gRrhuOVZ5G8rPWWXpZNjmUEhYykmnabkYmPdy6DxYveMBgNr9BLYgvhEo0AjEQ==
X-Received: by 2002:a2e:9a98:: with SMTP id p24mr25245378lji.55.1632696151415; 
 Sun, 26 Sep 2021 15:42:31 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru.
 [46.138.80.108])
 by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:42:31 -0700 (PDT)
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
Subject: [PATCH v13 05/35] dt-bindings: clock: tegra-car: Document new clock
 sub-nodes
Date: Mon, 27 Sep 2021 01:40:28 +0300
Message-Id: <20210926224058.1252-6-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210926224058.1252-1-digetx@gmail.com>
References: <20210926224058.1252-1-digetx@gmail.com>
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

Reviewed-by: Rob Herring <robh@kernel.org>
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

