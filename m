Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C4872D4FF
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 01:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE2110E2D0;
	Mon, 12 Jun 2023 23:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9628C10E2D0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 23:33:39 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1b3be39e666so14550505ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 16:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686612818; x=1689204818;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=afvXSKgNg6QRMjk9LVolOeSYEMjPMLaOa6YVUGnbWqA=;
 b=Yq4XUxvjeoXwKEZPIgudYBjeAWlqG5N+yrR66lNJS5Bg12WANboNVUgCifrVm4he/O
 5FnxGltE5rxDl/kwcXIdYhwl4dzFiuYDQnp4uoTcCnjfpENVoAskMBFuregP0LKJHHCV
 hO1RbRinDKzhOttTEophVwMyEwv5Ccen4/yvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686612818; x=1689204818;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=afvXSKgNg6QRMjk9LVolOeSYEMjPMLaOa6YVUGnbWqA=;
 b=k6zbKJeTgiWw32uMO5Lj+aod7j4DJ0S4BESKtbTiJyep8p69rnXnj1rF1V+O/AruOO
 CInUVWN0YQ+AgiDztomiqDpr+TdFzKt6GRsIYA+MnK3n3ZFa/jAEPTDumHqyTKpdMFwW
 oAQOlsnIQ8uHjBhOpckgvwxKDQZ8i3KwRpRPRxSYp3+ChWuUkaaDku1Uxg3gK+QWbNdJ
 gZ0tYtTVAPK7DLqq0Qbm1BygMPg7Uo52y3a8X9aIdUsEKj0WXqV1hnS2C4Gz2lOjCDye
 Ldq/oGEGmGGfAlwHO2mqcZeuAaA/xMY0oenp5RQNkDu3nMe9mIxIudl+jyt+fhpBnML2
 7dRA==
X-Gm-Message-State: AC+VfDzeJdoYvap6EtD/i5FLcPZwxZ6qiPZMESz3kNsLZdcI4XJ9i5Jf
 nP2/3Qbr29mu2bGYgMenx102F4jPb7fO7s9YynFgCy7w
X-Google-Smtp-Source: ACHHUZ4KkHZPwHW9kkd5sq8S9XXYG0qdqvEl0vZEzWBuNt5CUqk6LRiqCbbddw5cl0xtzn2qCUOBaw==
X-Received: by 2002:a17:902:ba83:b0:1ac:820e:c34a with SMTP id
 k3-20020a170902ba8300b001ac820ec34amr7067662pls.0.1686612817916; 
 Mon, 12 Jun 2023 16:33:37 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:1995:7db0:daf3:2c2a])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a170902eb4500b001acacff3a70sm4955527pli.125.2023.06.12.16.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 16:33:37 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: ps8640: Drop the ability of ps8640 to fetch the
 EDID
Date: Mon, 12 Jun 2023 16:32:57 -0700
Message-ID: <20230612163256.1.I7b8f60b3fbfda068f9bf452d584dc934494bfbfa@changeid>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Icenowy Zheng <uwu@icenowy.me>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jonas Karlman <jonas@kwiboo.se>, Douglas Anderson <dianders@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Pin-yen Lin <treapking@chromium.org>, linux-mediatek@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to read the EDID from an eDP panel, you not only need to
power on the bridge chip itself but also the panel. In the ps8640
driver, this was made to work by having the bridge chip manually power
the panel on by calling pre_enable() on everything connectorward on
the bridge chain. This worked OK, but...

...when trying to do the same thing on ti-sn65dsi86, feedback was that
this wasn't a great idea. As a result, we designed the "DP AUX"
bus. With the design we ended up with the panel driver itself was in
charge of reading the EDID. The panel driver could power itself on and
the bridge chip was able to power itself on because it implemented the
DP AUX bus.

Despite the fact that we came up with a new scheme, implemented in on
ti-sn65dsi86, and even implemented it on parade-ps8640, we still kept
the old code around. This was because the new scheme required a DT
change. Previously the panel was a simple "platform_device" and in DT
at the top level. With the new design the panel needs to be listed in
DT under the DP controller node. The old code allowed us to properly
fetch EDIDs with ps8640 with the old DTs.

Unfortunately, the old code stopped working as of commit 102e80d1fa2c
("drm/bridge: ps8640: Use atomic variants of drm_bridge_funcs"). There
are cases at bootup where connector->state->state is NULL and the
kernel crashed at:
* drm_atomic_bridge_chain_pre_enable
* drm_atomic_get_old_bridge_state
* drm_atomic_get_old_private_obj_state

