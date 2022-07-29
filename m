Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 863F45853F6
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A1E113F31;
	Fri, 29 Jul 2022 16:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5F410F40F
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:45:48 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id BFF1B58098C;
 Fri, 29 Jul 2022 12:37:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 29 Jul 2022 12:37:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112622; x=
 1659119822; bh=XckcpoELRAAukT+qCBdvHaSrqmBkD7IAU61uNE+rv7c=; b=j
 5OTEe9/ikhzjIBEHcRVP3n4XSH68mICFLAMWOa+MfxgmIge1F1uPH/lXRx7eP/ec
 a165ZF/rRh8AYgzmv1nxuDYXqGJE5OSWR90UrReF+MmMxaB9alL09MfiVa89ustS
 Q9aB0l78V6v5itSekOqdN4mB4IShHItwWBSuKvOabMY3IK1jzLhDh1LAdkVphfl8
 jtUvlN/LhBbEn3eHl+psxH/hUfsFUisNKB/NGdYSax+B+lDkSOA6wLE7+QDu+lEN
 eRXj1jPdjAftUz9TB+4NVh0iuTeRGYv2dEHlXGLNvLpRYCUVK483utVd1CX0f5GE
 Lr2t3LoV7Zc2dHkOssqIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112622; x=
 1659119822; bh=XckcpoELRAAukT+qCBdvHaSrqmBkD7IAU61uNE+rv7c=; b=s
 AF3Da3EY5YoxK1fo01f536wWejrgWzd7TM9jGrQ0CYJHqvxt2KzjQfi1mwA11OAR
 S1Wnwtze6MRqp2ARoA64gZHvD01fHTSNXHvD9ZcFApL/MeaQC/A4oSCd1w8CdRUg
 KjbuB1ynEgEWO2RqN6oaYCUDquksz+Ilf18fbiirVn3t/9M3vRHBAFYyAkv8+LbT
 mNsUvlM0G4PwDQKiIiP6jCdaTw8lKF2xyKWbpbjKIKOu4hDbU5NsGQb2QLNU0ZzK
 SkVuuJTyufbW653qDIAGQfdxrK2nut5YL5rDo4pMTUAhN6Jhb+2DWcymWJbN8o5/
 SgMSDGu0mhyk/4ntzinrw==
X-ME-Sender: <xms:rQzkYjQsX7L-7Ujc-qReTQobJhjbNEIr51p4hHZDCy3tNBKOwpj_Pg>
 <xme:rQzkYkymIpQ8aCvTFXjmEpOTPK-KliEPuMYrPJizB37kDIPQAHzaaq6bq8t1ND28j
 rzC8IoDuUpJHEn3pRM>
X-ME-Received: <xmr:rQzkYo1umWGzFd_CHN4CFE3FZ4F_OiE2tCdU_3-cQ0U1i5ge57XGuJf0K3MLR9DRtnbFab6DPJniM0iVth4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
 leekjeefhfejnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:rQzkYjAshtz7u1LoO9Z3AQfWbjRmZaE447Nmca-uw9LqwAnaRQixAg>
 <xmx:rQzkYsi0VwlOyxANgsNV0kkoOIjLlVgs-VuHwm7XAiqpupoiKINyEQ>
 <xmx:rQzkYnpFCmAtCWwG-ikV88ds_Ol0OI-rzxzQ5919nVptVEMS9dv_Nw>
 <xmx:rgzkYjSbYw3BSevVsGPJV5btvgUTKFClIL7v3JCdcucifxvazYp2mQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:37:00 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v1 26/35] drm/sun4i: tv: Convert to atomic hooks
Date: Fri, 29 Jul 2022 18:35:09 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-26-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=rHEOub477XlbL+5lo6Ff+MJpYcQ5tUS9w6PRTcDJwtg=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VFyZDbY0vu+cOkaQx7r9NN+Hyvr/17ekrb1G3tE7TpV
 rumuHaUsDMIcDLJiiizXBd/a8YVFuUXwfNgMM4eVCWQIAxenAEzklSHDXzmtmae1W/5G/3/v3ucfo/
 Qp7kRd43Yf0WOvInrWMwcc2sbwv2SV9Yy2n8IzTe+cFdTdvetm4Kyf7+r7bbc5c1g1WvQYawIA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VC4 VEC driver still uses legacy enable and disable hook
implementation. Let's convert to the atomic variants.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index 53152d77c392..f7aad995ab5b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -339,7 +339,8 @@ static void sun4i_tv_mode_to_drm_mode(const struct tv_mode *tv_mode,
 	mode->vtotal = mode->vsync_end  + tv_mode->vback_porch;
 }
 
-static void sun4i_tv_disable(struct drm_encoder *encoder)
+static void sun4i_tv_disable(struct drm_encoder *encoder,
+			    struct drm_atomic_state *state)
 {
 	struct sun4i_tv *tv = drm_encoder_to_sun4i_tv(encoder);
 	struct sun4i_crtc *crtc = drm_crtc_to_sun4i_crtc(encoder->crtc);
@@ -353,7 +354,8 @@ static void sun4i_tv_disable(struct drm_encoder *encoder)
 	sunxi_engine_disable_color_correction(crtc->engine);
 }
 
-static void sun4i_tv_enable(struct drm_encoder *encoder)
+static void sun4i_tv_enable(struct drm_encoder *encoder,
+			    struct drm_atomic_state *state)
 {
 	struct sun4i_tv *tv = drm_encoder_to_sun4i_tv(encoder);
 	struct sun4i_crtc *crtc = drm_crtc_to_sun4i_crtc(encoder->crtc);
@@ -469,8 +471,8 @@ static void sun4i_tv_mode_set(struct drm_encoder *encoder,
 }
 
 static const struct drm_encoder_helper_funcs sun4i_tv_helper_funcs = {
-	.disable	= sun4i_tv_disable,
-	.enable		= sun4i_tv_enable,
+	.atomic_disable	= sun4i_tv_disable,
+	.atomic_enable	= sun4i_tv_enable,
 	.mode_set	= sun4i_tv_mode_set,
 };
 

-- 
b4 0.10.0-dev-49460
