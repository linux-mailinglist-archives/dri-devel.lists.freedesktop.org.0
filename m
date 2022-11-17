Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8122062D705
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 10:31:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C2710E5CF;
	Thu, 17 Nov 2022 09:30:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF6510E5BB;
 Thu, 17 Nov 2022 09:30:00 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 539D42B069CC;
 Thu, 17 Nov 2022 04:29:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 17 Nov 2022 04:29:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668677396; x=
 1668684596; bh=AzFrWXpkO/YQTtwCBAMjigIBYCBhFwfJ9hJM66zkkFY=; b=i
 R2vsqhVmOc0zRvT6Ib6tvpOQsCId69uKrp3gVEXn+ODqFacRSAQGuVFbv2VFPxSG
 IpQcf8kgfQ4xmZ9a4BvTeyDluDMEpKPAZ0gRc4jgIFwHeAHHMsCJ/gzU6dOvg3dg
 BP97YxSo6Pi2B7R6iGcqGWFrdHk/DQRA1VxCoPYjLtFEkASNbuJdxb05gSv6cERv
 Dcjm4i1WtZkgGeGTpcZM58hzqwTmnZFYPDg22CqBAwquf9B6g/nOFCN4x/WmhiEk
 d/TUCe3FxkYI31je1fJ9Z5oVS4ds3OodnNG8d/2IPmNIiQZZFsgflfyjYyGJucjR
 nT4gcqmv3N4O0oNk5n/4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668677396; x=
 1668684596; bh=AzFrWXpkO/YQTtwCBAMjigIBYCBhFwfJ9hJM66zkkFY=; b=I
 1baWYEh/GlW3YBpxeGHX2oTZxVNZHnS9XDzrwra4gQ1RnqxmTW+/d/HHNfrboCs8
 fgTt+Wxse6yGQtKoRujQe/1br9WYeDRjhK2nTp6ayPRGAvWGu79oWtRjZZjc3YqV
 Kjsc+vp6CPVosD/EgET1yJeFdxH5YskCLZmyTyD2bxv3PN5id38i4CVJQYe+cExH
 qo7dp5Qkss3P2i0LusBUEAa6jnQn7P4DYHhx44TGfrmtK0Ps6sAw6J+Y2X4ZRaAC
 8Wp4a1mp+8W6aRMxTLxAK0sCLjw6RB9enJb0AUSGsVEtlwPtELENs53ZUN8aTnbS
 X7HB5rHEVTzNGDtKGV3Aw==
X-ME-Sender: <xms:FP91Y24FWCcW7m5pTRnJ9yH0Zkpm3ZoehXFMa43qTilUefaaDS1lRg>
 <xme:FP91Y_4_uYKpEo8oe00NXQKngiXqqMcGTlIV3LhOz3VjxKYxKZ67LUJKOZWrCNgsQ
 00m4LSvF_HNmotf1SQ>
X-ME-Received: <xmr:FP91Y1fL5lEX8WTj-8qaMb2yeFOBqgmQu8BS9jZMbWplmRrZnS5pMeA6vAkfa2cIohvQThvkRfXtApa8z25dTkQBZICPnfhu5dt-_ZeLDIXrDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevjedukeetveevfefhhfdufeektdfgteetgfeijedtffeiffehueehtdeh
 ieekueenucffohhmrghinhepmhgrrhhgihhnshdrthhophenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
 tghh
X-ME-Proxy: <xmx:FP91YzIqDGWVaNUBJUDOAEbClQpoqNnurcLeQDkoNR8vhaQt8DHpyg>
 <xmx:FP91Y6KncnLxDUOSgE7am60xPudKBNHXA-FgvL4OgFdZKUzQc3Y94A>
 <xmx:FP91Y0yIq0Ov4UW5wit2Cl5cNXe6OLdg8lon_KumOCkRqynNx0S0Aw>
 <xmx:FP91Yw3kiOsnoD8pyn17eDWkwXJYeKEFCVZqkm3FkvMsukZrqeHRjVgf_AA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 04:29:56 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 17 Nov 2022 10:28:57 +0100
