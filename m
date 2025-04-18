Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E345A93B55
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 18:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E215210E08C;
	Fri, 18 Apr 2025 16:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Srbd1CQw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BEAE10E08C
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 16:53:00 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7c5b8d13f73so211622285a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 09:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744995180; x=1745599980; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:feedback-id:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oNw7DSuc1b1b/tQR7WjbohbZojv201rKGbihKbhU4NY=;
 b=Srbd1CQwLJJRknKHoZzwEz529G1Pf1pmzUMyI93bAKGcZqxVVKKudceHQ4wDH9eJBu
 oHvnmc0J3L57/vvloz7u6o/jldQ3YJAyCkeEhLbili/akaUPuEYSwmOqQga0lqUQ4HA+
 tf456LUU37ZMjTqpfstNcww1y6Iv/TPF4FIc7IRpw55EFwh/hYFBiGvDOs0TuwjXip2w
 9SxHY/IdPNvOpCf0m5JhM6KhdWiMaH0JfD5COiNkbAcwFmbbreC+JqDcmuD5NE/ukVMh
 9g5I0Qm9vwxDoDYywtzfKgZMNxNm7F6k4Vu5JMMx7ILYuy3NhyQB85uVFPS1K/o2C57z
 3ELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744995180; x=1745599980;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oNw7DSuc1b1b/tQR7WjbohbZojv201rKGbihKbhU4NY=;
 b=Wi6dPsU71gWsk+AyfJp90wkC0yuJiUnAOaiMnQIExIixF7dWEzFqW0k22fn4Ufrfe7
 iZPPuGkLuGFR3TMKk/GBKYEEVh3eVZqGfCGrfxXRgxkm+5uWCBWieqYk2tzF8TscYmRc
 pMfd2A/yKi4RrIh5t+bydrVj0lpFrcNCoMvvTx97ouDwSclCOHhaEua6nx5+3b0hsNUM
 81IHFm3P9lUIQn4trMzXPvPe6XFIPjdwkl/4QMt6NTOX6gbZoagqqRx+/Ky4k7q/JOIe
 /Tx/NYgNuoDUB+VccDPDNss9mBGyCyK+MbeZ1A0/5yJ7/KHew7dnl5s8/QoZ1a9iVc6m
 /agg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgD8088Fcd6mFz41z1DIpZDVfhse9CTEJVOnGGT/a+uJJ4VF9ihBEKAo19F5hsw1rKbzrpRbJL5T8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxse8IGUNvFxBhqNG7x8MMhR7Q/f0CQPDQYym9iqYXKqHhSXcsf
 JLptXvT1gGnYazmh1kACsAAQrkbUSzdLRB4eLYkUZ4kpZVlIYPdT
X-Gm-Gg: ASbGncs86PkITVSOtIuwP3pUKNoopxR5q/c7W2JvgH/UXFbE5tklULyC4MKQFq3boJ8
 IHXGMqQnTZfpQjhfk9dprDYfXQytb30ft+lfIuiDlSVqMTHprbGWAIgxVUzcv1c9xNigRsGAWiN
 GTnY2uMMj8bh9Cs0V9Hzy7JElCuOhDG8+tBxtXpGUadd5CWvXwuqid8km1DF8MLBGQnRv30IrJy
 cEPcXVapygyz1Sc13brnbKg6G5HPSPraCceo2dak9kb40UO7O7T4SqI4su0nNTPseUQ4yVT2EjD
 Rs7n7JkC3tfItmoZv8xlFHQyjVrwyySgDkxqAvRajTEmgmPXjxc62iNzXN/fPRudR0Tk6SJAWN2
 fVpYbhT3MO2DsIu68l4nUFlr1j9pGC5U=
