Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C094AC5D3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 17:36:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264C910F8DC;
	Mon,  7 Feb 2022 16:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3E710F8BB
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 16:36:02 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 425982B0014F;
 Mon,  7 Feb 2022 11:36:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 07 Feb 2022 11:36:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=jL7uYegVQeL8Wy6fPZYFOhl8vanvRS
 yOBuwigSpRMpc=; b=J85drTNnm0oL86qM/72mCsyESh5PMNzlv+yrt9fVA13ain
 6ieumesEwYw3L/YMh6anfJMOxBvLcKJO33mvAHaM9pfdwzFydBMB5kJPvUxCXZsc
 VZOFNF5Sq8dmYGeK6x0PH3M/0F7cmwgWxkTU+7JG90jloofLt7YcMXCYKgei6K+/
 Tsz+lClyWZtqZ2MxNVZXhAGbT01mXkjLNaaHZEOy3Nq3j/1O5Hu+JhUIptkqCHtB
 HWkx71TDa8Ui0+GY7biGrwgTkuWUFT9QhleVnb9DBVK2gaz17j/xiwj+lIBsCD+E
 x6GY8hJhDyE7HZVpIur207H9Gnf0/BSaRCSKiy3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jL7uYe
 gVQeL8Wy6fPZYFOhl8vanvRSyOBuwigSpRMpc=; b=EJZi1O7SkDtyJ1HekQvuId
 9Fl578Lc3RQa0WotvZKeZs0qfR6cqa43PQYPGayNneVT7AZNGxs3DU6NRCEGP3Bf
 BsWJIAVXXIqfSn/LbbKeus8IpyJ3EjPdmP9E/QyqF6JP93Sk4shUmw+bmugrSC8G
 GgyT7wikO+1sAjcd6QrmDmepNFGXKRwLro6WApPb34PUIrwfMLKL41v+lCKVNICd
 HZGdWywM3qL8suiOsRN+NPeBQrVb33Yr1BLAHQQEfQB01HAEBQFEsIe2Gj3ChJDA
 G2h2Bthsc/MLARmHaD7BLF571uTuQZ3CDjp97YO30Cos809F98d+Dg6fMVCiwfrA
 ==
X-ME-Sender: <xms:cEoBYmvWxLw0Uhx71gsJU3jNs0Y_vde_Te-Po8aRke-gnfcRZI0OAQ>
 <xme:cEoBYreJDfX9yYVDGrD6WiPsiHHEOwPN2bjjRaXXoF1cer5E8S9alhDn7ESGsvuWd
 80RFuYCeQzUUro3nsU>
X-ME-Received: <xmr:cEoBYhxlkh4-b-ckseno2a6Mq6E7EA_xPcXmnl7iDOv-c0aw79ubVa1-cL9qlwKORUG8hzGHCHNZhbaBUmYElHxA16xiY_TsEAmuL3Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cEoBYhOh302pzaVoO9uYIz6j3FVHdiqQeBLHgXhNCkvkYybHdyZikQ>
 <xmx:cEoBYm9rtkZ5nmc_vAPcp2a0ABMMgC9PR0BZuZWQ1Y9JUV86R8hnlQ>
 <xmx:cEoBYpUUbM2b8TDz3djKTMMbMlsZOUsxprNbVHkPRjcCbrBcmZDA0g>
 <xmx:cEoBYpYsu74ynebZcmZdT9kJNl87hRwlfZpdVDPI0nLXfJCruKcSDEdU9Zg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 11:36:00 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 14/23] drm/omap: plane: Fix zpos initial value mismatch
Date: Mon,  7 Feb 2022 17:35:06 +0100
Message-Id: <20220207163515.1038648-15-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207163515.1038648-1-maxime@cerno.tech>
References: <20220207163515.1038648-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomba@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While the omap_plane_init() function calls
drm_plane_create_zpos_property() with an initial value of 0,
omap_plane_reset() will force it to another value depending on the plane
type.

Fix the discrepancy by setting the initial zpos value to the same value
in the drm_plane_create_zpos_property() call.

Cc: Tomi Valkeinen <tomba@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/omapdrm/omap_plane.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index b35205c4e979..e67baf9a942c 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -533,6 +533,7 @@ struct drm_plane *omap_plane_init(struct drm_device *dev,
 	unsigned int num_planes = dispc_get_num_ovls(priv->dispc);
 	struct drm_plane *plane;
 	struct omap_plane *omap_plane;
+	unsigned int zpos;
 	int ret;
 	u32 nformats;
 	const u32 *formats;
@@ -564,7 +565,16 @@ struct drm_plane *omap_plane_init(struct drm_device *dev,
 	drm_plane_helper_add(plane, &omap_plane_helper_funcs);
 
 	omap_plane_install_properties(plane, &plane->base);
-	drm_plane_create_zpos_property(plane, 0, 0, num_planes - 1);
+
+	/*
+	 * Set the zpos default depending on whether we are a primary or overlay
+	 * plane.
+	 */
+	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
+		zpos = 0;
+	else
+		zpos = omap_plane->id;
+	drm_plane_create_zpos_property(plane, zpos, 0, num_planes - 1);
 	drm_plane_create_alpha_property(plane);
 	drm_plane_create_blend_mode_property(plane, BIT(DRM_MODE_BLEND_PREMULTI) |
 					     BIT(DRM_MODE_BLEND_COVERAGE));
-- 
2.34.1

