Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D76A1454F56
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 22:27:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6161E6E892;
	Wed, 17 Nov 2021 21:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2346E546;
 Wed, 17 Nov 2021 21:27:17 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 g91-20020a9d12e4000000b0055ae68cfc3dso7089150otg.9; 
 Wed, 17 Nov 2021 13:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uWeefiJ5livj3e6BWt4hjU8yGGELMqtOre4WtaX2Gbs=;
 b=LuY9E+Jqf/LZGNHiCVIRq34c0ZTvIsrfZzICm88+fWPe6/zPKQ8zoSNt0/iAf1yd1z
 EMZMe7myvAZJ9DkwmByAaxBd1aLyAol+E1ZoFlBapH4t5msPbk2vj+XxPvl4+HClES5K
 I1RnAU/uVkAtGumAiu4iAlkTimBRULRULvXsAR2woyD0LRyPCM4k1bngbqhmsSRhlz6a
 GgffeAwnMR7+PXRzZ2WkgaSHU9f7goYZK6QvoeM6kpLWwiUNuuQwCyKpmpYf2fez8gSY
 DL1BlOStJBB1WfcbAEJ30AIa8HrmAIqlcW/r5DKBFIlWCCbv1iJNcK9D5OR6yt8eQXk3
 bdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uWeefiJ5livj3e6BWt4hjU8yGGELMqtOre4WtaX2Gbs=;
 b=4VZBI0rF8t/UEVcnkZI4jMWZrk9INX5C4qoDGYQvrufH/UlYOz9UOT6G3ZvcJ39UFE
 stv9HE7xXeq7uYByjxjC1j5QTMw4Uj6P0Xcb4jqpYNp2gn9zW4h9MqUmLEWeFjc85wTd
 Yh8pRFB6X9LGZHRbcX+Kc7bFRBaN8q+a1ypBZJtW54KdYRbfFUcyZEOzHuCfmUJKgbWa
 J8kIzQkF5YeJ0SOAD4VyN9FN/8v6xr5V5V4gLAuP4gU22+bKfKTeCgq254tydeDs1RUQ
 eGWHmsrP7Xwhy/6EW8wXrRUtUfgjBgRbNNQfuHUjXj0JiWahrNV6XW92w+Ql3xyQf7PR
 h0nA==
X-Gm-Message-State: AOAM532f8Tn+foqeSse6RYiaHhQ15Ob3npoY/JquUEwwQiwN19TUHYgq
 t121hTnNcbUhuwCA59oF3uu1C9WGeKAyS5jCqtxHvY5M
X-Google-Smtp-Source: ABdhPJwecPSYncmBG+lhhVpKmPa76s4Aj/GYsqYX6jde/d7KTVbtQ4h15ZYf5HAvnyUU4qObMUmVMz1kgr8CXTRW+ak=
X-Received: by 2002:a9d:67c1:: with SMTP id c1mr16988381otn.299.1637184436945; 
 Wed, 17 Nov 2021 13:27:16 -0800 (PST)
MIME-Version: 1.0
References: <20211115120910.10318-1-bernard@vivo.com>
In-Reply-To: <20211115120910.10318-1-bernard@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 17 Nov 2021 16:27:06 -0500
Message-ID: <CADnq5_P8DDkzHxySARAdOckgwvqnO3J_mL8-kpGD5udqa-t-eA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/amdgpu: cleanup the code style a bit
To: Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jiawei Gu <Jiawei.Gu@amd.com>, Zhigang Luo <zhigang.luo@amd.com>,
 David Airlie <airlied@linux.ie>, Bokun Zhang <bokun.zhang@amd.com>,
 Jingwen Chen <Jingwen.Chen2@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Peng Ju Zhou <PengJu.Zhou@amd.com>,
 Lee Jones <lee.jones@linaro.org>, Candice Li <candice.li@amd.com>,
 John Clements <john.clements@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Monk liu <monk.liu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Nov 15, 2021 at 7:09 AM Bernard Zhao <bernard@vivo.com> wrote:
>
> This change is to cleanup the code style a bit.
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> index 04cf9b207e62..3fc49823f527 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> @@ -283,17 +283,15 @@ static int amdgpu_virt_init_ras_err_handler_data(struct amdgpu_device *adev)
>
>         *data = kmalloc(sizeof(struct amdgpu_virt_ras_err_handler_data), GFP_KERNEL);
>         if (!*data)
> -               return -ENOMEM;
> +               goto data_failure;
>
>         bps = kmalloc_array(align_space, sizeof((*data)->bps), GFP_KERNEL);
> -       bps_bo = kmalloc_array(align_space, sizeof((*data)->bps_bo), GFP_KERNEL);
> +       if (!bps)
> +               goto bps_failure;
>
> -       if (!bps || !bps_bo) {
> -               kfree(bps);
> -               kfree(bps_bo);
> -               kfree(*data);
> -               return -ENOMEM;
> -       }
> +       bps_bo = kmalloc_array(align_space, sizeof((*data)->bps_bo), GFP_KERNEL);
> +       if (!bps_bo)
> +               goto bps_bo_failure;
>
>         (*data)->bps = bps;
>         (*data)->bps_bo = bps_bo;
> @@ -303,6 +301,13 @@ static int amdgpu_virt_init_ras_err_handler_data(struct amdgpu_device *adev)
>         virt->ras_init_done = true;
>
>         return 0;
> +
> +bps_bo_failure:
> +       kfree(bps);
> +bps_failure:
> +       kfree(*data);
> +data_failure:
> +       return -ENOMEM;
>  }
>
>  static void amdgpu_virt_ras_release_bp(struct amdgpu_device *adev)
> --
> 2.33.1
>
