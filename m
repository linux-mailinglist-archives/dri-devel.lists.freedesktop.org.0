Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A543319CF
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 22:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9985C6E891;
	Mon,  8 Mar 2021 21:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A1189D9B;
 Mon,  8 Mar 2021 21:57:16 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id v12so10769857ott.10;
 Mon, 08 Mar 2021 13:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vBWk93dB6A/oALjtzEiM8cCSb4V0wTNQU+avL5sjbpk=;
 b=jPEr12eJOevKFdEXIwQnNzZdbudcLEhlPf1DMoP45Rvwfl4BFXV0YotJ1gHKiUIdX7
 9xK/3dLI7ddnG97S64MUx2d6PPQ8pF9v3/Jd3GiOC4TP4VcjcvnXU2FcUuM2HZ0qIkId
 BIkQphCez5RhIb7n98loEBPfAz/5YTKR5+m6FIUrAmTbFUV+JEap3K8RjOZQTYGekYZz
 f5W0jvlQZUi2f24LdRkHtO9MpNxTwTsZqv89uCD0Vpv2dd3bdQDA7h2gsAeTv+TYASYH
 gK+u/zdG2jqKUi8K9PmF/9jCGLqm9tN2KqDNcu0AODBNjdYbqthX9uWRFhK7ioT+EeSA
 +eoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vBWk93dB6A/oALjtzEiM8cCSb4V0wTNQU+avL5sjbpk=;
 b=mg/TexWAzoQ6+aYIvD/3jMlgcwwdBcNvj5EiKHhd5SGbPKacWOrhGfpu8Vb6kfOOoZ
 iKPZzWdmggkI+BQAUoWAskFlJww6aTWPyHFsPtIrFbzm68bMnxcIdbOqiBAxJRhjO9c2
 Ki4F5RRyBMGDxjpslckwwIg5SCx05b8Sb6rWsDi0tDVgNBG1GlHn6dI+PQpCBl9E3Gtp
 gzZ3V+mvZGT3nmFKarKfmM9o9neWM6hgJwaCcRq93uv4mD9QmYAseftyl3peBDJdiXA2
 HT3r4Sd0U9psrqRiMZ/KzN9WXc8wWhGoLnWfYB84rebfeZ0QVknXLgzgZ4CU7VM/37HT
 yypQ==
X-Gm-Message-State: AOAM533duc8Hw0E6yC89PfmYKhAWMZyuAYkv2YGHvps/h9wCWbnVKA5V
 UYi27N/RicoHe4DnjxjsagXouAohHExUJxEl6WE=
X-Google-Smtp-Source: ABdhPJxrYC5b+Bfy28dEBHW3FjF2qWGh0W9dW/P/7CoZ3wnlKV8yAc+scjpfhvvVoKtqiq7I17x9HGjyMxBJB0BvS80=
X-Received: by 2002:a05:6830:408f:: with SMTP id
 x15mr22421343ott.132.1615240635925; 
 Mon, 08 Mar 2021 13:57:15 -0800 (PST)
MIME-Version: 1.0
References: <1615173254-22078-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1615173254-22078-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 8 Mar 2021 16:57:05 -0500
Message-ID: <CADnq5_NeAv5HeD=whn30Yu1hoMW2XfPxjeN53b995AzXOY1-dw@mail.gmail.com>
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

On Sun, Mar 7, 2021 at 10:14 PM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warnings:
>
> ./drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1600:40-45: WARNING: conversion
> to bool not needed here.
>
> ./drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1598:40-45: WARNING: conversion
> to bool not needed here.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

This patch was already applied.

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> index 690a509..b39e7db 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> @@ -1595,9 +1595,9 @@ static int sdma_v5_2_set_clockgating_state(void *handle,
>         case CHIP_VANGOGH:
>         case CHIP_DIMGREY_CAVEFISH:
>                 sdma_v5_2_update_medium_grain_clock_gating(adev,
> -                               state == AMD_CG_STATE_GATE ? true : false);
> +                               state == AMD_CG_STATE_GATE);
>                 sdma_v5_2_update_medium_grain_light_sleep(adev,
> -                               state == AMD_CG_STATE_GATE ? true : false);
> +                               state == AMD_CG_STATE_GATE);
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
