Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 537AF35C1C0
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 11:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8534A6E198;
	Mon, 12 Apr 2021 09:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB736E198
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 09:45:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 47E9BAF11;
 Mon, 12 Apr 2021 09:45:52 +0000 (UTC)
Subject: Re: [PATCH 08/18] drm/vc4: hdmi: Use full range helper in csc
 functions
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-9-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <5f9d0f36-e5c7-45cc-5de8-d08a4cbc229d@suse.de>
Date: Mon, 12 Apr 2021 11:45:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210317154352.732095-9-maxime@cerno.tech>
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
Content-Type: multipart/mixed; boundary="===============1183089487=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1183089487==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="QQwlkOXiUv70iu7Hji4s2gM5ZE2A7YtHN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QQwlkOXiUv70iu7Hji4s2gM5ZE2A7YtHN
Content-Type: multipart/mixed; boundary="gMHh5ZKyQVzLbNjOKNXf6yB1xdv4ZbL76";
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
Message-ID: <5f9d0f36-e5c7-45cc-5de8-d08a4cbc229d@suse.de>
Subject: Re: [PATCH 08/18] drm/vc4: hdmi: Use full range helper in csc
 functions
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-9-maxime@cerno.tech>
In-Reply-To: <20210317154352.732095-9-maxime@cerno.tech>

--gMHh5ZKyQVzLbNjOKNXf6yB1xdv4ZbL76
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 17.03.21 um 16:43 schrieb Maxime Ripard:
> The CSC callbacks takes a boolean as an argument to tell whether we're
> using the full range or limited range RGB.
>=20
> However, with the upcoming YUV support, the logic will be a bit more
> complex. In order to address this, let's make the callbacks take the
> entire mode, and call our new helper to tell whether the full or limite=
d
> range RGB should be used.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 14 ++++++++------
>   drivers/gpu/drm/vc4/vc4_hdmi.h |  3 ++-
>   2 files changed, 10 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> index fc545072b173..bb2fffa2d495 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -494,14 +494,15 @@ static void vc4_hdmi_encoder_disable(struct drm_e=
ncoder *encoder)
>   {
>   }
>  =20
> -static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)=

> +static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
> +			       const struct drm_display_mode *mode)
>   {
>   	u32 csc_ctl;
>  =20
>   	csc_ctl =3D VC4_SET_FIELD(VC4_HD_CSC_CTL_ORDER_BGR,
>   				VC4_HD_CSC_CTL_ORDER);
>  =20
> -	if (enable) {
> +	if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
>   		/* CEA VICs other than #1 requre limited range RGB
>   		 * output unless overridden by an AVI infoframe.
>   		 * Apply a colorspace conversion to squash 0-255 down
> @@ -529,13 +530,14 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *v=
c4_hdmi, bool enable)
>   	HDMI_WRITE(HDMI_CSC_CTL, csc_ctl);
>   }
>  =20
> -static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)=

> +static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
> +			       const struct drm_display_mode *mode)
>   {
>   	u32 csc_ctl;
>  =20
>   	csc_ctl =3D 0x07;	/* RGB_CONVERT_MODE =3D custom matrix, || USE_RGB_=
TO_YCBCR */
>  =20
> -	if (enable) {
> +	if (vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
>   		/* CEA VICs other than #1 requre limited range RGB
>   		 * output unless overridden by an AVI infoframe.
>   		 * Apply a colorspace conversion to squash 0-255 down
> @@ -844,12 +846,12 @@ static void vc4_hdmi_encoder_pre_crtc_enable(stru=
ct drm_encoder *encoder,
>  =20
>   	if (vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode) {
>   		if (vc4_hdmi->variant->csc_setup)
> -			vc4_hdmi->variant->csc_setup(vc4_hdmi, true);
> +			vc4_hdmi->variant->csc_setup(vc4_hdmi, mode);
>  =20
>   		vc4_encoder->limited_rgb_range =3D true;
>   	} else {
>   		if (vc4_hdmi->variant->csc_setup)
> -			vc4_hdmi->variant->csc_setup(vc4_hdmi, false);
> +			vc4_hdmi->variant->csc_setup(vc4_hdmi, mode);
>  =20
>   		vc4_encoder->limited_rgb_range =3D false;
>   	}
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_h=
dmi.h
> index 3cebd1fd00fc..3d88261d463e 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -77,7 +77,8 @@ struct vc4_hdmi_variant {
>   	void (*reset)(struct vc4_hdmi *vc4_hdmi);
>  =20
>   	/* Callback to enable / disable the CSC */
> -	void (*csc_setup)(struct vc4_hdmi *vc4_hdmi, bool enable);
> +	void (*csc_setup)(struct vc4_hdmi *vc4_hdmi,
> +			  const struct drm_display_mode *mode);
>  =20
>   	/* Callback to configure the video timings in the HDMI block */
>   	void (*set_timings)(struct vc4_hdmi *vc4_hdmi,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--gMHh5ZKyQVzLbNjOKNXf6yB1xdv4ZbL76--

--QQwlkOXiUv70iu7Hji4s2gM5ZE2A7YtHN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmB0Fs0FAwAAAAAACgkQlh/E3EQov+C1
RhAAq4OK4ScqKLDGhySLM3UMi1hwevg+kVhWsD36faExHf1qktnle+AGFzAYkLbS/zyoU343OjGf
aM8OmE21X0tRxIdJEWWEr198b6H6y+sIqSLiDl2IH/kGtniU0ug28iNzhgf0ZIrqUMEEcXA1o2NK
WlWt10fu2xTBXdizCQu9V42Q5zDjWMZ0jsqtUhQtsugxBYj4R3sPi/Rrn1PqJMnSdxpftTxNqX2Q
0JPnpRl0cPfiVcO67nD0Jh/fgISKo8JDdxkk5AvYWkctbQIS6agUKpQi5RMyHZOuhNCB9iezkJ37
r4RGBlFl6Sw1gpZ95J+icuuiXX4npSeRLMnNXCRbhHcR57gZw7uSFYrPW4E+QDgrsm+R948X40/2
AcgCJ17Xwdf1zIluvJ/iQnWcswV/gvfMnC7ZsQ3XoC0kB9X+TRJ++qC6744TZVCTy+h+iDoEFkFp
g41WkGpqJqe4xilPYMCZjKHuXj0RuWFWQv5AVCfi4jtgXot8wfXdDkUcadDxsPLyOh5pNVdLWMNA
1WjzlABT0U5Qdf9Z5R0WNv+100ExBbzihe14WNrk+co7KwzGDPvsh56homOrhkcxJttG9PUZLp6d
qlBaMY/rVk7aIo4MnWcBolSN9pAOQfnG/OI14SQNkDpYpm91TQ4WeCF9xdvLCtbw5oW1eDvT7PrT
2C4=
=LtrJ
-----END PGP SIGNATURE-----

--QQwlkOXiUv70iu7Hji4s2gM5ZE2A7YtHN--

--===============1183089487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1183089487==--
