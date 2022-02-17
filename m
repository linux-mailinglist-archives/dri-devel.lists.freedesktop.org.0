Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66374B9CBA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 11:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B2610EFFE;
	Thu, 17 Feb 2022 10:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D953F10EFFE
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 10:10:37 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id bu29so9056637lfb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 02:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=wsBm9GlF6QBk+ga6odvG4D+yJfesdCIhGI6Qr588TUo=;
 b=TrKDmwEnnG2m5f31bp3dJe99wKxPtwM+R3St+7DDbnp8bsJwZvieAD4m6QSKUpDEvZ
 3cSAg+gssaRQ/+Gw9D1aU9LRUhFdKboR/ANIhPzFX6OUcnMEbJIuzfPTmDgiJLBALBcl
 JhqWI7VIFp0x4d1jgalEpySbMm+KnKatTU04d811m2kFqVa+LPYLtxwn91j21CokyUi+
 qBwibqLLsfDxDfPZpyC1aXZbSAImySOYF597S9wxB6+dfZuwuL8QqV67Auq/8N2P7i7V
 IyKcRQ16+nW3tY7Iu1bQ8/4yR4zGGguDqLSTRttHWyFbFoB+pNoi/QXafGKhGLjQcJGb
 qFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=wsBm9GlF6QBk+ga6odvG4D+yJfesdCIhGI6Qr588TUo=;
 b=Q+wEiwg+KMj1+qLlOArVMkOpw6fUMC1C8djVBEfWXMYUGa8bUEsg5jySOJ/cyhLghB
 FPzYigTOFp6mByhSsTF0gj49lS+ZxKtdhP1lw8c07eIYd+2MFC4ufXmUTLYQ/qT4SpIt
 bp+jDyAg4/hXNnEqPfEMbAk8PLyG7h9BbBkvtatAIWIBxuU/SSrqRZSBa45LLBTeqx4i
 MsUqW4UrFMCD8Zt2Hc0h/rgpdhHdtkMQH/2bal2lg2IwwXbQpU2YIXk/2b36kH3opxUd
 U+anAFnLw41rwucxX0R2TH8FnTM72ARbPep9WMgZYCkiAk0mciLiUb5gqwkWrPUX93Ps
 brZg==
X-Gm-Message-State: AOAM533Mfj6u9bKZEz2nq8uBgXY6GyZCCF53yPKP7GBYckfUIXOauEw1
 S42NjDsCc0VvxBOIhVi2x+w=
X-Google-Smtp-Source: ABdhPJw6d1Xx03VBy4x0vM44wpr0/W0ibQpAYvHtY4+JhKJFclWHt/sAdUZmSM5sc0c5Qyto8ako3w==
X-Received: by 2002:a05:6512:3710:b0:43a:12aa:cb68 with SMTP id
 z16-20020a056512371000b0043a12aacb68mr1622061lfr.280.1645092636121; 
 Thu, 17 Feb 2022 02:10:36 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id i3sm5094012lfj.144.2022.02.17.02.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 02:10:35 -0800 (PST)