A bit of digging was done to see if there was an easy fix but there
was nothing obvious. Instead, the only device using ps8640 the "old"
way had its DT updated so that the panel was no longer a simple
"platform_deice". See commit c2d94f72140a ("arm64: dts: mediatek:
mt8173-elm: Move display to ps8640 auxiliary bus") and commit
113b5cc06f44 ("arm64: dts: mediatek: mt8173-elm: remove panel model
number in DT").

Let's delete the old, crashing code so nobody gets tempted to copy it
or figure out how it works (since it doesn't).

NOTE: from a device tree "purist" point of view, we're supposed to
keep old device trees working and this patch is technically "against
policy". Reasons I'm still proposing it anyway:
1. Officially, old mt8173-elm device trees worked via the "little
   white lie" approach. The DT would list an arbitrary/representative
   panel that would be used for power sequencing. The mode information
   in the panel driver would then be ignored / overridden by the EDID
   reading code in ps8640. I don't feel too terrible breaking DTs that
   contained the wrong "compatible" string to begin with. NOTE that
   any old device trees that _didn't_ lie about their compatible will
   still work because the mode information will come from the
   hardcoded panels in panel-edp.
2. The only users of the old code were Chromebooks and Chromebooks
   don't bake their DTs into the BIOS (they are bundled with the
   kernel). Thus we don't need to worry about breaking someone using
   an old DT with a new kernel.
3. The old code was crashing anyway. If someone wants to fix the old
   code instead of deleting it then they have my blessing, but without
   a proper fix the old code isn't useful.

I'll list this as "Fixing" the code that made the old code start
failing. There's not lots of reason to bring this back any further
than that.

Fixes: 102e80d1fa2c ("drm/bridge: ps8640: Use atomic variants of drm_bridge_funcs")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/parade-ps8640.c | 79 --------------------------
 1 file changed, 79 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 8801cdd033b5..8161b1a1a4b1 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -105,7 +105,6 @@ struct ps8640 {
 	struct gpio_desc *gpio_reset;
 	struct gpio_desc *gpio_powerdown;
 	struct device_link *link;
-	struct edid *edid;
 	bool pre_enabled;
 	bool need_post_hpd_delay;
 };
@@ -155,23 +154,6 @@ static inline struct ps8640 *aux_to_ps8640(struct drm_dp_aux *aux)
 	return container_of(aux, struct ps8640, aux);
 }
 
-static bool ps8640_of_panel_on_aux_bus(struct device *dev)
-{
-	struct device_node *bus, *panel;
-
-	bus = of_get_child_by_name(dev->of_node, "aux-bus");
-	if (!bus)
-		return false;
-
-	panel = of_get_child_by_name(bus, "panel");
-	of_node_put(bus);
-	if (!panel)
-		return false;
-	of_node_put(panel);
-
-	return true;
-}
-
 static int _ps8640_wait_hpd_asserted(struct ps8640 *ps_bridge, unsigned long wait_us)
 {
 	struct regmap *map = ps_bridge->regmap[PAGE2_TOP_CNTL];
@@ -539,50 +521,6 @@ static void ps8640_bridge_detach(struct drm_bridge *bridge)
 		device_link_del(ps_bridge->link);
 }
 
-static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
-					   struct drm_connector *connector)
-{
-	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
-	struct device *dev = &ps_bridge->page[PAGE0_DP_CNTL]->dev;
-	bool poweroff = !ps_bridge->pre_enabled;
-
-	if (!ps_bridge->edid) {
-		/*
-		 * When we end calling get_edid() triggered by an ioctl, i.e
-		 *
-		 *   drm_mode_getconnector (ioctl)
-		 *     -> drm_helper_probe_single_connector_modes
-		 *        -> drm_bridge_connector_get_modes
-		 *           -> ps8640_bridge_get_edid
-		 *
-		 * We need to make sure that what we need is enabled before
-		 * reading EDID, for this chip, we need to do a full poweron,
-		 * otherwise it will fail.
-		 */
-		if (poweroff)
-			drm_atomic_bridge_chain_pre_enable(bridge,
-							   connector->state->state);
-
-		ps_bridge->edid = drm_get_edid(connector,
-					       ps_bridge->page[PAGE0_DP_CNTL]->adapter);
-
-		/*
-		 * If we call the get_edid() function without having enabled the
-		 * chip before, return the chip to its original power state.
-		 */
-		if (poweroff)
-			drm_atomic_bridge_chain_post_disable(bridge,
-							     connector->state->state);
-	}
-
-	if (!ps_bridge->edid) {
-		dev_err(dev, "Failed to get EDID\n");
-		return NULL;
-	}
-
-	return drm_edid_duplicate(ps_bridge->edid);
-}
-
 static void ps8640_runtime_disable(void *data)
 {
 	pm_runtime_dont_use_autosuspend(data);
@@ -592,7 +530,6 @@ static void ps8640_runtime_disable(void *data)
 static const struct drm_bridge_funcs ps8640_bridge_funcs = {
 	.attach = ps8640_bridge_attach,
 	.detach = ps8640_bridge_detach,
-	.get_edid = ps8640_bridge_get_edid,
 	.atomic_post_disable = ps8640_atomic_post_disable,
 	.atomic_pre_enable = ps8640_atomic_pre_enable,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
@@ -705,14 +642,6 @@ static int ps8640_probe(struct i2c_client *client)
 	ps_bridge->bridge.of_node = dev->of_node;
 	ps_bridge->bridge.type = DRM_MODE_CONNECTOR_eDP;
 
-	/*
-	 * In the device tree, if panel is listed under aux-bus of the bridge
-	 * node, panel driver should be able to retrieve EDID by itself using
-	 * aux-bus. So let's not set DRM_BRIDGE_OP_EDID here.
-	 */
-	if (!ps8640_of_panel_on_aux_bus(&client->dev))
-		ps_bridge->bridge.ops = DRM_BRIDGE_OP_EDID;
-
 	/*
 	 * Get MIPI DSI resources early. These can return -EPROBE_DEFER so
 	 * we want to get them out of the way sooner.
@@ -777,13 +706,6 @@ static int ps8640_probe(struct i2c_client *client)
 	return ret;
 }
 
-static void ps8640_remove(struct i2c_client *client)
-{
-	struct ps8640 *ps_bridge = i2c_get_clientdata(client);
-
-	kfree(ps_bridge->edid);
-}
-
 static const struct of_device_id ps8640_match[] = {
 	{ .compatible = "parade,ps8640" },
 	{ }
@@ -792,7 +714,6 @@ MODULE_DEVICE_TABLE(of, ps8640_match);
 
 static struct i2c_driver ps8640_driver = {
 	.probe = ps8640_probe,
-	.remove = ps8640_remove,
 	.driver = {
 		.name = "ps8640",
 		.of_match_table = ps8640_match,
-- 
2.41.0.162.gfafddb0af9-goog

