Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9664425F7F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 23:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6706E039;
	Thu,  7 Oct 2021 21:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A289D6E039
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 21:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633643209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UPSqvOGCu+GJcDa90zr7X1MG9KfGKC/5VQJKgH+ViDk=;
 b=hahvo5/WENvK5Yss5aK/RHhDFVNEnuNjX31LD6dbUcEF6a0j20Z7cmS5KCHoYjWlbypCp1
 KpYzvSEwye34YGikV8UZVrAUADWGRE16O0OzcAdTNhbB2idBnZj0oKC/yqOweQvMGmKmt9
 PtfEieHYSKmj5o8197sUw0zPqEvNbhk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-KGPb7OelOM-5gux_9llrJg-1; Thu, 07 Oct 2021 17:46:48 -0400
X-MC-Unique: KGPb7OelOM-5gux_9llrJg-1
Received: by mail-wr1-f70.google.com with SMTP id
 v15-20020adfa1cf000000b00160940b17a2so5716107wrv.19
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Oct 2021 14:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UPSqvOGCu+GJcDa90zr7X1MG9KfGKC/5VQJKgH+ViDk=;
 b=MAScKWt/FShK94ntRR5OlfMBhcVMAKAh2hWa3MReMZRYS4RKb9asB5SIaF9b+/VLU9
 sMpRDq0kS+8hykqW5OoMz4g2RVNyQkj7qgzez5IOq6mtjhuyXWSJZI0TIeozxRyJuIvW
 V1bGY9FOB16tDEfZucAMqyYTdieAqppKOIxjUCZTvF/xjpOoYyhtYYSf9YU1/UtGMO7Q
 mrs7dnCI1r3nHdyLIgiq/vgpMyGDP1bfiWftyaNRys2TXk85F2TKPWVyQ6N+kmuaxinw
 zXlPIqJ5BuQUVKwR0T99o/VkF92uQYPCUmNPk0lC7uO3XlnLcWU+QWC+fJOyz/S+ZyaA
 0O8Q==
X-Gm-Message-State: AOAM531K+9I/tQjOGld8n6QBSC2N9TvQsdDdZ1HneL3EJ6vEWHW3rrMj
 H7636eS9PfSBzoqam8ctaDC91T5d13bwn6ryhhWUtgwkx1OfMWpdwmWdpIlfFJQ7uh/7z4rBUDn
 XmDwR2/XOW1uwsO/9tUI0P1qZ8fLuriB1AT69EREUNvtU
X-Received: by 2002:adf:8bdd:: with SMTP id w29mr8423690wra.49.1633643207403; 
 Thu, 07 Oct 2021 14:46:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqAKo0aK9SLNTCPUFBer0OSZTRHIE2Hyrqtsw01LVQXzy+cOws4WYmJCdoRH/WN4MFlYIehJPJYTXoJ/WR+4Y=
X-Received: by 2002:adf:8bdd:: with SMTP id w29mr8423659wra.49.1633643207147; 
 Thu, 07 Oct 2021 14:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211007214117.231472-1-marex@denx.de>
In-Reply-To: <20211007214117.231472-1-marex@denx.de>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 7 Oct 2021 23:46:36 +0200
Message-ID: <CACO55tsgmtR1CqdJOBMu9oQEEojfpnUwWNvab9gA7ZuZmyiSmA@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/fifo: Reinstate the correct engine bit
 programming
To: Marek Vasut <marex@denx.de>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 nouveau <nouveau@lists.freedesktop.org>, stable@vger.kernel.org, 
 Ben Skeggs <bskeggs@redhat.com>, Lyude Paul <lyude@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

Reviewed-by: Karol Herbst <kherbst@redhat.com>

I haven't checked if other places need fixing up yet, and I still want
to test this patch, but I won't get to it until Monday. But if
everything is in place we can get this pushed next week so we can
finally fix this annoying issue :) I was also seeing some minor
graphical corruptions which would be cool if this patch fixes it as
well.

Thanks for the patch and poking us about the bug again.

On Thu, Oct 7, 2021 at 11:41 PM Marek Vasut <marex@denx.de> wrote:
>
> Commit 64f7c698bea9 ("drm/nouveau/fifo: add engine_id hook") replaced
> fifo/chang84.c g84_fifo_chan_engine() call with an indirect call of
> fifo/g84.c g84_fifo_engine_id(). The G84_FIFO_ENGN_* values returned
> from the later g84_fifo_engine_id() are incremented by 1 compared to
> the previous g84_fifo_chan_engine() return values.
>
> This is fine either way for most of the code, except this one line
> where an engine bit programmed into the hardware is derived from the
> return value. Decrement the return value accordingly, otherwise the
> wrong engine bit is programmed into the hardware and that leads to
> the following failure:
> nouveau 0000:01:00.0: gr: 00000030 [ILLEGAL_MTHD ILLEGAL_CLASS] ch 1 [003fbce000 DRM] subc 3 class 0000 mthd 085c data 00000420
>
> On the following hardware:
> lspci -s 01:00.0
> 01:00.0 VGA compatible controller: NVIDIA Corporation GT216GLM [Quadro FX 880M] (rev a2)
> lspci -ns 01:00.0
> 01:00.0 0300: 10de:0a3c (rev a2)
>
> Fixes: 64f7c698bea9 ("drm/nouveau/fifo: add engine_id hook")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: <stable@vger.kernel.org> # 5.12+
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c
> index 353b77d9b3dc..3492c561f2cf 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c
> @@ -82,7 +82,7 @@ g84_fifo_chan_engine_fini(struct nvkm_fifo_chan *base,
>         if (offset < 0)
>                 return 0;
>
> -       engn = fifo->base.func->engine_id(&fifo->base, engine);
> +       engn = fifo->base.func->engine_id(&fifo->base, engine) - 1;
>         save = nvkm_mask(device, 0x002520, 0x0000003f, 1 << engn);
>         nvkm_wr32(device, 0x0032fc, chan->base.inst->addr >> 12);
>         done = nvkm_msec(device, 2000,
> --
> 2.33.0
>

