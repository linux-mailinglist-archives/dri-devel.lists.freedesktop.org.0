Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 177F8BA48F8
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 18:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCA210EA9A;
	Fri, 26 Sep 2025 16:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YmN/pPP6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC3A10EA9A
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 16:10:48 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-795be3a3644so12180516d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 09:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758903047; x=1759507847; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :feedback-id:from:to:cc:subject:date:message-id:reply-to;
 bh=iS2jH8joxnDE0/hOPwBCvRREi5onrG6qq8QmOEtOYZk=;
 b=YmN/pPP6SwWIxFO7BZCwq05N77MHIzvfKxZjlDgsVn6AG9m+xtL2IJjTUKLhfwaDS3
 x0gpwS1ia0ynxJdOlDrYp1+3Jx+vXKQ6TzwBiWX5tacrsnHBi3XNhAjltYQ9qyKvXTBA
 KyQIAdsYdBXJ2gYSj56DSvc8JD29QZJ5Jz00qnMiitACTmVmodcOEPhEtriTPnXAdJE+
 0DRSnovFKlL02g7wwTEcortOyLXIlwixeA1TIa6W+1W5oZ2TGz1FonvDojb4gTVb5Usq
 jebfZ+cAjZwCUusAOGV8ADeFuBsvaoSJgQDYl5wnruMIP1HqXHyhzILICDfn3evTfwhT
 SoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758903047; x=1759507847;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iS2jH8joxnDE0/hOPwBCvRREi5onrG6qq8QmOEtOYZk=;
 b=TqWnv9HlfRPUxDdvYIh8RRC7zs4HQ9p49CWhhMYIH3d5P30bSFfspM2qvEtvelZmXO
 EfQP5D8CaV6aaVzcPT0yuwb84wfMid449jzB5tnYJjQLRMzCcBxBhxC5IdJIIvt1jk2u
 vwUGr592zM1cNLBAucWgZ9Wuq2rKxeof22M3xWsM8SG1tDbIEwrAz2OHjcyhXC5hVNF8
 7A3+TYn7TeyTtt7Gk65P7WhrWW9XgUVxhRS1dIKyQccg0KjNpik1uTQOSyAynp8GdmO0
 H11rjKjkt29GMuV4lMhLpSL/qZ/WePlz7+2Z/7FYl8uHDeyudoY82cIq/WSI0IaI16rT
 ZK/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxohSG24AS2GQPCBpKSKg48KTgUVjmHRYdjdIxXwGNFJutZ+W9dbtMZ99pI9Gx9ZgCsfwOoiFKjUo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxU8IfmpmKms4l/W/Ko0/J8u5iRi9sV/kEVaJusPoUHOXc23lpV
 E3VG/ZMr2WDWVOL5Cy+6Yza6gDXSq6jXcQuRMOFORa7YASFyd2j8rgII
X-Gm-Gg: ASbGnctFHI9DfOxH0bqSA0X3FmqrTQuvWcQjKHke/btXw/F88gUI3AKKXihSQ1J51OJ
 1dpOFnx4zMQDCmL6UuKg1wju3Ao+qmFb1rOCoMhbX09ThnS/r6JfuPK8xj3pjgA6N887Zhz2fz/
 rZ5L3o3D4GgXHHXKvc/GEAvU7UZfUhznShyq6ITrmmNA+x+TL6zkVmh080glVgW5klO8J8RRT9s
 Tu0vLllTNNFft1KMVNMp2SF69BF9MoU39LB82+BR1To6OjG8h4QHVq2L7aNs1NhNZfTSdxkwcya
 1jlTNXapI6xX0aKLpBjbI480S3X4iyDv/h87zYy8hzJiCsnl9so4OWdOTzjKiOcJxMbxbEWYLeO
 ykBTJ6MxRLywV6heCK5WJtNKeCl2BE0kn21zk3uwblL+RRPsqkasD3r5GGjTNAJjOhNwUJ1MqnJ
 Fqw301Aa2l5n0zn8mZPOMzAZ4=
X-Google-Smtp-Source: AGHT+IEJzR6PCrUgJkNWH9fQSw/nY/s4Zu4U9QY66TsXFNh3e/NVRbzSY9nlbLgfJ09gjwgG9YTkEw==
X-Received: by 2002:ad4:5fc7:0:b0:78e:7a30:4d62 with SMTP id
 6a1803df08f44-7fc28075665mr116691516d6.4.1758903047160; 
 Fri, 26 Sep 2025 09:10:47 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com
 (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8013cdf424asm28671636d6.26.2025.09.26.09.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 09:10:46 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfauth.phl.internal (Postfix) with ESMTP id CABA3F4006A;
 Fri, 26 Sep 2025 12:10:45 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Fri, 26 Sep 2025 12:10:45 -0400
X-ME-Sender: <xms:BbvWaHVuXDP3iMjjPX1m7M90D-RNquoCqG1-esnmJoBZQAkpEpd3Tw>
 <xme:BbvWaPxByfBQ4KDba0u_gP05hEOPa2GwGVSFrFwj1ZDKwheQ9tzEHMjiMvO3m94Vo
 pw-fILu9wwFJpcKDTvrzb3_leAhSUzCccxhFghI2B1PHu1ckeOI>
X-ME-Received: <xmr:BbvWaGDlLAeh4zRnhHena0ITcMn-iqQroSYWAFMBj-lzXqd2AuLRdGK5ZpFtYnRPSMHgfmsK5w20xWICBdHyLygKoVFrB1a0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeileekudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepuehoqhhunhcu
 hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
 gvrhhnpedtgeehleevffdujeffgedvlefghffhleekieeifeegveetjedvgeevueffieeh
 hfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
 hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
 udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
 gvrdhnrghmvgdpnhgspghrtghpthhtohepfeehpdhmohguvgepshhmthhpohhuthdprhgt
 phhtthhopehphhgrshhtrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurg
 eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghi
 lhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtth
 hopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopehl
 ohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhgse
 hkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdr
 tghomhdprhgtphhtthhopehtmhhgrhhoshhssehumhhitghhrdgvughu
X-ME-Proxy: <xmx:BbvWaN7gMW_uJOXoaGTJ9xSlmxs7n2SOoVL41AmneFiFZsrDOjL-tA>
 <xmx:BbvWaFknzs2z_PNwzZBGvsA40uAsb8YUJYaM6UCaDKjxqxRM7WbG3g>
 <xmx:BbvWaIc59-2Me0P7VNO45_KkiB0ShlA5xzw4G9hvwC7kfQ5kEfECMQ>
 <xmx:BbvWaG0UA8e0wvyM67dznKC7x3DNyCxCfifsnDms3P5cfKMviV4BKA>
 <xmx:BbvWaP4FRn_SWivUuOoKR9rfZR6a0P0Y3ZFVUjm5c2oZS7M15ACO598b>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Sep 2025 12:10:44 -0400 (EDT)
Date: Fri, 26 Sep 2025 09:10:44 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,	Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>,	Waiman Long <longman@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>,	Justin Stitt <justinstitt@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Krishna Ketan Rai <prafulrai522@gmail.com>,
 Lyude Paul <lyude@redhat.com>,	Mitchell Levy <levymitchell0@gmail.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH] rust: sync: Add dma_fence abstractions
