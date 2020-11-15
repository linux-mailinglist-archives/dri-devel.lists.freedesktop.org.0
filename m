Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4812C2B35C4
	for <lists+dri-devel@lfdr.de>; Sun, 15 Nov 2020 16:32:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206E96E99A;
	Sun, 15 Nov 2020 15:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671026E98A;
 Sun, 15 Nov 2020 15:32:04 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23000080-1500050 
 for multiple; Sun, 15 Nov 2020 15:31:38 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] Revert "drm: convert drm_atomic_uapi.c to new debug helpers"
Date: Sun, 15 Nov 2020 15:31:39 +0000
Message-Id: <20201115153139.24369-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Total wipeout in boot!

<7>[    3.739908] i915 0000:00:02.0: [drm:__drm_fb_helper_initial_config_and_unlock] test CRTC 0 primary plane
<7>[    3.739916] i915 0000:00:02.0: [drm:__drm_fb_helper_initial_config_and_unlock] test CRTC 1 primary plane
9] Hardware name: Hewlett-Packard HP Pro 3500 Series/2ABF, BIOS 8.11 10/24/2012
<4>[    3.754904] Workqueue: events_unbound async_run_entry_fn
<4>[    3.754908] RIP: 0010:drm_atomic_set_crtc_for_connector+0xe0/0x120
<4>[    3.754910] Code: 24 28 be 10 00 00 00 48 c7 c2 60 b0 38 82 48 8b 78 18 ff 75 20 8b 85 d8 00 00 00 50 e8 89 45 ff ff 58 31 c0 5a 5b 5d 41 5c c3 <48> 8b 04 25 00 00 00 00 41 8b 4c 24 28 49 89 d9 be 10 00 00 00 4d
<4>[    3.754911] RSP: 0018:ffffc900002bfa48 EFLAGS: 00010246
<4>[    3.754912] RAX: 0000000000000005 RBX: ffff88800ff1a318 RCX: 0000000000000005
<4>[    3.754913] RDX: ffffffff816d04f0 RSI: ffffffff82388e71 RDI: ffff88800fc51038
<4>[    3.754914] RBP: 0000000000000000 R08: ffff88810414dc10 R09: 00000000fffffffe
<4>[    3.754915] R10: 00000000682c1dc7 R11: 0000000024f563d5 R12: ffff88800fc51000
<4>[    3.754916] R13: 0000000000000000 R14: ffff88800ff1a318 R15: ffff88801aab9a00
<4>[    3.754918] FS:  0000000000000000(0000) GS:ffff88811b480000(0000) knlGS:0000000000000000
c9/0x130
<4>[    3.755084]  do_bind_con_driver+0x1e5/0x2d0
<4>[    3.755087]  do_take_over_console+0x10e/0x180
<4>[    3.755089]  do_fbcon_takeover+0x53/0xb0
<4>[    3.755092]  register_framebuffer+0x22d/0x310
<4>[    3.755095]  __drm_fb_helper_initial_config_and_unlock+0x35d/0x530
<4>[    3.755190]  intel_fbdev_initial_config+0xf/0x20 [i915]
<4>[    3.755192]  async_run_entry_fn+0x34/0x160
<4>[    3.755195]  process_one_work+0x270/0x5c0
<4>[    3.755199]  worker_thread+0x37/0x380
<4>[    3.755201]  ? process_one_work+0x5c0/0x5c0
<4>[    3.755203]  kthread+0x146/0x170
<4>[    3.755205]  ? kthread_park+0x80/0x80
<4>[    3.755208]  ret_from_fork+0x22/0x30
<4>[    3.755211] Modules linked in: i915 mei_hdcp x86_pkg_temp_thermal coretemp crct10dif_pclmul crc32_pclmul ghash_clmulni_intel snd_hda_intel snd_intel_dspcfg snd_hda_codec r8169 snd_hwdep snd_hda_core realtek mei_me snd_pcm mei lpc_ich prime_numbers
<4>[    3.755224] CR2: 0000000000000000
<4>[    3.755226] ---[ end trace df071a2078bd01b3 ]---

Fixes: e3aae683e861 ("drm: convert drm_atomic_uapi.c to new debug helpers")
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 113 +++++++++++++-----------------
 1 file changed, 47 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 9df7f2a170e3..d26077ed518a 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -85,15 +85,13 @@ int drm_atomic_set_mode_for_crtc(struct drm_crtc_state *state,
 
 		drm_mode_copy(&state->mode, mode);
 		state->enable = true;
-		drm_dbg_atomic(crtc->dev,
-			       "Set [MODE:%s] for [CRTC:%d:%s] state %p\n",
-			       mode->name, crtc->base.id, crtc->name, state);
+		DRM_DEBUG_ATOMIC("Set [MODE:%s] for [CRTC:%d:%s] state %p\n",
+				 mode->name, crtc->base.id, crtc->name, state);
 	} else {
 		memset(&state->mode, 0, sizeof(state->mode));
 		state->enable = false;
-		drm_dbg_atomic(crtc->dev,
-			       "Set [NOMODE] for [CRTC:%d:%s] state %p\n",
-			       crtc->base.id, crtc->name, state);
+		DRM_DEBUG_ATOMIC("Set [NOMODE] for [CRTC:%d:%s] state %p\n",
+				 crtc->base.id, crtc->name, state);
 	}
 
 	return 0;
