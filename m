Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E9E38B772
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B626F509;
	Thu, 20 May 2021 19:23:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D62E88979E;
 Thu, 20 May 2021 19:23:31 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id c3so17425082oic.8;
 Thu, 20 May 2021 12:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k8jbqnkIhb6Scb2ilNgSqrLUoD8EKnp1ewooO1thaYY=;
 b=ky35ahVtuQfQMvjOeiiTTPbXaYneyr4RFONeMzlHZyexsj5rX8XhdDpXsJiz3dYVul
 wYEKc3B8k42wdypOpMotQdOBiW6RXqUf466s1oEBZQU6IkBUzqApaFH279BKcODv9hry
 PkF70uZo9+I53o7qHAZUR34SlhlZoBHznh7PXCQFdZ4P27ZO3q0mS1oAkkk6diq9K7wA
 H0TVgKnJXqieJQMfk5bah0AGLFSycfWfD1VdIj7QrdhLZc3kUcsgrJHYSJ5WnDM3V1ln
 buTBOgiEZaYLxzGvxv+fah+PD2XV36vh3/drhElt98f6HpQPL7x3i7dthMbIZ7mDX0/o
 QpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k8jbqnkIhb6Scb2ilNgSqrLUoD8EKnp1ewooO1thaYY=;
 b=qRd/go/MhSE4SEa6QuL4gEbhzZhp6+Bu++aC1RzlSro0TRUymgD686xWDrsmRNB6a9
 xrm+4cy9b6Jn3c/pQv0qU7hQUEcpV74YP+UW4YVOneY+7HwPcHxA1J1V6csnlBy2Ploz
 MsL6UAuHtXDeGeCJGD6wF6BdESQjD05AWysucqAce3seLXE9WNMxHa1D9WjKyIiuSvay
 evh3xNiKQTKZAlFVK4msJykNBfBAnKT1zqZPuqXp/A4QQRhPKgGzYriYqPGMkADSfJUI
 mSOtJG9gJSTL+h25PI+YPXvvVQ4aT2czqpXk3WHcjv+fE4vkAsSQdmkeRm6NVApVHGgD
 U52g==
X-Gm-Message-State: AOAM532WB9eZsCV5nrlGyxFxDTk5q5uEUYQLKo4T7IC4xh6SloDNXvc0
 SSBd2reB0g4WPoXUyQ3P9//S7qSwrBYfv8M3Qvk=
X-Google-Smtp-Source: ABdhPJy+NQtM83k5lhJDRCaPOOpyGysTMYGPd3KkfE/RldWsZC16fzPXRl9aFd4m2P2dyrXamOmLBaNBTAo1U4tUMGA=
X-Received: by 2002:a05:6808:249:: with SMTP id
 m9mr4210776oie.120.1621538611248; 
 Thu, 20 May 2021 12:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-33-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-33-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 May 2021 15:23:20 -0400
Message-ID: <CADnq5_OMyd3JpAhjAsBmZGCNTqWTV4ZSOcvTv6jJCAokBg0y=Q@mail.gmail.com>
Subject: Re: [PATCH 32/38] drm/amd/amdgpu/sdma_v4_0: Realign functions with
 their headers
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

On Thu, May 20, 2021 at 8:03 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:764: warning: expecting prototype=
 for sdma_v4_0_page_ring_set_wptr(). Prototype was for sdma_v4_0_ring_set_w=
ptr() instead
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:830: warning: expecting prototype=
 for sdma_v4_0_ring_set_wptr(). Prototype was for sdma_v4_0_page_ring_set_w=
ptr() instead
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
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd=
/amdgpu/sdma_v4_0.c
> index d197185f77890..ae5464e2535a8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> @@ -754,7 +754,7 @@ static uint64_t sdma_v4_0_ring_get_wptr(struct amdgpu=
_ring *ring)
>  }
>
>  /**
> - * sdma_v4_0_page_ring_set_wptr - commit the write pointer
> + * sdma_v4_0_ring_set_wptr - commit the write pointer
>   *
>   * @ring: amdgpu ring pointer
>   *
> @@ -820,7 +820,7 @@ static uint64_t sdma_v4_0_page_ring_get_wptr(struct a=
mdgpu_ring *ring)
>  }
>
>  /**
> - * sdma_v4_0_ring_set_wptr - commit the write pointer
> + * sdma_v4_0_page_ring_set_wptr - commit the write pointer
>   *
>   * @ring: amdgpu ring pointer
>   *
> --
> 2.31.1
>
