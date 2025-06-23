Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FB0AE4B9C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 19:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53C810E113;
	Mon, 23 Jun 2025 17:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T564KvLK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925EA10E113
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 17:11:16 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-4a43972dcd7so55378781cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 10:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750698675; x=1751303475; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jjiN2duDIoatADckXDg71LfnYdFHxDnQWcx0OYPZFTs=;
 b=T564KvLK9PVwY++LRus7Rv6or023LpWLqN0QJDNrfNkmlA/xjahimM8+Nav3sSd4Uz
 i5zcTvzv6IJ8qc4jCvqM6j7oybf2yzKt9TO9WOpcN+w+219ZmI0LjhAUhFSmRKxBBuGM
 gPKqaBHE8HsLx317FaKizkocfBR/XOmJ88UZTOy6Cb3W84eEbiTGOsH18WrPlR/MtO/W
 1B20hBm3h9Ts50/Hm8O+OE8OpGBdBR/G3WOg85K8uaLyYGegvP+rDrzqDepieAuMQPx9
 iLRwDVSoi5x/hPhW2SGMtf19dmN8ydYy4pxTAXf10Jsnyr6ML3MWR3KE7/399QSQRmaR
 g7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750698675; x=1751303475;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jjiN2duDIoatADckXDg71LfnYdFHxDnQWcx0OYPZFTs=;
 b=plrsEKn9xU0BzKqCu8Q1a3x5yMP7bhHupErnrKxJOIH4q6WN9b5bmrhZMIj5BhYagy
 iKcESkWvcR2p8dJTyX+4oqZh6qlbH0e+6pAj5vff+MtFQawI75y5XfU43UfGtFRIret7
 d3GzYaMLqgH5Sz+1/zseAAhJEXmsfXJlNSydBwUaoV+EfXgR6n4bx5woYT/BLLuLm4rJ
 qJ1fQHQtjrs9J//eLSX7246o1avJ6l+YaNjj9ppp4AL6tDR1JiKYDUDH8HP8kaSfTXCa
 6i17bVyOQDQYfrRi7jq6bYTLDZmyHqC2JH3D04PhUXVerbyzJbhU0fe/QFu86+A6EfMD
 Gklg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYPL1+T6ArNXbwqDsD7Rpr0h46oNAwCOVvrVuwrojsvyJfmu2JHDObgBjtvbRxrdYSQgGUqLESOUo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9E2lhj7Xwaoz1rWU8XKihzaz5oWFfxuyQDBvRXx3bcQE384g/
 miUrVG3om6qNkFnVihZ6nmQ9wUA+Y4MRp2VYH4pnAdDcWKh4EVLTlFdc
X-Gm-Gg: ASbGncusbMRMc8M9L2BeQWWKLkZdZT1g9xSx9RhuZvIGcq4F68+CI7b1dZIcCdbdZFn
 B06kZJ5z6B0K4SWa+T59y2O2IsR0h3CH7Jyh/ea3AwDGqZnlWP/y37bvSWyjTxkpG5UKOPU4TER
 HVH+Ah2tMw3yZdnm00Z2gAwrHIUTc7rrtFgkqMXAI0AlxHvJdPyad3lA7nO1GZ/G8zHKLeYkBYK
 MtT48tZKyuREDriwRQCCRjhHJAhBMhcRct+cHbopQLERcSydzW8iIjQZZIwcf392vL6nRvafc9S
 4ZmpagpkpJsoitDW/P5VHPC2WrAmuIkZ3///f4aczmM5AvQ76IO6f/F5H5h1D+88co8FSd6NtNb
 c+B8OQohD2i3M9v0OGuSDnSybSZ6qWBcHS7vEr6PoEahCa6pbVHMo