X-Google-Smtp-Source: AGHT+IEb3fceJw+dZWVtEoGjTerF7JyoRkbAClnyB6MVaGC4XY7lcq4tKGDfYC7mQk5UEncSaslEvw==
X-Received: by 2002:a05:620a:3902:b0:7c7:766d:9b00 with SMTP id
 af79cd13be357-7c928038e23mr627309985a.36.1744995179616; 
 Fri, 18 Apr 2025 09:52:59 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com
 (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c925ac2f27sm124748885a.54.2025.04.18.09.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 09:52:59 -0700 (PDT)
Message-ID: <6802836b.050a0220.8ee39.6127@mx.google.com>
X-Google-Original-Message-ID: <aAKDZ5kSMjxy9QnW@winterfell.>
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfauth.phl.internal (Postfix) with ESMTP id 186311200043;
 Fri, 18 Apr 2025 12:52:58 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-08.internal (MEProxy); Fri, 18 Apr 2025 12:52:58 -0400
X-ME-Sender: <xms:aYMCaGiBRtaR8iknc_xskLJOB8VTs9S1W9JyC1JU5TD15hae7tojww>
 <xme:aYMCaHClHlgvfEQkHBvmPT2XfNzxJ7wQjwiOGyoT5xa_fr2CiCyhLN2A9Sq8HQb6V
 A0NEQ-pZuPxMzSkXg>
X-ME-Received: <xmr:aYMCaOFoT6jyQnGwjLer67uY_MehMXt3Kbe1St3HwspL8N-0cmqDyy0S7euXPg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedvieekucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnegoufhushhpvggtthffohhmrghinhculdegledmnecujfgu
 rhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhf
 gvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgv
 rhhnpeekjefgudefhfeigffghfdtheeggfdtuddvkeejleffheeufeffteetvefgfeeuje
 enucffohhmrghinhepghhithhhuhgsrdhiohenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrsh
 honhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghn
 gheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepge
 ejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtrghmihhrugesghhmrghilhdr
 tghomhdprhgtphhtthhopehmrghsrghhihhrohihsehkvghrnhgvlhdrohhrghdprhgtph
 htthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurges
 khgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilh
 drtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthho
 pegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegsvg
 hnnhhordhlohhsshhinhesphhrohhtohhnrdhmvgdprhgtphhtthhopegrrdhhihhnuggs
 ohhrgheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:aYMCaPQ5WRQi4ezG9Qk-AFmdDJ__dW_PwpYgl2ZGnixoi8EAPax18A>
 <xmx:aoMCaDypQhXfoYJdrJ0ZnhgWHOI7v4f6mVFK3ihH5qz7ixHDOWvp3Q>
 <xmx:aoMCaN6SpH1uY9ZEyhvuonCLQxvKZcFOF3PzFrbkvJY_DtPrWwpkWQ>
 <xmx:aoMCaAyOS7aoe6ja6OTwTIyHlmPV5JvenWFRBpp2TkM5RdSUgjVhCA>
 <xmx:aoMCaPgPi-PlrwmNI9mBfcB5Aez3ipK3r0ILVf4aeJraWrdbLNrGh0KC>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Apr 2025 12:52:57 -0400 (EDT)
Date: Fri, 18 Apr 2025 09:52:55 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,	Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Frederic Weisbecker <frederic@kernel.org>,	Lyude Paul <lyude@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org,
 linux-block@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org
Subject: Re: [PATCH v10 4/6] rust: enable `clippy::as_underscore` lint
References: <20250418-ptr-as-ptr-v10-0-3d63d27907aa@gmail.com>
 <20250418-ptr-as-ptr-v10-4-3d63d27907aa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-ptr-as-ptr-v10-4-3d63d27907aa@gmail.com>
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

On Fri, Apr 18, 2025 at 11:37:20AM -0400, Tamir Duberstein wrote:
> In Rust 1.63.0, Clippy introduced the `as_underscore` lint [1]:
> 
> > The conversion might include lossy conversion or a dangerous cast that
> > might go undetected due to the type being inferred.
> >
> > The lint is allowed by default as using `_` is less wordy than always
> > specifying the type.
> 
> Always specifying the type is especially helpful in function call
> contexts where the inferred type may change at a distance. Specifying
> the type also allows Clippy to spot more cases of `useless_conversion`.
> 
> The primary downside is the need to specify the type in trivial getters.
> There are 4 such functions: 3 have become slightly less ergonomic, 1 was
> revealed to be a `useless_conversion`.
> 
> While this doesn't eliminate unchecked `as` conversions, it makes such
> conversions easier to scrutinize.  It also has the slight benefit of
> removing a degree of freedom on which to bikeshed. Thus apply the
> changes and enable the lint -- no functional change intended.
> 
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#as_underscore [1]
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
[...]
