Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5940F60E4D5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3097010E57C;
	Wed, 26 Oct 2022 15:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983EC10E520;
 Wed, 26 Oct 2022 15:34:13 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0556F580260;
 Wed, 26 Oct 2022 11:34:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 26 Oct 2022 11:34:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666798453; x=
 1666805653; bh=7oYNZ/WLyFOxEAuVgKzwZ3R8/Ec3wa7tyLYyhZ7n/Ac=; b=w
 vRO1rADZGvVTmMBx0Fxem3BoR/VPK4lSiDbx+8q73q3EqDyGiUuGzyu/vq2De/Ms
 NJ3FeFuUF+692gXg5GO069y3cCm8zgBfTWSznBInil/d09deIBIPE0vPaWOgEurF
 KXIl9tUr2mcKdkSB0U7lIt1GukVkJCQOVAZQetRIwCHeWVArtUfJQJjj6eybbA6g
 J+x3OwvVqjs48/fNY/WBflBr3Ao1FmxCam/3gaGn1G50ZRqyzX+5+Kp1G3OU33Ho
 lALw56Jf0vdWF9YJNplUvYEQ9U2bvtDw4gKzyOZAz4V8Fw3QZtrFfpdE86YBk++s
 vj/sPvqNBhaBOpOOf/0KQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666798453; x=
 1666805653; bh=7oYNZ/WLyFOxEAuVgKzwZ3R8/Ec3wa7tyLYyhZ7n/Ac=; b=e
 iqJIUi0er26sOMjxeFtrO2OL2UeGkqFie2OQntk5gcb2bQuX8xD/3dwQxfA4Wa94
 H+2iQRhRyEGRWDAOKn8HkCsQ3C+rhN1t0uMKVA0OIB9F2Rt44Uceaak4rx4J4Jno
 SLwujKQIyCpf9qwz/ntIgAANWUjKEwgBsLxsRjvv+IH1D7VsoLw8j+sLVSgxXyYB
 AaZJzidrrkg4dilE2DKdzH2Kz/0Aahk/90UTisxI0B5hGOJpA+zrVDSgZgJJ7gJ8
 wQ085y2QFma4CwIf70H0oTjukGrm+Xs8dQuApQvswiKIkvcDmg7h1PLa1Anu/HJS
 4tTEJE562Ih85/6LgR/mA==
X-ME-Sender: <xms:dFNZYwaSc9Zdb1eB2WJScsjqT_XmyJcKncaEZShFc5ef8Aa3iaoQpg>
 <xme:dFNZY7as5D0Wy3_LwZpsdkqU6uYNzxCP0_VEvY1zRBnBZLVCBArmp8Dr_-IgWOwLQ
 PmZvwkIoZSFjFdzFHw>
X-ME-Received: <xmr:dFNZY69lsdBTx_CMusf0UxrszzcYH3Hca6WL5hfandlH9-4qu5vyZl9aDURzChRnmAQk3Cyu4UDaF_CKwM8vUpowDDSZkKKLGBblc33sAPTnPg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtddvgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpeeltdekveelgfelveelfe
 duheelvdegudffgefhudehgeevjefhhefhhefgvdeuvdenucevlhhushhtvghrufhiiigv
 pedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtg
 hh
X-ME-Proxy: <xmx:dFNZY6rxGgHI0vw3cENKACO9B5hYaHVll1tN-lr0cZ9_HWlSsY5bhQ>
 <xmx:dFNZY7plkx43j5QwMigKfidjTWdL2-5DYEVTO2MD02-cWUJOAQqPHQ>
 <xmx:dFNZY4QIhgbhm_ANYkdpMmV8n3K05d06EWA3ZLrqzP_d2VAWJJD59Q>
 <xmx:dVNZY-WX7A_dOfk96AvMiO0_9FBVFKZHREUSiTBj34oXposgLNAcPQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Oct 2022 11:34:12 -0400 (EDT)
From: maxime@cerno.tech
Date: Wed, 26 Oct 2022 17:33:39 +0200
Subject: [PATCH v6 20/23] drm/vc4: vec: Check for VEC output constraints
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v6-20-e7792734108f@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
To: Karol Herbst <kherbst@redhat.com>, Emma Anholt <emma@anholt.net>,
 Ben Skeggs <bskeggs@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=2459; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=OzLQ7pSaF80hWp8dAqMToRnA49hvkRverKkh4PGYboM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmRwe6BEVNEn6k3bTqS82SGUF7ne5N9ne1VS9gsnvz4d3+J
 lFNwRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACbynZHhf2bjjNsrJl1PTPqaPT35Gd
 f7ktCuMz7iycbrHX9kNdtJn2ZkmDnxYckeYYbuGRFbjrBP6z2SepC9acPG8Jw9R2bLvdXsYAUA
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
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
