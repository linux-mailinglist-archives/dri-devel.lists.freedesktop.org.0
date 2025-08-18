Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF70FB2B1BE
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 21:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731EC10E047;
	Mon, 18 Aug 2025 19:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="HWLaH2v9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic309-21.consmr.mail.gq1.yahoo.com
 (sonic309-21.consmr.mail.gq1.yahoo.com [98.137.65.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017E910E047
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 19:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1755545775; bh=QAsS/ZK9/jR90ZYLdsDJZA2QChRMRi5HB4btNMfMTh4=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=HWLaH2v9E5kQtq2PDcFvZ3hgDVyxtglOEJZ5pp93BFNpxKfhGXStfU5YObNSA/G6jsPRDCvxe9qTvosiMOkBkpTKWE81tIpCz2bCZ/K0oQb4QCnmraAT0f316M5M0Kt8nUX3Z3pBCvdRqMjsS/FagfboZThKBqm+7EAjI42lg6nu7tLnNt6nkppK6767U/cfSXKMEuWDCfR5wYpRC1YL9KN02tG70nN92hnnSRWhy8FIOEQbYml6P/zPNqoFX+fg44l0FAh95GbO8OkIr0PEKtQyjTQg4i9xg7K8Ss6p3CmbamYbTPOmTFE8AvQb4Kl54RtIP7ca6xTPhUA20A05Gw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1755545775; bh=4zox/e+Z/zmrgyn6Mmffd3ovgE1eK4s90dSC4Gtvzh+=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=SpAVY02r736r+Gm5i+f2kpdyIHUdJFTpvMLvUpTBEnkh6/E1/13GJUmpGGo5u47SawObf26Aj8o+i47jUp1H6GHeiQl/g2MNO9FlYMRRTlCi2zqXhb5udAIdnQd0oFooSnmxFmW5Oj+e6WLtgeQaxy215sw5gzYlKuzfiYSyoMdPpYq+ZBP62zgdt/M4/LDoj+SYkiwzOEbk5kAR30L6Ij9O6woiNA0oEeCWd3wKJG+AZTFnnemdy042skf56Gc5iXQx831KvqpG7kzCzeLS1NmQZ4Ol8watxcfpno+2p85P5dd1XMtzRl915E7C9N2ATzsSZ15pHjiStYXlJ52cyg==
X-YMail-OSG: XMrjKWIVM1ng2ttLT.NJlMLdZNSy_w0HvctIArKvpXGIA88ErVh_X_rsH7rIy7r
 7Nc36XUH19rxEBmaXY_1V203c0svQf33GtLAMv58nQq6WbvWoXjNZyRcOU6L.1eBS06WL5fVNVME
 ddDytxs6Btd2073axHfbwDWVqPATCTAasVFyuAAOEFZGjo5CbrEQMrSmnIy9PX1r58vdDQ8ikeOm
 eTjaNX21Dt7D5J4MdSo8kqqKWuH5LPHnWURle_38NiWvtMcvbZXiMqKbs_DMqL89Mq0HRH1cdajv
 HvlEWm_QdXpTkEv4YNmcZ3eTxPu92PzmWBR9msIimI2N.VB7gSGSKBT9hYQynAx0bXMzEhJ9a9ET
 .InaY93102f4nDmO1g8FKOIBheFtXZj8wjEYO1ey5205iP2LUpNJrV_k1C1OoQ7DaqGJhqB.10aL
 SIFzhqHuzDwk2jl7C5ddqhn5_k_rrLlQoHyBe8olGsMiJfh8QXAWiWKHefdJqz_eU.4.Ab7nDN2I
 Xy6kg5Vahu2xlR2dYIm6s6tpBVyyUlyaNKyuSWu9lMho8j5.z8593JbcqzpTaLiv..CYlGUT4Sg3
 ohnGVX2Sqyaj7OftWKzcePWo.7XI_d8xvG7k4pMStsAA9yETBqvt6q1V.rWGy8Qlr16DBPUFqsZM
 UmhJlKSqB2n2u69c2ueAmN5NrKIq.NVBIPBapJQcN.Y6gvIq5QM_9AHT.PPgczHUwP5OCoGJuixv
 yLW9DmZzeyi1AuJhhX23iVDDfn1V56FhV1Zy2svznNtaI2CRwYyxiZgMlaYhkBvG0TYGR_8mx7bz
 nQ1Bjc510gFk9eG8uDmFPDnGCcgqeeNYhmmak6gHzUxali9E4JRFDN_RGbvEO.kaMrm1_spfhK3F
 lpaq4XKhNxIq9mePbpOylH0zN8_IPTPY7kNYEB0vNMtNREY7zcklwONJcqnK3g8X2n2WbYysDI08
 N5.ez9t6zAo_vZdbhTZ9v.xUJumGsEY8n9Ygq0svxvwSoz9hQIeUgbfX5qybfU6jM637_BkLyn2M
 ACEbZ54ZM4wUewqRww9k1nl.mTVCdHu1rW4xx1OrqBXeXLFj6eF5jWiLVDBYttxDvZhEzf0r0RPs
 zXQNwOqfMWSvjKogQawhExpdUOXz49feQvLfVp1Wflql_hD68ZXHU16rSwmFNK8vYd4KQl.J3e0o
 UIKHn_V3e.3Q9udLHI3P1MGZ9Scaheg5npbfidtobz8IPJkq6jfVkmMnlcxg83UBv7j2OxrOggr7
 pqLQi8mxzou4seNWdU8thnWZoH9pC8sVrKa_k7qApkmJOo5KwONM9oDCw33qWkoxCpgujJTFFnVP
 Mf6ZxKeGUdrbv2UUCWwzHeIUbWC2VjMZ07lL6hm6pKMJ2xOwwJqH0oHPwyik9861OGSV95Qm3L5i
 asyuNx9joWPuYWrRcR6de4v6gv5HCeKUKR0pFnI2WBkqBwwShC_ch57.5PJMJzJSSjEJYLdcf0NX
 Nd29EiLOKc8lzDKzLq6J75Nz9nSho2IKzxvvpKHV.7c9LU0Nzn0D_DoyQ4ZNw_JM7xF9hj5lUc_w
 T2EaNlkWn2roB8v.runkdYOmRxfL.BQTKRGyJrqb2IWCUc5nT5QxY63ZL1zXALCoRLryCDpOV2bH
 v8vCHlAuP4k6JR7tP7VHxlBVRzp3aK9gHax_U1yAADAxXt8b3AVXBI4STxqZnik8DWq16mfhCXnu
 BWszoXHTwY_5Y4gxyZgvX.FIe_uct7YpRLyni5iHl5B6x4z97z97NkrCXEtEdvXQnqzA5A5Q.TVN
 uw0U7n9uG9Rd1Fll6pH3in8JpLtqZz1ko2anz_O61NOi2L4pr9BJn_1V7aEEMzgfKyT9p_rMqwjo
 wLu1a5Jt_462.j.w9s66yUsZ1qscJoIrq3AvCw1KgpAzqqDrm5fXDqaL4H.8JBeHr8XZTfEUq_PO
 CvQZMs0CXJybeUQ_saxX6qg8N3sl3kYIJWZ3oAyO_iOlEnh6eajGRheIBlE4tFm_eazOHAJx68Fs
 FBE7R3A94UxpE3yOBd0gOxE8TYv2i0hqEDm47bZn3xKxMoMtPF0bFYL6MnHEPCzQj0FNsTrrpDCF
 9jHR4PnNZww7fEsjzeDHcrS7s5VUWnUV5cLOCI2mrF81fw1OglMQIsS_.l3l552l3GwAr2pBpY0g
 2LyzcpalIxtxGMKbKUBOnF04rllPZdm9sDFCziN_Pev4r7RY1OmptKb4ijiTB0SRoghfCFr4KBXa
 QYaPzWyaTqWVs0rqmva9V1OoZnKUZ1.cwIVid8DZlDU9WgMhrqk43o4TBH29UlkOt.dVyk2nl0EK
 lLCo-
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 3d8495f8-08f8-4331-ad32-4cda6f07ae8f
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.gq1.yahoo.com with HTTP; Mon, 18 Aug 2025 19:36:15 +0000
Received: by hermes--production-ir2-858bd4ff7b-9hnb8 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 770dc5b5c7bc51b7c8c3e3830a69544b; 
 Mon, 18 Aug 2025 19:36:10 +0000 (UTC)
From: Ruben Wauters <rubenru09@aol.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ingo Molnar <mingo@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jani Nikula <jani.nikula@intel.com>,
 Jocelyn Falempe <jfalempe@redhat.com>
Cc: Ruben Wauters <rubenru09@aol.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/gud: Replace simple display pipe with DRM atomic
 helpers
Date: Mon, 18 Aug 2025 20:35:26 +0100
Message-ID: <20250818193553.2162-1-rubenru09@aol.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250818193553.2162-1-rubenru09.ref@aol.com>
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
I noticed as well elsewhere in the driver WARN_ON_ONCE was used instead
of drm_WARN_ON_ONCE(). I have fixed it for the ones I've modified, and
will fix it for the driver as a whole in another patch.

v2 changes:
- address review comments by reorganising gud_probe()

v3 changes:
- fix formatting and spacing
- remove unnecessary includes
- convert WARN_ON_ONCE() to drm_WARN_ON_ONCE()
- remove dst rect intersect check
- remove encoder from gud_device and switch to gconn->encoder
---
 drivers/gpu/drm/gud/gud_connector.c | 25 +++++------
 drivers/gpu/drm/gud/gud_drv.c       | 52 ++++++++++++++++++-----
 drivers/gpu/drm/gud/gud_internal.h  | 13 +++---
 drivers/gpu/drm/gud/gud_pipe.c      | 64 +++++++++++++++++++----------
 4 files changed, 99 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_connector.c b/drivers/gpu/drm/gud/gud_connector.c
index 0f07d77c5d52..4a15695fa933 100644
--- a/drivers/gpu/drm/gud/gud_connector.c
+++ b/drivers/gpu/drm/gud/gud_connector.c
@@ -16,7 +16,6 @@
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/gud.h>
 
 #include "gud_internal.h"
@@ -607,13 +606,16 @@ int gud_connector_fill_properties(struct drm_connector_state *connector_state,
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
 
@@ -681,20 +683,13 @@ static int gud_connector_create(struct gud_device *gdrm, unsigned int index,
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
+	gconn->encoder.possible_crtcs = drm_crtc_mask(&gdrm->crtc);
+	ret = drm_encoder_init(drm, &gconn->encoder, &gud_drm_simple_encoder_funcs_cleanup,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
 
-	return drm_connector_attach_encoder(connector, encoder);
+	return drm_connector_attach_encoder(connector, &gconn->encoder);
 }
 
 int gud_get_connectors(struct gud_device *gdrm)
diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 5385a2126e45..5f57f841e603 100644
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
@@ -27,7 +28,6 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/gud.h>
 
 #include "gud_internal.h"
@@ -289,7 +289,7 @@ static int gud_get_properties(struct gud_device *gdrm)
 			 * but mask out any additions on future devices.
 			 */
 			val &= GUD_ROTATION_MASK;
-			ret = drm_plane_create_rotation_property(&gdrm->pipe.plane,
+			ret = drm_plane_create_rotation_property(&gdrm->plane,
 								 DRM_MODE_ROTATE_0, val);
 			break;
 		default:
@@ -338,10 +338,30 @@ static int gud_stats_debugfs(struct seq_file *m, void *data)
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
@@ -350,7 +370,7 @@ static const struct drm_mode_config_funcs gud_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
-static const u64 gud_pipe_modifiers[] = {
+static const u64 gud_plane_modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_INVALID
 };
@@ -567,12 +587,17 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
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
 
@@ -582,7 +607,12 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		return ret;
 	}
 
-	drm_plane_enable_fb_damage_clips(&gdrm->pipe.plane);
+	ret = drm_crtc_init_with_planes(drm, &gdrm->crtc, &gdrm->plane, NULL,
+					&gud_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+
+	drm_crtc_helper_add(&gdrm->crtc, &gud_crtc_helper_funcs);
 
 	ret = gud_get_connectors(gdrm);
 	if (ret) {
diff --git a/drivers/gpu/drm/gud/gud_internal.h b/drivers/gpu/drm/gud/gud_internal.h
index d6fb25388722..d27c31648341 100644
--- a/drivers/gpu/drm/gud/gud_internal.h
+++ b/drivers/gpu/drm/gud/gud_internal.h
@@ -11,11 +11,11 @@
 #include <uapi/drm/drm_fourcc.h>
 
 #include <drm/drm_modes.h>
-#include <drm/drm_simple_kms_helper.h>
 
 struct gud_device {
 	struct drm_device drm;
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane plane;
+	struct drm_crtc crtc;
 	struct work_struct work;
 	u32 flags;
 	const struct drm_format_info *xrgb8888_emulation_format;
@@ -62,11 +62,10 @@ int gud_usb_set_u8(struct gud_device *gdrm, u8 request, u8 val);
 
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
index 8d548d08f127..54d9aa9998e5 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -20,7 +20,6 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_rect.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/gud.h>
 
 #include "gud_internal.h"
@@ -451,14 +450,15 @@ static void gud_fb_handle_damage(struct gud_device *gdrm, struct drm_framebuffer
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
@@ -469,20 +469,37 @@ int gud_pipe_check(struct drm_simple_display_pipe *pipe,
 	int idx, ret;
 	size_t len;
 
-	if (WARN_ON_ONCE(!fb))
+	if (drm_WARN_ON_ONCE(plane->dev, !fb))
 		return -EINVAL;
 
+	if (drm_WARN_ON_ONCE(plane->dev, !crtc))
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
@@ -500,7 +517,7 @@ int gud_pipe_check(struct drm_simple_display_pipe *pipe,
 	if (!connector_state) {
 		struct drm_connector_list_iter conn_iter;
 
-		drm_connector_list_iter_begin(pipe->crtc.dev, &conn_iter);
+		drm_connector_list_iter_begin(plane->dev, &conn_iter);
 		drm_for_each_connector_iter(connector, &conn_iter) {
 			if (connector->state->crtc) {
 				connector_state = connector->state;
@@ -567,16 +584,18 @@ int gud_pipe_check(struct drm_simple_display_pipe *pipe,
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
+	struct drm_atomic_helper_damage_iter iter;
 	int ret, idx;
 
 	if (crtc->state->mode_changed || !crtc->state->enable) {
@@ -611,7 +630,8 @@ void gud_pipe_update(struct drm_simple_display_pipe *pipe,
 	if (ret)
 		goto ctrl_disable;
 
-	if (drm_atomic_helper_damage_merged(old_state, state, &damage))
+	drm_atomic_helper_damage_iter_init(&iter, old_state, new_state);
+	drm_atomic_for_each_plane_damage(&iter, &damage)
 		gud_fb_handle_damage(gdrm, fb, &shadow_plane_state->data[0], &damage);
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
-- 
2.49.1

