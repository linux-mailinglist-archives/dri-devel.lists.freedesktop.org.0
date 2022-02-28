Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 436524C6B6D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 12:58:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87D310E626;
	Mon, 28 Feb 2022 11:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCC010E626;
 Mon, 28 Feb 2022 11:58:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4B9CEB81109;
 Mon, 28 Feb 2022 11:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F68C340FA;
 Mon, 28 Feb 2022 11:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646049493;
 bh=+wvb9UMyXw53TgaflmlowqbBW5U339MQvEG61L0RkPg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dKnUYFqwp2nljzB9HyNzLWj4aTyNWXVZA+BytLq5D7XB/wn2bgjZiMOaqskVpLuiD
 bk1rXCLmdHoF9yjad0YHG+aChMto6BWqkOaSNkASogtC0xwnUDMGmRpKWwbUUHIN9G
 T2jY86/3NyMp3QaiaqAGDioEuxukYv9eQ1s5RlKdtbtoQzRo06NdJeugzhX7GPJJPU
 4H6CnJkW0b+1gc1ha/tl8+JooMzw6m0qyd4IheUg8d+VSgFqd3J4We8CPaaoborU6O
 8ENUz+sQQa6Y+L8l2JDIzlj6xsFuwZlKFvfhceBVVAHW1OeYHoq8q01WwDXvR36vjs
 Kk7LHoUofOmAg==
Received: by mail-wr1-f49.google.com with SMTP id s13so15050295wrb.6;
 Mon, 28 Feb 2022 03:58:12 -0800 (PST)
X-Gm-Message-State: AOAM531jD02q3w3cBPWV0YFg3nsFDpQcNWuo1+qEmaZ7+eW3cWSf0qbJ
 0fnSw0blknB8mlu7NdwVpf9E//HX7pUEaIVnptI=
X-Google-Smtp-Source: ABdhPJwy6iIN+2EltyCCG8tEZNqW13aNO74dzYWDQrDlYbSLva54a7gegIjmFcrq6DWR6/fwUhMsaBFj3vOKpR4gr9Q=
X-Received: by 2002:adf:edc3:0:b0:1ec:5f11:5415 with SMTP id
 v3-20020adfedc3000000b001ec5f115415mr13633412wro.317.1646049491206; Mon, 28
 Feb 2022 03:58:11 -0800 (PST)
MIME-Version: 1.0
References: <20220228103142.3301082-1-arnd@kernel.org>
 <CANpmjNP6VE9G8Yng4W7Mayk-0QsqUtAXkrMUSvL5pAP5DpXSmA@mail.gmail.com>
In-Reply-To: <CANpmjNP6VE9G8Yng4W7Mayk-0QsqUtAXkrMUSvL5pAP5DpXSmA@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 28 Feb 2022 12:57:55 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3cRa1piP2BSmN2dTW4QErhSP7AMO9xqAm=_FFYprAkOA@mail.gmail.com>
Message-ID: <CAK8P3a3cRa1piP2BSmN2dTW4QErhSP7AMO9xqAm=_FFYprAkOA@mail.gmail.com>
Subject: Re: [PATCH] [v2] Kbuild: move to -std=gnu11
To: Marco Elver <elver@google.com>
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
 Mark Rutland <mark.rutland@arm.com>, Michal Marek <michal.lkml@markovi.net>,
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

On Mon, Feb 28, 2022 at 12:47 PM Marco Elver <elver@google.com> wrote:
> On Mon, 28 Feb 2022 at 11:32, Arnd Bergmann <arnd@kernel.org> wrote:
>
> > Nathan Chancellor reported an additional -Wdeclaration-after-statement
> > warning that appears in a system header on arm, this still needs a
> > workaround.
>
> On the topic of Wdeclaration-after-statement, Clang only respects this
> warning with C99 and later starting with Clang 14:
> https://github.com/llvm/llvm-project/commit/c65186c89f35#diff-ec770381d76c859f5f572db789175fe44410a72608f58ad5dbb14335ba56eb97R61
>
> Until Clang 14, -Wdeclaration-after-statement is ignored by Clang in
> newer standards. If this is a big problem, we can probably convince
> the Clang stable folks to backport the fixes. However, the build won't
> fail, folks might just miss the warning if they don't also test with
> GCC.

I don't expect this is to be a big issue, as long as the latest clang behaves
as expected. There are many warnings that are only produced by one of the
two compilers, so this is something we already deal with.

I think it's more important to address the extra warning that Nathan
reported, where clang now complains about the intermingled declaration
in a system header when previously neither gcc nor clang noticed this.

> > The differences between gnu99, gnu11, gnu1x and gnu17 are fairly
> > minimal and mainly impact warnings at the -Wpedantic level that the
> > kernel never enables. Between these, gnu11 is the newest version
> > that is supported by all supported compiler versions, though it is
> > only the default on gcc-5, while all other supported versions of
> > gcc or clang default to gnu1x/gnu17.
> >
> > Link: https://lore.kernel.org/lkml/CAHk-=wiyCH7xeHcmiFJ-YgXUy2Jaj7pnkdKpcovt8fYbVFW3TA@mail.gmail.com/
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1603
> > Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: linux-kbuild@vger.kernel.org
> > Cc: llvm@lists.linux.dev
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Acked-by: Marco Elver <elver@google.com>

Thanks,

         Arnd
