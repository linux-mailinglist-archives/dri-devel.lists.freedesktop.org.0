Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2234360291
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 08:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB6A6E0F7;
	Thu, 15 Apr 2021 06:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462DC6E0F7
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 06:43:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BA410B03A;
 Thu, 15 Apr 2021 06:43:53 +0000 (UTC)
Subject: Re: [PATCH 16/18] drm/vc4: hdmi: Support HDMI YUV output
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-17-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <11d0002f-8bfe-286b-cc1a-81b2e4aa0837@suse.de>
Date: Thu, 15 Apr 2021 08:43:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210317154352.732095-17-maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: multipart/mixed; boundary="===============2021657765=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2021657765==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TYL3z2d2d9gk2PancQKZRp5TPZml8xFof"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TYL3z2d2d9gk2PancQKZRp5TPZml8xFof
Content-Type: multipart/mixed; boundary="R3fgjv4KiA0jnRg8cNpBsFj7pXjPvJUeN";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 linux-rpi-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org
Message-ID: <11d0002f-8bfe-286b-cc1a-81b2e4aa0837@suse.de>
Subject: Re: [PATCH 16/18] drm/vc4: hdmi: Support HDMI YUV output
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-17-maxime@cerno.tech>
In-Reply-To: <20210317154352.732095-17-maxime@cerno.tech>

