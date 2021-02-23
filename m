Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A24322FEA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 18:48:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C0D6E84E;
	Tue, 23 Feb 2021 17:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7625D6E84B;
 Tue, 23 Feb 2021 17:48:15 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id g46so4055360ooi.9;
 Tue, 23 Feb 2021 09:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ffSuOizC5vkUXK1gRj/KWG3leLFcWqMQLhXqk6jtjF8=;
 b=vbgy9CARhYqdjN8Ho0PbyEzF2w+6y+n6HQqUZYHQI722nTtteSgOdfhyF4xLx6RjQf
 ZHF4NoXNSe/9YN19Tv1e5e3DFmQ9WRH8KfVHVdesDO6q1vl/dd7TDMGfp6+n2AR74lOL
 5Y0rSya1bpC7gEAMn42hTASouVT2h2Vx+nOdfRKSV7BBhkwCU+apO1umKsk1HTqQScTQ
 0NgeXSzLPhe7htdcc+NOI1ffXxgekrCB5+jpr691zE916wqJfptwgHrgViVOy26aUw/B
 urPcPfsnnoWL/eydzwiUAG+iubpxx/UquDpjx+pzRzRCXbk4lEVZMQ+4sDgiw6Nz66qR
 FsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ffSuOizC5vkUXK1gRj/KWG3leLFcWqMQLhXqk6jtjF8=;
 b=IP3FPKF4IMWknvSzcCbAtK/QB3tm66Uv/u4jSN3mWo7havcNPX/jWDyKVksHpSlTY/
 To+cHhiU68c9KinMev+C/nzqwPF+3EGNkfljjlyngy0z23p9zo+l/UtPg9N+QBuhsDG+
 v5bapF+xKLlHwrbNo7ar9GRdYWH9KPDNDENv99ZFlyVUwbLrs3ia8SlOMEbQu/+P9rOj
 jNtWtQ6tGRDvAYYXAKmRsi5pRcefRux7GjaEyUIAQGx1XHvgIBOnOlF7EDhC8CqxPkOv
 Df8xw127Rt8da58K1WLA0vp3fTWyQaTUg5FP3GHqA2cMMKYLolIjXqGda51r58r43olQ
 hi6A==
X-Gm-Message-State: AOAM532mKWs+gqNrdyOHoXkWA2/kAI6w/QLg93qfbzSe7H8aS+CPZ1VR
 +wrl/HQGYQMSVfkJ8Afx6EtJxk+vK2OBQ0j/ADA=
X-Google-Smtp-Source: ABdhPJzxvdElhLv4Olbxje+vfunp4TxzAJH8llMrhEMdjEvnxVubx328z9Es28kfa/xGAYsyYOsVKAW93HWSYchf8zc=
X-Received: by 2002:a4a:4581:: with SMTP id y123mr20841890ooa.61.1614102494816; 
 Tue, 23 Feb 2021 09:48:14 -0800 (PST)
MIME-Version: 1.0
References: <1614051813-51451-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1614051813-51451-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Feb 2021 12:48:03 -0500
Message-ID: <CADnq5_O3dQvBk5rG+XgQHzguByjMs-Yds71vzj4MG+AMhmyvhw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Remove unnecessary conversion to bool
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 22, 2021 at 10:44 PM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warnings:
>
> ./drivers/gpu/drm/amd/amdgpu/athub_v2_1.c:79:40-45: WARNING: conversion
> to bool not needed here.
>
> ./drivers/gpu/drm/amd/amdgpu/athub_v2_1.c:81:40-45: WARNING: conversion
> to bool not needed here.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/athub_v2_1.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/athub_v2_1.c b/drivers/gpu/drm/amd/amdgpu/athub_v2_1.c
> index 7b1b183..2ac4988 100644
> --- a/drivers/gpu/drm/amd/amdgpu/athub_v2_1.c
> +++ b/drivers/gpu/drm/amd/amdgpu/athub_v2_1.c
> @@ -74,10 +74,8 @@ int athub_v2_1_set_clockgating(struct amdgpu_device *adev,
>         case CHIP_SIENNA_CICHLID:
>         case CHIP_NAVY_FLOUNDER:
>         case CHIP_DIMGREY_CAVEFISH:
> -               athub_v2_1_update_medium_grain_clock_gating(adev,
> -                               state == AMD_CG_STATE_GATE ? true : false);
> -               athub_v2_1_update_medium_grain_light_sleep(adev,
> -                               state == AMD_CG_STATE_GATE ? true : false);
> +               athub_v2_1_update_medium_grain_clock_gating(adev, state == AMD_CG_STATE_GATE);
> +               athub_v2_1_update_medium_grain_light_sleep(adev, state == AMD_CG_STATE_GATE);
>                 break;
>         default:
>                 break;
> --
> 1.8.3.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
