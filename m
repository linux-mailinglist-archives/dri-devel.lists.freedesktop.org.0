Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A65843FB6E6
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 15:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F31889DC1;
	Mon, 30 Aug 2021 13:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07F989D99;
 Mon, 30 Aug 2021 13:22:13 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 107-20020a9d0bf4000000b0051b8be1192fso8119258oth.7; 
 Mon, 30 Aug 2021 06:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9GJx6Kj9IjxLJYmuty3jtd9bUP+GAh0xyATeMOQii1M=;
 b=BbhQ2dtKVYkxPMKSzZmga7KtTBhnO8N9JAmOR+uoykhXz4lVLr3ytMqZx+d7QHzMIc
 RlALZ1v4kHg9gvHkJ3k3rba7vmb9AQOoCQ6c6chhcwpx9ZeHM/L9FZoXrRhckJbHzOXY
 NF4AcpS69lwKnwi/N64psjGN6fLgiyNnVuyFsa8hAvtBRm2WH61Dd/4qxSrclnKVDalR
 nN5iF0dEH1CvXjlWg3Fy4eZtYEA9TPhjLLC5WZQtnNVZzZWXVRFmZlT7JHNIOZOzzgqd
 jjp8gGO5k9FTf/BDnnU/2qUAQ3diWuX7VtItjGolObvmOzpcJ/sDNT2ObpySIkjp8cH/
 Rx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9GJx6Kj9IjxLJYmuty3jtd9bUP+GAh0xyATeMOQii1M=;
 b=K7kR7GK1J7x7xHh2WK3I9sJyHd5r5funW2mAR77JkEz60W85dSVjnGkV5UzYAVT93S
 Gn0R0Bebq0lLT+IglLHlvm21waWqYBTT+ZEGRK8ydksWNSTewhWQ1aXv3SnMtU85KzgZ
 G+39kZC32kx1LKCYyVhqDwbzcnizGTPvdB0ogtmNbsmtdh4Vp6vphGFkougoAhx4lENm
 HpNy6DdnSQ8iCFjdSgf5uMnCPyTHQq9cnosFc/+86ORDKZFzmH8mtPAsZW9PeCStVyUj
 u7q4EmmJ5hFkiZ0Ro9eRmVLauM6W/OqTJgU2gJoMvvfvspQ2UYfpHycLO8wFP1te/E52
 yiMw==
X-Gm-Message-State: AOAM532ygykQx/lxxbTCJStywaEmJr+rPjDdnYEn5yv7RV8YliKsOkHT
 kqWAF4zGklX2XC/Up9IyqSSiOXvb0V7DD4GGAWqU2N5+
X-Google-Smtp-Source: ABdhPJzFLQ2trCwLX1OPN8Uak8yPPZeAXV1f000MypUK7xCJvG9iafmpCu4oiWHYhMqkN3Gnmc5OKyePibTRVm+yFIE=
X-Received: by 2002:a9d:4c15:: with SMTP id l21mr19191447otf.311.1630329733265; 
 Mon, 30 Aug 2021 06:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210828084116.1642-1-caihuoqing@baidu.com>
In-Reply-To: <20210828084116.1642-1-caihuoqing@baidu.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Aug 2021 09:22:02 -0400
Message-ID: <CADnq5_MvefFonTAtC1WS7HkdX8feAV8SaLe0-4d5nec=3xxX8A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Make use of the helper macro
 SET_RUNTIME_PM_OPS()
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, 
 xinhui pan <Xinhui.Pan@amd.com>, Dave Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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

On Sat, Aug 28, 2021 at 4:41 AM Cai Huoqing <caihuoqing@baidu.com> wrote:
>
> Use the helper macro SET_RUNTIME_PM_OPS() instead of the verbose
> operators ".runtime_suspend/.runtime_resume/.runtime_idle", because
> the SET_RUNTIME_PM_OPS() is a nice helper macro that could be brought
> in to make code a little clearer, a little more concise.
>

I think this makes readability worse and just causes code churn.

Alex


> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index b6640291f980..9e5fb8d2e0e0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1699,6 +1699,8 @@ long amdgpu_drm_ioctl(struct file *filp,
>  }
>
>  static const struct dev_pm_ops amdgpu_pm_ops = {
> +       SET_RUNTIME_PM_OPS(amdgpu_pmops_runtime_suspend,
> +                          amdgpu_pmops_runtime_resume, amdgpu_pmops_runtime_idle)
>         .prepare = amdgpu_pmops_prepare,
>         .complete = amdgpu_pmops_complete,
>         .suspend = amdgpu_pmops_suspend,
> @@ -1707,9 +1709,6 @@ static const struct dev_pm_ops amdgpu_pm_ops = {
>         .thaw = amdgpu_pmops_thaw,
>         .poweroff = amdgpu_pmops_poweroff,
>         .restore = amdgpu_pmops_restore,
> -       .runtime_suspend = amdgpu_pmops_runtime_suspend,
> -       .runtime_resume = amdgpu_pmops_runtime_resume,
> -       .runtime_idle = amdgpu_pmops_runtime_idle,
>  };
>
>  static int amdgpu_flush(struct file *f, fl_owner_t id)
> --
> 2.25.1
>
