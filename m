Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 448CBB28CC1
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 12:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A103610E0CD;
	Sat, 16 Aug 2025 10:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="UxfMCDxC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic310-20.consmr.mail.gq1.yahoo.com
 (sonic310-20.consmr.mail.gq1.yahoo.com [98.137.69.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FAC10E0CD
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 10:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1755339329; bh=7gxqdcxN0AzBeM7cAfWgrj5SzV0WMyhoCaO7bxfgfIg=;
 h=From:To:Cc:Subject:Date:References:Resent-From:Resent-To:Resent-Cc:Resent-Date:From:Subject:Reply-To;
 b=UxfMCDxCMQbOPbf7QQmFVwPuKGzSUxTvjs8HScsiwbt2qTS9JgBpRWww6mmZWrlO39SFJFeonUT2zsceUfWk7zGjld2jE/Sm4m0DA3DV5xbU2/2YKps/rxjZUQ6G4PBe80EjnVwOvNGmWQmtL8TpdyIII+V9GCYApxZqxlre4/ROMHYewDb79AxqlMZcwRX5cbnqEIrHN2PCy35hACjJNmCRIICrt1lXfI8PujmamBzEeXMNIS2dilaNY8vdY07AogUkOokU1gVtLOKnpsxwzkDFz5ljbClnzNkmIrqqG5mqyrj5ASD9HRbry3gG8YFCFpxubVrcd03kL6P9kvvb4Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1755339329; bh=mRsLltk601QhyTjxMHUg2R/8KCxPJxXR1/3WYf+FPNH=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=V+suIgTgJ063PINrvPymwUi/DO0ITMZ1fndFNrX97mE6/PAa3sbnCLVonDnSRyhPnwqczUa+K4LTKAJ1O2u2+A+x5pSWM0ulxluxQPEOrQTMaYK51f/V0bWdJm48yUvTw4NcbiJ1ic1ReV56VHLq/QaEiO/o+jHCsUOuSZI7g/4OCsjLpSOp33I0TuIlaie+KDjg19ZACewZTSweem0tNSuzSyC9BZyGtgAPyVxdI+qN4MO5Aslal1uM1bGloHjKMtBuQxtJ/sha8ltpCmDjKxzrZn4uXaq61+5bdzERIUzNyQ85yOk4LKIWr8DauVCpre0LsQ3cgj4u/lVIZncL1Q==
X-YMail-OSG: HEKtLc0VM1lJJzOo38XC05ISyBYnPpNlb_M.Cxt0IwtW_qv2x4Wz_Eur6pmUQTf
 F1Z500a7zDIETLqbwa4ZL2MK4OF5Ue7UgPms5piySgF.A9ctbCgVFfOf_ZsDLdnTH7gpd_5as9sH
 Rh_ZgSwSvG2jsoSwC8gsKrYMWDnis9hnvx4PXnPzBqDsLEp5TH.bmwULMrmRLv5Fu6YWXyHDpxzV
 q7PHThzmXNhZLt_.dlIznr8NFkd3n7KqlF74nyY4Ok.nSF8RwbXnTkwbIicty_aprUmx5u3nKq_P
 917lUKGydu4rwIm_evwIty2nH5oE8Zo2_o7jYFhqTjwd49Jrg1rIaj3XqA9hWVMj2x8lxlHBBRx9
 tHkuu0ZV6_rdNydIEzs1hbdmxk1S_FGnRe3n4f2FD__7DVctVFgtbxGRvb.edPfSG0QjsVqKt30l
 ivTsFfIm1fnOVycVLNCbF_kfEwKOkPftNPXYNTnCJ1IinCvNm27MEkhOs9_69z4M7J2mdDfmUO_s
 4.jMArNovvnSa.OhanGwg0uuUtBF5HAx52tTbUBn_VPuS8vhoe8hBHIO.YviAKIYBTIzh_kEqzfT
 3PelA03o42wm.qf9BUS.chKxW8v4uuUJ.iQlmhjk00jGktic4PUepRscGQEGciBJh0OodL0WXkdI
 hrpi7kiQy8Lbq9EtmsN68qy9xwISDuz1DgxjFLrvj9dFRPhqAHorubLmXHoXZm.MEyQFg841g1Kt
 yLpMKO3lT3IZrP.t4J1IBcTXLdTeMFV6mSpg8Gy.ey6d9zjNCfi.vOQ1diuxm4lPRV5JnNXqFyI3
 qUuHLUGSv5czmx_zGdRMVhzLSW6toGFHPLcQ08n8ql9AYtgVZNCC194FSrYfHuNYuuQUy.9EiZDk
 k6mKvDE4n7UA.1nb0_ZauKFb9A0qCL2njQsSaRPkqZYyVFI_Xw8awR_UFLqQ5Qo.KlFZAly.c18N
 iqjCcZm9PTBzQQaw8YwNKfqUKT3PadbDw9tLNNQeGexasJ_X0WPomNvh6Lh3SlWjC7c78V02eAaU
 VTu2.7YQOT08nXKYPdpAaeHSYK5x3c8VSl3TWgeKuiiwaDMDszy.ZyW0mYghK3zxUk7NGyDKF7XD
 FHFHgjChBUIHItBlcoVmr38Jxt9y6gjSYh22.weEW9_7EmflmbrUOcP1kuZWVGo3vV6bkilyingu
 HegLdfBcuvGKjvDjWv8pnT4M_wY1k2ExJSsf_NlIZHEPb1sohROazOBq1mrRsWMyoi0q4.9T3MfO
 HjT.LB4rqgvMAC0ez9fHEALj3geKuUjQ11M986WdoLHZDNH4yq4B3KH0p82ZIeIzP8Lp42EoJzH.
 drCJ.3.Be9F8BQu2ydTpqS91itzktJbBEtMQB2dRxfAxktQsicnx9DC_oE5.5xSgLS0yCdI12Uzs
 kA16o1hmMXFgwKD0EbBsHtr6Cnvg4OPzqsDptu_KUyqbffv_FoES8U_Yk_TsaBkrgNFDaybDIWqn
 wqVgUiqfK.OBYDUY1ep8SuzLoYesAUS4ijRMa0J1niiZHrFa5F6RfAhPcFlv3.Kg4loLH814N9x8
 wLRlGiHSFbYgBEYlMsS9QcWCeYqUQloE1WfsvvKnNrqquERotmpNkxBHWSI2IlA0nvF_VR1Bk0f_
 vaSMKTnf6_HSwBILDqsBAuqZq.mNRAHpBHQF_dGcfAut7W4EwVGnA5v0deyRURc0MOBGCCdmzCYp
 26iWrQjPi723hR3CO59Jq5UFA8wj.djjYenpzTUU9F650Tv4WOBDQDWGiP5zeC1NA55AoGMdKFe.
 GuQ8XOE.xIdH0Q1ZXzQf9RtCo_6AgXhZNhpdwn3K7bW7wlStZ53WYK7ECwnZlnlcm4bMNQPWOE11
 EzlqzJeK40bwkL1ec8X_x3Rv5DYXDn8pFUP9LLV6pOjkkpE2HlfcRgdQ95wB.W4E4AcpE9GH0XHS
 r7RseYPP4hfzP68sMqpfagS0XuX2ACcvUMv0vKXuiu3hlTIshnznahU22ppM6dVbWquA5UbNu2.y
 89oiKqjkoQtFYEX.2HyR8S8QnNGjU0wPXhDpiNRJ1ngUu5rm6tpWhPp6_437zBrTM2Sbz1oIb25y
 72waL3VXebRWJF8XtSvoSnklyEQ0jbc1nOKROjxJh02c.wh0PTgCyH4ZdsOCLZMNVQ9nNikXOq3j
 ftzv_77WnKPk49YQHpuPlmWG5kYVAxbFF7VzPWTyZqv39Hwaoykr_d2MLAi78qJBkCLIxOxsEhO1
 U1K9XzOPjgN2WjZOIynl5HruMvVQkzzBJaS8J8zcX8yXZsqodvlHKk38cf1Ptn3so.AQ-
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 2f73373c-b06a-4340-b0bb-43fa8ce72c36
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.gq1.yahoo.com with HTTP; Sat, 16 Aug 2025 10:15:29 +0000
Received: by hermes--production-ir2-858bd4ff7b-kl7wg (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 79b16d52b6854dae1b9dc575fd6b628c; 
 Sat, 16 Aug 2025 10:15:22 +0000 (UTC)
Received: by hermes--production-ir2-858bd4ff7b-xdmpn (Yahoo Inc. Hermes
 SMTP Server) with ESMTPA ID 515232b4dc819035ee721930d93da332;          Sat,
 16 Aug 2025 10:02:34 +0000 (UTC)
From: Ruben Wauters <rubenru09@aol.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ingo Molnar <mingo@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jani Nikula <jani.nikula@intel.com>,
 Jocelyn Falempe <jfalempe@redhat.com>
Cc: Ruben Wauters <rubenru09@aol.com>, dri-devel@lists.fredesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/gud: Replace simple display pipe with DRM atomic
 helpers
Date: Sat, 16 Aug 2025 10:57:05 +0100
Message-ID: <20250816100223.5588-1-rubenru09@aol.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250816100223.5588-1-rubenru09.ref@aol.com>
Resent-From: Ruben Wauters <rubenru09@aol.com>
Resent-To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime
 Ripard	 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie	 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Ingo
 Molnar	 <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jani
 Nikula	 <jani.nikula@intel.com>, Jocelyn Falempe <jfalempe@redhat.com>
Resent-Cc: Ruben Wauters <rubenru09@aol.com>,
 dri-devel@lists.freedesktop.org, 	linux-kernel@vger.kernel.org
Resent-Date: Sat, 16 Aug 2025 11:15:20 +0100
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
Resent-Message-Id: <20250816101530.A103610E0CD@gabe.freedesktop.org>

The simple display pipe is obsolete and the atomic helpers allow for
more control over the rendering process. As such, this patch replaces
the old simple display pipe system with the newer atomic helpers.

As the code is mainly the same, merely replaced with the new atomic
system, there should be no change in functionality.

Signed-off-by: Ruben Wauters <rubenru09@aol.com>
---
I have been able to test this now, having obtained the hardware, and it
works fine, though some other unrelated issues have popped up, which I
shall try and debug and address in other patches.

v2 changes:
- address review comments by reorganising gud_probe()
---
 drivers/gpu/drm/gud/gud_connector.c | 24 +++++-----
 drivers/gpu/drm/gud/gud_drv.c       | 52 +++++++++++++++++-----
 drivers/gpu/drm/gud/gud_internal.h  | 13 +++---
 drivers/gpu/drm/gud/gud_pipe.c      | 69 ++++++++++++++++++++---------
 4 files changed, 108 insertions(+), 50 deletions(-)

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
index 5385a2126e45..65c3a83c4037 100644
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
 	if (ret)
 		return ret;
 
+	drm_plane_helper_add(&gdrm->plane, &gud_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(&gdrm->plane);
+
 	devm_kfree(dev, formats);
 	devm_kfree(dev, formats_dev);
 
@@ -582,7 +608,13 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		return ret;
 	}
 
-	drm_plane_enable_fb_damage_clips(&gdrm->pipe.plane);
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

