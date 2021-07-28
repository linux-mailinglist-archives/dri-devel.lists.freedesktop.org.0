Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE8D3D8F2D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 15:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB3E66EA6C;
	Wed, 28 Jul 2021 13:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EEC6EA23
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 13:32:50 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id F1305580B85;
 Wed, 28 Jul 2021 09:32:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 28 Jul 2021 09:32:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=xK+xD/otmXwAY
 dn2EDRnzk0bEqEcAIq0hkn3HmHu00Y=; b=YaM8T8mma5KKG/SbB27kTdU173Upo
 PatXj4WpsvXqx3AK7lxThSpyOcIO5oVYuadBSf0uExot5dQevfoNOMIF77Nog6H9
 JsKWuCc+d/A7a4PBqqkkQr+/EJOrZPL2mHJVG2rJOYU3P2RtVXkuaS4Gwawaft5P
 8QnxL+FlYKpq8Gz+rN0yYDu+4AE8iZ75vusKos+hs+Nn7V6fz6b7hzZeQuVYvgVN
 7nZtU/Hq1vq7UhLAeZfjxGKF97gG5WimREgbjmvw1SUhl/EUg+D6H9t05xH1x/oA
 tAMiO7Xm+XLmbVkF6LeiV0rLJz519GYrYUfpF7K/nCzY2vCD7Jsfkgriw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=xK+xD/otmXwAYdn2EDRnzk0bEqEcAIq0hkn3HmHu00Y=; b=AYqd1tJ/
 9+K21e4IxaLaHXTzRrrjRAoQf5/EmS5GVs82bUSJ4HNYlzOWbuivvIuALm9AZx8H
 AcdnpD0gB3graOxPkDgzoM3okiKQMQWoL8RKCxHqDZshKlbLGUKTr5vrTqU8M3MZ
 6U87wJCD1zlQBspnv3fSPoXXiyikacVF8YewVkj0FNTfrxwGH/q1ZI8zuVULewz5
 je04HwVhoiknpIpdF61WZm6ViPUvVKcAUm+qRyhQNI4KMeab1MBtXfQrjPZl9VxP
 B3uM1VKvBCZCHY8dRYqcHTUFfAd1cCozbX7Eh67fCTMN06FwFY3UmZAvIWJGF3ME
 GWKQVnSLNf40Aw==
X-ME-Sender: <xms:gVwBYUEixL_8CHq7IHwterehTTvhradTUnisPXTCXBryU-pTdASRmw>
 <xme:gVwBYdUXKxc5Lp79hnwujWOVURFTYWxMKw3da3LQyOCCdLsA0cqJMGkCw0jSxfhWZ
 iGWk-ZQ0wtq5mjEQKw>
X-ME-Received: <xmr:gVwBYeLbfjq_IfUH54yuJnW6wtIiqhDH2xrU5QXiDAVgP2rFfQjx-wmTLmTYKPB6eNWzsAn0LOeucYf7pfTeVkwjWJ7bR7SwP6eu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeelgdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:gVwBYWEXzNYAF01LfChMqdSux7wwbI4t4KIHFcWhQZ1akUdRLsi9hw>
 <xmx:gVwBYaXelrky3BKv-b9WSL8524vq9McDwJUcoh4imlrOOzeszaWYZQ>
 <xmx:gVwBYZOmR2iCHiC4ov-3ZkEC6fw8NiyVTa3ERfs76Ynwi7liE2uhzg>
 <xmx:gVwBYTXKv9D21UxUJ_khoK8hhMGY-AU6uL_Q-zb-7xNFz2UEPzb_Mw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jul 2021 09:32:49 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2 5/8] drm/panel: Create attach and detach callbacks
