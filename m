Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kB+yByGec2lqxgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:13:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A5F78395
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:13:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0014110EB22;
	Fri, 23 Jan 2026 16:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ySeWviUX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE04010EB22
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 16:13:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1B3EBC20308;
 Fri, 23 Jan 2026 16:13:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C0A956070A;
 Fri, 23 Jan 2026 16:13:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 118B3119A87DB; Fri, 23 Jan 2026 17:13:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769184792; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=avfjFTg9tMKVnyCWaSaxl741W7BD+VSfWM41OCpSvng=;
 b=ySeWviUXyYYBwa+wsGBY81oX1dHGVnvIasym/YcsYQhC2xsIORhQ1HcH5gdXh76eJUXLqD
 1BjhREBQc7dc2F4sIitJsDg5T/tovbjuLL+f6EjdnRMLQzvlZzFv0+hf5kj0Dl9jIvOdJ1
 TcQiwLSwD9DcdwYuMl73n2ZsntVjGGtB72VheVGUjbzx9kgBXbatz5FGChT3tFsja+iMva
 e9i/Wup93cjz8uQtMHmhH+HKJdRt0Z+kpsmq3+lj+cUcyIEsg3QSzgDZeV25xj0MUKzOt+
 10i6RoKWjXQ0ztwdZkJrEJoyiVbqJq5WyEDNyoJ6KpakIM7N8SOtDBvI2UYnrw==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Fri, 23 Jan 2026 17:12:29 +0100
Subject: [PATCH v5 11/25] drm/tilcdc: Rename external_encoder and
 external_connector to encoder and connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-feature_tilcdc-v5-11-5a44d2aa3f6f@bootlin.com>
References: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
In-Reply-To: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.15-dev-47773
X-Last-TLS-Session-Version: TLSv1.3
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[32];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jyri.sarha@iki.fi,m:tomi.valkeinen@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:brgl@bgdev.pl,m:tony@atomide.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:msp@baylibre.com,m:praneeth@ti.com,m:luca.ceresoli@bootlin.com,m:louis.chauvet@bootlin.com,m:thomas.petazzoni@bootlin.com,m:miguel.gazquez@bootlin.com,m:herve.codina@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-omap@vger.kernel.org,m:kory.maincent@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[iki.fi,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,armlinux.org.uk,bgdev.pl,atomide.com,intel.com,linaro.org,kwiboo.se];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.984];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ti.com:url]
X-Rspamd-Queue-Id: C4A5F78395
X-Rspamd-Action: no action

Remove the "external_" prefix from encoder and connector members in the
tilcdc driver. These are internal driver structures and the "external"
naming is misleading. The simpler names better reflect that these are
the primary encoder and connector managed by this driver.

Also rename tilcdc_attach_external_device() to tilcdc_encoder_create()
for consistency and to better describe the function's purpose.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c      |  4 ++--
 drivers/gpu/drm/tilcdc/tilcdc_drv.h      |  4 ++--
 drivers/gpu/drm/tilcdc/tilcdc_external.c | 21 +++++++++------------
 drivers/gpu/drm/tilcdc/tilcdc_external.h |  2 +-
 4 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index d911d413682ef..4b9fa819358a2 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -335,11 +335,11 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 	}
 #endif
 
-	ret = tilcdc_attach_external_device(ddev);
+	ret = tilcdc_encoder_create(ddev);
 	if (ret)
 		goto unregister_cpufreq_notif;
 
-	if (!priv->external_connector) {
+	if (!priv->connector) {
 		dev_err(dev, "no encoders/connectors found\n");
 		ret = -EPROBE_DEFER;
 		goto unregister_cpufreq_notif;
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index 717529a331009..dafb00908d1d4 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -75,8 +75,8 @@ struct tilcdc_drm_private {
 
 	struct drm_crtc *crtc;
 
-	struct drm_encoder *external_encoder;
-	struct drm_connector *external_connector;
+	struct drm_encoder *encoder;
+	struct drm_connector *connector;
 
 	bool irq_enabled;
 };
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c b/drivers/gpu/drm/tilcdc/tilcdc_external.c
index 81c90c2754c6c..11ac9673ba98a 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_external.c
@@ -37,21 +37,20 @@ int tilcdc_attach_bridge(struct drm_device *ddev, struct drm_bridge *bridge)
 	struct tilcdc_drm_private *priv = ddev->dev_private;
 	int ret;
 
-	priv->external_encoder->possible_crtcs = BIT(0);
+	priv->encoder->possible_crtcs = BIT(0);
 
-	ret = drm_bridge_attach(priv->external_encoder, bridge, NULL, 0);
+	ret = drm_bridge_attach(priv->encoder, bridge, NULL, 0);
 	if (ret)
 		return ret;
 
-	priv->external_connector =
-		tilcdc_encoder_find_connector(ddev, priv->external_encoder);
-	if (!priv->external_connector)
+	priv->connector = tilcdc_encoder_find_connector(ddev, priv->encoder);
+	if (!priv->connector)
 		return -ENODEV;
 
 	return 0;
 }
 
-int tilcdc_attach_external_device(struct drm_device *ddev)
+int tilcdc_encoder_create(struct drm_device *ddev)
 {
 	struct tilcdc_drm_private *priv = ddev->dev_private;
 	struct drm_bridge *bridge;
@@ -65,13 +64,11 @@ int tilcdc_attach_external_device(struct drm_device *ddev)
 	else if (ret)
 		return ret;
 
-	priv->external_encoder = devm_kzalloc(ddev->dev,
-					      sizeof(*priv->external_encoder),
-					      GFP_KERNEL);
-	if (!priv->external_encoder)
+	priv->encoder = devm_kzalloc(ddev->dev, sizeof(*priv->encoder), GFP_KERNEL);
+	if (!priv->encoder)
 		return -ENOMEM;
 
-	ret = drm_simple_encoder_init(ddev, priv->external_encoder,
+	ret = drm_simple_encoder_init(ddev, priv->encoder,
 				      DRM_MODE_ENCODER_NONE);
 	if (ret) {
 		dev_err(ddev->dev, "drm_encoder_init() failed %d\n", ret);
@@ -94,6 +91,6 @@ int tilcdc_attach_external_device(struct drm_device *ddev)
 	return 0;
 
 err_encoder_cleanup:
-	drm_encoder_cleanup(priv->external_encoder);
+	drm_encoder_cleanup(priv->encoder);
 	return ret;
 }
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.h b/drivers/gpu/drm/tilcdc/tilcdc_external.h
index 285a132f3035d..c8f87f59024e6 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_external.h
@@ -7,5 +7,5 @@
 #ifndef __TILCDC_EXTERNAL_H__
 #define __TILCDC_EXTERNAL_H__
 
-int tilcdc_attach_external_device(struct drm_device *ddev);
+int tilcdc_encoder_create(struct drm_device *ddev);
 #endif /* __TILCDC_SLAVE_H__ */

-- 
2.43.0

