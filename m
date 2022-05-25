Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 782CC5345A6
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 23:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773E210E70C;
	Wed, 25 May 2022 21:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7665D10E70C;
 Wed, 25 May 2022 21:08:26 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 s11-20020a4ab54b000000b0035f0178dfcfso3999239ooo.7; 
 Wed, 25 May 2022 14:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TaCYLf7kRedBe+2EoHW9DrMiYYCRi0awPrgRA1lZnEk=;
 b=blydpWvrsBy9tEUoVG4ffsFO/xJP4nrXC+7rieZbPqWER6T3GKKOsWoMKYs5XYHSIH
 Ibvd8k71EtDFjvFDjGYiRHkrQMKVc8YATLu9aJZUYstDfrBCqcn+MpXiJxA4sSWfjgGS
 FXWZKD8sfRRwlNvzIvAlcIeLexpGvPG6uVoc365XEs1WV08dtsIt4XgFz7vSsgQLFzzg
 7/ARMXSkky0+5LOP857bXubBqb9hU2Z77O0C4pc1tiWR7fD9kP/fhWYwUZYSaeuwOnbM
 1VAvOftERug7SSsXdoY01tCKDBJBCPRx09xh54YXmJ66v2JNkylW2LvkUuboUnTtk0Ik
 bGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TaCYLf7kRedBe+2EoHW9DrMiYYCRi0awPrgRA1lZnEk=;
 b=8Ehh8/TeR0rNRAfjgHVFKr8hDW10kqJRfCZwTvY9bt8MvDxZ9MN4S2ApJCot0eZ6lF
 fx3Q4Zk41rr8jrBEvC+aWPrQNJLgZW6a/WBTsOU1Vw/N5fBpt0CkurqDwY9ROfZvZ+EH
 idhYUE6/wjqxf+5MsebfsKcpuuDreiW/L4iBoCQMez4+f6HDien0bxzLlHeJDFVZAEZz
 Tij/72xTSWMR1MR5PCrNBrKVLqfuUkaOcGW/w1LsDdvwodSG7u2O6rmgBTXxK3FRWoJ7
 5ZcVF0pm1DGIl+F6xQTDNMR1t6tqG10qRxf7S42/uLMUPXN9l2vPd1UCxCEquFAFcFK5
 /tBA==
X-Gm-Message-State: AOAM530KeBD7YHxod/RuNqvUm60gU+OQ5PN8TDF7M2ZfCbjC/iRdVKFW
 BFsduEQDUqC0Oib4e+Q9WR3/txNwWFZ4qdY7e9Q=
X-Google-Smtp-Source: ABdhPJzbqKxYwN6Ji1qWni1pwlJhdkinYGiZvGryQoI5D2KswOZYkUHSjFnHi5UMtATztbRrWUIHys0RHaMggMtMZHY=
X-Received: by 2002:a4a:2857:0:b0:40e:5d49:da1b with SMTP id
 c23-20020a4a2857000000b0040e5d49da1bmr11718303oof.23.1653512905762; Wed, 25
 May 2022 14:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220525190914.60544-1-kernel@mitchellaugustin.com>
In-Reply-To: <20220525190914.60544-1-kernel@mitchellaugustin.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 25 May 2022 17:08:14 -0400
Message-ID: <CADnq5_Oeb81h+x+9XoTX_8fDDxAvPgGPAHndjNq7jB+bbvENfg@mail.gmail.com>
Subject: Re: [PATCH] amdgpu: amdgpu_device.c: Removed trailing whitespace
To: Mitchell Augustin <kernel@mitchellaugustin.com>
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
Cc: Kevin Wang <kevin1.wang@amd.com>, "Chen, Guchun" <guchun.chen@amd.com>,
 Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 xinhui pan <Xinhui.Pan@amd.com>, linux-media <linux-media@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "Quan, Evan" <evan.quan@amd.com>,
 Lang Yu <lang.yu@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Shaoyun Liu <shaoyun.liu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, May 25, 2022 at 4:38 PM Mitchell Augustin
<kernel@mitchellaugustin.com> wrote:
>
> Removed trailing whitespace from end of line in amdgpu_device.c
>
> Signed-off-by: Mitchell Augustin <kernel@mitchellaugustin.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 49f734137f15..c531c05163cf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3365,7 +3365,7 @@ bool amdgpu_device_asic_has_dc_support(enum amd_asic_type asic_type)
>   */
>  bool amdgpu_device_has_dc_support(struct amdgpu_device *adev)
>  {
> -       if (amdgpu_sriov_vf(adev) ||
> +       if (amdgpu_sriov_vf(adev) ||
>             adev->enable_virtual_display ||
>             (adev->harvest_ip_mask & AMD_HARVEST_IP_DMU_MASK))
>                 return false;
> @@ -5762,7 +5762,7 @@ int amdgpu_in_reset(struct amdgpu_device *adev)
>  {
>         return atomic_read(&adev->reset_domain->in_gpu_reset);
>         }
> -
> +
>  /**
>   * amdgpu_device_halt() - bring hardware to some kind of halt state
>   *
> --
> 2.36.1
>
