Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 642F644FA61
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 20:36:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413006E884;
	Sun, 14 Nov 2021 19:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31CFF6E873
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 19:36:02 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id bu18so37669207lfb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 11:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nXolFcz4QOLnIUZoiZ0Ry5uu5XANR011N6AEo6cZVfo=;
 b=GTA3w3im+GqvbUwlHpVfzRHCQQXXVqIE0Ef2JBk33/Yv6Sz+llqq06o8T4Nd4cKZlZ
 bq9yxJ8T8KU1Gsuo6uy/TQqtTlS80st9Ba11xsyhDV9HoMAoyGnkffF6BsSKUJumjy9F
 i5JHnYXAuWBosjjbbWqsnyWvALXivTdUq353a9lXBba7NHYI5ntBklY3kr/WgnJJKuaY
 wrAREWLBHsfHX1B1pZ6xsHxNVErTWaWYuby2b9VId3k244uJ5/qMiVIxSM9AS/0F7qRJ
 Wit4+Ld4Qd0ef0S9sO8c2zx8QvT99IevfU0PGK1m0gwYGeHwsehIMuo3g0jILjKaR65U
 6tOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nXolFcz4QOLnIUZoiZ0Ry5uu5XANR011N6AEo6cZVfo=;
 b=reOHxjmnMQ9vlL145m8o2QFtI4iyoor0D0ozj6/MOyF1a0l+K932OvyMmSzLhmcPI+
 ImPNVTsh0TCIV2qlb1KbxuzY5w24mARXZhb+4nyNBAh3jAuhhSI6xg+ptxKcTBlj8SdJ
 fRXTfQ+WXh8Kerqq/0J2JgbCPFhy4MxvvyhiD8fp61NELKUq5ywODlQXrZoWF6B9ArB4
 LFdq9EuzOg73c3hdin0STmleIFYw2j2GjFMWA15YRUDM9j9QXj3USuIHQ07lqQQNzhev
 aqF4GlU4Pp1+pMb2JFsoC89Zeq856T8F8wKlGq0sPzlLBcEfQevvgHXqzlb7uZMmOMYq
 QkpA==
X-Gm-Message-State: AOAM531p8F8u1Ooz5fWI7HzHDcmpfdJsQvPGli72SehdBfMHd6lzF5OY
 cuNnGT/jeMtaXy9IkPI82yU=
X-Google-Smtp-Source: ABdhPJyE2pqBxqYIFfhmddKMCTVl+idi2/w9eoTjEZ7vP9vh58ZZb8zZF9zbScanfO+vonFmYOoGZg==
X-Received: by 2002:a05:6512:a91:: with SMTP id
 m17mr30110605lfu.638.1636918560543; 
 Sun, 14 Nov 2021 11:36:00 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru.
 [46.138.46.211])
 by smtp.gmail.com with ESMTPSA id p18sm1191280lfu.127.2021.11.14.11.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 11:36:00 -0800 (PST)
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
Subject: [PATCH v15 04/39] dt-bindings: clock: tegra-car: Document new clock
 sub-nodes
Date: Sun, 14 Nov 2021 22:34:00 +0300
Message-Id: <20211114193435.7705-5-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114193435.7705-1-digetx@gmail.com>
References: <20211114193435.7705-1-digetx@gmail.com>
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
Cc: linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
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

