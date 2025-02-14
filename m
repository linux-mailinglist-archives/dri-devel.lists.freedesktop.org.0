Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8A6A366A5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 21:05:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96E110E365;
	Fri, 14 Feb 2025 20:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.b="Zcqd7Muw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 930 seconds by postgrey-1.36 at gabe;
 Fri, 14 Feb 2025 20:05:37 UTC
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12B110E365
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 20:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
 bh=9Lwc6ovB+AAsRpWlUng0A8U3oiN7oiWCRl5T7bGuQNY=; b=Zcqd7MuwSp32VjaIeQh5yxL/U6
 icJVq5xrEpspT/pKRtBxR7iEunSEhjiVPPCrSRqP10coccrZkG5YUNLZmffQUiZerd62tVgb3HLd2
 znI7Mzv5bo8NbC2ixCTPRCHTPSIxIK/qj0liS+a+JNXUMioYlPFlpUy/M6odXJ3kAQEu64fX1f5Zd
 GS2kofNlks6aKd+u5V97NzagKHrx+L7QSFNQZknXhh5XlHN1XPfQu/dabOW61EwnIiLCVvJ8/pNN5
 u2lhMrSUoiJwwDKXBqkbYIUTZzE7XUajvFlJn2A4WyYCFLOESb5GpPpLsZDFsPbdiRaD6pipLDOJk
 JM61i51g==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tj1h3-0000000E68X-33mp; Fri, 14 Feb 2025 19:49:45 +0000
Date: Fri, 14 Feb 2025 19:49:45 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Neal Gompa <neal@gompa.dev>
Cc: Mark Brown <broonie@kernel.org>, Hector Martin <marcan@marcan.st>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@gmail.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, phasta@kernel.org,
 Christoph Hellwig <hch@lst.de>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 David Airlie <airlied@redhat.com>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
Message-ID: <20250214194945.GE1977892@ZenIV>
References: <2025013148-reversal-pessimism-1515@gregkh>
 <1bbdf8b7-a70b-4994-865e-7fcb8d53ebef@marcan.st>
 <20250207-prehistoric-married-dormouse-3e1aa7@lemur>
 <7742420.9J7NaK4W3v@skuld-framework>
 <d6cae188-28e5-409f-86ed-7ddf374fd354@sirena.org.uk>
 <CAEg-Je9BiTsTmaadVz7S0=Mj3PgKZSu4EnFixf+65bcbuu7+WA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEg-Je9BiTsTmaadVz7S0=Mj3PgKZSu4EnFixf+65bcbuu7+WA@mail.gmail.com>
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

On Fri, Feb 14, 2025 at 02:10:57AM -0500, Neal Gompa wrote:
> On Mon, Feb 10, 2025 at 12:28 PM Mark Brown <broonie@kernel.org> wrote:
> >
> > On Sun, Feb 09, 2025 at 03:25:26AM -0500, Neal Gompa wrote:
> > > On Friday, February 7, 2025 1:16:11 PM Eastern Standard Time Konstantin
> > > Ryabitsev wrote:
> >
> > > > It is my goal to be able to give subsystems a way to use forges without it
> > > > impacting how they interact with upstream or handle tree-wide changes. That
> > > > is, once I'm done moving things from one Benevolent Company to another.
> >
> > > Honestly, this is probably not possible. If a subsystem moves to a forge
> > > workflow, it pretty much means tree-wide changes need to work partially that
> > > way too.
> >
> > We do actually have some people using forges already, for example the
> > SOF people do a bunch of their review on github and then turn that into
> > patch serieses which they send via the normal email route when they're
> > happy with them.  I think tree wide stuff flows in via back merges or
> > rebases, one of the benefits of delegation is that it's not my problem.
> > This all works perfectly well from my side, as far as I know it's fine
> > for the SOF people too.  It certainly doesn't seem insurmountable.
> 
> It might be working as long as a subsystem continues to allow
> receiving patches via email. As soon as a subsystem decides to stop
> doing that (which is absolutely their right given the model of
> subsystem maintenance that the Linux project has), I think this will
> break down very quickly.
> 
> I wonder which team will be the first one to do it. It's not a
> question of if, but when.

Then it will be a matter of patches affecting their subtree getting merged
through the mainline.  All there is to it...
