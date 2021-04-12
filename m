Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9383035C396
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 12:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8574E89DA2;
	Mon, 12 Apr 2021 10:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1A889DA2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 10:19:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BD768B167;
 Mon, 12 Apr 2021 10:19:13 +0000 (UTC)
Subject: Re: [PATCH 09/18] drm/vc4: hdmi: Remove limited_rgb_range
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-10-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <372888ab-e24f-e30d-b729-8d92cd398b35@suse.de>
Date: Mon, 12 Apr 2021 12:19:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210317154352.732095-10-maxime@cerno.tech>
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
Content-Type: multipart/mixed; boundary="===============1285934501=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1285934501==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="E8okpJhjXYe4KBMkwGNikZc6dCzyYwYUJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--E8okpJhjXYe4KBMkwGNikZc6dCzyYwYUJ
Content-Type: multipart/mixed; boundary="eo2x8Dn3GZQtqJ0FXLNU2N6NF2gFgZUe8";
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
Message-ID: <372888ab-e24f-e30d-b729-8d92cd398b35@suse.de>
Subject: Re: [PATCH 09/18] drm/vc4: hdmi: Remove limited_rgb_range
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-10-maxime@cerno.tech>
In-Reply-To: <20210317154352.732095-10-maxime@cerno.tech>

--eo2x8Dn3GZQtqJ0FXLNU2N6NF2gFgZUe8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 17.03.21 um 16:43 schrieb Maxime Ripard:
> The limited_rgb_range field in the vc4_hdmi_encoder structure is used t=
o
> tell whether we're supposed to output with a full or limited RGB range.=

>=20
> This is redundant with the new helper we introduced, so let's convert t=
o
> that helper and drop that field.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 21 +++++----------------
>   drivers/gpu/drm/vc4/vc4_hdmi.h |  1 -
>   2 files changed, 5 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> index bb2fffa2d495..8f0af246f18f 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -384,7 +384,6 @@ static void vc4_hdmi_write_infoframe(struct drm_enc=
oder *encoder,
>   static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
>   {
>   	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
> -	struct vc4_hdmi_encoder *vc4_encoder =3D to_vc4_hdmi_encoder(encoder)=
;
>   	struct drm_connector *connector =3D &vc4_hdmi->connector;
>   	struct drm_connector_state *cstate =3D connector->state;
>   	struct drm_crtc *crtc =3D encoder->crtc;
> @@ -401,9 +400,9 @@ static void vc4_hdmi_set_avi_infoframe(struct drm_e=
ncoder *encoder)
>  =20
>   	drm_hdmi_avi_infoframe_quant_range(&frame.avi,
>   					   connector, mode,
> -					   vc4_encoder->limited_rgb_range ?
> -					   HDMI_QUANTIZATION_RANGE_LIMITED :
> -					   HDMI_QUANTIZATION_RANGE_FULL);
> +					   vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode) ?
> +					   HDMI_QUANTIZATION_RANGE_FULL :
> +					   HDMI_QUANTIZATION_RANGE_LIMITED);
>  =20
>   	drm_hdmi_avi_infoframe_bars(&frame.avi, cstate);
>  =20
> @@ -841,20 +840,10 @@ static void vc4_hdmi_encoder_pre_crtc_enable(stru=
ct drm_encoder *encoder,
>   					     struct drm_atomic_state *state)
>   {
>   	struct drm_display_mode *mode =3D &encoder->crtc->state->adjusted_mo=
de;
> -	struct vc4_hdmi_encoder *vc4_encoder =3D to_vc4_hdmi_encoder(encoder)=
;
>   	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
>  =20
> -	if (vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode) {
> -		if (vc4_hdmi->variant->csc_setup)
> -			vc4_hdmi->variant->csc_setup(vc4_hdmi, mode);
> -
> -		vc4_encoder->limited_rgb_range =3D true;
> -	} else {
> -		if (vc4_hdmi->variant->csc_setup)
> -			vc4_hdmi->variant->csc_setup(vc4_hdmi, mode);
> -
> -		vc4_encoder->limited_rgb_range =3D false;
> -	}
> +	if (vc4_hdmi->variant->csc_setup)
> +		vc4_hdmi->variant->csc_setup(vc4_hdmi, mode);
>  =20
>   	HDMI_WRITE(HDMI_FIFO_CTL, VC4_HDMI_FIFO_CTL_MASTER_SLAVE_N);
>   }
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_h=
dmi.h
> index 3d88261d463e..8e42f9e7b3e2 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -12,7 +12,6 @@
>   struct vc4_hdmi_encoder {
>   	struct vc4_encoder base;
>   	bool hdmi_monitor;
> -	bool limited_rgb_range;
>   };
>  =20
>   static inline struct vc4_hdmi_encoder *
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--eo2x8Dn3GZQtqJ0FXLNU2N6NF2gFgZUe8--

--E8okpJhjXYe4KBMkwGNikZc6dCzyYwYUJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmB0HqAFAwAAAAAACgkQlh/E3EQov+DQ
iRAAgksqeaFr10XNO1TNdHK7/4MT/kt8bU8S+snUWRTmFj267/Lz+Oypw4lpjz8r50VNUfneuhwn
H9Zl84i58euL6nOacX8LmzXkFXxRJIu2XJMO5sJklV9IX5+SYN0aCRBHv5titTErQptjYAnj2Y7e
VKDaETDhv6Ct+/8gNT62RiDYdqTf4NLwyj17NeODrAgSq9WJY/D/A4aW5j2xKmjzRnd+PRyHhoaq
pEl3R7cRRriD1H/GAGXgMC54bDjkVxctiOBQsRGp+6cTJgoHIK72K/SEwR9uHEJDUuPIqj5aZ3j0
k6Xcn/bZT1CtQyWV+/MfEFbYyXR3XHZHFDOCCoPvgjlbGYkT+vEJcHEUtvez8a6mNkcrhEsUlvwb
+OlPAhH8BzsJryE87jCMFIdty3kYTgSsUyaaF10U/ZDxsqyF4uJ+Kj6xwbbfX/R/gQRfSWsoYJ3x
t5r5YIWhtqcFc8oEiDxa/d8dFfQdglljBs3sRpsBbYmYpGc/Kf1uRsAGZTVZEv1xGECqro39DNdy
1QT8EBGdAPFdkW1HgTGi10QLsnl12rC0vVfeNHcBurgvm7/SWQa3dFEHHvvWt77o0QdxA31BZjqB
itoOWgzdpm5AL3Kn09AdGuA9miUTu5QCdzAa2TyMxiQOCXTwFy4PMoZ6WXu0kaW7Ft3rk4FyaDqy
u5s=
=YQ2A
-----END PGP SIGNATURE-----

--E8okpJhjXYe4KBMkwGNikZc6dCzyYwYUJ--

--===============1285934501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1285934501==--
