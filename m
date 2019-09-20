Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 244B6B941E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 17:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0046E08A;
	Fri, 20 Sep 2019 15:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B159F6E08A
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 15:37:13 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id x2so3009245wmj.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 08:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AX57Hs4HCQtaA3Xa7YyrVAb3tuo0Z12IuGAD5UmSf8c=;
 b=Ho79UcZ3hIuF9GWpfdvVQIJ87LbY1PJWBU+AdAn2DZR9qe+ORk0rO7x7wOXnnYBER/
 YGiEUwUv27KCu3Q9wv1dRbr1Fhmwt3ZmISWz97V7R1VsLxA9mfJmFeeJAZQ5ys7S+a9T
 2SHJnHK5QkZQo4+sORW/1o557yhEyMZbV73hPMXbDWPdLo2nOM6GyzsAsY4K3KUoMgeo
 0bTiewXX6XPCe4+Di1OycMwYUfuOjIsPfvbnOyIrQEGEdVBRWVbwfA1iliDzkHqn3+SK
 dFi8XSFffwvoAYwcq7Zkrmu1X7f5LP2fHBpIlR4HGqgviYunHboQDbWqQxJEDQS43R93
 YOtw==
X-Gm-Message-State: APjAAAVoH+5CiWPrd5M6mHQ0Xui3ueKSGt7pMORjXsfCcNoBB5OR6mt9
 JM/4o/+xmmGm6ql7BeRJcSI=
X-Google-Smtp-Source: APXvYqzEI0BsA+/o7uoQjB4ifUp57NiyPJU1UgtdLOeODIPt+PkL/Bu4n9KVds2YNGn9BSayA/D2AA==
X-Received: by 2002:a1c:9988:: with SMTP id b130mr4214504wme.164.1568993832269; 
 Fri, 20 Sep 2019 08:37:12 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id b184sm4027059wmg.47.2019.09.20.08.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2019 08:37:10 -0700 (PDT)
Date: Fri, 20 Sep 2019 17:37:09 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] drm: tweak drm_print_bits()
Message-ID: <20190920153709.GC10973@ulmo>
References: <20190919131412.25602-1-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190919131412.25602-1-kraxel@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AX57Hs4HCQtaA3Xa7YyrVAb3tuo0Z12IuGAD5UmSf8c=;
 b=K0jrl67AN1h+QlEJyiWA4ZbuycXv4BmoN85GgE5zNDpH1N0mMWLVZB7zjO/ttSPHa+
 MB+liEFjQoWS5NxnxiVgcvUEvwSd5vwBDZOzl801vPmPk9x4OF15rp7r4IrB9J6oqMov
 7FRD1UkDvX7klQl1oDbFULaDQzwcpTvD4TjMuJZK9xrN6sabwtYjyTkDshSRN5UWL4t+
 quusfIe5ZNecFl/8iJLUhrO9PERwcP80Em6KY2hNEgoFx4FTC1NnUiaKICk3Z23nBsP1
 EAJwJR1bXrQakcZmIw7pQZL/5mqIilFtbu+We01RiD5sOy03keBRRbdAOtETV6n0/Cel
 jF+w==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2050555953=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2050555953==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KN5l+BnMqAQyZLvT"
Content-Disposition: inline


--KN5l+BnMqAQyZLvT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2019 at 03:14:11PM +0200, Gerd Hoffmann wrote:
> There is little reason for the from/to logic, printing a subset of
> the bits can be done by simply shifting/masking value if needed.
>=20
> Also use for_each_set_bit().
>=20
> Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/drm/drm_print.h              |  5 ++---
>  drivers/gpu/drm/drm_gem_ttm_helper.c |  4 ++--
>  drivers/gpu/drm/drm_print.c          | 20 +++++++++-----------
>  3 files changed, 13 insertions(+), 16 deletions(-)
>=20
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 12d4916254b4..5b9947d157f4 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -89,9 +89,8 @@ __printf(2, 3)
>  void drm_printf(struct drm_printer *p, const char *f, ...);
>  void drm_puts(struct drm_printer *p, const char *str);
>  void drm_print_regset32(struct drm_printer *p, struct debugfs_regset32 *=
regset);
> -void drm_print_bits(struct drm_printer *p,
> -		    unsigned long value, const char *bits[],
> -		    unsigned int from, unsigned int to);
> +void drm_print_bits(struct drm_printer *p, unsigned long value,
> +		    const char * const bits[], int nbits);

bitmap_*() APIs that this calls underneath all use unsigned int for
nbits, so might be good to stick with that. After all, this better never
be negative.

Thierry

