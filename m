Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFB6C52F3B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 16:18:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9529010E751;
	Wed, 12 Nov 2025 15:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623D410E74F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 15:18:48 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-42b3c965ca9so555715f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 07:18:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762960727; x=1763565527;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=X1KXel6Qy/7m9K4NuS3jmCrDuFbX4pw+8Ecrilun1is=;
 b=RfcDbiWhBTZRYehoa+w367J4A/WVQVy9/AaJ59jOFzM7iFLS8hY8OjlzLFZnHVkPZu
 DTkxhZPHU6E7HO4CFKdTyBekCIktaeawij8oBcHS/QfcWvQi280P4+dS+B7fICDHuCxr
 w4k164IBavW0E5fCnpkvlqxbNQnRDI6IyMlfb/GbMDY4lHXyjyXR9mPNLDId+k6hZF7D
 yk79PPE94R7dntudHggHlJZetprN9CBpFQj7nX9fltDTu66EqE/Ka/jin6E05nIMD4id
 G1O5+TljmluoVU1nLXxsPr9pO0FDZcmlM5mSuAOUUd8bu50nOwhFY8MjE+eKjZBzAKsM
 ujlw==
X-Gm-Message-State: AOJu0YxGTdn47nOscijf7QTS4QRW2P7D0kqpTimlozgFT3W60iRrqE/u
 kK9jxt06KTZySsVIMN71E1aPdvTRLmps0b2bV8CA8NzXqg6MNo7fkNA5g8+Znw==
X-Gm-Gg: ASbGncspaxXAVY+lRJJ5Yj6//lHYyEgtDsc34pfZu3BvsP/qDZX9SQ1jkdY/p1rrHMy
 mh6fOL28NnsJ4Y34ittgRpLMRGLEhATndxPJiENeGsGlrSb0Ksymqt7/V/gFAsNQfy3dkT3fOhn
 CQYYO7D56unrNGdVwLFrkX2oqqL3D+BB6h+QUTUymMUgM7S3Oi87Wo9ngUlQzuCYpUXlxyQdPMf
 FNWo2G/70V0cU2BYP/I+mL0hbIsyEWZbH+ciq24UV5+7JAFUfSViZoHHQ1WJEYOSxr8+x4Yl44d
 Kli/C3K60Z6Un4YMklDrYXWJRh62EiEyFUZT0Tl64Ht4Es+tb3vtcd+/fQHdt5RQpyGb21w3DaN
 O8PeUgZc02NQTeIFcEifhFdGOOZ569RJPhssIQVZDwFsNcY8qG15+jN1EUDS1quJTdp4sRm0of4
 DFxzetEFtfuVnCenQbilQ=
X-Google-Smtp-Source: AGHT+IEExQ41M3pc3vufOuMnv5kj0G3Q1neuAJGL6Bi1ukKfbEtQgZRVJUQ4VEqLNJ0PynCjxn4wVw==
X-Received: by 2002:a05:6000:61e:b0:42b:3ee9:4772 with SMTP id
 ffacd0b85a97d-42b4bdb6744mr2952981f8f.52.1762960726777; 
 Wed, 12 Nov 2025 07:18:46 -0800 (PST)
Received: from xavers-framework.fritz.box ([193.124.138.23])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b32c1ad2bsm23255211f8f.6.2025.11.12.07.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 07:18:46 -0800 (PST)
From: Xaver Hugl <xaver.hugl@kde.org>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, Xaver Hugl <xaver.hugl@kde.org>
Subject: [PATCH 3/3] drm,
 amdgpu: add the "FreeSync HDR Mode" connector property
Date: Wed, 12 Nov 2025 16:18:32 +0100
Message-ID: <20251112151832.77867-3-xaver.hugl@kde.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251112151832.77867-1-xaver.hugl@kde.org>
References: <20251112151832.77867-1-xaver.hugl@kde.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This property allows userspace to make the driver signal the display that it
should switch to FreeSync 2 HDR mode, which uses the native primaries and a
gamma 2.2 transfer function, instead of BT2020 + PQ in the more common HDR
mode.
FreeSync HDR provides the big benefit that display behavior is more
predictable, and the "native" signal doesn't waste any color resolution on
out of bounds colors or luminance values.

