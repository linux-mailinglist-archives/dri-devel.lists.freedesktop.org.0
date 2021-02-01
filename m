Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F5C30A9F7
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 15:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759DA6E7D0;
	Mon,  1 Feb 2021 14:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95E46E7D0
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 14:39:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 60FD1ABD5;
 Mon,  1 Feb 2021 14:39:11 +0000 (UTC)
Subject: Re: [PATCH 3/6] drm/gma500/cdv: Remove unused tv out paths
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20210201132617.1233-1-patrik.r.jakobsson@gmail.com>
 <20210201132617.1233-3-patrik.r.jakobsson@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <77790aa7-2f92-16c1-a6b5-63a86d1f2b84@suse.de>
Date: Mon, 1 Feb 2021 15:39:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210201132617.1233-3-patrik.r.jakobsson@gmail.com>
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
Cc: airlied@linux.ie
Content-Type: multipart/mixed; boundary="===============0280199553=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0280199553==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="EoKoZFXQsO4V9dYi2Tbv40Dke08OkUL20"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EoKoZFXQsO4V9dYi2Tbv40Dke08OkUL20
Content-Type: multipart/mixed; boundary="6QbNtzj40twvCtHsEZ85OKhzHgCb1xkOH";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie
Message-ID: <77790aa7-2f92-16c1-a6b5-63a86d1f2b84@suse.de>
Subject: Re: [PATCH 3/6] drm/gma500/cdv: Remove unused tv out paths
References: <20210201132617.1233-1-patrik.r.jakobsson@gmail.com>
 <20210201132617.1233-3-patrik.r.jakobsson@gmail.com>
In-Reply-To: <20210201132617.1233-3-patrik.r.jakobsson@gmail.com>

--6QbNtzj40twvCtHsEZ85OKhzHgCb1xkOH
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 01.02.21 um 14:26 schrieb Patrik Jakobsson:
> Afaik tv out is not available on Cedarview and the code isn't doing
> anything so remove it.
>=20
> Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/gma500/cdv_intel_display.c | 11 +----------
>   1 file changed, 1 insertion(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_display.c b/drivers/gpu/d=
rm/gma500/cdv_intel_display.c
> index 5d3302249779..aac776fab36d 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_display.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_display.c
> @@ -582,7 +582,7 @@ static int cdv_intel_crtc_mode_set(struct drm_crtc =
*crtc,
>   	struct gma_clock_t clock;
>   	u32 dpll =3D 0, dspcntr, pipeconf;
>   	bool ok;
> -	bool is_lvds =3D false, is_tv =3D false;
> +	bool is_lvds =3D false;
>   	bool is_dp =3D false;
>   	struct drm_mode_config *mode_config =3D &dev->mode_config;
>   	struct drm_connector *connector;
> @@ -603,9 +603,6 @@ static int cdv_intel_crtc_mode_set(struct drm_crtc =
*crtc,
>   		case INTEL_OUTPUT_LVDS:
>   			is_lvds =3D true;
>   			break;
> -		case INTEL_OUTPUT_TVOUT:
> -			is_tv =3D true;
> -			break;
>   		case INTEL_OUTPUT_ANALOG:
>   		case INTEL_OUTPUT_HDMI:
>   			break;
> @@ -660,12 +657,6 @@ static int cdv_intel_crtc_mode_set(struct drm_crtc=
 *crtc,
>   	}
>  =20
>   	dpll =3D DPLL_VGA_MODE_DIS;
> -	if (is_tv) {
> -		/* XXX: just matching BIOS for now */
> -/*	dpll |=3D PLL_REF_INPUT_TVCLKINBC; */
> -		dpll |=3D 3;
> -	}
> -/*		dpll |=3D PLL_REF_INPUT_DREFCLK; */
>  =20
>   	if (is_dp || is_edp) {
>   		cdv_intel_dp_set_m_n(crtc, mode, adjusted_mode);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--6QbNtzj40twvCtHsEZ85OKhzHgCb1xkOH--

--EoKoZFXQsO4V9dYi2Tbv40Dke08OkUL20
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAYEo4FAwAAAAAACgkQlh/E3EQov+Ct
Ag/+O661A2yqOCNRRS7PVtp4o/H/DRFlsD12i2BIpAnyfQ2/7nbLTR0We+z140ZpnYIY1tP0zYdb
7z34zboVFlUQvQxy6KQzh9a2XgdkUIfkZxi1+/MOLV26wbWeLNFo42+9Y4Sm2yLk+OZFFmKZD3Zm
ucY2YhLwZUm92aOoMDNBrd/W1APX7855osxOlKsHcvSN4E/5V5YeertVY0WBFAPdD7Gn0YmaMGwl
93zghU7yV576bcc1/IV+bwsx3bu0pPXLeULUwxBvQMghFKrvEC4zwoQzmiEiydyXyWbyyos5N7dz
ZGqmYYgHxs5RNQtM04lIaoQ6cwL90PhwOGxpq/oKsO92B6kOr1nB0rH0mtiVJkJFSWMd7NcS8nsB
FoThiRr0zGmug9hDQ72GyjjG++yoXMXFqK4BrlfuK16eAiQzusBhyYhriaH1slp0x/YpEjTyN4ta
xOgkP7B955z3xG+7gajc+kmn60QMI6GcfxnIe+vvO0uWKhdgrkmxFkCwQw7CUqsMSjsjXRZJ1eV7
AjRyPynDULeXwE7oiiOcYbOnP+sdXzDJ5pqGEsvuZOIh6dKctlseFt/+LndGB1vZKLnN5tqYuZXz
+mYWjaBFAjc9qj2JB16sbybYJsogd1wrSos/ZvwPxmur3FZPCsdvSYF9awtT5D1l9cBTyVEU6pAI
fVc=
=Bo+f
-----END PGP SIGNATURE-----

--EoKoZFXQsO4V9dYi2Tbv40Dke08OkUL20--

--===============0280199553==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0280199553==--
