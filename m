Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5AF341D50
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 13:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150106E9AD;
	Fri, 19 Mar 2021 12:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9D36E9AD;
 Fri, 19 Mar 2021 12:49:31 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id A55F8580984;
 Fri, 19 Mar 2021 08:49:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 19 Mar 2021 08:49:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=c847Pq0vLWucL
 jucHu8bhUQZoFlP9PYipIboZySW8YA=; b=jWAF4kTuTgo9rWxNz0xBUXd9WaFz8
 US6xn4N+2+CsTPCV9x69muVZFfTcq7aRNhmLRqnNraSvUqpZ0WM5mdYD10qEnuHw
 2OAspz2/UqTroCCOOft0vzbdnnfs0zcEEEaYijueqwPT+7NQs+qFc1ukpBRkllFT
 /z1G7bqPz6rM16oZjXkc7tJRSASN0n2VmOrPpwkVT81xdfqWJwkx6x04lVKIEf/R
 r4T+wCwounq77YYrqLuKi4w1DQbcHW6qqpBWJQPl2AG8b87q5D5JxsAUH4n7w7a/
 AmWAQcHDjoCjlnJp55fKi/TgiUPkNJoisIxrzsAtzFYW2OOjx5cwqF70A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=c847Pq0vLWucLjucHu8bhUQZoFlP9PYipIboZySW8YA=; b=YdYHB386
 HJVB70an0FuXVvwJZtdvCaNCdSzf+74bTxqXKdE1fNrIzJkvZWiu2yZrkm6YO3rF
 RIbt/9mfDjxv4DZ/s7cJvKlauCC8el2baAcXH2ErU8CG+HzVJc+GqtkPio8kh6QQ
 3GMeMgZIb6M3YI7Qr9x9KQOropYoKzF3dNzsYFq2rBma13r3N7vlJ8udN24xafse
 WVObDt9pcVjhDtblZkNorI5JRIcH8SJpA5cQutFwOHjIjLHc3R3BuBFosMseO1mq
 dXoW6CUmnwwJT0Z3P+utCyYVmtHP5O+HlVlIRCVN/EVBNPPhI4kGvWz96/Z1i/WJ
 47PP7QJSu7I7Rw==
X-ME-Sender: <xms:2J1UYCwzEtSGD3w1K0dZ_OikURIbegaYlyvsXDZWCthc5ahkEF1CmA>
 <xme:2J1UYORtP0LkOFbVatpNvaBKMCAr2IYZWkRj7KDD_v5p4_WY7qPX4nD2YLUwUQUj7
 VlabIe9ATKa0j_mlf0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefkedggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:2J1UYEX6TC-F-ghrJ8__Tt30uu70Mzhv_wkiEde8isQ55lKdibwMMg>
 <xmx:2J1UYIj5Hx_XuM_nwB1XMXBpYaTIaDPLr6xaVdaOx0_N4Zy4oiuFKg>
 <xmx:2J1UYEAzcTCUwN066K2x4wtxXlpj9xZO9hZENd_SIwFtG1ZB2viagw>
 <xmx:2Z1UYHbj4q9z_ShIeZvwiBBNaiWpnAFJ196cwHiTi3uqauSbAkSrwQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 244761080054;
 Fri, 19 Mar 2021 08:49:28 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 2/3] drm/connector: Add helper to compare HDR metadata
Date: Fri, 19 Mar 2021 13:49:21 +0100
Message-Id: <20210319124922.144726-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210319124922.144726-1-maxime@cerno.tech>
References: <20210319124922.144726-1-maxime@cerno.tech>
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
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All the drivers that support the HDR metadata property have a similar
function to compare the metadata from one connector state to the next,
and force a mode change if they differ.

All these functions run pretty much the same code, so let's turn it into
an helper that can be shared across those drivers.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 21 +-------------
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 17 +----------
 drivers/gpu/drm/drm_connector.c               | 28 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_atomic.c   | 13 +--------
 include/drm/drm_connector.h                   |  2 ++
 5 files changed, 33 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 06908a3cee0f..4eb5201e566a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5924,25 +5924,6 @@ static int fill_hdr_info_packet(const struct drm_connector_state *state,
 	return 0;
 }
 
-static bool
-is_hdr_metadata_different(const struct drm_connector_state *old_state,
-			  const struct drm_connector_state *new_state)
-{
-	struct drm_property_blob *old_blob = old_state->hdr_output_metadata;
-	struct drm_property_blob *new_blob = new_state->hdr_output_metadata;
-
-	if (old_blob != new_blob) {
-		if (old_blob && new_blob &&
-		    old_blob->length == new_blob->length)
-			return memcmp(old_blob->data, new_blob->data,
-				      old_blob->length);
-
-		return true;
-	}
-
-	return false;
-}
-
 static int
 amdgpu_dm_connector_atomic_check(struct drm_connector *conn,
 				 struct drm_atomic_state *state)
