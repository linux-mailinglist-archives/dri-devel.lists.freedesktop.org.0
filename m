Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E386997E9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 15:53:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F8010EDBC;
	Thu, 16 Feb 2023 14:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D385C10E31F;
 Thu, 16 Feb 2023 14:53:09 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id bi19so1898456oib.2;
 Thu, 16 Feb 2023 06:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pQYLZn0bQAL+yoROTgZjs5gfeNZ6HZmmMBdCUxpu0fU=;
 b=S/t6Rm+/iIWUBvAg+mq74Pn8wXnKGCZmK2vnjgnbpv5UR3w8oH5NKJZwxYFKuClEgU
 2aLXa6fpACCBr8nzhkE32hDuOTmnGdyKYHT0DBbYoGkY6TzXh1AtaEkD38AtAoxahP+d
 onFMvmSxs1aoywi/2HLYkbRxDqOGx0SURD3YqPy3Z7ki9dXnSk2I1q+PxcTKvHCmtNaK
 zYEoQyasZPenKd0XwdqGOOpYs4J7KH2KXTvaKRlR34Yov3jl8OsnScqguNxyQhRFxEzn
 DRRR+pFcdFMaysgAhaaGhvVlmQap632MfnZbE1Vbr3ax7pBlzwXjP6nql6GQFqngiwJK
 SnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pQYLZn0bQAL+yoROTgZjs5gfeNZ6HZmmMBdCUxpu0fU=;
 b=z092aveWw75onE1QlhgD6/tGxkoW38vQriwwdVrkBEkrkTJukBTJUAaSzgpzwOGU8E
 xIRoCqGsnLAPdCqXvlwjV+3SBkyehPESBpadbiu18MeZsoRovf+N3xi8eVVkkZp4yFAD
 xepIOOOCCGLvAYYs1ft+YeuKCExR56BgiNz3H7sIfVFgK504FcdxwdzN93XKVG4irgur
 sB/Vbwj/3eTW+7FQ11tUFfziGEzTsD/1uLvi3xnHSvBRIS4IqUSBxTfSnlb6JSQRbgl6
 LetMvBA/Dr96ucOB08cjLfxxb8kKCmVGQg0h4dKptP2ek2O1o/OwWN6qtBgr1KstD3F7
 8big==
X-Gm-Message-State: AO0yUKWlRt9Tz+W9Dyqxc6jiCovTs+E2AvYyrDf+y2TDweqSiS2IWwOC
 A9VtQ1qeTZQ/2dD1y/p9paAkIRIjhO6rmHnzeCU=
X-Google-Smtp-Source: AK7set9+635aGGSGXuMavk+jxtmZTf8z5uamIZF5wF94ONM5UsNDW03w287rSqyPCDuCfLS6m0HCo582oc5Yj18ZayA=
X-Received: by 2002:a05:6808:2007:b0:35b:d93f:cbc4 with SMTP id
 q7-20020a056808200700b0035bd93fcbc4mr209182oiw.96.1676559189108; Thu, 16 Feb
 2023 06:53:09 -0800 (PST)
MIME-Version: 1.0
References: <20230216102856.11987-1-orlandoch.dev@gmail.com>
In-Reply-To: <20230216102856.11987-1-orlandoch.dev@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Feb 2023 09:52:57 -0500
Message-ID: <CADnq5_OMA3+FXwUB5eK=Y3qcGW1xNY6RjQAtywT3_bh6HmJztA@mail.gmail.com>
Subject: Re: [PATCHv2] drm/amdgpu: register a vga_switcheroo client for
 MacBooks with apple-gmux
To: Orlando Chamberlain <orlandoch.dev@gmail.com>
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
Cc: Aun-Ali Zaidi <admin@kodeit.net>, Evan Quan <evan.quan@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Aditya Garg <gargaditya08@live.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Kerem Karabay <kekrby@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 8:45 AM Orlando Chamberlain
<orlandoch.dev@gmail.com> wrote:
>
> Commit 3840c5bcc245 ("drm/amdgpu: disentangle runtime pm and
> vga_switcheroo") made amdgpu only register a vga_switcheroo client for
> GPU's with PX, however AMD GPUs in dual gpu Apple Macbooks do need to
> register, but don't have PX. Instead of AMD's PX, they use apple-gmux.
>
> Use apple_gmux_detect() to identify these gpus, and
> pci_is_thunderbolt_attached() to ensure eGPUs connected to Dual GPU
> Macbooks don't register with vga_switcheroo.
>
> Fixes: 3840c5bcc245 ("drm/amdgpu: disentangle runtime pm and vga_switcheroo")
> Link: https://lore.kernel.org/amd-gfx/20230210044826.9834-10-orlandoch.dev@gmail.com/
> Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>

This needs ifdefs around the apple_gmux stuff so that it will build
without the gmux support.

Alex

> ---
> v1->v2: Use apple_gmux_detect()
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 2f28a8c02f64..ef8b996f0622 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -35,6 +35,7 @@
>  #include <linux/devcoredump.h>
>  #include <generated/utsrelease.h>
>  #include <linux/pci-p2pdma.h>
> +#include <linux/apple-gmux.h>
>
>  #include <drm/drm_aperture.h>
>  #include <drm/drm_atomic_helper.h>
> @@ -3919,12 +3920,15 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>         if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
>                 vga_client_register(adev->pdev, amdgpu_device_vga_set_decode);
>
> -       if (amdgpu_device_supports_px(ddev)) {
> -               px = true;
> +       px = amdgpu_device_supports_px(ddev);
> +
> +       if (px || (!pci_is_thunderbolt_attached(adev->pdev) &&
> +                               apple_gmux_detect(NULL, NULL)))
>                 vga_switcheroo_register_client(adev->pdev,
>                                                &amdgpu_switcheroo_ops, px);
> +
> +       if (px)
>                 vga_switcheroo_init_domain_pm_ops(adev->dev, &adev->vga_pm_domain);
> -       }
>
>         if (adev->gmc.xgmi.pending_reset)
>                 queue_delayed_work(system_wq, &mgpu_info.delayed_reset_work,
> @@ -4029,6 +4033,7 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
>  void amdgpu_device_fini_sw(struct amdgpu_device *adev)
>  {
>         int idx;
> +       bool px;
>
>         amdgpu_fence_driver_sw_fini(adev);
>         amdgpu_device_ip_fini(adev);
> @@ -4048,10 +4053,16 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
>
>         kfree(adev->bios);
>         adev->bios = NULL;
> -       if (amdgpu_device_supports_px(adev_to_drm(adev))) {
> +
> +       px = amdgpu_device_supports_px(adev_to_drm(adev));
> +
> +       if (px || (!pci_is_thunderbolt_attached(adev->pdev) &&
> +                               apple_gmux_detect(NULL, NULL)))
>                 vga_switcheroo_unregister_client(adev->pdev);
> +
> +       if (px)
>                 vga_switcheroo_fini_domain_pm_ops(adev->dev);
> -       }
> +
>         if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
>                 vga_client_unregister(adev->pdev);
>
> --
> 2.39.1
>
