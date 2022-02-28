Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D12A14C7204
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 17:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9508310E17F;
	Mon, 28 Feb 2022 16:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8577910E17F;
 Mon, 28 Feb 2022 16:56:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6B6F461266;
 Mon, 28 Feb 2022 16:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A46A1C340E7;
 Mon, 28 Feb 2022 16:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646067380;
 bh=523gBdVPJChXozDXmy5Cb2pK2i/xRfAcGRZVUQAHjNc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LgVJuH4da0tpuW1nX+TSzWKpqT1/5OI3uq9Url+IKydIaNvJrwxxCJ02pDsUamp0J
 BXgyENWeP0ucoramTVXNaT23Z6w+IPOpRsVnisqnZwdBL4ARuBusSY6JLdz3305OfE
 YtZvql2BfkwdTq2LxRIJRizjGmx3hngX5RBUDcSxgf2mLkssqkaZFIqarTisHboNdy
 Xy986yF0zeYZbw6HX61O+ecCg/MIlsoP4bKonolKYJ+91DSdYuEy6Ckl7v583fSXhJ
 fxInQ5iK44jGAKr2Pvl9ywk4psfT+Vv0H/AbdegLc3kV5x8iLrYBvahTmACsIjfZ5u
 Ol9BFIfpBb+FA==
Date: Mon, 28 Feb 2022 09:56:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] [v2] Kbuild: move to -std=gnu11
Message-ID: <Yhz+rfcdp9jxgr+P@archlinux-ax161>
References: <20220228103142.3301082-1-arnd@kernel.org>
 <CANpmjNP6VE9G8Yng4W7Mayk-0QsqUtAXkrMUSvL5pAP5DpXSmA@mail.gmail.com>
 <CAK8P3a3cRa1piP2BSmN2dTW4QErhSP7AMO9xqAm=_FFYprAkOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3cRa1piP2BSmN2dTW4QErhSP7AMO9xqAm=_FFYprAkOA@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, llvm@lists.linux.dev,
 dri-devel <dri-devel@lists.freedesktop.org>, Alex Shi <alexs@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-staging@lists.linux.dev, Federico Vaga <federico.vaga@vaga.pv.it>,
 Marco Elver <elver@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, greybus-dev@lists.linaro.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Marek <michal.lkml@markovi.net>, Hu Haowen <src.res@email.cn>,
 linux-doc-tw-discuss@lists.sourceforge.net,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-btrfs <linux-btrfs@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 28, 2022 at 12:57:55PM +0100, Arnd Bergmann wrote:
> On Mon, Feb 28, 2022 at 12:47 PM Marco Elver <elver@google.com> wrote:
> > On Mon, 28 Feb 2022 at 11:32, Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > > Nathan Chancellor reported an additional -Wdeclaration-after-statement
> > > warning that appears in a system header on arm, this still needs a
> > > workaround.
> >
> > On the topic of Wdeclaration-after-statement, Clang only respects this
> > warning with C99 and later starting with Clang 14:
> > https://github.com/llvm/llvm-project/commit/c65186c89f35#diff-ec770381d76c859f5f572db789175fe44410a72608f58ad5dbb14335ba56eb97R61
> >
> > Until Clang 14, -Wdeclaration-after-statement is ignored by Clang in
> > newer standards. If this is a big problem, we can probably convince
> > the Clang stable folks to backport the fixes. However, the build won't
> > fail, folks might just miss the warning if they don't also test with
> > GCC.

Unfortunately, none of the branches prior to release/14.x are going to
see any more updates (at least as far as I am aware, as the LLVM
community only supports one release branch at a time) but as Arnd
mentioned below, I do not really see that as a problem, as newer
versions of clang and GCC will catch these warnings.

> I don't expect this is to be a big issue, as long as the latest clang behaves
> as expected. There are many warnings that are only produced by one of the
> two compilers, so this is something we already deal with.
> 
> I think it's more important to address the extra warning that Nathan
> reported, where clang now complains about the intermingled declaration
> in a system header when previously neither gcc nor clang noticed this.

Right. Based on the upstream LLVM bug, I think we should just fix
arm_neon.h to avoid triggering -Wdeclaration-after-statement to have
something that is (hopefully) relatively low risk for a clang-14
backport, rather than addressing the root cause of clang warning in
system macros, as it sounds like fixing that has some risks that are not
fully understood at this point. The kernel only uses very specific
system headers after commit 04e85bbf71c9 ("isystem: delete global
-isystem compile option"), so I don't think that my suggested approach
will have many downsides.

I think I see how to potentially fix arm_neon.h in
clang/utils/TableGen/NeonEmitter.cpp, I just have to think about it a
little more.

Realistically, I don't think special casing this in lib/raid6 is the end
of the world:

diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
index 45e17619422b..a41ff71b90af 100644
--- a/lib/raid6/Makefile
+++ b/lib/raid6/Makefile
@@ -38,6 +38,10 @@ ifeq ($(CONFIG_KERNEL_MODE_NEON),y)
 NEON_FLAGS := -ffreestanding
 # Enable <arm_neon.h>
 NEON_FLAGS += -isystem $(shell $(CC) -print-file-name=include)
+# https://github.com/ClangBuiltLinux/linux/issues/1603
+ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_CPU_BIG_ENDIAN),yy)
+NEON_FLAGS += -Wno-declaration-after-statement
+endif
 ifeq ($(ARCH),arm)
 NEON_FLAGS += -march=armv7-a -mfloat-abi=softfp -mfpu=neon
 endif

> > > The differences between gnu99, gnu11, gnu1x and gnu17 are fairly
> > > minimal and mainly impact warnings at the -Wpedantic level that the
> > > kernel never enables. Between these, gnu11 is the newest version
> > > that is supported by all supported compiler versions, though it is
> > > only the default on gcc-5, while all other supported versions of
> > > gcc or clang default to gnu1x/gnu17.
> > >
> > > Link: https://lore.kernel.org/lkml/CAHk-=wiyCH7xeHcmiFJ-YgXUy2Jaj7pnkdKpcovt8fYbVFW3TA@mail.gmail.com/
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/1603
> > > Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> > > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > > Cc: linux-kbuild@vger.kernel.org
> > > Cc: llvm@lists.linux.dev
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > Acked-by: Marco Elver <elver@google.com>

Cheers,
Nathan
