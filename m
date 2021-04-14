Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE73435F576
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 15:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8C06E82C;
	Wed, 14 Apr 2021 13:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6F56E82C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 13:54:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 480CEAF26;
 Wed, 14 Apr 2021 13:54:51 +0000 (UTC)
Subject: Re: [PATCH 13/18] drm/vc4: hdmi: Define colorspace matrices
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-14-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <03265daa-4e19-3d35-6a5e-2bb9271860e4@suse.de>
Date: Wed, 14 Apr 2021 15:54:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210317154352.732095-14-maxime@cerno.tech>
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
Content-Type: multipart/mixed; boundary="===============1255618810=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1255618810==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0KuPdmQ2xYZLBNHEpiP3jW7YE6zU4Fakp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0KuPdmQ2xYZLBNHEpiP3jW7YE6zU4Fakp
Content-Type: multipart/mixed; boundary="86IFqNplhZmWTkVc6beRVry7B2ZqFwCt4";
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
Message-ID: <03265daa-4e19-3d35-6a5e-2bb9271860e4@suse.de>
Subject: Re: [PATCH 13/18] drm/vc4: hdmi: Define colorspace matrices
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-14-maxime@cerno.tech>
In-Reply-To: <20210317154352.732095-14-maxime@cerno.tech>

--86IFqNplhZmWTkVc6beRVry7B2ZqFwCt4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 17.03.21 um 16:43 schrieb Maxime Ripard:
> The current CSC setup code for the BCM2711 uses a sequence of register
> writes to configure the CSC depending on whether we output using a full=

> or limited range.
>=20
> However, with the upcoming introduction of the YUV output, we're going
> to add new matrices to perform the conversions, so we should switch to
> something a bit more flexible that takes the matrix as an argument and
> programs the CSC accordingly.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 77 +++++++++++++++++++++------------=
-
>   1 file changed, 48 insertions(+), 29 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> index b0e0cb533944..9614de7303b8 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -525,6 +525,50 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc=
4_hdmi,
>   	HDMI_WRITE(HDMI_CSC_CTL, csc_ctl);
>   }
>  =20
> +
> +/*
> + * If we need to output Full Range RGB, then use the unity matrix
> + *
> + * [ 1      0      0      0]
> + * [ 0      1      0      0]
> + * [ 0      0      1      0]
> + *
> + * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
> + */
> +static const u16 vc5_hdmi_csc_full_rgb_unity[3][4] =3D {
> +	{ 0x2000, 0x0000, 0x0000, 0x0000 },
> +	{ 0x0000, 0x2000, 0x0000, 0x0000 },
> +	{ 0x0000, 0x0000, 0x2000, 0x0000 },
> +};
> +
> +/*
> + * CEA VICs other than #1 require limited range RGB output unless
> + * overridden by an AVI infoframe. Apply a colorspace conversion to
> + * squash 0-255 down to 16-235. The matrix here is:
> + *
> + * [ 0.8594 0      0      16]
> + * [ 0      0.8594 0      16]
> + * [ 0      0      0.8594 16]
> + *
> + * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
> + */
> +static const u16 vc5_hdmi_csc_full_rgb_to_limited_rgb[3][4] =3D {
> +	{ 0x1b80, 0x0000, 0x0000, 0x0400 },
> +	{ 0x0000, 0x1b80, 0x0000, 0x0400 },
> +	{ 0x0000, 0x0000, 0x1b80, 0x0400 },
> +};
> +
> +static void vc5_hdmi_set_csc_coeffs(struct vc4_hdmi *vc4_hdmi,
> +				    const u16 coeffs[3][4])
> +{
> +	HDMI_WRITE(HDMI_CSC_12_11, (coeffs[0][1] << 16) | coeffs[0][0]);
> +	HDMI_WRITE(HDMI_CSC_14_13, (coeffs[0][3] << 16) | coeffs[0][2]);
> +	HDMI_WRITE(HDMI_CSC_22_21, (coeffs[1][1] << 16) | coeffs[1][0]);
> +	HDMI_WRITE(HDMI_CSC_24_23, (coeffs[1][3] << 16) | coeffs[1][2]);
> +	HDMI_WRITE(HDMI_CSC_32_31, (coeffs[2][1] << 16) | coeffs[2][0]);
> +	HDMI_WRITE(HDMI_CSC_34_33, (coeffs[2][3] << 16) | coeffs[2][2]);
> +}
> +
>   static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
>   			       const struct drm_display_mode *mode)
>   {
> @@ -533,35 +577,10 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *v=
c4_hdmi,
>  =20
>   	HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, 0x354021);
>  =20
> -	if (vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
> -		/* CEA VICs other than #1 requre limited range RGB
> -		 * output unless overridden by an AVI infoframe.
> -		 * Apply a colorspace conversion to squash 0-255 down
> -		 * to 16-235.  The matrix here is:
> -		 *
> -		 * [ 0.8594 0      0      16]
> -		 * [ 0      0.8594 0      16]
> -		 * [ 0      0      0.8594 16]
> -		 * [ 0      0      0       1]
> -		 * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
> -		 */
> -		HDMI_WRITE(HDMI_CSC_12_11, (0x0000 << 16) | 0x1b80);
> -		HDMI_WRITE(HDMI_CSC_14_13, (0x0400 << 16) | 0x0000);
> -		HDMI_WRITE(HDMI_CSC_22_21, (0x1b80 << 16) | 0x0000);
> -		HDMI_WRITE(HDMI_CSC_24_23, (0x0400 << 16) | 0x0000);
> -		HDMI_WRITE(HDMI_CSC_32_31, (0x0000 << 16) | 0x0000);
> -		HDMI_WRITE(HDMI_CSC_34_33, (0x0400 << 16) | 0x1b80);
> -	} else {
> -		/* Still use the matrix for full range, but make it unity.
> -		 * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
> -		 */
> -		HDMI_WRITE(HDMI_CSC_12_11, (0x0000 << 16) | 0x2000);
> -		HDMI_WRITE(HDMI_CSC_14_13, (0x0000 << 16) | 0x0000);
> -		HDMI_WRITE(HDMI_CSC_22_21, (0x2000 << 16) | 0x0000);
> -		HDMI_WRITE(HDMI_CSC_24_23, (0x0000 << 16) | 0x0000);
> -		HDMI_WRITE(HDMI_CSC_32_31, (0x0000 << 16) | 0x0000);
> -		HDMI_WRITE(HDMI_CSC_34_33, (0x0000 << 16) | 0x2000);
> -	}
> +	if (vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode))
> +		vc5_hdmi_set_csc_coeffs(vc4_hdmi, &vc5_hdmi_csc_full_rgb_unity);
> +	else
> +		vc5_hdmi_set_csc_coeffs(vc4_hdmi, &vc5_hdmi_csc_full_rgb_to_limited_=
rgb);
>  =20
>   	HDMI_WRITE(HDMI_CSC_CTL, csc_ctl);
>   }
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--86IFqNplhZmWTkVc6beRVry7B2ZqFwCt4--

