Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E17835847D
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 15:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9B26E19B;
	Thu,  8 Apr 2021 13:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0881F6E19B;
 Thu,  8 Apr 2021 13:19:39 +0000 (UTC)
Received: from mail-oi1-f176.google.com ([209.85.167.176]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MTzjI-1l3e0p2czK-00R49h; Thu, 08 Apr 2021 15:19:37 +0200
Received: by mail-oi1-f176.google.com with SMTP id i3so2114193oik.7;
 Thu, 08 Apr 2021 06:19:36 -0700 (PDT)
X-Gm-Message-State: AOAM530iARu9AyE9oOClAP6fIBFEKL4icMzit/CAZlDRfiLswEWmuixT
 RFADZywKPysJmRHOHyWnbFGyNIeGKpwpK1O1Ssg=
X-Google-Smtp-Source: ABdhPJzHb7t36K8Eh3/YW98i9jFFwt105TSLCljFkAhUwPloRFuMsDPsNoXrOsOYqi1vkp97GaHnIbSFi7HvVPlRimE=
X-Received: by 2002:a05:6808:313:: with SMTP id
 i19mr5867255oie.67.1617887975911; 
 Thu, 08 Apr 2021 06:19:35 -0700 (PDT)
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
In-Reply-To: <CACRpkdYizKGhtYzE+22oZAduLNCOGP9Vbp=LQbXG1C-a+MyMcg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 8 Apr 2021 15:19:19 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Wu7tT-YajfdXSSVvg5MYMEnEy3APJ83DcLeJdGkkSrQ@mail.gmail.com>
Message-ID: <CAK8P3a2Wu7tT-YajfdXSSVvg5MYMEnEy3APJ83DcLeJdGkkSrQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
To: Linus Walleij <linus.walleij@linaro.org>
X-Provags-ID: V03:K1:PExc2Nn9ZQWjgqED09K3r4Bk848iZiqC7n53nerDSc0J4M3RZJS
 ++MmPHRf56eBzSV14Sp1JwARRSlJdDa3A2XFeEQngkPWvam9D5IYk0P17M3ci0Xd68sMGBG
 qpj9SK7mshsEDeowN7pe5YLLIZvo1DjSs2DM5PvZQDXqzBUnIkVGFJb055dVBSOHxBCu+Q0
 YdoFW7kOGqtq7ElqgpU2w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:w2kodYd7nlY=:vyYfay29E/Xi8AqoJdVHT6
 s87+VroKpVCtXTWS6inSqubXLKmp8icGMhJnREj8YkCrtV7xT7WVoKM8ruwAqEA77fRrtGuLU
 FrSJ9ind5Yj2N7LNy1ZiG3ih2l/HCb6ajDOzYcKOWHhLZROamOs23Mi3Ij1FFSwjp+BOvrNl6
 NomBGhLu31+jdHhH0NwpHcWPWy5ZhYXV6U/4iaeoceHmSe4xxOIGPmSoJ5PVZehePf4cwatRf
 noyGnaHG0pvvPReAObgOBFDcmysccC4OU81Cx24R8+N+A9FrXt3FIo9rF6hz2LxK6RL06DjSq
 T9+kxHz0VjtSMcPSjBFOFYkRc921/V3LczYTpvz3Y2hW4HcwKv3G7YpvGjBCcM+jWNnT+bYyJ
 zVIO48kCj2vhCBL/YiS3DcigYeaOsQotKKqIvnWfl771Oz7vKH2F6LG1kh16zq+eee5JI72ap
 jhbCdakrRAbY3rD2C3rb9NlsgQIy++xjYToPVCzByJmc8s4YqDupFH6QoLhoi/sYoWH4TKref
 xn3B0yF/5C0fokbhroL1XB37yNr0XCduupwX2UVd67i9Vn1+QBLef4oCVP94NCdhSEjyDuF9x
 9NSQp4YjQJVLxlXkJ8bswkl+w8FIqWUDWW
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
 Randy Dunlap <rdunlap@infradead.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 David Hildenbrand <david@redhat.com>, David Airlie <airlied@linux.ie>,
 Andrew Jeffery <andrew@aj.id.au>, Masahiro Yamada <masahiroy@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
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

On Thu, Apr 8, 2021 at 2:50 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Apr 8, 2021 at 2:01 PM David Hildenbrand <david@redhat.com> wrote:
>
> > > This is something you could do using a hidden helper symbol like
> > >
> > > config DRMA_ASPEED_GFX
> > >         bool "Aspeed display driver"
> > >         select DRM_WANT_CMA
> > >
> > > config DRM_WANT_CMA
> > >         bool
> > >         help
> > >            Select this from any driver that benefits from CMA being enabled
> > >
> > > config DMA_CMA
> > >         bool "Use CMA helpers for DRM"
> > >         default DRM_WANT_CMA
> > >
> > >           Arnd
> > >
> >
> > That's precisely what I had first, with an additional "WANT_CMA" --  but
> > looking at the number of such existing options (I was able to spot 1 !)
>
> If you do this it probably makes sense to fix a few other drivers
> Kconfig in the process. It's not just a problem with your driver.
> "my" drivers:
>
> drivers/gpu/drm/mcde/Kconfig
> drivers/gpu/drm/pl111/Kconfig
> drivers/gpu/drm/tve200/Kconfig
>
> certainly needs this as well, and pretty much anything that is
> selecting DRM_KMS_CMA_HELPER or
> DRM_GEM_CMA_HELPER "wants" DMA_CMA.

Are there any that don't select either of the helpers and
still want CMA? If not, it would be easy to just add

   default  DRM_KMS_CMA_HELPER || DRM_GEM_CMA_HELPER

and skipt the extra symbol.

        Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
