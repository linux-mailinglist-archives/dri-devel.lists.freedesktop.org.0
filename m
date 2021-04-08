Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A49C358F69
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 23:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C511B6E3F7;
	Thu,  8 Apr 2021 21:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209DC6E3F0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 21:45:36 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id b4so6409145lfi.6
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 14:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8MVBTVTbGflc/UsLhIwl2nRzF2EsRH8eZ0QlPXqs5ps=;
 b=Zk2v3nSMdaCm5adH4aHswvLKgEBKklbkCPH2zPgIVKp64w70n2axR/qGDplIQ0OZ0n
 HLegwMCSSCAxIt8LPsDPeA7J+lV2LnPtLiSNhLWjp/m3yDKXUPRvs0hxnHugTRrpsB6U
 uiiThswQsEAPRovlktmLYn49OPrRupsH66VDSzbKlxFr/Wn44w766AsgYLN7vrCHZLyR
 Uur3yAtqGAhF8O/MxSPYa1P5Yxp+6YntEF7We62ytpY0VEX1MNQUtmH/O+iMLbWa2H+y
 yeUIQCjgCMD2v6FVfHm061JaiZ7pmmjnI2REqJ3G0vMQF8z8vVWj0AbKZlNKPI0hg/VG
 eF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8MVBTVTbGflc/UsLhIwl2nRzF2EsRH8eZ0QlPXqs5ps=;
 b=PCwtTvnn4ucUIOIYqpKIQu7a9Tk9S6nP3GxnsGYEzDbOm3Rn6RaNUUBMKTPxmTBCDU
 aQOUj8vzD7viObEw/DxZffcwwxMxG4wJ4zwgidGyLIucQKci5xIhfxdsDSdK78PntKnB
 GxSLWhgas7GuIMxHSBC60sfQpCjKZcqWqhiOqbAd/8NTY5BiaV63Vaazt9m2vdVUloXd
 v6Tuvq03IdcRuQ7RlGeDKwdW9yxK2xaftk570W8moUPuHk/e9a2ExKUFPZq39x1Ozz6u
 2oe3+9KPMfTl0bpvVxe153WpvsjJha6kFjG6rve3Qu2i7KXtbFJV5VW7xSO2x5UNbArD
 qYxQ==
X-Gm-Message-State: AOAM530G3GW3vbTldgUtBdaqkKtFlJxzFYiadTbGL155YL7Q2kNcT8e5
 Bga9HuRVH0aWuqJTPu1p0M+PFNrd2Jl6TAXijbBd/A==
X-Google-Smtp-Source: ABdhPJwOR1qaBP0hkaYoeDA9UZM861Q2LgMU2bP4wenXDG9wfbiuruw1rThn3wnUQVO3cDtDB82sQHZzPUH6KOtdfMo=
X-Received: by 2002:a19:ef18:: with SMTP id n24mr8062945lfh.291.1617918334556; 
 Thu, 08 Apr 2021 14:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-3-david@redhat.com>
 <CAK8P3a09LdJ-87ZrN28y=t8Sa0zL-3NOvEWhkStMY+2EbO7UAw@mail.gmail.com>
 <cd14d4b4-da82-b21c-2cd6-8e474d97b955@redhat.com>
 <CAK8P3a0Wg1mGZoBkD_RwMx-jzQNK2krrDxDQV5uhCHoyz-e=dw@mail.gmail.com>
 <7496ac87-9676-1b4e-3444-c2a662ec376b@redhat.com>
 <CAK8P3a1tVwkDbtvKi8atkrg1-CfoQHGrXLCzn_uo+=dfZJfdQA@mail.gmail.com>
 <3a2d64a7-8425-8daf-17ee-95b9f0c635f9@redhat.com>
 <CACRpkdYizKGhtYzE+22oZAduLNCOGP9Vbp=LQbXG1C-a+MyMcg@mail.gmail.com>
 <2ef3b65c-c0ef-7bbe-0e05-39ee8f2bae48@redhat.com>
In-Reply-To: <2ef3b65c-c0ef-7bbe-0e05-39ee8f2bae48@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Apr 2021 23:45:23 +0200
Message-ID: <CACRpkdbMLBzG_Q=-XzjsWvpofHyRv7sdB697mHLaRu4F=+GC-g@mail.gmail.com>
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

On Thu, Apr 8, 2021 at 6:44 PM David Hildenbrand <david@redhat.com> wrote:

> > drivers/gpu/drm/mcde/Kconfig
> > drivers/gpu/drm/pl111/Kconfig
> > drivers/gpu/drm/tve200/Kconfig
>
> I was assuming these are "real" dependencies. Will it also work without
> DMA_CMA?

It will mostly work but that is only because the reservations are
mostly contiguous anyway because they are done early and
are small. The hardware requires contiguous buffers in all
three cases. I'm not sure I always got it right.

> > certainly needs this as well, and pretty much anything that is
> > selecting DRM_KMS_CMA_HELPER or
> > DRM_GEM_CMA_HELPER "wants" DMA_CMA.
>
> "wants" as in "desires to use but can life without" or "wants" as in
> "really needs it". ?

I don't know the exact semantics of using DRM_KMS_CMA*
without actually using DMA_CMA. I suspect small allocations
will be contiguous and big allocations will start to fragment?
but it's just my guess. I guess "really need it"?

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
