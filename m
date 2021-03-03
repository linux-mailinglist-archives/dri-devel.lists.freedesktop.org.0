Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B17B32B8C6
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 15:57:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027B089B18;
	Wed,  3 Mar 2021 14:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC1089AAE;
 Wed,  3 Mar 2021 14:57:26 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id p6so5744733oot.2;
 Wed, 03 Mar 2021 06:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qt5wXwklMsm6s5Zb+eD9YN9oX2rhIgEmQ1SsEPhvWyc=;
 b=nVMMGUMobAMEySPNKmp/GvwtfCn8twa9qGl3V2/yBfUPYitFWdp/2Ulqi+3lBJV7jk
 FFrhkBwRkcUxEzdMjR0W52HDWRRBo96sj9s4REwN5U6mknHKvkvGlucquRTtQFIqEsCq
 N+auS/TTDoqNWo4tbTMBdHRC6oIr7hbdFe0fY+D/2LwAK3RL9SSU7SHPDCJlyphKjbEy
 1X1eOMKNy2z7Jzb2DyxS3Mh1xRsTyBtxhDYLQ98WQtLZq0eYPZwPmE1JJkKfpmVRytoC
 O9eDVSxANWIvF8tjvL6P6LxkF32Lba6EwwdVCk6dVlfxcnA3X3JNIOQqBK/ID71yZRjZ
 nzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qt5wXwklMsm6s5Zb+eD9YN9oX2rhIgEmQ1SsEPhvWyc=;
 b=qR0RzDL1y8/+INcGaJJQkawXpHJWrm0Hpkeuy205I+tG7lzwYR4RjpekQNsa27qUfS
 7bDgJNhAeMwIBwLlcL5lpjUp+jN3EPaXu5RwIH2FB/gwTo3gVyVHG+aW3b3AnVUTEBJs
 bTBkm6i4rJK508NfjW60rrjTDYQZ+otp7jqNpjV74ndQfgRYU5EkmpAsi+FVI4+QxkzX
 jUJa5uCaSx/fzHI1NKwedu93pQbyNlMWxuYHa5z85uoikLFHzMq13UWyXPtVf0wklUYv
 Hx9vEOm0SMpbhpV+WnZuRmuxA9EVblVHFeLZjUJ/QNGd42gP6zio2k8JpqI9a1Nwxmzt
 NkPw==
X-Gm-Message-State: AOAM530J+wSwwY/FVUAjTOnV25I7LL09CXtTF0ktPe0xsNpD0ygQ+87l
 iMpOUiKHOUkatvfjDsn+MGl4jTl3cUQJvSfLhb4=
X-Google-Smtp-Source: ABdhPJxCv+I6j1jzZfjyYLdp+mYWLwPR3jdJK2Nb20n18ezv35ZR6OF8qMWWIVzO/17rhWFlEGpY/BRJoE8Bt7mhc8c=
X-Received: by 2002:a4a:88ee:: with SMTP id q43mr21478044ooh.61.1614783445212; 
 Wed, 03 Mar 2021 06:57:25 -0800 (PST)
MIME-Version: 1.0
References: <1614763065-114245-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1614763065-114245-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 3 Mar 2021 09:57:13 -0500
Message-ID: <CADnq5_OXuJbZpaaW7m+skg9zgdS5Buwi6ANSttz41yjBP+HxLQ@mail.gmail.com>
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
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 3, 2021 at 4:18 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warnings:
>
> ./drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:2252:40-45: WARNING: conversion
> to bool not needed here.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> index c8c22c1..00d3773 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> @@ -2249,7 +2249,7 @@ static int sdma_v4_0_set_powergating_state(void *handle,
>         case CHIP_RAVEN:
>         case CHIP_RENOIR:
>                 sdma_v4_1_update_power_gating(adev,
> -                               state == AMD_PG_STATE_GATE ? true : false);
> +                               state == AMD_PG_STATE_GATE);
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
