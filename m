Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C18600307
	for <lists+dri-devel@lfdr.de>; Sun, 16 Oct 2022 21:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF9E10E85C;
	Sun, 16 Oct 2022 19:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA5110E85C;
 Sun, 16 Oct 2022 19:46:54 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id h8so11718522lja.11;
 Sun, 16 Oct 2022 12:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:reply-to:subject:user-agent:mime-version:date:message-id:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rdVj1UN0o7hBjGsw3GcLX/7HhNhpR9GEsvnCZKA7nWc=;
 b=eVN1P5+2pEF2Kv5B+7kulfpYcRS0ij67wC56op/K7MTJ9oxjts1NiTMiIXhKUDDNWi
 pClfrmUFwjCqFPiUh9t2aylgpS617BHukulA8IRkFt9jDfyhzBKacR80dEuWIW7uIlru
 /7BkEkGFXjpHuS1qNFxkES8QosHRpMbXUy57JWaDtK7v16WG53LkwTEneJfdabTIa/BN
 tiKFs3N7vSqtH+nQdskgF32wMLK/xbHFx7HwRH0BnJoukpb40vsXARUD3MnEbG+bDYhz
 DATYteNjfpgFflZS3rzy15d+9+CYLsfO1pfLasECYyV6UjYiuhHDXbmsrtY0P6dvd6aq
 O6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:reply-to:subject:user-agent:mime-version:date:message-id:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rdVj1UN0o7hBjGsw3GcLX/7HhNhpR9GEsvnCZKA7nWc=;
 b=jHxQk0q+sooBlrRG1DhZPjOrvyMB1v3jY+GyuWkprNcpOsyzcXd4XjgiItxg1+WccL
 UDDI3dLho2O0r169a2dszPQPA+d50X/F/qw+yEfICGVgRhprJUYzZ522gw+sxgV72PzE
 YEgufqmOp7PJBbUVSZTz15CHPNkOScbiUs4Dn3pykS/dzQAgqNA0HMOlcGDMZKwazONb
 q4sppxt3l05FZ/phdD6NPGF45cj8zxNQ1r3zPhNE7ydc0P6XHb/DQtRz9P52VtjH43hC
 6mJU0JjTntXvW8c42sOUQs97xnWV8M9oCl981rMgr+fOqaihTv+pXQLVvySgy9x9buuQ
 9feg==
X-Gm-Message-State: ACrzQf2L0fbLSrb1FiztBZnt481Zt3z8lgFutKGvP0fjJViVE1ep3ZIB
 bd2bv13QnoW5AGvgCdQR+tE=
X-Google-Smtp-Source: AMsMyM4GQhxxpcYSAKIRWoVA3HWWO1eDjPQvlqSV0CxKc0sMPg+zXfwUuwDFiB7tEbVlutMrJsz5sg==
X-Received: by 2002:a05:651c:198a:b0:26f:b54d:e239 with SMTP id
 bx10-20020a05651c198a00b0026fb54de239mr2691447ljb.421.1665949612500; 
 Sun, 16 Oct 2022 12:46:52 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:64bb:87df:aad7:a9f0?
 ([2a02:a31a:a240:1700:64bb:87df:aad7:a9f0])
 by smtp.googlemail.com with ESMTPSA id
 k14-20020ac2456e000000b004948378080csm1141576lfm.290.2022.10.16.12.46.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Oct 2022 12:46:51 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <93bf9fcc-c645-b042-011f-8f1fc957af48@gmail.com>
Date: Sun, 16 Oct 2022 21:46:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: [PATCH] drm/vc4: vec: Add support for PAL-60
To: Maxime Ripard <maxime@cerno.tech>, Karol Herbst <kherbst@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Emma Anholt <emma@anholt.net>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
 <20220728-rpi-analog-tv-properties-v5-21-d841cc64fe4b@cerno.tech>
