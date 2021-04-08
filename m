Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4F1358336
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 14:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F57B6EAC3;
	Thu,  8 Apr 2021 12:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 456 seconds by postgrey-1.36 at gabe;
 Thu, 08 Apr 2021 12:25:33 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B896E1B2;
 Thu,  8 Apr 2021 12:25:33 +0000 (UTC)
Received: from mail-ot1-f42.google.com ([209.85.210.42]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MulyX-1lladc1QI7-00rpz6; Thu, 08 Apr 2021 14:12:51 +0200
Received: by mail-ot1-f42.google.com with SMTP id
 c24-20020a9d6c980000b02902662e210895so2017058otr.9; 
 Thu, 08 Apr 2021 05:12:50 -0700 (PDT)
X-Gm-Message-State: AOAM532qlZZWe1mBt6a7FxbK4io7+EqHh7e+YVSHFXbr1nPyCWZzXZGW
 mJL306AQ5CCD1C39qWH7iZxAtwOo5O8wG3vEBeg=
X-Google-Smtp-Source: ABdhPJxHyCWMenVUxv33s1E6jvbsFFZTfTMiy2a27GKmZ/Mw2GJW7+vO9jPST57wudsWVl6e6VoT2RKQT0t6kEAsZEE=
X-Received: by 2002:a9d:316:: with SMTP id 22mr7238748otv.210.1617883969787;
 Thu, 08 Apr 2021 05:12:49 -0700 (PDT)
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
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 8 Apr 2021 14:12:33 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3v2aY3CNLED5NkONJ6bS74WgLu=KCTwr1pKjnAmDeSjw@mail.gmail.com>
Message-ID: <CAK8P3a3v2aY3CNLED5NkONJ6bS74WgLu=KCTwr1pKjnAmDeSjw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
To: David Hildenbrand <david@redhat.com>
X-Provags-ID: V03:K1:PO5cu5spogXk5DGrkbNGI8rtRE+z3P3iPSU4K20G+j8HMUSvjkj
 8nVfXV8EZZnAETqr7lWSSCxtKRj4ZU7QtcH78hdY2tUH9tfiM0j2dR4PEqvjR/KuocV8PDG
 j0TC1fifFSW7y9CmLycAD3ViHKfq49KEVoOlywOMtuJcfA8kyw+nEHXvMJx0Dm+d5031vGE
 Z7UBAvtOctqirH2coydqg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BzYbHMwt0Jg=:oyv+qLTYRqlbCqFvDMwVxp
 Q55KvxQpTxFEouR6tVSH/11soLZXwP6hAnaTNM4Wq4wsIRH8sSeoHX6KOtWbHmIQxqzBBZh/0
 2AjU8A6sabtdVp7rv/JqQUZs9TarYKUMLxQLtlHMMjRsNiKdUIqCq239zebDhZgkp1stdcFl/
 PZmsg01NiQ3jqP5I01Jyg+57aHccStCgobHNdXSjpPj0WJ6DIKYoSaboiqXTZ+e6RxgdfP+uY
 AhAm1J0DywVaefivbGbLjnZteZDrhjFI32l3emTP8rqpH8O1LP+QqgmNOCUUI28vOty5cj01A
 YWgCdQt+tPNNDchXpZmfT2HXku5gTTWgHmGHdW1bLTCHln6cJd1WcHjk/dvNZxFQRtTviNi6z
 uzHV7TD5nXfOvbHCzXs1eQT64BuuKygVjU+THjsRGKqZmuxKORRU7Wt7KT2HhSHH2S7LeF3ga
 VhIJ3TprL63c1yq2ZGI/ZS1anYGS+OpSmEcCSR6nChPBK6Gloyik48HgXCABDcr2ckTWtev68
 IMueShW8SjsuYbU7JlEM4LrQFyVTmj1QZcoqnv0Wv3t7H76BuB+ieBLKv0pdmp7H8jxH2gonS
 zdWZkgHdywCy18n0+3po0tkcSR1Z6sjVJB
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

On Thu, Apr 8, 2021 at 2:00 PM David Hildenbrand <david@redhat.com> wrote:
>
> On 08.04.21 13:44, Arnd Bergmann wrote:
> > On Thu, Apr 8, 2021 at 1:00 PM David Hildenbrand <david@redhat.com> wrote:
> >>>
> >>> It is a somewhat awkward way to say "prevent this symbol from
> >>> being =y if the dependency is =m".
> >>
> >> What would be the right thing to do in the case here then to achieve the
> >> "if DRMA_ASPEED_GFX is enabled, also enable DMA_CMA id possible"?
> >>
> >> One approach could be to have for DMA_CMA
> >>
> >> default y if DRMA_ASPEED_GFX
> >>
> >> but it feels like the wrong way to tackle this.
> >
> > I'm still not sure what you are trying to achieve. Is the idea only to provide
> > a useful default for DMA_CMA depending on which drivers are enabled?
>
> "Random drivers should not override a user configuration of core knobs
> (e.g., CONFIG_DMA_CMA=n)."
>
> Let's assume I'm a distribution and want to set CONFIG_CMA=n or want to
> set CONFIG_DMA_CMA=n with CONFIG_CMA=y; there is no way to do that with
> e.g., DRMA_ASPEED_GFX=y because it will always override my (user!)
> setting -- even though it doesn't really always need it. Using "select"
> is the problem here.

I agree on the part of removing the 'select' if we don't need it. The
part I couldn't figure out was what the 'imply' is supposed to help with.
Most other users that added imply tried (and failed) to fix a build problem.

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
> I wondered if there is a better approach to achieve the same; "imply"
> sounded like a good candidate.

I can probably find a couple more, but regardless of how many others
exist, this would be a much clearer way of doing it than 'imply' since it
has none of the ambiguity and misuse problems.

I think the reason we don't see more is that generally speaking, those
defaults are widely ignored anyway. You almost always start out with
a defconfig file that contains everything you know you need, and then
you add bits to that. Having the default in any form only helps to
make that defconfig file one line shorter, while requiring other users
to add another line to turn it off when they do not want it.

         Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
