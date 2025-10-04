Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DB5BB90B9
	for <lists+dri-devel@lfdr.de>; Sat, 04 Oct 2025 20:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522F710E00D;
	Sat,  4 Oct 2025 18:03:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="aLxenDa9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic308-55.consmr.mail.gq1.yahoo.com
 (sonic308-55.consmr.mail.gq1.yahoo.com [98.137.68.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67ABD10E00D
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Oct 2025 18:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1759601034; bh=lkyG98f4QiKx6NyUSEZmeM1WjKuHQ+VrmQ9aD/yxy9Y=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=aLxenDa9W3g0XPBFjUQE1XHcHXbbHgoXtgsV+iDraTJvrP0zc+fLMtBm5yG9wxnf+OWC3ETKD7/+lL+x39e6v3jCL3WHTkA60RcaBtZPIwLVWu12EI+5qlIr2MsUmzOzpB9se+QmNLKhj5X5D93+JDqjaS9kroR+q5E5Wegku1DCsOdd5H6cCpIESBcUxJZ9yxW/1UhJQux2T+tn8UDfmaqvm6j25cMNpc13As59d7Lv8NWSD2RQ8Zid0ZiPndjn1UgvuZouN426npcZfnpl/NfbMOJ306Ib5fuiWfUD9cC66URW/zmnSAYZ9EFO6aFyHqageDxZPLZecOlxBbBfdg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1759601034; bh=B9Zdyz+1cTzxJ4pOJaMFhHSEyKuUAMOOuKxvXmGX0v8=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=ZgUgJwSecnGJntoqAjxr3te1RelAhmCLz5aXiv3JvKh5l2F7aWQg7mBHHgatHYhU00jb7A8TJzpjbBrUoJHwHBuUZQpRy6tO4mM8fbK/m0B2IUuhzC/NhVU+R5uPw45Ad3DxnKCeZzwolRim2k8LSVguBzU5rMPXhtqq4O37nUpvSnoitDDLBVc8gP5cCE+G5QW0G/EDlrNYZdDaBWMB+CnokMf16bHfDUVaOPN/bAey+4Kl+yFYq7/ZV0ddmu/DE9Pa7rPbkhot8BtRHS7C9L727hnJu6qp4tgVb/FWWa2EdE5Jrc6HacpQ67H+19kHmHvNJCnATLR5BDbnxxeuhg==
X-YMail-OSG: c2PbrJgVM1npkwl3SfuC3WPRnl567mrpSrRZenAQRaqL6Ms63R5Sfsx26pUi3xO
 Wy8Re1Gr0Z8bdPiY30vXbbUltY0GhSK61Jqk10roxdDnhpeKt6Fa6nLS0.yCnuIyzSi2GvGK3hZm
 nT1Ldx2Mz3r_yPmBsCPdvGhr4Aev78H7TU_SBBzrEQQ0dZPMIIcP0D7JLe5pf2fYs0snw58A4_vJ
 L8yhTcGy62K_.zGhHIZ79bvxxZ5jupysbbY7OkOVjvyCzyfRtF7_1XulF2QHxCA5mSM0gtCnXrQJ
 xP9IdzZB0qvC6FgXFrE.F5yjsJxqzbbY2GjrPG_gWWHwetYU3UrCs_QCeF2a3uNt93GuaY4YUuA5
 zVhpBY41RKsQLZwVb0p2crWU04.Jdf4djt9n.YhDCYhroMeJfaekOvYxeM4oGvvipaUGijSSO0F9
 KX2oN53rU3MWThDh7Qp2PDkPjduRBhiAmruQUQXRMxVE9HmKD5e2zwJChLE7A5.hvV1FB0CpwEJc
 3dO5XzRB88k0e9riQ6r.MACjqj0EBeo.oVsJKAmOsM3NjikI3EJSDG4fV1dtWUvTUBN.iR5mTFKB
 jo3070fbKT9UAkalKkItnvRm_B6kGzLilSysyYxxuDe2Sn4xZv5fsi_CIll1ZqPh1wlJlNWpEBxe
 iEP880dBA8VrH09yM5ERGyN3iwXQv59Jx4ryh9qgeVi5i0v05tbXFkixaswmEacMwMF3rd64Gycb
 M87iPfpRAmKG8lOW1ojQv2jj04Jy9N3VH3JZWay5ebT9.Iy44JpUZGSyQI.8H3PEGo4.bdSkbWaD
 lqsw2D.8BP7kEBe0PNn.PeM0oZ9caE0FOZWQoV_EOEx3sDqFdMhC2eP8Pl0TywW4sxV3LkKFPmKP
 SXjCRucO3yVCUG9N9.yE0yRojt02kmcZPinQj0HPlfBr460xqut8p2bdacP356ULdY5BhHkCe2dw
 ggeB9Psj7ZEUiKdHiqu7QQ0u38qk5gSfolcnHIVXl.SqAUd5Eg9jxzizkJOkzdv1DDFDDa1gJFpU
 IlDN_QzCK3tJc4vNdSdV3B92sh46QtFPhHwxAIOkTsxa8G3PNdkLyT6lDTM9U1ZZYOjeqMcmaQLd
 8M_YJyqJoBti3vKgPhHTxidzA0GDHtgzNKtzIt0RaasUsow61PaZogsLkXqUHP8eoQ_DVro0NwPA
 GTrcvaq4piOuBqhEbgVSqFOUMc_3TV9jGQa.xodff49._FkEgl1FlZ1pFxUq_PUrkC9amJX0pZ7r
 LpqT3CVOGQFn9Mh86JgZlcxaLtZZ7ujTrzrz1AKfdBtdK3FQTUTE0pAgBcQs7yPZIt3tEjPjtrYa
 ttRxzc8shd2J.GKolYow_hOkARoadKyoWog6ho1N_NzKP6D9Y60bspaccDvDADILkTExGL7Xtv0.
 YpY7i5s.Qsytvzsjt4uDplvhRDyoh08AvdZ68jNLXkdTCgd7RgvK4oGUhR5hXaN3OJfqFc80eKEy
 T2etpdRp0pTW5YiCUrUxEHqIfdGm3AZCVP8XZyMwZGviBORZ3Tf9CTTS5lidVmXsDaKqr6J6ORH3
 xIWa9OObChn_XMjUG7Qfh9Vmsc2EnH2ab4UbEScFMNRNPIlaeg7wND_V3VOcUAKqOj0bJo0mvIx3
 1DnjaMaFneaKyRH2fsv8QnFf0Jk6perSjz5woU1Fif09QUKFPOlPRe.Q9zkmaJUW_jxpfNVfcW3V
 PPeA6LgZdsl4Lvg16EpbvfIWKhByK5uy5MwR9K2W.hWYnXkopeRt.1AHNI0xdNSiKx9C5IIwL3hi
 Y6nWIggGzYMh7A74R2D.3Ld719frR_naOLdI5mwbMiX4bXqUExbiGGTsXsWTvU3X8.jEwpTaewio
 jjOXMHOerWzkDKjZGIipU9dKP8uL.uVrtYJcpN27yk.Tbu6ftSDoBFKA2r0DNFS.Jd9g9CyFbJ.n
 7rR_Bj44MypA6hHBxD_bqhYHh5fa_XYm48iECn0HU1154Fk3N6dTgI3FJ9B0XSDkFtgWZUvI628q
 cPEmlHaye4I04peo8KOiwF6Qdzo3.5CL5.4Yb8W1j0xGvVkypQjfCsClX8TfMVg88hf0xpbfF1q0
 R1MK_G0JU.GvHTJvmGYi.LAYedAfsP3LyLodznjDSVGfvOrUjxE7UI.EPXFIKwk08OtD33PQrg7z
 FFscCPBiqVno8XNezOHPjoDT9r_xhI2ZThvp4Sbiktw.iQUa8EN9qdMhDnoKVe27HB0FMpBrQHRi
 iSAjPn1vgkVf26_YNKGO2KLL_y7OaL2KIRjyoKrMMPxYqLKJ4cvWJ6zW_W2w2O4vpA_8iATnLTQG
 w
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 14c02d5c-fdda-4d2c-8577-5699618924bc
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Sat, 4 Oct 2025 18:03:54 +0000
Received: by hermes--production-ir2-ccdb4f9c8-gvlwm (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 8bd04abe6e5a0119dbd6fc973ab909e4; 
 Sat, 04 Oct 2025 18:03:51 +0000 (UTC)
From: Ruben Wauters <rubenru09@aol.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Ruben Wauters <rubenru09@aol.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/gud: move plane init to gud_pipe.c
Date: Sat,  4 Oct 2025 18:49:56 +0100
Message-ID: <20251004175900.15235-2-rubenru09@aol.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20251004175900.15235-2-rubenru09.ref@aol.com>
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

gud_probe() currently is a quite large function that does a lot of
different things, including USB detection, plane init, and several other
things.

This patch moves the plane and crtc init into gud_plane_init() in
gud_pipe.c, which is a more appropriate file for this. Associated
variables and structs have also been moved to gud_pipe.c

Signed-off-by: Ruben Wauters <rubenru09@aol.com>
---
It was somewhat difficult to determine what exactly should be moved
over, gud_probe() as a function quite a mess, so I need to figure out
exactly how to split this one up.

As an aside, I noticed that the driver doesn't have a version macro in
gud_drv.c, and therefore is shown as 1.0.0. I was thinking of
introducing a version, but I wanted to know how others generally deal
with driver versions. I'm not 100% sure if it's *necessary* for GUD but
it might be a good idea.
---
 drivers/gpu/drm/gud/gud_drv.c      | 48 +-----------------------
 drivers/gpu/drm/gud/gud_internal.h |  1 +
 drivers/gpu/drm/gud/gud_pipe.c     | 60 ++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index b7345c8d823d..967c16479b5c 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -16,7 +16,6 @@
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
-#include <drm/drm_crtc_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
@@ -338,43 +337,12 @@ static int gud_stats_debugfs(struct seq_file *m, void *data)
 	return 0;
 }
 
-static const struct drm_crtc_helper_funcs gud_crtc_helper_funcs = {
-	.atomic_check = drm_crtc_helper_atomic_check
-};
-
-static const struct drm_crtc_funcs gud_crtc_funcs = {
-	.reset = drm_atomic_helper_crtc_reset,
-	.destroy = drm_crtc_cleanup,
-	.set_config = drm_atomic_helper_set_config,
-	.page_flip = drm_atomic_helper_page_flip,
-	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
-};
-
-static const struct drm_plane_helper_funcs gud_plane_helper_funcs = {
-	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
-	.atomic_check = gud_plane_atomic_check,
-	.atomic_update = gud_plane_atomic_update,
-};
-
-static const struct drm_plane_funcs gud_plane_funcs = {
-	.update_plane = drm_atomic_helper_update_plane,
-	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = drm_plane_cleanup,
-	DRM_GEM_SHADOW_PLANE_FUNCS,
-};
-
 static const struct drm_mode_config_funcs gud_mode_config_funcs = {
 	.fb_create = drm_gem_fb_create_with_dirty,
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
-static const u64 gud_plane_modifiers[] = {
-	DRM_FORMAT_MOD_LINEAR,
-	DRM_FORMAT_MOD_INVALID
-};
-
 DEFINE_DRM_GEM_FOPS(gud_fops);
 
 static const struct drm_driver gud_drm_driver = {
@@ -587,17 +555,10 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 			return -ENOMEM;
 	}
 
-	ret = drm_universal_plane_init(drm, &gdrm->plane, 0,
-				       &gud_plane_funcs,
-				       formats, num_formats,
-				       gud_plane_modifiers,
-				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	ret = gud_plane_init(gdrm, formats, num_formats);
 	if (ret)
 		return ret;
 
-	drm_plane_helper_add(&gdrm->plane, &gud_plane_helper_funcs);
-	drm_plane_enable_fb_damage_clips(&gdrm->plane);
-
 	devm_kfree(dev, formats);
 	devm_kfree(dev, formats_dev);
 
@@ -607,13 +568,6 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		return ret;
 	}
 
-	ret = drm_crtc_init_with_planes(drm, &gdrm->crtc, &gdrm->plane, NULL,
-					&gud_crtc_funcs, NULL);
-	if (ret)
-		return ret;
-
-	drm_crtc_helper_add(&gdrm->crtc, &gud_crtc_helper_funcs);
-
 	ret = gud_get_connectors(gdrm);
 	if (ret) {
 		dev_err(dev, "Failed to get connectors (error=%d)\n", ret);
diff --git a/drivers/gpu/drm/gud/gud_internal.h b/drivers/gpu/drm/gud/gud_internal.h
index d27c31648341..4a91aae61e50 100644
--- a/drivers/gpu/drm/gud/gud_internal.h
+++ b/drivers/gpu/drm/gud/gud_internal.h
@@ -69,6 +69,7 @@ void gud_plane_atomic_update(struct drm_plane *plane,
 int gud_connector_fill_properties(struct drm_connector_state *connector_state,
 				  struct gud_property_req *properties);
 int gud_get_connectors(struct gud_device *gdrm);
+int gud_plane_init(struct gud_device *gdrm, u32 *formats, unsigned int num_formats);
 
 /* Driver internal fourcc transfer formats */
 #define GUD_DRM_FORMAT_R1		0x00000122
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 3a208e956dff..1f7af86b28fd 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -10,6 +10,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_connector.h>
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_format_helper.h>
@@ -450,6 +451,65 @@ static void gud_fb_handle_damage(struct gud_device *gdrm, struct drm_framebuffer
 	gud_flush_damage(gdrm, fb, src, !fb->obj[0]->import_attach, damage);
 }
 
+static const struct drm_plane_funcs gud_plane_funcs = {
+	.update_plane = drm_atomic_helper_update_plane,
+	.disable_plane = drm_atomic_helper_disable_plane,
+	.destroy = drm_plane_cleanup,
+	DRM_GEM_SHADOW_PLANE_FUNCS,
+};
+
+static const struct drm_plane_helper_funcs gud_plane_helper_funcs = {
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.atomic_check = gud_plane_atomic_check,
+	.atomic_update = gud_plane_atomic_update,
+};
+
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
+static const u64 gud_plane_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
+int gud_plane_init(struct gud_device *gdrm, u32 *formats, unsigned int num_formats)
+{
+	struct drm_device *drm = &gdrm->drm;
+	struct drm_plane *plane = &gdrm->plane;
+	struct drm_crtc *crtc = &gdrm->crtc;
+	int ret;
+
+	ret = drm_universal_plane_init(drm, plane, 0,
+				       &gud_plane_funcs,
+				       formats, num_formats,
+				       gud_plane_modifiers,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+
+	drm_plane_helper_add(plane, &gud_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(plane);
+
+	ret = drm_crtc_init_with_planes(drm, crtc, plane, NULL,
+					&gud_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+
+	drm_crtc_helper_add(crtc, &gud_crtc_helper_funcs);
+
+	return 0;
+}
+
 int gud_plane_atomic_check(struct drm_plane *plane,
 			   struct drm_atomic_state *state)
 {
-- 
2.49.1

