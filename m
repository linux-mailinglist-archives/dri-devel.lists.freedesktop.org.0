Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DCEADCC20
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 14:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAE410E398;
	Tue, 17 Jun 2025 12:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BTJvGWc+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F154289048;
 Tue, 17 Jun 2025 12:59:46 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-5242f137a1eso1565562e0c.1; 
 Tue, 17 Jun 2025 05:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750165186; x=1750769986; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IJGnTu2P8k2zWLpKT9gQ0C6Ynav6qAdbDTnXBuG6SzE=;
 b=BTJvGWc+mHLqv3AD9dzZ4GLtgmB83Szqb9hMlGAvu4ZY3WUgHUyrhCin9bJ9Qw7wGw
 Ya6QIZsRcxd9bLoOalyrP2FJiHGyG3O06b3MnQBUpFcPo3+/fU7nLZ3ddFg0BH5eSuyV
 eXVUcWlVxfF3b2q7zuqZNQfZVp4TkufdwBfZyDwlSe23KXTIouZSH5xz4Kxbp5xD1Rec
 wpFl9DNMr/E//PRO7E4ejgiBKDgipVmwrnqDjTitqNKlGAjv6k4ZnrGSuZFLrGJwfaBa
 Gi/oYde9TsyAq2u92xVxACPrMNaFUyV3i5MYpq5xcyBH7oyUv3thqq3Uiw5zW/1jLE+m
 AN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750165186; x=1750769986;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IJGnTu2P8k2zWLpKT9gQ0C6Ynav6qAdbDTnXBuG6SzE=;
 b=PaBp2EBEy5lNXMQET1AbplzRuuYqai+wi9nsQicYnXRrtlnELK0GdICmFH3iZjRL+l
 4no8LYI7xELm8Ux9uDFeQ4bJ9Q56ZKpWvPYuJ5+5Zz05n1HzvQ3exkJTNH3PezSQWplv
 RUj4hbqVngw3Mdc5JZrTZ/fcEAHxoeUXjduVzhrNWOvhYJ83Hc/uYRLZTeddsn6WyIVe
 JLk6oKcWQ2RjQJbBVk8DAYAbbGaC388teHDuiDvmwfiERcGsSqB3OOi7ar2i1QvspsYl
 m07xhihUUmPRndPVOg1VgBqKSGOZNIHAdLy7zbWdxIcYQbzRcBdDV/wzue3qrAhM7aiR
 pomw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5VmopJT4PjEuq4KNPwRmiP/HnGTsf8YRbq/XtynS7QZgflypc97UXJHhYd7rKmcy2AByrEvMvujTZ@lists.freedesktop.org,
 AJvYcCVsX9rgnbHBwZ2W0OEzSVe9aDwDAg8+cotxFym9c5kho+lY+cUMeFIVCtpI0PXKQOvrLMqXeiZnJ0E=@lists.freedesktop.org,
 AJvYcCWETi/M1G5mgL1UCLJaxBOEm2MjhE8H18HcHY/2gjJl8/5AsQ+hQTHt9/ZLVUlx5mni0JheFmmhisuAL5w=@lists.freedesktop.org,
 AJvYcCX2RAszt+lIsMu+jheIiMbbWOi3l/boi0QPVeLlanCC+Mf2QR3FxMYwLb1y7evCyXwEmCzAU1biXA==@lists.freedesktop.org,
 AJvYcCX8ftvWuLJoJZfWlZlXGzLH1TEqXoBSLvtqi+Wb+TDk4RkpIRNUE0WELj3/CS/sPED+BDkyum0uQs0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtBfBEpONO8xwJ6eUY076Durd0h7aD26hry2sMfo8iycQ20SkF
 DpfpdahlzgYTdsV9/oQTI1u4HCn5+i7qWTn8QuZLEVRxgZOu4wUH1pdrUUSeCaGM++PUrVKk59s
 QQy4jf0pACy5SgLOMU8M1RhzLlsRDL40=
X-Gm-Gg: ASbGncuvwDlaj313rsPcITg3hF0n1Qw6pnFbtms3eLWUoM8jTUQ3qSEm+xX31SYjrBp
 vD8zADA6fLQgu93EhzUy5pyFNGhOFwjXaQ1eAPVvz8gpBzaPwL6L/TQmKUPwvGKnvh+MXVb7Z7J
 mmbH6CiAEYftXi/R8A0OtjKMSwTf2vu8bMwZNUPSuCtg==
X-Google-Smtp-Source: AGHT+IFyDxk9ofOoSE1jUdDwuXC6uj68bPw86gFHeN0xbFulbam2J1M/auQRgbuNa5uXdcywAXE8tSUc/+x2hYqgo2M=
X-Received: by 2002:a05:6122:4586:b0:52f:47de:3700 with SMTP id
 71dfb90a1353d-53149677e4amr8402312e0c.5.1750165185838; Tue, 17 Jun 2025
 05:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250613090431.127087-1-tzimmermann@suse.de>
 <20250613090431.127087-8-tzimmermann@suse.de>
In-Reply-To: <20250613090431.127087-8-tzimmermann@suse.de>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 17 Jun 2025 21:59:08 +0900
X-Gm-Features: Ac12FXy1YqAOwtksyoMPU_mcRXzK8GOxRWP5F_To6gWRQ1V5y95DviShSwJIG6g
Message-ID: <CAAQKjZOiz3Z42N_GEPzqU=CCfim+Z7oCuyxuji6Guj_dKYsimw@mail.gmail.com>
Subject: Re: [PATCH v5 07/25] drm/exynos: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org, 
 maarten.lankhorst@linux.intel.com, geert@linux-m68k.org, 
 tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org, 
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 xen-devel@lists.xenproject.org, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
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

2025=EB=85=84 6=EC=9B=94 13=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 6:05, T=
homas Zimmermann <tzimmermann@suse.de>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. No alignment required.
>

Acked-by : Inki Dae <inki.dae@samsung.com>

Thanks,
Inki Dae

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_gem.c
> index 4787fee4696f..ffa1c02b4b1e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -11,6 +11,7 @@
>  #include <linux/shmem_fs.h>
>  #include <linux/module.h>
>
> +#include <drm/drm_dumb_buffers.h>
>  #include <drm/drm_prime.h>
>  #include <drm/drm_vma_manager.h>
>  #include <drm/exynos_drm.h>
> @@ -330,15 +331,16 @@ int exynos_drm_gem_dumb_create(struct drm_file *fil=
e_priv,
>         unsigned int flags;
>         int ret;
>
> +       ret =3D drm_mode_size_dumb(dev, args, 0, 0);
> +       if (ret)
> +               return ret;
> +
>         /*
>          * allocate memory to be used for framebuffer.
>          * - this callback would be called by user application
>          *      with DRM_IOCTL_MODE_CREATE_DUMB command.
>          */
>
> -       args->pitch =3D args->width * ((args->bpp + 7) / 8);
> -       args->size =3D args->pitch * args->height;
> -
>         if (is_drm_iommu_supported(dev))
>                 flags =3D EXYNOS_BO_NONCONTIG | EXYNOS_BO_WC;
>         else
> --
> 2.49.0
>
>
