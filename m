Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA9B777B27
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 16:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1E810E540;
	Thu, 10 Aug 2023 14:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2068510E540
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 14:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1691678701; x=1723214701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/8fr/hvcmqsJO94upZmC0Hy1/wTw9sh/EMCxiuhZshE=;
 b=IopXsbLzlzRrJjxXRe5mOx1fV5wOEBcBcpmFhL6mzEWL+1rcPRwcjdXt
 JTNJfyixoUaSvysPLdydtqBWGkvQ7hp98cAvWCnNBi8UKQjpabwYp/a/V
 bhyQIBRYF5lGDaOsvQzjY6sXf3IkcRPOslQgVRuHFqFVZa5YVaDvOVVGR
 7PCT1ztMzZZQvmEZiUR2ot9a8LF+RsqlSTEXEvge9yd1GcoJmwuTqxLAL
 JIy8gop/mI6uI6fKO8Z2MRdPKiisJiItbCk0vwUiZVt+5I2JRTyQFJzci
 lvcIUQLHpFsul3c8C6Ii1UfnHqiZoUu0JfHm86PKlsjSZyfAO1rsqZpFZ w==;
X-IronPort-AV: E=Sophos;i="6.01,162,1684792800"; d="scan'208";a="32396720"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 10 Aug 2023 16:44:58 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C94C328008D;
 Thu, 10 Aug 2023 16:44:57 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 2/6] dt-bindings: imx-thermal: Add #thermal-sensor-cells
 property
Date: Thu, 10 Aug 2023 16:44:47 +0200
Message-Id: <20230810144451.1459985-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810144451.1459985-1-alexander.stein@ew.tq-group.com>
References: <20230810144451.1459985-1-alexander.stein@ew.tq-group.com>
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Alexander Stein <alexander.stein@ew.tq-group.com>, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This property is defined in thermal-sensor.yaml. Reference this file and
constraint '#thermal-sensor-cells' to 0 for imx-thermal.
Fixes the warning:
arch/arm/boot/dts/nxp/imx/imx6q-mba6a.dtb: tempmon:
 '#thermal-sensor-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
 From schema: Documentation/devicetree/bindings/thermal/imx-thermal.yaml

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/thermal/imx-thermal.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
index 3aecea77869f..a746f6a6395a 100644
--- a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
@@ -60,6 +60,9 @@ properties:
   clocks:
     maxItems: 1
 
+  "#thermal-sensor-cells":
+    const: 0
+
 required:
   - compatible
   - interrupts
@@ -67,6 +70,9 @@ required:
   - nvmem-cells
   - nvmem-cell-names
 
+allOf:
+  - $ref: thermal-sensor.yaml#
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

