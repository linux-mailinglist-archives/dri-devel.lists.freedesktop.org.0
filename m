Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E954062E04A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 16:50:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8716510E63D;
	Thu, 17 Nov 2022 15:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F370210E63E;
 Thu, 17 Nov 2022 15:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668700206; x=1700236206;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sw4yYEEitdgh67dZoiR7fLc/Wn1QelhfDuaGlN30eMA=;
 b=F+BX5rvONoiwLHJwbUCOjf5Z43kBVh0lNqTTvd8F/aHHzpssxmud3Dv3
 efyRGnOUpmFgP4DFfVaftEV6w4QuHhPXKsGVSZa/cwapbjr9zkV+Pjofx
 SeIdWpkKLA/ipPByph51elgMdJhg7YyeBTN2Ekjmv9BECGopl56tvFNGJ
 luiJjMeM55sKBnc5M5oBv1V62oaW4z+oqa15uCrvIVc72FYuiA0u9b6iX
 Mb5FGd4eOpoRFfiJ/b2y1p08uS+3HOjJGzJEwBMUUAyPoHrGkhnxUIqVE
 EQ0YshiGthFkFii42ED944gXFa4Ep5BEtPu+R5kxLj/prKl8U3FTiGlCz Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="314699797"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="314699797"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 07:49:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="782263242"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="782263242"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga001.fm.intel.com with ESMTP; 17 Nov 2022 07:49:41 -0800
