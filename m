Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5629F3938
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 19:48:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D21710E75F;
	Mon, 16 Dec 2024 18:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JAytg6hJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AC210E757;
 Mon, 16 Dec 2024 18:48:03 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-216406238f9so4757805ad.2; 
 Mon, 16 Dec 2024 10:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734374883; x=1734979683; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ljZDBe+woNif3z5aKXbwbDAeIWtDR2ec5K+hUlmzxA8=;
 b=JAytg6hJ4CSmBcQgP+9wid2xUAq1A8MZ9MthOf9jwwI1vQPom3rR/UWs1lGOTrTuXj
 R8mIfoIa9KIk3UygRbA7Xub925i2vcLK3uLQ0qKakO7FFftk4cEz4GtcJzkx1sEMtccw
 UuG08VDMe85g4Dkc3uNoJspGRPHQqueq+jT1zemQR8vSSfcQhS4DB7R5v8O4SJ9shArj
 MsUO8DCtjCfSVPPiw7H7QDJ9KeX/6xgxcgTeA2TRxSQzb+d8xfODy892oTX7deNHiz/f
 K7GlRqKaNYTrJ3OIeO3TPWu8EGeDCTSP/gILHA2MytMxNuNC8iLaPV4aeknhdjM/OVRO
 XVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734374883; x=1734979683;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ljZDBe+woNif3z5aKXbwbDAeIWtDR2ec5K+hUlmzxA8=;
 b=M6BXrlJnFD9HT9LSBkx9InbHhUSyGrKJdAWnCUi6+nhz8yfdvLl8qrUmO0heHG3pnU
 q9uoxGyDFbpEtziaVbVtxyTptlofRMMRhY6Scfhi/MfI2rSvf+GEhUvNVCZOi6fYguEL
 8YySpQnIdmy2yAXsP6pBkHrxQN8N6nNFWt/B4bw4NuhvVGVtgD7+bRaFZjz4KN7cAM3o
 Lm23sRt4F7CX2oSiaH95hMrR182KXNMKtfYDx7kvl3xWpZCEYcglFuhe6B8Q0ogcfKdY
 PxzNFeGLYYVlYL/Rf9mLcb737HHfXq4zHPC/ebJH3reSARn9CJNK6fQiAeXhlRaNooLJ
 CpKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAZp3bNbtJ4kSk6PpcXGU7evXUMNqWS0P5BigykpyOmvoVvMV4LhvhJjKDm507TQZkrR8I3ywL@lists.freedesktop.org,
 AJvYcCVrqw/VSN9cPh24IvjcUuo82tVZsCzchK1cM/n6ap0xNpJbGRH7SuQlqeLjfERj28QbQNjtUuNJ6zgA@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDHgrS+rRuQdYpKNRnxChImKox85eT3Z99xfkCZkqhDwg/VjTs
 VLvjsXwZhpxxCxgRirE/e2nCHGbUKQCFAVnYbpSl+VL75+EGBdiOJV2WaG6yYQU3EyHj0cqfsvR
 O4zTT/FVZlTuVx6cGrb1qdrAMN2o=
X-Gm-Gg: ASbGncuj/2UXqyfgqSW+4bB/5sCwYqF/TZ0QHW7oen+Bzl7UWg22oZsSGEvT1YmkEiX
 0vdVyz1nUHJmCW3s/Pe1nst8BVzDLfjaKP+cuwQ==
X-Google-Smtp-Source: AGHT+IFOlkCaNMhKwLIVGjAXnp0uVRePJEeesKmKskiAI+JnZrKpt43DpCfH7EY6KVkdOn4CDQWf6sVzJyMr5F4k2yg=
X-Received: by 2002:a17:902:ecc8:b0:20c:df08:9a78 with SMTP id
 d9443c01a7336-21892ab4fb8mr69822205ad.13.1734374882852; Mon, 16 Dec 2024
 10:48:02 -0800 (PST)
MIME-Version: 1.0
References: <20241215122857.927606-1-karprzy7@gmail.com>
In-Reply-To: <20241215122857.927606-1-karprzy7@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Dec 2024 13:47:51 -0500
Message-ID: <CADnq5_NroGebRLLpdde9kvyeer8JWo1Yy9_0An3DO6TosPMfqg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix potential integer overflow in scheduler
 mask calculations
To: Karol Przybylski <karprzy7@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, srinivasan.shanmugam@amd.com, 
 Hawking.Zhang@amd.com, Jack.Xiao@amd.com, lijo.lazar@amd.com, 
 Jesse.zhang@amd.com, tao.zhou1@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Applied.  Thanks!

On Sun, Dec 15, 2024 at 7:38=E2=80=AFAM Karol Przybylski <karprzy7@gmail.co=
m> wrote:
>
> The use of 1 << i in scheduler mask calculations can result in an
> unintentional integer overflow due to the expression being
> evaluated as a 32-bit signed integer.
>
> This patch replaces 1 << i with 1ULL << i to ensure the operation
> is performed as a 64-bit unsigned integer, preventing overflow
>
> Discovered in coverity scan, CID 1636393, 1636175, 1636007, 1635853
>
> Fixes: c5c63d9cb5d3b drm/amdgpu: add amdgpu_gfx_sched_mask and amdgpu_com=
pute_sched_mask debugfs
> Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gfx.c
> index 69a6b6dba0a5..8fb6c5f6a060 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -2050,7 +2050,7 @@ static int amdgpu_debugfs_gfx_sched_mask_set(void *=
data, u64 val)
>         if (!adev)
>                 return -ENODEV;
>
> -       mask =3D (1 << adev->gfx.num_gfx_rings) - 1;
> +       mask =3D (1ULL << adev->gfx.num_gfx_rings) - 1;
>         if ((val & mask) =3D=3D 0)
>                 return -EINVAL;
>
> @@ -2078,7 +2078,7 @@ static int amdgpu_debugfs_gfx_sched_mask_get(void *=
data, u64 *val)
>         for (i =3D 0; i < adev->gfx.num_gfx_rings; ++i) {
>                 ring =3D &adev->gfx.gfx_ring[i];
>                 if (ring->sched.ready)
> -                       mask |=3D 1 << i;
> +                       mask |=3D 1ULL << i;
>         }
>
>         *val =3D mask;
> @@ -2120,7 +2120,7 @@ static int amdgpu_debugfs_compute_sched_mask_set(vo=
id *data, u64 val)
>         if (!adev)
>                 return -ENODEV;
>
> -       mask =3D (1 << adev->gfx.num_compute_rings) - 1;
> +       mask =3D (1ULL << adev->gfx.num_compute_rings) - 1;
>         if ((val & mask) =3D=3D 0)
>                 return -EINVAL;
>
> @@ -2149,7 +2149,7 @@ static int amdgpu_debugfs_compute_sched_mask_get(vo=
id *data, u64 *val)
>         for (i =3D 0; i < adev->gfx.num_compute_rings; ++i) {
>                 ring =3D &adev->gfx.compute_ring[i];
>                 if (ring->sched.ready)
> -                       mask |=3D 1 << i;
> +                       mask |=3D 1ULL << i;
>         }
>
>         *val =3D mask;
> --
> 2.34.1
>
