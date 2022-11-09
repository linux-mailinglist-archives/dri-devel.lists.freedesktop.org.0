Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AD4622142
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 02:15:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E7410E55F;
	Wed,  9 Nov 2022 01:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C129D10E05F;
 Wed,  9 Nov 2022 01:15:35 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id r12so23604574lfp.1;
 Tue, 08 Nov 2022 17:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OMVBfmBNvFKVHAfPkhy9AnS3r5KARraBGspiM7WR3cY=;
 b=XUBBpQozEdBuQ0zsHuSXWF4TWAx9W3OnUGYJokkDuYV4lach0WM4PGXb0EwyT5L7sB
 0IvMbPi77mhWWIEMVMiQl3DOUVOD3SI0qeeO7FZX04JLnjfQBgE8/ebyQG6P6/SK4Iuj
 hqoZH49CUDSsX2aiE1J9AkKkRwUn5rcFBkq1S9daRTnJRyuYfVo9G375nxycJMwyfSqT
 tn7BTK/gY/QAK/+3DTvGm1EpbzUWD8RUImqYHaUAGX0ftqRPEic3jQeuDVYScZR1fUhw
 goSlzucdm1su49Pb5kfpmjzBjtmoAXJ9pIPEmBXRkcQcXACOFyApyqOzHlklwDOntQeu
 0WgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OMVBfmBNvFKVHAfPkhy9AnS3r5KARraBGspiM7WR3cY=;
 b=ANI62DYI2rYEPNnE0x3P80ZrvHOKfVQ7uxI8QM1p+JCnjCGB1h8kbDSH5CNb7SPybk
 kTwNSuLfus8J6Wr38ZoeGZHgQAGMZ88YIwjfhIrpeAid6zTX954EENqNbIvGozl8E3MW
 Q5uvNzZHrlyEJ52UhJU8Z2NOpox4OYTfPa+Bt20lGpgmIW580Ou203U/BoSiIT54I3bb
 nVGN4QZn+2opUYbv9dS9jNEZCiG6KfBo1cDzryfm6IsatsuivKR8Jsk5zirpy3ZkfQk5
 QOqQFEcNphOyxxgCKzY6eFpi9vd8clQcXo+EalLi77GBsh6S5dRueibmh1m4gdPB82r+
 inMg==
X-Gm-Message-State: ACrzQf3vImL3+1VcSBQP7H3FNjdv2Ax6AWmNv6Eg8fQy8b7dUZ/ktbwO
 PNpjBCrcyAa7MzGewVfUFrg=
X-Google-Smtp-Source: AMsMyM5gsa/vdAgzO/kkpckLTcNSoVeI+I/Xoy+6rY87PedyNNi/6R72haNMVjP0+QEniBIM+iDWJg==
X-Received: by 2002:a05:6512:6d0:b0:4a4:45c3:8d8a with SMTP id
 u16-20020a05651206d000b004a445c38d8amr21884475lff.329.1667956533757; 
 Tue, 08 Nov 2022 17:15:33 -0800 (PST)
Received: from ?IPV6:2a02:a31a:a240:1700:c55e:6e7d:cf12:d8b7?
 ([2a02:a31a:a240:1700:c55e:6e7d:cf12:d8b7])
 by smtp.googlemail.com with ESMTPSA id
 z1-20020a2e8841000000b0027709abbc5csm1932062ljj.98.2022.11.08.17.15.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 17:15:33 -0800 (PST)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <e0779ff5-3227-4a6f-1c0b-de2fbff99425@gmail.com>
Date: Wed, 9 Nov 2022 02:15:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v7 22/23] drm/vc4: vec: Add support for more analog TV
 standards
Content-Language: pl
To: Maxime Ripard <maxime@cerno.tech>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Lyude Paul <lyude@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>
References: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
 <20220728-rpi-analog-tv-properties-v7-22-7072a478c6b3@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v7-22-7072a478c6b3@cerno.tech>
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
Reply-To: kfyatek+publicgit@gmail.com
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

I ran your v7 patchset on my Pi with Xorg, and the mode switching, as well as
the preferred mode handling, all work really well now!

I just noted that the downstream version of the vc4 driver still has inaccurate
field delays in vc4_crtc.c, which causes vertical lines to appear jagged (like
here: https://user-images.githubusercontent.com/4499762/112738569-385c3280-8f64-11eb-83c4-d671537af209.png).
This has been fixed downstream in
https://github.com/raspberrypi/linux/pull/4241/commits/bc093f27bf2613ec93524fdc19e922dd7dd3d800,
but I guess that should be upstreamed separately...?

Anyway, it's unrelated to the changes made in this patchset, so... I'm not sure
if I'm qualified or allowed to do these, but just in case:

Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>

(that pretty much applies to parts 19-22 in general, I can respond to those
messages as well if you wish)

Best regards,
Mateusz Kwiatkowski

W dniu 7.11.2022 o 15:16, Maxime Ripard pisze:
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
> index a828fc6fb776..d23dbad3cbf6 100644
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
> @@ -648,9 +748,12 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
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
*/pre>

