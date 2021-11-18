Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E25414557E5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 10:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BEC6EC72;
	Thu, 18 Nov 2021 09:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402226EC70
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 09:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1637227215; x=1668763215;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=POh5eXzb/NnaGXPE+zuDTJeI+unBh++bhwgJfe3afeU=;
 b=OIKd6KDC4aY2Xy5QEAYC4adL8/M4bhtYQBOk4GoiBGjrYfXCXv6W4v3p
 avpCYRu/zHcPBqDul36EON/lU0HZboczV8VbMVrcoGQkfdBc3ZftLcJTY
 lRiDV30gNEEJ47o0Q9oQhvPZ+EVoPAphBhMFIDe60V3PtXmxItxztMu0M
 DQimsZZBUv+2S6HHgFZTZNI/6tylhOwEXAWZRa8vXVYYDdxDCU/qv0JM3
 25PFJhBigFeG7v0MnB74LuVjGrAta5+uK2q8atx6fqZ5HZdoWcZiE0E0s
 wxdqGwsUW4h0ZrpZAJdtd0kccywFUgRN6kBHJR/5FQvvH7yUAppSkjW27 A==;
X-IronPort-AV: E=Sophos;i="5.87,244,1631570400"; d="scan'208";a="20534724"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 18 Nov 2021 10:20:05 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 18 Nov 2021 10:20:05 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 18 Nov 2021 10:20:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1637227205; x=1668763205;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=POh5eXzb/NnaGXPE+zuDTJeI+unBh++bhwgJfe3afeU=;
 b=LHbIzizSJONzd4xa9nhI1KnTSGI5k/AnPu02kXKFRoun5RuTj3zb+VdD
 Zgcpt3LOcD9JczhLeOTIMEKUMVSZa0mez89ECuEoY5ZjBvYfLJc9/O6Oe
 G8WzliNAK+vFD8V57JahG6O9s6lTiq6BqV8BfxYMTFVblDfgG2L9/iOEh
 DbiKZY8gcrZIN5HKOk0Wd4gkEkaXANEPYpJh1YC5ic1h6xNDFVw+GBVzP
 JMDFs+lh+ATgo6uenKBymrFBviClqkCBnKJnT8TgP9lnPyIMbdfNrlM85
 B/gbtYC5PFItfOM2QVqrZ0DrO6UqiX01LFy4oi/ehJqLHk+QyOxOMA8te w==;
X-IronPort-AV: E=Sophos;i="5.87,244,1631570400"; d="scan'208";a="20534714"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 18 Nov 2021 10:20:03 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6C0AE28007C;
 Thu, 18 Nov 2021 10:20:02 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v4 3/4] dt-bindings: drm/bridge: ti-sn65dsi83: Add vcc supply
 bindings
Date: Thu, 18 Nov 2021 10:19:54 +0100
Message-Id: <20211118091955.3009900-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211118091955.3009900-1-alexander.stein@ew.tq-group.com>
References: <20211118091955.3009900-1-alexander.stein@ew.tq-group.com>
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a VCC regulator which needs to be enabled before the EN pin is
released.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml      | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
index c3f3e73f740a..48a97bb3e2e0 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
@@ -32,6 +32,9 @@ properties:
     maxItems: 1
     description: GPIO specifier for bridge_en pin (active high).
 
+  vcc-supply:
+    description: A 1.8V power supply (see regulator/regulator.yaml).
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -132,6 +135,7 @@ examples:
             reg = <0x2d>;
 
             enable-gpios = <&gpio2 1 GPIO_ACTIVE_HIGH>;
+            vcc-supply = <&reg_sn65dsi83_1v8>;
 
             ports {
                 #address-cells = <1>;
-- 
2.25.1

