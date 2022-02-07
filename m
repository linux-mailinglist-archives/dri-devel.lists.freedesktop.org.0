Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C85D4AC5CC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 17:35:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3058F10F70E;
	Mon,  7 Feb 2022 16:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B7910F70E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 16:35:40 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3F651320217E;
 Mon,  7 Feb 2022 11:35:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 07 Feb 2022 11:35:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=byzTtlzdaImK13sPZJr8iYbs+nhbt0
 JeeeVZ63o95EE=; b=cqKlDrWVchU4qZyTBW/OnDh63qQYbf5fZDqX9OMEIDf6Tw
 orFRmno/eETqzNO1Fn8jTOcn1+UfG0Smn8v6i9SOj8OYRGaQwAe6E2YnjLZgyOHi
 H+X/BjubyVXCppn2nlrGaZ8rkGhH1vTkag3t0cDQhZkK9uOktuBK+v+wnQIvYhWS
 KHjG04AsDK6hZXzsUb6TDqS77x2/sMcHkD2GV9XCuyt7oeL8z9+gIu/aHHkk8nTn
 yXbEbCm5lyuroc8iQpzAJ1oPa9Ya0CUlsLbI3aFFwRsqT1nVu9O6FfE3TB4t3+w5
 BgIqvAZKoVSev/v8M2+3XyySbxL6+y0H0sPNV6Sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=byzTtl
 zdaImK13sPZJr8iYbs+nhbt0JeeeVZ63o95EE=; b=GlW7nMSPd7SYUAC99wLdd6
 e1qJw+mvFgmTl98Sfm6V82xcD6dtRQTFug/SmP+PisjjlvH6W1H5TfwytzXl2c7v
 i4lbqA/7eN3G8I6kYqFMK5ek43SYrl9Msr2qLqozORAt9Qr4OXweumtu23xccjwA
 HgEtp8sv7lHwlMXpdGv25lYBAxKnTqlm8fnI85Nlx7FfG2oSgSB0q8XjP27LG8/9
 uLu4b5AGzCMWr6wPm1vTohi1rlL4vMU0MYgjBiyT01ZEy/G+6lE5t5TwfMJ/OklC
 lNo6atPNOLmVeE4aS+bSyKnwWgjSS2IP7Ssuls/tOIwuGfy0qRkL1BZtP9YQVxnA
 ==
X-ME-Sender: <xms:WkoBYqHSLfqGhyZmKOVu-_7F_hQlGktWCp61zdd6xpd2E9Fm7SXeiw>
 <xme:WkoBYrVwIcPaC5XGLFJdCwQSzLEUe3LjGEyfpljKMQA-Fe5HhTsxGC-mp5sVkAPjN
 E0jocFtES13bDQL2T0>
X-ME-Received: <xmr:WkoBYkLzu_T41ncVKEcNbF9R-itYYFxsIxRg22IBKGztRPUXLZxHAdJazSzpmJpcD5Up5TOFnWT3HVXfa-SxEqdCttfdGCZQuZqDOwU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:WkoBYkFLT9KJMmhW0KK-Q0r7uyrKINw_i7lga7P8IUAGcC3UE5JzOA>
 <xmx:WkoBYgU1j8OwhTVFH8oSsjVtKq9cJ079iAH8s06fCq9lSrovJdIV5g>
 <xmx:WkoBYnOtHqVdBgjoQnXypM29zulKYzJlYQwoucToUyLpbaL3194zng>
 <xmx:WkoBYkowNs1aul1NIhPPQOc5R0uck--Ek-RAM1HAEYy3QP-6ETombw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 11:35:38 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 07/23] drm/object: Add default zpos value at reset
Date: Mon,  7 Feb 2022 17:34:59 +0100
Message-Id: <20220207163515.1038648-8-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The drm_plane_create_zpos_property() function asks for an initial value,
and will set the associated plane state variable with that value if a
state is present.

However, that function is usually called at a time where there's no
state yet. Since the drm_plane_state reset helper doesn't take care of
reading that value when it's called, it means that in most cases the
initial value will be 0, or the drivers will have to work around it.

Let's add some code in __drm_atomic_helper_plane_state_reset() to get
the initial zpos value if the property has been attached in order to fix
this.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index ddcf5c2c8e6a..1412cee404ca 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -243,11 +243,22 @@ EXPORT_SYMBOL(drm_atomic_helper_crtc_destroy_state);
 void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
 					   struct drm_plane *plane)
 {
+	u64 val;
+
 	plane_state->plane = plane;
 	plane_state->rotation = DRM_MODE_ROTATE_0;
 
 	plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
 	plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
+
+	if (plane->zpos_property) {
+		if (!drm_object_property_get_default_value(&plane->base,
+							   plane->zpos_property,
+							   &val)) {
+			plane_state->zpos = val;
+			plane_state->normalized_zpos = val;
+		}
+	}
 }
 EXPORT_SYMBOL(__drm_atomic_helper_plane_state_reset);
 
-- 
2.34.1

