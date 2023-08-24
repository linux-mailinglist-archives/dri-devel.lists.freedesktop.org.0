Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6E1786BAC
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 11:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CEF010E50A;
	Thu, 24 Aug 2023 09:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D6A910E50A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 09:25:41 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-523b066d7ceso8133257a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 02:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692869140; x=1693473940;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tyUSHoKWbQNIsBIxmqoVCWEQRbWDMFnOFy94iKbdUak=;
 b=pwXWOpQe8/E9m6HQlMGOjH3MuNJBr6IwSmzWg+5BI3PHGP4ZXxVLaeFqME4LW5qUFY
 qqDZ1Yu8YbTjN+gsgF5tH8BD+JvBabWLWIrfeI+mK/EqwtzwETnRka6ewOb+IBb0Ujl0
 MN0k+evM4hrwqHfisY9A+VEf89qiYEuoy1kxZCXpN+DQUvrnVdatiUEehFAPB+gYj4Fl
 JG3Py2WQP0YwOw8wfW/pE2efdGf1d5qq1/+QYUVt9GCXxLWaO6Ae+JvhdgSB2ATwj9Uy
 ie/5Asl6bvhp53V3NWU3/yokBgXn0SILVpetp7fh7X0Oky+CpJBd1ljp5YNgDuaXhmde
 YXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692869140; x=1693473940;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tyUSHoKWbQNIsBIxmqoVCWEQRbWDMFnOFy94iKbdUak=;
 b=JEvNxixqTU/t4Cm1NbIIiEggx94Gn19/860vMYwVW0/jSoPXfh0Fo23k8LF2es6l6Y
 3rq68TdPU250qe5h4Ill+wq+wJrFyibTK1O9rs3MLZIxA1qopZ6NCPR/CKNg1MqFM7I0
 PhakLVQU43enVprpVt1o04ssxTbSKId/pNUL3wavqudu3wc/N7jUFvDpIiPcp7VH/wvt
 mHBfBaIS2nRojxGVVYt1EtjWtyAxpZZEA1LLaImSHQm0cBQHiOzg50h2f1PM0Pf9LJfm
 yWUaf87N0QevUyhMK2po2kKgkpBzDBWIDt+SdOWQ9ikH7XFuE1SBhezPPNiNjPnoyZ3O
 n6YQ==
X-Gm-Message-State: AOJu0Yxz4A13xwSIS7JUp4xZ0xBhenSriwR8ox7eUdICrthRhevxjqAr
 73SrCBT4/usqUBkVh5NG4TE=
X-Google-Smtp-Source: AGHT+IF11KMC8N7YlmdtLz0MNq7kFFR0fNws82JxXsYKp4o8hZNtASoE5WWHzb82ZVmM01q8qwDPwg==
X-Received: by 2002:aa7:c648:0:b0:525:7e46:940 with SMTP id
 z8-20020aa7c648000000b005257e460940mr12734565edr.24.1692869139822; 
 Thu, 24 Aug 2023 02:25:39 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a056402110200b005231e3d89efsm10401474edv.31.2023.08.24.02.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 02:25:39 -0700 (PDT)
Date: Thu, 24 Aug 2023 11:25:37 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 15/20] drm/tegra/hub: Increase buffer size to ensure all
 possible values can be stored
Message-ID: <ZOciEaJlHhp4xnFv@orome>
References: <20230824073710.2677348-1-lee@kernel.org>
 <20230824073710.2677348-16-lee@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/e521ON4/AmmvfkF"
Content-Disposition: inline
In-Reply-To: <20230824073710.2677348-16-lee@kernel.org>
User-Agent: Mutt/2.2.10 (2023-03-25)
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--/e521ON4/AmmvfkF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 24, 2023 at 08:37:00AM +0100, Lee Jones wrote:
> When converting from int to string, we must allow for up to 10-chars (214=
7483647).
>=20
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/gpu/drm/tegra/hub.c: In function =E2=80=98tegra_display_hub_prob=
e=E2=80=99:
>  drivers/gpu/drm/tegra/hub.c:1106:47: warning: =E2=80=98%u=E2=80=99 direc=
tive output may be truncated writing between 1 and 10 bytes into a region o=
f size 4 [-Wformat-truncation=3D]
>  drivers/gpu/drm/tegra/hub.c:1106:42: note: directive argument in the ran=
ge [0, 4294967294]
>  drivers/gpu/drm/tegra/hub.c:1106:17: note: =E2=80=98snprintf=E2=80=99 ou=
tput between 6 and 15 bytes into a destination of size 8

I wish there was (perhaps there is?) a better way to annotate that i
will always be within a given range. In practice this is always going to
be smaller than 10 and even in future hardware I wouldn't expect this to
ever exceed anything like 32 or 64, so 8 characters is already generous.

Thierry

>=20
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/tegra/hub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
> index 1af5f8318d914..f21e57e8599ee 100644
> --- a/drivers/gpu/drm/tegra/hub.c
> +++ b/drivers/gpu/drm/tegra/hub.c
> @@ -1101,7 +1101,7 @@ static int tegra_display_hub_probe(struct platform_=
device *pdev)
> =20
>  	for (i =3D 0; i < hub->soc->num_wgrps; i++) {
>  		struct tegra_windowgroup *wgrp =3D &hub->wgrps[i];
> -		char id[8];
> +		char id[16];
> =20
>  		snprintf(id, sizeof(id), "wgrp%u", i);
>  		mutex_init(&wgrp->lock);
> --=20
> 2.42.0.rc1.204.g551eb34607-goog
>=20

--/e521ON4/AmmvfkF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmTnIhEACgkQ3SOs138+
s6GK6w/9EagL8i/CuGUrZbOmpLZ0O/tWA4R2yxVjK5cDlFwSvCj1PjnoZJsOY/cr
WXRhT8GwbRv6ZFaCX4IB7Xs/m2GhTKCGcU8TlGX6mAPGyRFoBdicUI2SWGvQ3bAj
PM/3rEwujtTnzK+T3lZekjUIkgy1JTUHtYqt/naNOY8dyX/fsPZlCDxM+OsekshX
7yyjzj3rJtKBeB9aV/aicTrLHqYwsN4Igjk7d5t1hHoZOpPGxlEkeZfe3vCchyIF
ACRnwljDVFhr1yBumOliB2Ir7ZjQNt7HLzVXwf7wNNTwbLdTHxdchMWnHyCPeE0E
dbgCEGVGQp/jcU7pZNWcBUxGcwfmD03zoRg7dprKMzbK/iX69goOZr7LVjeRhNaN
sALjfX9cBQ/csylEvuZMdUYh9CzHYK1irMpQKp1Kbl1Vrq2y9mQBTwH7rzyJIjnh
vOXf+7w2UnmbrEpcbP8JTPEfRxulmSAlmXrTSrdYk5vUO6R5qv0KacxaGDpJqQ4o
opc8bJeiopJEaZBIYM1MU0M4efjuSBYmIeJVIIroUe9EleClPNhI0pRZeh/nTRLc
fExRVKi1tzXEQqgBMl+93V6ZdVH9VpJU/104/u+k2TNc5GJtwX1An353zGTgxYR3
g1rPG3XsxnrWb+5pOkht44A+TfJ35HTH/TNZBA7Jky62dQnpbQU=
=NzIn
-----END PGP SIGNATURE-----

--/e521ON4/AmmvfkF--
