Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 765964003A7
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 18:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0F16E8B3;
	Fri,  3 Sep 2021 16:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DA36E8B2
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 16:47:12 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id s12so10526473ljg.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 09:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3SbG8sX/0ZzQsMJDjp4NMB1XLP9fPSRfuxnRQ0qJ6ZQ=;
 b=h96jPvB1VF8aXmsyKYTK3pyMfkjlr4jae/eMazr84KKEVE3WPPzLi2drfZe0sltNls
 ezB2zs40eBbOBAXGEZgOIBC/h9TYpHxHyV9nqS09K3LiD89aE2JMppnmeBY2mrvEMKxc
 vIH5g7LBEYPFVstKUTFJLfFel+honSYDWbJZaoE+GV+VdCFmQcIqwmyg0XxY3b8BMj2c
 YS0SrgO4m0l7CqlY79p/FdLyjpU3CcIOGbV6VR/tfo2w/3mbglFhvWKq5g1HLR0GEGmw
 Wt/1hfZqzflI3KNZZZ8AHcrEYVSJzdk/v6pPtL6LNUO0YHz8P2AvUL/46173JDZ2Qv6u
 zvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3SbG8sX/0ZzQsMJDjp4NMB1XLP9fPSRfuxnRQ0qJ6ZQ=;
 b=D60e/QGd+71H0bJaJlFDqmErEteABrvERiYbvQdy18gsMiiV18wAuOwhdzPaMrrGw0
 arDe76Z5GMlHyYONDvRnXeC4wD9jXzfKlvy70bVOKOkDG8q7r9mHFDYY0nT8MgFmHhmi
 MeygK5FOgLVoOU+UrRMi5aejUoH3uQqRpBqCK78yyX8HpKkUW/Vr2YbVEiGMecsVHUJb
 32eKRq31ssB3Vs+br9CK35CRyFP4rdoW9g3HgG51UjIF2BKFb1/zg/ZtsiSBkwrm/nJ9
 0x5F9qB0tY05APnsYb07jBBu6GKixUQzyEqafgzRkSghTJYaE2tPrl4S8t7ds96OhMD0
 b58A==
X-Gm-Message-State: AOAM532j2WDJz4anHwFfBj44rNowCzEANQvbShpJeV1XyUyrz0nOQhT0
 l15afO+V+I0HX1IrRWy/hyeYFwg+pU8Lo0es2sZ/bw==
X-Google-Smtp-Source: ABdhPJwNAt83j9fd+RPScqWuwfEU2cw02u/Mf4m+X7BGCDeel+rBomwbplyiuXmf8qSWEvlZ/A+44IrmpEVPwQGr418=
X-Received: by 2002:a2e:8e8f:: with SMTP id z15mr3538184ljk.121.1630687631028; 
 Fri, 03 Sep 2021 09:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210902124913.2698760-1-geert@linux-m68k.org>
In-Reply-To: <20210902124913.2698760-1-geert@linux-m68k.org>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Fri, 3 Sep 2021 22:16:59 +0530
Message-ID: <CAO_48GF3OL9+x-jdEXN9kYZaS2kBgAq0MNmGYfxKasPWcmJWaA@mail.gmail.com>
Subject: Re: [PATCH 0/3] dma-buf: Add missing dependencies on DMA_SHARED_BUFFER
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hridya Valsaraju <hridya@google.com>, 
 Chris Wilson <chris@chris-wilson.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>, 
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

Hello Geert,

On Thu, 2 Sept 2021 at 18:19, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
>         Hi Sumit, Christian,
>
> This patch series adds missing dependencies on DMA_SHARED_BUFFER to
> various options of DMA-BUF, and drops a bogus select.
>
> As drivers/dma-buf/Kconfig contains interleaved options that select or
> depend on DMA_SHARED_BUFFER, they can't be wrapped inside a big
> "if DMA_SHARED_BUFFER / endif" block.

Thanks for catching these issues and the patch-set. LGTM!

I'll apply them over.
>
> Thanks!
>
> Geert Uytterhoeven (3):
>   dma-buf: DMABUF_MOVE_NOTIFY should depend on DMA_SHARED_BUFFER
>   dma-buf: DMABUF_DEBUG should depend on DMA_SHARED_BUFFER
>   dma-buf: DMABUF_SYSFS_STATS should depend on DMA_SHARED_BUFFER
>
>  drivers/dma-buf/Kconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> --
> 2.25.1
>
> Gr{oetje,eeting}s,
>
>                                                 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                                             -- Linus Torvalds

Best,
Sumit.