Date: Wed, 28 Jul 2021 15:32:26 +0200
Message-Id: <20210728133229.2247965-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728133229.2247965-1-maxime@cerno.tech>
References: <20210728133229.2247965-1-maxime@cerno.tech>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a partial revert of 87154ff86bf6 ("drm: Remove unnecessary
drm_panel_attach and drm_panel_detach").

In order to make the probe order expectation more consistent between
bridges, let's create attach and detach hooks for the panels as well to
match what is there for bridges.

Most drivers have changed significantly since the reverted commit, so we
only brought back the calls in the panel bridge to lessen the risk of
regressions, and since panel bridge is what we're converging to these
days, it's not a big deal anyway.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/panel.c |  6 +++++
 drivers/gpu/drm/drm_panel.c    | 47 ++++++++++++++++++++++++++++++++++
 include/drm/drm_panel.h        | 27 +++++++++++++++++++
 3 files changed, 80 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index c916f4b8907e..0b06e0dbad00 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -82,6 +82,10 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 	drm_connector_attach_encoder(&panel_bridge->connector,
 					  bridge->encoder);
 
+	ret = drm_panel_attach(panel_bridge->panel, &panel_bridge->connector);
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 
@@ -90,6 +94,8 @@ static void panel_bridge_detach(struct drm_bridge *bridge)
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
 	struct drm_connector *connector = &panel_bridge->connector;
 
+	drm_panel_detach(panel_bridge->panel);
+
 	/*
 	 * Cleanup the connector if we know it was initialized.
 	 *
diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index f634371c717a..10716b740685 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -93,6 +93,53 @@ void drm_panel_remove(struct drm_panel *panel)
 }
 EXPORT_SYMBOL(drm_panel_remove);
 
+/**
+ * drm_panel_attach - attach a panel to a connector
+ * @panel: DRM panel
+ * @connector: DRM connector
+ *
+ * After obtaining a pointer to a DRM panel a display driver calls this
+ * function to attach a panel to a connector.
+ *
+ * An error is returned if the panel is already attached to another connector.
+ *
+ * When unloading, the driver should detach from the panel by calling
+ * drm_panel_detach().
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int drm_panel_attach(struct drm_panel *panel, struct drm_connector *connector)
+{
+	if (!panel)
+		return -EINVAL;
+
+	if (panel->funcs && panel->funcs->attach)
+		return panel->funcs->attach(panel);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_panel_attach);
+
+/**
+ * drm_panel_detach - detach a panel from a connector
+ * @panel: DRM panel
+ *
+ * Detaches a panel from the connector it is attached to. If a panel is not
+ * attached to any connector this is effectively a no-op.
+ *
+ * This function should not be called by the panel device itself. It
+ * is only for the drm device that called drm_panel_attach().
+ */
+void drm_panel_detach(struct drm_panel *panel)
+{
+	if (!panel)
+		return;
+
+	if (panel->funcs && panel->funcs->detach)
+		panel->funcs->detach(panel);
+}
+EXPORT_SYMBOL(drm_panel_detach);
+
 /**
  * drm_panel_prepare - power on a panel
  * @panel: DRM panel
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 4602f833eb51..33d139e98b19 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -68,6 +68,30 @@ enum drm_panel_orientation;
  * does not need to implement the functionality to enable/disable backlight.
  */
 struct drm_panel_funcs {
+	/**
+	 * @attach:
+	 *
+	 * This callback is invoked whenever our panel is being attached
+	 * to its DRM connector.
+	 *
+	 * The @attach callback is optional.
+	 *
+	 * RETURNS:
+	 *
+	 * Zero on success, error code on failure.
+	 */
+	int (*attach)(struct drm_panel *panel);
+
+	/**
+	 * @detach:
+	 *
+	 * This callback is invoked whenever our panel is being detached
+	 * from its DRM connector.
+	 *
+	 * The @detach callback is optional.
+	 */
+	void (*detach)(struct drm_panel *panel);
+
 	/**
 	 * @prepare:
 	 *
@@ -180,6 +204,9 @@ void drm_panel_init(struct drm_panel *panel, struct device *dev,
 void drm_panel_add(struct drm_panel *panel);
 void drm_panel_remove(struct drm_panel *panel);
 
+int drm_panel_attach(struct drm_panel *panel, struct drm_connector *connector);
+void drm_panel_detach(struct drm_panel *panel);
+
 int drm_panel_prepare(struct drm_panel *panel);
 int drm_panel_unprepare(struct drm_panel *panel);
 
-- 
2.31.1

