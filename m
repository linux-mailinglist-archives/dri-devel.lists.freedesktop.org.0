Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7806D2CA584
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 15:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF3C6E546;
	Tue,  1 Dec 2020 14:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF9F6E546
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 14:25:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B5760AC2D;
 Tue,  1 Dec 2020 14:25:23 +0000 (UTC)
Subject: Re: [PATCH v3 1/7] drm/vc4: hvs: Align the HVS atomic hooks to the
 new API
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Eric Anholt <eric@anholt.net>
References: <20201201131249.438273-1-maxime@cerno.tech>
 <20201201131249.438273-2-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <4ae718e9-f6dd-9dd5-7106-7b63adbb37f8@suse.de>
Date: Tue, 1 Dec 2020 15:25:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201201131249.438273-2-maxime@cerno.tech>
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
Content-Type: multipart/mixed; boundary="===============0925612270=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0925612270==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="oiYXwWuuVFADKmqwP2XTT6VYQanUmu1Y4"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oiYXwWuuVFADKmqwP2XTT6VYQanUmu1Y4
Content-Type: multipart/mixed; boundary="DtJn5ETTDnld5Dhi1FNPKvPcdeRzaEM0z";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Eric Anholt <eric@anholt.net>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-rpi-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com
Message-ID: <4ae718e9-f6dd-9dd5-7106-7b63adbb37f8@suse.de>
Subject: Re: [PATCH v3 1/7] drm/vc4: hvs: Align the HVS atomic hooks to the
 new API
References: <20201201131249.438273-1-maxime@cerno.tech>
 <20201201131249.438273-2-maxime@cerno.tech>
In-Reply-To: <20201201131249.438273-2-maxime@cerno.tech>

--DtJn5ETTDnld5Dhi1FNPKvPcdeRzaEM0z
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 01.12.20 um 14:12 schrieb Maxime Ripard:
> Since the CRTC setup in vc4 is split between the PixelValves/TXP and th=
e
> HVS, only the PV/TXP atomic hooks were updated in the previous commits,=
 but
