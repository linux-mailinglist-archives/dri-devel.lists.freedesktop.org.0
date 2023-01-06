Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2345A660350
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 16:31:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102A810E872;
	Fri,  6 Jan 2023 15:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2EA110E871;
 Fri,  6 Jan 2023 15:30:58 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-12c8312131fso1867530fac.4; 
 Fri, 06 Jan 2023 07:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oiJt6s7+hbogz7Pnp3dT+g0/bOfE/wSE2iJelIqj6/U=;
 b=ZDLN8+H8kR4lAfnL9dFpNhPkExxpPDiNyX+c9Z8+BS9D0gRtkyROettmrozcJcr83S
 JSxz9LjVvHiTvqCTPMtYEJkLVxHbyvp46uEh9NjgS+IG2z/l1hRSxveKyIGrVkUq01wT
 GfxP/atYg9WZwQDaKnSnzG47Bt8Gb236gDLny5KIobdVQWzlQe+8VV8/t8g5t2lwQVFP
 jfzIEnxIcxB6CScqePq/tz3JevZLHNlgCvO5h9QwEHCMwTGG71ZKFyMDLvWy9J9wgPYt
 tCtnGSFaXoEX/cdzcKJcM4RQyDb4X0Cj/B15oiSupk262JZqZ8llZHICpArKJAtZRUo+
 uV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oiJt6s7+hbogz7Pnp3dT+g0/bOfE/wSE2iJelIqj6/U=;
 b=GloGbs32cGjS4+OpgdEUSmG4bJMqNqXT9h+KCdsLXRMrgyQlYvceUJYNheQvHSqStV
 cvttOjvOkjiXgbYUj+b1OhTugfHrzpiLoN82GJ1fiCfEhSGSZFVhafIPH4xRPskqo1Yp
 gtxoteVEciyl8aUdCr5LDd/d3Taa/fzSi2DdNnLWbETzaEjZz8e9FRRydUqbDi1L4Qrr
 ZFio+vAfRPQhdrDqTLpZ8Wp+iCkwoCHxTWBL4W8rmsHPeVRc2YQiByDdcAfiSyz2Xa+C
 feIeR+9j8nNC3uhq415XR58Ms0f12//EAG0sMmw+9JYVC9uJkQQB4VGUOpHEKXiWPYjy
 Hfqw==
X-Gm-Message-State: AFqh2koIj45zbri/Eqe0WWYQCqsmTwkNXGUUhyU3k099MimccZ/M6ZIS
 rVODSItw7bi/SoyFTuo8hB9wFm0vQKA4k2n2thE=
X-Google-Smtp-Source: AMrXdXsVu9tZH9aEpFTPrGxj623SET9TazA0U7VuGephptWzQv20D90ml/cZSokwL8XmyIJ3Wj/wgSNT3aUNvKZMMg8=
X-Received: by 2002:a05:6870:970e:b0:148:3c8f:15ab with SMTP id
 n14-20020a056870970e00b001483c8f15abmr4679795oaq.46.1673019058265; Fri, 06
 Jan 2023 07:30:58 -0800 (PST)
MIME-Version: 1.0
References: <20230106013232.25947-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20230106013232.25947-1-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 6 Jan 2023 10:30:46 -0500
Message-ID: <CADnq5_MTfRLcH2EvxYL61pjTEs_VsQnh1Ya_ahSCDZksyFqv5Q@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amdgpu: clean up some inconsistent indentings
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Jan 5, 2023 at 8:37 PM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:65 amdgpu_gem_fault() warn: inconsistent indenting
>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3639
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index 00edc7002ee8..ed1164a87fce 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -62,10 +62,10 @@ static vm_fault_t amdgpu_gem_fault(struct vm_fault *vmf)
>                         goto unlock;
>                 }
>
> -                ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> -                                               TTM_BO_VM_NUM_PREFAULT);
> +               ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> +                                              TTM_BO_VM_NUM_PREFAULT);
>
> -                drm_dev_exit(idx);
> +               drm_dev_exit(idx);
>         } else {
>                 ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
>         }
> --
> 2.20.1.7.g153144c
>
