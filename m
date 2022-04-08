Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 956A14F9E64
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 22:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E271E10E45F;
	Fri,  8 Apr 2022 20:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7E810E195;
 Fri,  8 Apr 2022 20:51:10 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id w127so10019255oig.10;
 Fri, 08 Apr 2022 13:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NVt9zQ5epwlrSvoMeShV1kYIiF5qT44eNDTkjicb+jA=;
 b=Gs+lbsdQG9zot9bavDh0f7Tzv1cgCzIaSTYNoJnG+JGf8L2F7mx9Bq67eEK9shk0vt
 y7afXfvK0GMevHxdbn3BlZPf/3IghJpNXQwVgrhQPrw3I6sU1RgwW31J/UE6rEPXf4FS
 FrEzbh4BmrgvFE+QnTZ4M0CpJhVm9fZybIeLq84oZqRE3Xj4R7vw5mkebm5BSh8/UEPP
 Y9s5PZ4/H6Ey+k0hBuLcZAJ+Qoxw5PlpFvRyTT3xiLrT/g19tAEj1Kw8gMwSAmGM5Gss
 4PsATYK9QTYti51gLYiPBG+KiRu2XBvzINfEPtVlNm5h78VCIkZ94ox+FcuYu9kzCGXm
 Hx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NVt9zQ5epwlrSvoMeShV1kYIiF5qT44eNDTkjicb+jA=;
 b=spXS31aPf4mdejYFMn1luFJvIyzMHOA1USmUDvjqZ9wzPV6V4ImQBldJDsbZfspsWG
 LXgMI9Ya5+8uPjW8T/bAhh5FNqcK1G1F49WNBvk01ZccVu6hIA4E+Lp2xIsLKPGx/nkk
 wA5lKys0shCUuBEZoo41S2vkZegRlIQ8hAW7TMjps0mBGTD92kR9/NheA+BVEZxradQe
 dYh7oIjGWHCTsWqKm67BLMzix0GLMBWzE4MmaPTkscpCd0R1M0XYONXF5rkYXrjUwCRz
 RpPeU04gbfeCAjhkITwwUjQ+4kMVJQUYoeqp4kdt8munUoSl9Mjo+jxcipqNpdEhzAb5
 wvzA==
X-Gm-Message-State: AOAM531FuxqPWDOLnWCCRurh9egmL34pYXvLM7Av8ejs7X8VM4wxXrTe
 nCLpdye6xudO7AJa5L9PT/ZHztkTAWz+PhJK7Oc=
X-Google-Smtp-Source: ABdhPJwMIAoWHQBFMGfx1F6DKZqqor03Rrbv3CmWWBpiw4Gr/YM1EHL/ZOAzNRem0mHm8VpREhEz/AJGoYXSYRrWLTQ=
X-Received: by 2002:a05:6808:199e:b0:2f9:d699:6ad0 with SMTP id
 bj30-20020a056808199e00b002f9d6996ad0mr741374oib.200.1649451069431; Fri, 08
 Apr 2022 13:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220408075820.10396-1-h0tc0d3@gmail.com>
In-Reply-To: <20220408075820.10396-1-h0tc0d3@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Apr 2022 16:50:58 -0400
Message-ID: <CADnq5_Od3++qQnnLmV7zc+rm9oh_jGyGSqt_oiDmgyWD6EZXww@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix incorrect enum type
To: Grigory Vasilyev <h0tc0d3@gmail.com>
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
Cc: Yifan Zhang <yifan1.zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Chengming Gui <Jack.Gui@amd.com>, Guchun Chen <guchun.chen@amd.com>,
 David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Melissa Wen <mwen@igalia.com>,
 yipechai <YiPeng.Chai@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Joseph Greathouse <Joseph.Greathouse@amd.com>,
 Peng Ju Zhou <PengJu.Zhou@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Huang Rui <ray.huang@amd.com>, Victor Skvortsov <victor.skvortsov@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Evan Quan <evan.quan@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Fri, Apr 8, 2022 at 3:58 AM Grigory Vasilyev <h0tc0d3@gmail.com> wrote:
>
> Instead of the 'amdgpu_ring_priority_level' type,
> the 'amdgpu_gfx_pipe_priority' type was used,
> which is an error when setting ring priority.
> This is a minor error, but may cause problems in the future.
>
> Instead of AMDGPU_RING_PRIO_2 = 2, we can use AMDGPU_RING_PRIO_MAX = 3,
> but AMDGPU_RING_PRIO_2 = 2 is used for compatibility with
> AMDGPU_GFX_PIPE_PRIO_HIGH = 2, and not change the behavior of the
> code.
>
> Signed-off-by: Grigory Vasilyev <h0tc0d3@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 2 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c  | 2 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> index b3081c28db0a..1d9120a4b3f5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -4745,7 +4745,7 @@ static int gfx_v10_0_compute_ring_init(struct amdgpu_device *adev, int ring_id,
>                 + ((ring->me - 1) * adev->gfx.mec.num_pipe_per_mec)
>                 + ring->pipe;
>         hw_prio = amdgpu_gfx_is_high_priority_compute_queue(adev, ring) ?
> -                       AMDGPU_GFX_PIPE_PRIO_HIGH : AMDGPU_GFX_PIPE_PRIO_NORMAL;
> +                       AMDGPU_RING_PRIO_2 : AMDGPU_RING_PRIO_DEFAULT;
>         /* type-2 packets are deprecated on MEC, use type-3 instead */
>         r = amdgpu_ring_init(adev, ring, 1024, &adev->gfx.eop_irq, irq_type,
>                              hw_prio, NULL);
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> index 5554084ec1f1..9bc26395f833 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> @@ -1929,7 +1929,7 @@ static int gfx_v8_0_compute_ring_init(struct amdgpu_device *adev, int ring_id,
>                 + ring->pipe;
>
>         hw_prio = amdgpu_gfx_is_high_priority_compute_queue(adev, ring) ?
> -                       AMDGPU_GFX_PIPE_PRIO_HIGH : AMDGPU_RING_PRIO_DEFAULT;
> +                       AMDGPU_RING_PRIO_2 : AMDGPU_RING_PRIO_DEFAULT;
>         /* type-2 packets are deprecated on MEC, use type-3 instead */
>         r = amdgpu_ring_init(adev, ring, 1024, &adev->gfx.eop_irq, irq_type,
>                              hw_prio, NULL);
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> index 71cf025a2bbd..029c97c92463 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> @@ -2278,7 +2278,7 @@ static int gfx_v9_0_compute_ring_init(struct amdgpu_device *adev, int ring_id,
>                 + ((ring->me - 1) * adev->gfx.mec.num_pipe_per_mec)
>                 + ring->pipe;
>         hw_prio = amdgpu_gfx_is_high_priority_compute_queue(adev, ring) ?
> -                       AMDGPU_GFX_PIPE_PRIO_HIGH : AMDGPU_GFX_PIPE_PRIO_NORMAL;
> +                       AMDGPU_RING_PRIO_2 : AMDGPU_RING_PRIO_DEFAULT;
>         /* type-2 packets are deprecated on MEC, use type-3 instead */
>         return amdgpu_ring_init(adev, ring, 1024, &adev->gfx.eop_irq, irq_type,
>                                 hw_prio, NULL);
> --
> 2.35.1
>
