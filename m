Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2194570909
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E241902FB;
	Mon, 11 Jul 2022 17:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F41D902F9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:13 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C312A5C0162;
 Mon, 11 Jul 2022 13:40:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 11 Jul 2022 13:40:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561212; x=1657647612; bh=g+
 c2P0WM5+6YNkAz9QjIqt8yEn/XxjI5gjlYe1i0StA=; b=DYP9ERzfopHrqZRC30
 Se7vQLSe7zPCfdsTIE7qiGZNPR2F+R3oQu/ehC/362UXTt79OsoRPomA87UN9uR1
 SGx8UQl5zFBZPcAlhWHeCOI25fry84WtaPTVofbGDHtsvN5lqlrc46J/Tkmw/Mkw
 GOW11a7ILpgGso/XdQiYohnE+uQ/uTCZOABaggsWvDZnRXL7sNIw2luD4w/2sRaP
 MK79CJGOU51N2qaJ1cJ7q+IQFaIVYIBJsj1nXeetleD35/c9M5YN8VQWQYmcdI3n
 i1pn1KUHJSobzx6INEZ7uACwjRU2MGi5s4HxgyY8EbXCXfrEp1m6m/QWu7/d8pjf
 tZ3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561212; x=1657647612; bh=g+c2P0WM5+6YN
 kAz9QjIqt8yEn/XxjI5gjlYe1i0StA=; b=CLO6RA84zg8bbvuCMGliKyYZtQ12j
 QiCTm9lhi6XLsy2O+MObLDcaOxwP6FiiqBTWzqYGF8FMEtJjoZWlWkpT71/nU+m0
 Ann5JtrQWu6dpHQ8ykgHHiLJlD4AqU3rd2wNJUuaLZ7z5/CjuAUyvNpjtslbbj3W
 45RagxiWwzI4S8GMJCkd4O+9aTNU1z3G7hr/1HhXGMYX2EPWqlvbpUWFSMqLAdYu
 a7NBhM7VJK4Woi9o5EW0pfCnES2ewCstS+zl5Q8Wg5GP3boSOfA1alUkPbIcBm4V
 A0XrLCLROtTlpygQv8nJ2wIg503nwmOxR6SE2tkjbgc4ZWNVswpXAqeOw==
X-ME-Sender: <xms:fGDMYluYLvqf9YLZ2yo3q0ALPO1eV86Ve11c7kaealRYkkcT-4LqzQ>
 <xme:fGDMYue8kghLf4N7AbaX3eVWIY3kVgONF7-8NqUczd2yuyGLt2ayElfCUjlEre4LJ
 KZkMuYS1tIdDVIXVao>
X-ME-Received: <xmr:fGDMYoxQhuoJawmneVyEa-Hy7dD49MrnvShKlRns0idrhDk6FbxwUKMxYUWq4JHDKKmVgv11ZxiI8yhLF68g5Q6m0q88gUxWAuEhV9o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepieenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:fGDMYsN_gXXCHYafdEap150PJEu2RL5BMyeQP4fDbLVJ8Q7x7hKWNg>
 <xmx:fGDMYl9c9H6vpOejFohM4q7tGZVy3esfj3h3BASxUV6hRh4E0ryzHw>
 <xmx:fGDMYsVKg6M2vxAHFK2ClPS0jQkYNJlwYhu-O11EZkRCkQ9-PDdzJw>
 <xmx:fGDMYolV10n7ZaR8sXteMbwB50FOX77Y2hrI3ojhHQ8ZbWqs0Jxdqw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 17/69] drm/vc4: plane: Take possible_crtcs as an argument
Date: Mon, 11 Jul 2022 19:38:47 +0200
Message-Id: <20220711173939.1132294-18-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711173939.1132294-1-maxime@cerno.tech>
References: <20220711173939.1132294-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

vc4_plane_init() currently initialises the plane with no possible CRTCs,
and will expect the caller to set it up by itself.

Let's change that logic a bit to follow the syntax of
drm_universal_plane_init() and pass the possible CRTCs bitmask as an
argument to the function instead.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c  |  2 +-
 drivers/gpu/drm/vc4/vc4_drv.h   |  3 ++-
 drivers/gpu/drm/vc4/vc4_plane.c | 15 +++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index faad9e564772..d391e894ee6c 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1244,7 +1244,7 @@ int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
 	 * requirement of the plane configuration, and reject ones
 	 * that will take too much.
 	 */
-	primary_plane = vc4_plane_init(drm, DRM_PLANE_TYPE_PRIMARY);
+	primary_plane = vc4_plane_init(drm, DRM_PLANE_TYPE_PRIMARY, 0);
 	if (IS_ERR(primary_plane)) {
 		dev_err(drm->dev, "failed to construct primary plane\n");
 		return PTR_ERR(primary_plane);
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index de326cf10564..d935aa3e4409 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -960,7 +960,8 @@ int vc4_kms_load(struct drm_device *dev);
 
 /* vc4_plane.c */
 struct drm_plane *vc4_plane_init(struct drm_device *dev,
-				 enum drm_plane_type type);
+				 enum drm_plane_type type,
+				 uint32_t possible_crtcs);
 int vc4_plane_create_additional_planes(struct drm_device *dev);
 u32 vc4_plane_write_dlist(struct drm_plane *plane, u32 __iomem *dlist);
 u32 vc4_plane_dlist_size(const struct drm_plane_state *state);
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index f27e87a23df7..a344762d86eb 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1492,7 +1492,8 @@ static const struct drm_plane_funcs vc4_plane_funcs = {
 };
 
 struct drm_plane *vc4_plane_init(struct drm_device *dev,
-				 enum drm_plane_type type)
+				 enum drm_plane_type type,
+				 uint32_t possible_crtcs)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_plane *plane = NULL;
@@ -1523,7 +1524,7 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 	}
 
 	plane = &vc4_plane->base;
-	ret = drm_universal_plane_init(dev, plane, 0,
+	ret = drm_universal_plane_init(dev, plane, possible_crtcs,
 				       &vc4_plane_funcs,
 				       formats, num_formats,
 				       modifiers, type, NULL);
@@ -1575,13 +1576,11 @@ int vc4_plane_create_additional_planes(struct drm_device *drm)
 	 */
 	for (i = 0; i < 16; i++) {
 		struct drm_plane *plane =
-			vc4_plane_init(drm, DRM_PLANE_TYPE_OVERLAY);
+			vc4_plane_init(drm, DRM_PLANE_TYPE_OVERLAY,
+				       GENMASK(drm->mode_config.num_crtc - 1, 0));
 
 		if (IS_ERR(plane))
 			continue;
-
-		plane->possible_crtcs =
-			GENMASK(drm->mode_config.num_crtc - 1, 0);
 	}
 
 	drm_for_each_crtc(crtc, drm) {
@@ -1589,9 +1588,9 @@ int vc4_plane_create_additional_planes(struct drm_device *drm)
 		 * since we overlay planes on the CRTC in the order they were
 		 * initialized.
 		 */
-		cursor_plane = vc4_plane_init(drm, DRM_PLANE_TYPE_CURSOR);
+		cursor_plane = vc4_plane_init(drm, DRM_PLANE_TYPE_CURSOR,
+					      drm_crtc_mask(crtc));
 		if (!IS_ERR(cursor_plane)) {
-			cursor_plane->possible_crtcs = drm_crtc_mask(crtc);
 			crtc->cursor = cursor_plane;
 		}
 	}
-- 
2.36.1

