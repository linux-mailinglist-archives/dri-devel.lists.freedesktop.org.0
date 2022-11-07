Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B038D61F5A0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 15:19:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343FD10E366;
	Mon,  7 Nov 2022 14:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E66B10E35C;
 Mon,  7 Nov 2022 14:18:16 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id CE57A2B0670C;
 Mon,  7 Nov 2022 09:18:13 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 07 Nov 2022 09:18:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667830693; x=
 1667837893; bh=7oYNZ/WLyFOxEAuVgKzwZ3R8/Ec3wa7tyLYyhZ7n/Ac=; b=U
 WVt0NRqrOKzhg0jaWB6KwmoUajoNImWOsli1vhP4lHF48CgGnaJyOwaf7f9g8ZKO
 yYZsYz25h0d6v2ls6m1w+lCx473ttf2nj0cloqaJevsfUmoAyrrVrs9kzwg5lniy
 +oaSBTl9PcgHSlm8LJfih0+1Yqq24RvUktwayKD3hNE8ylcG4FBYbR/XsD9Vd/2D
 yH6mrdR62fUn9yciHD52FKCcIzY2Ritq/7oINP0wfHE4+p0H47W4scYnP5m83IuH
 pVPJNKNMkO9jYyQ93f3/dkZeinkYPfpE0DudmT6M7hzIoHQ++UTLZvYRuwms3zuN
 2lPpo4nKbQx2MHDtE/TWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667830693; x=
 1667837893; bh=7oYNZ/WLyFOxEAuVgKzwZ3R8/Ec3wa7tyLYyhZ7n/Ac=; b=L
 GFdWG3Mjm185NnfeLLEY7l4YzHxgB75dJ+i5Y6t965fF0WaTEZMKSkPsPvEE1Wuh
 h6nm4k++gLJMuNWYMx+YA2nWr3rs+VFRvIKXm8CJMxl2UMBVY4pfoDq3nvdhFTLh
 D0b+qkrcRO1FrXDYEqWUoOyYalH/pq0g4ZvxOBDGZBdwzJH2EhOGW8zcQ5TqWJgH
 lMIzuawZsX/3oyV1NdBgV9bUs0Ju7Kt7BxjGUA9qr6gleeVbSnfL+55AKHWuN45o
 ptBlCohLqRWodOdwTeZcmVnSdJDNyDx5TPIeE5JsTgAPr3EqwsvaoxIHYCnNT2VQ
 FiUcAAjJdVvloi7nInxVw==
X-ME-Sender: <xms:pBNpY5TOchW4BG3JDsRHpkRHJkERb7oVSJlBTO_sRmbvy7pRubgJaw>
 <xme:pBNpYywJ4VfXURgsnM0MdUUK8OLb91DmDCRJ_It7tQss0MMNaY3kNjGgSzzK7ucSy
 zPEqQctQHgYndYOEDk>
X-ME-Received: <xmr:pBNpY-3H_iyxyvl10zSi6W81nk_07bfWQIbQu8CJKl48htnMW_dPGRQs0LPLjlE0btMPR0cVLhBpGKIQvuQVHDtPpq9CPj67yJsPdFI9IVxRrw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:pRNpYxB6eSm61CXzdScpcB9fp9iamUi2v-Kwjuv3LC1l7o8CBfLcrA>
 <xmx:pRNpYygdZ2_PMjY1tJiAxbToXFKcHd5qBcOSgg5O4kSW7kimO2vH7A>
 <xmx:pRNpY1r23yTjM6z72nrLSOKzOj8_jsO0xGOeV5os0BOv50bqfgtZ1A>
 <xmx:pRNpYwOH2fc4LPY9Qn0whvj0E4yBBFe1tRlVat7t1SUaZibtdDk18Ai0p4Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 09:18:12 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 07 Nov 2022 15:16:46 +0100
Subject: [PATCH v7 20/23] drm/vc4: vec: Check for VEC output constraints
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v7-20-7072a478c6b3@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Lyude Paul <lyude@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=2459; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=OzLQ7pSaF80hWp8dAqMToRnA49hvkRverKkh4PGYboM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmZwg6Z7MKRcsVOWvlz93/p0/+8+v/Zb7cluP5MFUkxtctJ
 vXO2o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABNZzcrIcPBFc/S+PzJiLxlbzlhvsm
 Te+ntJc+aDWz87JkioKNxR8mb4733A1zP4+0zzjvn5Z5ftDVw+5euNj9qp95XcU5xM5T3vsQAA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>

The VEC can accept pretty much any relatively reasonable mode, but still
has a bunch of constraints to meet.

Let's create an atomic_check() implementation that will make sure we
don't end up accepting a non-functional mode.

Acked-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes in v6:
- Used htotal instead of vtotal to discriminate PAL against NTSC
---
 drivers/gpu/drm/vc4/vc4_vec.c | 50 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 90e375a8a8f9..bfa8a58dba30 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -453,6 +453,7 @@ static int vc4_vec_encoder_atomic_check(struct drm_encoder *encoder,
 					struct drm_crtc_state *crtc_state,
 					struct drm_connector_state *conn_state)
 {
+	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	const struct vc4_vec_tv_mode *vec_mode;
 
 	vec_mode = &vc4_vec_tv_modes[conn_state->tv.legacy_mode];
@@ -461,6 +462,55 @@ static int vc4_vec_encoder_atomic_check(struct drm_encoder *encoder,
 	    !drm_mode_equal(vec_mode->mode, &crtc_state->adjusted_mode))
 		return -EINVAL;
 
+	if (mode->crtc_hdisplay % 4)
+		return -EINVAL;
+
+	if (!(mode->crtc_hsync_end - mode->crtc_hsync_start))
+		return -EINVAL;
+
+	switch (mode->htotal) {
+	/* NTSC */
+	case 858:
+		if (mode->crtc_vtotal > 262)
+			return -EINVAL;
+
+		if (mode->crtc_vdisplay < 1 || mode->crtc_vdisplay > 253)
+			return -EINVAL;
+
+		if (!(mode->crtc_vsync_start - mode->crtc_vdisplay))
+			return -EINVAL;
+
+		if ((mode->crtc_vsync_end - mode->crtc_vsync_start) != 3)
+			return -EINVAL;
+
+		if ((mode->crtc_vtotal - mode->crtc_vsync_end) < 4)
+			return -EINVAL;
+
+		break;
+
+	/* PAL/SECAM */
+	case 864:
+		if (mode->crtc_vtotal > 312)
+			return -EINVAL;
+
+		if (mode->crtc_vdisplay < 1 || mode->crtc_vdisplay > 305)
+			return -EINVAL;
+
+		if (!(mode->crtc_vsync_start - mode->crtc_vdisplay))
+			return -EINVAL;
+
+		if ((mode->crtc_vsync_end - mode->crtc_vsync_start) != 3)
+			return -EINVAL;
+
+		if ((mode->crtc_vtotal - mode->crtc_vsync_end) < 2)
+			return -EINVAL;
+
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
 	return 0;
 }
 

-- 
b4 0.11.0-dev-99e3a
