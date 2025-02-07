Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B89A2CACA
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 19:06:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F20510EBA2;
	Fri,  7 Feb 2025 18:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marcan.st header.i=@marcan.st header.b="C+tu+ElY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5205B10EB96
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 18:02:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id D092B41F7F;
 Fri,  7 Feb 2025 18:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
 t=1738951335; bh=K63Fpm4Kxp5LTpQxJQ48pUAOYhYczonzA7LReojlAZI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=C+tu+ElYntR8wBRcFKZxvP6WG3en/4yVXwKudMP9OdBRDAK929qu94F07Cd6XDOYi
 8lsSohR320RRmapyxLRcWS/BmrZbORe0ypjHrqir/5kN9qPjvzxc1rT00C0H5kM+KV
 T2HZmN9pYNoxWIzQ3K8rdRKmZcLCoxuDbaswNyDVZWHt8NtD1I9oED8p7YZ8s3msh6
 eA138FEJVwOTv98gWB/TULbOnWosb1oJa2hyOtT8NEsIXYUB6HywGOINGx88zU8DDG
 qCip0FULgWnmfV8y3ssFjjrnGnJsbMefCagHqH+HvcvON/sQlGngiqLN2CmZd5tz2x
 ZJo7jfDuxehOA==
Message-ID: <1bbdf8b7-a70b-4994-865e-7fcb8d53ebef@marcan.st>
Date: Sat, 8 Feb 2025 03:02:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@gmail.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, phasta@kernel.org,
 Christoph Hellwig <hch@lst.de>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, daniel.almeida@collabora.com,
 aliceryhl@google.com, robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <2025013030-gummy-cosmic-7927@gregkh>
 <20250130172437.GN5556@nvidia.com>
 <2025013148-reversal-pessimism-1515@gregkh>
 <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
 <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st>
 <Z6UPXxEJYpanU9iU@cassiopeiae>
 <4c0a7cf9-26e1-4a19-8a6e-7c30bc3aef86@marcan.st>
 <20250207-mature-pastel-rottweiler-e6dbd9@lemur>
From: Hector Martin <marcan@marcan.st>
Content-Language: en-US
In-Reply-To: <20250207-mature-pastel-rottweiler-e6dbd9@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 2025/02/08 2:14, Konstantin Ryabitsev wrote:
> On Fri, Feb 07, 2025 at 05:16:28AM +0900, Hector Martin wrote:
>> And what I see, is very little effort to improve that status quo, or at
>> least very little that yields any actual change that isn't just
>> band-aids (e.g. tooling like b4, which is nice and appreciated, but
>> doesn't fix any underlying issues). And that's not going to change no
>> matter how many long technical arguments we have on the MLs (or even off
>> MLs, since MLs are also not particularly good for this, and I've seen
>> multiple arguments only reach a resolution after being redirected to IRC).
> 
> From my perspective, there are several camps clashing when it comes to the
> kernel development model. One is people who are (rightfully) pointing out that
> using the mailing lists was fine 20 years ago, but the world of software
> development has vastly moved on to forges.
> 
> The other camp is people who (also rightfully) point out that kernel
> development has always been decentralized and we should resist all attempts to
> get ourselves into a position where Linux is dependent on any single
> Benevolent Entity (Github, Gitlab, LF, kernel.org, etc), because this would
> give that entity too much political or commercial control or, at the very
> least, introduce SPoFs.
> 
> At best, I can hope to make both camps grumpily agree to coexist.
> 
> I *am* very wary of Benevolent Entities, because we have too many very recent
> examples of companies "realigning priorities" when political winds shift.
> Programs and initiatives that have until recently been poster board examples
> of progress and benevolence are shuttered and defunded. I am concerned that
> we're only a couple of mood swings away from someone deciding that free
> software should not be allowed to exist because it benefits America's foes.
> Many of us remember all too well when large tech giants treated Linux as a
> "cancer" to be opposed, and I can certainly see that idea easily re-entering
> some Big Brain in Charge.
> 
> From my perspective, I would like to ensure that Linux development can
> continue without a hard dependency on a single centralized forge -- whether
> controlled by a large commercial entity, or even a standalone one that is
> operated by kernel.org. It's becoming shockingly difficult to operate a public
> resource on the web unless you're willing to put it behind a large commercial
> CDN that will protect you from hostile bots (and if you do that, you're back
> to depending on the whims of a Benevolent Entity).
> 
> We're trying to get lore.kernel.org to the point where it's like a global
> messaging bus that is indexed and searchable. Currently, you mostly have to
> send things to a mailing list for them to end up on lore, but it's gradually
> becoming less and less the case. We're already bridging with bugzilla and we
> should be able to bridge with forges soon, too (currently delayed again
> because I'm scrambling to move kernel.org frontends away from Equinix). Who
> knows, we may be actually leapfrogging the forge era of software development
> straight into "AI" agents era -- but that remains to be seen.
> 
> Anyway, all of this is to say that I'm happy that you've found b4 useful, but
> I wouldn't view it as a band-aid -- it's just a very small and email-centric
> way to interact with the kernel lore.
> 

The centralization concern is valid, but there are technical solutions
to this, such as forge federation. It's possible to set up a forge
environment to be less of a SPoF, such as by ensuring all data is open
and archiveable to allow for migration and backup restore, even by third
parties (you can make practically ~all forge data public except for
login passwords, and we have email-based reset processes for those).
It's also possible to simply shard, and let different subsystems choose
their own forge infrastructure, so downtime has a more limited effect.

Meanwhile, for better or worse, much of Linux infra *is* centralized -
for example, the mailing lists themselves, and a lot of the Git hosting.

There's also the fact that there is enough support for Linux that
finding a Benevolent Entity to provide stuff like DDoS protection is not
particularly hard, and such services are easily replaceable should
priorities change (and indeed are the kind of service that can only be
provided by a large entity, whether paid or sponsored, by nature). Heck,
even I have a Benevolent Entity sponsoring a CDN frontend for Asahi
sites and installer images (bunny.net, they're nice, highly recommended).

At the end of the day, I do not believe a theoretical breakdown of Linux
infra would be a major long-term setback to Linux kernel development.
The kernel already survived the great BitKeeper to Git migration, and
this time there's no proprietary software to be yanked out from under
the kernel (at least assuming the forge of choice is FOSS and
self-hostable, which seems like a no-brainer given the concerns). As
long as everyone has the Git trees, infrastructure can be rebuilt. As
long as everyone has email and git, development can continue ad-hoc.
Sure, it would cause a blip, but it's not like we would switch to a
forge, the forge would go down for a few days, and it would not be the
end of the world. Just ask the freedesktop folks (a good case study on
how infra is hard, but not impossible, and even if imperfect, even if at
times frustrating, it still functions, and well enough to still be
wildly positive compared to not having that infra at all).

But I'm afraid you'll find much if not most of the true opposition to
forges is not technical, it is philosophical or preference-based (even
though it may be presented as technical opposition, sometimes to
intentionally mislead). This is, in fact, quite a mirror of the R4L
situation, where technical arguments ("show me you can write a real
driver") quickly lead to non-technical arguments when solutions are
proposed ("it's cancer").

I actually considered moving soc/apple development to a forge personally
in the near future (obviously not my call to make any more), and I was
fully expecting a pile of pushback, "because that's not how we do things
here". Who knows, I might have gotten a "fuck you, either you accept
email patches or I remove you from MAINTAINTERS" from Linus.

All that said, thanks for b4. I might have given up much earlier, not
due to flamewars but due to exhaustion with poor tooling, if it didn't
exist.

- Hector

