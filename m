Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8102F341D54
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 13:49:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02116E9D6;
	Fri, 19 Mar 2021 12:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4696E9C9;
 Fri, 19 Mar 2021 12:49:31 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id BD388580975;
 Fri, 19 Mar 2021 08:49:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 19 Mar 2021 08:49:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=Ri9dccbfUpY1St2b6r2No3XwoI
 OIFcIlzR1DkG8WYwA=; b=PJhCPVJknm7YB3N0vhUgJhdTexNmPn9v2AbI+vbqq7
 UNsDC1piMcDrvNYDzHX4LBfD5mKJ2+aqOrR7EeFPGzBpQoODgPB24kekD5J4e+p1
 vEm/v1u/rl4rzsoMbOjysD2dqsivrrmPc8Yf/Kd/muLZDK8nSwRovLOp4BZr4HvY
 PDaqtrnkYY+D2YPRYHzt3EqVlQKeYvQsokw+pCp30gh565n7Rkeul036hStHDgZ+
 9HKqlv9QbpaQANTWLi7gpu5tt01gRnNvt7CpbTPneTvuyFE2Xxx8ieSRIApx+P7y
 iahnjEgb5tSYydVX/MxxCPNZsnd/2loEXhVKPldfoK1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Ri9dccbfUpY1St2b6
 r2No3XwoIOIFcIlzR1DkG8WYwA=; b=YYM3n2AFxGK6Jey95SPGXSLzv6J22G4LC
 w3wTr++FkF40tyVPkrl4EXYebFv5zb+4/aw8C+G3Yoa4HtD7lID5kmk7a4ohf7Ej
 nO5T64bIqBvqM3mIa8dB6ySfVZZ+jLO+KC9FIM0E3OsfQqEgYjlOa6IxpMjgf1n+
 69kGeKvGguPWStboP2EyY+qPrpErtX7j9vCS8n4i8nlSkhNXRVZsn7DJxrteieSK
 CfzjTvlMGxxirpTqK9xct2v2tBthLa4ZDCsCF2ik+yuAn5iJgBOwXsJ8KL7Ec8rN
 lFZDvq/rB4TiS2GNwSWJJqqQPyiyBwrvH+/fs1OowEaTugKS1Nv5A==
X-ME-Sender: <xms:1Z1UYL_IfSLUtsbJQD-Ju1UqhiddiSEtjXfnRpa2Z0uc2BZcGJTlBw>
 <xme:1Z1UYBJJPxGz07deGpd8t08M4z7sM2aL0cnG5J9T9k3tZyKgLmMOAIB3dpjRf0V4Q
 P5ZtM7jPUCjlfJILRc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefkedggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepjeffheduvddvvdelhfegleelfffgieejvdehgfeijedtieeuteejteefueekjeeg
 necukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1p1UYImWxnpqbilYwpefWBeFUWOS5luku2MO1iqqIMg1OI7xCvOeFw>
 <xmx:1p1UYNNBBM74Ire9u3bVpwEnt7RPQDM4iriTHPSOcg0V7QraFp02Gw>
 <xmx:1p1UYG1_pE6A5hSODITOcJvwXxCPjrTcmTSn2Vm_2ZDZxKWKW-Zqdg>
 <xmx:2J1UYPBGHoRSKBYWP9NO5eOXOk5Rji0mBpRMIM56N4H3dasgmYZ1_A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 98296240068;
 Fri, 19 Mar 2021 08:49:25 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 1/3] drm/connector: Create a helper to attach the
 hdr_output_metadata property
Date: Fri, 19 Mar 2021 13:49:20 +0100
Message-Id: <20210319124922.144726-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 +---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  3 +--
 drivers/gpu/drm/drm_connector.c               | 21 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  3 +--
 include/drm/drm_connector.h                   |  1 +
 5 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 22124f76d0b5..06908a3cee0f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7017,9 +7017,7 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
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
index 98b6ec45ef96..e25248e23e18 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2149,6 +2149,27 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
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
index c5959590562b..52c051efb7b7 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2958,8 +2958,7 @@ intel_hdmi_add_properties(struct intel_hdmi *intel_hdmi, struct drm_connector *c
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