Received: from maurocar-mobl2 (smckenn1-MOBL.ger.corp.intel.com [10.252.19.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 32EE7580DFD;
 Thu, 17 Nov 2022 07:49:30 -0800 (PST)
Date: Thu, 17 Nov 2022 16:49:28 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v10 18/19] drm/vc4: vec: Add support for more analog TV
 standards
Message-ID: <20221117164928.200b3a1a@maurocar-mobl2>
In-Reply-To: <20220728-rpi-analog-tv-properties-v10-18-256dad125326@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
 <20220728-rpi-analog-tv-properties-v10-18-256dad125326@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Noralf =?UTF-8?B?VHLDuG5uZXM=?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Nov 2022 10:29:01 +0100
Maxime Ripard <maxime@cerno.tech> wrote:

> From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
>=20
> Add support for the following composite output modes (all of them are
> somewhat more obscure than the previously defined ones):
>=20
> - NTSC_443 - NTSC-style signal with the chroma subcarrier shifted to
>   4.43361875 MHz (the PAL subcarrier frequency). Never used for
>   broadcasting, but sometimes used as a hack to play NTSC content in PAL
>   regions (e.g. on VCRs).

> - PAL_N - PAL with alternative chroma subcarrier frequency,
>   3.58205625 MHz. Used as a broadcast standard in Argentina, Paraguay
>   and Uruguay to fit 576i50 with colour in 6 MHz channel raster.

That's not right. Argentina uses a different standard than Paraguay and
Uruguai.

See, there are two variants of PAL/N. The original one and PAL/N' - also
called PAL/NC or PAL/CN (Combination N). Some of the timings are=20
different on /NC variant.

As far as I'm aware, PAL/Nc is used in Argentina, while
PAL/N is used in Paraguai and Uruguai, but I may be wrong on that,
as it has been a long time since had to touch on this.

> - PAL60 - 480i60 signal with PAL-style color at normal European PAL
>   frequency. Another non-standard, non-broadcast mode, used in similar
>   contexts as NTSC_443. Some displays support one but not the other.

> - SECAM - French frequency-modulated analog color standard; also have
>   been broadcast in Eastern Europe and various parts of Africa and Asia.
>   Uses the same 576i50 timings as PAL.

This is also wrong. just like PAL, there are several variants of SECAM,
one used in France, and a different one in France overseas and on
previous France colonies in Africa and Asia. Eastern Europe also used
different variants of SECAM.

>=20
> Also added some comments explaining color subcarrier frequency
> registers.
>=20
> Acked-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> ---
> Changes in v6:
> - Support PAL60 again
> ---
>  drivers/gpu/drm/vc4/vc4_vec.c | 111 ++++++++++++++++++++++++++++++++++++=
++++--
>  1 file changed, 107 insertions(+), 4 deletions(-)
>=20
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
> =20
> @@ -118,6 +140,14 @@
> =20
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
> =20
> @@ -197,10 +227,15 @@ enum vc4_vec_tv_mode_id {
>  	VC4_VEC_TV_MODE_NTSC_J,
>  	VC4_VEC_TV_MODE_PAL,
>  	VC4_VEC_TV_MODE_PAL_M,
> +	VC4_VEC_TV_MODE_NTSC_443,
> +	VC4_VEC_TV_MODE_PAL_60,
> +	VC4_VEC_TV_MODE_PAL_N,
> +	VC4_VEC_TV_MODE_SECAM,
>  };
> =20
>  struct vc4_vec_tv_mode {
>  	unsigned int mode;
> +	u16 expected_htotal;
>  	u32 config0;
>  	u32 config1;
>  	u32 custom_freq;
> @@ -236,35 +271,68 @@ static const struct debugfs_reg32 vec_regs[] =3D {
>  static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] =3D {
>  	{
>  		.mode =3D DRM_MODE_TV_MODE_NTSC,
> +		.expected_htotal =3D 858,
>  		.config0 =3D VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN,
>  		.config1 =3D VEC_CONFIG1_C_CVBS_CVBS,
>  	},
> +	{
> +		.mode =3D DRM_MODE_TV_MODE_NTSC_443,
> +		.expected_htotal =3D 858,
> +		.config0 =3D VEC_CONFIG0_NTSC_STD,
> +		.config1 =3D VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
> +		.custom_freq =3D 0x2a098acb,
> +	},
>  	{
>  		.mode =3D DRM_MODE_TV_MODE_NTSC_J,
> +		.expected_htotal =3D 858,
>  		.config0 =3D VEC_CONFIG0_NTSC_STD,
>  		.config1 =3D VEC_CONFIG1_C_CVBS_CVBS,
>  	},
>  	{
>  		.mode =3D DRM_MODE_TV_MODE_PAL,
> +		.expected_htotal =3D 864,
>  		.config0 =3D VEC_CONFIG0_PAL_BDGHI_STD,
>  		.config1 =3D VEC_CONFIG1_C_CVBS_CVBS,
>  	},
> +	{
> +		/* PAL-60 */
> +		.mode =3D DRM_MODE_TV_MODE_PAL,
> +		.expected_htotal =3D 858,
> +		.config0 =3D VEC_CONFIG0_PAL_M_STD,
> +		.config1 =3D VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
> +		.custom_freq =3D 0x2a098acb,
> +	},
>  	{
>  		.mode =3D DRM_MODE_TV_MODE_PAL_M,
> +		.expected_htotal =3D 858,
>  		.config0 =3D VEC_CONFIG0_PAL_M_STD,
>  		.config1 =3D VEC_CONFIG1_C_CVBS_CVBS,
>  	},
> +	{
> +		.mode =3D DRM_MODE_TV_MODE_PAL_N,
> +		.expected_htotal =3D 864,
> +		.config0 =3D VEC_CONFIG0_PAL_N_STD,
> +		.config1 =3D VEC_CONFIG1_C_CVBS_CVBS,
> +	},
> +	{
> +		.mode =3D DRM_MODE_TV_MODE_SECAM,
> +		.expected_htotal =3D 864,
> +		.config0 =3D VEC_CONFIG0_SECAM_STD,
> +		.config1 =3D VEC_CONFIG1_C_CVBS_CVBS,
> +		.custom_freq =3D 0x29c71c72,
> +	},
>  };
> =20
>  static inline const struct vc4_vec_tv_mode *
> -vc4_vec_tv_mode_lookup(unsigned int mode)
> +vc4_vec_tv_mode_lookup(unsigned int mode, u16 htotal)
>  {
>  	unsigned int i;
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(vc4_vec_tv_modes); i++) {
>  		const struct vc4_vec_tv_mode *tv_mode =3D &vc4_vec_tv_modes[i];
> =20
> -		if (tv_mode->mode =3D=3D mode)
> +		if (tv_mode->mode =3D=3D mode &&
> +		    tv_mode->expected_htotal =3D=3D htotal)
>  			return tv_mode;
>  	}
> =20
> @@ -273,9 +341,13 @@ vc4_vec_tv_mode_lookup(unsigned int mode)
> =20
>  static const struct drm_prop_enum_list legacy_tv_mode_names[] =3D {
>  	{ VC4_VEC_TV_MODE_NTSC, "NTSC", },
> +	{ VC4_VEC_TV_MODE_NTSC_443, "NTSC-443", },
>  	{ VC4_VEC_TV_MODE_NTSC_J, "NTSC-J", },
>  	{ VC4_VEC_TV_MODE_PAL, "PAL", },
> +	{ VC4_VEC_TV_MODE_PAL_60, "PAL-60", },
>  	{ VC4_VEC_TV_MODE_PAL_M, "PAL-M", },
> +	{ VC4_VEC_TV_MODE_PAL_N, "PAL-N", },
> +	{ VC4_VEC_TV_MODE_SECAM, "SECAM", },
>  };
> =20
>  static enum drm_connector_status
> @@ -306,11 +378,16 @@ vc4_vec_connector_set_property(struct drm_connector=
 *connector,
>  		state->tv.mode =3D DRM_MODE_TV_MODE_NTSC;
>  		break;
> =20
> +	case VC4_VEC_TV_MODE_NTSC_443:
> +		state->tv.mode =3D DRM_MODE_TV_MODE_NTSC_443;
> +		break;
> +
>  	case VC4_VEC_TV_MODE_NTSC_J:
>  		state->tv.mode =3D DRM_MODE_TV_MODE_NTSC_J;
>  		break;
> =20
>  	case VC4_VEC_TV_MODE_PAL:
> +	case VC4_VEC_TV_MODE_PAL_60:
>  		state->tv.mode =3D DRM_MODE_TV_MODE_PAL;
>  		break;
> =20
> @@ -318,6 +395,14 @@ vc4_vec_connector_set_property(struct drm_connector =
*connector,
>  		state->tv.mode =3D DRM_MODE_TV_MODE_PAL_M;
>  		break;
> =20
> +	case VC4_VEC_TV_MODE_PAL_N:
> +		state->tv.mode =3D DRM_MODE_TV_MODE_PAL_N;
> +		break;
> +
> +	case VC4_VEC_TV_MODE_SECAM:
> +		state->tv.mode =3D DRM_MODE_TV_MODE_SECAM;
> +		break;
> +
>  	default:
>  		return -EINVAL;
>  	}
> @@ -341,6 +426,10 @@ vc4_vec_connector_get_property(struct drm_connector =
*connector,
>  		*val =3D VC4_VEC_TV_MODE_NTSC;
>  		break;
> =20
> +	case DRM_MODE_TV_MODE_NTSC_443:
> +		*val =3D VC4_VEC_TV_MODE_NTSC_443;
> +		break;
> +
>  	case DRM_MODE_TV_MODE_NTSC_J:
>  		*val =3D VC4_VEC_TV_MODE_NTSC_J;
>  		break;
> @@ -353,6 +442,14 @@ vc4_vec_connector_get_property(struct drm_connector =
*connector,
>  		*val =3D VC4_VEC_TV_MODE_PAL_M;
>  		break;
> =20
> +	case DRM_MODE_TV_MODE_PAL_N:
> +		*val =3D VC4_VEC_TV_MODE_PAL_N;
> +		break;
> +
> +	case DRM_MODE_TV_MODE_SECAM:
> +		*val =3D VC4_VEC_TV_MODE_SECAM;
> +		break;
> +
>  	default:
>  		return -EINVAL;
>  	}
> @@ -448,13 +545,16 @@ static void vc4_vec_encoder_enable(struct drm_encod=
er *encoder,
>  	struct drm_connector *connector =3D &vec->connector;
>  	struct drm_connector_state *conn_state =3D
>  		drm_atomic_get_new_connector_state(state, connector);
> +	struct drm_display_mode *adjusted_mode =3D
> +		&encoder->crtc->state->adjusted_mode;
>  	const struct vc4_vec_tv_mode *tv_mode;
>  	int idx, ret;
> =20
>  	if (!drm_dev_enter(drm, &idx))
>  		return;
> =20
> -	tv_mode =3D vc4_vec_tv_mode_lookup(conn_state->tv.mode);
> +	tv_mode =3D vc4_vec_tv_mode_lookup(conn_state->tv.mode,
> +					 adjusted_mode->htotal);
>  	if (!tv_mode)
>  		goto err_dev_exit;
> =20
> @@ -648,9 +748,12 @@ static int vc4_vec_bind(struct device *dev, struct d=
evice *master, void *data)
> =20
>  	ret =3D drm_mode_create_tv_properties(drm,
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
> =20
>=20
