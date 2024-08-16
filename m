Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7721B954DEB
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 17:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA69B10E7F4;
	Fri, 16 Aug 2024 15:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z2t12zKa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D680E10E7F4;
 Fri, 16 Aug 2024 15:37:07 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-6b443880945so309247b3.0; 
 Fri, 16 Aug 2024 08:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723822627; x=1724427427; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tzNM0AA9xntFTf2RXz/yks0bBfTi9noMOikasbHbbu4=;
 b=Z2t12zKazoaAOVmV93FgdhWEJLRHdDSFGKQf0q3R3Q1Te6X1JwKNcs9k/zSo6g7iuS
 g00H5cZkghK/ORO/C1d27WZkILVDzFjjFuJCX9jWxHYD72APAFM9CrV6J9IXLng72DI6
 +EzHcs5F3ETRzEmQU7xS/orYSgtlTFLEDjs68jI4qeZZeEDSUSTqaMBCZIEj5BOLFVwv
 U+j/wCWjxjMWbhwyXmZinGyzyn53UxmiN9xn/KEE6g2TAaiO1p5B2H8NYLF1Pbw6taqd
 AltDhbq2Siq+ylEAn4/bKX6efo8k87bG0nAG8opGau2+t6hr7NornCMG9l6Qg5xWgrev
 HErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723822627; x=1724427427;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tzNM0AA9xntFTf2RXz/yks0bBfTi9noMOikasbHbbu4=;
 b=ZXMezvKza1mfGKRxn11pwL2tYz9e3iHPFaQhq1/ANIGS26pxRBnQ4nCLee3Unt+U2/
 OwyxF1eW0q+uugWSrydS07XUkLGprEWESc/tMFPrSOOJpELkJ/VrjlAW675riCAmBR/2
 F1pDnnSFK9/fMH8Rs3WQWXobsO9hig5QKXUyB6Lq/W/6wtAG1bXqDUMhMkWTnA5y5Bsv
 Y6bTFQ5CJb73SMUwABGguzvdgd3PzQkefKSCDYQWdw9M7GFeFWbxyI4/UcFxJkGz3n7M
 r7nhbhdUm5Hg01d7igXjJU6NJI4lQ7lRmPCi5eilsA2BpXqQFfmbJgiecsvcuh07Pgg4
 nstQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/dSsXJMm+BETFTDVxyixHorEJ8rth/+IRFrks34fsEGfKPedDeviNg5M6KnPj8wRI0lzJ5975VTSlUh3Dgi4P5dZx+6hsovUHLKf4nrT+kXCnLYUAOxVctO+m0FCS+FwWYaalfdnKFTsY9gmrf2jsqEb3dltgdUjogvFbEdQ6a1grd584qRIPbPaAbHe7kr9TANA3RvCmIUOyz56E1DltA5DSpjLDyuzfdmxai+ixjDB43yypgb6IRJPLRoPv9iTcUAc7ajd63zmeQKnjCg==
X-Gm-Message-State: AOJu0Yy3YT7fMMPKoCiRI2+cz7z66b+Xrgm3IUiAm0FHxz2LiQWJemnO
 n03Ca7qOigRm/YNieC9SpajgboR1lxy7V42M/bGdwN1K+9M7spARAgBxM+Rfx1q/0hozIrvqRtw
 8z8FELjk6zlmyPbvkwxjSRVIWYk4=
X-Google-Smtp-Source: AGHT+IENPTqD3CAvuVgtrBE+LadrBjEy9w12rrQn3kw5b6eR3pYhJO5bQriCQH4X41FgJUosHcVqnrP21MmRdDACkJ0=
X-Received: by 2002:a05:690c:4e8a:b0:6ad:b01a:9469 with SMTP id
 00721157ae682-6b1bc3f877cmr29215657b3.39.1723822626590; Fri, 16 Aug 2024
 08:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-56-tzimmermann@suse.de>
In-Reply-To: <20240816125408.310253-56-tzimmermann@suse.de>
From: Deepak Rawat <drawat.floss@gmail.com>
Date: Fri, 16 Aug 2024 08:36:55 -0700
Message-ID: <CAHFnvW3zK0VsQKzqjncTTuNNenh6Lxr4mf2fqzX+gR1Z9i6yOA@mail.gmail.com>
Subject: Re: [PATCH 55/86] drm/hyperv_drm: Run DRM default client setup
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, 
 javierm@redhat.com, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org
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

Reviewed-by: Deepak Rawat <drawat.floss@gmail.com>

On Fri, Aug 16, 2024 at 5:54=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Deepak Rawat <drawat.floss@gmail.com>
> ---
>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hy=
perv/hyperv_drm_drv.c
> index ff93e08d5036..3077ce5470f6 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> @@ -10,6 +10,7 @@
>
>  #include <drm/drm_aperture.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_client_setup.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fbdev_shmem.h>
>  #include <drm/drm_gem_shmem_helper.h>
> @@ -36,6 +37,7 @@ static struct drm_driver hyperv_driver =3D {
>
>         .fops            =3D &hv_fops,
>         DRM_GEM_SHMEM_DRIVER_OPS,
> +       DRM_FBDEV_SHMEM_DRIVER_OPS,
>  };
>
>  static int hyperv_pci_probe(struct pci_dev *pdev,
> @@ -149,7 +151,7 @@ static int hyperv_vmbus_probe(struct hv_device *hdev,
>                 goto err_free_mmio;
>         }
>
> -       drm_fbdev_shmem_setup(dev, 0);
> +       drm_client_setup(dev, NULL);
>
>         return 0;
>
> --
> 2.46.0
>
