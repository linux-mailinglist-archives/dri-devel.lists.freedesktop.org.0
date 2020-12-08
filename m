Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1752D2506
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 08:55:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215016E06E;
	Tue,  8 Dec 2020 07:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658D96E06E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 07:55:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 002FFAB63;
 Tue,  8 Dec 2020 07:55:25 +0000 (UTC)
Subject: Re: [PATCH v5 6/9] drm/vc4: hdmi: Store pixel frequency in the
 connector state
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20201207155719.17149-1-maxime@cerno.tech>
 <20201207155719.17149-7-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <b60ffb0e-9979-aad1-50e7-4d68fdc0a915@suse.de>
Date: Tue, 8 Dec 2020 08:55:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201207155719.17149-7-maxime@cerno.tech>
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
Cc: linux-rpi-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: multipart/mixed; boundary="===============1083487399=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1083487399==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="PsXHK89KT8MBiy17Vukk9CfwczsgHJYzt"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PsXHK89KT8MBiy17Vukk9CfwczsgHJYzt
Content-Type: multipart/mixed; boundary="AkmXZ4e6NUgz1bxNkvTKAEKrVeqflhd9A";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Message-ID: <b60ffb0e-9979-aad1-50e7-4d68fdc0a915@suse.de>
Subject: Re: [PATCH v5 6/9] drm/vc4: hdmi: Store pixel frequency in the
 connector state
References: <20201207155719.17149-1-maxime@cerno.tech>
 <20201207155719.17149-7-maxime@cerno.tech>
In-Reply-To: <20201207155719.17149-7-maxime@cerno.tech>

--AkmXZ4e6NUgz1bxNkvTKAEKrVeqflhd9A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 07.12.20 um 16:57 schrieb Maxime Ripard:
> The pixel rate is for now quite simple to compute, but with more featur=
es
> (30 and 36 bits output, YUV output, etc.) will depend on a bunch of
> connectors properties.
>=20
> Let's store the rate we have to run the pixel clock at in our custom
> connector state, and compute it in atomic_check.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 26 +++++++++++++++++++++++++-
>   drivers/gpu/drm/vc4/vc4_hdmi.h |  1 +
>   2 files changed, 26 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> index 744396c8dcb9..83699105c7a5 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -194,6 +194,7 @@ vc4_hdmi_connector_duplicate_state(struct drm_conne=
ctor *connector)
>   	if (!new_state)
>   		return NULL;
>  =20
> +	new_state->pixel_rate =3D vc4_state->pixel_rate;
>   	__drm_atomic_helper_connector_duplicate_state(connector, &new_state-=
>base);
>  =20
>   	return &new_state->base;
> @@ -611,9 +612,29 @@ static void vc4_hdmi_recenter_fifo(struct vc4_hdmi=
 *vc4_hdmi)
