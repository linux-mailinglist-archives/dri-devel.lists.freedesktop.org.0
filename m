Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C4E2732CF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 21:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129676E52E;
	Mon, 21 Sep 2020 19:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06136E52E;
 Mon, 21 Sep 2020 19:29:37 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id l9so598799wme.3;
 Mon, 21 Sep 2020 12:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3hqqQe3Z1bSL8x51h6GBHQbFdilb167mWc10MCGnF5c=;
 b=awcQqHvs87YwD+ow2dgUZXP6lXUYnudx4TPkva6t6ODq69HufSrILLkzTf/cGeZMwy
 XDYRW4nF4fmc1TtllS2BZenWcjam7kVhVjZn7O94fcqqQLOly1hHwzc78T9f+woPNfSt
 YNna5r5MWscpXrPV2CfPZWbVnEjKBV9OH1ZCh6QL4tibHPFivBwdgaNlOtUHg/RulgRT
 zahDW3MrSMegAvX/e7etlTq4dw0IYA8Tm5cEu96i+9Ukj5UIPRYL5uGj+POGi7dZJznD
 hVUAnK62/ZPdGYe00nLBTMZfhj5BvUB67QzbfDPtNH4fcyVsJtS+xO3n9msneFizL2uP
 bGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3hqqQe3Z1bSL8x51h6GBHQbFdilb167mWc10MCGnF5c=;
 b=q3oGu6To50XNYOZdQ+NZKWjgb1Ha5t+M+3Ow5Rsrx7AJy/sUEYVtNTmGXysUJeGbwt
 j4Ofvs5UaSNcpRxihBEe2a06bnDqdYVa/eLsRnidCgibpg1JXGy6XcYVYXsStxGY8Tyl
 EdI0eGzNwdpWFva9/R2c3b8OdPMEaCtMyJAH9sypNw2feGWkZJ7Mndvi9Yw0qfhO6YRC
 wQYT3uzeFQZ5QEpQ3JV/cXPPIf/QZYathYr8XAHhyIRTPK8CrQ0pW9biZvhJK2wWyVMx
 9ahhJ2DXB/ttdkhF17LgXcGI2WcrvydoqJEzibBHJY+XEmcSQ05fBTaaQACxIENHki6r
 EGQw==
X-Gm-Message-State: AOAM533hphKAJ3UUXfufTtPd022X+XyxGDtlG+xXOemf8nbFF9NusqDI
 Mv4uABB0q7cLH0efxq+4HLM+zbpE5kMo/MgfNJ8=
X-Google-Smtp-Source: ABdhPJyiPDkPv35QAwXXlQGTvpYQSkCM0PP/Pd9TLrVlrzcA5LNYIx2sbt9USWQg6GODTcnOOUPJhSQ5fjU7hWXQ9vA=
X-Received: by 2002:a1c:7d4d:: with SMTP id y74mr834581wmc.73.1600716576679;
 Mon, 21 Sep 2020 12:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200921131013.91326-1-miaoqinglang@huawei.com>
In-Reply-To: <20200921131013.91326-1-miaoqinglang@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 21 Sep 2020 15:29:25 -0400
Message-ID: <CADnq5_N8J-w7oLUvZXXFg=c=OK7vFkkvGL2BDE+ydSov2ya1pA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amdgpu: simplify the return expression
To: Qinglang Miao <miaoqinglang@huawei.com>
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Sep 21, 2020 at 9:14 AM Qinglang Miao <miaoqinglang@huawei.com> wrote:
>
> Simplify the return expression.
>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/cik_ih.c   |  7 +------
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 10 ++--------
>  2 files changed, 3 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
> index 401c99f0b..db953e95f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
> @@ -316,14 +316,9 @@ static int cik_ih_sw_fini(void *handle)
>
>  static int cik_ih_hw_init(void *handle)
>  {
> -       int r;
>         struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>
> -       r = cik_ih_irq_init(adev);
> -       if (r)
> -               return r;
> -
> -       return 0;
> +       return cik_ih_irq_init(adev);
>  }
>
>  static int cik_ih_hw_fini(void *handle)
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> index 20d8a03ca..56ed108b2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> @@ -2198,7 +2198,6 @@ static int gfx_v9_0_gpu_early_init(struct amdgpu_device *adev)
>  static int gfx_v9_0_compute_ring_init(struct amdgpu_device *adev, int ring_id,
>                                       int mec, int pipe, int queue)
>  {
> -       int r;
>         unsigned irq_type;
>         struct amdgpu_ring *ring = &adev->gfx.compute_ring[ring_id];
>         unsigned int hw_prio;
> @@ -2223,13 +2222,8 @@ static int gfx_v9_0_compute_ring_init(struct amdgpu_device *adev, int ring_id,
>         hw_prio = amdgpu_gfx_is_high_priority_compute_queue(adev, ring->queue) ?
>                         AMDGPU_GFX_PIPE_PRIO_HIGH : AMDGPU_GFX_PIPE_PRIO_NORMAL;
>         /* type-2 packets are deprecated on MEC, use type-3 instead */
> -       r = amdgpu_ring_init(adev, ring, 1024,
> -                            &adev->gfx.eop_irq, irq_type, hw_prio);
> -       if (r)
> -               return r;
> -
> -
> -       return 0;
> +       return amdgpu_ring_init(adev, ring, 1024,
> +                               &adev->gfx.eop_irq, irq_type, hw_prio);
>  }
>
>  static int gfx_v9_0_sw_init(void *handle)
> --
> 2.23.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
