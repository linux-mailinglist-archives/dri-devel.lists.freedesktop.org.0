Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83708358107
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 12:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32776E101;
	Thu,  8 Apr 2021 10:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC7C6E101;
 Thu,  8 Apr 2021 10:45:05 +0000 (UTC)
Received: from mail-wm1-f54.google.com ([209.85.128.54]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MJmbB-1lAqyE0x5d-00KBaV; Thu, 08 Apr 2021 12:45:03 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so977067wmi.3; 
 Thu, 08 Apr 2021 03:45:03 -0700 (PDT)
X-Gm-Message-State: AOAM532ESq6WDQeATBMDEVD/O4gQRuV7iF2M6Lp6RLH7tkV+nVPPgRXf
 xkRDtuLC2zio+Psp0cFYXGdtqTZhjmpcebXIZrY=
X-Google-Smtp-Source: ABdhPJytz/lV77i5o3bCVeCx28eGBRpFGJa3HAhceDBuu8+SNlIqf7YyHBd9MAcXBsV7ViVqwijCZWLATsW/w+YkaWY=
X-Received: by 2002:a1c:4c0c:: with SMTP id z12mr7558571wmf.38.1617878702742; 
 Thu, 08 Apr 2021 03:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-3-david@redhat.com>
 <CAK8P3a09LdJ-87ZrN28y=t8Sa0zL-3NOvEWhkStMY+2EbO7UAw@mail.gmail.com>
 <cd14d4b4-da82-b21c-2cd6-8e474d97b955@redhat.com>
In-Reply-To: <cd14d4b4-da82-b21c-2cd6-8e474d97b955@redhat.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 8 Apr 2021 12:44:46 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0Wg1mGZoBkD_RwMx-jzQNK2krrDxDQV5uhCHoyz-e=dw@mail.gmail.com>
Message-ID: <CAK8P3a0Wg1mGZoBkD_RwMx-jzQNK2krrDxDQV5uhCHoyz-e=dw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
To: David Hildenbrand <david@redhat.com>
X-Provags-ID: V03:K1:LUb1LA3WihKnN910sQjgwjcq+3Av4nVPuPayovXaS7zIGIKlW60
 AtBPKzA3FCw5NcVXd/r7tAONDCMxHyjA+CzHj75/bIBtvmganB9kUsSfnYIrELVFU7zgpfg
 GffzvxQrtUNTkE5Fp9Erjui5Dunq8BqfBQ86rhev734oa27KLCogXJA7RM7vrPY7RqSNaHN
 I0adKz6WImsM9YdfM0BCA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:R03N5Xquz6Y=:Rca6qd4ZpwMeABBO45E4dy
 TVvgiA0Xy0Why99mNYfSbgI9CK+WxpWQgfJGH/BjP/pKpNhuBgAUxgCIwkQbohkj/RL1gDw03
 CbuW5dg3Po0VXBH7sxoLi6zHbvj72EuA2/5cA5E4S8Q9FaHjuP/nC0FQMb5CpPopk1U92vnat
 YiPoGYUId0KBQGezwV1tI+bMV4udvlfEMKLWq3gRIUua81dh0I4+/TRAUknwi6WcObm3fVe3D
 Zwo0f0R4tbTgsJ7ApU9BIrpHNfXgBA6G17KR8OQGl4nWm8/ZBrPgEczDb0anIkYJJcT+GcTBq
 tEO2ksIZW+tBnGe5fJxY1LkqTPYZ9Sg8sjKNkG7tHwE8RfSYDgYJXqZxBEInZGVYcR/NdyuPV
 LIF9B+3DQxoDnOCsOWorzcMIULk0UCBlbE+fukR6U+WvgYAx6nai7BC7BmbsLLj0PQrHKhiL3
 7SJDUfQbSmy+igNynRbhEz64yTKrH9GUhZRqaCGhUNLHyd3rg/Yf/63slxDxOATrbsXS32V/E
 quq7dq9MQukidqNPyGFwhdUd27pXFtBMkeAVgZS5uufiqXnMQFJxjOutj0cbr6LGU4COPBoNz
 5+PLN2A07NQdrwULXle+5T+3zqqsSq1CXE
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Andrew Jeffery <andrew@aj.id.au>,
 Randy Dunlap <rdunlap@infradead.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Michal Simek <michal.simek@xilinx.com>, Linux-MM <linux-mm@kvack.org>,
 Joel Stanley <joel@jms.id.au>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Peter Collingbourne <pcc@google.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 8, 2021 at 12:29 PM David Hildenbrand <david@redhat.com> wrote:
> On 08.04.21 12:20, Arnd Bergmann wrote:
> > On Thu, Apr 8, 2021 at 11:22 AM David Hildenbrand <david@redhat.com> wrote:
> >>
> >> Random drivers should not override a user configuration of core knobs
> >> (e.g., CONFIG_DMA_CMA=n). Use "imply" instead, to still respect
> >> dependencies and manual overrides.
> >>
> >> "This is similar to "select" as it enforces a lower limit on another
> >>   symbol except that the "implied" symbol's value may still be set to n
> >>   from a direct dependency or with a visible prompt."
> >>
> >> Implying DRM_CMA should be sufficient, as that depends on CMA.
> >>
> >> Note: If this is a real dependency, we should use "depends on DMA_CMA"
> >> instead -  but I assume the driver can work without CMA just fine --
> >> esp. when we wouldn't have HAVE_DMA_CONTIGUOUS right now.
> >
> > 'imply' is almost never the right solution, and it tends to cause more
> > problems than it solves.
>
> I thought that was the case with "select" :)

Yes, but that's a different set of problems

> >
> > In particular, it does not prevent a configuration with 'DRM_CMA=m'
>
> I assume you meant "DRM_CMA=n" ? DRM_CMA cannot be built as a module.

Ok, at least that makes it easier.

> > and 'DRMA_ASPEED_GFX=y', or any build failures from such
> > a configuration.
>
> I don't follow. "DRM_CMA=n" and 'DRMA_ASPEED_GFX=y' is supposed to work
> just fine (e.g., without HAVE_DMA_CONTIGUOUS) or what am I missing?

I thought you were trying to solve the problem where DRMA_ASPEED_GFX
can optionally link against CMA but would fail to build when the CMA code
is in a loadable module.

If the problem you are trying to solve is a different one, you need a different
solution, not what I posted above.

> > If you want this kind of soft dependency, you need
> > 'depends on DRM_CMA || !DRM_CMA'.
>
> Seriously? I think the point of imply is "please enable if possible and
> not prevented by someone else".

That used to be the meaning, but it changed a few years ago. Now
it means "when a used manually turns on this symbol, turn on the
implied one as well, but let them turn it off again if they choose".

This is pretty much a NOP.

> Your example looks more like a NOP - no?
> Or will it have the same effect?

The example I gave is only meaningful if both are tristate, which is
not the case here as you explain.

It is a somewhat awkward way to say "prevent this symbol from
being =y if the dependency is =m".

      Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
