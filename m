Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B21B3A2D3C7
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 05:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DEA10E0D2;
	Sat,  8 Feb 2025 04:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C79510E0D2
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 04:27:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9FCC35C0BD4;
 Sat,  8 Feb 2025 04:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D165EC4CED6;
 Sat,  8 Feb 2025 04:26:57 +0000 (UTC)
Date: Fri, 7 Feb 2025 23:26:50 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Dr. Greg" <greg@enjellic.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Hector Martin <marcan@marcan.st>, Dave Airlie <airlied@gmail.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Greg KH <gregkh@linuxfoundation.org>, phasta@kernel.org,
 Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bj??rn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
Message-ID: <Z6bdCrgGEq8Txd-s@home.goodmis.org>
References: <2025013030-gummy-cosmic-7927@gregkh>
 <20250130172437.GN5556@nvidia.com>
 <2025013148-reversal-pessimism-1515@gregkh>
 <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
 <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st>
 <CAHk-=wi=ZmP2=TmHsFSUGq8vUZAOWWSK1vrJarMaOhReDRQRYQ@mail.gmail.com>
 <20250207121638.GA7356@wind.enjellic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207121638.GA7356@wind.enjellic.com>
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

On Fri, Feb 07, 2025 at 06:16:38AM -0600, Dr. Greg wrote:
> 
> Not sure what the fix is, from a project management perspective the
> technology industry has never faced a challenge like this.  The fork
> model, which was the classic protection in open-source, doesn't work
> at this scale.

Maybe not quite a fork, but I wonder if the Rust project did something similar
to what PREEMPT_RT did. That was to keep an out of tree patch. The full patch
was just merged last September after being out of tree for a good 20 years.

In the beginning there was a few things in that patch that Christoph was
against, but over time he became accepting of it.

Yes, being out of tree is very difficult because you have to constantly rebase
(we actually found quilt being a better tool than git in this case!). But it
also gives you full flexibility to try new approaches. Just because something
is out of tree doesn't mean it can't be published and used. Red Hat and SUSE,
as well as many others shipped PREEMPT_RT while it was out of tree.

Note, even though PREEMPT_RT started in 2004 and wasn't fully merged until
2024, it slowly did creep in bit by bit. For example, here's a few things that
came from the RT patch, and each was rewritten at least 3 times to become
acceptable by the upstream maintainers:

  - NOHZ
  - High res timers
  - threaded interrupts
  - mutex code (yes, before RT everything used a semaphore)
  - lockdep
  - ftrace
  - generic interrupt code
  - generic timer code
  - priority inheritance
  - SCHED_DEADLINE
  - RT push/pull scheduling

and more.

Point being, if you are having issues with getting code upstream, don't be
afraid to make it out of tree. Just make it easy for others to use. And slowly
move your code into mainline. This is also a way to prove beyond a doubt how
useful your code is. The number of users is a technical argument. Linus does
pull things in when there is a large user base, even over other maintainer's
objections (see sched_ext).

It worked for us, it can work for you ;-)

-- Steve

