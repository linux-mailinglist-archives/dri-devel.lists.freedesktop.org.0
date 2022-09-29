Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4515EFAE9
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA5710EB27;
	Thu, 29 Sep 2022 16:33:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A481610EAFD;
 Thu, 29 Sep 2022 16:32:14 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 11552580804;
 Thu, 29 Sep 2022 12:32:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 29 Sep 2022 12:32:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664469134; x=
 1664476334; bh=NJLYeh8h9dc7+t2bHRaWvasJAEeZPBsFSyor/QzBR7I=; b=3
 8WRXPJqbKvqNy2ZQTE1xJvg5UolZ7E2FS1rQwe/UYSDCDTfN0qVkocOAR9HjDa80
 3jx6YkwqCVG6EFEWpn3pjseF4sEwfygdc0ZVG3FlRqhlA6BJEIbbmOIeXGsaXwx4
 1un8woZTpNjdYtub5ER7zYb3dwi+AuCB5+OpCHngP48UTgCniyXW157Ca06banMN
 eZOkRwsKWHUSNHBiD0xrAEssIdbNeVDr6M4yMMOWIsm7my0beU/i+bOAyTpp3rDa
 jUCnWJkr3oTzw1tiIDSKGBQhssEJ7vEDTwseT0odCBCKRz8pDolUEio/wsu1lmc7
 MkbuNXc8a8RghoW9k0cZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664469134; x=
 1664476334; bh=NJLYeh8h9dc7+t2bHRaWvasJAEeZPBsFSyor/QzBR7I=; b=T
 Gp/ToFaOzL5+GbJVOy1+iduwPlK1r583gMrLWK9uj4z+Dx+LtoF8pLmXn57tbbe9
 l8k+n+rR0GoTJjNrEUdHJuF7SpzDUgbBMHUG0VTMRMtOVdtNOWJb36iC8cxYTD1r
 VPFRHOko1nylFNobo+71+8onWekkNVHGNmF05lIxDfkByTDdEGRG2RbL9BiNpkGG
 PlqQsUmAE6+3uPLFV9qzvIFdy59pyXqe7jD82Ip1igh7m0Ynvrn4tWhCQkBwK6S6
 d1SsWui84+yhVd/9hUNOpCa9JB6PRFakD2qPmhHAsrndQwfDAEL7Rp2otKfJT3dI
 kyQiKvPKfF3KN7r1Je/mQ==
X-ME-Sender: <xms:jcg1Y3l_IXcDttzJtgEfXAVK9JbxDNachPE4uyY4FCrzyCtQbYD2Tw>
 <xme:jcg1Y60YTIu--2Ch6UIPEIeNpTYtl1acFGedx72471vBj085qqWvLy1QwrZ0TzdZh
 0Y98M6kiVdHKa1UPgM>
X-ME-Received: <xmr:jcg1Y9pHbmoXY6WwGbuB38-gG9RAu493wj3AJX4WgRRSPaGowLaqKXlZIAur>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffg
 tedtleelhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:jcg1Y_nfXfOn-gKNxQ1o1QMyORvDX0Ihxmf_ZOcIYAVU1vmGwj3_Bg>
 <xmx:jcg1Y13XAZqaxXqtqyDYg7a9GertegcaTjr02JjQwqq_DYUrC7wzcA>
 <xmx:jcg1Y-vc6OqsXXSCbvFM-HDrscu5d8w4yiyfwdm_QIjr0WOzB00SqQ>
 <xmx:jsg1Y0CbiomTkhP_uHV45ZoHWo5821TFI9JWOEkUIBJVwbV-btrtlA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 12:32:13 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Sep 2022 18:31:21 +0200
Subject: [PATCH v4 27/30] drm/vc4: vec: Check for VEC output constraints
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v4-27-60d38873f782@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Karol Herbst <kherbst@redhat.com>, 
 Samuel Holland <samuel@sholland.org>, Lyude Paul <lyude@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=2335; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=DlnHi+W0WvgRXYhcJg7Lq5XC1pI5v5EPE6rzTR9Z0BQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmmJzx6Ju+X+mt88Ogafh0HDqmpK5LyOj6csPvdbpKsyXsi
 re1zRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACbiqs/wTzlYbdMMXg1Ni+sb7u4q/q
 eoG92YHb99sf4VhwUbS7K4ahkZFjade2boqLeAW+jNj12+mfueuu27pblG42SI3H2tSK+HrAA=
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
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 48 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 90e375a8a8f9..1fcb7baf874e 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -453,6 +453,7 @@ static int vc4_vec_encoder_atomic_check(struct drm_encoder *encoder,
 					struct drm_crtc_state *crtc_state,
 					struct drm_connector_state *conn_state)
 {
+	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	const struct vc4_vec_tv_mode *vec_mode;
 
 	vec_mode = &vc4_vec_tv_modes[conn_state->tv.legacy_mode];
@@ -461,6 +462,53 @@ static int vc4_vec_encoder_atomic_check(struct drm_encoder *encoder,
 	    !drm_mode_equal(vec_mode->mode, &crtc_state->adjusted_mode))
 		return -EINVAL;
 
+	if (mode->crtc_hdisplay % 4)
+		return -EINVAL;
+
+	if (!(mode->crtc_hsync_end - mode->crtc_hsync_start))
+		return -EINVAL;
+
+	switch (mode->vtotal) {
+	case 525:
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
+	case 625:
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
b4 0.11.0-dev-7da52
