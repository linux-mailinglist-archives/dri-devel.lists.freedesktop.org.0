Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7E9AC7561
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 03:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AC610E21D;
	Thu, 29 May 2025 01:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dnPfhcQP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9426310E204
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 01:28:11 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-742c73f82dfso205595b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 18:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748482091; x=1749086891; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hoeXSFYRWh2i4KgtON46+79vyPFN+5fYuOEhE49cAOI=;
 b=dnPfhcQPFirYdhl8RiioP2/I6zjTM0Hse0SXiQWzA4oY/nY5AcrvrtZ8beOaygUSHs
 ov4ibBuQTu8g4vWRVcDPxPxRFebAAlupKJ+P14y8HB5LhLFx1m+gfwp8vH2AwUwLzUDw
 P1jSYoL10RgfCAuql8AAzlepvQA2d+jOCMcWaud3f3tVok/ciGiuTWZgbghkR/a39wCi
 AiOo8tcarj0/NbrV6o1at5NrzuuFWRwLrSaCWOj+4vVZUlphWGTAHCph8k8p3WC/7WzD
 rNKImoFPGxlR3dTvHeFCY+QVnr6zV2RSijI9Hihpom2AJX3lTwda5MtxiG8re4iP3OW1
 PqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748482091; x=1749086891;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hoeXSFYRWh2i4KgtON46+79vyPFN+5fYuOEhE49cAOI=;
 b=q+zxRvIOWg+c2uRI3dtEZkjgQulVyJUE0dDG3/vcqtZL/JlrRvIRaLN9Ta2ZXVN6up
 CixpLEOpJlnIk2OMxATqMM2nZLq9xzlJ9JxT7rTOhvPnPw3d3gYhVnTiCPJMmwSJOuUu
 qUtlFW+XBrsQKq5lI5IwfD88uLoe8sc3pkQWMHVEsJ22Pd9aua8tHZnfyZEMHXkGuvIp
 cmS72qmphB/kPLzLLQosPW3bVxogf0BOSkaAGR+CJXGlhwQtdmfRkh1CPIdMUShHHDsB
 1YNlNo1IzzUvMLzXqUotBALoolNJ5/WdMF7U9oFmAhc1FAcDS+K+iFyEVBnNfU3yop8b
 8BQg==
X-Gm-Message-State: AOJu0YyZ1E9zwNahgJZZOakmMZvwrh5SAo6yMEBkH2oQr98U0452thgw
 HkOLZyr47nhy2kNOhX+2rSMRWY5LSg0YPf2MnaEixPcno/6RB7bkTEeo
X-Gm-Gg: ASbGncsBKRA+BzLleLfKaqha2GlMM2h3M7dff2GMpLnQT8OESXRXKWIpGlJiYIROuKQ
 gKZiqvpow6I5VYJ/+mkOfnfqEEi2xiqvA7Gyfhwy3Q55SkQERXiV5+yE+JI2SwurDxG+UaHh91i
 PTMOlhf8kHQMG5/2aSxKSBKVyEDxojk8Lm98/0j5katf9gY2zXzKXyuxGZm+BwL6VA+Ypn/3wey
 WOhnWM/n94mnKZj2PF8USFJ/jB/cwa9lSVF/7OKjHTGPzhVcBM3u6F2ktHu1UR/fTQLQWs9+siD
 DM1diGsJwQd5DBuxiwSn7UCOO97UhhkFoeldeszdqmY4pe/j+1cdxcA8rnQWcw==
X-Google-Smtp-Source: AGHT+IEz+1R42eNysUwZ0fqEej6CVAYfSf8TKl3yY1k7/5eS4TAR5HPasxyR4xeGfgyqO10P1uKdmA==
X-Received: by 2002:a05:6a00:3994:b0:740:a023:5d60 with SMTP id
 d2e1a72fcca58-745fe083439mr27047681b3a.19.1748482090915; 
 Wed, 28 May 2025 18:28:10 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afeab6a7sm253212b3a.59.2025.05.28.18.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 18:28:09 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 0B67041E4844; Thu, 29 May 2025 08:28:07 +0700 (WIB)
Date: Thu, 29 May 2025 08:28:07 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm: add overview diagram for drm stack
Message-ID: <aDe4J8Cmlzicggx2@archie.me>
References: <20250527-drm-doc-updates-v3-1-58e97a831d03@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aC/adGMqQaMC2iPq"
Content-Disposition: inline
In-Reply-To: <20250527-drm-doc-updates-v3-1-58e97a831d03@gmail.com>
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


--aC/adGMqQaMC2iPq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 03:17:43AM -0400, Abdulrasaq Lawani wrote:
> revert promotion of overview diagram title to that
> of previous commit in introduction.rst
>=20

The patch description doesn't really describe the diff below, which is
to add overview diagram instead. Maybe you can replace that with from your =
v1?

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

The diff itself looks good.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--aC/adGMqQaMC2iPq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaDe4JwAKCRD2uYlJVVFO
o1vSAP9RDdnvD215ocVJi8rTafh7HN5OcFggjOd1N/NN53BQMAEA1/hsLPZqX2Zd
BajmnAxuQKkeSKG/0y85fJPYpq7JNQc=
=1KWA
-----END PGP SIGNATURE-----

--aC/adGMqQaMC2iPq--
