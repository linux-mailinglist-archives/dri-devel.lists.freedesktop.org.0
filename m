Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BA75858DF
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 08:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE1A10EC81;
	Sat, 30 Jul 2022 06:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CAD910E91B
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 17:55:37 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id bf9so8339151lfb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 10:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=3hZoGcnHaEkT19lBYfPsFJqwMI5QsjzTbPWXqwhHM3E=;
 b=E70UUusXp0IxJmxxMTw9fUL//Arj/3xoFgMx9YrcdAFabC9DoAAKfTXe6O+ub88Xf0
 XDFA3aD1noc5bsW149fUO8zQLnUACJ+lkVq0I5XgtUL+rxd41g6yYiwq4BouVyduNNPG
 PBz9xwmtwhsWL4VPFVQbiMpp8AlokIot68yc6gAI33IhzUioDBCPKE9BZjhXspQyceG2
 qxTy5FNGPlV925pMrKwIIaz9NHtneW4phjFnDk0dAT2FY+4rbq/uLDKMV9+M7oCprW0R
 TClGWoj75pYZTnbQNhzqsEoAjRGP1XrrcGAvr9Mg6sTwB31Z9/Bo1tO84UURjDkv6AXW
 Z1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=3hZoGcnHaEkT19lBYfPsFJqwMI5QsjzTbPWXqwhHM3E=;
 b=zLOTQW+aIYZIv9ZOYOzsz4W7UUIrhdDkFzzTljiNE6H84u9GxRs3A334jxFp430dHB
 MtDVA2Y1/ZDLeRjLrKhsx3LWIO7r4IaN0KWalYGsJ0TuGlVp9GeJP+aX3zilCBSUQK81
 eKZ1xXNw5V776Va10Gi3QiplaKOiL3ihpUqlwuTyfWSHcE+1zyjn78/xc6ZPvHrNk3Ks
 Fw0rJYTZ37LiXsTR+8AfmtVTcpBdywCKE4gYeGduUd0WRlOd/OpyHAJV7QGL2DiuW1CR
 5xGInMbl/+eUmKWsyAHDHkQkdjTmLMcbuFdaCj0vjRlkG1D8awqpVZ7y/fL3+qBdWmnW
 5n3A==
X-Gm-Message-State: AJIora+2DbHlu57OAde5VPSH8VBwZ1+k/uh85wJg12VX7zZnhHE0SkGA
 wvdvPrPejQD+XS3OPRwN4aI=
X-Google-Smtp-Source: AGRyM1uRiRdQp9ghTjWaHycElVTBDngXX9i0wsFaDm+67yChI5/scZGu8HWG4CNvFrEq7LzuWFR/AA==
X-Received: by 2002:a05:6512:1054:b0:48a:a4ef:257b with SMTP id
 c20-20020a056512105400b0048aa4ef257bmr1554975lfb.425.1659117335148; 
 Fri, 29 Jul 2022 10:55:35 -0700 (PDT)
Received: from [192.168.177.6] (public-gprs370360.centertel.pl. [37.47.77.249])
 by smtp.googlemail.com with ESMTPSA id
 x5-20020a19e005000000b0048ad0ca34cdsm540546lfg.187.2022.07.29.10.55.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 10:55:34 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <0e7bebe2-3f45-0a1b-a4b6-bb783f8de7b6@gmail.com>
Date: Fri, 29 Jul 2022 19:55:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH v1 24/35] drm/vc4: vec: Add support for more analog TV
 standards
Content-Language: pl
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-24-3d53ae722097@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-24-3d53ae722097@cerno.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 30 Jul 2022 06:32:44 +0000
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
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-amlogic@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

I think that declaring PAL-B and SECAM-B as the only supported 576i 
norms is a bit random.

Norms B, D, G, H, I, K, K1 and L (for both PAL and SECAM) are 
essentially identical if we're talking about baseband signals, AFAIK 
they only differ when those are modulated as RF signals. I'm not sure if 
there's a point to differentiating those (that's more about patch 05/35) 
unless we need to deal with some device that actually features an RF 
modulator.