The property has two values right now, "Disabled" and "FreeSync 2 Native".
If any other FreeSync HDR modes exist or will be added at some point, they
can be added as new enum values as well.

Signed-off-by: Xaver Hugl <xaver.hugl@kde.org>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 +++++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  1 +
 drivers/gpu/drm/drm_atomic_uapi.c             |  4 ++
 drivers/gpu/drm/drm_connector.c               | 45 +++++++++++++++++++
 include/drm/drm_connector.h                   | 18 ++++++++
 5 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6597fe07e984..82951c53562b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8494,6 +8494,10 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 		if (adev->dm.hdcp_workqueue)
 			drm_connector_attach_content_protection_property(&aconnector->base, true);
 	}
+
+	if (connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
+		drm_connector_attach_freesync_hdr_property(&aconnector->base);
+	}
 }
 
 static int amdgpu_dm_i2c_xfer(struct i2c_adapter *i2c_adap,
@@ -9011,6 +9015,7 @@ static void update_freesync_state_on_stream(
 	bool pack_sdp_v1_3 = false;
 	struct amdgpu_dm_connector *aconn;
 	enum vrr_packet_type packet_type = PACKET_TYPE_VRR;
+	enum color_transfer_func tf = TRANSFER_FUNC_UNKNOWN;
 
 	if (!new_stream)
 		return;
@@ -9066,12 +9071,16 @@ static void update_freesync_state_on_stream(
 							   &new_stream->adaptive_sync_infopacket);
 	}
 
+	if (aconn && aconn->freesync_hdr_mode == FREESYNC_2_HDR_NATIVE) {
+		tf = TRANSFER_FUNC_GAMMA_22;
+	}
+
 	mod_freesync_build_vrr_infopacket(
 		dm->freesync_module,
 		new_stream,
 		&vrr_params,
 		packet_type,
-		TRANSFER_FUNC_UNKNOWN,
+		tf,
 		&vrr_infopacket,
 		pack_sdp_v1_3);
 
@@ -10291,6 +10300,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 		struct dc_stream_update stream_update;
 		struct dc_info_packet hdr_packet;
 		struct dc_stream_status *status = NULL;
+		struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
 		bool abm_changed, hdr_changed, scaling_changed, output_color_space_changed = false;
 
 		memset(&stream_update, 0, sizeof(stream_update));
@@ -10300,6 +10310,8 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 			old_crtc_state = drm_atomic_get_old_crtc_state(state, &acrtc->base);
 		}
 
+		aconnector->freesync_hdr_mode = dm_new_con_state->base.freesync_hdr_mode;
+
 		/* Skip any modesets/resets */
 		if (!acrtc || drm_atomic_crtc_needs_modeset(new_crtc_state))
 			continue;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index b937da0a4e4a..b9b669efc075 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -795,6 +795,7 @@ struct amdgpu_dm_connector {
 	bool pack_sdp_v1_3;
 	enum adaptive_sync_type as_type;
 	struct amdgpu_hdmi_vsdb_info vsdb_info;
+	enum freesync_hdr_mode freesync_hdr_mode;
 };
 
 static inline void amdgpu_dm_set_mst_status(uint8_t *status,
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 85dbdaa4a2e2..c56ca11322c1 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -780,6 +780,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 		state->privacy_screen_sw_state = val;
 	} else if (property == connector->broadcast_rgb_property) {
 		state->hdmi.broadcast_rgb = val;
+	} else if (property == connector->freesync_hdr_property) {
+		state->freesync_hdr_mode = val;
 	} else if (connector->funcs->atomic_set_property) {
 		return connector->funcs->atomic_set_property(connector,
 				state, property, val);
@@ -865,6 +867,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		*val = state->privacy_screen_sw_state;
 	} else if (property == connector->broadcast_rgb_property) {
 		*val = state->hdmi.broadcast_rgb;
+	} else if (property == connector->freesync_hdr_property) {
+		*val = state->freesync_hdr_mode;
 	} else if (connector->funcs->atomic_get_property) {
 		return connector->funcs->atomic_get_property(connector,
 				state, property, val);
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 272d6254ea47..93727992f757 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1802,6 +1802,15 @@ EXPORT_SYMBOL(drm_hdmi_connector_get_output_format_name);
  *
  *	Drivers can set up these properties by calling
  *	drm_mode_create_tv_margin_properties().
+ *
+ * FreeSync HDR Mode:
+ * 	This optional property allows userspace to signal the display to switch
+ * 	into FreeSync 2 HDR mode, which assumes a colorspace with native
+ * 	primaries and a gamma 2.2 transfer function with min and max luminance
+ * 	matching the display.
+ * 	Like with HDR_OUTPUT_METADATA, it is up to userspace to find out which
+ * 	mode the display supports, and which primaries and luminance levels it
+ * 	has to use.
  */
 
 int drm_connector_create_standard_properties(struct drm_device *dev)
@@ -2947,6 +2956,42 @@ bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state *old_sta
 }
 EXPORT_SYMBOL(drm_connector_atomic_hdr_metadata_equal);
 
