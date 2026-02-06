Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGfyDWjlhWnCHwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 13:58:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AA1FDC7A
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 13:58:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE4810E12B;
	Fri,  6 Feb 2026 12:58:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="FQtnmZx+";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Xr/k269h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8CF10E12B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 12:58:11 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4f6vJx6ppXz9vHM;
 Fri,  6 Feb 2026 13:58:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1770382690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=llgXl1mE8bc/+pFeFK8Wf0YdvBqmM9KcT1a3EQ5d55c=;
 b=FQtnmZx+cNsWxhGtEVONGv7U1ygvr9t2SH18ew1lt0NNElAZ8lOz3U4yA/VWb/tg7RwRQj
 dHLiU+jPkQ5+e8TKv1BZt/IMMbjhpNsS3uc5Z9SGy1RHmV+Y6x810FmjDo9noQRSVrIF7g
 p0r7vT2fhUZB5h2XOAg3v1l/hvUueyyRDvtJcDE9pr0p+3ONPb/8N/A4kOAc/xnMWLd8ut
 7JRbe+ZsSiOFzquGpUwR4rvdZDznY/0GE9eJB27KxD6zin/BGZORcyMgsia8irheMeoaX0
 7IzX9hFF+/QruRd9sO/z1LaEvuzPwptbPEu2HY7LoPl0e2D79RoXeJMfgz9GUQ==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="Xr/k269h";
 spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org
 designates 2001:67c:2050:b231:465::1 as permitted sender)
 smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1770382688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=llgXl1mE8bc/+pFeFK8Wf0YdvBqmM9KcT1a3EQ5d55c=;
 b=Xr/k269h0oQIaFECs9ujS9B7jQDQlNf0KRkSqFXgv8YjiHqa5gqu15zosi9JzmOdHMADMf
 hgsEQsK0mfXUpQIvDBjknQo250+sUgBR7N2vU4QBrP1iGeaQzSIbhjc5aV6LDWRkG7jgk1
 eAzJd2FOxNlD0gjcbcKHcs44GrEhPiyrXPy4feyeVidP1QDCQmmABKXzeIZNV1FZIp/pbZ
 4IM+82SOdjbYtpAqDX9EkTvFHFH/PCu5KZb9ll1/KtesWBil4d8urhweQiS50u8FnTd/nO
 gO1UIDG4LEC6Xt9N3/dhM/wbxcWBPEAasRSe4+29Cau1zOg227eaOWnAcZpdwQ==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] drm/bridge: waveshare-dsi: Register and attach our DSI
 device at probe
Date: Fri,  6 Feb 2026 13:57:53 +0100
Message-ID: <20260206125801.78705-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: ebf340d77ff1dffcde5
X-MBO-RS-META: h9kizgeey8nho63mht4btn5efcornqr7
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mailbox.org,bootlin.com,intel.com,gmail.com,kwiboo.se,ideasonboard.com,linux.intel.com,kernel.org,linaro.org,ffwll.ch,suse.de,vger.kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,ideasonboard.com:email,kwiboo.se:email,mailbox.org:email,mailbox.org:dkim,mailbox.org:mid,lists.freedesktop.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: 86AA1FDC7A
X-Rspamd-Action: no action

In order to avoid any probe ordering issue, the best practice is to move
the secondary MIPI-DSI device registration and attachment to the
MIPI-DSI host at probe time.

Besides solving the probe ordering problems, this makes the bridge work
with R-Car DU. The R-Car DU will attempt to locate the DSI host bridge in
its own rcar_du_probe()->rcar_du_modeset_init()->rcar_du_encoder_init()
by calling of_drm_find_bridge() which calls of_drm_find_and_get_bridge()
and iterates over bridge_list to locate the DSI host bridge.

However, unless the WS driver calls mipi_dsi_attach() in probe(), the
DSI host bridge .attach callback rcar_mipi_dsi_host_attach() is not
called and the DSI host bridge is not added into bridge_list. Therefore
the of_drm_find_and_get_bridge() called from du_probe() will never find
the DSI host bridge and probe will indefinitelly fail with -EPROBE_DEFER.

The circular dependency here is, that if rcar_du_encoder_init() would
manage to find the DSI host bridge, it would call the WS driver .attach
callback ws_bridge_bridge_attach(), but this is too late and can never
happen. This change avoids the circular dependency.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Note that this is similar to e.g. commit
6ef7ee48765f ("drm/bridge: sn65dsi83: Register and attach our DSI device at probe")
and pretty much what every other DSI-to-DPI bridge does.
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Update commit message with issue description
    - Add RB from Luca
---
 drivers/gpu/drm/bridge/waveshare-dsi.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/waveshare-dsi.c b/drivers/gpu/drm/bridge/waveshare-dsi.c
index 43f4e7412d722..9254446f54958 100644
--- a/drivers/gpu/drm/bridge/waveshare-dsi.c
+++ b/drivers/gpu/drm/bridge/waveshare-dsi.c
@@ -80,11 +80,6 @@ static int ws_bridge_bridge_attach(struct drm_bridge *bridge,
 				   enum drm_bridge_attach_flags flags)
 {
 	struct ws_bridge *ws = bridge_to_ws_bridge(bridge);
-	int ret;
-
-	ret = ws_bridge_attach_dsi(ws);
-	if (ret)
-		return ret;
 
 	return drm_bridge_attach(encoder, ws->next_bridge,
 				 &ws->bridge, flags);
@@ -179,7 +174,7 @@ static int ws_bridge_probe(struct i2c_client *i2c)
 	ws->bridge.of_node = dev->of_node;
 	devm_drm_bridge_add(dev, &ws->bridge);
 
-	return 0;
+	return ws_bridge_attach_dsi(ws);
 }
 
 static const struct of_device_id ws_bridge_of_ids[] = {
-- 
2.51.0

