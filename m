Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D74636F80E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 11:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9687E6E108;
	Fri, 30 Apr 2021 09:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F806E108;
 Fri, 30 Apr 2021 09:44:58 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4ECFF5800D2;
 Fri, 30 Apr 2021 05:44:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 30 Apr 2021 05:44:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=JjDK5rsfeA5jH5e+etU6Pjpkhk
 5S/nK7Bq9hIE+7SHU=; b=G5MH0nX64Vc+BlpsE/u9dRxE1C6dnn3jwLCFHfECQ/
 8XlmOIUFxm+sq5y0KYFfgwJGWctYEA0s6uBf6kXYVWap6VYI2G6Sljm2MdUHyKlA
 u90Yl96iuXZAEoGu9SUGwV137vbEEUSdWbMSpgIZmt4kmXF53UCHB7HFLqQo5JFI
 vIyBaEHMzYjeihmNFweOywkyVF4/6/nMRdhPhGeOTuPxk6S+5SpXYu6GTDdNtmLi
 s1qwyiIlfAwtDZruHg3XdfSwql2CH4J36qRbY8OvjMUGWifFxau/uPARZOoEcerN
 Io7pZgM2EwxLr+6I+aVBlXUAqAj0p9NiNh5hZEPpDmBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JjDK5rsfeA5jH5e+e
 tU6Pjpkhk5S/nK7Bq9hIE+7SHU=; b=UJglAWk0rRtYWZAZLgRbvJx9FnQ5lbdNz
 7KZ4+XVUMTl13prIFGYFNwQ7D4l6fzGCWZJ/g1wxw9K/+ABJh3kRs837G3emdAGQ
 z18MoxjsetTK6C+n9c+ASwDpMmfWyFIhfPjcgA/AecwBNVLrlG8P3xORJDK8dcdJ
 oeZWq5x6/EZM5R01W3uZR+u0ngQ98tDjEAV3zSlAIG7zEpEZ9PUBB8Xdf4dBPPOq
 bNxWAkjLbmAU7O7gKhfJS5jffZdn/YosfBaS8/ZlPSfL5x+JHx5I+Uqd4I3JkliL
 YTuYO0HqMfHC57phBRWaPCCqz46+TBDFOGpjF6RRUyTQ9P0I7cVWw==
X-ME-Sender: <xms:ldGLYLSerNBh-o4lywZ1Cz1VnibcKv7q1hieaV6I45Bvv8AilN8cjQ>
 <xme:ldGLYMxm-52eCYndB86eOsHJsfjNPfZilrHx6amR6PRguSo0jwX-qXn2it_-RM-QW
 -6w9DwfeQMK3vw-040>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddviedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepjeffheduvddvvdelhfegleelfffgieejvdehgfeijedtieeuteejteefueekjeeg
 necukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ldGLYA1l1sXHtFTRftReJWdUVlRraNwZpMqSO3Ovq57YZWtxgj5eog>
 <xmx:ldGLYLAg8o2HANlsMtTTpKzSGWuFGCF66KOCaH7oKVx13iFWUF479g>
 <xmx:ldGLYEjP-fd0CYaW48f0ZBtRIDgbNJwb9tV3OznUDVlVOV-KKCQ8ug>
 <xmx:mdGLYP12KsAXGI3Ms69GBKfN_60GlRVcMsyxxKRuYQCEuZWyJTPqWA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 30 Apr 2021 05:44:53 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 1/5] drm/connector: Create a helper to attach the
 hdr_output_metadata property
Date: Fri, 30 Apr 2021 11:44:47 +0200
Message-Id: <20210430094451.2145002-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
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

All the drivers that implement HDR output call pretty much the same
function to initialise the hdr_output_metadata property, and while the
creation of that property is in a helper, every driver uses the same
code to attach it.

Provide a helper for it as well

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v2:
  - Rebased on current drm-misc-next
  - Fixed a merge conflict with i915

Changes from v1:
  - Rebased on latest drm-misc-next tag
  - Added the tags
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 +---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  3 +--
 drivers/gpu/drm/drm_connector.c               | 21 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  3 +--
 include/drm/drm_connector.h                   |  1 +
 5 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a0c8c41e4e57..c8d7e7dbc05e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7498,9 +7498,7 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 	if (connector_type == DRM_MODE_CONNECTOR_HDMIA ||
 	    connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
 	    connector_type == DRM_MODE_CONNECTOR_eDP) {
-		drm_object_attach_property(
-			&aconnector->base.base,
-			dm->ddev->mode_config.hdr_output_metadata_property, 0);
+		drm_connector_attach_hdr_output_metadata_property(&aconnector->base);
 
 		if (!aconnector->mst_port)
 			drm_connector_attach_vrr_capable_property(&aconnector->base);
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index ae97513ef886..dd7f6eda2ce2 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2492,8 +2492,7 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
 	drm_connector_attach_max_bpc_property(connector, 8, 16);
 
 	if (hdmi->version >= 0x200a && hdmi->plat_data->use_drm_infoframe)
-		drm_object_attach_property(&connector->base,
-			connector->dev->mode_config.hdr_output_metadata_property, 0);
+		drm_connector_attach_hdr_output_metadata_property(connector);
 
 	drm_connector_attach_encoder(connector, hdmi->bridge.encoder);
 
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index eab8c0b82de2..c5e2f642acd9 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2151,6 +2151,27 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_connector_attach_max_bpc_property);
 
+/**
+ * drm_connector_attach_hdr_output_metadata_property - attach "HDR_OUTPUT_METADA" property
+ * @connector: connector to attach the property on.
+ *
+ * This is used to allow the userspace to send HDR Metadata to the
+ * driver.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_property *prop = dev->mode_config.hdr_output_metadata_property;
+
+	drm_object_attach_property(&connector->base, prop, 0);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_attach_hdr_output_metadata_property);
+
 /**
  * drm_connector_set_vrr_capable_property - sets the variable refresh rate
  * capable property for a connector
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 9c172dd6fb5b..3c767bcc47b1 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2459,8 +2459,7 @@ intel_hdmi_add_properties(struct intel_hdmi *intel_hdmi, struct drm_connector *c
 	drm_connector_attach_content_type_property(connector);
 
 	if (DISPLAY_VER(dev_priv) >= 10)
-		drm_object_attach_property(&connector->base,
-			connector->dev->mode_config.hdr_output_metadata_property, 0);
+		drm_connector_attach_hdr_output_metadata_property(connector);
 
 	if (!HAS_GMCH(dev_priv))
 		drm_connector_attach_max_bpc_property(connector, 8, 12);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 1922b278ffad..32172dab8427 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1671,6 +1671,7 @@ int drm_connector_attach_scaling_mode_property(struct drm_connector *connector,
 					       u32 scaling_mode_mask);
 int drm_connector_attach_vrr_capable_property(
 		struct drm_connector *connector);
+int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *connector);
 int drm_mode_create_aspect_ratio_property(struct drm_device *dev);
 int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector);
 int drm_mode_create_dp_colorspace_property(struct drm_connector *connector);
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