>   		  "VC4_HDMI_FIFO_CTL_RECENTER_DONE");
>   }
>  =20
> +static struct drm_connector_state *
> +vc4_hdmi_encoder_get_connector_state(struct drm_encoder *encoder,
> +				     struct drm_atomic_state *state)
> +{
> +	struct drm_connector_state *conn_state;
> +	struct drm_connector *connector;
> +	unsigned int i;
> +
> +	for_each_new_connector_in_state(state, connector, conn_state, i) {
> +		if (conn_state->best_encoder =3D=3D encoder)
> +			return conn_state;
> +	}
> +
> +	return NULL;
> +}
> +
>   static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *e=
ncoder,
>   						struct drm_atomic_state *state)
>   {
> +	struct drm_connector_state *conn_state =3D
> +		vc4_hdmi_encoder_get_connector_state(encoder, state);
> +	struct vc4_hdmi_connector_state *vc4_conn_state =3D
> +		conn_state_to_vc4_hdmi_conn_state(conn_state);
>   	struct drm_display_mode *mode =3D &encoder->crtc->state->adjusted_mo=
de;
>   	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
>   	unsigned long pixel_rate, hsm_rate;
> @@ -625,7 +646,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(str=
uct drm_encoder *encoder,
>   		return;
>   	}
>  =20
> -	pixel_rate =3D mode->clock * 1000 * ((mode->flags & DRM_MODE_FLAG_DBL=
CLK) ? 2 : 1);
> +	pixel_rate =3D vc4_conn_state->pixel_rate;
>   	ret =3D clk_set_rate(vc4_hdmi->pixel_clock, pixel_rate);
>   	if (ret) {
>   		DRM_ERROR("Failed to set pixel clock rate: %d\n", ret);
> @@ -797,6 +818,7 @@ static int vc4_hdmi_encoder_atomic_check(struct drm=
_encoder *encoder,
>   					 struct drm_crtc_state *crtc_state,
>   					 struct drm_connector_state *conn_state)
>   {
> +	struct vc4_hdmi_connector_state *vc4_state =3D conn_state_to_vc4_hdmi=
_conn_state(conn_state);
>   	struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
>   	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
>   	unsigned long long pixel_rate =3D mode->clock * 1000;
> @@ -827,6 +849,8 @@ static int vc4_hdmi_encoder_atomic_check(struct drm=
_encoder *encoder,
>   	if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
>   		return -EINVAL;
>  =20
> +	vc4_state->pixel_rate =3D pixel_rate;
> +
>   	return 0;
>   }
>  =20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_h=
dmi.h
> index 2cf5362052e2..bca6943de884 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -182,6 +182,7 @@ encoder_to_vc4_hdmi(struct drm_encoder *encoder)
>  =20
>   struct vc4_hdmi_connector_state {
>   	struct drm_connector_state	base;
> +	unsigned long long		pixel_rate;
>   };
>  =20
>   static inline struct vc4_hdmi_connector_state *
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--AkmXZ4e6NUgz1bxNkvTKAEKrVeqflhd9A--

--PsXHK89KT8MBiy17Vukk9CfwczsgHJYzt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/PMWwFAwAAAAAACgkQlh/E3EQov+BJ
SQ//U+C+z8CfP5Pca5Oz7429W7x16HWdFwJQb2pDofsum40de+XBsoTZQAKKC3Hs/3L5RWgEoINN
PV927HwQeXgz99DYN5u6++VkOvUvSag4JQ2PauEBBnZWND1BRyjSLFi8lOSs36eV5WwvdumLu1uo
K48pFVC+neQV2J+KYtg0XFkZuPB2LZ/MDsGR14ovjFoh8OZlyHTQDux034VxWLoUu9PFUPQgnw2s
wmTTaFjFCahq5EHUS9V17b7NnL8HIRdNib3nMuFXV2tSVbPfY53jXoAdXxDBUed6eoQVuKQbUIKu
aLpYF1Bq5X86nMh4DlAK5UNxaqF7ql7BL3QmXM+2QlnQ2K10V3oMukklyxcJdWb1bKJ8XpU+98UA
w4UeNx7ae1e+3aWmPvBtXrrxy7SyDjhCCruNi907M+2tI5ylsT6fmVqPozDCT+9y0XrqfdkL6JIk
LEeBOrf0vH6bY/aVl/2hCMsvGZ+LRfUa67KULnCgWVoNfT82YdHcJS+HVkbXtBPSzQSGEt7RKGzb
nA92kxAY7gk8ZS/E5Ydb99IGeXyqk/Vq9jW6smwNej2BTG7SrT5iX/AGlpRVrn/3uPI3haap8IPE
6nlFK5+NtHEeWJ5NnVAk5tiiLwAuH/v9ixkPIKDhvWs7K9lvdmw3LS4AQDbtWgqNDtGwlnjVQMZl
7jk=
=nVxt
-----END PGP SIGNATURE-----

--PsXHK89KT8MBiy17Vukk9CfwczsgHJYzt--

--===============1083487399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1083487399==--
