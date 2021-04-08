Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0CB35839F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 14:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2696EAD0;
	Thu,  8 Apr 2021 12:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CD86EAD0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 12:50:04 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id z8so2079201ljm.12
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 05:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ue62b/nOsWagddlxWSHgZE+xJ7jpEp33uT3hApzk61s=;
 b=vvSgQJ10J71/hJsIWwLP3XbsOekOzbhwMvBACn4AWfAGleRLrUNzHNNK5uzeLyioMB
 oXIl0KjQfY0cc+zIdEytIHzN42/OjUgsVSyQzPNF7LHyemG4aoQzWGjp1kQcgyP994UF
 PBZBxmSiF5r5UO7u4g9kPbjUHVxyNNgYMU5Knd5mi7CHQ+mjXkXFxyyxdoyhMqiKcHh7
 KD6xoCCNSIaQ7e7UvoyagNDB6CPkDalEXBqyL+CK5Z+carCsx1vQWABrVJ+/Y/1Z2juI
 00Ab6erVT5dMmK0+1wheunsMvAYIodPt4qdrCvcG+ZzapbmUF0rbOlXfcBEE0hLDekJq
 R2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ue62b/nOsWagddlxWSHgZE+xJ7jpEp33uT3hApzk61s=;
 b=qz02wH+aNGkHRRByJzUlr1boZ+hXPjr4l/Nf5UKJRA3NBUB7lt6p0LB0DBZ9UTUvEr
 1mLDoeblAlKSTBgvYivuPjlAapfuLEX4vAtD0IFtGPtWODTf9clyEWoNxkLlVodGqZT3
 /EOvHoe4w7geix/jIX/MA/5qzOImH5fBOo2HQb/OKBNER30xUkpfqU/jY95vVRRVNkE+
 rp7P7HOU1rPkhDtUppsP3L4TIsaRrrBLyw0Bc1xHHr4TOTh2+Mq0NSeB6TSyuVtrHEc4
 7d8Hr8bdYyZI8HcPyxAJ2g7TlFY+hevHzwcCY4B0x00aDxV5nUBrdWVHTXt2ciy05j7R
 t/AA==
X-Gm-Message-State: AOAM533n+CQPg8bskXiKewZLl9i+/VNP3K54GPKzifcM7CoRDzaYaQ7m
 ZgcOYzNJHXcwq795IB+0rkmpaMMOvMuDAnmfNMW0ng==
X-Google-Smtp-Source: ABdhPJzHwP6BmbIRqU1HYc3FQkCjshHvviqMY3IIos9nhT5ENCEad5QCJ7O5xWMp2CMbQh00KOeiYn4d7d9pP/p57KM=
X-Received: by 2002:a2e:7001:: with SMTP id l1mr5550860ljc.200.1617886202537; 
 Thu, 08 Apr 2021 05:50:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-3-david@redhat.com>
 <CAK8P3a09LdJ-87ZrN28y=t8Sa0zL-3NOvEWhkStMY+2EbO7UAw@mail.gmail.com>
 <cd14d4b4-da82-b21c-2cd6-8e474d97b955@redhat.com>
 <CAK8P3a0Wg1mGZoBkD_RwMx-jzQNK2krrDxDQV5uhCHoyz-e=dw@mail.gmail.com>
 <7496ac87-9676-1b4e-3444-c2a662ec376b@redhat.com>
 <CAK8P3a1tVwkDbtvKi8atkrg1-CfoQHGrXLCzn_uo+=dfZJfdQA@mail.gmail.com>
 <3a2d64a7-8425-8daf-17ee-95b9f0c635f9@redhat.com>
In-Reply-To: <3a2d64a7-8425-8daf-17ee-95b9f0c635f9@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Apr 2021 14:49:51 +0200
Message-ID: <CACRpkdYizKGhtYzE+22oZAduLNCOGP9Vbp=LQbXG1C-a+MyMcg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
To: David Hildenbrand <david@redhat.com>
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Andrew Jeffery <andrew@aj.id.au>,
 Masahiro Yamada <masahiroy@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Michal Simek <michal.simek@xilinx.com>, Linux-MM <linux-mm@kvack.org>,
 Joel Stanley <joel@jms.id.au>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Peter Collingbourne <pcc@google.com>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 8, 2021 at 2:01 PM David Hildenbrand <david@redhat.com> wrote:

> > This is something you could do using a hidden helper symbol like
> >
> > config DRMA_ASPEED_GFX
> >         bool "Aspeed display driver"
> >         select DRM_WANT_CMA
> >
> > config DRM_WANT_CMA
> >         bool
> >         help
> >            Select this from any driver that benefits from CMA being enabled
> >
> > config DMA_CMA
> >         bool "Use CMA helpers for DRM"
> >         default DRM_WANT_CMA
> >
> >           Arnd
> >
>
> That's precisely what I had first, with an additional "WANT_CMA" --  but
> looking at the number of such existing options (I was able to spot 1 !)

If you do this it probably makes sense to fix a few other drivers
Kconfig in the process. It's not just a problem with your driver.
"my" drivers:

drivers/gpu/drm/mcde/Kconfig
drivers/gpu/drm/pl111/Kconfig
drivers/gpu/drm/tve200/Kconfig

certainly needs this as well, and pretty much anything that is
selecting DRM_KMS_CMA_HELPER or
DRM_GEM_CMA_HELPER "wants" DMA_CMA.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
