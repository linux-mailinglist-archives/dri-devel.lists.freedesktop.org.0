Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B10A01388FE
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 01:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CB789B7D;
	Mon, 13 Jan 2020 00:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8422F89B68;
 Mon, 13 Jan 2020 00:06:25 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id i78so2093396vke.0;
 Sun, 12 Jan 2020 16:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2HL17RsQhpvHGVShSuMEnDCDjyjoYw8RfuvSsolxtKc=;
 b=BJ46d3g1EqtVBj1REWG1osVEA0ioMzxPhH28Voa7Awf1EbCYKRi/or0ikFnFF0Xtj5
 e0JfYLf1HxqHlmkqdsJ7sRitHZuL6W1USF1SxIJv60yhpJTNYkDvM4MUVLdt1kUs3sAa
 hn901YxwMn96I/6B6WDo8r63EhWYRW72DyhKp85pfztWr116M8l96gtMgjJ5uoYjgn7i
 qLzV40TO01xhlnShJitRxTqNCZgZL76N2mQr3gFOHb79/NGtJkPvH0DsV1MhgHPflAgN
 Ib0YwyNqtbrWiCbmZVKzEEZUB1P09dM4gNkaqm0cZuppRHBWUK5tW1cUyP8RJaSKvcAT
 JfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2HL17RsQhpvHGVShSuMEnDCDjyjoYw8RfuvSsolxtKc=;
 b=EP0X+2D0vo78F8gYMgH8wrhHNP+5T1wYwPmTsbDb773TyY7YOjA6urlZMXV4klYC4e
 U0ZWZLRpXYUM3CeTaSFY8Row8kqFWUwc/ysZzPIjo/zlG8S49h6kf9kk/RJfavaeaWK6
 ZKop11oVq9ZmRUgJOLGhGDsuvmHz4hhbvNtNkQu+KmrMURiaZaR2Zaj/WGq5Ymz9b+2I
 LtXgm8E87gAVRXxdjUvUXKFmImvXdcpSQM1HXSZNGmuML/pYi/kPW+ldv+S303AmoHU8
 H8VL+GsMXSGgoA0iNYRupiTANI2UwM7gu7yaZojTkCehjfoi2O49zMWFAlZb/b+3uyQW
 fIFw==
X-Gm-Message-State: APjAAAVtv82d/bvUWkCKDFhlNxw96pgCCLv9s8C7h0W/4GwcNefYTfKl
 vvyaIitqjtGztU5TV1mi4qdPxzz5xbe1pZiwBP4=
X-Google-Smtp-Source: APXvYqzGUmlmfiMEzFg+1Y2A/xrmXNSvnyyQzuYUdfcc1RWK1JrFT8cW87AN1eibIhZjvgcBqYpoB/Fmq6QSxuCaLFI=
X-Received: by 2002:a1f:1144:: with SMTP id 65mr5884087vkr.77.1578873984539;
 Sun, 12 Jan 2020 16:06:24 -0800 (PST)
MIME-Version: 1.0
References: <20200110063201.47560-1-yuehaibing@huawei.com>
In-Reply-To: <20200110063201.47560-1-yuehaibing@huawei.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 13 Jan 2020 10:06:13 +1000
Message-ID: <CACAvsv6EG0wvF4XCs=jisEjMDkfVUgMorgURko4uubqc3DOgOQ@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Fix copy-paste error in
 nouveau_fence_wait_uevent_handler
To: YueHaibing <yuehaibing@huawei.com>
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
Cc: Dave Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@canonical.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Jan 2020 at 16:51, YueHaibing <yuehaibing@huawei.com> wrote:
>
> Like other cases, it should use rcu protected 'chan' rather
> than 'fence->channel' in nouveau_fence_wait_uevent_handler.
>
> Fixes: 0ec5f02f0e2c ("drm/nouveau: prevent stale fence->channel pointers, and protect with rcu")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Got it, thanks!

> ---
>  drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index 9118df0..70bb6bb 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -156,7 +156,7 @@ nouveau_fence_wait_uevent_handler(struct nvif_notify *notify)
>
>                 fence = list_entry(fctx->pending.next, typeof(*fence), head);
>                 chan = rcu_dereference_protected(fence->channel, lockdep_is_held(&fctx->lock));
> -               if (nouveau_fence_update(fence->channel, fctx))
> +               if (nouveau_fence_update(chan, fctx))
>                         ret = NVIF_NOTIFY_DROP;
>         }
>         spin_unlock_irqrestore(&fctx->lock, flags);
> --
> 2.7.4
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
