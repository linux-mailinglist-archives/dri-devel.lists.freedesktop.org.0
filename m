Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A6235DE52
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 14:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFFA789ECB;
	Tue, 13 Apr 2021 12:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB2089DEA;
 Tue, 13 Apr 2021 12:11:13 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2500758043B;
 Tue, 13 Apr 2021 08:11:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 13 Apr 2021 08:11:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=zstF2kI0HrVH1
 HQPqUiHA1fhN+BOhvPMMfpaIAmuoU0=; b=l5jZl7acAXE10AcUXo5cSwFI1gR+W
 7kx3F1P9tnsjYuj646ADeDsdv8c6IFu1jw7cKWE52k4R4pPhXkWtsAPWndSz0Itl
 2svOTmfBHPGBA5lJ7m7XiHVVpMkVu6Hopk/2wcQI6kdfPyKiXyG6aFupR0EoSXA2
 Wb4821LCEnt3EYz0T37mRSNyyYrgCVcqdebXpL6p0Uvq35D5qjihFwjaHdm58WnW
 j5KOujPx4MkTFSiqVWblMXqAcr200W4fgzEdncQiPyj8D1033Pc0BWbqnIbPP2C0
 3f7OFopB0rsPU4ZjXtbK+CZd1MWfEcz/BZURd7Q6/Ho2XBHoEt474Yg0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=zstF2kI0HrVH1HQPqUiHA1fhN+BOhvPMMfpaIAmuoU0=; b=OG+9lCST
 xAdJIfUGsfzi3tgVG4lQ3n+zY56sqDUNepavJpD9MAV5bbCDyA8zjWvTeU0U8nzi
 hSW7FTIrl9PHtaf1gdwKx1kIdMfp/M8ycxFDUih1wEuosrfaRGBkPGyrqYyKDI9i
 k09I1re5TkavvUbptNlBM+VdhrbyHBUscledU7GDzQTZrduN9bd2J7pHecUl0/w+
 TqVKZSE/n8EnXwJX5dcMfYSoxAxlVAQ8y+7SscWO+x7jRCsQsM3EPkmLcqNzQwTT
 cA6y9I//gSO5IthzJG6kt2TTr/DRB5KyxmmlhcqoLno4iuUnZcXqRjWT8gZqNDP7
 D4/+EF0gcWStkA==
X-ME-Sender: <xms:YIp1YJ-TTAs0QWPfsbEt-g7HYfyP2kVpdsZdU8fP6hVWuiwQheM4NQ>
 <xme:YIp1YBiJhNyD6ezBOeEgxvKjCLg_xfJyxzM62vUP2yCsU5LeH4I43-QxlOTl_J7-Z
 L79JWQ2YjmLsn2p-TY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekledggeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:YIp1YAFPB3wiWOqb2oNKOHZDHtj1p33sMyGorU5GA-5ZyRx9puSbyA>
 <xmx:YIp1YA_l3YbAQB8jlWAc4CNQIxiFYzWw1wD_N40W2_Iywn6SDQiXcA>
 <xmx:YIp1YHz8goJatFpfcbra7IPMQ9Jf86LFFVixwO2PR7Uij9RZFdiPfw>
 <xmx:YIp1YCpRC22a2jhcrmf0a5IGn0Y71ZKsa9xQ0j_Y3u3B9f_7WkT-hA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B1DF8108005F;
 Tue, 13 Apr 2021 08:11:11 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 4/5] drm/connector: Add a helper to attach the colorspace
 property
Date: Tue, 13 Apr 2021 14:11:03 +0200
Message-Id: <20210413121104.375789-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413121104.375789-1-maxime@cerno.tech>
References: <20210413121104.375789-1-maxime@cerno.tech>
MIME-Version: 1.0
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, amd-gfx@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Dom Cobley <dom@raspberrypi.com>,
 Andrzej Hajda <a.hajda@samsung.com>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The intel driver uses the same logic to attach the Colorspace property
in multiple places and we'll need it in vc4 too. Let's move that common
code in a helper.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v1:
  - New patch
---
 drivers/gpu/drm/drm_connector.c               | 20 +++++++++++++++++++
 .../gpu/drm/i915/display/intel_connector.c    |  6 ++----
 include/drm/drm_connector.h                   |  1 +
 3 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index b13021b1b128..6a20b249e533 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2171,6 +2171,26 @@ int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *conn
 }
 EXPORT_SYMBOL(drm_connector_attach_hdr_output_metadata_property);
 
+/**
+ * drm_connector_attach_colorspace_property - attach "Colorspace" property
+ * @connector: connector to attach the property on.
+ *
+ * This is used to allow the userspace to signal the output colorspace
+ * to the driver.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_connector_attach_colorspace_property(struct drm_connector *connector)
+{
+	struct drm_property *prop = connector->colorspace_property;
+
+	drm_object_attach_property(&connector->base, prop, DRM_MODE_COLORIMETRY_DEFAULT);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_attach_colorspace_property);
+
 /**
  * drm_connector_atomic_hdr_metadata_equal - checks if the hdr metadata changed
  * @old_state: old connector state to compare
diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
index d5ceb7bdc14b..9bed1ccecea0 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.c
+++ b/drivers/gpu/drm/i915/display/intel_connector.c
@@ -282,14 +282,12 @@ void
 intel_attach_hdmi_colorspace_property(struct drm_connector *connector)
 {
 	if (!drm_mode_create_hdmi_colorspace_property(connector))
-		drm_object_attach_property(&connector->base,
-					   connector->colorspace_property, 0);
+		drm_connector_attach_colorspace_property(connector);
 }
 
 void
 intel_attach_dp_colorspace_property(struct drm_connector *connector)
 {
 	if (!drm_mode_create_dp_colorspace_property(connector))
-		drm_object_attach_property(&connector->base,
-					   connector->colorspace_property, 0);
+		drm_connector_attach_colorspace_property(connector);
 }
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 1f51d73ca715..714d1a01c065 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1671,6 +1671,7 @@ int drm_connector_attach_scaling_mode_property(struct drm_connector *connector,
 					       u32 scaling_mode_mask);
 int drm_connector_attach_vrr_capable_property(
 		struct drm_connector *connector);
+int drm_connector_attach_colorspace_property(struct drm_connector *connector);
 int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *connector);
 bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state *old_state,
 					     struct drm_connector_state *new_state);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
