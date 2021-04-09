Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D0E359EE8
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 14:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A8A6EC17;
	Fri,  9 Apr 2021 12:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2FDC6EC19
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 12:36:05 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id c6so6257433lji.8
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 05:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tg6sgY5o6KJ5S57CRLT5oBYc675XGvjvO0a75IDhy4M=;
 b=tD/+WsHQQWYusIiNpWcK7bwWVSNKlMLnyRF8CoJ3CZhMIHxMdvtXVATkH2bY6CsvV6
 4EeqLJcMu8Lx6dXjIGijM9Z71Ysw7FoPhIt4pVwzFK6l7vQQG0p8gmVQcZtmvl5D6mmc
 vnQ4vXPZDk4T7ERYAIs5HJIK9/rMwsb/PGlIkgHlPxrLJNQV9qOSD2eFT+qGhgN9rW/v
 i+5TnZ7zezyrlf0LjEA3nkURPCbcKV3D0THgJHWfMYiU94A6/Dnr2CLqYXHUaZSeUV9C
 jYnvEDTnSyDvM2CCXvtBaB8N7OxfbX9Umv48J+Clvg4cWNbqEuv5MYIvFfkzoLNaHZdC
 sk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tg6sgY5o6KJ5S57CRLT5oBYc675XGvjvO0a75IDhy4M=;
 b=PwrXtyZgSapvTUUNr/Lrd7SShYaxCWAUf760vbpgiXwOtrKbW+y/KHSpDfrKV3vNT3
 HSuXiTODKpRTAxcGS3ja1eK/Eh2+K1tYDHI8QHTXm+ZxWFRR6tBcfOPDKwKj0Pkd4gVu
 w0sakuj3xegtehF5jYMTZhwWqHANeUgiAPjjvREtYOwoT7UvPykO5a13HS0nr93ld257
 CtC3jqLOCLMhRlW7E7ppDzBCw1oQrOokYULbkBM+WapP9ZhtDzCPB+RHw54iWcy6pBNW
 GhoXpJuGsDAcMFp+mVx3yivsEUMJQjCs7oi8iQMAH9B0vUxC2kzD6BURK98lmsNCnMD4
 Npfg==
X-Gm-Message-State: AOAM5338iHrF7SMbjQgMZMV9de7ins73Co4GtKh2OJas66dAI5pLxITg
 TDT/EglfBjZ3gxH7Zut2zfpC/ywoDlM+086derTlhQ==
X-Google-Smtp-Source: ABdhPJxh1RNVQiQp5bCHRakekzyhAZR4aqS7papfBzgGL0DdgK61i7YYHDZZLT+jLT3UuH+d/zlCtwSkkzSHByUlUhw=
X-Received: by 2002:a2e:1649:: with SMTP id 9mr9682701ljw.74.1617971763963;
 Fri, 09 Apr 2021 05:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210409112035.27221-1-david@redhat.com>
In-Reply-To: <20210409112035.27221-1-david@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 9 Apr 2021 14:35:52 +0200
Message-ID: <CACRpkdb_eQrcCFV9Q9uho8E6HO4X0dRJp1qAdJBcT82=sZ1v7A@mail.gmail.com>
Subject: Re: [PATCH v3] drivers: introduce and use WANT_DMA_CMA for soft
 dependencies on DMA_CMA
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Suman Anna <s-anna@ti.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Joel Stanley <joel@jms.id.au>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Peter Collingbourne <pcc@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Jeffery <andrew@aj.id.au>, linux-kernel <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 9, 2021 at 1:20 PM David Hildenbrand <david@redhat.com> wrote:

> Random drivers should not override a user configuration of core knobs
> (e.g., CONFIG_DMA_CMA=n). Applicable drivers would like to use DMA_CMA,
> which depends on CMA, if possible; however, these drivers also have to
> tolerate if DMA_CMA is not available/functioning, for example, if no CMA
> area for DMA_CMA use has been setup via "cma=X". In the worst case, the
> driver cannot do it's job properly in some configurations.

Looks good to me. At least a lot better than what we have.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> Let's see if this approach is better for soft dependencies (and if we
> actually have some hard dependencies in there). This is the follow-up
> of
>   https://lkml.kernel.org/r/20210408092011.52763-1-david@redhat.com
>   https://lkml.kernel.org/r/20210408100523.63356-1-david@redhat.com

You can just add these to the commit message with Link:
when applying so people can easily find the discussion from the
commit.

> I was wondering if it would make sense in some drivers to warn if either
> CONFIG_DMA_CMA is not available or if DRM_CMA has not been configured
> properly - just to give people a heads up that something might more likely
> go wrong; that would, however, be future work.

I think the frameworks  (DRM_*_CMA_HELPER)
should pr_info something about it so the individual drivers
don't have to sanity check their entire world.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
