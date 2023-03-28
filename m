Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9928A6CCA6B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 21:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB49910E4A0;
	Tue, 28 Mar 2023 19:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61BF10E4A0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 19:07:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6E834B81CB2;
 Tue, 28 Mar 2023 19:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1110C433D2;
 Tue, 28 Mar 2023 19:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680030467;
 bh=ssr+04WYQP/MuT28p4/ksJLN0ZZeX1hkEAtus4Xzjno=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VhSmw80koljABs1Ar+f+KOOq9HFE34jhJJ0I1Z06REJKH/5Tuqp5n5HpPt3TTX7zf
 jJCCeQBGd0b3HVxlf/w8KxDJPyuOczogo7XCOlV8OutI5KXd9W7spgUd8tB2KDOme/
 eB+odT9IGLnXP3rrHwyGA2LOE00E8ShUu6YK6OvrIuT16TeZACd2aT9syWTtcDvHWS
 u68TmXSUtDVB9TWJ2lY8GBNLS+VkYL2+5Coi11uhTbz+cyV+V51Lw//+hanvi8tkjO
 szm7AaKCV3WuWN+b/CQ1wgLSaTelTJvfKxoQVEgkcsTU4I+olOGXNqP/Fhp1wYRk9O
 B5VetVbYWREAw==
Date: Tue, 28 Mar 2023 12:07:45 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Subject: Re: Linux 6.3-rc3
Message-ID: <20230328190745.GA375033@dev-arch.thelio-3990X>
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320180501.GA598084@dev-arch.thelio-3990X>
 <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com>
 <20230320185337.GA615556@dev-arch.thelio-3990X>
 <87pm91uf9c.fsf@kernel.org>
 <20230322163637.GA918620@dev-arch.thelio-3990X>
 <87wn36ctdi.fsf@kernel.org>
 <20230324151150.GC428955@dev-arch.thelio-3990X>
 <87o7oicgwv.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o7oicgwv.fsf@kernel.org>
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

On Fri, Mar 24, 2023 at 05:23:12PM +0200, Kalle Valo wrote:
> Nathan Chancellor <nathan@kernel.org> writes:
> 
> >> This is nitpicking but it would be nice if the tarball contents wouldn't
> >> conflict with each other. Now both llvm-16.0.0-aarch64.tar.gz and
> >> llvm-16.0.0-x86_64.tar extract to the same directory llvm-16.0.0 with
> >> same binary names. It would be much better if they would extract to
> >> llvm-16.0.0-aarch64 and llvm-16.0.0-x86_64, respectively.
> >> 
> >> For example, Arnd's crosstool packages don't conflict with each other:
> >> 
> >> https://mirrors.edge.kernel.org/pub/tools/crosstool/
> >
> > I could certainly do that but what is the use case for extracting both?
> > You cannot run the aarch64 version on an x86_64 host and vice versa, so
> > why bother extracting them?
> 
> Ah, I didn't realise that. I assumed llvm-16.0.0-aarch64.tar.gz was a
> cross compiler. I'm sure you documented that in the page but hey who
> reads the documentation ;)

:)

I have adjusted the README to hopefully make that clearer.

> > I had figured the architecture would be irrelevant once installed on
> > the host, so I opted only to include it in the tarball name. Perhaps I
> > should make it clearer that these are the host architectures, not the
> > target architectures (because clang is multi-targeted, unlike GCC)?
> 
> Makes sense now. But I still think it's good style that a tarball named
> llvm-16.0.0-aarch64.tar.gz extracts to llvm-16.0.0-aarch64.

Indeed, I have adjusted it for future builds:

https://github.com/nathanchance/env/commit/314837e6706889138121a32140d2acdc7895d390

> >> And maybe request a similar llvm directory under pub/tools to make it
> >> more official? :)

We now have https://kernel.org/pub/tools/llvm/, which is about as
official as we can get I suppose :)

https://kernel.org/pub/linux/kernel/people/nathan/llvm/ now points
people there.

Cheers,
Nathan
