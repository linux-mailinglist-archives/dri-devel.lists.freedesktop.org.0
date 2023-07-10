Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2CC74D10E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 11:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D230410E00F;
	Mon, 10 Jul 2023 09:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBEC10E00F;
 Mon, 10 Jul 2023 09:09:59 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1b8a462e0b0so20023415ad.3; 
 Mon, 10 Jul 2023 02:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688980199; x=1691572199;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZfziryGEywF1OCFAiRrD5HH2CawNQQd/yh4CzyASrxI=;
 b=EgnRXmIty3Veat9BxmT9s9PzIR26yGSc64PHjsJASW6rQkjDt6h6hF6dFNdPEL6Nt4
 PUT0zti06eDX6hNIbbMG/t6j3cpQBB1RBa8+w18HTM904n9b+ueSlinzNk0MtsoG8+oz
 dLQk3zFQTzQaXt6W+/yDX0add7uJCFrqJirKxFpXM3dhQ3jpmshjbjruAZ4SOuuujXaF
 lCkjeuiAwSs3Ebu3Ya3oj5RwWphbVmTerT/FkoDqWeTTTorZy1PMc8NMKXMPur7dzvig
 oUGnp5EJBFTJyQv8Fywqlmmpt6Z43QAsdsq/8J//KV/53/E6RuYZHW08OlipX40ilE1F
 vhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688980199; x=1691572199;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZfziryGEywF1OCFAiRrD5HH2CawNQQd/yh4CzyASrxI=;
 b=BR8PvfJng6sm6mgzm2qf7f4b4BHHM4lCWHWfxq167wWruQ5Vq8WR9OAurZxpXx67qM
 /mnSvesCGAB3mUv4jlYOckmEG6dAROgouPRFFGJuwqeWZV5F3ZymuBrxkbSwRnUE2qLJ
 rzMo/cXE9yobtqoRuGjvxdDM2Z8G1UrFAh7abZrsbTWIH5ej0XmapzpjIZSvzG8Nut54
 jaU/6TWKGKp3K6ORBg5PGfZiSCG8BqqJyH6gfol4FQ6j1o9EexF/+15potHWiUQVC4ye
 4ZQ3r3L3OseJsH3H6l87ay3zlSIITIA2yuqP3f6C9yH3OW0f/EOfUYhNRwNT5Z6Lba8y
 Yubw==
X-Gm-Message-State: ABy/qLZDsSUC878HGhiWSfa2NvEa+tPaTsiMGbOxrnM8HzcmTa5KcdpT
 zdkm0qygb8NFMchjuMAfrzb3NaGKihdwBXlc
X-Google-Smtp-Source: APBJJlECPiX2JObsb+RjoZmVK9i5eoWA4utCjAYXj24Z5oVB1RCRjZJ3hDpsi5MIPpxKT6wRYYOytQ==
X-Received: by 2002:a17:902:c409:b0:1b8:28f6:20e6 with SMTP id
 k9-20020a170902c40900b001b828f620e6mr13600129plk.34.1688980198740; 
 Mon, 10 Jul 2023 02:09:58 -0700 (PDT)
Received: from debian.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 s12-20020a170902ea0c00b001b9df8f14d7sm1822852plg.267.2023.07.10.02.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 02:09:57 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id AF9DF91C4E4C; Mon, 10 Jul 2023 16:09:52 +0700 (WIB)
Date: Mon, 10 Jul 2023 16:09:52 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: sunran001@208suo.com, airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH] drm/nouveau/iccsense:
Message-ID: <ZKvK4NXzkKZTE35E@debian.me>
References: <20230710070505.53916-1-xujianghui@cdjrlc.com>
 <1ddf673283e93e83d912066f2241b976@208suo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sesJufGAkiPhMEHr"
Content-Disposition: inline
In-Reply-To: <1ddf673283e93e83d912066f2241b976@208suo.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--sesJufGAkiPhMEHr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2023 at 03:06:47PM +0800, sunran001@208suo.com wrote:
> Fixed error: 'do not use assignment in if condition'
>=20
> This patch fixes error: 'do not use assignment in if condition'
> in drm/nouveau/iccsense

I guess this is checkpatch fix, right?

>=20
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> index 8f0ccd3664eb..2428f3d6e477 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> @@ -322,7 +322,8 @@ int
>  nvkm_iccsense_new_(struct nvkm_device *device, enum nvkm_subdev_type typ=
e,
> int inst,
>             struct nvkm_iccsense **iccsense)
>  {
> -    if (!(*iccsense =3D kzalloc(sizeof(**iccsense), GFP_KERNEL)))
> +    *iccsense =3D kzalloc(sizeof(**iccsense), GFP_KERNEL);
> +    if (!*iccsense)
>          return -ENOMEM;
>      INIT_LIST_HEAD(&(*iccsense)->sensors);
>      INIT_LIST_HEAD(&(*iccsense)->rails);

Your patch is corrupted (tabs converted to spaces) because you're using
Roundcube. Please use git-send-mail(1) instead.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--sesJufGAkiPhMEHr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZKvK2QAKCRD2uYlJVVFO
o30SAQCBQ0XJUZtYK5k23vpkl8YQStJLMGNiuEo8Wulk+Ne03QEAkGbjMCU8DRCz
Ohcbe1uBj+CW/b2kAyogZavYb8WBBAE=
=5wr9
-----END PGP SIGNATURE-----

--sesJufGAkiPhMEHr--
