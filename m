Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 070ED32CE49
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 09:21:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B941C6E4B7;
	Thu,  4 Mar 2021 08:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFF66E4B7
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Mar 2021 08:21:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BDC00AAC5;
 Thu,  4 Mar 2021 08:21:06 +0000 (UTC)
Subject: Re: [PATCH] drm/stm: ltdc: Use simple encoder
To: Jagan Teki <jagan@amarulasolutions.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 Philippe Cornu <philippe.cornu@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent Abriou <vincent.abriou@st.com>
References: <20210302175700.28640-1-jagan@amarulasolutions.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <791a6f75-3603-9b84-c267-76c24fb77ee2@suse.de>
Date: Thu, 4 Mar 2021 09:21:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210302175700.28640-1-jagan@amarulasolutions.com>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-amarula@amarulasolutions.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: multipart/mixed; boundary="===============0377273727=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0377273727==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="j2ZI2tgr2HFWGwvR1rVkDX8CF1cKP4vlo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--j2ZI2tgr2HFWGwvR1rVkDX8CF1cKP4vlo
Content-Type: multipart/mixed; boundary="AK4xx3qya29Jz8JQWpNRhf5ZcjrKlNi2q";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 Philippe Cornu <philippe.cornu@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent Abriou <vincent.abriou@st.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Message-ID: <791a6f75-3603-9b84-c267-76c24fb77ee2@suse.de>
Subject: Re: [PATCH] drm/stm: ltdc: Use simple encoder
References: <20210302175700.28640-1-jagan@amarulasolutions.com>
In-Reply-To: <20210302175700.28640-1-jagan@amarulasolutions.com>

--AK4xx3qya29Jz8JQWpNRhf5ZcjrKlNi2q
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

shall I merge this patch?

Am 02.03.21 um 18:57 schrieb Jagan Teki:
> STM ltdc driver uses an empty implementation for its encoder.
> Replace the code with the generic simple encoder.
>=20
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 12 ++----------
>   1 file changed, 2 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 7812094f93d6..aeeb43524ca0 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -31,6 +31,7 @@
>   #include <drm/drm_of.h>
>   #include <drm/drm_plane_helper.h>
>   #include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
>   #include <drm/drm_vblank.h>
>  =20
>   #include <video/videomode.h>
> @@ -1020,14 +1021,6 @@ static int ltdc_crtc_init(struct drm_device *dde=
v, struct drm_crtc *crtc)
>   	return ret;
>   }
>  =20
> -/*
> - * DRM_ENCODER
> - */
> -
> -static const struct drm_encoder_funcs ltdc_encoder_funcs =3D {
> -	.destroy =3D drm_encoder_cleanup,
> -};
> -
>   static void ltdc_encoder_disable(struct drm_encoder *encoder)
>   {
>   	struct drm_device *ddev =3D encoder->dev;
> @@ -1088,8 +1081,7 @@ static int ltdc_encoder_init(struct drm_device *d=
dev, struct drm_bridge *bridge)
>   	encoder->possible_crtcs =3D CRTC_MASK;
>   	encoder->possible_clones =3D 0;	/* No cloning support */
>  =20
> -	drm_encoder_init(ddev, encoder, &ltdc_encoder_funcs,
> -			 DRM_MODE_ENCODER_DPI, NULL);
> +	drm_simple_encoder_init(ddev, encoder, DRM_MODE_ENCODER_DPI);
>  =20
>   	drm_encoder_helper_add(encoder, &ltdc_encoder_helper_funcs);
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--AK4xx3qya29Jz8JQWpNRhf5ZcjrKlNi2q--

--j2ZI2tgr2HFWGwvR1rVkDX8CF1cKP4vlo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBAmHEFAwAAAAAACgkQlh/E3EQov+BW
LhAAtB/ROfja0It2G8hWcRI1jXKJrtGPKUZIpEwiBosfhFdoBUfLdpOGtOi0znaiJ4dRHDk+4khw
wm0kT8mbAiTAT/TZhQRuoemVyZGsirZ4ICHNmw2E9h02hAtiPCkKy9rRrbu8+y1bvxZxumWjENo6
Ci/tDyehZM1vExRGZxddNVwsU7leHcd4wCr6jNhQ0fFktMkaGhbSY/COIRg5m4yLdGNsnexEm3CT
FOlO7DJCOysCFdsx5Uoy38H4NUxPMbM1S6Qg5pr+nEyfI/d4iitPbbY5NA83/34xMYnQzZVQIPYw
ZCENZyrIFHOoU0eLsq37X8V0c/8tXM/mJ/GcnahFGlH8NdhG1ctBazEG/lJJgMinYHwb78gv+dgq
SSiN73IfbtYSl14tY+62kvwlUYCythX4HchKxB8OEmrlt6wo3JQabarUViOM8/VZMAlBCz6MjOH5
HCKgEo7IIf9ApMFSV/oSJVuuqPQy6drWK0A1umrDHedwk2Oym1cOk0/q3ca/3XGOUQM8bwol6pFN
Sb8X8HKNay9VvUCIwOVljUmAfJUeT1ux8sdwpP7RizOLQbs8r4tLcmHV9LG71E+8AibF1FnsZeap
Q2mhgZiG+0y0nTCqmIwUNFwYcRPc8yF8FDc8snsqhTfD9Ykp2MhmOlyH/Tv2BOkrrdRTpF5aLDRv
Bac=
=kdMO
-----END PGP SIGNATURE-----

--j2ZI2tgr2HFWGwvR1rVkDX8CF1cKP4vlo--

--===============0377273727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0377273727==--
