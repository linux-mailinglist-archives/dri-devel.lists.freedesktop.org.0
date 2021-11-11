Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ED844D58E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 12:09:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330EC6EA4D;
	Thu, 11 Nov 2021 11:09:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B19A6EA4D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 11:08:59 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id k2so3675175lji.4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 03:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=4OLolgHA/HZYT2rnWHwKI95WEbZYNP1Z6xadiZqSkAA=;
 b=HKpH7YiBinHFDFQWt7YhkBj7IT11LAvzwUKbwIRuniIIKTA9zIGCIxaDsUdEGAzwDq
 a9SNCvkYAu+kbgBahw/3uk3NWA9rBSt1whwlLbbb6ufyyIg+R7PQj00LplnqbJY+RCMp
 H0SS64KBf3oMtUcNn2qMFIeZ91rkZmXMfo3Or6oKYdbg3LdVrdSRekVRHyMjR6HT2KMm
 ejBAYIgEcG0fe3tQ2skd5Gu7dNR+nuWQGiQVAQbsJ501RcbODtifNeEt/WvfNkOv5sGc
 aaQylUhq29PjHfcxUv/nxHrr6qzg2E1w2iEe69/P8JG109/VEgSQ5NQZOS/E0TQieFZb
 690Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=4OLolgHA/HZYT2rnWHwKI95WEbZYNP1Z6xadiZqSkAA=;
 b=esU7Tp4nVdRj6eiJRFa1ydDCvWtYsstDOmJa9si9qR0wqGW42sWt3V5QLqD8Hr5uFB
 5js9v4b9ueaDQP+zYGOqyBnarixiWQKC3duDbRKD2C0x1fCbKi1LkNNpPhuT2QM+CHjv
 0pfhs7RznO9G2KSTkqv35MPsc4rC3A1j9LtzUU5bsrac+l/gjtlZgyt3z4IEgib6kP4/
 xKk1UseIBXPJ/Wv2JnKFaSqXoY1KrQCoCJagubBdldKdQjD3hOFAAqUh+3NnhLJQj//2
 MSdgFpYjaKZqTcJuWg+Any5N3CRLulXvhvTw5Amk3HB661L1pXLJuniXQDLQY450pr+o
 aPKA==
X-Gm-Message-State: AOAM531cV6OUFxrk1xY0zUpElNn54j+8BNzGHUi4CXd1JTT6d4C5XpIp
 cGR7ysAeLf1S3t8ioPoad1M=
X-Google-Smtp-Source: ABdhPJz/obRvgjXZrwby5tVAb79YzDHYN3jdsBmVfnS6loq7mokj4uTcGqgNPfUbfz3jXtppmE0y6w==
X-Received: by 2002:a2e:a602:: with SMTP id v2mr6136546ljp.504.1636628938217; 
 Thu, 11 Nov 2021 03:08:58 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id o1sm240526ljj.33.2021.11.11.03.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 03:08:57 -0800 (PST)
Date: Thu, 11 Nov 2021 13:08:47 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: pre-fill getfb2 modifier array with INVALID
Message-ID: <20211111130847.58fe3b17@eldfell>
In-Reply-To: <20211111101049.269349-1-contact@emersion.fr>
References: <20211111101049.269349-1-contact@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xXf710iH6Oo+v1wVG37/B6w";
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
Cc: dri-devel@lists.freedesktop.org, Daniel Stone <daniels@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/xXf710iH6Oo+v1wVG37/B6w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 11 Nov 2021 10:10:54 +0000
Simon Ser <contact@emersion.fr> wrote:

> User-space shouldn't look up the modifier array when the modifier
> flag is missing, but at the moment no docs make this clear (working
> on it). Right now the modifier array is pre-filled with zeroes, aka.
> LINEAR. Instead, pre-fill with INVALID to avoid footguns.
>=20
> This is a uAPI change, but OTOH any user-space which looks up the
> modifier array without checking the flag is broken already, so
> should be fine.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Daniel Stone <daniels@collabora.com>
> ---
>  drivers/gpu/drm/drm_framebuffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_fram=
ebuffer.c
> index 07f5abc875e9..f7041c0a0407 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -601,7 +601,7 @@ int drm_mode_getfb2_ioctl(struct drm_device *dev,
>  		r->handles[i] =3D 0;
>  		r->pitches[i] =3D 0;
>  		r->offsets[i] =3D 0;
> -		r->modifier[i] =3D 0;
> +		r->modifier[i] =3D DRM_FORMAT_MOD_INVALID;
>  	}
> =20
>  	for (i =3D 0; i < fb->format->num_planes; i++) {

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/xXf710iH6Oo+v1wVG37/B6w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGM+b8ACgkQI1/ltBGq
qqdRpA/+JSB2adKrOu03tpD4lgv3kwtF5SHy/wWWDm1c9F3KEA1xHhLEujX6przD
mi2/2vNH0TXCzfWaHTpR5Dnhshnw5MyeOcxxXIheQd/QDUTwtQerdHlgl4vKHYR8
1dpavZFx1s95tMQzV3niDXg+zQwiXPkCdH7Zn4SyVlo2PInc0CdxHcdqZMyaXQZ5
NKlOGL5wT0AZSlu6DOHTtPn2lSCFGO1MPwe7po52cc5Vt9S2yFYsakE2qVPuEPsZ
aO2rvs7qJ5n8/NqdrsD0JnrozeMy2MkM7QAgjrs2mGqaVqeS1l2Fl/DVKY7wpElz
rDvyNSQ7GMnmhOi0RwH3lublPB3WALrPSFISi/Lv/beHSGSI+LK1X8LEwZeQOWOU
n8gHRCpLsj0iCszMTmw1Uq/RW9SVf7vUN10dUSY2jb5YLH3FhFo5+B4SzaSKIq0h
jTwjaNSYA7iCkvIvXEinRoRt38iPZFgYZAgkKAcKUgoW3OhfoINSa+sIAPbqgCsK
3WyrdiiuwiLIqomnQ9e5xAzcM3uYZ0SexUhkugn+9TWVxfX2DNZw/L1EDtxzchYy
Uqhw3IgOh7+0klCpy+KfUwpwC5e5OIBDHcI6SS5JtOUNliRu60xjiNzqpiscTBPx
DGQwC0I4IO7v1LOfAGT9oyifAJhGlr6DJwCeTmbGLLdE+gOgbpM=
=pSEZ
-----END PGP SIGNATURE-----

--Sig_/xXf710iH6Oo+v1wVG37/B6w--
