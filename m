Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A54EDA9E576
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 02:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5025010E2BA;
	Mon, 28 Apr 2025 00:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XMrWSIO6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BC210E2BA;
 Mon, 28 Apr 2025 00:22:47 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6e8f7019422so44584406d6.1; 
 Sun, 27 Apr 2025 17:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745799766; x=1746404566; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/HJCWQZW4hGQGf67LTdXxkCl/qK/WpfJzH4jOsILNh4=;
 b=XMrWSIO6wYtLe79nPjQO3AXsaJSJflNsWUqtFGKCphMDqI9HnZ7F8SUR52b92tjf+u
 GoolzQuGVuSyxLiPzDAbCf694ZATj3p1jRDWGcJFqkx8kJw05Twjf2LLOVsa6ZZsW15Y
 HlK+ahjvqgnfAqbcm1SbPd+JjB0bDmKQOcFIsNQxekvngi9mJk89XZElKuat0nE/SdoZ
 HW3NCvnLrBxDszXIL2peOH6rgImz47yoPqFFD/nWP20FBqewoqIaYUqsRRadWEvYop3U
 w6GkwNBwlQUFlnT3coE1HngUH/ht8ar1+HSFP1D5c/f3BjRvCqd5zwKfyFF/ipEO0VAU
 Eo1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745799766; x=1746404566;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/HJCWQZW4hGQGf67LTdXxkCl/qK/WpfJzH4jOsILNh4=;
 b=PC/tXEZ36yAMkMAjHi4mYAgaPKV/1rcNK935PJ2IjBWEhnLY2YVv7gXqMjziny6Qqe
 4Jk4oVc0f9vXiif8aCH2M4VGR5j+lZfzczq9IlNHEPDBpdhh2qiz3KvPok3lUhcO0L9q
 Lcw1+nv96rFyYdcX6SFaOVRuVexIVH+KAI1YfcEZxnDW3JikMSYUaewW81ue3p8kmnio
 xGvz95Pjt8G3txOxoLYMroi8gO7CdPoT93iNQixEWVrnlM2qTYMdb8ygZ/mGBRE+g7GZ
 U5KB5ILWQA9rarcT/1us8jOVv3ggyVr+8VoAG7n3UyUDSH0otz6/SugebPjpiCVsKO7R
 coKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUH+Nc3bAoR+/t37wAFNYX9XO48mrnwBTJR8eEjDzfp+/u52giE42uFAAuzo0mCYRx7UjHVrzn1/s4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybNKRDctNJGlLqYJ46aYCpIoHLN2pxjNvdGN3vOjBklBfWkyWm
 4j/kYsqCQVTaxBo2CgOFc1wGz1MpP4v3i7Rnyo/f87qhGj2dGnG3
X-Gm-Gg: ASbGncsaw4mN9HhOH0UaPuZOcpkIgRrcQ1dYF9sdToIUbbM15eR4MCe+m7Rcj5MY4Ta
 CusHXS2fa9meBs0tamiJlZIyO/d/+hSZMe5UEdQPXhY4nJq4FecykeoTI8kyhZ815FHq8TaAgFw
 G4I1FYuzoHFuE8Eck0q9cNw1EEHyF91SWabVHZWl7dGgFpi/TRbEGMb83QdX4PTLivBr08O1mqR
 dIJV5u+SAPb0FhBnaWPqNiqwE8LwWw1DQTSvJ21qNKg4FbdOLljrAdRztRV+Vr+3N99h7Siyczj
 7RVxligay+TCJAvFUTxzhNUPLedAIkGTBv5TjkhC
X-Google-Smtp-Source: AGHT+IGoZE/scbIyCQO8VQ2U32mc4lOUJMKFNJupy8GAMuIBcPUOdIOTT/ACOpZAR4tz/4tAoQuvnA==
X-Received: by 2002:a05:6214:c84:b0:6f4:ca4f:43f8 with SMTP id
 6a1803df08f44-6f4d1eeb8f3mr135298516d6.6.1745799765883; 
 Sun, 27 Apr 2025 17:22:45 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f4c0ab1131sm51998826d6.115.2025.04.27.17.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Apr 2025 17:22:44 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 8CBBF420A693; Mon, 28 Apr 2025 07:22:37 +0700 (WIB)
Date: Mon, 28 Apr 2025 07:22:37 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Ruben Wauters <rubenru09@aol.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/amdgpu: fix unexpected indentation in docs
Message-ID: <aA7KTVwwI3Wvz_JI@archie.me>
References: <20250428001249.112238-1-rubenru09.ref@aol.com>
 <20250428001249.112238-1-rubenru09@aol.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="YFeX9WsCB8go/Toj"
Content-Disposition: inline
In-Reply-To: <20250428001249.112238-1-rubenru09@aol.com>
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


--YFeX9WsCB8go/Toj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 01:01:41AM +0100, Ruben Wauters wrote:
> make htmldocs reports unexpected indentation on line 1119 in the kernel
> doc comment. This was due to alignment of numbers (except the minus)
> which caused indentation. This also had unintended effects on the
> compiled documentation, with breaks and indentation after the -1 option.
>=20
> This patch fixes the error, and changes the format of the options to be
> more in line with others in the file, while still keeping it readable on
> the code side.
>=20
> Signed-off-by: Ruben Wauters <rubenru09@aol.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index b9a1ef343c79..6ddfd3ace2ba 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1116,10 +1116,10 @@ module_param_named(rebar, amdgpu_rebar, int, 0444=
);
>  /**
>   * DOC: user_queue (int)
>   * Enable user queues on systems that support user queues.
> - * -1 =3D auto (ASIC specific default)
> - *  0 =3D user queues disabled
> - *  1 =3D user queues enabled and kernel queues enabled (if supported)
> - *  2 =3D user queues enabled and kernel queues disabled
> + * (-1 =3D auto (ASIC specific default),
> + * 0 =3D user queues disabled,
> + * 1 =3D user queues enabled and kernel queues enabled (if supported),
> + * 2 =3D user queues enabled and kernel queues disabled)
>   */
>  MODULE_PARM_DESC(user_queue, "Enable user queues (-1 =3D auto (default),=
 0 =3D disable, 1 =3D enable, 2 =3D enable UQs and disable KQs)");
>  module_param_named(user_queue, amdgpu_user_queue, int, 0444);

Already addressed by [1]. Thanks!

[1]: https://lore.kernel.org/linux-doc/20250427023625.14327-2-bagasdotme@gm=
ail.com/

--=20
An old man doll... just what I always wanted! - Clara

--YFeX9WsCB8go/Toj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaA7KSQAKCRD2uYlJVVFO
o2vHAQDWQrSZ+f+jeX8db64tRLxnS5g+NAZR4wUfI0JnrIhWPQD/ZdlwDSG9slj3
0GjiSMBt5SG5kq6GPFJ615LABFDFtAM=
=2nVY
-----END PGP SIGNATURE-----

--YFeX9WsCB8go/Toj--
