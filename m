Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4542642418E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 17:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BFC6ECFD;
	Wed,  6 Oct 2021 15:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360556E509
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 07:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1633506875; x=1665042875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TLwy29Z74qOt7jxrwkFUfPbnsEScBrPBXFyKkjDo208=;
 b=Z2XOidny/Ir0ht/HBGoLMrg4M4VALHGGKZU+RLuQO9VzuA6F3uata5Ct
 Pfy1a/PSgCjRUhseKEAczP6EF3KGjtDWVBFPiAW2hemte1IbOqIvynFhR
 Wms/uoFUaKAUOSC4qKwwDhtpXLOzcKZs6B2NAmFrUEL9BNbn7cC9iE6Sb
 zNyy4iGEdfG9aEiLwGZAgZQwbIympaC9IrD4uJdEdbYNosZMOe/6MNHaP
 YXQhEbrIa3t1gFjezevaSC143UjGID+1vntig6jzi6g6LZivGY6sj0xKB
 aQ1DfP3M+FizMUilRMFVJ8KZDF/r3Wt+4Pbj1LdFlc84WjF4B0Ed+HES3 w==;
X-IronPort-AV: E=Sophos;i="5.85,350,1624312800"; d="scan'208";a="19887680"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 06 Oct 2021 09:47:21 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 06 Oct 2021 09:47:22 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 06 Oct 2021 09:47:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1633506442; x=1665042442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TLwy29Z74qOt7jxrwkFUfPbnsEScBrPBXFyKkjDo208=;
 b=RMEtELz91l1Aj+RHticl46UJH1cMMbzNv6X1munzMHQIC/BYK+RI0WXV
 h5v36cmKuh65+MDHHNEAQj4IzNTzenMG+J3KEo1eIliW/Npp2l2uExkk9
 7FibsIZjrvuopo2cdWd6J3G9DQGkRflZXcV3oBvDFrETtR3mFAepWKCx4
 /Cw9oTVKcSdYgQP20dpnz/thjtUJGEKmdJHLlETZ3OS35i7zA1Hrp/d7X
 r3FUY2zioIC8YXU8Rvc3nimPdJFIvGbVEQM1gh5m4qPHfT882kN5pVWuZ
 kLtG8rC+/8ARlj1giybvuN90eCnoZJ59gdpm+YAK8+fNoWxO5CV+Hi/eX g==;
X-IronPort-AV: E=Sophos;i="5.85,350,1624312800"; d="scan'208";a="19887679"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 06 Oct 2021 09:47:21 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B11E0280065;
 Wed,  6 Oct 2021 09:47:21 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: drm/bridge: ti-sn65dsi83: Add vcc supply
 bindings
Date: Wed,  6 Oct 2021 09:47:12 +0200
Message-Id: <20211006074713.1094396-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006074713.1094396-1-alexander.stein@ew.tq-group.com>
References: <20211006074713.1094396-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 06 Oct 2021 15:43:56 +0000
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

Add a VCC regulator which needs to be enabled before the EN pin is
released.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml     | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
index 07b20383cbca..149cff3233c2 100644
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
 
@@ -94,6 +97,7 @@ required:
   - compatible
   - reg
   - enable-gpios
+  - vcc-supply
   - ports
 
 allOf:
@@ -135,6 +139,7 @@ examples:
             reg = <0x2d>;
 
             enable-gpios = <&gpio2 1 GPIO_ACTIVE_HIGH>;
+            vcc-supply = <&reg_sn65dsi83_1v8>;
 
             ports {
                 #address-cells = <1>;
-- 
2.25.1

