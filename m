Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 998551FBAAF
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 18:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20E66E2E3;
	Tue, 16 Jun 2020 16:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58CE6E2E3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 16:13:44 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l10so21355939wrr.10
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 09:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0rQoMcjmlT0BEH+UjIHMaJbv/iNxUkPgl1tFBEJqEGQ=;
 b=LY3uz0gYxmoMoF4FNchIEUCd8eNAZ3KAmh7bN/tKclJ7uOIo/j4JZW4pRkcz6eiMv8
 1HHeyBEJgQRGZaR3zxlZGALJta9jygS+W9EUlm+yqxj6tNsyfDSiBEH+sMXFqqHpypse
 TuNS65lrqUOzfGO6yqJQcOkMRgW/qghzVEr9AF2/5DDKlUcaOhbpw3oURmHyxgkR7932
 01YX90uJECRzj5SJ9H056HczxewPJKqFAHktbAU4lb+vrf3DgXYtJ3bKI21xluHmioI/
 GLcSGcm3kYRI/MaugvaJzCOxnD+zzUaTULlkobqpvRZE2CvRnr17KgA9VUbT8oLD2R2l
 JzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0rQoMcjmlT0BEH+UjIHMaJbv/iNxUkPgl1tFBEJqEGQ=;
 b=i2V4JF8Q/hWkBD1w0UV8Ig5JYHQ1RL/cVdIZgrqCYrXZR8MxOR5FurEMicfCg34k/6
 JHm5doFZD3yzPVsBKh9No0MZSp7+9PKToEbSWziU6mKOrvt0hDCfkO/AqUhjM9E0HovG
 vcfYyleUp8ArtuW0nVBcg9FNnIbbzZLjYJAJRzD7l7XpjZbKEt96oA8G1NyLJ26n/hMo
 6HOwWnM36YoHP0oScH1P285D7rJ3l5QgSXReKz165Bscl2y1ed98qG7+jCfXSHRFXXKP
 mUnGjN4mgKmAreFdjpvJRrqT5QYf8DY9tV1fd1ryWwLigTRuB+z/wGdBo3XsIuUsYM46
 dJJw==
X-Gm-Message-State: AOAM533AF9XIzBMLoYwJX/njPIf9OimmNRZBYNuVFnZmFm/CbtW8+cPP
 vBnQVOBl95pC4iE0UrgSjAQ=
X-Google-Smtp-Source: ABdhPJwU3I/himda8O3+Ct698iLDDwqzPv4jdXmHoXOhQ0fsJCZhz/xK7lbrOy4UYrpME4V9asJ59g==
X-Received: by 2002:adf:97cb:: with SMTP id t11mr3842066wrb.314.1592324023500; 
 Tue, 16 Jun 2020 09:13:43 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id a1sm4973461wmd.28.2020.06.16.09.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 09:13:42 -0700 (PDT)
Date: Tue, 16 Jun 2020 18:13:41 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2] drm/tegra: Add zpos property for cursor planes
Message-ID: <20200616161341.GA3009091@ulmo>
References: <20200616121713.2983627-1-thierry.reding@gmail.com>
 <c34c97ab-08de-341e-05e5-77e2651d956f@gmail.com>
