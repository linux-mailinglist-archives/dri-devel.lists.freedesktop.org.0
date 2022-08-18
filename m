Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F70598426
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 15:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D19B9B42;
	Thu, 18 Aug 2022 13:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50F191F8D;
 Thu, 18 Aug 2022 13:28:12 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4M7m0q5Dl9zDrld;
 Thu, 18 Aug 2022 13:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1660829292; bh=zaUGBMbIeblCA6LFLVRPpXMwvonXUCHOihqI8qvG8vY=;
 h=From:To:Cc:Subject:Date:From;
 b=BSBw4cAtqDK2BT5dBjNPVPXWnuHWNwok2RUjVSqg5SdiJUXdSt6QgLoTDmf8BheEm
 XPrdJ114rJ0cUt1x9GjEH8sWT/q5zyaerUfYIEeJy/OAA0KO3F+ZOLOuQTqML2GLHE
 sgORapu82b7qyTQdnNYYZ+J5HGFC6n1g4u4ZYVt4=
X-Riseup-User-ID: 453481205A61EBE5699C24A1AB7E334277963DE2B8DC79F4735518125DEB5B2E
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4M7m0j108Dz20cW;
 Thu, 18 Aug 2022 13:28:04 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amd/display: Include missing header
Date: Thu, 18 Aug 2022 10:27:30 -0300
Message-Id: <20220818132730.399334-1-mairacanal@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: kernel test robot <lkp@intel.com>, Magali Lemes <magalilemes00@gmail.com>,
 tales.aparecida@gmail.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org, isabbasso@riseup.net, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The file amdgpu_dm_plane.c missed the header amdgpu_dm_plane.h, which
resulted on the following warning:

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:1046:5:
warning: no previous prototype for 'fill_dc_scaling_info'
[-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:1222:6:
warning: no previous prototype for 'handle_cursor_update'
[-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:152:6:
warning: no previous prototype for 'modifier_has_dcc'
[-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:1576:5:
warning: no previous prototype for 'amdgpu_dm_plane_init'
[-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:157:10:
warning: no previous prototype for 'modifier_gfx9_swizzle_mode'
[-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:752:5:
warning: no previous prototype for 'fill_plane_buffer_attributes'
[-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:83:31:
warning: no previous prototype for 'amd_get_format_info'
[-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:88:6:
warning: no previous prototype for 'fill_blending_from_plane_state'
[-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:992:5:
warning: no previous prototype for 'dm_plane_helper_check_state'
[-Wmissing-prototypes]

Therefore, include the missing header on the file and turn global functions
that are not used outside of the file into static functions.

Fixes: 5d945cbcd4b1 ("drm/amd/display: Create a file dedicated to planes")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 5 +++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h | 8 --------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index b841b8b0a9d8..e022be4df290 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -34,6 +34,7 @@
 #include "dal_asic_id.h"
 #include "amdgpu_display.h"
 #include "amdgpu_dm_trace.h"
+#include "amdgpu_dm_plane.h"
 #include "gc/gc_11_0_0_offset.h"
 #include "gc/gc_11_0_0_sh_mask.h"
 
@@ -149,12 +150,12 @@ static void add_modifier(uint64_t **mods, uint64_t *size, uint64_t *cap, uint64_
 	*size += 1;
 }
 
-bool modifier_has_dcc(uint64_t modifier)
+static bool modifier_has_dcc(uint64_t modifier)
 {
 	return IS_AMD_FMT_MOD(modifier) && AMD_FMT_MOD_GET(DCC, modifier);
 }
 
-unsigned modifier_gfx9_swizzle_mode(uint64_t modifier)
+static unsigned modifier_gfx9_swizzle_mode(uint64_t modifier)
 {
 	if (modifier == DRM_FORMAT_MOD_LINEAR)
 		return 0;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
index 95168c2cfa6f..286981a2dd40 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
@@ -36,17 +36,9 @@ int fill_dc_scaling_info(struct amdgpu_device *adev,
 			 const struct drm_plane_state *state,
 			 struct dc_scaling_info *scaling_info);
 
-void get_min_max_dc_plane_scaling(struct drm_device *dev,
-				  struct drm_framebuffer *fb,
-				  int *min_downscale, int *max_upscale);
-
 int dm_plane_helper_check_state(struct drm_plane_state *state,
 				struct drm_crtc_state *new_crtc_state);
 
-bool modifier_has_dcc(uint64_t modifier);
-
-unsigned int modifier_gfx9_swizzle_mode(uint64_t modifier);
-
 int fill_plane_buffer_attributes(struct amdgpu_device *adev,
 				 const struct amdgpu_framebuffer *afb,
 				 const enum surface_pixel_format format,
-- 
2.37.2

