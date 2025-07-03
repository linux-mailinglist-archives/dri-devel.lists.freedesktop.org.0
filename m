Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0234DAF82A7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 23:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7EA10E1CB;
	Thu,  3 Jul 2025 21:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="Nas0qbwd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3AF10E1CB
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 21:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=A83NKRGoevWzL/NcvqijuYTaZ0xDTVIZ9pvu0pc07Jk=; b=Na
 s0qbwdL6B67K0wS+f7tbNlfneHHctNev/cTniYFhLMkwezOAunGEDatFtpLb4g+PG761JVmPtbDzC
 rfpydruVCCrDayQ33cjSGl/o6BiA+VGkuX6ILQmO0/nR1G4/Ap/W5RcWrBNuhbzqrUhTrrpdbnIlt
 YvmVDe7keP8zJfo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uXRTN-0008hX-2p; Thu, 03 Jul 2025 23:28:01 +0200
Date: Thu, 3 Jul 2025 23:28:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>,
 Michal Rostecki <vadorovsky@protonmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Jens Axboe <axboe@kernel.dk>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Dave Ertman <david.m.ertman@intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Breno Leitao <leitao@debian.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 llvm@lists.linux.dev, linux-pci@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-block@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v13 2/5] rust: support formatting of foreign types
Message-ID: <34c00dfa-8302-45ee-8d80-58b97a08e52e@lunn.ch>
References: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
 <20250701-cstr-core-v13-2-29f7d3eb97a6@gmail.com>
 <DB2BDSN1JH51.14ZZPETJORBC6@kernel.org>
 <CAJ-ks9nC=AyBPXRY3nJ0NuZvjFskzMcOkVNrBEfXD2hZ5uRntQ@mail.gmail.com>
 <DB2IJ9HBIM0W.3N0JVGKX558QI@kernel.org>
 <CAJ-ks9nF5+m+_bn0Pzi9yU0pw0TyN7Fs4x--mQ4ygyHz4A6hzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9nF5+m+_bn0Pzi9yU0pw0TyN7Fs4x--mQ4ygyHz4A6hzg@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 03, 2025 at 02:55:30PM -0400, Tamir Duberstein wrote:
> On Thu, Jul 3, 2025 at 11:08 AM Benno Lossin <lossin@kernel.org> wrote:
> >
> > On Thu Jul 3, 2025 at 3:55 PM CEST, Tamir Duberstein wrote:
> > > On Thu, Jul 3, 2025 at 5:32 AM Benno Lossin <lossin@kernel.org> wrote:
> > >> On Tue Jul 1, 2025 at 6:49 PM CEST, Tamir Duberstein wrote:
> > >> > Introduce a `fmt!` macro which wraps all arguments in
> > >> > `kernel::fmt::Adapter` and a `kernel::fmt::Display` trait. This enables
> > >> > formatting of foreign types (like `core::ffi::CStr`) that do not
> > >> > implement `core::fmt::Display` due to concerns around lossy conversions which
> > >> > do not apply in the kernel.
> > >> >
> > >> > Replace all direct calls to `format_args!` with `fmt!`.
> > >> >
> > >> > Replace all implementations of `core::fmt::Display` with implementations
> > >> > of `kernel::fmt::Display`.
> > >> >
> > >> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> > >> > Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Custom.20formatting/with/516476467
> > >> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > >> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > >> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > >> > ---
> > >> >  drivers/block/rnull.rs       |  2 +-
> > >> >  drivers/gpu/nova-core/gpu.rs |  4 +-
> > >> >  rust/kernel/block/mq.rs      |  2 +-
> > >> >  rust/kernel/device.rs        |  2 +-
> > >> >  rust/kernel/fmt.rs           | 89 +++++++++++++++++++++++++++++++++++++++
> > >> >  rust/kernel/kunit.rs         |  6 +--
> > >> >  rust/kernel/lib.rs           |  1 +
> > >> >  rust/kernel/prelude.rs       |  3 +-
> > >> >  rust/kernel/print.rs         |  4 +-
> > >> >  rust/kernel/seq_file.rs      |  2 +-
> > >> >  rust/kernel/str.rs           | 22 ++++------
> > >> >  rust/macros/fmt.rs           | 99 ++++++++++++++++++++++++++++++++++++++++++++
> > >> >  rust/macros/lib.rs           | 19 +++++++++
> > >> >  rust/macros/quote.rs         |  7 ++++
> > >> >  scripts/rustdoc_test_gen.rs  |  2 +-
> > >> >  15 files changed, 236 insertions(+), 28 deletions(-)
> > >>
> > >> This would be a lot easier to review if he proc-macro and the call
> > >> replacement were different patches.
> > >>
> > >> Also the `kernel/fmt.rs` file should be a different commit.
> > >
> > > Can you help me understand why? The changes you ask to be separated
> > > would all be in different files, so why would separate commits make it
> > > easier to review?
> >
> > It takes less time to go through the entire patch and give a RB. I can
> > take smaller time chunks and don't have to get back into the entire
> > context of the patch when I don't have 30-60min available.
> 
> Ah, I see what you mean. Yeah, the requirement to RB the entire patch
> does mean there's a benefit to smaller patches.

I often tell kernel newbies:

Lots of small patches which are obviously correct.

A small patch tends to be more obviously correct than a big patch. The
commit message is more focused and helpful because it refers to a
small chunk of code. Because the commit message is more focused, it
can answer questions reviewers might ask, before they ask them. If i
can spend 60 seconds looking at a patch and decide it looks correct,
i'm more likely to actually look at it and give a reviewed by. If i
need to find 10 minutes, it is going to get put off for a later
time. Many reviewers just have a few minutes here, a few there,
slotted into time between other tasks, while drinking coffee, etc.

	Andrew