MIME-Version: 1.0
In-Reply-To: <c34c97ab-08de-341e-05e5-77e2651d956f@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Content-Type: multipart/mixed; boundary="===============2050971921=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2050971921==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2020 at 06:54:35PM +0300, Dmitry Osipenko wrote:
> 16.06.2020 15:17, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > As of commit 4dc55525b095 ("drm: plane: Verify that no or all planes
> > have a zpos property") a warning is emitted if there's a mix of planes
> > with and without a zpos property.
> >=20
> > On Tegra, cursor planes are always composited on top of all other
> > planes, which is why they never had a zpos property attached to them.
> > However, since the composition order is fixed, this is trivial to
> > remedy by simply attaching an immutable zpos property to them.
> >=20
> > Changes in v2:
> > - hardcode cursor plane zpos to 255 instead of 0 (Ville)
> >=20
> > Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/tegra/dc.c  | 9 +++++++--
> >  drivers/gpu/drm/tegra/hub.c | 2 +-
> >  2 files changed, 8 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index 83f31c6e891c..85408eed4685 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -787,7 +787,7 @@ static struct drm_plane *tegra_primary_plane_create=
(struct drm_device *drm,
> >  	}
> > =20
> >  	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
> > -	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
> > +	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 254);
> > =20
> >  	err =3D drm_plane_create_rotation_property(&plane->base,
> >  						 DRM_MODE_ROTATE_0,
> > @@ -957,6 +957,7 @@ static struct drm_plane *tegra_dc_cursor_plane_crea=
te(struct drm_device *drm,
> >  	}
> > =20
> >  	drm_plane_helper_add(&plane->base, &tegra_cursor_plane_helper_funcs);
> > +	drm_plane_create_zpos_immutable_property(&plane->base, 255);
> > =20
> >  	return &plane->base;
> >  }
> > @@ -1074,7 +1075,11 @@ static struct drm_plane *tegra_dc_overlay_plane_=
create(struct drm_device *drm,
> >  	}
> > =20
> >  	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
> > -	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
> > +
> > +	if (!cursor)
> > +		drm_plane_create_zpos_property(&plane->base, plane->index, 0, 254);
> > +	else
> > +		drm_plane_create_zpos_immutable_property(&plane->base, 255);
>=20
> On T20/30 we're are setting the plane's type to CURSOR because we want
> to use one overlay plane for the mouse cursor. Nevertheless, it's still
> a generic overlay plane that can change its z-position, and thus, it's
> wrong to make zpos immutable here.

But it doesn't really make sense for the cursor plane to change z-
position, even if it's technically possible. We do want it to always be
on top anyway. Doing it this way makes the cursor behave the same way
irrespective of the Tegra generation that we're running on.

Yes, that may not fully expose the capabilities of the hardware, but we
are already restricting the hardware capabilities by exposing the
overlay plane as a cursor plane in the first place.

Thierry

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7o77IACgkQ3SOs138+
s6E4lQ//Y2TkGcKv0aei1ScJVjYGc7wbH0fWvmlFFsq9a2HvLqKqCY+4F9shI77V
6x/k2sjQI2tL6nD8n5Qeu5JGMkc6dREPenIxkJ4HYiqlkqBv/WjsGQmh04w0Gi1W
Z++iUQz46Wn/AdI0/fl16458One4/2+63VBf4q9UzSu2yeTmNmE2o8copJOpbm+W
sWLy3CSEI7XgIjAbOcXE0zcyuFeo6Zr96owhibYhE2ClEh6dftk98/eLp1k+ZCFY
ZloGWglLE36g6ttnXoVS//KTSwxUS6Ll89GZbQrXU2ffmlsLFOJAcVsDZucGuvQB
GhjMOO174LDGASkCSYanKxY6c71R2jilxxHsk6M+7HsD39eedxSj8LcElgVm+Bfg
Hj2Udt/UbKQp7f0jnSbjA4vA/g++T1igUkTXh/LtEw8KgILiRKfE0JV8nYc5VIzX
3of+6QTQmhdD4Di2aBVYEbP+NmwGX9d9cfhbm5XI/0qBR3U6v9LRzpsJheq1cB6L
8QCwoO5x1fumcW81125BS0/P24uBSfpeLH8kg2/dvYPg5nUSuXy/kV8ceApvzFMR
Qs8NTlyqYvVQ3m9OZn3B35XUUJCMup2wDG/z2d5ql62FCkwqPDS5AVP48W/B5jQ9
RETTZln2gfpIvBGQfBH9jryKGeAHDCd2/2JPhtUCp5slUIAx32s=
=Pe8q
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--

--===============2050971921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2050971921==--
