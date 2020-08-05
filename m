Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB65823D17A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 22:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB7C6E835;
	Wed,  5 Aug 2020 20:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778066E834;
 Wed,  5 Aug 2020 20:01:34 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c15so5617368wrs.11;
 Wed, 05 Aug 2020 13:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sFMazUp0MhwJbVuexgj1bxt76f5CLnr6BJ4vAddg9SU=;
 b=clorqv+GMwdktNqZ6yyQxXrKzFF6/uB+b5UtHOzV5SpjRSNFQ89UimVPAVq4+9+NSo
 OHRqMlxYcEasQ3TVdW5ps6BHjWd7Y0TElNh/rAhBHZJ9VXFG8ud6KZAiF1Ik40MEn3ux
 JSH7uR2kmM+6HCKQgIn6onU0fuQqfGIHGZrKkx5raOUaLR3nJCgCUm9y4bsf45vpFb7R
 GAb5WCzsUSZJ3JhpIul+FGKcCtEklbMpGNS7tuionEjy3dJ/JTOmY2ZUws3eyk7qoPBo
 UZv5Xc+GIR7hK6+W5zAO0YoeyZJX+f00gcwsw5G1mNngdt/2pMvtz+osrtNJ0cK/KS7a
 r9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sFMazUp0MhwJbVuexgj1bxt76f5CLnr6BJ4vAddg9SU=;
 b=KSi/+RYtJCyXMwLPLodfl8yDL1EtDtcO0ZgMXEm/AeXkT7wQJu/flT08w6yzEYSKoo
 qY6rKcmrfez1RLANAyM814go6zFy4SS6AOgjB4Du3jS27YniIp432j3u8Ah/Xz1cBHKO
 wWXnJ8fMKD88K1wjaR9UgYPgadrQrKhaf5ivakLZPbvY+bSL4i5f1aBmvwGyF+npgIna
 v8krtc13sDHgINGRMUwPj8UEh++3R73sx/c13kJqe9n5rJdAF77t8bF9QSDmHWriRksg
 eKPdUBytdVW0O7w1dzLye4kK8CXhUJd8A6amnu+yggZVVPIvLibqIvjLq8+5yv5qwRft
 ZNRA==
X-Gm-Message-State: AOAM53341IyG+Q4x+4cLXLM1/dME1x3Nu5tRZPmepGHAN6Xy/2MjgjC4
 FmBjd7+Lo0ZgMylj8dI2srOF/XBHubA9/HycMSI=
X-Google-Smtp-Source: ABdhPJzcEbloQmJvxKNefm95pR63lEvoWfrv/5u8FdjvGjUP4tRNqqhD2adAS9zjFX5NZBZdKixnLqEcd/X7qdyfync=
X-Received: by 2002:a5d:494b:: with SMTP id r11mr4356598wrs.419.1596657693122; 
 Wed, 05 Aug 2020 13:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200805113510.18277-1-colin.king@canonical.com>
In-Reply-To: <20200805113510.18277-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 5 Aug 2020 16:01:22 -0400
Message-ID: <CADnq5_NA9f2N3xkH4WAdDEP+0-5W0LkmTRy3yXqFdnWQmfsVmQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix spelling mistake "Falied" -> "Failed"
To: Colin King <colin.king@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 5, 2020 at 7:35 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a DRM_ERROR message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

This is already fixed.

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> index 49d4514aa6ed..c68369731b20 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> @@ -2010,7 +2010,7 @@ static int psp_suspend(void *handle)
>
>         ret = psp_tmr_terminate(psp);
>         if (ret) {
> -               DRM_ERROR("Falied to terminate tmr\n");
> +               DRM_ERROR("Failed to terminate tmr\n");
>                 return ret;
>         }
>
> --
> 2.27.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
