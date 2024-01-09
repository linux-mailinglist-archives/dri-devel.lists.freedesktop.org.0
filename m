Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FE1828F7D
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 23:13:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855DB10E52C;
	Tue,  9 Jan 2024 22:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D3310E4C0
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 18:11:34 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e5508ecb9so616095e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 10:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yngvason.is; s=google; t=1704823893; x=1705428693; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ab6S82YVhL2fQWMl7n/iDflNvLFt/phlZFbHK/9RmUw=;
 b=K28g2QfdMDcMTjFibWYy4vS14Ld8cEvw/fXbFL/qO84S6D4C6gK4be2aKc9yx6yb13
 vCNqvDTdjPGdhYEvo1BNg+PI2Rd1CBiawxCScDjsAsH5YpgYnPVs0BboQrtItbzsQ/E0
 8lHHorWvzHM1Ymq1UuUvxpbp0vlaCSy+HbI8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704823893; x=1705428693;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ab6S82YVhL2fQWMl7n/iDflNvLFt/phlZFbHK/9RmUw=;
 b=SFmwb5/699lXCoJG6wAlUYgL2O5hXFik4lazJL9FfzoaNUugNyERMIe0OJwTTpa5D1
 G5Lr7ixNse5tX2ACtMgpcLvfgiBfpvFuJmVUQxq1H2EuN+rqK9PV2gYE8kbKI5hDWX35
 YEvdpfzrnlHo8E86Ttugu9UGVxchGc0pkcYMxQE6N5fGsgWKs/qunhJbnFycRtGRPaHA
 JVlCejSDLILsOoxWAbVw35A2Weke6ow9Jgm+PPtoDrEK6GLKdm8bVHv23p/z3B74TrRu
 GO1Jk2m2NPQTEI0EtUCilIU6C+Ja+Er4mCBDct5JrSO8A4dokr88GoWkOBeYK8Vdf9MT
 9zjw==
X-Gm-Message-State: AOJu0YyxLRY/fg4b8086L1JcTtboyd5puwk5I7yHj9t7EXjsnY6Qa0Ez
 Y/KXib+geAGxG4xeUWKnvz1pkoiskE6Rtg==
X-Google-Smtp-Source: AGHT+IECX0laRRtfF4jvavSEkKwLcA9a4P5MCiLvTCxN6JaHCGAk1yoL0mgxvPQHa7eWzawwSwZVFQ==
X-Received: by 2002:a05:600c:1c20:b0:40e:53f8:5242 with SMTP id
 j32-20020a05600c1c2000b0040e53f85242mr186194wms.72.1704823893245; 
 Tue, 09 Jan 2024 10:11:33 -0800 (PST)
Received: from andri-workstation.turninn.appdynamic.com
 ([2a01:8280:aa07:ad:7285:c2ff:fef0:4baf])
 by smtp.gmail.com with ESMTPSA id
 n25-20020a05600c3b9900b0040e527602c8sm2104579wms.9.2024.01.09.10.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 10:11:32 -0800 (PST)
From: Andri Yngvason <andri@yngvason.is>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH 3/7] drm/amd/display: Add handling for new "active color
 format" property
Date: Tue,  9 Jan 2024 18:11:00 +0000
Message-ID: <20240109181104.1670304-4-andri@yngvason.is>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109181104.1670304-1-andri@yngvason.is>
References: <20240109181104.1670304-1-andri@yngvason.is>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Jan 2024 22:13:19 +0000
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
Cc: amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Werner Sembach <wse@tuxedocomputers.com>,
 Andri Yngvason <andri@yngvason.is>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Werner Sembach <wse@tuxedocomputers.com>

This commit implements the "active color format" drm property for the AMD
GPU driver.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Andri Yngvason <andri@yngvason.is>
Tested-by: Andri Yngvason <andri@yngvason.is>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 42 ++++++++++++++++++-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  4 ++
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 10e041a3b2545..b44d06c3b1706 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6882,6 +6882,24 @@ int convert_dc_color_depth_into_bpc(enum dc_color_depth display_color_depth)
 	return 0;
 }
 
+static int convert_dc_pixel_encoding_into_drm_color_format(
+	enum dc_pixel_encoding display_pixel_encoding)
+{
+	switch (display_pixel_encoding) {
+	case PIXEL_ENCODING_RGB:
+		return DRM_COLOR_FORMAT_RGB444;
+	case PIXEL_ENCODING_YCBCR422:
+		return DRM_COLOR_FORMAT_YCBCR422;
+	case PIXEL_ENCODING_YCBCR444:
+		return DRM_COLOR_FORMAT_YCBCR444;
+	case PIXEL_ENCODING_YCBCR420:
+		return DRM_COLOR_FORMAT_YCBCR420;
+	default:
+		break;
+	}
+	return 0;
+}
+
 static int dm_encoder_helper_atomic_check(struct drm_encoder *encoder,
 					  struct drm_crtc_state *crtc_state,
 					  struct drm_connector_state *conn_state)
@@ -7436,8 +7454,10 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 				adev->mode_info.underscan_vborder_property,
 				0);
 
-	if (!aconnector->mst_root)
+	if (!aconnector->mst_root) {
 		drm_connector_attach_max_bpc_property(&aconnector->base, 8, 16);
+		drm_connector_attach_active_color_format_property(&aconnector->base);
+	}
 
 	aconnector->base.state->max_bpc = 16;
 	aconnector->base.state->max_requested_bpc = aconnector->base.state->max_bpc;
@@ -8969,6 +8989,26 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 		kfree(dummy_updates);
 	}
 
+	/* Extract information from crtc to communicate it to userspace as connector properties */
+	for_each_new_connector_in_state(state, connector, new_con_state, i) {
+		struct drm_crtc *crtc = new_con_state->crtc;
+		struct dc_stream_state *stream;
+
+		if (crtc) {
+			new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+			dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
+			stream = dm_new_crtc_state->stream;
+
+			if (stream) {
+				drm_connector_set_active_color_format_property(connector,
+					convert_dc_pixel_encoding_into_drm_color_format(
+						dm_new_crtc_state->stream->timing.pixel_encoding));
+			}
+		} else {
+			drm_connector_set_active_color_format_property(connector, 0);
+		}
+	}
+
 	/**
 	 * Enable interrupts for CRTCs that are newly enabled or went through
 	 * a modeset. It was intentionally deferred until after the front end
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 11da0eebee6c4..a4d1b3ea8f81c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -600,6 +600,10 @@ dm_dp_add_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
 	if (connector->max_bpc_property)
 		drm_connector_attach_max_bpc_property(connector, 8, 16);
 
+	connector->active_color_format_property = master->base.active_color_format_property;
+	if (connector->active_color_format_property)
+		drm_connector_attach_active_color_format_property(&aconnector->base);
+
 	connector->vrr_capable_property = master->base.vrr_capable_property;
 	if (connector->vrr_capable_property)
 		drm_connector_attach_vrr_capable_property(connector);
-- 
2.43.0

