Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B70D389FAB
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 10:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738BE6F386;
	Thu, 20 May 2021 08:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C376F386
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 08:17:48 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id x19so23216928lfa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 01:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=dNoZ/h97UBjXzmbY4unSCY+Zn1NIfXS1RJjopeXPpWk=;
 b=fnp8HFktYOH0kY5ZcRerRwMAVfyGbjsIKiT0+9cuZIMVQ0U87U6D3yNZWqhQ30HJ56
 qgF6KwAzXrfwqXxyhyiWWWWaD861Yff/9TXakycdGj01F6YEziT5OY/q37uZKitAhq7A
 elLszjlVA/jdh01GB9StN3Qsy3LJrPOYUG42lKvm8GAqlWL7XnREKwP2aL8LAGH/z4pB
 5lNUgIMlaCy6zMwHEC5s/s5HYY0cQI963+PRUEQ+OyDkAdSJ8e+wwjUn9hhp8gugXgST
 6gi2y6TOTGkuj5CV1GVrQMdHd3YHcVk99yOlqu2r5u2+vLZO5BNNTamd4+puY/sMGzt2
 5W8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=dNoZ/h97UBjXzmbY4unSCY+Zn1NIfXS1RJjopeXPpWk=;
 b=ZzSbCkgce/KghihuoIYH3OZOjM2rL6NYAtexNHO5prXYrrUSSwpEu/X5e61JOwSvvC
 cAorTqcTgpAam/b0OXEROFEWXs503R0eefOzCy+2Fy68Ni04relxkDZBLufpWwWBK6fk
 N1e9huzGCyAP28a32rE9VAMNOPJXYm85Xk8Ouy8yP8lEiwEHKDCVyKRrc8QJppWESe7a
 cHtXjiX0f+D5TjUc2VNT2N1LB4bIJihOTebinIpCAB/8O9A8cSljQIB9mUsjHefYnlT2
 vFJfxaGH/WUQG9oXKzK40xyyICwAtPTS6Wczme64UHnWJYrca4fB+TQn/rpAn0pCl/VL
 0FnA==
X-Gm-Message-State: AOAM532yZZ5CvnQDRXgP/g2vtYflUAdx0Xk0aPT3B09blyEYObnZ586W
 fAFle4KZ8K7zYOZ0jpj32x8=
X-Google-Smtp-Source: ABdhPJx+n8fpCspQFxwLr2Q2SrOmn7HWr5vNQgJ2/luaZfGQw2IwpzMqM9sIML6OLoyDvvAWXANLJw==
X-Received: by 2002:a05:6512:1318:: with SMTP id
 x24mr2520382lfu.53.1621498666699; 
 Thu, 20 May 2021 01:17:46 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id r17sm194158ljp.40.2021.05.20.01.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:17:46 -0700 (PDT)
Date: Thu, 20 May 2021 11:17:43 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 2/3] drm: clarify and linkify
 DRM_CLIENT_CAP_WRITEBACK_CONNECTORS docs
Message-ID: <20210520111743.62abdcbc@eldfell>
In-Reply-To: <J47jNf2tAKjofhxL2LEdu1b3w1iRaisxtLCVObf9A@cp4-web-037.plabs.ch>
References: <J47jNf2tAKjofhxL2LEdu1b3w1iRaisxtLCVObf9A@cp4-web-037.plabs.ch>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_321GcLYDZUGYA9ylcgzTyp"; protocol="application/pgp-signature"
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

--Sig_/_321GcLYDZUGYA9ylcgzTyp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 18 May 2021 11:14:47 +0000
Simon Ser <contact@emersion.fr> wrote:

> Make it clear that the client is responsible for enabling ATOMIC
> prior to enabling WRITEBACK_CONNECTORS. Linkify the reference to
> ATOMIC.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Daniel Stone <daniels@collabora.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>  include/uapi/drm/drm.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 1c947227f72b..87878aea4526 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -812,8 +812,8 @@ struct drm_get_cap {
>   * DRM_CLIENT_CAP_WRITEBACK_CONNECTORS
>   *
>   * If set to 1, the DRM core will expose special connectors to be used f=
or
> - * writing back to memory the scene setup in the commit. Depends on clie=
nt
> - * also supporting DRM_CLIENT_CAP_ATOMIC
> + * writing back to memory the scene setup in the commit. The client must=
 enable
> + * &DRM_CLIENT_CAP_ATOMIC first.
>   */
>  #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS	5
> =20

I'll take your word that this is how it must be done.

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/_321GcLYDZUGYA9ylcgzTyp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCmGycACgkQI1/ltBGq
qqcXtxAAlT5Jx7VsPmm/j89ma7Gtw6qyE58uUoFdJOP+sAncoLxgHzQF0G4Jx2Lw
qfbarO3samP7UeYJNjVQKzS3ecDdrQix3oy8/n5HJPsPFjmoFTMjYCXxReJ0EG2H
NSWD3n2YGMLsGr2FuqJCQvnR0aW5qEfqF4FwRbwK/qusmSf2Azx52iU0w5ftgOKx
3olovMRyOaEXSIR89ayXm+7/e+Ds+RgtpGjFCMNvfQNs8PU5upyqDGw0rZnnXhe6
F0aBkRrEibKGvrH7TEXsqzmr57fYiYqYPpWaryRgl336idTE8hLCtdxjnCX1jZAz
wWDWx7238rcyacqsD2O/bzCsew+tIUv440oeMHGYQIwImQ9FUTz7hy0FP4kdfvHU
zPlgc/nHLMAYe3CYFl/s2YegaI4VvXSc6qV/5HKJ9Q4RnUIpqsxyY3rZYnhFmHt4
x3SF2EZPyMECeJJhCmySLlwA0yd51hDyFiUJDH9R9CXOhR3XHIrjx+63ySPMSN2z
ucqD15JAn4FpfQHwp7ek9tdeLyJJv2LxK1CvRQjftp0cEXW+4U36nO/1uwwHHhav
9owNEtOrN2WpAK3gZv7ysuyBHK56kyOnbitwNgx0iviJDFoPji6jWQC79ZcgOJO7
SHLEd/aVnr2VEBtdJhFaTDKZ5kMQwaBNNsPx+qBja4xH6TXZ/5A=
=gcec
-----END PGP SIGNATURE-----

--Sig_/_321GcLYDZUGYA9ylcgzTyp--
