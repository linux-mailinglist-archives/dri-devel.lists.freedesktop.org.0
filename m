Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D01360340
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 09:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4D46E9ED;
	Thu, 15 Apr 2021 07:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776996E9ED
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 07:24:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0C758B08C;
 Thu, 15 Apr 2021 07:24:57 +0000 (UTC)
Subject: Re: [PATCH 18/18] drm/vc4: hdmi: Force YUV422 if the rate is too high
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-19-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <be5c9d25-df43-adb8-759b-46adb50854ad@suse.de>
Date: Thu, 15 Apr 2021 09:24:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210317154352.732095-19-maxime@cerno.tech>
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
Content-Type: multipart/mixed; boundary="===============0609539870=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0609539870==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="k405ygxKslPB7BIYehmzxS5bup1ydJalD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--k405ygxKslPB7BIYehmzxS5bup1ydJalD
Content-Type: multipart/mixed; boundary="hsdWJCIZJvKA2Roes56oaW14r3e4kMGKw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Message-ID: <be5c9d25-df43-adb8-759b-46adb50854ad@suse.de>
Subject: Re: [PATCH 18/18] drm/vc4: hdmi: Force YUV422 if the rate is too high
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-19-maxime@cerno.tech>
In-Reply-To: <20210317154352.732095-19-maxime@cerno.tech>

--hsdWJCIZJvKA2Roes56oaW14r3e4kMGKw
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 17.03.21 um 16:43 schrieb Maxime Ripard:
> When using the modes that need the highest pixel rate we support (such
> as 4k at 60Hz), using a 10 or 12 bpc output will put us over the limit
> of what we can achieve.
>=20
> In such a case, let's force our output to be YUV422 so that we can go
> back down under the required clock rate.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 37 +++++++++++++++++++++++++++++++++=
-
>   1 file changed, 36 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> index c4f91d39d91c..12eda1e76338 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1029,6 +1029,41 @@ static unsigned long vc4_hdmi_calc_pixel_rate(st=
ruct drm_bridge *bridge,
>   	return pixel_rate;
>   }
>  =20
> +static u32 *vc4_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_brid=
ge *bridge,
> +						       struct drm_bridge_state *bridge_state,
> +						       struct drm_crtc_state *crtc_state,
> +						       struct drm_connector_state *conn_state,
> +						       unsigned int *num_output_fmts)
> +{
> +	struct vc4_hdmi *vc4_hdmi =3D bridge_to_vc4_hdmi(bridge);
> +	unsigned long long pixel_rate =3D vc4_hdmi_calc_pixel_rate(bridge,
> +								 bridge_state,
> +								 crtc_state,
> +								 conn_state);
> +
> +	/*
> +	 * If our pixel rate is too fast, force YUV422 and hope it works
> +	 */
> +	if (pixel_rate > vc4_hdmi->variant->max_pixel_clock) {
> +		u32 *output_fmts;
> +
> +		output_fmts =3D kzalloc(sizeof(*output_fmts), GFP_KERNEL);
> +		if (!output_fmts)
> +			return NULL;
> +
> +		*output_fmts =3D MEDIA_BUS_FMT_UYVY8_1X16;
> +		*num_output_fmts =3D 1;
> +
> +		return output_fmts;
> +	}
> +
> +	return drm_atomic_helper_bridge_hdmi_get_output_bus_fmts(bridge,
> +								 bridge_state,
> +								 crtc_state,
> +								 conn_state,
> +								 num_output_fmts);
> +}
> +
>   static int vc4_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
>   					struct drm_bridge_state *bridge_state,
>   					struct drm_crtc_state *crtc_state,
> @@ -1088,7 +1123,7 @@ static const struct drm_bridge_funcs vc4_hdmi_bri=
dge_funcs =3D {
>   	.atomic_check =3D	vc4_hdmi_bridge_atomic_check,
>   	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
>   	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state=
,
> -	.atomic_get_output_bus_fmts =3D drm_atomic_helper_bridge_hdmi_get_out=
put_bus_fmts,
> +	.atomic_get_output_bus_fmts =3D vc4_hdmi_bridge_atomic_get_output_bus=
_fmts,
>   	.atomic_reset =3D drm_atomic_helper_bridge_reset,
>   	.mode_valid =3D	vc4_hdmi_bridge_mode_valid,
>   };
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--hsdWJCIZJvKA2Roes56oaW14r3e4kMGKw--

--k405ygxKslPB7BIYehmzxS5bup1ydJalD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmB36kcFAwAAAAAACgkQlh/E3EQov+C1
oxAAuEyOBMM9YWadMQjQY4aLFWCIDADCS9RVub+dtFgPtabS/LSeyDsWo200uWEGLmYz+MSgrypT
ctdMB9TpECIZ8DRrOw/pSLX1dwfo7KhznLxGWMD+7lptnTY+OLrNJI/2AXKMtBsHo+J9nJlMEuOx
T2coRDjtxgvNGCkAwveTkmDiVDTkbOglL5BIe4jGLBldbHU6+wMLuhTCDxFYA9kHs43BMmaQ0stz
9s6RTkNOC4Wozz4ZD9Yb+Zw5Bou0Wdxu6dSMfaGbfOPLEOfP84DlYjUPhlApBp1qKUIb6moGf2rk
ezzDRXWuVjWyifwFaY5ompp21/2LPys0RmVR5uRZiVkawM4rNEFfVMAkX+BlbTEoOy9htVWUNgpZ
L5VTnyrhl27U4qj/71ljdAMuKhi30sM5FO2x0xxNkKiBMrLGBgTaXVLo172TEUJfiUNO9Oqi7Ic8
FBKZ7WxEL1+e8gQ5z19RvrrwMRRbDwysW+L5q6xcVptuQTZgVAcXNsegBJRX5BOdjZz/wshnSMLi
LJxtXNGQ9NHra2T+k5YYkEVY6hnYeHYEjVoq2hMxbJVEHOMPlrlZ+CZdJRvj/M/9kIqYsK116/2M
Gh1xWsekszJIFaM6izLMDv1Ensx5rkpQbGzn4sXDuXrL2JmdxGM+RpZ5BgBUx5Ky9c5dDALV/16I
dv0=
=DoX8
-----END PGP SIGNATURE-----

--k405ygxKslPB7BIYehmzxS5bup1ydJalD--

--===============0609539870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0609539870==--
