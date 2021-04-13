Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE02B35DE51
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 14:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7787D89E14;
	Tue, 13 Apr 2021 12:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD2089CF8;
 Tue, 13 Apr 2021 12:11:13 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 286D75803BD;
 Tue, 13 Apr 2021 08:11:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 13 Apr 2021 08:11:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=jsXy1jdTvyPBk
 y72wO0pXL6kMSwKxNji15MVe42lf3E=; b=FZgCMSeSW6Hjiz+SwoqpuCzcqNfwS
 cjcBmWjSMlfTkjJWK5CnrHIPxqjc82Owa8JML2Si6gH7hTl2qbxG2s7h/umjgnsy
 eRUTyjx0ypsugBei1qH4l77bfDuPeE2rYauuRH9u5UoeeWwwruGU2iapFtgYr1RK
 y5d/O091IfMcpvys0LkiGufR7nHkl+LfmyMYmgLSVTtJTDFXJUhadp7Ic2VM/FRg
 CQ/B8AEfDShlw90d+XsdG8K2dRCmAILRJe3bp+g/KdQFssNnOqFpUwWeZK2Zwjky
 1yua4sBHdYtVtSp7gOzjFw3iTlLOaUyFxEmCk/esO/7IRhp+nHCjLmgrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=jsXy1jdTvyPBky72wO0pXL6kMSwKxNji15MVe42lf3E=; b=LXaiIhXh
 dV9ACbMygYkjEaG16QYR2LOzULBo5izpHPx3bPXhofCaR1e9o4Ecw0sJ5hiaAukM
 jkRb+rO+/skaxXHx9/7TgPWadScBrHK7OCPGn0ggDO8Y/skxSpqPTq/fWZjqPVTr
 LWo2WBw9DAnu3WeEgjndmJ4cDN/Kt2XZ3BATZV3DBLB2++32ES1DbZs/XfTAZTPa
 2XS+47KwJ22w2dg3f9/O/Y6L3PklP1sjfGyHYhTeFf7VMEIJlvq054mkRKNVCoDe
 F1abc+80fuP2wmiaCJNTsvT7jrDiib7TuuGW4C7DKmR2NUCWJr4ueullw4eoGkIq
 jMdKoPTMrldHxQ==
X-ME-Sender: <xms:XIp1YAJKY0w7NrNR1oBOE9V6nowJHBgHyCwA-fEjCwb45IGBxbunBA>
 <xme:XIp1YAHQERnD2-_aSv2pDrlqBkwMCotvdBsM5bj2Q2QFNX0BvNh-3iRPSAwmCckGa
 W_aahmZKcyt2X1wjeE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekledggeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XIp1YNlrh-003AlX7h1woHrk_4w1tAtnIoIl7yx4Sg54ponUNhrj2w>
 <xmx:XIp1YFLORClGh2_6OBx8IFVmh1ZP1gEdKO8Iypp9ekys20PkeeImhA>
 <xmx:XIp1YGaOQMI91IBjJiQ6GVegWW8htY8w9EWinfitaCXtKRom6fvqbg>
 <xmx:X4p1YJzHauSRmlqJNMP9_Ej9ud_z-t5y_Q7mbsbHXLw-pNxnrg1u3g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8BE111080063;
 Tue, 13 Apr 2021 08:11:08 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 2/5] drm/connector: Add helper to compare HDR metadata
Date: Tue, 13 Apr 2021 14:11:01 +0200
Message-Id: <20210413121104.375789-2-maxime@cerno.tech>
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

All the drivers that support the HDR metadata property have a similar
function to compare the metadata from one connector state to the next,
and force a mode change if they differ.

All these functions run pretty much the same code, so let's turn it into
an helper that can be shared across those drivers.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v1:
  - Rebased on latest drm-misc-next tag
  - Added the tags
  - Fix build breakage on amdgpu
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 23 ++-------------
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 17 +----------
 drivers/gpu/drm/drm_connector.c               | 28 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_atomic.c   | 13 +--------
 include/drm/drm_connector.h                   |  2 ++
 5 files changed, 34 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 1e22ce718010..ed1972fb531d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5967,25 +5967,6 @@ static int fill_hdr_info_packet(const struct drm_connector_state *state,
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
@@ -6003,7 +5984,7 @@ amdgpu_dm_connector_atomic_check(struct drm_connector *conn,
 	if (!crtc)
 		return 0;
 
-	if (is_hdr_metadata_different(old_con_state, new_con_state)) {
+	if (!drm_connector_atomic_hdr_metadata_equal(old_con_state, new_con_state)) {
 		struct dc_info_packet hdr_infopacket;
 
 		ret = fill_hdr_info_packet(new_con_state, &hdr_infopacket);
@@ -8357,7 +8338,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 			      dm_old_crtc_state->abm_level;
 
 		hdr_changed =
-			is_hdr_metadata_different(old_con_state, new_con_state);
+			!drm_connector_atomic_hdr_metadata_equal(old_con_state, new_con_state);
 
 		if (!scaling_changed && !abm_changed && !hdr_changed)
 			continue;
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
index a4aa2d87af35..b13021b1b128 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2171,6 +2171,34 @@ int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *conn
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
