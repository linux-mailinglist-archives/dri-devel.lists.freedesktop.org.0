Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7609E2D1355
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 15:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA436892F6;
	Mon,  7 Dec 2020 14:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFDC2892F6
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 14:16:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 786E4ABE9;
 Mon,  7 Dec 2020 14:16:41 +0000 (UTC)
Subject: Re: [PATCH v4 2/8] drm/vc4: Pass the atomic state to encoder hooks
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>
References: <20201207133948.2109194-1-maxime@cerno.tech>
 <20201207133948.2109194-3-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <69f099da-fa12-c370-2a9b-44b1d6afc6df@suse.de>
Date: Mon, 7 Dec 2020 15:16:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201207133948.2109194-3-maxime@cerno.tech>
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
Cc: linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: multipart/mixed; boundary="===============1013984896=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1013984896==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="WAdWvS0fIlflNyt3J5qm9de6sGo26sRS5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WAdWvS0fIlflNyt3J5qm9de6sGo26sRS5
Content-Type: multipart/mixed; boundary="CF3cepteECEoUoWsQ3Ox6m8BwbDHeTG77";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>
Cc: bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Message-ID: <69f099da-fa12-c370-2a9b-44b1d6afc6df@suse.de>
Subject: Re: [PATCH v4 2/8] drm/vc4: Pass the atomic state to encoder hooks
References: <20201207133948.2109194-1-maxime@cerno.tech>
 <20201207133948.2109194-3-maxime@cerno.tech>
In-Reply-To: <20201207133948.2109194-3-maxime@cerno.tech>

--CF3cepteECEoUoWsQ3Ox6m8BwbDHeTG77
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 07.12.20 um 14:39 schrieb Maxime Ripard:
> We'll need to access the connector state in our encoder setup, so let's=

> just pass the whole DRM state to our private encoder hooks.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

This becomes relevant in patch 5, I guess? If so

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/vc4/vc4_crtc.c | 18 ++++++++++--------
>   drivers/gpu/drm/vc4/vc4_drv.h  | 10 +++++-----
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 15 ++++++++++-----
>   3 files changed, 25 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_c=
rtc.c
> index e02e499885ed..a3439756594c 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -403,7 +403,9 @@ static void require_hvs_enabled(struct drm_device *=
dev)
>   		     SCALER_DISPCTRL_ENABLE);
>   }
>  =20
> -static int vc4_crtc_disable(struct drm_crtc *crtc, unsigned int channe=
l)
> +static int vc4_crtc_disable(struct drm_crtc *crtc,
> +			    struct drm_atomic_state *state,
> +			    unsigned int channel)
>   {
>   	struct drm_encoder *encoder =3D vc4_get_crtc_encoder(crtc);
>   	struct vc4_encoder *vc4_encoder =3D to_vc4_encoder(encoder);
> @@ -435,13 +437,13 @@ static int vc4_crtc_disable(struct drm_crtc *crtc=
, unsigned int channel)
>   	mdelay(20);
>  =20
>   	if (vc4_encoder && vc4_encoder->post_crtc_disable)
> -		vc4_encoder->post_crtc_disable(encoder);
> +		vc4_encoder->post_crtc_disable(encoder, state);
>  =20
>   	vc4_crtc_pixelvalve_reset(crtc);
>   	vc4_hvs_stop_channel(dev, channel);
>  =20
>   	if (vc4_encoder && vc4_encoder->post_crtc_powerdown)
> -		vc4_encoder->post_crtc_powerdown(encoder);
> +		vc4_encoder->post_crtc_powerdown(encoder, state);
>  =20
>   	return 0;
>   }
> @@ -468,7 +470,7 @@ int vc4_crtc_disable_at_boot(struct drm_crtc *crtc)=

