Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F01358E60
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 22:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C146E08C;
	Thu,  8 Apr 2021 20:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77FD6E08C;
 Thu,  8 Apr 2021 20:29:36 +0000 (UTC)
Received: from mail-ot1-f53.google.com ([209.85.210.53]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N8onQ-1lgC6t1m9G-015nUi; Thu, 08 Apr 2021 22:29:33 +0200
Received: by mail-ot1-f53.google.com with SMTP id
 l12-20020a9d6a8c0000b0290238e0f9f0d8so3587527otq.8; 
 Thu, 08 Apr 2021 13:29:33 -0700 (PDT)
X-Gm-Message-State: AOAM5329V1/bFkTX4u1gJz5hMLSs1520m0kozT+eOwAOXiX34RUKAV19
 21bgzSjpBzRpV5NgB4GeKpHZfY+ghMnj2x0k8Ck=
X-Google-Smtp-Source: ABdhPJyfPECLeLOF/Bs3NvQ2GDzKFAUyLZwtkCfbxO3pPqunDWbqv1JOjJ/RM4Y98JdJ7lIhjCGjr/ZYV8r3IjuTvvw=
X-Received: by 2002:a05:6830:148c:: with SMTP id
 s12mr9613770otq.251.1617913771943; 
 Thu, 08 Apr 2021 13:29:31 -0700 (PDT)
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
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 8 Apr 2021 22:29:15 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3sqZBo8-zye1yiZuD2uMUr0oE_q_QfaK9K54TEgd1Cdw@mail.gmail.com>
Message-ID: <CAK8P3a3sqZBo8-zye1yiZuD2uMUr0oE_q_QfaK9K54TEgd1Cdw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
To: David Hildenbrand <david@redhat.com>
X-Provags-ID: V03:K1:AU/AJpvQ7hUp1HPIXTPM9B9a7e5RdJcLgqr83J2YenGxurRA5FB
 H2ii6aeb344CKhKFnzLX6d4QWfwP1m2WcBE8/ynWVNAmavYg+IaszVpb1nIweKAFy+WyOpF
 igbyQlWKaZLrs6eweonMGiycbCk9ngbDZZhAK3S68GPXQjuNf4IzX0gWCUSE2o+41eFlNeL
 r+Z3L9V2z/mFeIPuvHArw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NKjw4CEqH2U=:pSkjONLwVTPt7tMfuQB1OZ
 3xw1UBCLeclBwwFP73Y3Bgvjhh5GTtHvdkUnk1gpUZI2iiUYHzKF9KWd/MlxQ87GTN9V414nz
 2ng6RG+/+DyKzKDl5rX/Ht6qsT6Yh97VmC4v3kYZ6NtU1bsd58qfe0NM9JH5jRF6p+jdIqbg0
 wvXWNKyxavHH1sxV0n2oBBoWpf9hn4R4H8UOFi9EiI8E5XBUHnIknBhuVXlauCPuVKfN8/Imo
 lXt6BWY8c9IvBGVpLzlOwjoelC7cXolk1qG0rWHc+/MEceKtNvlmJbEJvUt1OUbody+VzBy2B
 fyTv1/auOEVjd4LPdgH/PAemcvk0hTsNmKbFlGvTAElG25vcsxEeomobOP20oE+4Q+MU9SOyg
 3ocuxn/TqYOnASETGFGq2fIHLXSy7iveFX4DMSyoQ2QkO+LaMFEiLk2t9QQA27BlqYasHST9M
 cefeiOVtKWC64qFdmJpMdpxi2IBNCZ9KHY6E1S0fxWeYwF4U2/kDrtvzBfAnWSqJz0z2eM93O
 3IlyEdvw9fYd7anVrMJokaULVIhMizw6QBPPAsfHvekD8kbLpcPg0bqNM09u8VHDsCVMLsXG2
 ynhQYWwxaV7h8dIwaN9pvXkHHev2D3Y0oH
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

On Thu, Apr 8, 2021 at 6:45 PM David Hildenbrand <david@redhat.com> wrote:
> On 08.04.21 14:49, Linus Walleij wrote:
> > On Thu, Apr 8, 2021 at 2:01 PM David Hildenbrand <david@redhat.com> wrote:
> >
> >>> This is something you could do using a hidden helper symbol like
> >>>
> >>> config DRMA_ASPEED_GFX
> >>>          bool "Aspeed display driver"
> >>>          select DRM_WANT_CMA
> >>>
> >>> config DRM_WANT_CMA
> >>>          bool
> >>>          help
> >>>             Select this from any driver that benefits from CMA being enabled
> >>>
> >>> config DMA_CMA
> >>>          bool "Use CMA helpers for DRM"
> >>>          default DRM_WANT_CMA
> >>>
> >>>            Arnd
> >>>
> >>
> >> That's precisely what I had first, with an additional "WANT_CMA" --  but
> >> looking at the number of such existing options (I was able to spot 1 !)
> >
> > If you do this it probably makes sense to fix a few other drivers
> > Kconfig in the process. It's not just a problem with your driver.
> > "my" drivers:
> >
>
> :) I actually wanted to convert them to "depends on DMA_CMA" but ran
> into recursive dependencies ...
>
> > drivers/gpu/drm/mcde/Kconfig
> > drivers/gpu/drm/pl111/Kconfig
> > drivers/gpu/drm/tve200/Kconfig

Right, this is the main problem caused by using 'select' to
force-enable symbols that other drivers depend on.

Usually, the answer is to be consistent about the use of 'select'
and 'depends on', using the former only to enable symbols that
are hidden, while using 'depends on' for anything that is an
actual build time dependency.

> I was assuming these are "real" dependencies. Will it also work without
> DMA_CMA?

I think in this case, it is fairly likely to work without DMA_CMA when the
probe function gets called during a fresh boot, but fairly likely to fail if
it gets called after the system has run for long enough to fragment the
free memory.

The point of DMA_CMA is to make it work reliably.

      Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