Subject: [PATCH v10 14/19] drm/atomic-helper: Add an analog TV atomic_check
 implementation
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v10-14-256dad125326@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
To: Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Emma Anholt <emma@anholt.net>,
 Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=4046; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=g5+SEmHZkrhNtdD34GzRfR0QnKnZmHCMpkB2ja+IeNg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMml/y7cmXRL2y954iTL/dzMt275dDfUsx55P++m046JUq1J
 wkkfOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRRzyMDMtWbqzr+ME93SxBNVTvl9
 i932FvwpM0AtdfXu+6SJ2F8RAjw6Gf4XImjZXNIb+lOhbb3w5bcXjLjdwX+1mEf9gzZr3fwwcA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The analog TV connector drivers share some atomic_check logic, and the new
TV standard property have created some boilerplate that can be shared
across drivers too.

Let's create an atomic_check helper for those use cases.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v10:
- Fix checkpatch warning
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 49 +++++++++++++++++++++++++++++++
 include/drm/drm_atomic_state_helper.h     |  3 ++
 2 files changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index e1fc3f26340a..22251c5f6a8a 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -556,6 +556,55 @@ void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
 
+/**
+ * @drm_atomic_helper_connector_tv_check: Validate an analog TV connector state
+ * @connector: DRM Connector
+ * @state: the DRM State object
+ *
+ * Checks the state object to see if the requested state is valid for an
+ * analog TV connector.
+ *
+ * Returns:
+ * Zero for success, a negative error code on error.
+ */
+int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
+					 struct drm_atomic_state *state)
+{
+	struct drm_connector_state *old_conn_state =
+		drm_atomic_get_old_connector_state(state, connector);
+	struct drm_connector_state *new_conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+
+	crtc = new_conn_state->crtc;
+	if (!crtc)
+		return 0;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	if (!crtc_state)
+		return -EINVAL;
+
+	if (old_conn_state->tv.mode != new_conn_state->tv.mode)
+		crtc_state->mode_changed = true;
+
+	if (old_conn_state->tv.margins.left != new_conn_state->tv.margins.left ||
+	    old_conn_state->tv.margins.right != new_conn_state->tv.margins.right ||
+	    old_conn_state->tv.margins.top != new_conn_state->tv.margins.top ||
+	    old_conn_state->tv.margins.bottom != new_conn_state->tv.margins.bottom ||
+	    old_conn_state->tv.mode != new_conn_state->tv.mode ||
+	    old_conn_state->tv.brightness != new_conn_state->tv.brightness ||
+	    old_conn_state->tv.contrast != new_conn_state->tv.contrast ||
+	    old_conn_state->tv.flicker_reduction != new_conn_state->tv.flicker_reduction ||
+	    old_conn_state->tv.overscan != new_conn_state->tv.overscan ||
+	    old_conn_state->tv.saturation != new_conn_state->tv.saturation ||
+	    old_conn_state->tv.hue != new_conn_state->tv.hue)
+		crtc_state->connectors_changed = true;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_tv_check);
+
 /**
  * __drm_atomic_helper_connector_duplicate_state - copy atomic connector state
  * @connector: connector object
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index c8fbce795ee7..b9740edb2658 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -26,6 +26,7 @@
 
 #include <linux/types.h>
 
+struct drm_atomic_state;
 struct drm_bridge;
 struct drm_bridge_state;
 struct drm_crtc;
@@ -71,6 +72,8 @@ void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
 					 struct drm_connector_state *conn_state);
 void drm_atomic_helper_connector_reset(struct drm_connector *connector);
 void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector);
+int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
+					 struct drm_atomic_state *state);
 void drm_atomic_helper_connector_tv_margins_reset(struct drm_connector *connector);
 void
 __drm_atomic_helper_connector_duplicate_state(struct drm_connector *connector,

-- 
b4 0.11.0-dev-99e3a