--R3fgjv4KiA0jnRg8cNpBsFj7pXjPvJUeN
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 17.03.21 um 16:43 schrieb Maxime Ripard:
> The HDMI controllers in the BCM2711 support YUV444 and YUV420 outputs,
> let's add support for it.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/gpu/drm/vc4/vc4_hdmi.c      | 73 +++++++++++++++++++++++++++-=
-
>   drivers/gpu/drm/vc4/vc4_hdmi_regs.h |  6 +++
>   drivers/gpu/drm/vc4/vc4_regs.h      | 16 +++++++
>   3 files changed, 90 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> index 83e44cf44d65..407b468dab67 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -33,6 +33,7 @@
>  =20
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_edid.h>
> +#include <drm/drm_hdmi.h>
>   #include <drm/drm_probe_helper.h>
>   #include <drm/drm_simple_kms_helper.h>
>   #include <linux/clk.h>
> @@ -388,6 +389,8 @@ static void vc4_hdmi_set_avi_infoframe(struct vc4_h=
dmi *vc4_hdmi,
>   	struct drm_connector *connector =3D &vc4_hdmi->connector;
>   	struct drm_connector_state *cstate =3D
>   		drm_atomic_get_new_connector_state(state, connector);
> +	struct drm_bridge_state *bstate =3D
> +		drm_atomic_get_new_bridge_state(state, &vc4_hdmi->bridge.base);
>   	struct drm_crtc *crtc =3D encoder->crtc;
>   	const struct drm_display_mode *mode =3D &crtc->state->adjusted_mode;=

>   	union hdmi_infoframe frame;
> @@ -407,6 +410,7 @@ static void vc4_hdmi_set_avi_infoframe(struct vc4_h=
dmi *vc4_hdmi,
>   					   HDMI_QUANTIZATION_RANGE_LIMITED);
>  =20
>   	drm_hdmi_avi_infoframe_bars(&frame.avi, cstate);
> +	drm_hdmi_avi_infoframe_output_colorspace(&frame.avi, &bstate->output_=
bus_cfg);
>  =20
>   	vc4_hdmi_write_infoframe(vc4_hdmi, &frame);
>   }
> @@ -558,6 +562,38 @@ static const u16 vc5_hdmi_csc_full_rgb_to_limited_=
rgb[3][4] =3D {
>   	{ 0x0000, 0x0000, 0x1b80, 0x0400 },
>   };
>  =20
> +/*
> + * Conversion between Full Range RGB and Full Range YUV422 using the
> + * BT.709 Colorspace
> + *
> + * [  0.212639  0.715169  0.072192  0   ]
> + * [ -0.117208 -0.394207  0.511416  128 ]
> + * [  0.511416 -0.464524 -0.046891  128 ]
> + *
> + * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
> + */
> +static const u16 vc5_hdmi_csc_full_rgb_to_full_yuv422_bt709[3][4] =3D =
{
> +	{ 0x06ce, 0x16e3, 0x024f, 0x0000 },
> +	{ 0xfc41, 0xf364, 0x105e, 0x2000 },
> +	{ 0x105e, 0xf124, 0xfe81, 0x2000 },
> +};
> +
> +/*
> + * Conversion between Full Range RGB and Full Range YUV444 using the
> + * BT.709 Colorspace
> + *
> + * [ -0.117208 -0.394207  0.511416  128 ]
> + * [  0.511416 -0.464524 -0.046891  128 ]
> + * [  0.212639  0.715169  0.072192  0   ]
> + *
> + * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
> + */
> +static const u16 vc5_hdmi_csc_full_rgb_to_full_yuv444_bt709[3][4] =3D =
{
> +	{ 0xfc41, 0xf364, 0x105e, 0x2000 },
> +	{ 0x105e, 0xf124, 0xfe81, 0x2000 },
> +	{ 0x06ce, 0x16e3, 0x024f, 0x0000 },
> +};
> +
>   static void vc5_hdmi_set_csc_coeffs(struct vc4_hdmi *vc4_hdmi,
>   				    const u16 coeffs[3][4])
>   {
> @@ -573,16 +609,42 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *v=
c4_hdmi,
>   			       struct drm_atomic_state *state,
>   			       const struct drm_display_mode *mode)
>   {
> +	struct drm_bridge *bridge =3D &vc4_hdmi->bridge.base;
> +	struct drm_bridge_state *bridge_state =3D
> +		drm_atomic_get_new_bridge_state(state, bridge);
> +	u32 if_cfg =3D 0;
> +	u32 if_xbar =3D 0x543210;
> +	u32 csc_chan_ctl =3D 0;
>   	u32 csc_ctl =3D VC5_MT_CP_CSC_CTL_ENABLE | VC4_SET_FIELD(VC4_HD_CSC_=
CTL_MODE_CUSTOM,
>   							       VC5_MT_CP_CSC_CTL_MODE);
>  =20
> -	HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, 0x354021);
> +	if (drm_hdmi_bus_fmt_is_yuv422(bridge_state->output_bus_cfg.format)) =
{
> +		csc_ctl |=3D VC4_SET_FIELD(VC5_MT_CP_CSC_CTL_FILTER_MODE_444_TO_422_=
STANDARD,
> +					 VC5_MT_CP_CSC_CTL_FILTER_MODE_444_TO_422) |
> +			VC5_MT_CP_CSC_CTL_USE_444_TO_422 |
> +			VC5_MT_CP_CSC_CTL_USE_RNG_SUPPRESSION;

Indention appears to be wrong.

>  =20
> -	if (vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode))
> -		vc5_hdmi_set_csc_coeffs(vc4_hdmi, &vc5_hdmi_csc_full_rgb_unity);
> -	else
> -		vc5_hdmi_set_csc_coeffs(vc4_hdmi, &vc5_hdmi_csc_full_rgb_to_limited_=
rgb);
> +		csc_chan_ctl |=3D VC4_SET_FIELD(VC5_MT_CP_CHANNEL_CTL_OUTPUT_REMAP_L=
EGACY_STYLE,
> +					      VC5_MT_CP_CHANNEL_CTL_OUTPUT_REMAP);
>  =20
> +		if_cfg |=3D VC4_SET_FIELD(VC5_DVP_HT_VEC_INTERFACE_CFG_SEL_422_FORMA=
T_422_LEGACY,
> +					VC5_DVP_HT_VEC_INTERFACE_CFG_SEL_422);
> +
> +		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_full_yuv4=
22_bt709);
> +	} else if (drm_hdmi_bus_fmt_is_yuv444(bridge_state->output_bus_cfg.fo=
rmat)) {
> +		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_full_yuv4=
44_bt709);
> +	} else if (drm_hdmi_bus_fmt_is_rgb(bridge_state->output_bus_cfg.forma=
t)) {
> +		if_xbar =3D 0x354021;
> +
> +		if (vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode))
> +			vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_unity);
> +		else
> +			vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_limited_=
rgb);
> +	}
> +
> +	HDMI_WRITE(HDMI_VEC_INTERFACE_CFG, if_cfg);
> +	HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, if_xbar);
> +	HDMI_WRITE(HDMI_CSC_CHANNEL_CTL, csc_chan_ctl);
>   	HDMI_WRITE(HDMI_CSC_CTL, csc_ctl);
>   }
>  =20
> @@ -1012,6 +1074,7 @@ static const struct drm_bridge_funcs vc4_hdmi_bri=
dge_funcs =3D {
>   	.atomic_check =3D	vc4_hdmi_bridge_atomic_check,
>   	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
>   	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state=
,
> +	.atomic_get_output_bus_fmts =3D drm_atomic_helper_bridge_hdmi_get_out=
put_bus_fmts,
>   	.atomic_reset =3D drm_atomic_helper_bridge_reset,
>   	.mode_valid =3D	vc4_hdmi_bridge_mode_valid,
>   };
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h b/drivers/gpu/drm/vc4/=
vc4_hdmi_regs.h
> index e1b58eac766f..d03b9ad72412 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
> @@ -52,6 +52,7 @@ enum vc4_hdmi_field {
>   	HDMI_CSC_24_23,
>   	HDMI_CSC_32_31,
>   	HDMI_CSC_34_33,
> +	HDMI_CSC_CHANNEL_CTL,
>   	HDMI_CSC_CTL,
>  =20
>   	/*
> @@ -116,6 +117,7 @@ enum vc4_hdmi_field {
>   	HDMI_TX_PHY_POWERDOWN_CTL,
>   	HDMI_TX_PHY_RESET_CTL,
>   	HDMI_TX_PHY_TMDS_CLK_WORD_SEL,
> +	HDMI_VEC_INTERFACE_CFG,
>   	HDMI_VEC_INTERFACE_XBAR,
>   	HDMI_VERTA0,
>   	HDMI_VERTA1,
> @@ -240,6 +242,7 @@ static const struct vc4_hdmi_register __maybe_unuse=
d vc5_hdmi_hdmi0_fields[] =3D {
>   	VC4_HDMI_REG(HDMI_HOTPLUG, 0x1a8),
>  =20
>   	VC5_DVP_REG(HDMI_CLOCK_STOP, 0x0bc),
> +	VC5_DVP_REG(HDMI_VEC_INTERFACE_CFG, 0x0ec),
>   	VC5_DVP_REG(HDMI_VEC_INTERFACE_XBAR, 0x0f0),
>  =20
>   	VC5_PHY_REG(HDMI_TX_PHY_RESET_CTL, 0x000),
> @@ -285,6 +288,7 @@ static const struct vc4_hdmi_register __maybe_unuse=
d vc5_hdmi_hdmi0_fields[] =3D {
>   	VC5_CSC_REG(HDMI_CSC_24_23, 0x010),
>   	VC5_CSC_REG(HDMI_CSC_32_31, 0x014),
>   	VC5_CSC_REG(HDMI_CSC_34_33, 0x018),
> +	VC5_CSC_REG(HDMI_CSC_CHANNEL_CTL, 0x02c),
>   };
>  =20
>   static const struct vc4_hdmi_register __maybe_unused vc5_hdmi_hdmi1_f=
ields[] =3D {
> @@ -319,6 +323,7 @@ static const struct vc4_hdmi_register __maybe_unuse=
d vc5_hdmi_hdmi1_fields[] =3D {
>   	VC4_HDMI_REG(HDMI_HOTPLUG, 0x1a8),
>  =20
>   	VC5_DVP_REG(HDMI_CLOCK_STOP, 0x0bc),
> +	VC5_DVP_REG(HDMI_VEC_INTERFACE_CFG, 0x0ec),
>   	VC5_DVP_REG(HDMI_VEC_INTERFACE_XBAR, 0x0f0),
>  =20
>   	VC5_PHY_REG(HDMI_TX_PHY_RESET_CTL, 0x000),
> @@ -364,6 +369,7 @@ static const struct vc4_hdmi_register __maybe_unuse=
d vc5_hdmi_hdmi1_fields[] =3D {
>   	VC5_CSC_REG(HDMI_CSC_24_23, 0x010),
>   	VC5_CSC_REG(HDMI_CSC_32_31, 0x014),
>   	VC5_CSC_REG(HDMI_CSC_34_33, 0x018),
> +	VC5_CSC_REG(HDMI_CSC_CHANNEL_CTL, 0x02c),
>   };
>  =20
>   static inline
> diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_r=
egs.h
> index 9d7c034c8b4f..ff5c5faa019e 100644
> --- a/drivers/gpu/drm/vc4/vc4_regs.h
> +++ b/drivers/gpu/drm/vc4/vc4_regs.h
> @@ -744,11 +744,27 @@
>   # define VC4_HD_CSC_CTL_RGB2YCC			BIT(1)
>   # define VC4_HD_CSC_CTL_ENABLE			BIT(0)
>  =20
> +# define VC5_MT_CP_CSC_CTL_USE_444_TO_422	BIT(6)
> +# define VC5_MT_CP_CSC_CTL_FILTER_MODE_444_TO_422_MASK \
> +						VC4_MASK(5, 4)
> +# define VC5_MT_CP_CSC_CTL_FILTER_MODE_444_TO_422_STANDARD \
> +						3

These defines should fit onto a single 100-character line. (?) Here and=20
below.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> +# define VC5_MT_CP_CSC_CTL_USE_RNG_SUPPRESSION	BIT(3)
>   # define VC5_MT_CP_CSC_CTL_ENABLE		BIT(2)
>   # define VC5_MT_CP_CSC_CTL_MODE_MASK		VC4_MASK(1, 0)
>  =20
> +# define VC5_MT_CP_CHANNEL_CTL_OUTPUT_REMAP_MASK \
> +						VC4_MASK(7, 6)
> +# define VC5_MT_CP_CHANNEL_CTL_OUTPUT_REMAP_LEGACY_STYLE \
> +						2
> +
>   # define VC4_DVP_HT_CLOCK_STOP_PIXEL		BIT(1)
>  =20
> +# define VC5_DVP_HT_VEC_INTERFACE_CFG_SEL_422_MASK \
> +						VC4_MASK(3, 2)
> +# define VC5_DVP_HT_VEC_INTERFACE_CFG_SEL_422_FORMAT_422_LEGACY \
> +						2
> +
>   /* HVS display list information. */
>   #define HVS_BOOTLOADER_DLIST_END                32
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--R3fgjv4KiA0jnRg8cNpBsFj7pXjPvJUeN--

--TYL3z2d2d9gk2PancQKZRp5TPZml8xFof
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmB34KYFAwAAAAAACgkQlh/E3EQov+A6
xRAAjeE+2Qofko9ZgdIF29WnFtse5mxMAixzjFoE8nHCFDpyMoBNNzHqvGHWEzZ9ktdXhMktjZX2
UNO4P/uBZZ7haTpfqxMy8OjX6bD+UP45BmYHxQyi32gWGCDmzIG+NsY6GhD0vniAM3c0S4Fy8pES
CSrm+/ObAS07ej9JVKkCevEDEYk/rOrPzHX4E+HrPybCMdQFuUnvR6V+onZSRQ+DEwnCUDEgA4sZ
rkb/v3Tk/DA4RP48qtwmMgPTAq3evRBSdIodLkGEU68w4LcnJpgNAtJ18RrHJTPLmYxfcAMq0q1v
VAcbpdOL3BlFQ0JcPRqc/p7guJ9jEmi+2PjziacZh5QJrEM3XEXcGursl65KiR2fcHCtB42s2IBK
379E2OOjYKb/CafeCFRfzkRGdHnpt/lPOz7PnmcW0iRm2rcm9S7j6WKXDF8rvAQWgEZ+tNpZdPaN
Cj1e8O74gTl3PFPsYxIj8mgZ/wM4HwSFkH59LXQ9GkvH9v6X5c7iE0r9wMSHcg8jGLKoZKlB3vhN
NKXWp1h+c/xb4ynfcu1NxUBRcjxDb5nxWy66sa7MDnBEPP1jtJqo6RMI/KRPpNUCbUzlL65u+5ur
XJes3VNLmQhkG75Hp6mgSSpiu8esN2OOczcxE4SCOOWZTCEPruWH27ocMQo+u/e0EN0EPBO2/cD8
9z8=
=AS2s
-----END PGP SIGNATURE-----

--TYL3z2d2d9gk2PancQKZRp5TPZml8xFof--

--===============2021657765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2021657765==--
