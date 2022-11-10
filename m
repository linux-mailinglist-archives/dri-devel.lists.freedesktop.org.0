Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 680CA6240F9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 12:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B02A10E711;
	Thu, 10 Nov 2022 11:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D3610E6FB;
 Thu, 10 Nov 2022 11:08:00 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 134F55802EE;
 Thu, 10 Nov 2022 06:08:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 10 Nov 2022 06:08:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668078480; x=
 1668085680; bh=akQtkJAgROEQw2R9Du4Mq0QjletHuqb+Y4hQq6KktVI=; b=A
 X2fX1GTymePoQVvE1B6clLCgaBNg6qwTKJjDUdyh1A/vgEsNveR4IyIkMcJzfGUV
 zdxAsEf0E5yByYdmCJ6u1Fn038kn5DhyBtrCQvMHy0Wt7a/NhaOa/2qR1owlcvzz
 pWzv7XmgYXMoZI5jOvPdqZOVn8a/m6Ynq4I8Ah9Pd077mg7PB8O18piwsat6AMHd
 3ocQCUcd9V0hD+1IzlN/WtwqC5LHDCssC/MmFzlm37ukMv/BZ0eCuLiijV+HvHri
 D116eYFxALRMbfx40OnZ07enCKcZsAOdxJn+ZZ/0v1Ng/tjk2+9cUgkfOcf8+QNJ
 SbVAMrCDTVhEawo2JEt4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668078480; x=
 1668085680; bh=akQtkJAgROEQw2R9Du4Mq0QjletHuqb+Y4hQq6KktVI=; b=i
 JQZHjy0RCK4Op/mpGnuxo4oZnZJIvSF8dSGlS1okLcQ/eiLj0eoQXU9SInwzpM/n
 tXrCDOtbC/+ScJqFnGc3UKAkug5rq7M8Ve/7nbL3qtZN/hsj/BBEM/FMyMcuHdEL
 vm8d0MpaVt6S3XWLkxjn7eHFeNpNPRqXq4a6zlQ6GkDldRXuj5INRBcBBZFnlukn
 yLyPFh8tNPJ51xzmGVUUWheImec4xYZ/nTNfH3LkTXaaaNrAJtDCSBNTlXW3rBYj
 RR7ChCyIn90CqTAYdsiSrxMGXPurPvy/tyP8KK0A8VQLaFvJa0danNKoXAwCffGS
 rK+Nw4cqAl7SD0YrZW+EA==
X-ME-Sender: <xms:j9tsY5lut8-oaH2U3PFTncy6CXfSqUYjIrzbMq7_bb7iMAS8IJrfag>
 <xme:j9tsY02peSmUqRNnhTRiuGTsg1X90zwmUb2qWAvNZIF_cj73uPA1WUsrUEDFIz7zT
 ByqckDsUpofxZ7C-GI>
X-ME-Received: <xmr:j9tsY_qbRMerdrMry4q8WGTwivqMgkyYRY3AT9J8_1epCWu3InMydwn0boyNXHxua14b8jtoIwI0hX2NaiqpFaKWyDdOI3vFfE48DSqZwiAmlA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeggddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:j9tsY5lxtFe_8LkRkedFB7yIwa17yZ5PH8c2CAig9_GMekIZ2WacMg>
 <xmx:j9tsY32YMxkNsDxW9xwdX8QyteBM4DWvWHVhrOazNK77ndaHkILACQ>
 <xmx:j9tsY4vXGpDncVXBQeZNCX41nn6jvAbTTFi8QCw6p6OQoSZX7XJZaQ>
 <xmx:kNtsY2ChE63zu5FKspNO2xGB44AcuTDxC0p-7ZHdMzAxis981dqDSQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 06:07:59 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 10 Nov 2022 12:07:33 +0100
Subject: [PATCH v8 21/24] drm/vc4: vec: Check for VEC output constraints
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v8-21-09ce1466967c@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v8-0-09ce1466967c@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v8-0-09ce1466967c@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>, Samuel Holland <samuel@sholland.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=2521; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=xGuY59ue5mTuW32jOv4byPdvEF6n1fh55OhQYU6xR1w=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk5t1O9H6ybdJzjhuLxV+/kS1+vuHTrd4zABMm729rEUuMk
 1/nVdpSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAihxQZ/sdFbXjp+0+bPXl/t4iq3e
 KMZt5Sh0vdr/1s/ht8vHNRLoSRYV2s3+Q76kIv3m+VnDD/ieBT7XRdoSgFtot3GOO2t3bkMAEA
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
