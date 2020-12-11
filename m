Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1312C2D76E6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 14:50:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44BEA6E3AA;
	Fri, 11 Dec 2020 13:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626196E3AA
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 13:50:29 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id w13so13395008lfd.5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 05:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=F/c74yLmAXZPGeh9DkqKSR1evEFA8Qgy1I6Y1zZ0Hsk=;
 b=hooR9qA76x1D9av5gOFbIVRR2Sy4cXlcx8X2ZNquCdJ7cunhALdKA3onyWLxIYeANN
 d6nXmHrOeDSAswwwmpTbPCzCYY5YSCSHfIpnh8x+8rn0OxOuzF85wOMrMsIi4YejJajJ
 H8pNeMVcSQhrPa/z0KOIP5R1qEOqNACIA1gr38/ouCgn/N9MKprhvNQcfJy04AP0ZY3Z
 21X0Tmt6/qx7LmCye+Mj/o6svYMmQNzlYcy9/+gJoQKmYbIyTWilimyDDuFK/ZXWNIJS
 imJtBxtW+eVMu1m/Si2LfArjFTnWhsNoGzI53XhGPGSbqPEP6S/I2kZASq3dT5NY9PRy
 Evjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=F/c74yLmAXZPGeh9DkqKSR1evEFA8Qgy1I6Y1zZ0Hsk=;
 b=YAxtsqkLpv/8LdF/f4b7NgmWG09hbwpEpqYZTVv1fUQPc6mliw16w5fQke+1iLHBa0
 wfDqKvl/SZC8Cy136k/HD/mbktXN1kA5pQOIPkIhLxiaC+6RYnZqfi428xQ/I9gwuKDr
 nrfZyOzTC4A53Ho90k2iY50YYHKqb+UxVkCs0bvxTUoiD4Fi87tDN9XGv4KLTxvNz3Wd
 Q1Z+flVXS1eCM+PSCEcT2gFm4hTaVwNt7AJ8ps4NXrjQBEyHN8AhUw6AYoNZIl3xbRH3
 CQ9GZwaF6P/bZc0rym7UzpM8exLiVbJCmcMr+RFibYtAsE6f72KOydi4Ljm7Vx9ocJ/2
 bb9g==
X-Gm-Message-State: AOAM5310yOpVmiyt3My0pC8W/TW2URHGgz953Iw+jZTXZE3Aj4Tfq5fv
 Bi2t75fXcrT1l/ao7Uu1TMw=
X-Google-Smtp-Source: ABdhPJyhhqFv6SmKD7c5Ngk3MF2oZ2mZvZmYMQxjPeLnWKKdIKCG9q3Zy5Q/DHwYTBl1fPfVrruVag==
X-Received: by 2002:a05:6512:329a:: with SMTP id
 p26mr4423911lfe.96.1607694627895; 
 Fri, 11 Dec 2020 05:50:27 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id r135sm789596lff.240.2020.12.11.05.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 05:50:27 -0800 (PST)
Date: Fri, 11 Dec 2020 15:50:24 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3 4/4] drm: require each CRTC to have a unique primary
 plane
Message-ID: <20201211155024.5ea63a88@eldfell>
In-Reply-To: <diZcSZPAu0GrvVEqzkkXk1LYv1pDkE536hsLoYTUoUw@cp3-web-016.plabs.ch>
References: <diZcSZPAu0GrvVEqzkkXk1LYv1pDkE536hsLoYTUoUw@cp3-web-016.plabs.ch>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0295764609=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0295764609==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/MmkHVz9Ui+e.gCoLQPsPDSD"; protocol="application/pgp-signature"

--Sig_/MmkHVz9Ui+e.gCoLQPsPDSD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Dec 2020 13:08:26 +0000
Simon Ser <contact@emersion.fr> wrote:

> User-space expects to be able to pick a primary plane for each CRTC
> exposed by the driver. Make sure this assumption holds in
> drm_mode_config_validate.
>=20
> Use the legacy drm_crtc.primary field to check this, because it's
> simpler and we require drivers to set it anyways. Accumulate a set of
> primary planes which are already used for a CRTC in a bitmask. Error out
> if a primary plane is re-used.
>=20
> v2: new patch
>=20
> v3:
> - Use u64 instead of __u64 (Jani)
> - Use `unsigned int` instead of `unsigned` (Jani)
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_mode_config.c | 21 +++++++++++++++++++++
>  drivers/gpu/drm/drm_plane.c       |  6 ++++++
>  2 files changed, 27 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode=
_config.c
> index fbe680035129..c5cf5624c106 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c

