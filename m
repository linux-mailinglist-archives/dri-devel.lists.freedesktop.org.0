Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0120360EB9D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 00:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5E010E5A1;
	Wed, 26 Oct 2022 22:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAACC10E2A3;
 Wed, 26 Oct 2022 22:32:54 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id p8so31751353lfu.11;
 Wed, 26 Oct 2022 15:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=avrg0p0zcjNQXnwku7LjBEc26ITlI2L8ZDmV7YUxLHk=;
 b=hNP1eWcSKtSWB1d/Pitcegm6aBvNbn9ZZwOPfvyAHeLfSpWgKviYSn4HdfxqpmVxLx
 3hqUT8rGLCtA1WbTsRwnPe5u3UcMos9xSnD5TZv+rOmijKDGBBCh8NVOtzeenY0qOWJW
 oh4drqCKFAmxuzjfWyqczkgGVY4e/XY9DK8cne6pWop/CZJOjY5RUV1N/4OKtEk0nxJO
 UC4dx27z4ITheuTf5vkslf5rQZRUk0qCvLfi1+DCcHCbS9nB8ML9tKunPxRfZ0ivAOEf
 qxDLwB203CFgLYKKW5ACXrIXmtd/8O6FmrNt5N5n34ARyUZHAOHdwbczBPdcJL3R4Gsa
 ONMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=avrg0p0zcjNQXnwku7LjBEc26ITlI2L8ZDmV7YUxLHk=;
 b=1nYT+r7khKJp1hWKV+LVlhEMXkz4WWoAZlzVmcvKIG4fEOM0G6kEtJXP5d6qmOnb5y
 NBJEcuOCsZjTCf5TEsH54lEqRHVq8VPk7uOMJaluexrs1FIPO3Bge46E7C0b75LYiQo/
 KfIBPBzmx/qwNIGVxxSFAi3e2gBkQLYmNU//1FoaEa50ScIC698FAA5eR0XD84SgpBPG
 5CewE1yEMpQE9d5VEDjPvf60dy7IkMFtPtf05d60AofHNCvrtS1rZEcQA9BB6t8cdFiN
 yTpO38BwFEF7EYOKh7OIu0gds9r3oc0Uy/7TzGGbRFCuUquQOUNiZVSskqtDvwSO9bJ/
 C/ww==
X-Gm-Message-State: ACrzQf0x+tzO9WYcpz9PuGiv6jHlunOGa751+n5RHP0tc4NkmrLyWwBs
 7zx7ilinOeKREvdJ3LHPAEo=
X-Google-Smtp-Source: AMsMyM52ijLmTwWqEjQAFcbPkrpP0UqjyCZnJDRwDtXnieH2RtRbTOsPad5/gfZTaDZK85qSTqo5mQ==
X-Received: by 2002:ac2:4c47:0:b0:4a2:c07b:4b62 with SMTP id
 o7-20020ac24c47000000b004a2c07b4b62mr15855128lfk.426.1666823572924; 
 Wed, 26 Oct 2022 15:32:52 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:c898:de98:30b3:a07?
 ([2a02:a31a:a240:1700:c898:de98:30b3:a07])
 by smtp.googlemail.com with ESMTPSA id
 n11-20020ac2490b000000b004979df1c1fasm994280lfi.61.2022.10.26.15.32.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 15:32:52 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <e9b8ebf6-8781-0c55-5dd5-9f5077bd6b93@gmail.com>
Date: Thu, 27 Oct 2022 00:32:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v6 22/23] drm/vc4: vec: Add support for more analog TV
 standards
Content-Language: pl
To: maxime@cerno.tech, Karol Herbst <kherbst@redhat.com>,
 Emma Anholt <emma@anholt.net>, Ben Skeggs <bskeggs@redhat.com>,
 Chen-Yu Tsai <wens@csie.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>
References: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
 <20220728-rpi-analog-tv-properties-v6-22-e7792734108f@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v6-22-e7792734108f@cerno.tech>
Content-Type: text/plain; charset=UTF-8
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

I've seen that you've incorporated my PAL60 patch. Thanks!

I still yet need to test your v6 changes, but looking at this code with just my
mental static analysis, it seems to me that the vc4_vec_encoder_atomic_check()
should have the tv_mode validation. I should've added it to the PAL60 patch,
but it somehow slipped my mind then.

Anyway, I mentioned it previously here:
https://lore.kernel.org/dri-devel/0f2beec2-ae8e-5579-f0b6-a73d9dae1af4@gmail.com/

It would look something like this, inside vc4_vec_encoder_atomic_check():