+static const struct drm_prop_enum_list freesync_hdr_mode_names[] = {
+	{ FREESYNC_HDR_DISABLED, "Disabled" },
+	{ FREESYNC_2_HDR_NATIVE, "FreeSync 2 Native" },
+};
+
+/**
+ * drm_connector_attach_freesync_hdr_property - attach "FreeSync HDR Mode"property
+ * @connector: connector to attach the property on.
+ *
+ * This is used to allow the userspace to enable or disable FreeSync HDR.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_connector_attach_freesync_hdr_property(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_property *prop = connector->freesync_hdr_property;
+	if (!prop) {
+		prop = drm_property_create_enum(dev, DRM_MODE_PROP_ENUM,
+						"FreeSync HDR Mode",
+						freesync_hdr_mode_names,
+						ARRAY_SIZE(freesync_hdr_mode_names));
+		if (!prop)
+			return -EINVAL;
+
+		connector->freesync_hdr_property = prop;
+	}
+
+	drm_object_attach_property(&connector->base, prop,
+				   FREESYNC_HDR_DISABLED);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_attach_freesync_hdr_property);
+
 /**
  * drm_connector_set_vrr_capable_property - sets the variable refresh rate
  * capable property for a connector
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8f34f4b8183d..33e557a2d985 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -462,6 +462,11 @@ enum drm_privacy_screen_status {
 	PRIVACY_SCREEN_ENABLED_LOCKED,
 };
 
+enum freesync_hdr_mode {
+    FREESYNC_HDR_DISABLED = 0,
+    FREESYNC_2_HDR_NATIVE = 1,
+};
+
 /**
  * enum drm_colorspace - color space
  *
@@ -1149,6 +1154,12 @@ struct drm_connector_state {
 	 * @drm_atomic_helper_connector_hdmi_check().
 	 */
 	struct drm_connector_hdmi_state hdmi;
+
+	/**
+	* @freesync_hdr_mode: Connector property to enable
+	* or disable FreeSync HDR
+	*/
+	enum freesync_hdr_mode freesync_hdr_mode;
 };
 
 struct drm_connector_hdmi_audio_funcs {
@@ -2103,6 +2114,12 @@ struct drm_connector {
 	 */
 	struct drm_property *broadcast_rgb_property;
 
+	/**
+	* @freesync_hdr_property: Connector property to enable
+	* or disable FreeSync HDR
+	*/
+	struct drm_property *freesync_hdr_property;
+
 #define DRM_CONNECTOR_POLL_HPD (1 << 0)
 #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
 #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
@@ -2453,6 +2470,7 @@ int drm_connector_attach_colorspace_property(struct drm_connector *connector);
 int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *connector);
 bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state *old_state,
 					     struct drm_connector_state *new_state);
+int drm_connector_attach_freesync_hdr_property(struct drm_connector *connector);
 int drm_mode_create_aspect_ratio_property(struct drm_device *dev);
 int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector,
 					     u32 supported_colorspaces);
-- 
2.51.1

