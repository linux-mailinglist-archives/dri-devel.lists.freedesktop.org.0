Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CECF79C2017
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 16:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 339CE10E9E5;
	Fri,  8 Nov 2024 15:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LQbRcqxZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4096F10E9E8;
 Fri,  8 Nov 2024 15:11:35 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-539f8490856so2862331e87.2; 
 Fri, 08 Nov 2024 07:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731078693; x=1731683493; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=U5wDavXbl6kHrtWLmw1AnY676L6vtteGxwlVTc97ABE=;
 b=LQbRcqxZpjQlsIZgIjh+K5EUpAEr4Xvi+5JlwlR9WADShPqGnVllx9Tl7tw3YcUqYB
 4HqWttK7zpVteIx/nOXLgqFx/CP8sYmAsb2qQOyPipEwp6zmnqjpiFSxoVFzB3XjjY7R
 cowCNA0Ph+XYkvfpMeHJ+BBQxi4QXSqdHcQBZ/F6ahNWOzrHlziYbbgeErMSLgnArQDH
 sWuUAp/NnW9cQGKwLaJJyL2iMxHKYceq8FWqo6EIVdcLy5moaOOtY0Jt3DvzCr2sYCS1
 q8zQrRZPXf2rxzC3sYxu5KcKHsyVOV220iZg4KFE+HHxGAX2R153RmMP1tXvRrlpCdIa
 4w0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731078693; x=1731683493;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U5wDavXbl6kHrtWLmw1AnY676L6vtteGxwlVTc97ABE=;
 b=mjQUbqMp2tb3fByn3y8eOYC0F2F6Um6ZNTjjNmWZfYzlsHz67RxjhSIms8Febn3+1D
 gQj3HwmxxvvEhJnRtY0tTmYlnT+xEH+SreTQaMgrlfCG91qw0PbWMOiGZXeicqhd5EMt
 hRICdphB/oKSZJH6FJjKY0aDEEAnYeb1s722jo+hl4F7MwWD5pBZAfPhvAhTpv6IjQpa
 lF8GH6aBqpLCiEBHSdjDe9vE8hUEZfGZ/KIk0kHoKFUaSfqGblcv0aXoNfHm7NUY01Zm
 l3kpHAQWB5m+69zwUtXwONG+LYBLBeGwuH5olQhtV498wYAGXGMw93anAnCAPUSivR7a
 jN4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGcBjuRyQ2Lel1SVpAcqbEKcxxLVyD2jTawncFkmLw1QeD2rsvM99fha3UbaclNnH3XBE0EDgTsFE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYmmstEWX76PhQ/ZHaUX396JPF00abJoJ2Qq94m3yRoOqCXcsW
 2F9N0YVsLaF6ui6l7YY+cH/q7cA0KnmsxX8DwWt0VZ+odm/ot1ObxhoRDKKSEjywG/37qMt3+Ec
 feD/IyisQ/FGsWg08R0o36PP6hBg=
X-Google-Smtp-Source: AGHT+IFv1gGClUgaEFptD5aM84mK3BN5LEkQyWsHQYYxxMAYDUMP/jNYEp4MzOiR4NVSTBa+hEA59v81vDQSmAp5+gQ=
X-Received: by 2002:a05:651c:2212:b0:2fb:556c:fdfc with SMTP id
 38308e7fff4ca-2ff2021eea6mr18749581fa.12.1731078692816; Fri, 08 Nov 2024
 07:11:32 -0800 (PST)
MIME-Version: 1.0
References: <20241008191623.8171-1-advaitdhamorikar@gmail.com>
In-Reply-To: <20241008191623.8171-1-advaitdhamorikar@gmail.com>
From: Advait Dhamorikar <advaitdhamorikar@gmail.com>
Date: Fri, 8 Nov 2024 20:41:21 +0530
Message-ID: <CAJ7bep+uo5_xF13e_1mYFMf1npWw1cTbcOe+f19avpjEPfyBqQ@mail.gmail.com>
Subject: Re: [PATCH-next v3] drm/amdgpu: Cleanup shift coding style
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, leo.liu@amd.com, 
 sathishkumar.sundararaju@amd.com, saleemkhan.jamadar@amd.com, 
 sonny.jiang@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
 anupnewsmail@gmail.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

I have addressed the previous comments,
Is there something more that I need to address in this version of the patch?
I would appreciate feedback.

Best regards,
Advait

On Wed, 9 Oct 2024 at 00:46, Advait Dhamorikar
<advaitdhamorikar@gmail.com> wrote:
>
> Improves the coding style by updating bit-shift
> operations in the amdgpu_jpeg.c driver file.
> It ensures consistency and avoids potential issues
> by explicitly using 1U and 1ULL for unsigned
> and unsigned long long shifts in all relevant instances.
>
>
> Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
> ---
> v1->v2: address review comments
> https://lore.kernel.org/lkml/CAJ7bepJrm9tJJMSZXz0B_94y8817X4oFpwnrTmUHeagOFgVL7g@mail.gmail.com/
> v2->v3: update changelog and add additional 1U cleanups
> https://lore.kernel.org/lkml/CADnq5_OgZvTgUDvDqDikoUh28jTRm2mOAVV6zAEtWE9RHTFkyA@mail.gmail.com/
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> index 95e2796919fc..995bc28b4fe6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> @@ -47,7 +47,7 @@ int amdgpu_jpeg_sw_init(struct amdgpu_device *adev)
>                 adev->jpeg.indirect_sram = true;
>
>         for (i = 0; i < adev->jpeg.num_jpeg_inst; i++) {
> -               if (adev->jpeg.harvest_config & (1 << i))
> +               if (adev->jpeg.harvest_config & (1U << i))
>                         continue;
>
>                 if (adev->jpeg.indirect_sram) {
> @@ -73,7 +73,7 @@ int amdgpu_jpeg_sw_fini(struct amdgpu_device *adev)
>         int i, j;
>
>         for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
> -               if (adev->jpeg.harvest_config & (1 << i))
> +               if (adev->jpeg.harvest_config & (1U << i))
>                         continue;
>
>                 amdgpu_bo_free_kernel(
> @@ -110,7 +110,7 @@ static void amdgpu_jpeg_idle_work_handler(struct work_struct *work)
>         unsigned int i, j;
>
>         for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
> -               if (adev->jpeg.harvest_config & (1 << i))
> +               if (adev->jpeg.harvest_config & (1U << i))
>                         continue;
>
>                 for (j = 0; j < adev->jpeg.num_jpeg_rings; ++j)
> @@ -357,7 +357,7 @@ static int amdgpu_debugfs_jpeg_sched_mask_set(void *data, u64 val)
>         if (!adev)
>                 return -ENODEV;
>
> -       mask = (1 << (adev->jpeg.num_jpeg_inst * adev->jpeg.num_jpeg_rings)) - 1;
> +       mask = (1ULL << (adev->jpeg.num_jpeg_inst * adev->jpeg.num_jpeg_rings)) - 1;
>         if ((val & mask) == 0)
>                 return -EINVAL;
>
> @@ -388,7 +388,7 @@ static int amdgpu_debugfs_jpeg_sched_mask_get(void *data, u64 *val)
>                 for (j = 0; j < adev->jpeg.num_jpeg_rings; ++j) {
>                         ring = &adev->jpeg.inst[i].ring_dec[j];
>                         if (ring->sched.ready)
> -                               mask |= 1 << ((i * adev->jpeg.num_jpeg_rings) + j);
> +                               mask |= 1ULL << ((i * adev->jpeg.num_jpeg_rings) + j);
>                 }
>         }
>         *val = mask;
> --
> 2.34.1
>