> it makes sense to update the HVS ones too.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Looks correct.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/vc4/vc4_crtc.c | 4 +---
>   drivers/gpu/drm/vc4/vc4_drv.h  | 4 ++--
>   drivers/gpu/drm/vc4/vc4_hvs.c  | 8 +++++---
>   drivers/gpu/drm/vc4/vc4_txp.c  | 8 ++------
>   4 files changed, 10 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_c=
rtc.c
> index 06088854c647..e02e499885ed 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -503,8 +503,6 @@ static void vc4_crtc_atomic_disable(struct drm_crtc=
 *crtc,
>   static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
>   				   struct drm_atomic_state *state)
>   {
> -	struct drm_crtc_state *old_state =3D drm_atomic_get_old_crtc_state(st=
ate,
> -									 crtc);
>   	struct drm_device *dev =3D crtc->dev;
>   	struct vc4_crtc *vc4_crtc =3D to_vc4_crtc(crtc);
>   	struct drm_encoder *encoder =3D vc4_get_crtc_encoder(crtc);
> @@ -517,7 +515,7 @@ static void vc4_crtc_atomic_enable(struct drm_crtc =
*crtc,
>   	 */
>   	drm_crtc_vblank_on(crtc);
>  =20
> -	vc4_hvs_atomic_enable(crtc, old_state);
> +	vc4_hvs_atomic_enable(crtc, state);
>  =20
>   	if (vc4_encoder->pre_crtc_configure)
>   		vc4_encoder->pre_crtc_configure(encoder);
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_dr=
v.h
> index c5f2944d5bc6..c47c85533805 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -918,8 +918,8 @@ extern struct platform_driver vc4_hvs_driver;
>   void vc4_hvs_stop_channel(struct drm_device *dev, unsigned int output=
);
>   int vc4_hvs_get_fifo_from_output(struct drm_device *dev, unsigned int=
 output);
>   int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_crtc_state=
 *state);
> -void vc4_hvs_atomic_enable(struct drm_crtc *crtc, struct drm_crtc_stat=
e *old_state);
> -void vc4_hvs_atomic_disable(struct drm_crtc *crtc, struct drm_crtc_sta=
te *old_state);
> +void vc4_hvs_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_st=
ate *state);
> +void vc4_hvs_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_s=
tate *state);
>   void vc4_hvs_atomic_flush(struct drm_crtc *crtc, struct drm_crtc_stat=
e *state);
>   void vc4_hvs_dump_state(struct drm_device *dev);
>   void vc4_hvs_unmask_underrun(struct drm_device *dev, int channel);
> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hv=
s.c
> index b72b2bd05a81..04396dec63fc 100644
> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> @@ -391,11 +391,12 @@ static void vc4_hvs_update_dlist(struct drm_crtc =
*crtc)
>   }
>  =20
>   void vc4_hvs_atomic_enable(struct drm_crtc *crtc,
> -			   struct drm_crtc_state *old_state)
> +			   struct drm_atomic_state *state)
>   {
>   	struct drm_device *dev =3D crtc->dev;
>   	struct vc4_dev *vc4 =3D to_vc4_dev(dev);
> -	struct vc4_crtc_state *vc4_state =3D to_vc4_crtc_state(crtc->state);
> +	struct drm_crtc_state *new_crtc_state =3D drm_atomic_get_new_crtc_sta=
te(state, crtc);
> +	struct vc4_crtc_state *vc4_state =3D to_vc4_crtc_state(new_crtc_state=
);
>   	struct drm_display_mode *mode =3D &crtc->state->adjusted_mode;
>   	bool oneshot =3D vc4_state->feed_txp;
>  =20
> @@ -404,9 +405,10 @@ void vc4_hvs_atomic_enable(struct drm_crtc *crtc,
>   }
>  =20
>   void vc4_hvs_atomic_disable(struct drm_crtc *crtc,
> -			    struct drm_crtc_state *old_state)
> +			    struct drm_atomic_state *state)
>   {
>   	struct drm_device *dev =3D crtc->dev;
> +	struct drm_crtc_state *old_state =3D drm_atomic_get_old_crtc_state(st=
ate, crtc);
>   	struct vc4_crtc_state *vc4_state =3D to_vc4_crtc_state(old_state);
>   	unsigned int chan =3D vc4_state->assigned_channel;
>  =20
> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_tx=
p.c
> index 34612edcabbd..4a26750b5e93 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -406,23 +406,19 @@ static int vc4_txp_atomic_check(struct drm_crtc *=
crtc,
>   static void vc4_txp_atomic_enable(struct drm_crtc *crtc,
>   				  struct drm_atomic_state *state)
>   {
> -	struct drm_crtc_state *old_state =3D drm_atomic_get_old_crtc_state(st=
ate,
> -									 crtc);
>   	drm_crtc_vblank_on(crtc);
> -	vc4_hvs_atomic_enable(crtc, old_state);
> +	vc4_hvs_atomic_enable(crtc, state);
>   }
>  =20
>   static void vc4_txp_atomic_disable(struct drm_crtc *crtc,
>   				   struct drm_atomic_state *state)
>   {
> -	struct drm_crtc_state *old_state =3D drm_atomic_get_old_crtc_state(st=
ate,
> -									 crtc);
>   	struct drm_device *dev =3D crtc->dev;
>  =20
>   	/* Disable vblank irq handling before crtc is disabled. */
>   	drm_crtc_vblank_off(crtc);
>  =20
> -	vc4_hvs_atomic_disable(crtc, old_state);
> +	vc4_hvs_atomic_disable(crtc, state);
>  =20
>   	/*
>   	 * Make sure we issue a vblank event after disabling the CRTC if
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--DtJn5ETTDnld5Dhi1FNPKvPcdeRzaEM0z--

--oiYXwWuuVFADKmqwP2XTT6VYQanUmu1Y4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/GUlIFAwAAAAAACgkQlh/E3EQov+B3
Gw/9FaLjdZLN88cfkKlGHacf9fAkatTsnKO8uMW/cQLUTX86Z5XYig/ePyFJ+UfKE/l32T1tq4Fy
krIofWux9MDhNiR7ncCDb8Rh/y7llOc0adQ2MVRGj7Dhb6+GMmZ5Na0At6Elzv0BZA+1Dji3xGui
xreRTR86fgxb5+73V6xmfnAH2/Ef+4KnT9P+dtnYIkPS9F1vXx362qe8w70CYF9HMLr3z2Y1EVsf
NxnFRnU6BPY/5Lc5SnZOcKhpJX+P1wCiZsAM5v5bq4gqLr9AUqOS2BPjaQihm8GYYtuSJsKqre/X
xI7WtmQ2aqKvGc4pBZNHJngzt3lROCtpsuwlsmKckz89z02BA/cMvCOrcl4ef+SLppLJiIGD7ufz
52EM2ChgIrCI09wvQHFs/K3oTcW6CLDRc2//pKXLKk4e7fN3RF6c/AuN83T1zP7PMHUqCim4WE0x
7x715YQZ1UsU7oU/BdL9lcHe3VoZ9Fj0bHwJ/U7xVUEoYThRsG0eoIukRSKBDa/VWFxLC6p52nJ5
HW1xhjXemkGNUS+iUG05Jm/ytBfoWLfOrQYCdpjlmF/J8Udp56/pwuSTy/vC1aYuCBM9h1oQ1An9
0uWzb3I2UlJKwR1SysaidDiXtwFhfudjh79X8kdK0lcclZIozveGrJr8d4iyVgXVWCpRbt3Ccjy2
ka8=
=7tkJ
-----END PGP SIGNATURE-----

--oiYXwWuuVFADKmqwP2XTT6VYQanUmu1Y4--

--===============0925612270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0925612270==--
