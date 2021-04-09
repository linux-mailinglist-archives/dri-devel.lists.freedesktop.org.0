Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DDD359FEA
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 15:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A22B6EC26;
	Fri,  9 Apr 2021 13:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A936EC25;
 Fri,  9 Apr 2021 13:35:36 +0000 (UTC)
Received: from mail-ua1-f51.google.com ([209.85.222.51]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N49Yn-1le2PX1WYj-0105KN; Fri, 09 Apr 2021 15:35:34 +0200
Received: by mail-ua1-f51.google.com with SMTP id v23so1810969uaq.13;
 Fri, 09 Apr 2021 06:35:32 -0700 (PDT)
X-Gm-Message-State: AOAM530Fg9Jd9LhR6MBsZaI1guQG77Y05M5JZ873/tJtLD++mvpBP6/i
 EX9l7TzGeiNH55Ex644bVmDMwNW7ONuE2/GoqDg=
X-Google-Smtp-Source: ABdhPJynlbx4kLNikSNjAjnCb5vtFq6G/850R+R5+xWMARHqWLy+tfY7F0Z+Hrp7Hz4KWDmPvvGBCrUcX4hM8LkZWnk=
X-Received: by 2002:a9d:758b:: with SMTP id s11mr12240759otk.305.1617975319390; 
 Fri, 09 Apr 2021 06:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210409112035.27221-1-david@redhat.com>
In-Reply-To: <20210409112035.27221-1-david@redhat.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 9 Apr 2021 15:35:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a31uKNcim0n99=yt3zjZ+LQSw4V4+8PS8daLsBdS0iSYg@mail.gmail.com>
Message-ID: <CAK8P3a31uKNcim0n99=yt3zjZ+LQSw4V4+8PS8daLsBdS0iSYg@mail.gmail.com>
Subject: Re: [PATCH v3] drivers: introduce and use WANT_DMA_CMA for soft
 dependencies on DMA_CMA
To: David Hildenbrand <david@redhat.com>
X-Provags-ID: V03:K1:hkRGLNMHG/1wUU9HP7zMV+mBjZYTv1bWf8ZFfNaCY2KeW/S73kg
 Mk0Supar4jDVwNCx+TXqYEud+rzrXC+JLK73WmKWaVTf9buitG5fqH0kjjaEU9AeNdE9aBB
 J2osJKGR/eCjCth4YY1yCx24hBzjw1GmWNBBHx3fCrohWu0e2x3aLCdplHMZ5123GLhet2N
 JYfe3G58TWxHpjW6TqvnQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VTBDSgC5udI=:yE2zKyAQbTy1zm5ntyYXkx
 NCFaxglwKLaG/AVYsmyTJMVxvqOvpjRQY9AYwzOE+bjUYpQ6wPHyNCg9omMqMpWHsXfSZ28FB
 BHKO2M/0XiDs72ku+pGa05VoJECsp1JANprNZp6rTtPkr9L4rtFeWBzvCUi8QKZKVgGWbuvaV
 lnnVJ1a9dbyy89ulQgPLqNdAmTzKTKFhD275xSbDTswk21rc3Y8GAGhoDwQBE6IoSp+j7cZKB
 cYhncrFhPWauCNU39qSQt8gHCoOQ/kh2tloJyIOsdhvLCaR2/IaD7pVHOVqILOX8FqJU4s5CB
 2ebRtFfH4E/Yw329ie4ZSOV5jGaoXhnc9oZ+JAhWxdArk60CzVHU1s1w0Q44nCJsFqZqJqPKT
 RKIGmjnmsdBcwABV5aVYcdhCyPOELK1Bhd3KjLBsXi1WJAf+o4FhiaRi6ATC4nArbBRXpKv0G
 6vmPhhG8BmOm478lnd134uYvDx1B7g6i1y3vEVqHW+UNWNRd7SDLb2NInubgZI+qhQBPrSFLd
 CTJd5i74YlDNt2lcT40Oxn175vU/GmqBGTzZSYsPL11LPmT1Ri506Xw9CtEW48tzznaJ1/gWR
 zgh6iPUAikk7S2J+5pYgc/g9cov2phjdGu
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Suman Anna <s-anna@ti.com>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Joel Stanley <joel@jms.id.au>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Peter Collingbourne <pcc@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 Linux-MM <linux-mm@kvack.org>, Andrew Jeffery <andrew@aj.id.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 9, 2021 at 1:21 PM David Hildenbrand <david@redhat.com> wrote:
>
> Random drivers should not override a user configuration of core knobs
> (e.g., CONFIG_DMA_CMA=n). Applicable drivers would like to use DMA_CMA,
> which depends on CMA, if possible; however, these drivers also have to
> tolerate if DMA_CMA is not available/functioning, for example, if no CMA
> area for DMA_CMA use has been setup via "cma=X". In the worst case, the
> driver cannot do it's job properly in some configurations.
>
> For example, commit 63f5677544b3 ("drm/etnaviv: select CMA and DMA_CMA if
> available") documents
>         While this is no build dependency, etnaviv will only work correctly
>         on most systems if CMA and DMA_CMA are enabled. Select both options
>         if available to avoid users ending up with a non-working GPU due to
>         a lacking kernel config.
> So etnaviv really wants to have DMA_CMA, however, can deal with some cases
> where it is not available.
>
> Let's introduce WANT_DMA_CMA and use it in most cases where drivers
> select CMA/DMA_CMA, or depend on DMA_CMA (in a wrong way via CMA because
> of recursive dependency issues).
>
> We'll assume that any driver that selects DRM_GEM_CMA_HELPER or
> DRM_KMS_CMA_HELPER would like to use DMA_CMA if possible.
>
> With this change, distributions can disable CONFIG_CMA or
> CONFIG_DMA_CMA, without it silently getting enabled again by random
> drivers. Also, we'll now automatically try to enabled both, CONFIG_CMA
> and CONFIG_DMA_CMA if they are unspecified and any driver is around that
> selects WANT_DMA_CMA -- also implicitly via DRM_GEM_CMA_HELPER or
> DRM_KMS_CMA_HELPER.
>
> For example, if any driver selects WANT_DMA_CMA and we do a
> "make olddefconfig":
>
> 1. With "# CONFIG_CMA is not set" and no specification of
>    "CONFIG_DMA_CMA"
>
> -> CONFIG_DMA_CMA won't be part of .config
>
> 2. With no specification of CONFIG_CMA or CONFIG_DMA_CMA
>
> Contiguous Memory Allocator (CMA) [Y/n/?] (NEW)
> DMA Contiguous Memory Allocator (DMA_CMA) [Y/n/?] (NEW)
>
> 3. With "# CONFIG_CMA is not set" and "# CONFIG_DMA_CMA is not set"
>
> -> CONFIG_DMA_CMA will be removed from .config
>
> Note: drivers/remoteproc seems to be special; commit c51e882cd711
> ("remoteproc/davinci: Update Kconfig to depend on DMA_CMA") explains that
> there is a real dependency to DMA_CMA for it to work; leave that dependency
> in place and don't convert it to a soft dependency.

I don't think this dependency is fundamentally different from the others,
though davinci machines tend to have less memory than a lot of the
other machines, so it's more likely to fail without CMA.

Regardless of this,

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
