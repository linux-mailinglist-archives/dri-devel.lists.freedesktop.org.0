Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1249643A72C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 00:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B2C6E311;
	Mon, 25 Oct 2021 22:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A166E2D5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:45:51 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id d13so11275186ljg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nXolFcz4QOLnIUZoiZ0Ry5uu5XANR011N6AEo6cZVfo=;
 b=DFM6sYRPZ8DXZXIU7Z6b73CuokdoFmhJ42EyQPI6iBIOmzdHrQtBjx2MJU5rOc8M58
 xju49IqtGJG68zWBZD/ep7cssGXLJ2427tJ+FeVOTm8kT4rVXBUEjTUecSXI1tHv3ORl
 sg7rVI1YfUdN5ynEHenkXbFPwA8htvBbwSN+XFy1kgV8sMUqTF9ctarRr9fdB7HBzNQ3
 h1zcOaBaXwnSeRuI9IfQBTdjJzXOqQvL0Yyt1R9C+HpW6VG7Eu4QS3/4dRVRcwsnPa1t
 P/m/1nH0RtRroBVwGogUrTAaYzcTAOHRaqVvamjgYsiwTIogS2Md/Xn9ZWYeqIiEoJhc
 FYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nXolFcz4QOLnIUZoiZ0Ry5uu5XANR011N6AEo6cZVfo=;
 b=eSVrqe/oPuSpmbSAhR6uDAeIWQL6fZEel2BzLPtohvVwsVjK7U1xpaLHn/0KMWOidd
 g6bmQBnDCdCRZNOc0TL2AyEh90Ir8JDeE+PdTqOpdRyYcQ1ybM3YzVXovv+/N6AJRp8w
 ksUqvT3lVYF1OMozxlsWIhhcsZGDzxiF9hy9bs6jQYX8FNZNDdaNUarj2cgcO0mpNNhA
 XZYct5S42YvahcrOJHjOCoq340uyf8Y4VJAKcGffxGAjHzWz4s9K2E58uoR/D4lliAxF
 eCJMd5V8ZLBg9+wMtvhiy6Pp0oE/LP3fDEhqmd+OhLjGjtEfcBy3QSLqO3H0iyVKtDMR
 QeMA==
X-Gm-Message-State: AOAM533WcFwWWJLp7vEwbL/EV8Z0MfkBVO02tlejwfg1F/VKeUhhRtFC
 KHNrduqC0h/lGw9lhyKFBlQ=
X-Google-Smtp-Source: ABdhPJzU97QRuOu/GD/PWcLyUSSujXNS2wZq54jb9q+ctmsbd4g1VGg221OSD+erXWjv+9b+AYOEtQ==
X-Received: by 2002:a2e:8097:: with SMTP id i23mr21892283ljg.287.1635201949823; 
 Mon, 25 Oct 2021 15:45:49 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id t20sm2040956lft.240.2021.10.25.15.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 15:45:49 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH v14 04/39] dt-bindings: clock: tegra-car: Document new clock
 sub-nodes
Date: Tue, 26 Oct 2021 01:39:57 +0300
Message-Id: <20211025224032.21012-5-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211025224032.21012-1-digetx@gmail.com>
References: <20211025224032.21012-1-digetx@gmail.com>
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
2.33.1

