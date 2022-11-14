Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF44F628028
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 14:03:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA2C10E2E9;
	Mon, 14 Nov 2022 13:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9919A10E2B6;
 Mon, 14 Nov 2022 13:01:22 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 07FF858023E;
 Mon, 14 Nov 2022 08:01:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 14 Nov 2022 08:01:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668430882; x=
 1668438082; bh=akQtkJAgROEQw2R9Du4Mq0QjletHuqb+Y4hQq6KktVI=; b=l
 7SQFV1MijY6k6o/rYg7z2F6BACB7nelmkvCAqh9lYb76hsiDxSgonzyWrgrYNygW
 NNTTZsHRMQ369h6nsbKUpDaA2qPvAN11r3nUn0Csf20WBG9WsPeZ6RNKexUoBNF8
 S9HQ22cQZ6RWA0K9y0Spb/9RkJ/SMUKSLpH7EQCzOFH8m0/RevUpBevrdtqEqleX
 zVYtPVUYlpYI/9PFqwBIQ3mMmbmoFwRBSAbrHN+j/2/o2q7WVhy9MKhD5tIfXjm7
 hbOddjKxMwEFW2pUTlu+4ZutSINgGPUktLT0nOET6U59Ut2xyctWSrF6RgY8i2VZ
 jgUqVubcqBvWD2eIqX+Fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668430882; x=
 1668438082; bh=akQtkJAgROEQw2R9Du4Mq0QjletHuqb+Y4hQq6KktVI=; b=d
 vYuVEACGuM9D3l0iB+wA1LrXjQPEXgCHktBi2cGFJdh/T7TDogjm7n8jaOyh1nCP
 J9ue8XwodFuO5yxq8X7KsaxU9w0a6Kkm28TG6NhYBxuql2uuTvozq2/7FmhGWJEQ
 x+5g9tbt6jY6wl9kPxa7CdlGfKJnXrAOYZ2wNZbv+lbMswRzrcyNDGHDUm0a936E
 Ie9l4ZTMWhNijVFhiFi4xDO4x6CIRzQI1jeH2QWBb49Dk9eQcqMRiE4A6mUlzoPc
 dUZzNz2Qf76zHPVe0KEDpJ82OOq1OcSBDk1TUUgV1DnndUQApFt4VbvaFiQKrR7W
 UsFKtlhVB1ReGyDR8ZaUQ==
X-ME-Sender: <xms:ITxyYwjcF8uZiBbkCOmE6dqDO73PLPMN6tyzxp0r_eUCji8HSWhn4A>
 <xme:ITxyY5D7Lfg6VSSqai3cEfxcC30f7S2IN49Ibn9ivI5eZkSangv2XzadiwZHHsg2S
 pSMiIRTMllLCItPUwQ>
X-ME-Received: <xmr:ITxyY4HUt7vE3ApsAJ8YH9M6dKvWd6lb0DlQh1XrvRK24vRlRFBkiOhF3bbNGB8FS8MZV96y__qb-pPdA1kqrAF-eOjZVexwm3h4iebS2ABcOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ITxyYxTNACB69q-SkGfGzxNWOPRx7jcLgMpowzNiZV7Exq8pxj6Dtw>
 <xmx:ITxyY9wNS_ssL5gBEpcJx8IMeMpcG2AwhvZvSspxyu7_PA0EOsS3wQ>
 <xmx:ITxyY_4qH31DR-jTUYtBKGZjslrZ8rnlZRg45zO8xG0qrXVupG3hRw>
 <xmx:IjxyY9fCB14l4glql5RELDM_wClADms2Mr8b6XObtYXv5LvloJXGxw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 08:01:21 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 14 Nov 2022 14:00:41 +0100
Subject: [PATCH v9 22/25] drm/vc4: vec: Check for VEC output constraints
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v9-22-24b168e5bcd5@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 David Airlie <airlied@linux.ie>, Jernej Skrabec <jernej.skrabec@gmail.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=2521; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=xGuY59ue5mTuW32jOv4byPdvEF6n1fh55OhQYU6xR1w=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMlF1m8OSR35sKTRv/738T0S7nMOWuz8XXpUUeMEnwKv8rJf
 FxODO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjARZzZGhm11Djm7crJE2bY9ey50kT
 Hyy6wrobtWHdn508zT7rC14X1GhiuXdqe9tXtZ4Jm5qq29cb7nithf2q2zDpa33wi9ePPsG3YA
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
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
