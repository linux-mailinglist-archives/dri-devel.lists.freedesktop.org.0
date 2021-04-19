Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8A93640AD
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 13:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506A16E284;
	Mon, 19 Apr 2021 11:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA666E24D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 11:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618832617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=328beX0Y8euNQ3/bq0gYCGzKWoHwLr1bHGXl0+OSrSs=;
 b=PLvhTVm/eK9A+JWM3mcVo8Qq25PXkmrebG46dGkMLLfNTE7k5Nm7IofeHCUWcBve3gF5HO
 QenlP8dwJ7e1x09ogEueUStrsYH+uBW/fowsek4ZVFz943PvFRcQu35DhembAyKRBl8D1b
 7JXJmKeVa3Glr0/FYd3+Z1jX/CSlw5o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-E8QTrGV1MGuwJJK_QiHNAA-1; Mon, 19 Apr 2021 07:43:35 -0400
X-MC-Unique: E8QTrGV1MGuwJJK_QiHNAA-1
Received: by mail-wr1-f70.google.com with SMTP id
 91-20020adf82e40000b0290106e67e7bfcso6137242wrc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 04:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=328beX0Y8euNQ3/bq0gYCGzKWoHwLr1bHGXl0+OSrSs=;
 b=LZE8aZsvl4jcuMSYWTeoW2FDuSz+7ovHwQrNyaNrukr3yJhlR0SASYZ5oEQU+uI9Pa
 6ZtIM7Sa11d04fjsy6O3P/M3Q/OvPFRUTTLgQlEmiSyEhjhNDa8nbxkOgRFa9vzlMXo/
 uF45hUB5I//rIRy5a+6fV2DfXyq5DA8+rjznushba0V9tuT4lGSqLKFWPvLTHO6WJieg
 E0eKeWi6CNlwjQ7BUbU2T67nOP4jrckuTpz4nLKtOvaMrCC/igcowhuJJxFYN7ryQOq9
 yWjBecvEtpLEfFjRjUjqWC647CtdOuNtOlzc3MgNn0hOcHKB1tPuepHt73xMZl+i459i
 oPpQ==
X-Gm-Message-State: AOAM5333yjTyvRUYXrWjsp47zOCTKTleZ8ABgLCNTZPNW2LwC3AQ2/XL
 /KUr7lyO7M/m1+PmP6gE++os80+xabTTb3UPYvmW2HN6xltHq6cBNtdKkXUNmg94Etc2k2+h4BG
 6tAbdPzw6KMl4BK+XJP37hgM7gmNjLp2Jdz8jmZ3WNXrm
X-Received: by 2002:a5d:524d:: with SMTP id k13mr14473071wrc.113.1618832614885; 
 Mon, 19 Apr 2021 04:43:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOgVCGSvDVcpbecEJkN3C9WOb/HAPuFV3M1eNh/o4kfj3wD4qQBo8QFWYdgxFRz7QrP15fBD3eaP9svuQ95yc=
X-Received: by 2002:a5d:524d:: with SMTP id k13mr14473060wrc.113.1618832614773; 
 Mon, 19 Apr 2021 04:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-7-lee.jones@linaro.org>
In-Reply-To: <20210416143725.2769053-7-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 19 Apr 2021 13:43:24 +0200
Message-ID: <CACO55ttdMHPf3UrGAsY+vNxaq66QKi7FdbeyfLiFx6Hnst0tJA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 06/40] drm/nouveau/nvkm/engine/gr/gf100: Demote
 non-conformant kernel-doc header
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Fri, Apr 16, 2021 at 4:37 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:992: warning: Function parameter or member 'gr' not described in 'gf100_gr_wait_idle'
>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> index 397ff4fe9df89..69e6008f99196 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> @@ -982,7 +982,7 @@ gf100_gr_zbc_init(struct gf100_gr *gr)
>         }
>  }
>
> -/**
> +/*
>   * Wait until GR goes idle. GR is considered idle if it is disabled by the
>   * MC (0x200) register, or GR is not busy and a context switch is not in
>   * progress.
> --
> 2.27.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
