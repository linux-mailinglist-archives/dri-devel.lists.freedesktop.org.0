Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A02044C6AC0
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 12:38:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23FE710E3C5;
	Mon, 28 Feb 2022 11:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727A810E3C5;
 Mon, 28 Feb 2022 11:37:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA44D61001;
 Mon, 28 Feb 2022 11:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D87C340F4;
 Mon, 28 Feb 2022 11:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646048274;
 bh=NMuZjdNCVeQj2VoQ5jMSwA/dHUHPZ7Mhms+WmvHKcaw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=puCfv4I80mTbhnHyUqTc9LSw3FPxPIOJ/vkuheGKL8juHQ+7OafzFbeIoOUiNrCzk
 gMcRYr5uV1QgmlA2AVn6fH3BtT9wmOgIs9iNnH1so1jgptzNGXyJSNUNB+mD3GKWqs
 E2XJQclA3FD72633y5W3VT8t4EU62kfI9ObJFzphTP1SAs7YsrIBe3/G3kytn/9qqP
 5AHT3io7WPI82HCHJY9xunwb0bTqn6d4f/32za5KRCjqEkKdRHTt21XpXMpLeN/tBN
 BbNvU8hEz/6Lp8OapNZxReFBxhZ7uLVFNvhFYK1wsIb1vZ8/L7F83N5gNIw77oSuFB
 0hR/PLkKQ9mRw==
Received: by mail-wr1-f54.google.com with SMTP id j22so14890013wrb.13;
 Mon, 28 Feb 2022 03:37:54 -0800 (PST)
X-Gm-Message-State: AOAM531nn7e5aHPKG9SRuxQp7isaoWlabCk+0kqMA+Wls5y88YdrP+J8
 lCdAyfFmrSoycvQ5hHTx/CUP6cJ/HoYHvG+nqS4=
X-Google-Smtp-Source: ABdhPJxtXB6efD/LJ+kcWSKRCDN7bVXv1mCQCSSOtPPswSnZe/jnGK76a+5LOiLNukj3ERUK1wRtMZW5JaW1kqm9z5k=
X-Received: by 2002:a05:6000:1866:b0:1ef:8a14:ab6a with SMTP id
 d6-20020a056000186600b001ef8a14ab6amr7567987wri.12.1646048273093; Mon, 28 Feb
 2022 03:37:53 -0800 (PST)
MIME-Version: 1.0
References: <20220228103142.3301082-1-arnd@kernel.org>
 <YhyxML05rjJ/57Vk@FVFF77S0Q05N>
In-Reply-To: <YhyxML05rjJ/57Vk@FVFF77S0Q05N>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 28 Feb 2022 12:37:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0CTmtUq+Uba2S3D7wjSstew2M+LfzZoOcKdKK9cfXO9A@mail.gmail.com>
Message-ID: <CAK8P3a0CTmtUq+Uba2S3D7wjSstew2M+LfzZoOcKdKK9cfXO9A@mail.gmail.com>
Subject: Re: [PATCH] [v2] Kbuild: move to -std=gnu11
To: Mark Rutland <mark.rutland@arm.com>
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
 Marco Elver <elver@google.com>, Michal Marek <michal.lkml@markovi.net>,
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

On Mon, Feb 28, 2022 at 12:25 PM Mark Rutland <mark.rutland@arm.com> wrote:
> On Mon, Feb 28, 2022 at 11:27:43AM +0100, Arnd Bergmann wrote:
> >
> > Nathan Chancellor reported an additional -Wdeclaration-after-statement
> > warning that appears in a system header on arm, this still needs a
> > workaround.
>
> FWIW, I had a go at moving to c99 a few weeks ago (to be able to use
> for-loop-declarations in some concurrency primitives), and when I tried, I also
> saw declaration-after-statement warnings when building modpost.c, which is easy
> enough to fix:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?h=treewide/gnu99&id=505775bd6fd0bc1883f3271f826963066bbdc194

I think the KBUILD_USERCFLAGS portion and the modpost.c fix for it
make sense regardless of the -std=gnu11 change, but your change
to KBUILD_CFLAGS is not actually needed because the warning is
already enabled there -- gnu89 allows intermingled declarations since
gcc-3.4, so the warning flag was added during early 2.6.x kernels.

       Arnd