> =20
>  __printf(2, 0)
>  /**
> diff --git a/drivers/gpu/drm/drm_gem_ttm_helper.c b/drivers/gpu/drm/drm_g=
em_ttm_helper.c
> index 9a4bafcf20df..a534104d8bee 100644
> --- a/drivers/gpu/drm/drm_gem_ttm_helper.c
> +++ b/drivers/gpu/drm/drm_gem_ttm_helper.c
> @@ -23,7 +23,7 @@
>  void drm_gem_ttm_print_info(struct drm_printer *p, unsigned int indent,
>  			    const struct drm_gem_object *gem)
>  {
> -	static const char const *plname[] =3D {
> +	static const char * const plname[] =3D {
>  		[ TTM_PL_SYSTEM ] =3D "system",
>  		[ TTM_PL_TT     ] =3D "tt",
>  		[ TTM_PL_VRAM   ] =3D "vram",
> @@ -40,7 +40,7 @@ void drm_gem_ttm_print_info(struct drm_printer *p, unsi=
gned int indent,
>  	const struct ttm_buffer_object *bo =3D drm_gem_ttm_of_gem(gem);
> =20
>  	drm_printf_indent(p, indent, "placement=3D");
> -	drm_print_bits(p, bo->mem.placement, plname, 0, ARRAY_SIZE(plname));
> +	drm_print_bits(p, bo->mem.placement, plname, ARRAY_SIZE(plname));
>  	drm_printf(p, "\n");
> =20
>  	if (bo->mem.bus.is_iomem) {
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index dfa27367ebb8..a495fe3ad909 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -189,28 +189,26 @@ EXPORT_SYMBOL(drm_printf);
>   * drm_print_bits - print bits to a &drm_printer stream
>   *
>   * Print bits (in flag fields for example) in human readable form.
> - * The first name in the @bits array is for the bit indexed by @from.
>   *
>   * @p: the &drm_printer
>   * @value: field value.
>   * @bits: Array with bit names.
> - * @from: start of bit range to print (inclusive).
> - * @to: end of bit range to print (exclusive).
> + * @nbits: Size of bit names array.
>   */
> -void drm_print_bits(struct drm_printer *p,
> -		    unsigned long value, const char *bits[],
> -		    unsigned int from, unsigned int to)
> +void drm_print_bits(struct drm_printer *p, unsigned long value,
> +		    const char * const bits[], int nbits)
>  {
>  	bool first =3D true;
>  	unsigned int i;
> =20
> -	for (i =3D from; i < to; i++) {
> -		if (!(value & (1 << i)))
> -			continue;
> -		if (WARN_ON_ONCE(!bits[i-from]))
> +	if (WARN_ON_ONCE(nbits > sizeof(unsigned long) * 8))
> +		nbits =3D sizeof(unsigned long) * 8;
> +
> +	for_each_set_bit(i, &value, nbits) {
> +		if (WARN_ON_ONCE(!bits[i]))
>  			continue;
>  		drm_printf(p, "%s%s", first ? "" : ",",
> -			   bits[i-from]);
> +			   bits[i]);
>  		first =3D false;
>  	}
>  	if (first)
> --=20
> 2.18.1
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--KN5l+BnMqAQyZLvT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2E8iMACgkQ3SOs138+
s6Eb3g//RVAd8nEd/vTjAihUPyEF8QrbURk9POsCWgjOGQ2nkplz2Pxi3dN2pk/S
ZI9Oz/GhRVoLttOiUbSjsPKx0uym8PK8sVoYnvSl6o3c0WtJZ5ZOJpo2TBwgBJ/L
0XbxLsVbCzph4dIH9BX3+v+XZUddW8CRni5dYyKR3CBrFNyVggt5Nutr0+27wWHl
xdfJqO576b2LJTIltJdreeq5YTeclT6S+ouCrcosoPhZstpOPcStv/Kjb4TLycLG
WOR3aD3OOIWuXpiA64xh/gLhEQs2wJ7f/5c24gWFfSbmmlojOMpBBGMaimupjWOx
bWeDvVSX1SXpThLY8P5EpEKiS7jHXnTm7Vty1V0QC8eYFgcBG1IzDGS63ml2Ffys
EhP18L7klydCxnLsOlHBZe88jiEN7npAZir2XIuZZEFq2sNKoPBCRxPFl4n9JxV0
fpok74P06DED5ytnoSz0qHY9Sb+AkJyZk+RCbfb5pARMg/GxXFVOpZ2NC6z7AP1k
xbCWItj+qajELNwxu7FNPB2PxaUE9qDTP5JgqsI7KVOlTCwkJezx+bIyEoTNEVzu
RUHN8obICzV8uxYtLhjUI4703lR/Xe/DeAgvQVk3vVH+CJzJXcA36WQarWnciPb6
SeSLQydLBzEm5dc2O5F2IIJArvcxnxYXMRvMY/xud9uvpvtPF5E=
=YQP7
-----END PGP SIGNATURE-----

--KN5l+BnMqAQyZLvT--

--===============2050555953==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2050555953==--