But if we do want to have all those norms separate, then I'd say that 
VC4 should declare support for all of those, and all should map to the 
same VEC settings. Some users from e.g. the UK might think that they 
won't get proper picture if PAL-I is not on the list of supported norms. 
Same goes for e.g. SECAM-D/K in the former Soviet territories, and so on.

Best regards,
Mateusz Kwiatkowski

W dniu 29.07.2022 o 18:35, Maxime Ripard pisze:
> From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
>
> Add support for the following composite output modes (all of them are
> somewhat more obscure than the previously defined ones):
>
> - NTSC_443 - NTSC-style signal with the chroma subcarrier shifted to
>    4.43361875 MHz (the PAL subcarrier frequency). Never used for
>    broadcasting, but sometimes used as a hack to play NTSC content in PAL
>    regions (e.g. on VCRs).
> - PAL_N - PAL with alternative chroma subcarrier frequency,
>    3.58205625 MHz. Used as a broadcast standard in Argentina, Paraguay
>    and Uruguay to fit 576i50 with colour in 6 MHz channel raster.
> - PAL60 - 480i60 signal with PAL-style color at normal European PAL
>    frequency. Another non-standard, non-broadcast mode, used in similar
>    contexts as NTSC_443. Some displays support one but not the other.
> - SECAM - French frequency-modulated analog color standard; also have
>    been broadcast in Eastern Europe and various parts of Africa and Asia.
>    Uses the same 576i50 timings as PAL.
>
> Also added some comments explaining color subcarrier frequency
> registers.
>
> Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
> index e40b55de1b3c..91d343238b0f 100644
> --- a/drivers/gpu/drm/vc4/vc4_vec.c
> +++ b/drivers/gpu/drm/vc4/vc4_vec.c
> @@ -46,6 +46,7 @@
>   #define VEC_CONFIG0_YDEL(x)		((x) << 26)
>   #define VEC_CONFIG0_CDEL_MASK		GENMASK(25, 24)
>   #define VEC_CONFIG0_CDEL(x)		((x) << 24)
> +#define VEC_CONFIG0_SECAM_STD		BIT(21)
>   #define VEC_CONFIG0_PBPR_FIL		BIT(18)
>   #define VEC_CONFIG0_CHROMA_GAIN_MASK	GENMASK(17, 16)
>   #define VEC_CONFIG0_CHROMA_GAIN_UNITY	(0 << 16)
> @@ -76,6 +77,27 @@
>   #define VEC_SOFT_RESET			0x10c
>   #define VEC_CLMP0_START			0x144
>   #define VEC_CLMP0_END			0x148
> +
> +/*
> + * These set the color subcarrier frequency
> + * if VEC_CONFIG1_CUSTOM_FREQ is enabled.
> + *
> + * VEC_FREQ1_0 contains the most significant 16-bit half-word,
> + * VEC_FREQ3_2 contains the least significant 16-bit half-word.
> + * 0x80000000 seems to be equivalent to the pixel clock
> + * (which itself is the VEC clock divided by 8).
> + *
> + * Reference values (with the default pixel clock of 13.5 MHz):
> + *
> + * NTSC  (3579545.[45] Hz)     - 0x21F07C1F
> + * PAL   (4433618.75 Hz)       - 0x2A098ACB
> + * PAL-M (3575611.[888111] Hz) - 0x21E6EFE3
> + * PAL-N (3582056.25 Hz)       - 0x21F69446
> + *
> + * NOTE: For SECAM, it is used as the Dr center frequency,
> + * regardless of whether VEC_CONFIG1_CUSTOM_FREQ is enabled or not;
> + * that is specified as 4406250 Hz, which corresponds to 0x29C71C72.
> + */
>   #define VEC_FREQ3_2			0x180
>   #define VEC_FREQ1_0			0x184
>   
> @@ -118,6 +140,14 @@
>   
>   #define VEC_INTERRUPT_CONTROL		0x190
>   #define VEC_INTERRUPT_STATUS		0x194
> +
> +/*
> + * Db center frequency for SECAM; the clock for this is the same as for
> + * VEC_FREQ3_2/VEC_FREQ1_0, which is used for Dr center frequency.
> + *
> + * This is specified as 4250000 Hz, which corresponds to 0x284BDA13.
> + * That is also the default value, so no need to set it explicitly.
> + */
>   #define VEC_FCW_SECAM_B			0x198
>   #define VEC_SECAM_GAIN_VAL		0x19c
>   
> @@ -194,9 +224,13 @@ connector_to_vc4_vec(struct drm_connector *connector)
>   
>   enum vc4_vec_tv_mode_id {
>   	VC4_VEC_TV_MODE_NTSC,
> +	VC4_VEC_TV_MODE_NTSC_443,
>   	VC4_VEC_TV_MODE_NTSC_J,
>   	VC4_VEC_TV_MODE_PAL,
> +	VC4_VEC_TV_MODE_PAL_60,
>   	VC4_VEC_TV_MODE_PAL_M,
> +	VC4_VEC_TV_MODE_PAL_N,
> +	VC4_VEC_TV_MODE_SECAM,
>   };
>   
>   struct vc4_vec_tv_mode {
> @@ -234,6 +268,12 @@ static const struct debugfs_reg32 vec_regs[] = {
>   };
>   
>   static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
> +	{
> +		.mode = DRM_MODE_TV_NORM_NTSC_443,
> +		.config0 = VEC_CONFIG0_NTSC_STD,
> +		.config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
> +		.custom_freq = 0x2a098acb,
> +	},
>   	{
>   		.mode = DRM_MODE_TV_NORM_NTSC_M,
>   		.config0 = VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN,
> @@ -244,6 +284,12 @@ static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
>   		.config0 = VEC_CONFIG0_NTSC_STD,
>   		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
>   	},
> +	{
> +		.mode = DRM_MODE_TV_NORM_PAL_60,
> +		.config0 = VEC_CONFIG0_PAL_M_STD,
> +		.config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
> +		.custom_freq = 0x2a098acb,
> +	},
>   	{
>   		.mode = DRM_MODE_TV_NORM_PAL_B,
>   		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
> @@ -254,6 +300,17 @@ static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
>   		.config0 = VEC_CONFIG0_PAL_M_STD,
>   		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
>   	},
> +	{
> +		.mode = DRM_MODE_TV_NORM_PAL_N,
> +		.config0 = VEC_CONFIG0_PAL_N_STD,
> +		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
> +	},
> +	{
> +		.mode = DRM_MODE_TV_NORM_SECAM_B,
> +		.config0 = VEC_CONFIG0_SECAM_STD,
> +		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
> +		.custom_freq = 0x29c71c72,
> +	},
>   };
>   
>   static inline const struct vc4_vec_tv_mode *
> @@ -273,9 +330,13 @@ vc4_vec_tv_mode_lookup(unsigned int mode)
>   
>   static const struct drm_prop_enum_list tv_mode_names[] = {
>   	{ VC4_VEC_TV_MODE_NTSC, "NTSC", },
> +	{ VC4_VEC_TV_MODE_NTSC_443, "NTSC-443", },
>   	{ VC4_VEC_TV_MODE_NTSC_J, "NTSC-J", },
>   	{ VC4_VEC_TV_MODE_PAL, "PAL", },
> +	{ VC4_VEC_TV_MODE_PAL_60, "PAL-60", },
>   	{ VC4_VEC_TV_MODE_PAL_M, "PAL-M", },
> +	{ VC4_VEC_TV_MODE_PAL_N, "PAL-N", },
> +	{ VC4_VEC_TV_MODE_SECAM, "SECAM", },
>   };
>   
>   static enum drm_connector_status
> @@ -329,6 +390,10 @@ vc4_vec_connector_set_property(struct drm_connector *connector,
>   		state->tv.norm = DRM_MODE_TV_NORM_NTSC_M;
>   		break;
>   
> +	case VC4_VEC_TV_MODE_NTSC_443:
> +		state->tv.norm = DRM_MODE_TV_NORM_NTSC_443;
> +		break;
> +
>   	case VC4_VEC_TV_MODE_NTSC_J:
>   		state->tv.norm = DRM_MODE_TV_NORM_NTSC_J;
>   		break;
> @@ -337,10 +402,22 @@ vc4_vec_connector_set_property(struct drm_connector *connector,
>   		state->tv.norm = DRM_MODE_TV_NORM_PAL_B;
>   		break;
>   
> +	case VC4_VEC_TV_MODE_PAL_60:
> +		state->tv.norm = DRM_MODE_TV_NORM_PAL_60;
> +		break;
> +
>   	case VC4_VEC_TV_MODE_PAL_M:
>   		state->tv.norm = DRM_MODE_TV_NORM_PAL_M;
>   		break;
>   
> +	case VC4_VEC_TV_MODE_PAL_N:
> +		state->tv.norm = DRM_MODE_TV_NORM_PAL_N;
> +		break;
> +
> +	case VC4_VEC_TV_MODE_SECAM:
> +		state->tv.norm = DRM_MODE_TV_NORM_SECAM_B;
> +		break;
> +
>   	default:
>   		return -EINVAL;
>   	}
> @@ -360,6 +437,10 @@ vc4_vec_connector_get_property(struct drm_connector *connector,
>   		return -EINVAL;
>   
>   	switch (state->tv.norm) {
> +	case DRM_MODE_TV_NORM_NTSC_443:
> +		*val = VC4_VEC_TV_MODE_NTSC_443;
> +		break;
> +
>   	case DRM_MODE_TV_NORM_NTSC_J:
>   		*val = VC4_VEC_TV_MODE_NTSC_J;
>   		break;
> @@ -368,6 +449,10 @@ vc4_vec_connector_get_property(struct drm_connector *connector,
>   		*val = VC4_VEC_TV_MODE_NTSC;
>   		break;
>   
> +	case DRM_MODE_TV_NORM_PAL_60:
> +		*val = VC4_VEC_TV_MODE_PAL_60;
> +		break;
> +
>   	case DRM_MODE_TV_NORM_PAL_B:
>   		*val = VC4_VEC_TV_MODE_PAL;
>   		break;
> @@ -376,6 +461,14 @@ vc4_vec_connector_get_property(struct drm_connector *connector,
>   		*val = VC4_VEC_TV_MODE_PAL_M;
>   		break;
>   
> +	case DRM_MODE_TV_NORM_PAL_N:
> +		*val = VC4_VEC_TV_MODE_PAL_N;
> +		break;
> +
> +	case DRM_MODE_TV_NORM_SECAM_B:
> +		*val = VC4_VEC_TV_MODE_SECAM;
> +		break;
> +
>   	default:
>   		return -EINVAL;
>   	}
> @@ -605,10 +698,13 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
>   	int ret;
>   
>   	ret = drm_mode_create_tv_properties(drm,
> +					    DRM_MODE_TV_NORM_NTSC_443 |
>   					    DRM_MODE_TV_NORM_NTSC_J |
>   					    DRM_MODE_TV_NORM_NTSC_M |
>   					    DRM_MODE_TV_NORM_PAL_B |
> -					    DRM_MODE_TV_NORM_PAL_M,
> +					    DRM_MODE_TV_NORM_PAL_M |
> +					    DRM_MODE_TV_NORM_PAL_N |
> +					    DRM_MODE_TV_NORM_SECAM_B,
>   					    0, NULL);
>   	if (ret)
>   		return ret;
>