X-Google-Smtp-Source: AGHT+IF58ry0uAJhfksmJjPTy1j/2Vf/3WRbEa7P02vjo4MlhXaKwJYDBJeuv+kZYxPXTxkw/qD76g==
X-Received: by 2002:a05:622a:400d:b0:4a5:aa42:49f3 with SMTP id
 d75a77b69052e-4a77a1c9d57mr264210731cf.20.1750698675299; 
 Mon, 23 Jun 2025 10:11:15 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com
 (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a779e79f0dsm40380181cf.61.2025.06.23.10.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 10:11:14 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfauth.phl.internal (Postfix) with ESMTP id 1A7F2120006A;
 Mon, 23 Jun 2025 13:11:14 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Mon, 23 Jun 2025 13:11:14 -0400
X-ME-Sender: <xms:sYpZaF2am0H8M9JhfLMA36ZLn_RyRM-OEviVN7CtPEzRX8S62gylqg>
 <xme:sYpZaMFjovciA7_an6AZCk8YJZk8_OglSiaFk4gb7wFk9XYjMilQshpe8fkj98Yw0
 fiRIor0dzbtaV9aPQ>
X-ME-Received: <xmr:sYpZaF43EKFZMJVoKUVHlCInLB1C0dhg15DE9PUZF8QpS1ebtYTQ0q2ZQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujeehlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
 vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
 hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
 hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
 jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
 drnhgrmhgvpdhnsggprhgtphhtthhopedvfedpmhhouggvpehsmhhtphhouhhtpdhrtghp
 thhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifohhrkhesoh
 hnuhhrohiikhgrnhdruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhg
 vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugi
 esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgv
 lhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpd
 hrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoheprgdrhhhi
 nhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlse
 hgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:sopZaC1zMfm1SuNsNSQ18amI0vXKCmGyVaGLPLOr6ZgLffljzjIXpA>
 <xmx:sopZaIE8SPfQ9fA-ND901zBbEx2YXlbLDuWZolLLiAIwiqc0cwpnfw>
 <xmx:sopZaD9F8FUxbrrz0UH1wIMJEIHKt4aLNy3VKeZLa3KvY_GQkuQXsQ>
 <xmx:sopZaFmnNWC8touEIPVFFboI6xhkDlckHF4Q7I7Nclat3lJGCx4GGg>
 <xmx:sopZaMED76cxqgp1cqMCijH7GFVbmWKEnc1_JGZDLDziiIx2OR_QlmT8>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jun 2025 13:11:13 -0400 (EDT)
Date: Mon, 23 Jun 2025 10:11:12 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, peterz@infradead.org, mingo@redhat.com,
 will@kernel.org, longman@redhat.com, felipe_life@live.com,
 daniel@sedlak.dev, bjorn3_gh@protonmail.com, simona@ffwll.ch,
 airlied@gmail.com, dri-devel@lists.freedesktop.org, lyude@redhat.com
Subject: Re: [PATCH v5 2/3] implement ww_mutex abstraction for the Rust tree
Message-ID: <aFmKsE_nJkaVMv0T@tardis.local>
References: <20250621184454.8354-1-work@onurozkan.dev>
 <20250621184454.8354-3-work@onurozkan.dev>
 <DASY7BECFRCT.332X5ZHZMV2W@kernel.org> <aFlQ7K_mYYbrG8Cl@Mac.home>
 <DATYHYJVPL3L.3NLMH7PPHYU9@kernel.org> <aFlpFQ4ivKw81d-y@Mac.home>
 <DAU0ELV91E2Q.35FZOII18W44J@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAU0ELV91E2Q.35FZOII18W44J@kernel.org>
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

On Mon, Jun 23, 2025 at 05:14:37PM +0200, Benno Lossin wrote:
> On Mon Jun 23, 2025 at 4:47 PM CEST, Boqun Feng wrote:
> > On Mon, Jun 23, 2025 at 03:44:58PM +0200, Benno Lossin wrote:
> >> I didn't have a concrete API in mind, but after having read the
> >> abstractions more, would this make sense?
> >> 
> >>     let ctx: &WwAcquireCtx = ...;
> >>     let m1: &WwMutex<T> = ...;
> >>     let m2: &WwMutex<Foo> = ...;
> >> 
> >>     let (t, foo, foo2) = ctx
> >>         .begin()
> >>         .lock(m1)
> >>         .lock(m2)
> >>         .lock_with(|(t, foo)| &*foo.other)
> >>         .finish();
> >> 
> >
> > Cute!
> >
> > However, each `.lock()` will need to be polymorphic over a tuple of
> > locks that are already held, right? Otherwise I don't see how
> > `.lock_with()` knows it's already held two locks. That sounds like a
> > challenge for implementation.
> 
> I think it's doable if we have 
> 
>     impl WwActiveCtx {

I think you mean *WwAcquireCtx*

>         fn begin(&self) -> WwActiveCtx<'_, ()>;
>     }
> 
>     struct WwActiveCtx<'a, Locks> {
>         locks: Locks,

This probably need to to be Result<Locks>, because we may detect
-DEADLOCK in the middle.

    let (a, c, d) = ctx.begin()
        .lock(a)
        .lock(b) // <- `b` may be locked by someone else. So we should
                 // drop `a` and switch `locks` to an `Err(_)`.
        .lock(c) // <- this should be a no-op if `locks` is an `Err(_)`.
        .finish();

>         _ctx: PhantomData<&'a WwAcquireCtx>,

We can still take a reference to WwAcquireCtx here I think.

>     }
> 
>     impl<'a, Locks> WwActiveCtx<'a, Locks>
>     where
>         Locks: Tuple
>     {
>         fn lock<'b, T>(
>             self,
>             lock: &'b WwMutex<T>,
>         ) -> WwActiveCtx<'a, Locks::Append<WwMutexGuard<'b, T>>>;
> 
>         fn lock_with<'b, T>(
>             self,
>             get_lock: impl FnOnce(&Locks) -> &'b WwMutex<T>,
>         ) -> WwActiveCtx<'a, Locks::Append<WwMutexGuard<'b, T>>>;
>         // I'm not 100% sure that the lifetimes will work out...

