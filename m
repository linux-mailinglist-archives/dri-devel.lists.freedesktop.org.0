Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2049AC37D3
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 03:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5C610E243;
	Mon, 26 May 2025 01:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UB6z5BsG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5854010E243
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 01:51:53 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-73c17c770a7so1692900b3a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 May 2025 18:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748224313; x=1748829113; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/DKj8oNkwRWAiy5DwXiV4r+Z3UZ5RRrUNHD6WtNis8g=;
 b=UB6z5BsGctvCmmpsC3nnnTBymBHLlnBrDsYx4/s3XCF9VwYFh2A4/3kee6mlF08OnT
 eGLxPM/k6o+Y9ey1Djsj0tIWgC4qP6GX7jzVNOFut4QLtM5C3NILfnm8VCwF1cwRub7q
 kY3L7PqsOQvtpLHj2kbtiYgKF8rz43e/aI70IsCI4H7U6rP95d4EvrffuDjLVvm3/dKN
 1T6CHPAFCiXYC3lVmnA2PYTpy0giAMck9QuMF9TBYE2wrPT3W1479hfZO622wn2iLQCj
 X8WhNFFgByzVdFjdwt3Ks9vu4NQ95UKs/IcPqjFhWP9bQZdBm6btmIa6LpIgTEeoLeAc
 yyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748224313; x=1748829113;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/DKj8oNkwRWAiy5DwXiV4r+Z3UZ5RRrUNHD6WtNis8g=;
 b=Nzoc/A82kfxB3ESCwdDX5epbluW0ztzmJxqVZIJfQgc0Oka6ft1SNEQOBhjWNcn2tO
 uPj1tgnaX9pg51q+fptmH/eoZLKVT4J9KFM9ofdCLjI0BVx1EHUZruh4IMnnTrcdypF4
 FeafIC2nwaJGdJgGVxr91pDOW/Qs3IYhyT8zXQiqI+DBVt8IZm8Rwmo54NWknwL+Zgk5
 LzrXmSnKoNyfHNLcP+f/PdEscYKdkfZrdJE1rA6YddywHR832abnO9LudQ0zloOKXDYP
 Q7YOBNMLcmMZI0HjdjyaYuM/ibQZnRWUL0MmeLDQwhyadEQteh15FfCSRejNyJ0VppC4
 8Y0g==
X-Gm-Message-State: AOJu0YyRhJEim8DYTFR01g0GShGG8TygkY5odbe0ohHwungw8LOzJI3f
 t7ddHPcTNzIOkSvQPoMfetMvN8R4cDfzg9PAk/azJ2M+uIvLfnOUsRAu
X-Gm-Gg: ASbGncs/gMhIHJX3RsfT0LX9sWOroXGlnSnTjQ3jioU/GTuKnxKb1fK9nO5TDOIFo1b
 becsjGmz4Rhmc0JG08cTCvubw0FNnoGzf0I9y9H9La1ih6GFU2P5atL0e7MxPXVeNdIytHZfRju
 ZRmM/9QnpwROVbzsGX1IhSoc7aauqYTlTlBJwG3rcM7VsgOaiWQ6w8dYGUQioGV/F2jksFjZuND
 DA3UbnL/x2eV/h4a80026NidHPBiYHqo/I9lD2grKonOn1WdUWtMysjhZIJIORtyFekz11md0mP
 XDLM+Ng3zVU6u3teWhKDrPy1kRx1wi9quRrMyWu1uRIC/weq/XrH5v8wgoh4+g==
X-Google-Smtp-Source: AGHT+IEej+6PkcO2/DXbswdOAlQW3W/DYX0Gbdx4UIAQjE96Wze4Ix7GvGI6pQ+GrMV3odHkPK89sg==
X-Received: by 2002:a05:6a00:2905:b0:742:a9ed:a3d6 with SMTP id
 d2e1a72fcca58-745fe035fa7mr9505358b3a.17.1748224312672; 
 Sun, 25 May 2025 18:51:52 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a96def30sm15993990b3a.20.2025.05.25.18.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 May 2025 18:51:51 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id E85A84230C03; Mon, 26 May 2025 08:51:48 +0700 (WIB)
Date: Mon, 26 May 2025 08:51:48 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm: add overview diagram for drm stack
Message-ID: <aDPJNBTDmHoZ-z1d@archie.me>
References: <20250523-drm-doc-updates-v2-0-e517df152cf6@gmail.com>
 <20250523-drm-doc-updates-v2-2-e517df152cf6@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hXCUMJnyg9VmLHa2"
Content-Disposition: inline
In-Reply-To: <20250523-drm-doc-updates-v2-2-e517df152cf6@gmail.com>
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


--hXCUMJnyg9VmLHa2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 03:52:26PM -0400, Abdulrasaq Lawani wrote:
> diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/intro=
duction.rst
> index 91bb0efc96d69921a122c5265b1431fa18110a7a..2653048ad4bb0ecbc2b676295=
440442dddbabae6 100644
> --- a/Documentation/gpu/introduction.rst
> +++ b/Documentation/gpu/introduction.rst
> @@ -15,41 +15,43 @@ and the new vblank internals, in addition to all the =
regular features
>  found in current kernels.
> =20
>  Overview of the Linux DRM Architecture
> ------------------------------------------------
> -+-----------------------------+
> -|     User-space Apps         |
> -| (Games, Browsers, ML, etc.) |
> -+-----------------------------+
> -              |
> -              v
> -+---------------------------------------+
> -|    Graphics APIs   |   Compute APIs   |
> -|  (OpenGL, Vulkan)  |  (OpenCL, CUDA)  |
> -+---------------------------------------+
> -          |                   |
> -          v                   v
> -+---------------------+  +-----------------------+
> -|  User-space Driver  |  |    Compute Runtime    |
> -|  (Mesa, AMD/NVIDIA) |  |  (OpenCL, CUDA, ROCm) |
> -+---------------------+  +-----------------------+
> -          |                   |
> -          +--------+----------+
> -                   |
> -                   v
> -        +-----------------------+
> -        |   libdrm (DRM API)    |
> -        +-----------------------+
> -                   |
> -                   v
> -+-------------------------------------------+
> -|     Kernel DRM/KMS Driver (i915, amdgpu,  |
> -|     nouveau, etc.)                        |
> -+-------------------------------------------+
> -        |                       |
> -        v                       v
> -+----------------+     +-------------------+
> -| GPU Display HW |     | GPU Compute Units |
> -+----------------+     +-------------------+
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Why promoting the section heading?

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
> =20

This is not how reviews from v1 should be addressed. Instead of making
separate commit for review suggestions, you need to squash them into affect=
ed
commit(s) in v1. In this case, there should be only one resulting patch. Do=
n't
forget to send it as v3.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--hXCUMJnyg9VmLHa2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaDPJMQAKCRD2uYlJVVFO
oy74AQDPmxrQb9rYKD39w7NaTsaOldYEhp+puSEJ2KpMwsY1SAEA9lVhnB307H4N
uJLfQF9+cMButgaKwwW89bmWLnPxTQ0=
=XjDz
-----END PGP SIGNATURE-----

--hXCUMJnyg9VmLHa2--
