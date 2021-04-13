Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 430FE35DE53
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 14:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BE989E65;
	Tue, 13 Apr 2021 12:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E16B89E14;
 Tue, 13 Apr 2021 12:11:13 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 96B8B58037A;
 Tue, 13 Apr 2021 08:11:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 13 Apr 2021 08:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=cbuXGXgLaupvjIq688HiNFaXJU
 6ajc1vYG74Y5TUPqo=; b=tujpqvXWAeMSn+Iud1rrp39cxnmCwwMYPwb3bM6sfv
 37aw84wL+3GvX9CuXK8+m46Xa0Dx4nhumPBFspq/ug8Wq67qpgyCQTLNUHbQq6n5
 pZ8/6Ue40NZScCZ3Rn9kY70SOaDdWXLfi8abdPtkLGBZ+L7rzrMB16GxMQqrTibm
 0AjDcQ5LTahPNYiUS1xplN1HtQ1IwcYso29V+C0p2LDsMMxlxmI7i/kHpedRXpA+
 AvkobIQfhL4ezySB8D5Vwl5kBDaaeD4bYTUUHp/BsC580g85iOv8d/z6ezQC8SpY
 53quJbjdJrjgroNRqe6k5C7hSQL180qPQpMfcE0grBKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=cbuXGXgLaupvjIq68
 8HiNFaXJU6ajc1vYG74Y5TUPqo=; b=tvv5NuVq4iFFw/HyUJZtE8AzUUC0EfxAz
 Sd3z4qSb6TXq5druZhtnmqLVUWcqvkHvPZJA0dGzjyv2kvYVnBrrcZnLyJVK5dVX
 9+Q7sVV8fiMvRsHPVkess7E9KEAQmCWKODB4jZmnMaOVA+AvUg2cwGY5p3NsAUtD
 oWRchrvoKiZ5+bLyYHYzPU/E6vyfKb4MRao8kwqbQpe6gToiSD9Ur0tlb6ZJ92ax
 HMthUay6g2x0HaW93wh6T05LexrG9B2bsrjoZS+E0jeGA19yU4pw1BfKUZSaN0as
 qA3R3EeAS2rI9MxPwi2d6hfKEMYlbHEqrjJHnqWBoUfDCmBzTHg8w==
X-ME-Sender: <xms:W4p1YABo0yVadzZXjLw4BSySjTRDU-qjkjuDEEUHdQRuqgGS6bp2rA>
 <xme:W4p1YCfJ6FJLy44n7G8l1dammo0XxBqmUb9ltx1xrIF03VadlIbwvK7FGj_ELmAW3
 PcTh_mlshMY-iMYz6c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekledggeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepjeffheduvddvvdelhfegleelfffgieejvdehgfeijedtieeuteejteefueekjeeg
 necukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:W4p1YAel71TL6qfdXAnxyQ7nyjc0NAsrXFNQQmuSFnKhpO8PTagDyA>
 <xmx:W4p1YOh6bG4ktCX6o1FHHVpR7pI3ZWw9af6oTOx2_k9gkGGXw8AMqQ>
 <xmx:W4p1YETOewf2IL2MIRMK-tOOZkgKkX1nQmAeaOcuTLxH__McGF6g4A>
 <xmx:Xop1YHpOybSvxgqLY0oD_aNsO5vuftlYybUhxqY7r2Ex50L2h8kwMQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id EDC6E24005A;
 Tue, 13 Apr 2021 08:11:06 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 1/5] drm/connector: Create a helper to attach the
 hdr_output_metadata property
Date: Tue, 13 Apr 2021 14:11:00 +0200
Message-Id: <20210413121104.375789-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
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

All the drivers that implement HDR output call pretty much the same
function to initialise the hdr_output_metadata property, and while the
creation of that property is in a helper, every driver uses the same
code to attach it.

Provide a helper for it as well

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

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
index 55e39b462a5e..1e22ce718010 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7078,9 +7078,7 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
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
index dda4fa9a1a08..f24bbb840dbf 100644
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
index 7631f76e7f34..a4aa2d87af35 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2150,6 +2150,27 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
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
index 95919d325b0b..f2f1b025e6ba 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2965,8 +2965,7 @@ intel_hdmi_add_properties(struct intel_hdmi *intel_hdmi, struct drm_connector *c
 	drm_connector_attach_content_type_property(connector);
 
 	if (INTEL_GEN(dev_priv) >= 10 || IS_GEMINILAKE(dev_priv))
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
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
