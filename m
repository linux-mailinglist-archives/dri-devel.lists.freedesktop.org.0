Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B792997EB
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 21:26:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D91B6EA67;
	Mon, 26 Oct 2020 20:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C366E116;
 Mon, 26 Oct 2020 20:26:23 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 13so12954608wmf.0;
 Mon, 26 Oct 2020 13:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wG7L6k5elcsFTdFccbEBRu2CRJAFTSnK/nWIQ/2axqk=;
 b=BKECFo7tWE7Uuvp/xZqDhJgyFDbg2DxsWPatrwsbVJunmqPCOfdlzPpJr7PFvAU59T
 1l8TW/dvZDoT/EMS5HEVm0w/hmlxD0X25Y7Fb2GcdVKHabbnUyzgpdfW9U0NrY+IUDVo
 f4C2Mx0Bo1kRbDPSqShjfpQgRPyw/hPtUbujYoelq6NkSpfi2jodFHjlWK+2pCQrRLPz
 DIURbjgERLBPaSTEGh5Dv/YLP7Cv7wvoIUnBrLClrehtMBBQWY8BXx3a/uaDhYntUzwd
 VS5Fe43ZVtd4YfsGE6o+wuUpXrw2duyXRB5va0KqPn4cM/uw2SA4Ptx5P/jtKAe9Fs4j
 EFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wG7L6k5elcsFTdFccbEBRu2CRJAFTSnK/nWIQ/2axqk=;
 b=O7lXt4Q1tvv3Yfhg6ziX1IKagFGqBdC9swFP6tULHCdEJwi/QgN3EmrEr/eQbgZt3P
 +w0olxD1Gk+823bsDI1QV9gafvbJ1bGNpoV4SGNSqzIzcUzvP5wWktOcwDxPB23MFFrN
 uMbn8J6b6A01bxhmfXfAODGt8IMmezjnWC5kNt1en214VEmIkvOLRdE7z0tUZu07W8sT
 aX4O58rHkKXWxaSVIKsB+Vyno3KmpzjDuiFAtHGtWwhmYRGrxgtilIsnZoaWIZfipdP8
 grK0WxChVMIGtwnZrtmgATwOkMR62AkHUHCIB913FHhSXAKIiHRM6OGw4Rs1kuYTst6+
 cU0A==
X-Gm-Message-State: AOAM533T1VOGz9fEFpPN2KpogHhUdhNd1L62N3BhGUtLFZFzTWkItEW0
 WauK7E4eSJxmjnGQLKzQ5qlacIfphFq97TnbNGM=
X-Google-Smtp-Source: ABdhPJxH0XD7Qr8WWOT4U+A2t3Ki9NVyS6yGQrbNVPDFqX00bz0auWEM9RMfcgNQn4lKil2Ta4Z7rKh8hoZnQULvjyw=
X-Received: by 2002:a1c:6302:: with SMTP id x2mr18103079wmb.56.1603743981925; 
 Mon, 26 Oct 2020 13:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201026181242.76bf3b6gx2yx7hr7@adolin>
In-Reply-To: <20201026181242.76bf3b6gx2yx7hr7@adolin>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 26 Oct 2020 16:26:10 -0400
Message-ID: <CADnq5_NxQwwaxO1KJ5Fnmv_OGiFYyD0xZVCzkbOLGPjFCkECwQ@mail.gmail.com>
Subject: Re: [Outreachy][PATCH] drm/amdgpu: use true and false for bool
 initialisations
To: Sumera Priyadarsini <sylphrenadin@gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Melissa Wen <melissa.srw@gmail.com>, outreachy-kernel@googlegroups.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Oct 26, 2020 at 2:14 PM Sumera Priyadarsini
<sylphrenadin@gmail.com> wrote:
>
> Bool initialisation should use 'true' and 'false' values instead of 0
> and 1.
>
> Modify amdgpu_amdkfd_gpuvm.c to initialise variable is_imported
> to false instead of 0.
>
> Issue found with Coccinelle.
>
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 64d4b5ff95d6..ba4bd06bfcc5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -1288,7 +1288,7 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
>         struct ttm_validate_buffer *bo_list_entry;
>         unsigned int mapped_to_gpu_memory;
>         int ret;
> -       bool is_imported = 0;
> +       bool is_imported = false;
>
>         mutex_lock(&mem->lock);
>         mapped_to_gpu_memory = mem->mapped_to_gpu_memory;
> --
> 2.25.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
