Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D11354C6E08
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 14:23:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28FBC10E7CC;
	Mon, 28 Feb 2022 13:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4D610E7C2;
 Mon, 28 Feb 2022 13:23:04 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 2BDED2113A;
 Mon, 28 Feb 2022 13:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1646054583;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oNvLdI+iZsXcVPiWs0ldraacfaGBUEaJwBk4ZA2v124=;
 b=rWm36XAZ+Llc9U2KXh2MPBcdn+RT/qlvq2rSEOELa7CXgyIbCnSv3eYuDAtuPoL2SvdM58
 lh4PAaind+isGMTnTBPbFB9f6c6VikkIJrmmVYoyhA4rLWPCvoPkmVAF3Xp5EU0w3AcUnQ
 A79o4qcmmjPCwQH/x+MN0LKM2sKO4Xw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1646054583;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oNvLdI+iZsXcVPiWs0ldraacfaGBUEaJwBk4ZA2v124=;
 b=NTy2NkO24rhwN3/jLw4GQXPDL/VZeLSdeIm58qi61G+/SIy2JEKcfSCmGpKt/FLfgZhQ7D
 CyLReitTHv7C/uAg==
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
 by relay2.suse.de (Postfix) with ESMTP id 84B2CA3B85;
 Mon, 28 Feb 2022 13:23:02 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id A0D17DA823; Mon, 28 Feb 2022 14:19:11 +0100 (CET)
Date: Mon, 28 Feb 2022 14:19:11 +0100
From: David Sterba <dsterba@suse.cz>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] [v2] Kbuild: move to -std=gnu11
Message-ID: <20220228131911.GH12643@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, Arnd Bergmann <arnd@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev,
 Jonathan Corbet <corbet@lwn.net>,
 Federico Vaga <federico.vaga@vaga.pv.it>,
 Alex Shi <alexs@kernel.org>, Hu Haowen <src.res@email.cn>,
 Michal Marek <michal.lkml@markovi.net>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-doc-tw-discuss@lists.sourceforge.net,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-btrfs <linux-btrfs@vger.kernel.org>
References: <20220228103142.3301082-1-arnd@kernel.org>
 <87v8wz5frv.fsf@intel.com>
 <CAK8P3a1YUR4BNu8Nrc5XW+sFjL7-hWTHh7kstV27wmj1aqc4vA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1YUR4BNu8Nrc5XW+sFjL7-hWTHh7kstV27wmj1aqc4vA@mail.gmail.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
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
Reply-To: dsterba@suse.cz
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 linux-staging@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 greybus-dev@lists.linaro.org, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Federico Vaga <federico.vaga@vaga.pv.it>, Hu Haowen <src.res@email.cn>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 linux-btrfs <linux-btrfs@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-doc-tw-discuss@lists.sourceforge.net, Alex Shi <alexs@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 28, 2022 at 02:01:06PM +0100, Arnd Bergmann wrote:
> On Mon, Feb 28, 2022 at 1:36 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > >
> > > One minor issue that remains is an added gcc warning for shifts of
> > > negative integers when building with -Werror, which happens with the
> > > 'make W=1' option, as well as for three drivers in the kernel that always
> > > enable -Werror, but it was only observed with the i915 driver so far.
> > > To be on the safe side, add -Wno-shift-negative-value to any -Wextra
> > > in a Makefile.
> >
> > Do you mean always enable -Wall and/or -Wextra instead of -Werror?
> >
> > We do use -Werror for our CI and development too, but it's hidden behind
> > a config option that depends on COMPILE_TEST=n to avoid any problems
> > with allmodconfig/allyesconfig.
> 
> What I meant here is that I'm adding -Wno-shift-negative-value to all
> four places in the kernel that already use -Wextra.
> 
> > For the future, makes me wonder if we couldn't have a way for drivers to
> > locally enable -Wall/-Wextra in a way that incorporates the exceptions
> > from kbuild instead of having to duplicate them.
> 
> I have an older patch series that does this, but it also does a few other
> things that I couldn't quite get right in the end with all combinations of
> compiler versions and warning levels, so I did not submit that.
> 
> What this allows is to have per-directory statements like
> 
> KBUILD_WARN1=1

We've added the individual warnings to the per-directory flags so it's a
bit more flexible than just enabling W=1. The idea is to add possibly
stricter warnings once we make sure it builds fine and does not
produce false reports. Extending W=1 in the same way would affect
everybody.
