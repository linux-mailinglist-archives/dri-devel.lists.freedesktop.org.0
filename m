Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3124338B701
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE336F4F0;
	Thu, 20 May 2021 19:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE73D6F4F0;
 Thu, 20 May 2021 19:15:27 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id z3so17410014oib.5;
 Thu, 20 May 2021 12:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6Zg4vmizJSIriLR9LU2790YKiK+logM7QIyA/FHoq5U=;
 b=uKVjxMBMCiPlK1ONgqo7qgd7w5MARG286PrWgvUYmmIWJRX5w9IIYfdT/a6nJUUCCJ
 nQ61aY30RNUXahoz/Ut+6v2/8E2SP7kyMac5joyCEamIXwySlQHhwRvCt9kCR4+lSxJ+
 ezgdsDRdr8aRU6/KXw+4ck5d72i7h5vj1Gttkzdrg4PNOAULjNd3CWHRdkJj3JwQ2SK1
 rBopRBZ2qG9Z1vlyB2/380L59fQKLJNrQ9LqTYsIIm4ZuOofhwK1wfb1NXz8MQxfRULf
 XvWh3ddH4yGRtwaceVe7IpU5bMuxu2YQUA5xoCudl8hZkemEUUejAVKO6rN26EQ1i9YX
 GFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6Zg4vmizJSIriLR9LU2790YKiK+logM7QIyA/FHoq5U=;
 b=Yhc9B4zwgqJ5rMWDo5bE8+ShDb47H7BziletJTUE82HwpvKJ8GZptj+ZL5wvAGa5Di
 rSXQle2qhTRHpn3vHpjeUGEKvzgZj5joqXg6f/syeDntPzADshcG9r+ePfbFcfyUuqq3
 3h1Zky3qUP/kV4M72M96MJqDWNHlSTBRvanxXziBPy2nIIkTT1hN81uZIdhhuajRXAzC
 4N/cybCaiIzQNrW+bqpgUHHdeflTJkppmT5xtoDmLTNDAk5ebH93jObDEqLNhXQmu8kt
 lPRr+amhAw3ietR34Fa3X96qN17aJSJBBAgQb0nHqUuGpEMWzzYJs7z8OZG/X6XbwFfx
 pyXg==
X-Gm-Message-State: AOAM532z7xNBeLP9mRiqO36UBhlNcF9NSgVcrTHTuWlMVByErYohxojM
 FkD6dMWc6aibCZ9SJnL+wqPmiq15x5ubjnKPtlw=
X-Google-Smtp-Source: ABdhPJzFakh2ykhbWYSIfMClrsTCDR/RlVV7AtZW4ucMxT7ws+DcoO2qHEzPA0somMKUOaKocha3T0eLNyGNR+hyxb8=
X-Received: by 2002:a05:6808:206:: with SMTP id l6mr4188439oie.5.1621538127240; 
 Thu, 20 May 2021 12:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-18-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-18-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 May 2021 15:15:16 -0400
Message-ID: <CADnq5_MXcOO_a56RzN-qoTrZ2kCH3u1W-vq1hzxnN7eY29VMzA@mail.gmail.com>
Subject: Re: [PATCH 17/38] drm/amd/amdgpu/dce_v6_0: Repair function name of
 'si_get_number_of_dram_channels()'
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
 Luben Tuikov <luben.tuikov@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, May 20, 2021 at 8:03 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c:468: warning: expecting prototype =
for cik_get_number_of_dram_channels(). Prototype was for si_get_number_of_d=
ram_channels() instead
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/=
amdgpu/dce_v6_0.c
> index dbcb09cf83e63..c7803dc2b2d53 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -456,7 +456,7 @@ static void dce_v6_0_program_fmt(struct drm_encoder *=
encoder)
>  }
>
>  /**
> - * cik_get_number_of_dram_channels - get the number of dram channels
> + * si_get_number_of_dram_channels - get the number of dram channels
>   *
>   * @adev: amdgpu_device pointer
>   *
> --
> 2.31.1
>
