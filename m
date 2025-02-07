Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E20D3A2CAF7
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 19:16:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CD910EB9A;
	Fri,  7 Feb 2025 18:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dYtkQyL9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD3410EB9A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 18:16:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4B8F6A43915;
 Fri,  7 Feb 2025 18:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D00C4CED1;
 Fri,  7 Feb 2025 18:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1738952177;
 bh=Eq4cBho7gaFSCAzvdIWPOTbGcCpCxWQkoaDnbjh0a/A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dYtkQyL9R4s5F/N1Qc8eNa/zpLRu+R/5gpq8SzJ8+0J20vJGafaHQn/CBVwUbJwBl
 ajHqq7eFr+PQsg6xEQ7uN6kBTV41D6fV1zQLqYzx61TvOm5X7/f0jfshBj+IJHx0by
 HGzLZ7ARvwiQ3fVYqIWk6WYUI0hKpp6YQNgeDNDg=
Date: Fri, 7 Feb 2025 13:16:11 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Hector Martin <marcan@marcan.st>
Cc: Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@gmail.com>, 
 Jason Gunthorpe <jgg@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>, phasta@kernel.org,
 Christoph Hellwig <hch@lst.de>, 
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 daniel.almeida@collabora.com, aliceryhl@google.com, robin.murphy@arm.com, 
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com, 
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
Message-ID: <20250207-prehistoric-married-dormouse-3e1aa7@lemur>
References: <2025013148-reversal-pessimism-1515@gregkh>
 <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
 <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st>
 <Z6UPXxEJYpanU9iU@cassiopeiae>
 <4c0a7cf9-26e1-4a19-8a6e-7c30bc3aef86@marcan.st>
 <20250207-mature-pastel-rottweiler-e6dbd9@lemur>
 <1bbdf8b7-a70b-4994-865e-7fcb8d53ebef@marcan.st>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1bbdf8b7-a70b-4994-865e-7fcb8d53ebef@marcan.st>
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

On Sat, Feb 08, 2025 at 03:02:11AM +0900, Hector Martin wrote:
> The centralization concern is valid, but there are technical solutions
> to this, such as forge federation. 

Unfortunately, forge federation is really only between Forgejo instances and
is still pretty nascent, afaict. The most promising development in
decentralized forges that I've seen is Radicle, but I'm yet to try it again
ever since they got collectively drunk on bitcoin coolaid a few years ago.

> Meanwhile, for better or worse, much of Linux infra *is* centralized -
> for example, the mailing lists themselves, and a lot of the Git hosting.

Yes, but it's at least resilient. If someone knocks out vger.kernel.org,
kernel development will still continue because maintainers are still cc'd
directly via email, and email is still the only widely adopted federated
platform that we have, with nothing else coming anywhere close.

> At the end of the day, I do not believe a theoretical breakdown of Linux
> infra would be a major long-term setback to Linux kernel development.

We know it's the case when kernel.org went off the air for months in 2011. :)
Let's keep it that way!

> But I'm afraid you'll find much if not most of the true opposition to
> forges is not technical, it is philosophical or preference-based (even
> though it may be presented as technical opposition, sometimes to
> intentionally mislead). This is, in fact, quite a mirror of the R4L
> situation, where technical arguments ("show me you can write a real
> driver") quickly lead to non-technical arguments when solutions are
> proposed ("it's cancer").
> 
> I actually considered moving soc/apple development to a forge personally
> in the near future (obviously not my call to make any more), and I was
> fully expecting a pile of pushback, "because that's not how we do things
> here". Who knows, I might have gotten a "fuck you, either you accept
> email patches or I remove you from MAINTAINTERS" from Linus.

It is my goal to be able to give subsystems a way to use forges without it
impacting how they interact with upstream or handle tree-wide changes. That
is, once I'm done moving things from one Benevolent Company to another.

> All that said, thanks for b4. I might have given up much earlier, not
> due to flamewars but due to exhaustion with poor tooling, if it didn't
> exist.

I'm happy to hear that.

Best wishes,
-K