@@ -130,35 +128,31 @@ int drm_atomic_set_mode_prop_for_crtc(struct drm_crtc_state *state,
 		int ret;
 
 		if (blob->length != sizeof(struct drm_mode_modeinfo)) {
-			drm_dbg_atomic(crtc->dev,
-				       "[CRTC:%d:%s] bad mode blob length: %zu\n",
-				       crtc->base.id, crtc->name,
-				       blob->length);
+			DRM_DEBUG_ATOMIC("[CRTC:%d:%s] bad mode blob length: %zu\n",
+					 crtc->base.id, crtc->name,
+					 blob->length);
 			return -EINVAL;
 		}
 
 		ret = drm_mode_convert_umode(crtc->dev,
 					     &state->mode, blob->data);
 		if (ret) {
-			drm_dbg_atomic(crtc->dev,
-				       "[CRTC:%d:%s] invalid mode (ret=%d, status=%s):\n",
-				       crtc->base.id, crtc->name,
-				       ret, drm_get_mode_status_name(state->mode.status));
+			DRM_DEBUG_ATOMIC("[CRTC:%d:%s] invalid mode (ret=%d, status=%s):\n",
+					 crtc->base.id, crtc->name,
+					 ret, drm_get_mode_status_name(state->mode.status));
 			drm_mode_debug_printmodeline(&state->mode);
 			return -EINVAL;
 		}
 
 		state->mode_blob = drm_property_blob_get(blob);
 		state->enable = true;
-		drm_dbg_atomic(crtc->dev,
-			       "Set [MODE:%s] for [CRTC:%d:%s] state %p\n",
-			       state->mode.name, crtc->base.id, crtc->name,
-			       state);
+		DRM_DEBUG_ATOMIC("Set [MODE:%s] for [CRTC:%d:%s] state %p\n",
+				 state->mode.name, crtc->base.id, crtc->name,
+				 state);
 	} else {
 		state->enable = false;
-		drm_dbg_atomic(crtc->dev,
-			       "Set [NOMODE] for [CRTC:%d:%s] state %p\n",
-			       crtc->base.id, crtc->name, state);
+		DRM_DEBUG_ATOMIC("Set [NOMODE] for [CRTC:%d:%s] state %p\n",
+				 crtc->base.id, crtc->name, state);
 	}
 
 	return 0;
@@ -208,14 +202,12 @@ drm_atomic_set_crtc_for_plane(struct drm_plane_state *plane_state,
 	}
 
 	if (crtc)
-		drm_dbg_atomic(plane->dev,
-			       "Link [PLANE:%d:%s] state %p to [CRTC:%d:%s]\n",
-			       plane->base.id, plane->name, plane_state,
-			       crtc->base.id, crtc->name);
+		DRM_DEBUG_ATOMIC("Link [PLANE:%d:%s] state %p to [CRTC:%d:%s]\n",
+				 plane->base.id, plane->name, plane_state,
+				 crtc->base.id, crtc->name);
 	else
-		drm_dbg_atomic(plane->dev,
-			       "Link [PLANE:%d:%s] state %p to [NOCRTC]\n",
-			       plane->base.id, plane->name, plane_state);
+		DRM_DEBUG_ATOMIC("Link [PLANE:%d:%s] state %p to [NOCRTC]\n",
+				 plane->base.id, plane->name, plane_state);
 
 	return 0;
 }
@@ -238,14 +230,12 @@ drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
 	struct drm_plane *plane = plane_state->plane;
 
 	if (fb)
-		drm_dbg_atomic(plane->dev,
-			       "Set [FB:%d] for [PLANE:%d:%s] state %p\n",
-			       fb->base.id, plane->base.id, plane->name,
-			       plane_state);
+		DRM_DEBUG_ATOMIC("Set [FB:%d] for [PLANE:%d:%s] state %p\n",
+				 fb->base.id, plane->base.id, plane->name,
+				 plane_state);
 	else
-		drm_dbg_atomic(plane->dev,
-			       "Set [NOFB] for [PLANE:%d:%s] state %p\n",
-			       plane->base.id, plane->name, plane_state);
+		DRM_DEBUG_ATOMIC("Set [NOFB] for [PLANE:%d:%s] state %p\n",
+				 plane->base.id, plane->name, plane_state);
 
 	drm_framebuffer_assign(&plane_state->fb, fb);
 }