--0KuPdmQ2xYZLBNHEpiP3jW7YE6zU4Fakp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmB29CgFAwAAAAAACgkQlh/E3EQov+Dp
QQ/8DjpPXNba39Pf/4mLZ76bS9gZ5wBb7R6w/Q0XcWh4HG0X66tITH7U6bCBTHP1b2sQncSa+o98
KsiBwgKykn0HIR5NjKbyBPBLNIZ+pGJ/fx/QIHJSxik9lKapwQVu8ugSmWkHahlzjZljIqJl0s3h
Re0C7j6k0B3BI6xPW/JGfLHG2v7+ICzoLfVmC7xQ+zNC3KdEF5DU7DwbHa6vV1eVRdr9Vg//nAVi
LWU8gukZbJ3tsvUCHYV3/f+yHliiCBLbxZTUlkIaaiHgSRwG54VrTnUeKZgugcffKIAHrRWr6qjY
q259xoq7FVyYjzeHoRv358dgH4qFK94KtzQaXIemLYS9431kRdWqJ21RDXuu3nw7+iXfWlKBPbJL
IPOH+AYPibqUdyvpwGmI8FRS5nr72ioP9O9IZ81eJSXfJzQkvkZHZhIhG6u9gyro3g9g/UhyQnrD
cwfWKxYoVYyjXwqKxo68be+GHCqrzSzWe/Vt0Qo/dYF8IGkAgsCRNRKrkFc3i3REdCytrZ5HcU6M
zgyuZfPOZ3bEdg093WXhyezRfpcZn/shoFwUhu5E81tu9mH2yEElHH3tYeJ+LTGZFuboW2Fr6K2D
a03DchjK8UgMsVvhPzkMqATwIC1Tdgoie2QCqct+u2GFkngCeuVrTdGSJdh2YWTxzT5o0RDG8Mi2
n/s=
=a1Me
-----END PGP SIGNATURE-----

--0KuPdmQ2xYZLBNHEpiP3jW7YE6zU4Fakp--

--===============1255618810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1255618810==--
