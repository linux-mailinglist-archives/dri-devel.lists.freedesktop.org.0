Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 017B17E1994
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 06:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BAF10E261;
	Mon,  6 Nov 2023 05:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDAE410E261;
 Mon,  6 Nov 2023 05:15:50 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6b44befac59so3888516b3a.0; 
 Sun, 05 Nov 2023 21:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699247750; x=1699852550; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wJQuj+yw5AtCsm3Nh3eaEJ8IPjFc0cjx5pVXpkaybko=;
 b=CMybkdB4jrrTL119qMesmNBviyxoUSPrJ1URyyQ5UVVxafTCgEwKp2hDUlbaj3GTn2
 bxJ/PJcvwf2r8DuGc6OsRU7Ksr4vKqdZaK+YpMFZ3RK5d/a5L7ln37RQRpzF1m/Yydpj
 lezGJyUasfqV2N5+C97sP5JDhK7GTwosstUb/jDLk5wCsvrxSRIl532PDpPJZ4bOHTif
 RADAeQyioVOkrOO+Y4xwWzeoQZYMayI3qMci8ZO56cvd2lHWiQMtotFaJCz8MlrEhxKw
 PXp1l9QY6iY1GskWz/URs+SUiKQJcOdQL9x2eQ5y5EKaVBhNAqaqbAN7pWRqn4rrrO+r
 sx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699247750; x=1699852550;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wJQuj+yw5AtCsm3Nh3eaEJ8IPjFc0cjx5pVXpkaybko=;
 b=KjvE5yPq/PQUgyGmP2tgavJoyieSb5MtNSMUxqVsCMUi91QzB/cTJuNUZqn/ufVZ5B
 nD2NR1uCwWmuwvRnYWxOGpuTGDARZSP1kLlUjELfhh5gFiMCGm0Dbz+B9/ynMis1iBJy
 61o/SeyflVKDKNFbym/wfv7v4meCaHahnnFVPhKAlP1tyZh9i1hkvydSzIwif1ljSQ2+
 6ReYVW8XDX2dnuxcI+nBetTKhmUW/k6YY6In6RRJptrQxLL18DDcRriQC9didCxYNZFE
 AfgrfRNlhiRcGPSLENkOn7Xq7bMXs6BLfjbXy7HeOnNxTiV37MJZ6fWOe3E2k2Yr7fnK
 fKqg==
X-Gm-Message-State: AOJu0YyQ9KH/8DIcFYsp7vsOkB2G/qtHoqFu6Vu390jWiokwhPps1Wjg
 bD3hw+MTCfNL0rX/sLghb6Q=
X-Google-Smtp-Source: AGHT+IFJnPm4yurMc99aQj3qffQVoJNmBJcK7sbQ+SdUH+x3YGKqHbHy1aOCEnKMvznjVmoguV3Pzw==
X-Received: by 2002:a05:6a20:2587:b0:181:a5ff:2dfa with SMTP id
 k7-20020a056a20258700b00181a5ff2dfamr11831872pzd.5.1699247750411; 
 Sun, 05 Nov 2023 21:15:50 -0800 (PST)
Received: from debian.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 s133-20020a632c8b000000b005ab281d0777sm4748640pgs.20.2023.11.05.21.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 21:15:49 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
 id EE5B1822370C; Mon,  6 Nov 2023 12:15:43 +0700 (WIB)
Date: Mon, 6 Nov 2023 12:15:42 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Hunter Chasens <hunter.chasens18@ncf.edu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] drm: amd: Resolve Sphinx unexpected indentation warning
Message-ID: <ZUh2fuCjmgle3vd9@debian.me>
References: <20231105210044.70371-1-hunter.chasens18@ncf.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Z3YYlR3KMg8w41Vy"
Content-Disposition: inline
In-Reply-To: <20231105210044.70371-1-hunter.chasens18@ncf.edu>
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
 amd-gfx@lists.freedesktop.org,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 alexander.deucher@amd.com, evan.quan@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Z3YYlR3KMg8w41Vy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 05, 2023 at 04:00:44PM -0500, Hunter Chasens wrote:
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/=
amdgpu_pm.c
> index 517b9fb4624c..703fe2542258 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> @@ -990,11 +990,14 @@ static ssize_t amdgpu_get_pp_features(struct device=
 *dev,
>   * the power state and the clock information for those levels. If deep s=
leep is
>   * applied to a clock, the level will be denoted by a special level 'S:'
>   * E.g.,
> - *	S: 19Mhz *
> - *	0: 615Mhz
> - *	1: 800Mhz
> - *	2: 888Mhz
> - *	3: 1000Mhz
> + *
> + * ::
> + *
> + *  S: 19Mhz *
> + *  0: 615Mhz
> + *  1: 800Mhz
> + *  2: 888Mhz
> + *  3: 1000Mhz
>   *
>   *
>   * To manually adjust these states, first select manual using

LGTM, thanks!

Fixes: 615585d09b33 ("Documentation/amdgpu: Modify pp_dpm_*clk details")
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--Z3YYlR3KMg8w41Vy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZUh2dgAKCRD2uYlJVVFO
o8u3AP9EGukcdCE9j7syJTFV3j9ZJFi0tBknTBxXtF86voVT7QEA7mRPIMBMAUYJ
/kqkXet60szZtgn55HRclmw6vzSt9g4=
=qHmW
-----END PGP SIGNATURE-----

--Z3YYlR3KMg8w41Vy--
