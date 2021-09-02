Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF55E3FEF71
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 16:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42CC6E56A;
	Thu,  2 Sep 2021 14:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713D96E56A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 14:28:22 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id h16so1849022lfk.10
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Sep 2021 07:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=CrN1aM08Y4JK/xLQVCkBWpsAqJhJ+3F4Ue3r3U3/KEA=;
 b=PGmZMjskPB/T5uQv2ljZyX39SO32H4KJiUxiHAaSipRKlq6coU95wJ0bIaKk5qYtCH
 Qd2WkyBKEFojuK0Tbik17+CWwe4Vu4eoND7Tle+BINidikOAs3hIC3Jd+Q+qgOco3HJJ
 UIqbZ9kv3YrNuaa2lMScRDwYOrjdWfOo5/QJHtfol+u82mxvxH2muxjP5/kDvO9ZfWjW
 bhdAz8W4Mwg7oFWKwebxxMd7wIzkZiAv83GhkhIqbuC/w87bD8dyPysGVGdtFAHBchkq
 //vYUfYPwZWBu1u0bPE+dfP7Gursc5hqg2iEGh5PKuYOfmOvWIG1e3aI2Y08YCpwg1/r
 m3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=CrN1aM08Y4JK/xLQVCkBWpsAqJhJ+3F4Ue3r3U3/KEA=;
 b=Mb7EvZGmo5Y6B/q5IQhKa5m4ILAk7TW+554Q4o7YBqISVBQeWCpmbfdP3xgdH9DqYe
 b7alo2uAflcFxC99mdJHosIXMG+MIaPx64EOVV/3J5FYwt7PRW0ASXsgXm2aDsqLSK1a
 8TKoRW6Q5x7VHMYUhVN+4wEL7jrgHDnqVgofi8vXODDW7pCMH4nlQ6N5kcOACfyK+QRi
 YWCRTdEppuugZE3+5mwiL3PgGwb43S2lpHmw6viNbhcee3nsQaqUdfGflvSxmeBS1j6w
 O8PrtK8eI3OYbGRWwj8V8rtNLfRLc3if6xRhrCxMFOE/gaHckUyxemFBuGUdwskdffRJ
 OySQ==
X-Gm-Message-State: AOAM5338ZkzmcfIUI3mSsBxTNsCs+vC4n/cbCzstnwRjv4OWgitoYzr+
 vIdxgeBi+2d8AbM6frFfSko=
X-Google-Smtp-Source: ABdhPJzLdbKNLMXvsxPPaUOcF0F1xmy70XPcPzlky8uSxJoftKm3KXNidl6vlQ077drde8UT4Byrfg==
X-Received: by 2002:a05:6512:3a84:: with SMTP id
 q4mr2814118lfu.543.1630592900716; 
 Thu, 02 Sep 2021 07:28:20 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id b17sm240377ljj.35.2021.09.02.07.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 07:28:20 -0700 (PDT)
Date: Thu, 2 Sep 2021 17:28:10 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Stone <daniels@collabora.com>, Michel =?UTF-8?B?RMOkbnplcg==?=
 <michel@daenzer.net>, Emil Velikov <emil.l.velikov@gmail.com>, Keith
 Packard <keithp@keithp.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH] drm/lease: allow empty leases
Message-ID: <20210902172810.24ed05bb@eldfell>
In-Reply-To: <20210902091126.2312-1-contact@emersion.fr>
References: <20210902091126.2312-1-contact@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/c3vU/2zJ+vcEZgflLdE=Zwt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/c3vU/2zJ+vcEZgflLdE=Zwt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 02 Sep 2021 09:11:40 +0000
Simon Ser <contact@emersion.fr> wrote:

> This can be used to create a separate DRM file description, thus
> creating a new GEM handle namespace. See [1].
>=20
> Example usage in wlroots is available at [2].
>=20
> [1]: https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/110
> [2]: https://github.com/swaywm/wlroots/pull/3158
>=20

Hi Simon,

I have a feeling that this is a good idea, but could you explain in
this commit message some real use cases where one needs a new GEM
handle namespace? Not just "when you share a DRM fd between processes"
but *why* you shared a DRM device fd between processes.

If I have trouble remembering or figuring that out from those links,
then I'm sure others have too.


Thanks,
pq

> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Daniel Stone <daniels@collabora.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> Cc: Michel D=C3=A4nzer <michel@daenzer.net>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Keith Packard <keithp@keithp.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/drm_lease.c | 39 +++++++++++++++++--------------------
>  1 file changed, 18 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
> index dee4f24a1808..d72c2fac0ff1 100644
> --- a/drivers/gpu/drm/drm_lease.c
> +++ b/drivers/gpu/drm/drm_lease.c
> @@ -489,12 +489,6 @@ int drm_mode_create_lease_ioctl(struct drm_device *d=
ev,
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return -EOPNOTSUPP;
> =20
> -	/* need some objects */
> -	if (cl->object_count =3D=3D 0) {
> -		DRM_DEBUG_LEASE("no objects in lease\n");
> -		return -EINVAL;
> -	}
> -
>  	if (cl->flags && (cl->flags & ~(O_CLOEXEC | O_NONBLOCK))) {
>  		DRM_DEBUG_LEASE("invalid flags\n");
>  		return -EINVAL;
> @@ -510,23 +504,26 @@ int drm_mode_create_lease_ioctl(struct drm_device *=
dev,
> =20
>  	object_count =3D cl->object_count;
> =20
> -	object_ids =3D memdup_user(u64_to_user_ptr(cl->object_ids),
> -			array_size(object_count, sizeof(__u32)));
> -	if (IS_ERR(object_ids)) {
> -		ret =3D PTR_ERR(object_ids);
> -		goto out_lessor;
> -	}
> -
> +	/* Handle leased objects, if any */
>  	idr_init(&leases);
> +	if (object_count !=3D 0) {
> +		object_ids =3D memdup_user(u64_to_user_ptr(cl->object_ids),
> +					 array_size(object_count, sizeof(__u32)));
> +		if (IS_ERR(object_ids)) {
> +			ret =3D PTR_ERR(object_ids);
> +			idr_destroy(&leases);
> +			goto out_lessor;
> +		}
> =20
> -	/* fill and validate the object idr */
> -	ret =3D fill_object_idr(dev, lessor_priv, &leases,
> -			      object_count, object_ids);
> -	kfree(object_ids);
> -	if (ret) {
> -		DRM_DEBUG_LEASE("lease object lookup failed: %i\n", ret);
> -		idr_destroy(&leases);
> -		goto out_lessor;
> +		/* fill and validate the object idr */
> +		ret =3D fill_object_idr(dev, lessor_priv, &leases,
> +				      object_count, object_ids);
> +		kfree(object_ids);
> +		if (ret) {
> +			DRM_DEBUG_LEASE("lease object lookup failed: %i\n", ret);
> +			idr_destroy(&leases);
> +			goto out_lessor;
> +		}
>  	}
> =20
>  	/* Allocate a file descriptor for the lease */


--Sig_/c3vU/2zJ+vcEZgflLdE=Zwt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmEw33oACgkQI1/ltBGq
qqcXoQ//Vz942Ehjc6LkYZqAIAZyuMc+ptIbrZTTMDyrelrwtlF7em8QVt4CXCYp
4rNWzlp6NxGX7WqD4w4XeK++KYoyy3DnGTs4J5Nd3wZHmGlBGTQ+eilr991r8Enj
NPBKeY9tNfHJmUpt8xk1tiiYEB+dOSbOVWLa+TJUXifxdPew5v7iCE+LJprag+nJ
6dSrBOx42mC93oXzQVISz88eMRSpkwc3yIjISf/SWt+9jkVZm3rHQ127J2TQqiRN
LWIimmjv0n9Ox8jtWWHWT7/9bNeqTei/bq9+Zvqvylj8A+ITls1ANiSXS+Q48p1P
p/p7dixZv4hdzrIzRJ8O8Zl0xiqKlg5ts7m+c4G1ZvJiKvCKdztawXtDHUQfRSLd
uH7bhmfxxmR78B23TWNPFjkOQ97DkVsCyiPnkgGEo9GOHKye9XhXsQNQJM6WBLog
JafF7EWmA/TNDPjEzHMClEDO2Uf9mI6S5nLmj8Zpksh1JK761Fakqr9LmrDmL7xS
Rfu/Yyx9vA75ndeDoS4M5JdB8/qecXqZr5+WOmIShi7t/lH1LYXAbn4HYjOiCE5u
Ad9mM0TcFTu6Tv7527tEQlKW6ND0JVOWKVDsFfkKBKiZ454HxgVk2XjqsA7jRbsU
ZVi0Iwf0+M7ltLgyPkakWcv/Q8TNqQKt8+4dtIW+qddfEM2Tnn8=
=VO7+
-----END PGP SIGNATURE-----

--Sig_/c3vU/2zJ+vcEZgflLdE=Zwt--
