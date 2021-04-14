Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B7C35F578
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 15:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61BC6E49F;
	Wed, 14 Apr 2021 13:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446846E49F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 13:56:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C0BC8AFDF;
 Wed, 14 Apr 2021 13:56:39 +0000 (UTC)
Subject: Re: [PATCH 14/18] drm/vc4: hdmi: Change CSC callback prototype
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-15-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <4a20abab-c0d4-f16a-15ba-f09170a93492@suse.de>
Date: Wed, 14 Apr 2021 15:56:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210317154352.732095-15-maxime@cerno.tech>
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
Content-Type: multipart/mixed; boundary="===============1596224965=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1596224965==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="gt6u6FqjDqq6bDbgAyOocrte6ngb91hos"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--gt6u6FqjDqq6bDbgAyOocrte6ngb91hos
Content-Type: multipart/mixed; boundary="CVIiXAziKVV0sSXMgVrxR8IMmnWTQkgCP";
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
Message-ID: <4a20abab-c0d4-f16a-15ba-f09170a93492@suse.de>
Subject: Re: [PATCH 14/18] drm/vc4: hdmi: Change CSC callback prototype
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-15-maxime@cerno.tech>
In-Reply-To: <20210317154352.732095-15-maxime@cerno.tech>

--CVIiXAziKVV0sSXMgVrxR8IMmnWTQkgCP
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 17.03.21 um 16:43 schrieb Maxime Ripard:
> In order to support the YUV output, we'll need the atomic state to know=

> what is the state of the associated property in the CSC setup callback.=

>=20
> Let's change the prototype of that callback to allow us to access it.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 4 +++-
>   drivers/gpu/drm/vc4/vc4_hdmi.h | 1 +
>   2 files changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> index 9614de7303b8..56b5654c820f 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -490,6 +490,7 @@ static void vc4_hdmi_bridge_post_crtc_powerdown(str=
uct drm_bridge *bridge,
>   }
>  =20
>   static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
> +			       struct drm_atomic_state *state,

With the line length updated to 100 characters, this might just fit onto =

the previous line. Anyway

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

>   			       const struct drm_display_mode *mode)
>   {
>   	u32 csc_ctl;
> @@ -570,6 +571,7 @@ static void vc5_hdmi_set_csc_coeffs(struct vc4_hdmi=20
*vc4_hdmi,
>   }
>  =20
>   static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
> +			       struct drm_atomic_state *state,
>   			       const struct drm_display_mode *mode)
>   {
>   	u32 csc_ctl =3D VC5_MT_CP_CSC_CTL_ENABLE | VC4_SET_FIELD(VC4_HD_CSC_=
CTL_MODE_CUSTOM,
> @@ -860,7 +862,7 @@ static void vc4_hdmi_bridge_pre_crtc_enable(struct =
drm_bridge *bridge,
>   	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
>  =20
>   	if (vc4_hdmi->variant->csc_setup)
> -		vc4_hdmi->variant->csc_setup(vc4_hdmi, mode);
> +		vc4_hdmi->variant->csc_setup(vc4_hdmi, state, mode);
>  =20
>   	HDMI_WRITE(HDMI_FIFO_CTL, VC4_HDMI_FIFO_CTL_MASTER_SLAVE_N);
>   }
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_h=
dmi.h
> index d03c849d6ea0..cf5e58a08eb4 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -78,6 +78,7 @@ struct vc4_hdmi_variant {
>  =20
>   	/* Callback to enable / disable the CSC */
>   	void (*csc_setup)(struct vc4_hdmi *vc4_hdmi,
> +			  struct drm_atomic_state *state,
>   			  const struct drm_display_mode *mode);
>  =20
>   	/* Callback to configure the video timings in the HDMI block */
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--CVIiXAziKVV0sSXMgVrxR8IMmnWTQkgCP--

--gt6u6FqjDqq6bDbgAyOocrte6ngb91hos
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmB29JUFAwAAAAAACgkQlh/E3EQov+Cr
GhAAuLCiyPenZPdardgXYf2VzQrpIpHxdNsLhH4F2bnivkUNE1XfDzLmmmjbXRhDWB39LwN+E7EK
9DfsPU6oVeya+2X2vKswdZ7s7u5fN37COR1cB9CwvVGity15BE+ZnW++x4S4rvpVnXwOuHUS/AVG
NagNys03ZzDYrt6288SvXLAFfo7npcKQjivg0cntkqQz76As/SQF40wf0hpmz9U3CXFmYvfb1zss
zV3fhpjzxripqpiQehknIG6EdGX3gnb+8nz44xjIebRZgNn9yjRrlleS+7PrGX31/E0bO6sd29zy
c3QKbMP0n93l6Is3822dOt2X9BoD1NY71+g4x0ZFTKPCyaKoBJ5iOHoFVPRTN2riH9HOFaXqWCJW
oxNO8U/pOzYQ3cs7lu6NoQmObhYMn7Jax6Q9ZcGib6NbYtVebupW0LXL13tk/V1Fb4TkSfyBgq4f
UrgRjujrZaRblTM4D2NOEyapZcaR2MtQDp84oQnxftsgAfKRsc/zMKksMYQffVr4RLcR7LHfN5OC
BdaDVakXtR17AEB2ReJ6PQFarfmu0SWY/PCh9wvBWzlI82Ud4Whzb2g9hdEIIGBlahCA+1MQP1bw
oM6psKeAXO0ZHZpfIsC+oQtW30dNjkjoGSnH3LkFKJfzW0tmvkzZws+StPkjreOojikedd3hFwTP
ITA=
=Z/9q
-----END PGP SIGNATURE-----

--gt6u6FqjDqq6bDbgAyOocrte6ngb91hos--

--===============1596224965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1596224965==--