>   	if (channel < 0)
>   		return 0;
>  =20
> -	return vc4_crtc_disable(crtc, channel);
> +	return vc4_crtc_disable(crtc, NULL, channel);
>   }
>  =20
>   static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
> @@ -484,7 +486,7 @@ static void vc4_crtc_atomic_disable(struct drm_crtc=
 *crtc,
>   	/* Disable vblank irq handling before crtc is disabled. */
>   	drm_crtc_vblank_off(crtc);
>  =20
> -	vc4_crtc_disable(crtc, old_vc4_state->assigned_channel);
> +	vc4_crtc_disable(crtc, state, old_vc4_state->assigned_channel);
>  =20
>   	/*
>   	 * Make sure we issue a vblank event after disabling the CRTC if
> @@ -518,14 +520,14 @@ static void vc4_crtc_atomic_enable(struct drm_crt=
c *crtc,
>   	vc4_hvs_atomic_enable(crtc, state);
>  =20
>   	if (vc4_encoder->pre_crtc_configure)
> -		vc4_encoder->pre_crtc_configure(encoder);
> +		vc4_encoder->pre_crtc_configure(encoder, state);
>  =20
>   	vc4_crtc_config_pv(crtc);
>  =20
>   	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_EN);
>  =20
>   	if (vc4_encoder->pre_crtc_enable)
> -		vc4_encoder->pre_crtc_enable(encoder);
> +		vc4_encoder->pre_crtc_enable(encoder, state);
>  =20
>   	/* When feeding the transposer block the pixelvalve is unneeded and
>   	 * should not be enabled.
> @@ -534,7 +536,7 @@ static void vc4_crtc_atomic_enable(struct drm_crtc =
*crtc,
>   		   CRTC_READ(PV_V_CONTROL) | PV_VCONTROL_VIDEN);
>  =20
>   	if (vc4_encoder->post_crtc_enable)
> -		vc4_encoder->post_crtc_enable(encoder);
> +		vc4_encoder->post_crtc_enable(encoder, state);
>   }
>  =20
>   static enum drm_mode_status vc4_crtc_mode_valid(struct drm_crtc *crtc=
,
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_dr=
v.h
> index c47c85533805..b404cd3ab0d8 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -444,12 +444,12 @@ struct vc4_encoder {
>   	enum vc4_encoder_type type;
>   	u32 clock_select;
>  =20
> -	void (*pre_crtc_configure)(struct drm_encoder *encoder);
> -	void (*pre_crtc_enable)(struct drm_encoder *encoder);
> -	void (*post_crtc_enable)(struct drm_encoder *encoder);
> +	void (*pre_crtc_configure)(struct drm_encoder *encoder, struct drm_at=
omic_state *state);
> +	void (*pre_crtc_enable)(struct drm_encoder *encoder, struct drm_atomi=
c_state *state);
> +	void (*post_crtc_enable)(struct drm_encoder *encoder, struct drm_atom=
ic_state *state);
>  =20
> -	void (*post_crtc_disable)(struct drm_encoder *encoder);
> -	void (*post_crtc_powerdown)(struct drm_encoder *encoder);
> +	void (*post_crtc_disable)(struct drm_encoder *encoder, struct drm_ato=
mic_state *state);
> +	void (*post_crtc_powerdown)(struct drm_encoder *encoder, struct drm_a=
tomic_state *state);
>   };
>  =20
>   static inline struct vc4_encoder *
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> index afc178b0d89f..5a608ed1d75e 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -357,7 +357,8 @@ static void vc4_hdmi_set_infoframes(struct drm_enco=
der *encoder)
>   		vc4_hdmi_set_audio_infoframe(encoder);
>   }
>  =20
> -static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *enc=
oder)
> +static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *enc=
oder,
> +					       struct drm_atomic_state *state)
>   {
>   	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
>  =20
> @@ -370,7 +371,8 @@ static void vc4_hdmi_encoder_post_crtc_disable(stru=
ct drm_encoder *encoder)
>   		   HDMI_READ(HDMI_VID_CTL) | VC4_HD_VID_CTL_BLANKPIX);
>   }
>  =20
> -static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *e=
ncoder)
> +static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *e=
ncoder,
> +						 struct drm_atomic_state *state)
>   {
>   	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
>   	int ret;
> @@ -584,7 +586,8 @@ static void vc4_hdmi_recenter_fifo(struct vc4_hdmi =
*vc4_hdmi)
>   		  "VC4_HDMI_FIFO_CTL_RECENTER_DONE");
>   }
>  =20
> -static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *en=
coder)
> +static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *en=
coder,
> +						struct drm_atomic_state *state)
>   {
>   	struct drm_display_mode *mode =3D &encoder->crtc->state->adjusted_mo=
de;
>   	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
> @@ -676,7 +679,8 @@ static void vc4_hdmi_encoder_pre_crtc_configure(str=
uct drm_encoder *encoder)
>   		vc4_hdmi->variant->set_timings(vc4_hdmi, mode);
>   }
>  =20
> -static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encod=
er)
> +static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encod=
er,
> +					     struct drm_atomic_state *state)
>   {
>   	struct drm_display_mode *mode =3D &encoder->crtc->state->adjusted_mo=
de;
>   	struct vc4_hdmi_encoder *vc4_encoder =3D to_vc4_hdmi_encoder(encoder=
);
> @@ -698,7 +702,8 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct=
 drm_encoder *encoder)
>   	HDMI_WRITE(HDMI_FIFO_CTL, VC4_HDMI_FIFO_CTL_MASTER_SLAVE_N);
>   }
>  =20
> -static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *enco=
der)
> +static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *enco=
der,
> +					      struct drm_atomic_state *state)
>   {
>   	struct drm_display_mode *mode =3D &encoder->crtc->state->adjusted_mo=
de;
>   	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--CF3cepteECEoUoWsQ3Ox6m8BwbDHeTG77--

--WAdWvS0fIlflNyt3J5qm9de6sGo26sRS5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/OOUgFAwAAAAAACgkQlh/E3EQov+DP
ZA/9H5k45adMvHYwZ0McD+quV4dFRQU9Qbwl0BQSVGLjjWxcp1BaS4oWy8peBrG1Qnu0Hgsb8AXr
e4e1MJOPaLHUlOuq29+KjbPw86joUVzGxt0UhFiqJ5k6Uqb3npEyUKty7wRnxSAodSUf81KsE6gN
6J7t029W4ioGBFUZJxMz0K8R8UeEewSdoWYTA0kyzT3rntkba6yGDm0/bpVghx8L6YDtSsNd1D9m
oXuUq7/ETf5f2ElyDyDJknQQib4Lt2Q/g6hx7g/KCOYdm8TrRZqjANMyvdWjtGEgrBMaQJF9PL5V
KL7H+6CyRDnJuo37B2nwHmDaG12lOe2A8pzk6KT95BjaxDZYo02y6ycs8GmXBbXhWcjYm/rlM7K9
V6+kCMGoCSxMb4/isl2rHbYV5xUF9lfCuafCv0AePYXAzrbT9ZaahOmJ8ErJSRQyz//35JAB3zDm
gBb1ZZf/6oRXv1mA9YuNOvrZiuhaPC+azU+ofXJZp0r6lk9ALuxzjVVlPC4RiBN1titj81yy6aKg
1f6IuMCBNXZHcWwetfELik5phwotxVOE8d1ic15UsXUj+4aWh3vHxesPUZDA2LprMEQrd7liZ/Sf
VNu0wJEkZe3r7/vr2cffHSi1esScJpEP4X4enCdJ8asCw5QiUuGAlJk5SnuswgqUlcOJEfipLpNI
uLY=
=ssN9
-----END PGP SIGNATURE-----

--WAdWvS0fIlflNyt3J5qm9de6sGo26sRS5--

--===============1013984896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1013984896==--
