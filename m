Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3FC8CD9A8
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 20:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F3010F1E2;
	Thu, 23 May 2024 18:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b1u6Fhc6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DDAB10F1E0;
 Thu, 23 May 2024 18:07:22 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1ec92e355bfso26512015ad.3; 
 Thu, 23 May 2024 11:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716487642; x=1717092442; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JFvamzZglehHBEolPcL4rA0lvGrignK3Mpdrws3oBZY=;
 b=b1u6Fhc6z8i8oSmJhIM/0yGNjvEg9ZOTF5t9O6DAxUKqJR3OrZifj8ch91fty2i3ay
 8Alz60hXF1xI48riy4sd5Aqr+0bPvqKrpi7rHRNhgtgDYmIjU2QZttTGuvDmN3tw2Ukt
 PEhzzgk3UxAHcmCF2xM66Wqis/Jq90diqJZbNPdHvlrkjqnVd45uczEOjkQHamd88RAU
 mFqook9MRpkr4gsbxJmIPb/Jwd/Jji9DMAMqP7CUi+hBCn/YEN60+ZSd4MkazWnn2Xk/
 fl3z+t+3QGB4d0Hv+6jNwTeC/Jm+mlo0L3xCeTJk5jiKP92acbGs7b36p23qlJg6foEJ
 bstw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716487642; x=1717092442;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JFvamzZglehHBEolPcL4rA0lvGrignK3Mpdrws3oBZY=;
 b=SJuTRmcrgH2xOI063DBlFVoQYjYygMU0k1Tmc2NeHUfqEymOJXso2CozrP8N52lHPy
 O+gxLA2MWnl26ltfq8qjZbNYYDIckKKU2Z24uqLATLvHcMul9yGhteaRL5a9xcBnAEQu
 1+qmfrVUKjIUlnGphG4+bSqwDVp8ZTftBAHqVM2bvDGm6rMUxJfgUBDq7o3JUXdCOXrA
 vz87uqONEBIrgUQ1BvwRkk/OjZzBgq0bjMnc0pH/AZo4/V8bmeEUnAIOFvgZ9ThQtiNv
 FJDe0IgnhiVx0c+fR7blmQdB0LNYzJaK3ex1v3ofzn1ez4TbIQi4zdetHnUHVeV56O3z
 hgUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRzQtqpuDL0PJV921Jns/fVvLAQJur/0eaN3eS4bXBRimcuurVtaJ3CnEGEDMlYy2YeHPDGAy9um+nNdWsNYOMqCh6mx8qS4L6ed7QeXMOgEQfNySal61SLws0uyTxawRd8eAt8MtKLqNPfYU=
X-Gm-Message-State: AOJu0Ywz65+Hk0AtIxgb17XvM5jzjvPLQXNzn/ggkJKcJz0Sgy65xbc6
 1STGH4ARKrXHJEKq4hhq5psxzG+2w4Xvb0ND8UkXgGtjiUHkCar2VeGDFO37CFMtZqq0dUNGIYi
 27wFKk1vIlwU6Q/gegnjj3tv/3Aw=
X-Google-Smtp-Source: AGHT+IHW5lnRSRg4PCHbuQEIiRJQV3sSxY1XjBl+l0OmlWGBWLh6ELSgenhRJyncHAlp7WNyAce/8AdoA6d3i3/47I8=
X-Received: by 2002:a17:902:ec8a:b0:1f3:356a:a300 with SMTP id
 d9443c01a7336-1f44872bbccmr1422585ad.24.1716487641700; Thu, 23 May 2024
 11:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1716479340.git.jani.nikula@intel.com>
 <4b9ca4a1bd8e77f2d9b912b4af5d4fbdec13e801.1716479340.git.jani.nikula@intel.com>
In-Reply-To: <4b9ca4a1bd8e77f2d9b912b4af5d4fbdec13e801.1716479340.git.jani.nikula@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 23 May 2024 14:07:08 -0400
Message-ID: <CADnq5_MDPH-WxpucjQpKsCAk8mKa75upbcGN3KJo_dqKts4kTg@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/amdgpu: fix -Wformat-truncation warning in
 amdgpu_gfx_kiq_init_ring()
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Pan Xinhui <Xinhui.Pan@amd.com>
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

On Thu, May 23, 2024 at 11:51=E2=80=AFAM Jani Nikula <jani.nikula@intel.com=
> wrote:
>
> Enabling -Wformat-truncation yields the following warning:
>
> ../drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c: In function =E2=80=98amdgpu_g=
fx_kiq_init_ring=E2=80=99:
> ../drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:332:61: error: =E2=80=98%d=E2=
=80=99 directive output may be truncated writing between 1 and 10 bytes int=
o a region of size between 0 and 8 [-Werror=3Dformat-truncation=3D]
>   332 |         snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d=
",
>       |                                                             ^~
> ../drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:332:50: note: directive argume=
nt in the range [0, 2147483647]
>   332 |         snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d=
",
>       |                                                  ^~~~~~~~~~~~~~~~=
~
> ../drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:332:9: note: =E2=80=98snprintf=
=E2=80=99 output between 12 and 41 bytes into a destination of size 16
>   332 |         snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d=
",
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
>   333 |                  xcc_id, ring->me, ring->pipe, ring->queue);
>       |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Silence the warning by checking the snprintf() return value.
>

Already fixed with this patch:
https://patchwork.freedesktop.org/patch/594864/

Thanks,

Alex

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> ---
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: Pan Xinhui <Xinhui.Pan@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gfx.c
> index 1d955652f3ba..92744d0d2c10 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -329,8 +329,10 @@ int amdgpu_gfx_kiq_init_ring(struct amdgpu_device *a=
dev, int xcc_id)
>
>         ring->eop_gpu_addr =3D kiq->eop_gpu_addr;
>         ring->no_scheduler =3D true;
> -       snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
> -                xcc_id, ring->me, ring->pipe, ring->queue);
> +       r =3D snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
> +                    xcc_id, ring->me, ring->pipe, ring->queue);
> +       if (r >=3D sizeof(ring->name))
> +               dev_warn(adev->dev, "kiq ring name truncated\n");
>         r =3D amdgpu_ring_init(adev, ring, 1024, irq, AMDGPU_CP_KIQ_IRQ_D=
RIVER0,
>                              AMDGPU_RING_PRIO_DEFAULT, NULL);
>         if (r)
> --
> 2.39.2
>
