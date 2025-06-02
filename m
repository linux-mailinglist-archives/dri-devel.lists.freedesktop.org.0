Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83229ACA814
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 03:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA9B10E02B;
	Mon,  2 Jun 2025 01:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UtgN/58S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8721410E02B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 01:28:33 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-7399a2dc13fso4858585b3a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Jun 2025 18:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748827713; x=1749432513; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rIuuG42987mfkoJzwQaJbrpT4E2UM7n24cZCLeM9y+o=;
 b=UtgN/58S8gX1d3HJnEAu584D1Bf5tbQVqrMbrttPbIBzG8cKPFVma2cML2vm57YYRK
 LLzn0Vl14esc5rUSbPm3vOUZaMABnNbANO5b5IDqGbERuFLJcsgixK85PuybGLaCZMJ+
 5vl1p3rnMhPgL4p4+2VFpR4UZ+ENCBm5DCUV74EZLVA3euFBPHOeyfcF0Qw+FdbndNb2
 ZsjKwU5IKnRy4THg9xSdhu65I7b3aI07cng9/aB1FFY+qIludS2ulzfheISvyfCx08WU
 apkDLZGzv0K5bmqkJm9j1iEfJrRc0YO96gZb65kVgrh8taeQYKzYdvP63lnqMh5S5+Q3
 RxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748827713; x=1749432513;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rIuuG42987mfkoJzwQaJbrpT4E2UM7n24cZCLeM9y+o=;
 b=OUXEjtJ2gyvCHhQEN2dhyBGCID+QV0jCWKqEswkJAOUAqq4HtJAptm1TM/QDC1gVh2
 8QI7Yto/uppJcUgcPtZFHPy+bXQiegDjir3mnsD/rArhm0TlZY4AYEbNWxFwrI2b59sw
 gLXtgYSKA0H8WYd33DI/1kqHPS44p6dxMxoapLAqd41hAMOTLifbK5gOytYmHn+CTBT6
 4Jm0daFRYs7oi5eGryKIWiKLcpuxVklqbUPKmv/Lgv5Ap3GaE77b+dTlEfbr/B8HuDtP
 JC7G+jC+ihf1tEumJVWpSBCqiUAfHhEWAutqAwrh8Ya0wDnHpQ31jRjFwBZXoL5txuHk
 l5yQ==
X-Gm-Message-State: AOJu0YyPqMktCOmfUoYd3uLqI9oYq07u6oEk19ic8Hse6FJ3oGSZZzBt
 eI+U99TnrCDBgBl/Erh3JqiGX9NKpGnqnfg8yfp9sS7qoKpU6NndrRAl
X-Gm-Gg: ASbGncsLjQ9zjQzx1XaRqZRfkc/G7LB12yY+/nxfTs79R9qz6U59eU3npRL50gyLprs
 GzBERIKYQxTVICf+hJ5QCPwuLyw6HsMZKPlYGvIlJyk9cXvv5rF172uBfWi3MhXHfouLyspuaRy
 qT220ynX6rWJtni/pvGdjtL2HfmkUA+nY25lDlDKn2SrK/0T1iBeUXe0gsdD6lrP+tEMwlaLA1n
 jQNEF9XSwxfZhDAv76Eryg/zdov0NMlJTZPCC3UgB+P+1Cyk12uyDkq3XLQiUd8bw0t8oAcwjrZ
 TwmmcPA7BsmhyejRxXVzHjTW2XSBVa6TJwNikNjX0IpS4YxRnmeEMcDvwL+ZxQ==
X-Google-Smtp-Source: AGHT+IEBKCmgKDbpBseOlmrgXxmiDooBrj9LseBav0q71CMCKp7QIsKPUb/WVhWv1cwtRXM5cn0jGw==
X-Received: by 2002:a05:6a00:809:b0:736:3be3:3d76 with SMTP id
 d2e1a72fcca58-747c1c2f569mr12167910b3a.17.1748827712939; 
 Sun, 01 Jun 2025 18:28:32 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747affafab3sm6468548b3a.88.2025.06.01.18.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 18:28:31 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 590B24209E8C; Mon, 02 Jun 2025 08:28:30 +0700 (WIB)
Date: Mon, 2 Jun 2025 08:28:30 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm: add overview diagram for drm stack
Message-ID: <aDz-Pq4eMAYmzqsJ@archie.me>
References: <20250601-drm-doc-updates-v4-1-e7c46821e009@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0m9bGV+m6U5l6pls"
Content-Disposition: inline
In-Reply-To: <20250601-drm-doc-updates-v4-1-e7c46821e009@gmail.com>
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


--0m9bGV+m6U5l6pls
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 01, 2025 at 06:18:47PM -0400, Abdulrasaq Lawani wrote:
> Add an overview diagram of Linux DRM architecture for
> graphics and compute to introduction.rst
>=20
> Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
> ---
> <snipped>...
> diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/intro=
duction.rst
> index 3cd0c8860b949408ed570d3f9384edd5f03df002..a8d3f953a470180b395ec52a4=
5d0f3f4561424e0 100644
> --- a/Documentation/gpu/introduction.rst
> +++ b/Documentation/gpu/introduction.rst
> @@ -14,7 +14,45 @@ including the TTM memory manager, output configuration=
 and mode setting,
>  and the new vblank internals, in addition to all the regular features
>  found in current kernels.
> =20
> -[Insert diagram of typical DRM stack here]
> +Overview of the Linux DRM Architecture
> +--------------------------------------
> +::
> +
> +        +-----------------------------+
> +        |     User-space Apps         |
> +        | (Games, Browsers, ML, etc.) |
> +        +-----------------------------+
> +                      |
> +                      v
> +        +---------------------------------------+
> +        |    Graphics APIs   |   Compute APIs   |
> +        |  (OpenGL, Vulkan)  |  (OpenCL, CUDA)  |
> +        +---------------------------------------+
> +                |                   |
> +                v                   v
> +        +---------------------+  +-----------------------+
> +        |  User-space Driver  |  |    Compute Runtime    |
> +        |  (Mesa, AMD/NVIDIA) |  |  (OpenCL, CUDA, ROCm) |
> +        +---------------------+  +-----------------------+
> +                |                   |
> +                +--------+----------+
> +                         |
> +                         v
> +                +-----------------------+
> +                |   libdrm (DRM API)    |
> +                +-----------------------+
> +                          |
> +                          v
> +        +-------------------------------------------+
> +        |     Kernel DRM/KMS Driver (i915, amdgpu,  |
> +        |     nouveau, etc.)                        |
> +        +-------------------------------------------+
> +                |                       |
> +                v                       v
> +        +----------------+     +-------------------+
> +        | GPU Display HW |     | GPU Compute Units |
> +        +----------------+     +-------------------+
> +
> =20
>  Style Guidelines
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20

The patch LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--0m9bGV+m6U5l6pls
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaDz+PgAKCRD2uYlJVVFO
o9tLAP0Sow5tlzIKu7aF+0vKKkRtHELvknXuFL5ejOAt+TAvmQEAiYUMmJTAcXAz
YTpp61irGM5dwEpWDqxDhJ0J+PspnAE=
=L4Sj
-----END PGP SIGNATURE-----

--0m9bGV+m6U5l6pls--