Date: Thu, 17 Feb 2022 12:10:33 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 8/8] drm/fourcc: Add DRM_FORMAT_D1
Message-ID: <20220217121033.0fc7f6ba@eldfell>
In-Reply-To: <20220215165226.2738568-9-geert@linux-m68k.org>
References: <20220215165226.2738568-1-geert@linux-m68k.org>
 <20220215165226.2738568-9-geert@linux-m68k.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nO3MwzHd32JIR23_QdrLEwe";
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/nO3MwzHd32JIR23_QdrLEwe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Feb 2022 17:52:26 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Introduce a fourcc code for a single-channel frame buffer format with two
> darkness levels.  This can be used for two-level dark-on-light displays.
>=20
> As the number of bits per pixel is less than eight, this relies on
> proper block handling for the calculation of bits per pixel and pitch.
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  drivers/gpu/drm/drm_fourcc.c  | 2 ++
>  include/uapi/drm/drm_fourcc.h | 3 +++
>  2 files changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index c12e48ecb1ab8aad..d00ce5d8d1fb9dd3 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -151,6 +151,8 @@ const struct drm_format_info *__drm_format_info(u32 f=
ormat)
>  		{ .format =3D DRM_FORMAT_C4,		.depth =3D 4,  .num_planes =3D 1,
>  		  .char_per_block =3D { 1, }, .block_w =3D { 2, }, .block_h =3D { 1, }=
, .hsub =3D 1, .vsub =3D 1 },
>  		{ .format =3D DRM_FORMAT_C8,		.depth =3D 8,  .num_planes =3D 1, .cpp =
=3D { 1, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
> +		{ .format =3D DRM_FORMAT_D1,		.depth =3D 1,  .num_planes =3D 1,
> +		  .char_per_block =3D { 1, }, .block_w =3D { 8, }, .block_h =3D { 1, }=
, .hsub =3D 1, .vsub =3D 1 },
>  		{ .format =3D DRM_FORMAT_R1,		.depth =3D 1,  .num_planes =3D 1,
>  		  .char_per_block =3D { 1, }, .block_w =3D { 8, }, .block_h =3D { 1, }=
, .hsub =3D 1, .vsub =3D 1 },
>  		{ .format =3D DRM_FORMAT_R2,		.depth =3D 2,  .num_planes =3D 1,
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 8605a1acc6813e6c..c15c6efcc65e5827 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -104,6 +104,9 @@ extern "C" {
>  #define DRM_FORMAT_C4		fourcc_code('C', '4', ' ', ' ') /* [3:0] C */
>  #define DRM_FORMAT_C8		fourcc_code('C', '8', ' ', ' ') /* [7:0] C */
> =20
> +/* 1 bpp Darkness */
> +#define DRM_FORMAT_D1		fourcc_code('D', '1', ' ', ' ') /* [0] D */
> +

Hi Geert,

the same comment here as for C1 and R1 formats, need to specify pixel
ordering inside a byte.

I think it would also be good to explain the rationale why C1 and R1
are not suitable for this case and we need yet another 1-bit format in
the commit message.

For posterity, of course. I roughly remember the discussions.

I also wonder if anyone would actually use D1. Should it be added
anyway? There is no rule that a pixel format must be used inside the
kernel AFAIK, but is there even a prospective userspace wanting this?

Exposing R1 and inverting bits while copying to hardware might be
enough?


Thanks,
pq

>  /* 1 bpp Red */
>  #define DRM_FORMAT_R1		fourcc_code('R', '1', ' ', ' ') /* [0] R */
> =20


--Sig_/nO3MwzHd32JIR23_QdrLEwe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmIOHxkACgkQI1/ltBGq
qqfxtQ//cB5PpnZOZOuy1vfa4m+SVmb/OfNz3ra6mqw9akiOfUbA4cT/0vTDCtGl
KzNEJaKvg1zt27R+FxRqUupLRBX30d0sCm83/eMCziS7+2BmfBm2Q03nsJxo3zW6
CJXfT/O+cOMiBsJWEAd0kefgH7e5Ea1s3H5yDvMWr/VKg8R58M+OzYhtMlDRto/e
VSsL2RlTp+tPJfUvrWX0sqCtH8KKAJVvIRAILJBCN6CA+qp50INFTZNTJ1rs293p
KGmErPfLWStT0KFQPdzdBE/fC18xsjS5jCORvRmQMtlrcFZRJq6q3UTg7K7SiVKx
1nJCl7b4RG9zNaAnwIFh8e629NpVaPewzpT1aXfWQ6afCCgebYoqbK+aR7Q9E3zX
2iR0GJRVOrm6Xe8nVgOPNjNkb8HwhREfLoE7AYxDUgX3/4nfKvu8ElrcaeKenbM/
6EcD5u5CVO2PINa5Dp2qXcgiC4u+pS4nko8yc+a0Zr+gP0BwM5FiQ2/mbZeP+0Ka
aqYIntktyOsK5ppgJDaCHPnIQmPoJNJp7/JN05Se7Gg6ZyEv/zKRvOsjpACxKwFL
fc+R38/3nG94r2h9O01qC35vXxr1CYSBtxSD861Nwpg+omICPh4WzQ8JWevT4mch
x4aulQlxkRJmqe+oRk6urYTjDvR9KsYPWDn5sKCgMdAAIFgpSdM=
=5ycp
-----END PGP SIGNATURE-----

--Sig_/nO3MwzHd32JIR23_QdrLEwe--