...

> +
> +	drm_for_each_plane(plane, dev) {
> +		if (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
> +			num_primary++;
> +		}
> +	}
> +
> +	WARN(num_primary !=3D dev->mode_config.num_crtc,
> +	     "Must have as many primary planes as there are CRTCs, but have %u =
primary planes and %u CRTCs",
> +	     num_primary, dev->mode_config.num_crtc);
>  }
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 49b0a8b9ac02..a1f4510efa83 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -54,6 +54,12 @@
>   * enum drm_plane_type). A plane can be compatible with multiple CRTCs, =
see
>   * &drm_plane.possible_crtcs.
>   *
> + * Each CRTC must have a unique primary plane userspace can attach to en=
able
> + * the CRTC. In other words, userspace must be able to attach a different
> + * primary plane to each CRTC at the same time. Primary planes can still=
 be
> + * compatible with multiple CRTCs. There must be exactly as many primary=
 planes
> + * as there are CRTCs.
> + *
>   * Legacy uAPI doesn't expose the primary and cursor planes directly. DR=
M core
>   * relies on the driver to set the primary and optionally the cursor pla=
ne used
>   * for legacy IOCTLs. This is done by calling drm_crtc_init_with_planes(=
). All

Hi,

is there a reason why one cannot have more primary planes than CRTCs in
existence?

Daniel implied that in <20201209003637.GK401619@phenom.ffwll.local>,
but I didn't get the reason for it yet.

E.g. if all your planes are interchangeable in the sense that you can
turn on a CRTC with any one of them, would one not then expose all the
planes as "Primary"?

If the planes have other differences, like supported formats or
scaling, then marking them all "Primary" would let userspace know that
it can pick any plane with the suitable properties and expect to turn
on the CRTC with it.

Or does marking a plane as "Primary" imply something else too, like
"cannot scale"? I think Weston does make this assumption in an attempt
to hit fewer causes for failure.


Thanks,
pq

--Sig_/MmkHVz9Ui+e.gCoLQPsPDSD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl/TeSAACgkQI1/ltBGq
qqczbg//bcnlSmYNTPtez08iAE9zDI3ZHHVfakFO+7H3uPe3wJ7PGIKsv/PlXpef
cOvtBeagP/Df7zR6JfEgjb3AGuY4qoFu0MagKgz0REMp84qJeVU1MYxnYUJdSU3d
R0MgBcjoHci4T9ExARPpIOLR0NBSBNVKiVmOErD7+W7kAtGeL7ac9wIU+auyk1T1
FKZzARRdPcJOu2paegtzb5zcA/gghZQgNA7pUTC349lDeIJGaO6t89NO2FfsE3Z3
bEuG35Q2N29PVzZBQ3XLi7XHAkdWlD+tKhanV14YPmhdrXRSAYH5Jx2BJXXK5rA7
/SZWsu//gzvUL18IbIHTstcABOTb7nDJIOAoRnjUwRHKVq9KXi87UpY/Mn/MjROP
udLvDfttikBhlSrkOCKmJTe4FwFJ+IQlgl+wP4HKTtaT4sMtCyIupnpk2Z1jXsxs
oynVCJVyxDXSAchadQRtj0q69vUGnoExdkEDOiKazp8I7lmd9wfwCoPKcGhkO7Zd
+KNah97em2Nk+g3BT6ktc70qhQPv4KWKKh2EVDHYxPeXqK1e0WpzoiW0jTd9jUH6
y3Q9RYSz123hs1Hb+O04OjQi/dQTiLA3k2MZjcdMU/QOSYi+OzoEj8nwITtXq+RV
Tx5Uk5Buq56AdTFHeJ2J/Zq9ysxOuyGqwj704dUOWdqEGq9RlMQ=
=zRgQ
-----END PGP SIGNATURE-----

--Sig_/MmkHVz9Ui+e.gCoLQPsPDSD--

--===============0295764609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0295764609==--
