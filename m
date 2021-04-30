Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6085036F811
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 11:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE746E12A;
	Fri, 30 Apr 2021 09:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE5B6E12A;
 Fri, 30 Apr 2021 09:45:02 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id B437C5800D2;
 Fri, 30 Apr 2021 05:45:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Fri, 30 Apr 2021 05:45:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=eN39p5vJIbDjb
 RQbd/mDCmrw3PQfz6DlV2YEYmhqxaI=; b=iYkebr/qoDHsczTDn+mKPJtqKwIg3
 MDSuR848zw4nfrxmB3JYG1TWF6xMqSQt+bKHVhnRj6K4nNurQMp1wuitRtUkcxzT
 Oy94mnfGZW8lnqlRGdO4VlFaSGNABUOu43TTD/pvhItGU38jCrsDfYvC+jKDVwOz
 CHDgZakNfVS9wAsQ6ec/x6wgIANgN/TXi4rSwg4s83nAHBYrd8UwOxnv7AY4d6J3
 wRLQxH2lQfRcmrMrdWGcqyR6AYeHyB2JQrMNaL6oFesuBhkK20iTlVYAPB/LjsXP
 9l02Woi4dB0W6i45+HaWny9roLsxwCTRXblUl1Q22WnjhwDfJvJsEEVjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=eN39p5vJIbDjbRQbd/mDCmrw3PQfz6DlV2YEYmhqxaI=; b=L6IL6WXH
 RBCbidMFBS4n/IyJMSMIJGmXgFYEF8xZz9NBWwWpu/a9uIYASuayQcxlUiz8Dg4z
 QIobWLDCKHaVdACcwl4l5Hvhhl5gbfkJXFJlCUk0Lms9nOI+y5d2NLGkuQ2vE1xO
 xXIXZ+dKkcffwuLxUtXOOQjRuRyDFbYQnBSiR1g9r+WRLoMSzQDdKGq9LFr2hcar
 xznW9bXrA9EqlJOzPWF6KitjMqWWQIhzsdlk8t6hFszbCr5ATA28ml+OUvptDOJv
 aIV81J0RlC+isHv7V0aVZrIMMuCcjVQUw93Sb/mzbspfkrWPpRGilKGs71qhf0X7
 9kl6JiSUHxzqlw==
X-ME-Sender: <xms:m9GLYP_g0waDU8hZjrPsPs52N3GIDY1Ojc3DrgcPponO1I23VPZyhg>
 <xme:m9GLYLsCZhlZLQ3RFSIiBQrvi7-FiVXl5jtTJQ_teDJ32ImYOV97cw3Dk_2GbzbyN
 1_IhNlHaeDuz95NV5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddviedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:m9GLYNCDpxwVkvKX3WXprhd_CbtdbwVB3nzHSJBgv6vHgNm0kvlGOQ>
 <xmx:m9GLYLdrY9zS0JArdzOXD0leT64ZB7bKt_4MrVw_R80lWcbQilS7Tw>
 <xmx:m9GLYEMLE2SuamLzhqr-eWmXDF2D7um1UH52SjQFIDkTd5v7Oz2cYg>
 <xmx:ndGLYHhM8MbzOXuq8ZjHEdvZfKGf0__hAeuOyESuNZmxyUJxmANbHA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 30 Apr 2021 05:44:59 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 2/5] drm/connector: Add helper to compare HDR metadata
Date: Fri, 30 Apr 2021 11:44:48 +0200
Message-Id: <20210430094451.2145002-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430094451.2145002-1-maxime@cerno.tech>
References: <20210430094451.2145002-1-maxime@cerno.tech>
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
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, amd-gfx@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Dom Cobley <dom@raspberrypi.com>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
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

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v2:
  - Rebased on current drm-misc-next

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
index c8d7e7dbc05e..296704ce3768 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6275,25 +6275,6 @@ static int fill_hdr_info_packet(const struct drm_connector_state *state,
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
@@ -6311,7 +6292,7 @@ amdgpu_dm_connector_atomic_check(struct drm_connector *conn,
 	if (!crtc)
 		return 0;
 
-	if (is_hdr_metadata_different(old_con_state, new_con_state)) {
+	if (!drm_connector_atomic_hdr_metadata_equal(old_con_state, new_con_state)) {
 		struct dc_info_packet hdr_infopacket;
 
 		ret = fill_hdr_info_packet(new_con_state, &hdr_infopacket);
@@ -8803,7 +8784,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 			      dm_old_crtc_state->abm_level;
 
 		hdr_changed =
-			is_hdr_metadata_different(old_con_state, new_con_state);
+			!drm_connector_atomic_hdr_metadata_equal(old_con_state, new_con_state);
 
 		if (!scaling_changed && !abm_changed && !hdr_changed)
 			continue;
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index dd7f6eda2ce2..e7c7c9b9c646 100644
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
index c5e2f642acd9..eed9cd05c94e 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2172,6 +2172,34 @@ int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *conn
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
index 4fa389fce8cb..084da7a76b1c 100644
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
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