I think we can make the following work?

    impl<'a, Locks> WwActiveCtx<'a, Locks>
    where
        Locks: Tuple
    {
        fn lock_with<T>(
	    self,
	    get_lock: impl FnOnce(&Locks) -> &WmMutex<T>,
	) -> WwActiveCtx<'a, Locks::Append<WmMutexGuard<'a, T>>
    }

because with a `WwActiveCtx<'a, Locks>`, we can get a `&'a Locks`, which
will give us a `&'a WmMutex<T>`, and should be able to give us a
`WmMutexGuard<'a, T>`.

> 
>         fn finish(self) -> Locks;
>     }
> 
>     trait Tuple {
>         type Append<T>;
> 
>         fn append<T>(self, value: T) -> Self::Append<T>;
>     }
> 

`Tuple` is good enough for its own, if you could remember, we have some
ideas about using things like this to consolidate multiple `RcuOld` so
that we can do one `synchronize_rcu()` for `RcuOld`s.

>     impl Tuple for () {
>         type Append<T> = (T,);
> 
>         fn append<T>(self, value: T) -> Self::Append<T> {
>             (value,)
>         }
>     }
>     
>     impl<T1> Tuple for (T1,) {
>         type Append<T> = (T1, T);
> 
>         fn append<T>(self, value: T) -> Self::Append<T> {
>             (self.0, value,)
>         }
>     }
> 
>     impl<T1, T2> Tuple for (T1, T2) {
>         type Append<T> = (T1, T2, T);
> 
>         fn append<T>(self, value: T) -> Self::Append<T> {
>             (self.0, self.1, value,)
>         }
>     }
> 
>     /* these can easily be generated by a macro */
> 
> > We also need to take into consideration that the user want to drop any
> > lock in the sequence? E.g. the user acquires a, b and c, and then drop
> > b, and then acquires d. Which I think is possible for ww_mutex.
> 
> Hmm what about adding this to the above idea?:
> 
>     impl<'a, Locks> WwActiveCtx<'a, Locks>
>     where
>         Locks: Tuple
>     {
>         fn custom<L2>(self, action: impl FnOnce(Locks) -> L2) -> WwActiveCtx<'a, L2>;
>     }
> 
> Then you can do:
> 
>     let (a, c, d) = ctx.begin()
>         .lock(a)
>         .lock(b)
>         .lock(c)
>         .custom(|(a, _, c)| (a, c))
>         .lock(d)
>         .finish();
> 

Seems reasonable. But we still need to present this to the end user to
see how much they like it. For ww_mutex I think the major user is DRM,
so add them into Cc list.

Regards,
Boqun

> >>     let _: &mut T = t;
> >>     let _: &mut Foo = foo;
> >>     let _: &mut Foo = foo2;
> 
> Ah these will actually be `WwMutexGuard<'_, ...>`, but that should be
> expected.
> 
> ---
> Cheers,
> Benno
