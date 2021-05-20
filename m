Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD5338B6F5
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1626F4EE;
	Thu, 20 May 2021 19:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053776F4ED;
 Thu, 20 May 2021 19:14:38 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 n32-20020a9d1ea30000b02902a53d6ad4bdso15849805otn.3; 
 Thu, 20 May 2021 12:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CFznQ5UzwVzYSrYk++bKt7INj01icNDyVEHe4lOS4xc=;
 b=oE4NN5AjJr7IrcZo1Es/vlSqvlT754NfJM7Mfc3xB6CSK7ll+/YvAtbQ2mR8AmC2BT
 sqS5dDVeSrEVWayFMSVJDASe9FKfS/Wr+qazoBbhp1Mr5/3hGxEj3m4HbdwTGxSA57TV
 tsUkAfXtKbZiSLaKd7b6iQvIx1PLbFfsvdI70eiZVuoimjccc7Oj24jOCjMZq8sDyO2X
 Gv0+5ths4rebFvxoKAo+njIxd/9sGHIKha8J/mMF2dIP6p44evYd0zbysZmm2eSWaG0V
 O5f+2Aw+n+upOXSmQcSvJZizKUNdhUyUqPutN+1XKRyxG3dHqSjSG6i6PLNAiQvAa5GA
 WMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CFznQ5UzwVzYSrYk++bKt7INj01icNDyVEHe4lOS4xc=;
 b=sAxKnkBvCFDEy87bLjHAHSxktJua9xBWVzkshEGbMcIomDDyxfEnP6dU31sFj5C+aB
 gWLtGErvZoLVr4AudBVS+ToHPFBoN5VL8lKz0sdIUhdeLeR+BrGsRq6EgUIhWsZLH6fS
 djMHsVNh0g64BdP2RP3p9wlZZQsElwI0yfgryvMFh5IUZbpYQMphELf0nFNCUdUJuC70
 PJ+O2qwGFeVW+z4V1qmULew+gO0m3y0ZRFLnr8B6U4Yp38eHLanOfJr3vgvYeIoEeQXx
 4I5umfCNdZFgig5D+ktZzsbQ5meEGJIFMM89NpJZWWuq/+b+ioQLLYpiiYg2cWRb2Edk
 eubg==
X-Gm-Message-State: AOAM530VBLJwO6Y7KmRAwflUNmapLwtBtaGwoODFSqAIIM8u3/RLXFrE
 km+WgqyZ7jmenNi2fpGrav5QzK/CoVAG+RnZf00=
X-Google-Smtp-Source: ABdhPJx25eh9IbEMpsnOwMHXas2EpZVFTY5iQRIyfyjEiHJt8Xqx1LcdVt3ezxRqHGRJRlAfp7MTX+b2xOf6Ptl94Fg=
X-Received: by 2002:a9d:57cd:: with SMTP id q13mr5103104oti.23.1621538078199; 
 Thu, 20 May 2021 12:14:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-17-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-17-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 May 2021 15:14:27 -0400
Message-ID: <CADnq5_MXLwMR7XsEiu1pAJ9d8cm6uHA7S4jtuqf-9z=kHbuMww@mail.gmail.com>
Subject: Re: [PATCH 16/38] drm/amd/amdgpu/si_dma: Fix some function name
 disparity
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, May 20, 2021 at 8:04 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/si_dma.c:320: warning: expecting prototype fo=
r cik_dma_vm_copy_pte(). Prototype was for si_dma_vm_copy_pte() instead
>  drivers/gpu/drm/amd/amdgpu/si_dma.c:412: warning: expecting prototype fo=
r si_dma_pad_ib(). Prototype was for si_dma_ring_pad_ib() instead
>  drivers/gpu/drm/amd/amdgpu/si_dma.c:425: warning: expecting prototype fo=
r cik_sdma_ring_emit_pipeline_sync(). Prototype was for si_dma_ring_emit_pi=
peline_sync() instead
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/si_dma.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/am=
dgpu/si_dma.c
> index cb703e307238d..195b45bcb8ad9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
> @@ -305,7 +305,7 @@ static int si_dma_ring_test_ib(struct amdgpu_ring *ri=
ng, long timeout)
>  }
>
>  /**
> - * cik_dma_vm_copy_pte - update PTEs by copying them from the GART
> + * si_dma_vm_copy_pte - update PTEs by copying them from the GART
>   *
>   * @ib: indirect buffer to fill with commands
>   * @pe: addr of the page entry
> @@ -402,7 +402,7 @@ static void si_dma_vm_set_pte_pde(struct amdgpu_ib *i=
b,
>  }
>
>  /**
> - * si_dma_pad_ib - pad the IB to the required number of dw
> + * si_dma_ring_pad_ib - pad the IB to the required number of dw
>   *
>   * @ring: amdgpu_ring pointer
>   * @ib: indirect buffer to fill with padding
> @@ -415,7 +415,7 @@ static void si_dma_ring_pad_ib(struct amdgpu_ring *ri=
ng, struct amdgpu_ib *ib)
>  }
>
>  /**
> - * cik_sdma_ring_emit_pipeline_sync - sync the pipeline
> + * si_dma_ring_emit_pipeline_sync - sync the pipeline
>   *
>   * @ring: amdgpu_ring pointer
>   *
> --
> 2.31.1
>
