Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF6AB1E960
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 15:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E9610E0D9;
	Fri,  8 Aug 2025 13:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="FCrlXrMt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic306-20.consmr.mail.gq1.yahoo.com
 (sonic306-20.consmr.mail.gq1.yahoo.com [98.137.68.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4621A10E0D9
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 13:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1754660356; bh=fjMAkglMi3Xe+QK3QUFAQ3CeD19lZG7OB8YizVU8uxM=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=FCrlXrMtRqWD2VZcEXmqUEg3uqBdAXsFIBkn5+E6Xcc6s16W5umFEPBpUF2xvhvHmwcWzCFIsJSqOfdoBqwl7JN5sReh3dagV/+6g8vwlsLQA4l2qQuhhe5e2tLZ0w7uVSWgoQcKNr/vOgB7249WT/siDtMXLXbmkLKljMzzpZW9pHbwmt+Wxem7+SWh5x7p2/JMg13rdDoBGY3MCqoP9sGLL6pUYE4M7njfNWCEj0zzvnw0YcG064bJ7Hw4fU+CF8IN6wggkYX/rJDHTmHhfiffRmsRNfKF2Hlb47HbeXY4OdyKa9u5AcnU/U8TlMzkCQyPT7V0rXFQt5hlkQHbRw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1754660356; bh=L29ukAMQvs+PRZPE6gr6AhNKrPd/62bZxNc19hxjhR7=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=J7FWIklC5dXdJ2P401eggBHk/+B6lmxFoE3QbMDmRQGP4T670vtzo0wmOADOvMfX3IL8ETnTKz479vKlbwsWL2QxxoI1t+i02eAD3n70bQoWq6WREZjLNo9OFRSVLwYYgF2o3io0POFddPGJhdpbZjcQhCHRpqNvJQ58ljr508kLamwe8jcQqbGUgwcii872yctHHwkwfttdxRQrGdSrPtbyXHp79AiqKJmINGPLVdF8EaMVn36x8S1Ch87ZLrLGc5sMj0UtwonTcdCeGcH2XAfLkLMDhmvt1vBCG7z5Mq2CUtsjSXr9RMCkW8CcUqTcexV7s1WVBB15M3yEVAigkg==
X-YMail-OSG: VI1k_CkVM1nNdS_QokQL5FKaYmaDsWlRAho_WE6dHBU8twGNQWnFgjJTzEMn16h
 eCSNza1ec._1_zEy7xvf3ZamK3NjEEywD_9AhU8EPFpip0_.mC_IXgNuvRJQRFdD7_zjOzTpTGRX
 lD6gEFo6GDS.qMjjgQPaEdFSvTzAvByw.77dcce_V_YaG97tXTB1ltIoR2H2Rwjk6aW0gUOhSGRj
 6W6IWuV4ExXOAd5RyqlarO6hzctBMgXWMLIxIDoWruO7M7K29JqHH7T8C7kNPH5hQjRh0TZrgOjm
 bVMoSR.1m9keCHnMCbaV2wsjIC3NqwQLq.oL.2J5glWe.rkbGDbhMqwYF.22v7B2YAR3uwyb5K1g
 kuucwG6804rLL2xWEEj1STjVAF9Nz_Cjjlj1HXdO4MGAEjUZylgDbmsRYxuGhgEECGhVz4CDzKJS
 B05PcSfKZLkAwTJliC0PmU1FQAujWGgvSn7JE1mCrZjXUcv.COZ0WjV8NP5NS5wLgoIyFxMEg0aQ
 CA7JuBRm0xt8jaKDaA4069ouiCzPGqq0Z7UHfrIW9EaQHCiAqgDXrZJDquj1aReRSBlQDiehT_1g
 dc9lb3Ywt.AlaPpZODgOBjW_ok2gTcyG_hdQwvNu_p6L_vLYT562zUgRK5ubvYbDKKYMjsFqc.90
 TDubLYV7SeEzpDBdLi5l3EeD6gA3zcElmV.VO28OB6jK_1RJ4UrPkxhXnriNzS24bjw6A0xvis9U
 w_lS1AEP3NBb1tQbqVerBjqLbkrta4Iz2em21UFXPWiXhCf1n917SBGs2HpWKHC2wVmWmq_GHg3p
 5tFv06pynaBMupOrdLx1HGmDngiLbSnTxZYT9NDpJawr4l6LdAJQ6wpV80fnaDRc44DQ.Z5hZZAB
 YXjpN4ipyUS5VRyVs8jyy7k_Le3EL3H6YD2G1ODJJfYBndnHny8rOvtf3IPZGpgOTEJRWUEYmp6M
 gjPX3aUWVB8GKQBn9fmKOyh4InMrCdo0nuBQdCKjIX8mW8Gw7AuT8lb.wQxIyHZmheYNevixeh83
 OP6y_beDoUzlnli0Jl_6IWv_vN56owFXEt.JDA3Vewbk.0GGF4OoW.1qMEGI7iiACs60oTpPlwAp
 4.wFOT2ONlnVCSu5WklSdrCgAxVPfAsAo7XHiwXFdhiA2daHdzRJAvbIsLmv7nOCAajRogUb5Hhd
 pCSvK1CRUSy8jA9JvFrsbXbhjBY0ZjgrjnZRJDRQsJYt6zqvXsxAhad3HXSp89M5oc70iijQy1pz
 R5o8GF19dE15W9aLWJX20iZI4HmNrfwVYKXblgrj.cS26nRAgRPWSx3ADlV3qLwcoWV1Wfpkb4Uu
 2YmovyPS60DNhnWa52Jc1xtrECzR3sgNlzElSYGkSZZbBqSkvl9V_WlM.NkBKTO9517ZGu4XLtHj
 MRgVCoQNCG.aXWF91NCA0qHmkBDp2TxRKyQK79IPLSyGiMscLU7CoDpH1wN9eCfBMJJqaRBLJiYz
 cSE6c0q3ayzPsWOWZLydFSSe20pmnh0cam5zk0DeAsokxKGvGl07JzYcri3sI0K2qSNIVGUK4vqu
 sB.kraK4zViklbSCRaIbHHG_v.K8VYsF1cpccjiZoQoDx05ggXa0v8JWML.tjI5w1svjVNQnGiaO
 aiGomLuzkHqaCS7ErreXMYqGKwjpKult18M_dN35Ge7_ZzYKDNM35BRqmk9u6jnUNDbuuBQNlY65
 Vn0G53vj_Vp.X1X8j8hhZ7TpVCRtRDXj62OgdWRTtZKpj2yVeRXu1fA8pWM5ZifUhlRqK8NE5vm1
 wxJZxZpULUJiMHX5O0cdTITRZWgR77SibtmGIJWGgkhL7WnOfusgKNvEQtooqw9LFDlLtrTqrMov
 gpaySjB1Y_gcDVsiW40CTF6x8V_BKnKZuxaY52MzRYAox4pU82IrTR0Hm6FjsjxDpgbsjdPagfv5
 4nslm2SZkt0H86B36aJodQYLIDoypFR2YQv.oxU9RB8gedaC79XiLnAE8aa4Tmhf2L5q_TeSRmjW
 i9LFnfHpBtNOWjmTqMIoyivyleZ91bs6AlqmK6xiMlX6vbnYyofWgQUuTogHUjmQs_On68EDIe2I
 UVqrErg33FIza57A8CbYSFMkC16x53oYa0FZV3sYeOCDCD_15DtrV_3TUx87sq6guKBEPwfPqOvw
 Ea7q8b_OLOc92P42mMwH7RkngTC_QaV.D2_0vp4WWHZY68SqKtRGjf9Sl2x_6spN.0cX44GQBjCu
 qNeUWvbR9qnE1A9EDv1iT23jfMYuHp822EINp45jNsinuTHXKOtCRjaGmjkz8zU8-
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 4fd9c11a-4a81-428c-bf3f-3e47e46384bd
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.gq1.yahoo.com with HTTP; Fri, 8 Aug 2025 13:39:16 +0000
Received: by hermes--production-ir2-858bd4ff7b-p7k8x (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID f8d0aedd65a7df99016bada991e031c5; 
 Fri, 08 Aug 2025 13:39:09 +0000 (UTC)
From: Ruben Wauters <rubenru09@aol.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ingo Molnar <mingo@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jani Nikula <jani.nikula@intel.com>,
 Jocelyn Falempe <jfalempe@redhat.com>
Cc: Ruben Wauters <rubenru09@aol.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/gud: Replace simple display pipe with DRM atomic helpers
Date: Fri,  8 Aug 2025 14:36:29 +0100
Message-ID: <20250808133634.6839-1-rubenru09@aol.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250808133634.6839-1-rubenru09.ref@aol.com>
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

The simple display pipe is obsolete and the atomic helpers allow for
more control over the rendering process. As such, this patch replaces
the old simple display pipe system with the newer atomic helpers.

As the code is mainly the same, merely replaced with the new atomic
system, there should be no change in functionality.

Signed-off-by: Ruben Wauters <rubenru09@aol.com>
---
Unfortunately I have not been able to test this on hardware. It
compiles without errors, but I sadly do not currently have the hardware
to ensure that this works as intended. I would appreciate it if anyone
would be able to initially check the code I have written to ensure that
I have used the DRM atomic helpers correctly (as I do not have much
experience with the DRM helpers or system), and then if anyone could
test this on hardware to ensure this patch displays identically to the
current implementation, it would be greatly appreciated. If that is not
possible, I can hold onto this patch until I am able to test it myself
when I am able to get the hardware required.

Thank you
---
 drivers/gpu/drm/gud/gud_connector.c | 24 +++++-----
 drivers/gpu/drm/gud/gud_drv.c       | 54 +++++++++++++++++-----
 drivers/gpu/drm/gud/gud_internal.h  | 13 +++---
 drivers/gpu/drm/gud/gud_pipe.c      | 69 ++++++++++++++++++++---------
 4 files changed, 110 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_connector.c b/drivers/gpu/drm/gud/gud_connector.c
index 0f07d77c5d52..75f404ec08b4 100644
--- a/drivers/gpu/drm/gud/gud_connector.c
+++ b/drivers/gpu/drm/gud/gud_connector.c
@@ -607,13 +607,16 @@ int gud_connector_fill_properties(struct drm_connector_state *connector_state,
 	return gconn->num_properties;
 }
 
+static const struct drm_encoder_funcs gud_drm_simple_encoder_funcs_cleanup = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int gud_connector_create(struct gud_device *gdrm, unsigned int index,
 				struct gud_connector_descriptor_req *desc)
 {
 	struct drm_device *drm = &gdrm->drm;
 	struct gud_connector *gconn;
 	struct drm_connector *connector;
-	struct drm_encoder *encoder;
 	int ret, connector_type;
 	u32 flags;
 
@@ -681,20 +684,13 @@ static int gud_connector_create(struct gud_device *gdrm, unsigned int index,
 		return ret;
 	}
 
-	/* The first connector is attached to the existing simple pipe encoder */
-	if (!connector->index) {
-		encoder = &gdrm->pipe.encoder;
-	} else {
-		encoder = &gconn->encoder;
-
-		ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
-		if (ret)
-			return ret;
-
-		encoder->possible_crtcs = 1;
-	}
+	gdrm->encoder.possible_crtcs = drm_crtc_mask(&gdrm->crtc);
+	ret = drm_encoder_init(drm, &gdrm->encoder, &gud_drm_simple_encoder_funcs_cleanup,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
 
-	return drm_connector_attach_encoder(connector, encoder);
+	return drm_connector_attach_encoder(connector, &gdrm->encoder);
 }
 
 int gud_get_connectors(struct gud_device *gdrm)
diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 5385a2126e45..ac723b4ea7bf 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -16,6 +16,7 @@
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
@@ -289,7 +290,7 @@ static int gud_get_properties(struct gud_device *gdrm)
 			 * but mask out any additions on future devices.
 			 */
 			val &= GUD_ROTATION_MASK;
-			ret = drm_plane_create_rotation_property(&gdrm->pipe.plane,
+			ret = drm_plane_create_rotation_property(&gdrm->plane,
 								 DRM_MODE_ROTATE_0, val);
 			break;
 		default:
@@ -338,10 +339,30 @@ static int gud_stats_debugfs(struct seq_file *m, void *data)
 	return 0;
 }
 
-static const struct drm_simple_display_pipe_funcs gud_pipe_funcs = {
-	.check      = gud_pipe_check,
-	.update	    = gud_pipe_update,
-	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS
+static const struct drm_crtc_helper_funcs gud_crtc_helper_funcs = {
+	.atomic_check = drm_crtc_helper_atomic_check
+};
+
+static const struct drm_crtc_funcs gud_crtc_funcs = {
+	.reset = drm_atomic_helper_crtc_reset,
+	.destroy = drm_crtc_cleanup,
+	.set_config = drm_atomic_helper_set_config,
+	.page_flip = drm_atomic_helper_page_flip,
+	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_plane_helper_funcs gud_plane_helper_funcs = {
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.atomic_check = gud_plane_atomic_check,
+	.atomic_update = gud_plane_atomic_update,
+};
+
+static const struct drm_plane_funcs gud_plane_funcs = {
+	.update_plane = drm_atomic_helper_update_plane,
+	.disable_plane = drm_atomic_helper_disable_plane,
+	.destroy = drm_plane_cleanup,
+	DRM_GEM_SHADOW_PLANE_FUNCS,
 };
 
 static const struct drm_mode_config_funcs gud_mode_config_funcs = {
@@ -350,7 +371,7 @@ static const struct drm_mode_config_funcs gud_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
-static const u64 gud_pipe_modifiers[] = {
+static const u64 gud_plane_modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_INVALID
 };
@@ -567,12 +588,17 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 			return -ENOMEM;
 	}
 
-	ret = drm_simple_display_pipe_init(drm, &gdrm->pipe, &gud_pipe_funcs,
-					   formats, num_formats,
-					   gud_pipe_modifiers, NULL);
+	ret = drm_universal_plane_init(drm, &gdrm->plane, 0,
+				       &gud_plane_funcs,
+				       formats, num_formats,
+				       gud_plane_modifiers,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+
 	if (ret)
 		return ret;
 
+	drm_plane_helper_add(&gdrm->plane, &gud_plane_helper_funcs);
+
 	devm_kfree(dev, formats);
 	devm_kfree(dev, formats_dev);
 
@@ -582,7 +608,15 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		return ret;
 	}
 
-	drm_plane_enable_fb_damage_clips(&gdrm->pipe.plane);
+	drm_plane_enable_fb_damage_clips(&gdrm->plane);
+
+	ret = drm_crtc_init_with_planes(drm, &gdrm->crtc, &gdrm->plane, NULL,
+					&gud_crtc_funcs, NULL);
+
+	if (ret)
+		return ret;
+
+	drm_crtc_helper_add(&gdrm->crtc, &gud_crtc_helper_funcs);
 
 	ret = gud_get_connectors(gdrm);
 	if (ret) {
diff --git a/drivers/gpu/drm/gud/gud_internal.h b/drivers/gpu/drm/gud/gud_internal.h
index d6fb25388722..6152a9b5da43 100644
--- a/drivers/gpu/drm/gud/gud_internal.h
+++ b/drivers/gpu/drm/gud/gud_internal.h
@@ -15,7 +15,9 @@
 
 struct gud_device {
 	struct drm_device drm;
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
 	struct work_struct work;
 	u32 flags;
 	const struct drm_format_info *xrgb8888_emulation_format;
@@ -62,11 +64,10 @@ int gud_usb_set_u8(struct gud_device *gdrm, u8 request, u8 val);
 
 void gud_clear_damage(struct gud_device *gdrm);
 void gud_flush_work(struct work_struct *work);
-int gud_pipe_check(struct drm_simple_display_pipe *pipe,
-		   struct drm_plane_state *new_plane_state,
-		   struct drm_crtc_state *new_crtc_state);
-void gud_pipe_update(struct drm_simple_display_pipe *pipe,
-		     struct drm_plane_state *old_state);
+int gud_plane_atomic_check(struct drm_plane *plane,
+			   struct drm_atomic_state *state);
+void gud_plane_atomic_update(struct drm_plane *plane,
+			     struct drm_atomic_state *atomic_state);
 int gud_connector_fill_properties(struct drm_connector_state *connector_state,
 				  struct gud_property_req *properties);
 int gud_get_connectors(struct gud_device *gdrm);
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 8d548d08f127..6a0e6234224a 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -451,14 +451,15 @@ static void gud_fb_handle_damage(struct gud_device *gdrm, struct drm_framebuffer
 	gud_flush_damage(gdrm, fb, src, !fb->obj[0]->import_attach, damage);
 }
 
-int gud_pipe_check(struct drm_simple_display_pipe *pipe,
-		   struct drm_plane_state *new_plane_state,
-		   struct drm_crtc_state *new_crtc_state)
+int gud_plane_atomic_check(struct drm_plane *plane,
+			   struct drm_atomic_state *state)
 {
-	struct gud_device *gdrm = to_gud_device(pipe->crtc.dev);
-	struct drm_plane_state *old_plane_state = pipe->plane.state;
-	const struct drm_display_mode *mode = &new_crtc_state->mode;
-	struct drm_atomic_state *state = new_plane_state->state;
+	struct gud_device *gdrm = to_gud_device(plane->dev);
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *crtc = new_plane_state->crtc;
+	struct drm_crtc_state *crtc_state;
+	const struct drm_display_mode *mode;
 	struct drm_framebuffer *old_fb = old_plane_state->fb;
 	struct drm_connector_state *connector_state = NULL;
 	struct drm_framebuffer *fb = new_plane_state->fb;
@@ -472,17 +473,35 @@ int gud_pipe_check(struct drm_simple_display_pipe *pipe,
 	if (WARN_ON_ONCE(!fb))
 		return -EINVAL;
 
+	if (WARN_ON_ONCE(!crtc))
+		return -EINVAL;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+
+	mode = &crtc_state->mode;
+
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
+
+	if (ret)
+		return ret;
+
+	if (!new_plane_state->visible)
+		return 0;
+
 	if (old_plane_state->rotation != new_plane_state->rotation)
-		new_crtc_state->mode_changed = true;
+		crtc_state->mode_changed = true;
 
 	if (old_fb && old_fb->format != format)
-		new_crtc_state->mode_changed = true;
+		crtc_state->mode_changed = true;
 
-	if (!new_crtc_state->mode_changed && !new_crtc_state->connectors_changed)
+	if (!crtc_state->mode_changed && !crtc_state->connectors_changed)
 		return 0;
 
 	/* Only one connector is supported */
-	if (hweight32(new_crtc_state->connector_mask) != 1)
+	if (hweight32(crtc_state->connector_mask) != 1)
 		return -EINVAL;
 
 	if (format->format == DRM_FORMAT_XRGB8888 && gdrm->xrgb8888_emulation_format)
@@ -500,7 +519,7 @@ int gud_pipe_check(struct drm_simple_display_pipe *pipe,
 	if (!connector_state) {
 		struct drm_connector_list_iter conn_iter;
 
-		drm_connector_list_iter_begin(pipe->crtc.dev, &conn_iter);
+		drm_connector_list_iter_begin(plane->dev, &conn_iter);
 		drm_for_each_connector_iter(connector, &conn_iter) {
 			if (connector->state->crtc) {
 				connector_state = connector->state;
@@ -567,16 +586,19 @@ int gud_pipe_check(struct drm_simple_display_pipe *pipe,
 	return ret;
 }
 
-void gud_pipe_update(struct drm_simple_display_pipe *pipe,
-		     struct drm_plane_state *old_state)
+void gud_plane_atomic_update(struct drm_plane *plane,
+			     struct drm_atomic_state *atomic_state)
 {
-	struct drm_device *drm = pipe->crtc.dev;
+	struct drm_device *drm = plane->dev;
 	struct gud_device *gdrm = to_gud_device(drm);
-	struct drm_plane_state *state = pipe->plane.state;
-	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
-	struct drm_framebuffer *fb = state->fb;
-	struct drm_crtc *crtc = &pipe->crtc;
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(atomic_state, plane);
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(atomic_state, plane);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(new_state);
+	struct drm_framebuffer *fb = new_state->fb;
+	struct drm_crtc *crtc = new_state->crtc;
 	struct drm_rect damage;
+	struct drm_rect dst_clip;
+	struct drm_atomic_helper_damage_iter iter;
 	int ret, idx;
 
 	if (crtc->state->mode_changed || !crtc->state->enable) {
@@ -611,8 +633,15 @@ void gud_pipe_update(struct drm_simple_display_pipe *pipe,
 	if (ret)
 		goto ctrl_disable;
 
-	if (drm_atomic_helper_damage_merged(old_state, state, &damage))
+	drm_atomic_helper_damage_iter_init(&iter, old_state, new_state);
+	drm_atomic_for_each_plane_damage(&iter, &damage) {
+		dst_clip = new_state->dst;
+
+		if (!drm_rect_intersect(&dst_clip, &damage))
+			continue;
+
 		gud_fb_handle_damage(gdrm, fb, &shadow_plane_state->data[0], &damage);
+	}
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
-- 
2.49.1

