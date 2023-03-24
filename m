Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B40D6C80CF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 16:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5664610E174;
	Fri, 24 Mar 2023 15:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5259710E174
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 15:11:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BDDC0B824F5;
 Fri, 24 Mar 2023 15:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A886C433EF;
 Fri, 24 Mar 2023 15:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679670712;
 bh=LXkcBaVN4sD3aA/Yu8oqsBZwSZvmPG3nbf3lXKaMxBw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q7XyjBSlZLCbflyBFYLN3PU1XLSRlIcWMtf8/jETGeeiJziAIM3Fk7N125iH5TCXV
 07zvCLWWzvRJB1qTr+KeCY2aqKpdfVyzQvX3av2JjOk1SQmw2S3h9NPOTkzVrH93Wi
 pdVph57fEjSZZR9pgbMB1B2QrmZkmPsGnUjvGfAQznBeyjeIRlMc0RJVcRJp9CH7LY
 lng/crNCS0C3rVCPLaGeea9dVE5XIXBZi9agCNDETO9DYVFjtMWXwOnj748JQ6DpO7
 xmA8kzxky13rYck3GGP0hNCxB+vOh2gWmnnEp55FN5jwYTObGv4srpeLDgEfNFB9AY
 CqKmZdnmiCG0A==
Date: Fri, 24 Mar 2023 08:11:50 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Subject: Re: Linux 6.3-rc3
Message-ID: <20230324151150.GC428955@dev-arch.thelio-3990X>
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320180501.GA598084@dev-arch.thelio-3990X>
 <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com>
 <20230320185337.GA615556@dev-arch.thelio-3990X>
 <87pm91uf9c.fsf@kernel.org>
 <20230322163637.GA918620@dev-arch.thelio-3990X>
 <87wn36ctdi.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wn36ctdi.fsf@kernel.org>
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>, llvm@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-toolchains@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 24, 2023 at 12:54:01PM +0200, Kalle Valo wrote:
> Nathan Chancellor <nathan@kernel.org> writes:
> 
> > On Wed, Mar 22, 2023 at 02:44:47PM +0200, Kalle Valo wrote:
> >> Nathan Chancellor <nathan@kernel.org> writes:
> >> 
> >> > Perhaps these would make doing allmodconfig builds with clang more
> >> > frequently less painful for you?
> >> >
> >> > https://lore.kernel.org/llvm/20230319235619.GA18547@dev-arch.thelio-3990X/
> >> 
> >> Thank you, at least for me this is really helpful.
> >
> > Really glad to hear! I hope this helps make testing and verifying
> > changes with clang and LLVM easier for developers and maintainers.
> 
> It really does. And I hope you are able to update these packages in
> future as well so that it would be easy to get the latest clang.

That is the current plan (I will push 16.0.1, 16.0.2, etc. as they are
released), I have a relatively automated process for this going forward.

> >> I tried now clang for the first time but seeing a strange problem.
> >> 
> >> I prefer to define the compiler in GNUmakefile so it's easy to change
> >> compilers and I don't need to remember the exact command line. So I have
> >> this in the top level GNUmakefile (all the rest commented out):
> >> 
> >> LLVM=/opt/clang/llvm-16.0.0/bin/
> >> 
> >> If I run 'make oldconfig' it seems to use clang but after I run just
> >> 'make' it seems to switch back to the host GCC compiler and ask for GCC
> >> specific config questions again. Workaround for this seems to be adding
> >> 'export LLVM' to GNUmakefile, after that also 'make' uses clang as
> >> expected.
> >
> > Interesting... I just tested with a basic GNUmakefile and everything
> > seems to work fine without an export. At the same time, the export
> > should not hurt anything, so as long as it works, that is what matters.
> 
> Sure, once I figured out the quirks I can workaround them. I was just
> hoping that other users would not have to go through the same hassle as
> I did :)
> 
> > If you have any further issues, please do not hesitate to reach out!
> 
> This is nitpicking but it would be nice if the tarball contents wouldn't
> conflict with each other. Now both llvm-16.0.0-aarch64.tar.gz and
> llvm-16.0.0-x86_64.tar extract to the same directory llvm-16.0.0 with
> same binary names. It would be much better if they would extract to
> llvm-16.0.0-aarch64 and llvm-16.0.0-x86_64, respectively.
> 
> For example, Arnd's crosstool packages don't conflict with each other:
> 
> https://mirrors.edge.kernel.org/pub/tools/crosstool/

I could certainly do that but what is the use case for extracting both?
You cannot run the aarch64 version on an x86_64 host and vice versa, so
why bother extracting them? I had figured the architecture would be
irrelevant once installed on the host, so I opted only to include it in
the tarball name. Perhaps I should make it clearer that these are the
host architectures, not the target architectures (because clang is
multi-targeted, unlike GCC)?

> And maybe request a similar llvm directory under pub/tools to make it
> more official? :)

Yes, I was talking that over with Nick recently, as having it under a
group on kernel.org would make taking over maintainership easier should
something happen to me :)

Thanks for all the feedback so far, it is much appreciated!

Cheers,
Nathan
