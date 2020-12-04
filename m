Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 906582CEB4B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 10:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF196E139;
	Fri,  4 Dec 2020 09:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87F06E139
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 09:47:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 447C3AC2E;
 Fri,  4 Dec 2020 09:47:15 +0000 (UTC)
Subject: Re: [PATCH] drm: Remove drmm_add_final_kfree() declaration from
 public headers
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20201204092932.21636-1-laurent.pinchart+renesas@ideasonboard.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <da1b7a41-1050-80d7-65f8-2afc616243a3@suse.de>
Date: Fri, 4 Dec 2020 10:47:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201204092932.21636-1-laurent.pinchart+renesas@ideasonboard.com>
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
Content-Type: multipart/mixed; boundary="===============1323954420=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1323954420==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SVTMd0d9EwmjDdzKo70VNLqOumrLZY228"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SVTMd0d9EwmjDdzKo70VNLqOumrLZY228
Content-Type: multipart/mixed; boundary="TMTYddy3PKZB1RYdsyxH86zmAVQkWZ6W7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Message-ID: <da1b7a41-1050-80d7-65f8-2afc616243a3@suse.de>
Subject: Re: [PATCH] drm: Remove drmm_add_final_kfree() declaration from
 public headers
References: <20201204092932.21636-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20201204092932.21636-1-laurent.pinchart+renesas@ideasonboard.com>

--TMTYddy3PKZB1RYdsyxH86zmAVQkWZ6W7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 04.12.20 um 10:29 schrieb Laurent Pinchart:
> The drmm_add_final_kfree() function is declared in the
> include/drm/drm_managed.h public header, but has become an internal API=

> not exposed to drivers. Drop it from drm_managed.h as it's already
> declared in drm_internal.h.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.=
com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   include/drm/drm_managed.h | 2 --
>   1 file changed, 2 deletions(-)
>=20
> diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> index ca4114633bf9..b45c6fbf53ac 100644
> --- a/include/drm/drm_managed.h
> +++ b/include/drm/drm_managed.h
> @@ -44,8 +44,6 @@ int __must_check __drmm_add_action_or_reset(struct dr=
m_device *dev,
>   					    drmres_release_t action,
>   					    void *data, const char *name);
>  =20
> -void drmm_add_final_kfree(struct drm_device *dev, void *container);
> -
>   void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp) __=
malloc;
>  =20
>   /**
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--TMTYddy3PKZB1RYdsyxH86zmAVQkWZ6W7--

--SVTMd0d9EwmjDdzKo70VNLqOumrLZY228
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/KBaIFAwAAAAAACgkQlh/E3EQov+AH
Tg/9G3/1ISlC1R4Bd75Gjxx4EnRszzOyEqvDB2dWKxZRQ7LuLz+9BbIYewhVDyrl74KPmZEtousd
bemB3VLtRRteZdaAKTDS8stUzA1xKWrj7REpIEP9scpNMfvS+aEk2elAGLmN1wDNcyv9NwxSAwQu
Y9V8NbE8t1WYYQZpwZDLDjsK2gcMyhe4lX7d2WJ2pVTCS74RnQW8mBenBt6OFG+7tOthqGHT1ZiS
ku8KNFuV8tfkFDiYTblsxz6Va7wXzIDdlttMIFqjeXZVriU82rsvUnfngLPst8QNlPR3bP65Tp+3
F5MWrR2FV4BestcXnKPHkDtfBsXwq/mQ6UunXQB0UjvqPRhi3714VSql1owfgRDEWcy4IG3U4c5O
lXjcGXzo+JZP/ceENMN5KmArrJ7njeBcieeZZPXDvQ4UNFEIwS8ke8hEK2wtl60rWPe1slk9h0ta
UXdsJylKxDK5EzqvMfeb86T/ddTYj9OADKbF28LgjXB/ALKeN+O7H3K8NRoeXJMTv4pmVUsavQUf
hhu6tWM6XiUTG2bt6Gtl17lQQVuzfvf9DQu4U5j75Vdq6WRuzSOhN6C4aAwgylvSnKvfESJh71Gm
mdyw2wtyxySlnnKuYCr9IRDqeh9f81Qk5o4H++llSLDzKVKNfhQbo+OLi8tXK/XIUJhviuM19CCT
Yj0=
=ea86
-----END PGP SIGNATURE-----

--SVTMd0d9EwmjDdzKo70VNLqOumrLZY228--

--===============1323954420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1323954420==--
