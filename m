Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 457E142418D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 17:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5AB6ED17;
	Wed,  6 Oct 2021 15:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 430 seconds by postgrey-1.36 at gabe;
 Wed, 06 Oct 2021 07:54:34 UTC
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4924E6E509
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 07:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1633506874; x=1665042874;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iG2jS+y/WSgcYwDoervvp4SA4wH8TDN8lILJ7OYWWWY=;
 b=Veo7EI8eCgrAIUFHS0tPaxpi+sjOAg9ymf7D08KbAd1J1mgr3iNuTJzx
 Idfa/6Q6pD2vzLs6Atjt9WGoUcRNUWuM6ubxaumdNpWw8FJ8Tfu49APDR
 UI//kbZmxoFTjh9eQv+ShDfUw7Nnu3jNe2Y5Sku/lL62ghhKZk44oZpcK
 JA+3tR1YCBmnyrpNWjUMfKLCSkFnH/jZsd4ZrHCEoFzSZ7yQUgxBgM1BY
 GMy/UDtqkZiH69k/BDmVpxiDfoY/j92rF/vUWZwiwevkMfMyXDDSlv26O
 PgwtvVzqjp0gT+zfJPqEXkUscvjLqK6/OZfUc4GZuu27UQxYjjD6v45he A==;
X-IronPort-AV: E=Sophos;i="5.85,350,1624312800"; d="scan'208";a="19887676"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 06 Oct 2021 09:47:18 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 06 Oct 2021 09:47:18 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 06 Oct 2021 09:47:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1633506438; x=1665042438;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iG2jS+y/WSgcYwDoervvp4SA4wH8TDN8lILJ7OYWWWY=;
 b=jP4K0bij3UsTdRik7yyYu8w3xhjcRHuj9kkfT51NXIQu1RdIU5giJlzd
 YRhZ7ZWOFpPaiWnF6Ux5jUhYNpZolsP5iUeGvPTs/rnilJ/qDwWNPTemz
 U9udc2j1HfXSwj08QzoHn7sAosVZ0POAZqj27diGTLRM3sy7O0a7LS/cm
 E+Lr4anxMwBXHIocPdgTyQwxb9Rg01zLZ0wi7y10OB07Ew7eFyGny/qbg
 vLUprQTeoj+qqfNiID8v4wtG/aqO+YIsO0ssB7wRbQsGxoyMBJJ0tVh27
 ickrjrUkHcvLE/emQkPW00Tk+vm88GTUJWzEDNB/fysBE+6PIQwrfsDi+ A==;
X-IronPort-AV: E=Sophos;i="5.85,350,1624312800"; d="scan'208";a="19887675"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 06 Oct 2021 09:47:18 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 82E24280065;
 Wed,  6 Oct 2021 09:47:18 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH 1/3] drm/bridge: ti-sn65dsi83: Add vcc supply regulator support
Date: Wed,  6 Oct 2021 09:47:11 +0200
Message-Id: <20211006074713.1094396-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
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

VCC needs to be enabled before releasing the enable GPIO.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index a32f70bc68ea..5fab0fabcd15 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -33,6 +33,7 @@
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -143,6 +144,7 @@ struct sn65dsi83 {
 	struct mipi_dsi_device		*dsi;
 	struct drm_bridge		*panel_bridge;
 	struct gpio_desc		*enable_gpio;
+	struct regulator		*vcc;
 	int				dsi_lanes;
 	bool				lvds_dual_link;
 	bool				lvds_dual_link_even_odd_swap;
@@ -647,6 +649,12 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 
 	ctx->panel_bridge = panel_bridge;
 
+	ctx->vcc = devm_regulator_get(dev, "vcc");
+	if (IS_ERR(ctx->vcc))
+		return dev_err_probe(dev, PTR_ERR(ctx->vcc),
+				     "Failed to get supply 'vcc': %pe\n",
+				     ERR_PTR(ret));
+
 	return 0;
 }
 
@@ -690,7 +698,11 @@ static int sn65dsi83_probe(struct i2c_client *client,
 	ctx->bridge.of_node = dev->of_node;
 	drm_bridge_add(&ctx->bridge);
 
-	return 0;
+	ret = regulator_enable(ctx->vcc);
+	if (ret)
+		dev_err(dev, "Failed to enable vcc\n");
+
+	return ret;
 }
 
 static int sn65dsi83_remove(struct i2c_client *client)
@@ -701,6 +713,7 @@ static int sn65dsi83_remove(struct i2c_client *client)
 	mipi_dsi_device_unregister(ctx->dsi);
 	drm_bridge_remove(&ctx->bridge);
 	of_node_put(ctx->host_node);
+	regulator_disable(ctx->vcc);
 
 	return 0;
 }
-- 
2.25.1

