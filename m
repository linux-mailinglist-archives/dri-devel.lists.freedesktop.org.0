Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E31F398A9A3
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 18:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCB910E0CD;
	Mon, 30 Sep 2024 16:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UIv80iqB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B9A10E0CD;
 Mon, 30 Sep 2024 16:22:11 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-6e2346f164cso33923037b3.3; 
 Mon, 30 Sep 2024 09:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727713330; x=1728318130; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uERoXlKgvrIzow4kr39O2y7mJ6EyY4bi7R1vZimkEKo=;
 b=UIv80iqB8p/00gh4dUfosW5Zswi8eHEYYVksB/nsmXux89jsr06veFxWDFlfgTrKdH
 sHIxVNs6qZBP2r4QQHti+kv19pr6XPrLMr3QL5dd16NeR9F8ZZV35t1dQwGMvrD9bFuX
 +DNC0nxfCJYQNs3cNHgI7fJujYO+6Ql+b5EtRHl4eS3b3TKWQc0HbVxWbGdmizQJnSf4
 K3hlAdckfiXtvjVXR/D1A+rJvloMccCoQB8jNuIBqCpfMOWd8wBW9NbeJZoVffx2rVsV
 IpRcfmbm06XXZZBQpEFTubG4EF9WS8Sittyy1t51rUZf5LBPy7AT0zcdKG1TJufsg6Zl
 nP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727713330; x=1728318130;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uERoXlKgvrIzow4kr39O2y7mJ6EyY4bi7R1vZimkEKo=;
 b=o4YLSWZKsPnltd3jb2/TcxJspP0t7vYahZJTkZ5WacbewGQSb9tQiuJP3qMOuAQGgI
 Q8PeBiU/t0qSTRtidCm12YqWnsG+BM80+w94laYs32a+fyM60K/oiAcphOBMAsjuLKm6
 2jT9QWBZh1WjG11+5gUAA/X9BpUfK/V4GKt0XloqRfVyHmjiEI2BckLg4qwLFu0lgtll
 8PTSpJxzx5aOH6KivZxuM2i8obLaSXsaAEiZWh4/OerYwqWG75Qu51q1cREDnlMA0YWX
 UoWdmQ9I1jnCMA4G3ZPQqJpBaFUfaMRLy0EL7GCL6inkoCEhn0AS2cqUukMPxG1pHdAf
 5VIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhacqlRaiwYqxJ8bKZXOmou1sixQcAUXCzdraDEpHt/RMYTWeEsm51qhjIgrsIPId1QU97dEOS6BLE@lists.freedesktop.org,
 AJvYcCWVI1TH3vnCQsrv8l3EgNz1fRX8ihX/dAhdLY+3pEwuseZHIpMfv/47OCaAUaVGabVw6F98+T8/5CUt@lists.freedesktop.org,
 AJvYcCWyP92iGPnEV6k4vwP8KaqnRR4jAeAXKE1gYtVkSfDovaKIO5MS41Yz9ecaVx/Y9NQLInVhh6eX@lists.freedesktop.org,
 AJvYcCX/5IfquGtvjyMp+oV/XnrrDTmp7l6e0yntb/gq0KvMwb6bs3yFZ5nEDFl/OvrQhCqhLiXv2NCCKVE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQ/coJAgzC4elF4RwoqLxpPHgYAu12yCM3zbLdPvBXoVZBVGXi
 5d+a3a0hpldOboMpkrJ2+j2/mRiJ+EE5dh73s+fNHBbAez9fWQqVy+21QEScycrnZa+GBg7Vh7n
 zFOZeBULc8O492B2k/ePbOkSmV20=
X-Google-Smtp-Source: AGHT+IH6LGQfRVLoHTpEHgoURLnMbGsh/FhCxNdlE2uAdXWKaqJ3XT+orFnkiDAnokgolLQak1eShauNoxWdW6nGLQM=
X-Received: by 2002:a05:690c:6612:b0:6e0:447:f257 with SMTP id
 00721157ae682-6e24757caf8mr95415027b3.22.1727713330446; Mon, 30 Sep 2024
 09:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240930130921.689876-1-tzimmermann@suse.de>
 <20240930130921.689876-7-tzimmermann@suse.de>
In-Reply-To: <20240930130921.689876-7-tzimmermann@suse.de>
From: Deepak Rawat <drawat.floss@gmail.com>
Date: Mon, 30 Sep 2024 09:22:00 -0700
Message-ID: <CAHFnvW0TqYDzbay_wtvC5QK7SMgXxC3sKfWQ3z7Q3eXYN9VPZA@mail.gmail.com>
Subject: Re: [PATCH 06/28] drm/hyperv-drm: Use video aperture helpers
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
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

On Mon, Sep 30, 2024 at 6:09=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> DRM's aperture functions have long been implemented as helpers
> under drivers/video/ for use with fbdev. Avoid the DRM wrappers by
> calling the video functions directly.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Deepak Rawat <drawat.floss@gmail.com>
> ---
>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hy=
perv/hyperv_drm_drv.c
> index 3077ce5470f6..e0953777a206 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> @@ -3,12 +3,12 @@
>   * Copyright 2021 Microsoft
>   */
>
> +#include <linux/aperture.h>
>  #include <linux/efi.h>
>  #include <linux/hyperv.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>
> -#include <drm/drm_aperture.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_client_setup.h>
>  #include <drm/drm_drv.h>
> @@ -126,7 +126,7 @@ static int hyperv_vmbus_probe(struct hv_device *hdev,
>                 goto err_hv_set_drv_data;
>         }
>
> -       drm_aperture_remove_framebuffers(&hyperv_driver);
> +       aperture_remove_all_conflicting_devices(hyperv_driver.name);
>
>         ret =3D hyperv_setup_vram(hv, hdev);
>         if (ret)
> --
> 2.46.0
>

Reviewed-by: Deepak Rawat <drawat.floss@gmail.com>
