Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD2B7E4D9D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 00:57:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9334110E189;
	Tue,  7 Nov 2023 23:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF46C10E189;
 Tue,  7 Nov 2023 23:57:30 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6c33ab26dddso4663205b3a.0; 
 Tue, 07 Nov 2023 15:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699401450; x=1700006250; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2KudK+PVMmmjq0H50mDCqvHMKAjy6NjrP5mENlT6IeI=;
 b=LFGQJaEmLg9pfsJdireKIgUrqc7zE8ZYjM+MwjNnxEFhkzCz/K7wklcqCauealBMaU
 sLfch56SzKMuDz8LbVIIV0n6AIWuqyEGguhpwbybwq9EMbTwuoxYC5YCVuv5ievT9jaS
 862FbovL2g95mCn9PKID4JewbpBnLhATfLLOXnhERSiU4xz92cnMDURrcHQ79zIR9bla
 3IZPnDK8Km6n33C8bF5aIya3hkXYhCvhDy3EOn1WU+GnPVwkA+ved3XiNUulh2SpA11L
 NUqChTMlWn6LqAthHby+PMo0jgEmPn7Z37AVlRY5ye+aZyDMQ0S5SdHySqTaR6gUcJbZ
 0VWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699401450; x=1700006250;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2KudK+PVMmmjq0H50mDCqvHMKAjy6NjrP5mENlT6IeI=;
 b=ee8IgIVHVrFnaI3KcTfUTtbNVo9AXDrCBChIG1B0imkpjZfs/tB21Fo1ZjtrqkCSEb
 QDK4pahQ+7c6aW35kDxSJGh3jiYyairGy1W4ZAIce3LwJJc21iFLc/rHAg4actRVIYgR
 ekDHMbaHk3mW73mx1CZd0jSqTqb8gndnPBar0HsX8oj/v1SIx3htY8AeqteQhUqf2ZNl
 Wd8NNuqvL3ksAZ7efdVosVJnuNsLL2BCdVeJwkUnK6BgKjjNxjQq0HuBtXxKq3T2CfsV
 HBcRBjneFDi+GK0nQmFWFhAvUPsf39FVfJvZwIKSPP3HKJ5C+ltK5sPWnyjXi4rZxW/0
 RvYA==
X-Gm-Message-State: AOJu0YwgXi2y+ee/RjnvBVfO+TRTWj0BrM5/3WV4jA0Sn9YuNcElwL1s
 x54PSSdKsQx/XPG8g1qK6Gg9ZTE+60M=
X-Google-Smtp-Source: AGHT+IHGNAErG58V9Xptsi9rhCr540MMtqj5pUEVIhkp8UyJJWdw2+ugBMjHDeueIBYjz3yn6Bm33Q==
X-Received: by 2002:a05:6a00:1401:b0:68f:ece2:ac2a with SMTP id
 l1-20020a056a00140100b0068fece2ac2amr196394pfu.27.1699401450307; 
 Tue, 07 Nov 2023 15:57:30 -0800 (PST)
Received: from debian.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 q22-20020a63d616000000b0059d34fb9ccasm1856065pgg.2.2023.11.07.15.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 15:57:29 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
 id 2117D819DE58; Wed,  8 Nov 2023 06:57:25 +0700 (WIB)
Date: Wed, 8 Nov 2023 06:57:25 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Hunter Chasens <hunter.chasens18@ncf.edu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] drm: amd: Resolve Sphinx unexpected indentation warning
Message-ID: <ZUrO5aRPUux_QchV@debian.me>
References: <20231107162830.36856-1-hunter.chasens18@ncf.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kv+cup+JVOlwZ+Z6"
Content-Disposition: inline
In-Reply-To: <20231107162830.36856-1-hunter.chasens18@ncf.edu>
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
Cc: Lijo Lazar <lijo.lazar@amd.com>,
 Linux Documentation <linux-doc@vger.kernel.org>, Xinhui.Pan@amd.com,
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kv+cup+JVOlwZ+Z6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 07, 2023 at 11:28:30AM -0500, Hunter Chasens wrote:
> Resolves Sphinx unexpected indentation warning when compiling
> documentation (e.g. `make htmldocs`). Replaces tabs with spaces and adds
> a literal block to keep vertical formatting of the
> example power state list.
>=20
> Signed-off-by: Hunter Chasens <hunter.chasens18@ncf.edu>

Nit: Whenever a reviewer has offered a Reviewed-by: or Acked-by: trailer,
you should include it in the next reroll unless there is substantial changes
in the reroll.

> ---
>  drivers/gpu/drm/amd/pm/amdgpu_pm.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/=
amdgpu_pm.c
> index 517b9fb4624c..576202bf64f3 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> @@ -989,12 +989,13 @@ static ssize_t amdgpu_get_pp_features(struct device=
 *dev,
>   * Reading back the files will show you the available power levels within
>   * the power state and the clock information for those levels. If deep s=
leep is
>   * applied to a clock, the level will be denoted by a special level 'S:'
> - * E.g.,
> - *	S: 19Mhz *
> - *	0: 615Mhz
> - *	1: 800Mhz
> - *	2: 888Mhz
> - *	3: 1000Mhz
> + * E.g., ::
> + *
> + *  S: 19Mhz *
> + *  0: 615Mhz
> + *  1: 800Mhz
> + *  2: 888Mhz
> + *  3: 1000Mhz
>   *
>   *
>   * To manually adjust these states, first select manual using

Anyway, LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--kv+cup+JVOlwZ+Z6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZUrO3wAKCRD2uYlJVVFO
o9PfAQCQoOysBPfyyDkpbc/cw6GEYb9qbjfdqZzmsgFQRMiMNgEAswr/n/nO5KLA
SIGTnW07DyMIEw/LEG799c6gZANsJwc=
=he+5
-----END PGP SIGNATURE-----

--kv+cup+JVOlwZ+Z6--
