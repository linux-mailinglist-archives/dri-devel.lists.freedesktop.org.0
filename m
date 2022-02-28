Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5184B4C6474
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 09:12:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E629F10E259;
	Mon, 28 Feb 2022 08:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2987C10E259;
 Mon, 28 Feb 2022 08:11:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9443861130;
 Mon, 28 Feb 2022 08:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 726E0C36AEA;
 Mon, 28 Feb 2022 08:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646035915;
 bh=zMDLEB8toWf2EIp4Gbj5PSCBFzWdzLn4mVbcpqFSMxs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=G5/HKt1YcKrybKD+1q8UgQW8r6UniPBg+HgJCRHDiawTCCJy2G9uMVmVMIrAH+MIY
 uUZuQAmqf+UgQqG4LSwOUKjuA8mlT2hPXWXAetE6/wffM3OsZ6cQuw+SmzDdC9fizY
 tnKAD3prEcX2CmRCAP5e0Sp4+MmIaoIy7bEgoECFMmrlcDv1M29iegogMcMJXx4EzC
 Ww6E2vE2Ei6Ccl+33CFLA3ixlnEAH6a8FHRWu+p6u8hOq0ib6UliPV2J7DZbNT/orL
 Z5vh8VINzIAjIFdahYuMGIJkpIkpdyHyDhOYN0mcWcjSY+6pRXFj43dgIYPqjgmCqP
 vBf0o1GuFv9eA==
Received: by mail-wm1-f52.google.com with SMTP id
 l1-20020a7bcf01000000b0037f881182a8so5233504wmg.2; 
 Mon, 28 Feb 2022 00:11:55 -0800 (PST)
X-Gm-Message-State: AOAM530oZzEVp+F/L+i7unNZqdXCJFw7wCetHNuZmcL+MyGSkA8Cc+RT
 T0Jg3XXHCptsPalwD3dvQM96k71Y86mPKrDynyY=
X-Google-Smtp-Source: ABdhPJx0yttNosgz0Dhhih9aIMEkkBewvoulgcXNOZok4rXBWTX7Xo99SrIvGnmvPy9Xsi9me/xpLhkH8sj6MYMy+yQ=
X-Received: by 2002:a05:600c:4802:b0:381:3b27:89b7 with SMTP id
 i2-20020a05600c480200b003813b2789b7mr11349875wmo.173.1646035913752; Mon, 28
 Feb 2022 00:11:53 -0800 (PST)
MIME-Version: 1.0
References: <20220227215408.3180023-1-arnd@kernel.org>
 <YhwT2Gw8vsQHPxAB@quad.stoffel.home>
In-Reply-To: <YhwT2Gw8vsQHPxAB@quad.stoffel.home>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 28 Feb 2022 09:11:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1A8Y3F93FzbWum9U=_Mc8zR9T5p=tTkQK90ARan41EbA@mail.gmail.com>
Message-ID: <CAK8P3a1A8Y3F93FzbWum9U=_Mc8zR9T5p=tTkQK90ARan41EbA@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: remove -std=gnu89 from compiler arguments
To: john@quad.stoffel.home
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Marek <michal.lkml@markovi.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-staging@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org,
 Alex Shi <alexs@kernel.org>, Federico Vaga <federico.vaga@vaga.pv.it>,
 Hu Haowen <src.res@email.cn>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 linux-btrfs <linux-btrfs@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-doc-tw-discuss@lists.sourceforge.net,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 28, 2022 at 1:14 AM John Stoffel <john@quad.stoffel.home> wrote:
>
> On Sun, Feb 27, 2022 at 10:52:43PM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > During a patch discussion, Linus brought up the option of changing
> > the C standard version from gnu89 to gnu99, which allows using variable
> > declaration inside of a for() loop. While the C99, C11 and later standards
> > introduce many other features, most of these are already available in
> > gnu89 as GNU extensions as well.
> >
> > An earlier attempt to do this when gcc-5 started defaulting to
> > -std=gnu11 failed because at the time that caused warnings about
> > designated initializers with older compilers. Now that gcc-5.1 is the
> > minimum compiler version used for building kernels, that is no longer a
> > concern. Similarly, the behavior of 'inline' functions changes between
> > gnu89 and gnu89, but this was taken care of by defining 'inline' to
>
> Typo here?  Second one should be gnu99 right?


Fixed, thanks!

        Arnd
