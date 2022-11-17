Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B07ED62D70A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 10:31:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFC010E5D3;
	Thu, 17 Nov 2022 09:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5596110E5BE;
 Thu, 17 Nov 2022 09:30:09 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 9CE472B069D0;
 Thu, 17 Nov 2022 04:30:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 17 Nov 2022 04:30:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668677406; x=
 1668684606; bh=akQtkJAgROEQw2R9Du4Mq0QjletHuqb+Y4hQq6KktVI=; b=Y
 TNE9Rp1jjZ8+d/24TbaZM2cP1+/jGx/7gQctL6Ty6uFlawJ0PoVpWUOfGlQEZVT4
 YppnTcFAM91WloJvi6UD07n6ji/tLVB7wRDgEV3EygzZMH/S4VWFJPNUdKm/GudO
 6pyeySdn1Yf+5Q3V1A6iN3tWJpNWO10DTeXAKUuDjGFhfx4WRJ6cENMQsygkIW9B
 LS55H5U78v99erQDqjgTVitKm/3PJHRcFnvTDt2VVFSBgmlheP30NQpxcUp07LxV
 mTXUtonGo6xxsNwrpSKHL+WNCZQ5ab7XaYODkT4PeBi7Ldd8tg9V/AC4bTIB7GoJ
 ZRNCnnsel7HClhOydtwSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668677406; x=
 1668684606; bh=akQtkJAgROEQw2R9Du4Mq0QjletHuqb+Y4hQq6KktVI=; b=n
 f61vjOS8Bu4BYgvrbr7dnn2QX1Qtx5VsxpcqIkgA+WEiAsZfjg70u/MoCRTn7K6p
 9oFE9uwRs3ZvCxkyCtswEx2nX/AWpUJ4m2AizDm/PzdfattgvUHrJX4s5sQ7y+dM
 BW8shpIeYri+NimzQ/Dew9eVid8zF/GfESkd/IA9xZmvNTRZ2iOhHNYpLx5hC+zp
 yXuisEDipdrQETfz0HypznCpuhjQET83ciUiifMR4Gm6EXDjWSm/PPDwPFLyZm6V
 yxraFyyzI6Skcry+5Of8xJZqoMlaav7xb3UyfH8S8BZumHaLbuORd2wpSEids94l
 Gc0yOw84Rs4x57Qpih4fQ==
X-ME-Sender: <xms:Hv91Y8OV_Fc-w_fjWP9x-DSIVPESZXgocEg_PFRKW7Eo8ckMywWKcQ>
 <xme:Hv91Yy8S09aOKWpxIIhZ1MIMUYfKO1eF-F8k6hWF8rK6AgxYrotqaiCIP1DXdox0k
 z7tJUYiwrBDIx4M9xQ>
X-ME-Received: <xmr:Hv91YzRQ6ZbyZSoUOTLVbBr-5L6sdD5rHJCn7tGK9EZxKG1X_wkt4YwIBCct_2PjlBTBfUyQk5VE3bk-gQmanJimF1MmN9c_7rYdF9ZGxQC1SQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Hv91Y0tKOSzWcyr_Uctk8ozgczXR2KuEM67oJ5ZxRNuAnjr7zcqSTQ>
 <xmx:Hv91Y0fIixDaSq9uuvV1JMct4ctFjGO2OH5x3VrN5rdffrog6JQL_w>
 <xmx:Hv91Y42szlXRgln-Z4W3kq7PHquX8QKXSSj7kt_EiItc_qAJYzEN6w>
 <xmx:Hv91YzoUQy_ITcl1-mZvhqNgtJth_ItTWSvBVybQZA5uKVkmuWrYwKohE8w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 04:30:05 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 17 Nov 2022 10:28:59 +0100
Subject: [PATCH v10 16/19] drm/vc4: vec: Check for VEC output constraints
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v10-16-256dad125326@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
To: Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Emma Anholt <emma@anholt.net>,
 Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=2521; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=xGuY59ue5mTuW32jOv4byPdvEF6n1fh55OhQYU6xR1w=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMml/y6UB7Lochq+u1yYNvdxWO6lxE9GW2VyGx1jzr42fi/D
 t3JHRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACaySJThr2RTRbPgn+yaR33igb4i1z
 8tVq57dVugmy/pUqZcqUhLP8Nv1rQ3kZP7LR5dEDuRJzYlq0LN9poc3767xd3OjSda7uszAAA=
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>

The VEC can accept pretty much any relatively reasonable mode, but still
has a bunch of constraints to meet.

Let's create an atomic_check() implementation that will make sure we
don't end up accepting a non-functional mode.

Acked-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
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
