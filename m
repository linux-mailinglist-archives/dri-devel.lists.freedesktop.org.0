Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED0738F33B
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 20:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A526E90B;
	Mon, 24 May 2021 18:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F096E909;
 Mon, 24 May 2021 18:49:06 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id h9so27982180oih.4;
 Mon, 24 May 2021 11:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dYnEhzkp1dbbf9fIGVRRORFDdaTodcnnOdSTVqP9m0o=;
 b=J3EkV+L9cKqEC9dducGQe+dlBDeMynfnUMq+roxzZEzKLRGNcT56FSxo8Ei5FeMx9C
 5OeCXpu0A4JO9WW4UhE3RpEM26Ari6+3g4EcsBxkChmBIzewPsSA9EBS2SLG5QaR27f+
 wj6/1NBybMiWJZwBBPkUyzliWdjaSUvZDPHlcEiMBw9DeugmzMAcZUBbM6sF7CsYghl/
 ghnzS0dH/qs9krdIbeCr+R2u00qPaEQ8aM5DeVSD/u0sD5nyJUNQ/Iw5a4taqbyDdoT2
 05GQday22Hv7KDHRrMyHlo9lWGmOaEKIDUdPmh4JIjhM1gjsq/IT7F70IZF1gH2nTYTV
 v+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dYnEhzkp1dbbf9fIGVRRORFDdaTodcnnOdSTVqP9m0o=;
 b=N8guqYcQbfUbRufjmaDZT+/PEp+CGtG/OpyMF6esPxXSYYvuMiGfiG9xU9zJX6+pE5
 3ybQPH1tV5eIrp4TJt3ED7nPukcK/Q5M/FQ+OhwBcUqYUoeLyjGRGfcHySmuXLRcH+K7
 nhCsXWeUxMhLfvlSxPNnMR63H5OROYYGmcOwL+bF6fXfEEvXOzNfNdgjs/1dedgAjQAT
 CeH08xlCk7xAxeoIWqUM83PGOV+bs/NR5d44HyiNJaUCjVxXBp1hux6Anp4e12XuG9tP
 M94DroOrLfPgs0dIBoq9DmisPDv+HLPJqvEzx5l5U+XNlRTxKEg1VkaaSolEk+QQhoCb
 gqUg==
X-Gm-Message-State: AOAM5301AhhAp7vFctWr9PTGoyaruGCB9EPbP/q7aeUpm9HUSGu6llJ2
 5VUY3v5zMImCZ9EMGAUnc2xdQnliHZU4cbQ0OOg=
X-Google-Smtp-Source: ABdhPJwVX9evJqZgQ8DoevhP5UkPf9wyiPN6kdoDCnSMac0ZTswKiitlAwMr0DjZ60GMh/dFVtX2UO7EU+ZEJZcSc34=
X-Received: by 2002:a05:6808:206:: with SMTP id l6mr329581oie.5.1621882146073; 
 Mon, 24 May 2021 11:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <1621853213-55876-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1621853213-55876-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 May 2021 14:48:55 -0400
Message-ID: <CADnq5_N3WkoYHcn8b1-qZ23+t=E9xxV5fV_1Lwqck6x2dUPqmA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove unreachable code
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, May 24, 2021 at 6:47 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> In the function amdgpu_uvd_cs_msg(), every branch in the switch
> statement will have a return, so the code below the switch statement
> will not be executed.
>
> Eliminate the follow smatch warning:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:845 amdgpu_uvd_cs_msg() warn:
> ignoring unreachable code.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> index 82f0542..375b346 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> @@ -842,8 +842,6 @@ static int amdgpu_uvd_cs_msg(struct amdgpu_uvd_cs_ctx *ctx,
>                 DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
>                 return -EINVAL;
>         }
> -       BUG();
> -       return -EINVAL;
>  }
>
>  /**
> --
> 1.8.3.1
>