@@ -5960,7 +5941,7 @@ amdgpu_dm_connector_atomic_check(struct drm_connector *conn,
 	if (!crtc)
 		return 0;
 
-	if (is_hdr_metadata_different(old_con_state, new_con_state)) {
+	if (!drm_connector_atomic_hdr_metadata_equal(old_con_state, new_con_state)) {
 		struct dc_info_packet hdr_infopacket;
 
 		ret = fill_hdr_info_packet(new_con_state, &hdr_infopacket);
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index f24bbb840dbf..f871e33c2fc9 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2395,21 +2395,6 @@ static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
 	return ret;
 }
 
-static bool hdr_metadata_equal(const struct drm_connector_state *old_state,
-			       const struct drm_connector_state *new_state)
-{
-	struct drm_property_blob *old_blob = old_state->hdr_output_metadata;
-	struct drm_property_blob *new_blob = new_state->hdr_output_metadata;
-
-	if (!old_blob || !new_blob)
-		return old_blob == new_blob;
-
-	if (old_blob->length != new_blob->length)
-		return false;
-
-	return !memcmp(old_blob->data, new_blob->data, old_blob->length);
-}
-
 static int dw_hdmi_connector_atomic_check(struct drm_connector *connector,
 					  struct drm_atomic_state *state)
 {
@@ -2423,7 +2408,7 @@ static int dw_hdmi_connector_atomic_check(struct drm_connector *connector,
 	if (!crtc)
 		return 0;
 
-	if (!hdr_metadata_equal(old_state, new_state)) {
+	if (!drm_connector_atomic_hdr_metadata_equal(old_state, new_state)) {
 		crtc_state = drm_atomic_get_crtc_state(state, crtc);
 		if (IS_ERR(crtc_state))
 			return PTR_ERR(crtc_state);
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index e25248e23e18..d781a3a1e9bf 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2170,6 +2170,34 @@ int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *conn
 }
 EXPORT_SYMBOL(drm_connector_attach_hdr_output_metadata_property);
 
+/**
+ * drm_connector_atomic_hdr_metadata_equal - checks if the hdr metadata changed
+ * @old_state: old connector state to compare
+ * @new_state: new connector state to compare
+ *
+ * This is used by HDR-enabled drivers to test whether the HDR metadata
+ * have changed between two different connector state (and thus probably
+ * requires a full blown mode change).
+ *
+ * Returns:
+ * True if the metadata are equal, False otherwise
+ */
+bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state *old_state,
+					     struct drm_connector_state *new_state)
+{
+	struct drm_property_blob *old_blob = old_state->hdr_output_metadata;
+	struct drm_property_blob *new_blob = new_state->hdr_output_metadata;
+
+	if (!old_blob || !new_blob)
+		return old_blob == new_blob;
+
+	if (old_blob->length != new_blob->length)
+		return false;
+
+	return !memcmp(old_blob->data, new_blob->data, old_blob->length);
+}
+EXPORT_SYMBOL(drm_connector_atomic_hdr_metadata_equal);
+
 /**
  * drm_connector_set_vrr_capable_property - sets the variable refresh rate
  * capable property for a connector
diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index e00fdc47c0eb..efec9454af5a 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -109,16 +109,6 @@ int intel_digital_connector_atomic_set_property(struct drm_connector *connector,
 	return -EINVAL;
 }
 
-static bool blob_equal(const struct drm_property_blob *a,
-		       const struct drm_property_blob *b)
-{
-	if (a && b)
-		return a->length == b->length &&
-			!memcmp(a->data, b->data, a->length);
-
-	return !a == !b;
-}
-
 int intel_digital_connector_atomic_check(struct drm_connector *conn,
 					 struct drm_atomic_state *state)
 {
@@ -149,8 +139,7 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
 	    new_conn_state->base.picture_aspect_ratio != old_conn_state->base.picture_aspect_ratio ||
 	    new_conn_state->base.content_type != old_conn_state->base.content_type ||
 	    new_conn_state->base.scaling_mode != old_conn_state->base.scaling_mode ||
-	    !blob_equal(new_conn_state->base.hdr_output_metadata,
-			old_conn_state->base.hdr_output_metadata))
+	    !drm_connector_atomic_hdr_metadata_equal(old_state, new_state))
 		crtc_state->mode_changed = true;
 
 	return 0;
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 32172dab8427..1f51d73ca715 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1672,6 +1672,8 @@ int drm_connector_attach_scaling_mode_property(struct drm_connector *connector,
 int drm_connector_attach_vrr_capable_property(
 		struct drm_connector *connector);
 int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *connector);
+bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state *old_state,
+					     struct drm_connector_state *new_state);
 int drm_mode_create_aspect_ratio_property(struct drm_device *dev);
 int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector);
 int drm_mode_create_dp_colorspace_property(struct drm_connector *connector);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