Message-ID: <aNa7BDpKS2KA__4M@tardis.local>
References: <20250918123100.124738-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250918123100.124738-2-phasta@kernel.org>
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

On Thu, Sep 18, 2025 at 02:30:59PM +0200, Philipp Stanner wrote:
> dma_fence is a synchronization mechanism which is needed by virtually
> all GPU drivers.
> 
> A dma_fence offers many features, among which the most important ones
> are registering callbacks (for example to kick off a work item) which
> get executed once a fence gets signalled.
> 
> dma_fence has a number of callbacks. Only the two most basic ones
> (get_driver_name(), get_timeline_name() are abstracted since they are
> enough to enable the basic functionality.
> 
> Callbacks in Rust are registered by passing driver data which implements
> the Rust callback trait, whose function will be called by the C backend.
> 
> dma_fence's are always refcounted, so implement AlwaysRefcounted for
> them. Once a reference drops to zero, the C backend calls a release
> function, where we implement drop_in_place() to conveniently marry that
> C-cleanup mechanism with Rust's ownership concepts.
> 
> This patch provides basic functionality, but is still missing:
>   - An implementation of PinInit<T, Error> for all driver data.
>   - A clever implementation for working dma_fence_begin_signalling()
>     guards. See the corresponding TODO in the code.
>   - Additional useful helper functions such as dma_fence_is_signaled().
>     These _should_ be relatively trivial to implement, though.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> So. ¡Hola!
> 
> This is a highly WIP RFC. It's obviously at many places not yet
> conforming very well to Rust's standards.
> 
> Nevertheless, it has progressed enough that I want to request comments
> from the community.
> 
> There are a number of TODOs in the code to which I need input.
> 
> Notably, it seems (half-)illegal to use a shared static reference to an
> Atomic, which I currently use for the dma_fence unit test / docstring
> test. I'm willing to rework that if someone suggests how.
> (Still, shouldn't changing a global Atomic always be legal? It can race,
> of course. But that's kind of the point of an atomic)
> 
> What I want comments on the most is the design of the callbacks. I think
> it's a great opportunity to provide Rust drivers with rust-only
> callbacks, so that they don't have to bother about the C functions.
> 
> dma_fence wise, only the most basic callbacks currently get implemented.
> For Nova, AFAICS, we don't need much more than signalling fences and
> registering callbacks.
> 
> 
> Another, solvable, issue I'm having is designing the
> dma_fence_begin_signallin() abstractions. There are TODOs about that in
> the code. That should ideally be robust and not racy. So we might want
> some sort of synchronized (locked?) way for using that abstraction.
> 
> 
> Regarding the manually created spinlock of mine: I so far never need
> that spinlock anywhere in Rust and wasn't sure what's then the best way
> to pass a "raw" spinlock to C.
> 
> 
> So much from my side. Hope to hear from you.
> 
> (I've compiled and tested this with the unit test on the current -rc3)
> 
> Philipp
> ---
>  rust/bindings/bindings_helper.h |   1 +
>  rust/helpers/dma_fence.c        |  23 ++
>  rust/helpers/helpers.c          |   1 +
>  rust/helpers/spinlock.c         |   5 +
>  rust/kernel/sync.rs             |   2 +
>  rust/kernel/sync/dma_fence.rs   | 388 ++++++++++++++++++++++++++++++++

I missed this part, and I don't think kernel::sync is where dma_fence
should be, as kernel::sync is mostly for the basic synchronization
between threads/irqs. dma_fence is probably better to be grouped with
dma-buf and other dma related primitives. Maybe in kernel::dma? Like:

rust/kernel/dma.rs
rust/kernel/dma/dma_buf.rs
rust/kernel/dma/dma_fence.rs

Thoughts? Miguel, Greg, Danilo and Lyude, any idea or suggestion?

Regards,
Boqun

>  6 files changed, 420 insertions(+)
>  create mode 100644 rust/helpers/dma_fence.c
>  create mode 100644 rust/kernel/sync/dma_fence.rs
> 
[...]