@@ -334,15 +324,13 @@ drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
 		drm_connector_get(conn_state->connector);
 		conn_state->crtc = crtc;
 
-		drm_dbg_atomic(crtc->dev,
-			       "Link [CONNECTOR:%d:%s] state %p to [CRTC:%d:%s]\n",
-			       connector->base.id, connector->name,
-			       conn_state, crtc->base.id, crtc->name);
+		DRM_DEBUG_ATOMIC("Link [CONNECTOR:%d:%s] state %p to [CRTC:%d:%s]\n",
+				 connector->base.id, connector->name,
+				 conn_state, crtc->base.id, crtc->name);
 	} else {
-		drm_dbg_atomic(crtc->dev,
-			       "Link [CONNECTOR:%d:%s] state %p to [NOCRTC]\n",
-			       connector->base.id, connector->name,
-			       conn_state);
+		DRM_DEBUG_ATOMIC("Link [CONNECTOR:%d:%s] state %p to [NOCRTC]\n",
+				 connector->base.id, connector->name,
+				 conn_state);
 	}
 
 	return 0;
@@ -486,10 +474,9 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 	} else if (crtc->funcs->atomic_set_property) {
 		return crtc->funcs->atomic_set_property(crtc, state, property, val);
 	} else {
-		drm_dbg_atomic(crtc->dev,
-			       "[CRTC:%d:%s] unknown property [PROP:%d:%s]]\n",
-			       crtc->base.id, crtc->name,
-			       property->base.id, property->name);
+		DRM_DEBUG_ATOMIC("[CRTC:%d:%s] unknown property [PROP:%d:%s]]\n",
+				 crtc->base.id, crtc->name,
+				 property->base.id, property->name);
 		return -EINVAL;
 	}
 
@@ -583,9 +570,8 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		state->pixel_blend_mode = val;
 	} else if (property == plane->rotation_property) {
 		if (!is_power_of_2(val & DRM_MODE_ROTATE_MASK)) {
-			drm_dbg_atomic(plane->dev,
-				       "[PLANE:%d:%s] bad rotation bitmask: 0x%llx\n",
-				       plane->base.id, plane->name, val);
+			DRM_DEBUG_ATOMIC("[PLANE:%d:%s] bad rotation bitmask: 0x%llx\n",
+					 plane->base.id, plane->name, val);
 			return -EINVAL;
 		}
 		state->rotation = val;
@@ -609,10 +595,9 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		return plane->funcs->atomic_set_property(plane, state,
 				property, val);
 	} else {
-		drm_dbg_atomic(plane->dev,
-			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
-			       plane->base.id, plane->name,
-			       property->base.id, property->name);
+		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
+				 plane->base.id, plane->name,
+				 property->base.id, property->name);
 		return -EINVAL;
 	}
 
@@ -680,20 +665,17 @@ static int drm_atomic_set_writeback_fb_for_connector(
 		struct drm_framebuffer *fb)
 {
 	int ret;
-	struct drm_connector *conn = conn_state->connector;
 
 	ret = drm_writeback_set_fb(conn_state, fb);
 	if (ret < 0)
 		return ret;
 
 	if (fb)
-		drm_dbg_atomic(conn->dev,
-			       "Set [FB:%d] for connector state %p\n",
-			       fb->base.id, conn_state);
+		DRM_DEBUG_ATOMIC("Set [FB:%d] for connector state %p\n",
+				 fb->base.id, conn_state);
 	else
-		drm_dbg_atomic(conn->dev,
-			       "Set [NOFB] for connector state %p\n",
-			       conn_state);
+		DRM_DEBUG_ATOMIC("Set [NOFB] for connector state %p\n",
+				 conn_state);
 
 	return 0;
 }
@@ -800,10 +782,9 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 		return connector->funcs->atomic_set_property(connector,
 				state, property, val);
 	} else {
-		drm_dbg_atomic(connector->dev,
-			       "[CONNECTOR:%d:%s] unknown property [PROP:%d:%s]]\n",
-			       connector->base.id, connector->name,
-			       property->base.id, property->name);
+		DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] unknown property [PROP:%d:%s]]\n",
+				 connector->base.id, connector->name,
+				 property->base.id, property->name);
 		return -EINVAL;
 	}
 
@@ -1301,7 +1282,7 @@ static void complete_signaling(struct drm_device *dev,
 		/* If this fails log error to the user */
 		if (fence_state[i].out_fence_ptr &&
 		    put_user(-1, fence_state[i].out_fence_ptr))
-			drm_dbg_atomic(dev, "Couldn't clear out_fence_ptr\n");
+			DRM_DEBUG_ATOMIC("Couldn't clear out_fence_ptr\n");
 	}
 
 	kfree(fence_state);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
