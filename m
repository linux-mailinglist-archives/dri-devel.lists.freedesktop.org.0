Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7CD6ACEF6
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 21:13:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE8B10E45B;
	Mon,  6 Mar 2023 20:12:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791F210E090;
 Mon,  6 Mar 2023 20:12:52 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-176d93cd0daso3338740fac.4; 
 Mon, 06 Mar 2023 12:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678133571;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UbyaZV7b8A27RO9P/Ml4RDfO75mDyTcd6vBEpKPjQxc=;
 b=KtV2l90tYkf/jvdSRHt7ZTjxthhAr8goSAYQZrJePJMc5/fRLZlyEm3hkXC5HhZva4
 R6IVTamH7c1SKnPPABHoQwOV/bftY5EsJDtmUNViFgjWxvH3S1K1w06+zlIQGygzYoVY
 8GlzIgdhwE5OhJczR5og8tzwYG0ySUIBWn1v2aPMBneiFkTYmWS5KGMpr03jL5nwsQAz
 CywoHDKK24lRqVWxpyuCm09SjFDlxHB5HMOClPckudCW6zthiWtwkxg/qEZaODVllBJK
 Te56K0L7SN5lDH0kcDA1ozBFvZD4FJs0nKp9LvAgFikjr+a8bYOQxVR0GhRJbvSwBnNm
 nkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678133571;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UbyaZV7b8A27RO9P/Ml4RDfO75mDyTcd6vBEpKPjQxc=;
 b=OKdCG1QDWR6VEnnxpluJ6eKnVKzw+vVK9aGVKwG2kG5YsebIikH/g6dRtVrl6+4vF0
 Ac+RHEWh0iCAJ/U0dH7As4OgqVtyLw95/09CoLi7ZjAwNOGKhvzvS1FcjALx0dGgwi5R
 x+xI6eU2FHTlIzSGe36wf6Ki42objqzZsdvNsPceKmbNwEre79wOtYTBYm8gcRYOSX4n
 kCoD/v4U9YsVxuEblg28yZeXA822RwcRbkb0WznvhX2hf+32k7EIbgG3kXXGPizOs+QM
 3onbWaRdkvw74Meyx61LzT77dmxZaxLipIw80ex6ouIKyAEnLMyLgh0ME5TIbCQB4U4n
 +MSQ==
X-Gm-Message-State: AO0yUKWOAuHup3Ieyv40D3BlonrbW/QOkc+AvcPUvFliNwjjV9jKBtiy
 uyBzdf/rjjm2WJ4vNNgIndLa190DnKvIPHpFG0k=
X-Google-Smtp-Source: AK7set+YxOwffgDMviQZHk9Ibnf6sl0nJK1oL10kk9xJO36ZJx+KOaq+Uh4do7+YaiVbeHNPEmU9/DKUucAdaR4qLf8=
X-Received: by 2002:a05:6870:9597:b0:176:4750:554b with SMTP id
 k23-20020a056870959700b001764750554bmr4315870oao.8.1678133571521; Mon, 06 Mar
 2023 12:12:51 -0800 (PST)
MIME-Version: 1.0
References: <20230303113423.3819-1-orlandoch.dev@gmail.com>
In-Reply-To: <20230303113423.3819-1-orlandoch.dev@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 6 Mar 2023 15:12:40 -0500
Message-ID: <CADnq5_MCYLDxFmjk6HZfSkQ-GXmduE7=gv2sbBg0uNkKLTsDrA@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] drm/amdgpu: register a vga_switcheroo client
 for MacBooks with apple-gmux
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

Applied.  Thanks!

Alex

On Fri, Mar 3, 2023 at 6:35 AM Orlando Chamberlain
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
