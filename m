Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 663445FDAA6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 15:21:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6462210E8E4;
	Thu, 13 Oct 2022 13:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0812510E8E3;
 Thu, 13 Oct 2022 13:19:41 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1B539580364;
 Thu, 13 Oct 2022 09:19:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 13 Oct 2022 09:19:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665667180; x=
 1665674380; bh=lCDt1M49a8CiNtBMBhMoWVAuAeIGOkWRlKm4jNBPQTg=; b=q
 l9iyxFd5RQAlmEjvfenJGEtflpMzPJSdvFUzppIzEBdbXaW4BvydzsBGVVmEaIJe
 es7UO97YYDwaqk74MFu36IOIPgH9Pj1p66/9B8i4ZqJMyfmRVmf+RG6dYVx+2s4l
 W6sObQx/nRGmSsWwHh7owZS1YAT4ciIS5IwSdAjDllA1/Bzot366jnNqYKqbZsuW
 1n9XEKoDHHf8l0InfrsxE7N5K88uha0VjV6h4ti06+VRYfsbLIa3KLYhiqI/V8+i
 khW5xtWlgGRLYYr9fn1S7JDYnic/Y18DoY08ScWTWHWJlILkWqRU4i0V5ka+lyhy
 yYE7ppD6OC15xNHqMF9JA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665667180; x=
 1665674380; bh=lCDt1M49a8CiNtBMBhMoWVAuAeIGOkWRlKm4jNBPQTg=; b=j
 vFXzc+V7301sAE5bMU29sRo/tx+g4c+XZUkb5KXQ+L71NecqcmvMSAEOWjIEZIcK
 ahSFEO60Jeo8ZKn2ZNiNsF0RRvs5BDRr47YlBUy8ItKOsm7gBgl9VS8cbwajiI9g
 NMIkay5dwtD4q9CAZQBJnZgRzzntkOZXfGggag9z+FARK/MFrUELxiQghW9cK0Qs
 r21Lxvt810rMKgF5tLqBnhJZru36igL0R3y59H8scjk/KoIuYs40Wi5eNNd6RAWr
 8ngLZAbmyw/+wP8uw0jUlN010KQoJ/myeE9hN77df94wXVpd+Nl2RCPzD87kRdCE
 vvd44Rb+WEooh4C2H14Bw==
X-ME-Sender: <xms:axBIY44uCshs7sJaWTGuT__KInuF8q_uctX_I8J8Do_0BYSnVCXkIA>
 <xme:axBIY56CB6mO8XRj_nPZ2FzGLKQCdWTW_UCwIqlwWMZ_dJLvnc0FEBBC0fyXNLoB8
 hYlarnysKSrWuG1WoI>
X-ME-Received: <xmr:axBIY3fplBx2DMYD2pKJxdn7rgFwi5oGmZgZHwly1K290Y3M-aXRpEQsd2AlQ1SjrayK6GI1fTY3PoSOILPJ50G0SRhBGk2G7msx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufgggfgtkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepveejudekteevveefhffhudefkedtgfettefgieejtdffieffheeuhedt
 heeikeeunecuffhomhgrihhnpehmrghrghhinhhsrdhtohhpnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
 vggthh
X-ME-Proxy: <xmx:axBIY9K9v6XxAm-WI0NIn0X2N0VAvnGXGdZmK3rEqlyKBbDQFZcOfQ>
 <xmx:axBIY8JCCi0AczX6b8jstuoJpogRLutbDfdW6g2gtU6j12nlLPrayA>
 <xmx:axBIY-xUF614XkmqpDpNB5T8fIeTm1xxhU_3yjNqnuDUlU4yV6w4zQ>
 <xmx:bBBIYy1U2b1naL3mn7abIeoYCHYOFq6qFHEIjycSZ_eWgy5wQIkVzw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 09:19:39 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 15:19:01 +0200
Subject: [PATCH v5 17/22] drm/atomic-helper: Add an analog TV atomic_check
 implementation
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v5-17-d841cc64fe4b@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
To: Karol Herbst <kherbst@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Maxime Ripard <mripard@kernel.org>, 
 Emma Anholt <emma@anholt.net>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, 
 Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=3959; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=sGOWtwxKEMl09v1mpDrUNJBmLU6YkteMKa52HWyOegk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkeAu4xP8XDzyqsu9z8JVxucd3lo3uLeJx3LjaTXLZM8dTT
 JSyKHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZhIlSbDT8bZghHbF8Uutizg7Vy5nO
 O6JytPf+EJVvFpP3P2Tl5ybC8jw9RNtr9SxU5HhXK6fdIJO97QfuvQb8YHvLWXbmTZ/tppxQkA
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
TV standard property have created some boilerplate that can be be shared
across drivers too.

Let's create an atomic_check helper for those use cases.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 49 +++++++++++++++++++++++++++++++
 include/drm/drm_atomic_state_helper.h     |  3 ++
 2 files changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 0373c3dc824b..e88c57a4f7be 100644
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
+	if ((old_conn_state->tv.margins.left != new_conn_state->tv.margins.left) ||
+	    (old_conn_state->tv.margins.right != new_conn_state->tv.margins.right) ||
+	    (old_conn_state->tv.margins.top != new_conn_state->tv.margins.top) ||
+	    (old_conn_state->tv.margins.bottom != new_conn_state->tv.margins.bottom) ||
+	    (old_conn_state->tv.mode != new_conn_state->tv.mode) ||
+	    (old_conn_state->tv.brightness != new_conn_state->tv.brightness) ||
+	    (old_conn_state->tv.contrast != new_conn_state->tv.contrast) ||
+	    (old_conn_state->tv.flicker_reduction != new_conn_state->tv.flicker_reduction) ||
+	    (old_conn_state->tv.overscan != new_conn_state->tv.overscan) ||
+	    (old_conn_state->tv.saturation != new_conn_state->tv.saturation) ||
+	    (old_conn_state->tv.hue != new_conn_state->tv.hue))
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
b4 0.11.0-dev-7da52