Content-Language: pl
In-Reply-To: <20220728-rpi-analog-tv-properties-v5-21-d841cc64fe4b@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Reply-To: kfyatek+publicgit@gmail.com
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the PAL-60 mode. Because there is no separate TV mode
property value for PAL-60, this requires matching the settings based on
the modeline in addition to just that property alone.

Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
---
This patch depends on patch
'[PATCH v5 21/22] drm/vc4: vec: Add support for more analog TV standards'
submitted by Maxime Ripard
(https://lore.kernel.org/dri-devel/20220728-rpi-analog-tv-properties-v5-21-d841cc64fe4b@cerno.tech/).

To Maxime: if you decide to post v6, feel free to include this in your patchset
instead if you want.
---
 drivers/gpu/drm/vc4/vc4_vec.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 88b4330bfa39..bbc41e502cc3 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -235,6 +235,7 @@ enum vc4_vec_tv_mode_id {
 
 struct vc4_vec_tv_mode {
 	unsigned int mode;
+	u16 expected_htotal;
 	u32 config0;
 	u32 config1;
 	u32 custom_freq;
@@ -270,37 +271,52 @@ static const struct debugfs_reg32 vec_regs[] = {
 static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
 	{
 		.mode = DRM_MODE_TV_MODE_NTSC,
+		.expected_htotal = 858,
 		.config0 = VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
 	{
 		.mode = DRM_MODE_TV_MODE_NTSC_443,
+		.expected_htotal = 858,
 		.config0 = VEC_CONFIG0_NTSC_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
 		.custom_freq = 0x2a098acb,
 	},
 	{
 		.mode = DRM_MODE_TV_MODE_NTSC_J,
+		.expected_htotal = 858,
 		.config0 = VEC_CONFIG0_NTSC_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
 	{
 		.mode = DRM_MODE_TV_MODE_PAL,
+		.expected_htotal = 864,
 		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
+	{
+		/* PAL-60 */
+		.mode = DRM_MODE_TV_MODE_PAL,
+		.expected_htotal = 858,
+		.config0 = VEC_CONFIG0_PAL_M_STD,
+		.config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
+		.custom_freq = 0x2a098acb,
+	},
 	{
 		.mode = DRM_MODE_TV_MODE_PAL_M,
+		.expected_htotal = 858,
 		.config0 = VEC_CONFIG0_PAL_M_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
 	{
 		.mode = DRM_MODE_TV_MODE_PAL_N,
+		.expected_htotal = 864,
 		.config0 = VEC_CONFIG0_PAL_N_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
 	{
 		.mode = DRM_MODE_TV_MODE_SECAM,
+		.expected_htotal = 864,
 		.config0 = VEC_CONFIG0_SECAM_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 		.custom_freq = 0x29c71c72,
@@ -308,14 +324,15 @@ static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
 };
 
 static inline const struct vc4_vec_tv_mode *
-vc4_vec_tv_mode_lookup(unsigned int mode)
+vc4_vec_tv_mode_lookup(unsigned int mode, u16 htotal)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(vc4_vec_tv_modes); i++) {
 		const struct vc4_vec_tv_mode *tv_mode = &vc4_vec_tv_modes[i];
 
-		if (tv_mode->mode == mode)
+		if (tv_mode->mode == mode &&
+		    tv_mode->expected_htotal == htotal)
 			return tv_mode;
 	}
 
@@ -394,6 +411,7 @@ vc4_vec_connector_set_property(struct drm_connector *connector,
 		break;
 
 	case VC4_VEC_TV_MODE_PAL:
+	case VC4_VEC_TV_MODE_PAL_60:
 		state->tv.mode = DRM_MODE_TV_MODE_PAL;
 		break;
 
@@ -551,13 +569,16 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
 	struct drm_connector *connector = &vec->connector;
 	struct drm_connector_state *conn_state =
 		drm_atomic_get_new_connector_state(state, connector);
+	struct drm_display_mode *adjusted_mode =
+		&encoder->crtc->state->adjusted_mode;
 	const struct vc4_vec_tv_mode *tv_mode;
 	int idx, ret;
 
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
-	tv_mode = vc4_vec_tv_mode_lookup(conn_state->tv.mode);
+	tv_mode = vc4_vec_tv_mode_lookup(conn_state->tv.mode,
+					 adjusted_mode->htotal);
 	if (!tv_mode)
 		goto err_dev_exit;
 

base-commit: e16415e3ddae9abb14a00793554a162403f9af6d
-- 
2.34.1