+	const struct vc4_vec_tv_mode *tv_mode =
+		vc4_vec_tv_mode_lookup(conn_state->tv.mode);
+
+	if (!tv_mode)
+		return -EINVAL;

Without this, it's possible to set e.g. 480i mode and SECAM, which will fail -
but with the current version it will only fail in vc4_vec_encoder_enable(),
which cannot return an error, and in my experience that causes a rather lengthy
lockup.

But, like I said, I still need to actually test that with this version.

Anyway, I was also thinking about adding support for the more "exotic"
non-standard modes. NTSC-50 is, unfortunately, impossible with VEC, but
PAL-N-60 and PAL-M-50 should work. The necessary vc4_vec_tv_modes entries would
look something like:

@@ -325,12 +325,28 @@ static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
 		.config0 = VEC_CONFIG0_PAL_M_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
+	{
+		/* PAL-M-50 */
+		.mode = DRM_MODE_TV_MODE_PAL,
+		.expected_htotal = 864,
+		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
+		.config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
+		.custom_freq = 0x21e6efe3,
+	},
 	{
 		.mode = DRM_MODE_TV_MODE_PAL_N,
 		.expected_htotal = 864,
 		.config0 = VEC_CONFIG0_PAL_N_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
+	{
+		/* PAL-N-60 */
+		.mode = DRM_MODE_TV_MODE_PAL_N,
+		.expected_htotal = 858,
+		.config0 = VEC_CONFIG0_PAL_M_STD,
+		.config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
+		.custom_freq = 0x21f69446,
+	},
 	{
 		.mode = DRM_MODE_TV_MODE_SECAM,
 		.expected_htotal = 864,

I'm not sure if we actually want to add that. The two arguments for doing so
I can think of is 1. it should work, so "why not", 2. it means that more modes
will result in _some_ kind of a valid signal, rather than erroring out, which
is always a plus in my book. I can also think of a hypothetical use case, like
someone in South America with an old PAL-N-only set that would nevertheless
still sync at 60 Hz (perhaps with the help of messing with vertical hold knob),
who would like to play retro games at 60 Hz in color.

But on the other hand, I admit that this scenario is likely a stretch and the
number of people who would actually use it is probably close to the proverbial
two ;) So it's your call, I'm just leaving those settings here just in case.

I'll get back in a couple of days when I do some testing of this v6 patchset.

Best regards,
Mateusz Kwiatkowski

W dniu 26.10.2022 o 17:33, maxime@cerno.tech pisze:
> From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
>
> Add support for the following composite output modes (all of them are
> somewhat more obscure than the previously defined ones):
>
> - NTSC_443 - NTSC-style signal with the chroma subcarrier shifted to
>   4.43361875 MHz (the PAL subcarrier frequency). Never used for
>   broadcasting, but sometimes used as a hack to play NTSC content in PAL
>   regions (e.g. on VCRs).
> - PAL_N - PAL with alternative chroma subcarrier frequency,
>   3.58205625 MHz. Used as a broadcast standard in Argentina, Paraguay
>   and Uruguay to fit 576i50 with colour in 6 MHz channel raster.
> - PAL60 - 480i60 signal with PAL-style color at normal European PAL
>   frequency. Another non-standard, non-broadcast mode, used in similar
>   contexts as NTSC_443. Some displays support one but not the other.
> - SECAM - French frequency-modulated analog color standard; also have
>   been broadcast in Eastern Europe and various parts of Africa and Asia.
>   Uses the same 576i50 timings as PAL.
>
> Also added some comments explaining color subcarrier frequency
> registers.
>
> Acked-by: Noralf Trønnes <noralf@tronnes.org>
> Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> ---
> Changes in v6:
> - Support PAL60 again
> ---
>  drivers/gpu/drm/vc4/vc4_vec.c | 111 ++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 107 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
> index 1dda451c8def..d82aef168075 100644
> --- a/drivers/gpu/drm/vc4/vc4_vec.c
> +++ b/drivers/gpu/drm/vc4/vc4_vec.c
> @@ -46,6 +46,7 @@
>  #define VEC_CONFIG0_YDEL(x)		((x) << 26)
>  #define VEC_CONFIG0_CDEL_MASK		GENMASK(25, 24)
>  #define VEC_CONFIG0_CDEL(x)		((x) << 24)
> +#define VEC_CONFIG0_SECAM_STD		BIT(21)
>  #define VEC_CONFIG0_PBPR_FIL		BIT(18)
>  #define VEC_CONFIG0_CHROMA_GAIN_MASK	GENMASK(17, 16)
>  #define VEC_CONFIG0_CHROMA_GAIN_UNITY	(0 << 16)
> @@ -76,6 +77,27 @@
>  #define VEC_SOFT_RESET			0x10c
>  #define VEC_CLMP0_START			0x144
>  #define VEC_CLMP0_END			0x148
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
>  #define VEC_FREQ3_2			0x180
>  #define VEC_FREQ1_0			0x184
>  
> @@ -118,6 +140,14 @@
>  
>  #define VEC_INTERRUPT_CONTROL		0x190
>  #define VEC_INTERRUPT_STATUS		0x194
> +
> +/*
> + * Db center frequency for SECAM; the clock for this is the same as for
> + * VEC_FREQ3_2/VEC_FREQ1_0, which is used for Dr center frequency.
> + *
> + * This is specified as 4250000 Hz, which corresponds to 0x284BDA13.
> + * That is also the default value, so no need to set it explicitly.
> + */
>  #define VEC_FCW_SECAM_B			0x198
>  #define VEC_SECAM_GAIN_VAL		0x19c
>  
> @@ -197,10 +227,15 @@ enum vc4_vec_tv_mode_id {
>  	VC4_VEC_TV_MODE_NTSC_J,
>  	VC4_VEC_TV_MODE_PAL,
>  	VC4_VEC_TV_MODE_PAL_M,
> +	VC4_VEC_TV_MODE_NTSC_443,
> +	VC4_VEC_TV_MODE_PAL_60,
> +	VC4_VEC_TV_MODE_PAL_N,
> +	VC4_VEC_TV_MODE_SECAM,
>  };
>  
>  struct vc4_vec_tv_mode {
>  	unsigned int mode;
> +	u16 expected_htotal;
>  	u32 config0;
>  	u32 config1;
>  	u32 custom_freq;
> @@ -236,35 +271,68 @@ static const struct debugfs_reg32 vec_regs[] = {
>  static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
>  	{
>  		.mode = DRM_MODE_TV_MODE_NTSC,
> +		.expected_htotal = 858,
>  		.config0 = VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN,
>  		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
>  	},
> +	{
> +		.mode = DRM_MODE_TV_MODE_NTSC_443,
> +		.expected_htotal = 858,
> +		.config0 = VEC_CONFIG0_NTSC_STD,
> +		.config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
> +		.custom_freq = 0x2a098acb,
> +	},
>  	{
>  		.mode = DRM_MODE_TV_MODE_NTSC_J,
> +		.expected_htotal = 858,
>  		.config0 = VEC_CONFIG0_NTSC_STD,
>  		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
>  	},
>  	{
>  		.mode = DRM_MODE_TV_MODE_PAL,
> +		.expected_htotal = 864,
>  		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
>  		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
>  	},
> +	{
> +		/* PAL-60 */
> +		.mode = DRM_MODE_TV_MODE_PAL,
> +		.expected_htotal = 858,
> +		.config0 = VEC_CONFIG0_PAL_M_STD,
> +		.config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
> +		.custom_freq = 0x2a098acb,
> +	},
>  	{
>  		.mode = DRM_MODE_TV_MODE_PAL_M,
> +		.expected_htotal = 858,
>  		.config0 = VEC_CONFIG0_PAL_M_STD,
>  		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
>  	},
> +	{
> +		.mode = DRM_MODE_TV_MODE_PAL_N,
> +		.expected_htotal = 864,
> +		.config0 = VEC_CONFIG0_PAL_N_STD,
> +		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
> +	},
> +	{
> +		.mode = DRM_MODE_TV_MODE_SECAM,
> +		.expected_htotal = 864,
> +		.config0 = VEC_CONFIG0_SECAM_STD,
> +		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
> +		.custom_freq = 0x29c71c72,
> +	},
>  };
>  
>  static inline const struct vc4_vec_tv_mode *
> -vc4_vec_tv_mode_lookup(unsigned int mode)
> +vc4_vec_tv_mode_lookup(unsigned int mode, u16 htotal)
>  {
>  	unsigned int i;
>  
>  	for (i = 0; i < ARRAY_SIZE(vc4_vec_tv_modes); i++) {
>  		const struct vc4_vec_tv_mode *tv_mode = &vc4_vec_tv_modes[i];
>  
> -		if (tv_mode->mode == mode)
> +		if (tv_mode->mode == mode &&
> +		    tv_mode->expected_htotal == htotal)
>  			return tv_mode;
>  	}
>  
> @@ -273,9 +341,13 @@ vc4_vec_tv_mode_lookup(unsigned int mode)
>  
>  static const struct drm_prop_enum_list legacy_tv_mode_names[] = {
>  	{ VC4_VEC_TV_MODE_NTSC, "NTSC", },
> +	{ VC4_VEC_TV_MODE_NTSC_443, "NTSC-443", },
>  	{ VC4_VEC_TV_MODE_NTSC_J, "NTSC-J", },
>  	{ VC4_VEC_TV_MODE_PAL, "PAL", },
> +	{ VC4_VEC_TV_MODE_PAL_60, "PAL-60", },
>  	{ VC4_VEC_TV_MODE_PAL_M, "PAL-M", },
> +	{ VC4_VEC_TV_MODE_PAL_N, "PAL-N", },
> +	{ VC4_VEC_TV_MODE_SECAM, "SECAM", },
>  };
>  
>  static enum drm_connector_status
> @@ -306,11 +378,16 @@ vc4_vec_connector_set_property(struct drm_connector *connector,
>  		state->tv.mode = DRM_MODE_TV_MODE_NTSC;
>  		break;
>  
> +	case VC4_VEC_TV_MODE_NTSC_443:
> +		state->tv.mode = DRM_MODE_TV_MODE_NTSC_443;
> +		break;
> +
>  	case VC4_VEC_TV_MODE_NTSC_J:
>  		state->tv.mode = DRM_MODE_TV_MODE_NTSC_J;
>  		break;
>  
>  	case VC4_VEC_TV_MODE_PAL:
> +	case VC4_VEC_TV_MODE_PAL_60:
>  		state->tv.mode = DRM_MODE_TV_MODE_PAL;
>  		break;
>  
> @@ -318,6 +395,14 @@ vc4_vec_connector_set_property(struct drm_connector *connector,
>  		state->tv.mode = DRM_MODE_TV_MODE_PAL_M;
>  		break;
>  
> +	case VC4_VEC_TV_MODE_PAL_N:
> +		state->tv.mode = DRM_MODE_TV_MODE_PAL_N;
> +		break;
> +
> +	case VC4_VEC_TV_MODE_SECAM:
> +		state->tv.mode = DRM_MODE_TV_MODE_SECAM;
> +		break;
> +
>  	default:
>  		return -EINVAL;
>  	}
> @@ -341,6 +426,10 @@ vc4_vec_connector_get_property(struct drm_connector *connector,
>  		*val = VC4_VEC_TV_MODE_NTSC;
>  		break;
>  
> +	case DRM_MODE_TV_MODE_NTSC_443:
> +		*val = VC4_VEC_TV_MODE_NTSC_443;
> +		break;
> +
>  	case DRM_MODE_TV_MODE_NTSC_J:
>  		*val = VC4_VEC_TV_MODE_NTSC_J;
>  		break;
> @@ -353,6 +442,14 @@ vc4_vec_connector_get_property(struct drm_connector *connector,
>  		*val = VC4_VEC_TV_MODE_PAL_M;
>  		break;
>  
> +	case DRM_MODE_TV_MODE_PAL_N:
> +		*val = VC4_VEC_TV_MODE_PAL_N;
> +		break;
> +
> +	case DRM_MODE_TV_MODE_SECAM:
> +		*val = VC4_VEC_TV_MODE_SECAM;
> +		break;
> +
>  	default:
>  		return -EINVAL;
>  	}
> @@ -448,13 +545,16 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
>  	struct drm_connector *connector = &vec->connector;
>  	struct drm_connector_state *conn_state =
>  		drm_atomic_get_new_connector_state(state, connector);
> +	struct drm_display_mode *adjusted_mode =
> +		&encoder->crtc->state->adjusted_mode;
>  	const struct vc4_vec_tv_mode *tv_mode;
>  	int idx, ret;
>  
>  	if (!drm_dev_enter(drm, &idx))
>  		return;
>  
> -	tv_mode = vc4_vec_tv_mode_lookup(conn_state->tv.mode);
> +	tv_mode = vc4_vec_tv_mode_lookup(conn_state->tv.mode,
> +					 adjusted_mode->htotal);
>  	if (!tv_mode)
>  		goto err_dev_exit;
>  
> @@ -643,9 +743,12 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
>  
>  	ret = drm_mode_create_tv_properties(drm,
>  					    BIT(DRM_MODE_TV_MODE_NTSC) |
> +					    BIT(DRM_MODE_TV_MODE_NTSC_443) |
>  					    BIT(DRM_MODE_TV_MODE_NTSC_J) |
>  					    BIT(DRM_MODE_TV_MODE_PAL) |
> -					    BIT(DRM_MODE_TV_MODE_PAL_M));
> +					    BIT(DRM_MODE_TV_MODE_PAL_M) |
> +					    BIT(DRM_MODE_TV_MODE_PAL_N) |
> +					    BIT(DRM_MODE_TV_MODE_SECAM));
>  	if (ret)
>  		return ret;
>  
>

