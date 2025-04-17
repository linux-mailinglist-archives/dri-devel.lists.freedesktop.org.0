Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12092A92C0D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 22:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50CAC10E3AF;
	Thu, 17 Apr 2025 20:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="miSTXJba";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8988810E3AF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 20:12:42 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-7c5f720c717so236618285a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 13:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744920761; x=1745525561; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:feedback-id:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zoi0ff5wiEnF5NrgHmtLQdqka427yqT8GxfdnoW/sbk=;
 b=miSTXJba6aSAIG37JTWmzGt+0go5QAMyIXRTuPV9yYY1gsxTAmyRRGVAVEQgWrzC+K
 udJViyzw+L7Fbqd8FOwKlUffBBI4+OaJCvoCglu2HtNETb9vSTav1PLfrp4buKaRjJEg
 LAdQ0sxrBld14AW8vuiO1CGpoElIYZPux0rFhXh3vesxGJQLcGcQrRGUX7pKnJqQYlIi
 gd3582YuBsWKSr4T/dAqjGAOBDMw0g9Lqf72Zf6885c28uPBSr9phbNi+Jdo/rs5nH+o
 OunOm+mmhsLdbdy198PjTXzzwgt0ii2an6uWYiPEM68VdZxd4Pa2U6JkTATxEZ+yRjJF
 +Uqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744920761; x=1745525561;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zoi0ff5wiEnF5NrgHmtLQdqka427yqT8GxfdnoW/sbk=;
 b=DN+/4pYtYEH840gyFHPDSHEDsODdkZxj3UQfUiATUVW8W0FJPbkuUybu0FPmru6Cvq
 awrCBNBAoNlWhx/SNjCyQbCs2kJkZlOI/9OcjIXDiaC84DKy7vqlZJInZ8xGdHspWbsw
 jxIgQSUnL0V3cf34veQyavDco6tkX44X0Ihi/nhadS3Fy6Q2OaT7umQWsQ+Q+hnIolJb
 cGa1DuNV0ZPPYTrIt1W4FWykq+qVuxoeVZhXIjyZuQ6KAMT/9GGshQMF7f4y0ovFWDt2
 k2AtZ9Hae5+kHuJwAsLNri80BU78MgbWdSx237JkmacG7ZGPwa87U18sSttbuyno+o29
 gq8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+ZXwCexf4coI2NqNUg25JV5krS6n6HdGwg5JmbeOvfaPVV88stj0/YjDAqQJ5j7wDmPHkUsV/tQw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxg2qrS6NQ3HL15uk5qSXPGgKBH1/UCaUNV3ABt8eFeFyFQNMoj
 Amm5qbgd/EQ/L/JDijlwZ2n6Q9Hhiidx29gkMNJLZalE8uqKXAEU
X-Gm-Gg: ASbGncvEZ8aFmPGq2WEz6EkYtcNB9ZWJ2SznoT1GniH1pKurdMQVeLA5/gA6rIbbhoS
 6QOF1UpF7Qws7ENMMxnb7mbAVrfxfZoSIeFJFA7X7A1JNTT7t9YNshqw/XijMkSLS5y49dtj+Gp
 lWr/j+8eo8Y39E8aikJUrB+afDILnjjXxJyb6MHtHfmoRuWEm76NXrr/HiDylDvkassZV9Ol6jA
 foP46AcNOYskDX+k7DDyvdU2XTvS5ga+h3MBYPeyvuVdLtdcXGN78wCGbMD4FmPR9fAfJ2BVeB9
 P4bAhHyMYMwKK2lHmCZs4D0bW0PaXsKopEaydV5W1EU4Kq5zTpQvy6RQIhhGLTcvcdHAdm37Tpd
 lk169PL+LePwx71J0xETsg71hZ/XumT3QKWLQQ76PNA==
X-Google-Smtp-Source: AGHT+IGqYa4lJedN6y7Ve4i8uviWQPhLL4HlO4vwMswf+TVFKp5dheFZBpp1BDdZyASOOil8szBySw==
X-Received: by 2002:a05:620a:4316:b0:7c7:a59a:7d28 with SMTP id
 af79cd13be357-7c9282a2120mr24247985a.14.1744920761318; 
 Thu, 17 Apr 2025 13:12:41 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com
 (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c925a90d0csm28737285a.41.2025.04.17.13.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 13:12:40 -0700 (PDT)
Message-ID: <680160b8.050a0220.223d09.180f@mx.google.com>
X-Google-Original-Message-ID: <aAFgtdIF0u-rLNfH@winterfell.>
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfauth.phl.internal (Postfix) with ESMTP id 8AC19120006A;
 Thu, 17 Apr 2025 16:12:39 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Thu, 17 Apr 2025 16:12:39 -0400
X-ME-Sender: <xms:t2ABaEluN5DT2UN3ewEMRhb1e4ZFilXnxFCWA7iJ8UpRCPkkn6Y1RA>
 <xme:t2ABaD2n8XURyzhrY3rIUR7ig_him5JCzTcFyOeEci1ORrsiOA-WHOhmrzMDqxRc6
 tC9qwR9bdW60FBjUw>
X-ME-Received: <xmr:t2ABaCpbwV02LCykqDAfsudF-KwQLdGqtzjr7uf4AQwxBv-SobXhHjRBGqjkXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedtudekucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
 vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
 hlrdgtohhmqeenucggtffrrghtthgvrhhnpefftdeihfeigedtvdeuueffieetvedtgeej
 uefhhffgudfgfeeggfeftdeigeehvdenucffohhmrghinhepghhithhhuhgsrdgtohhmne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhu
 nhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqdduje
 ejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdr
 nhgrmhgvpdhnsggprhgtphhtthhopeegjedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
 htohepthgrmhhirhgusehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrshgrhhhirhho
 hieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdroh
 hrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegr
 lhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrg
 hrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgr
 ihhlrdgtohhmpdhrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmh
 gvpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:t2ABaAn51l6h8kcSU9WHdQj5kJvan993M2LqrkdAjhKXJHuO4a1KtQ>
 <xmx:t2ABaC3j1SO3jyP-mSxmb3cfyHYwW3fYXf8DfvVvnlncH2Sh-LEtMg>
 <xmx:t2ABaHvEjmDAFlKCngtXS7SBllGdUriEzbfRdTcGDxhlYd9Shva_iQ>
 <xmx:t2ABaOW7UZ99I_VYCGFNTtdAlRH4ZGv_7Y9Say0vGmDNZbSINMa53A>
 <xmx:t2ABaF2LaRqardld_ypulw1i-c2D8p68PU-VfbVkCLJsGfqirUaCmpRD>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Apr 2025 16:12:38 -0400 (EDT)
Date: Thu, 17 Apr 2025 13:12:37 -0700
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
Subject: Re: [PATCH v9 4/6] rust: enable `clippy::as_underscore` lint
References: <20250416-ptr-as-ptr-v9-0-18ec29b1b1f3@gmail.com>
 <20250416-ptr-as-ptr-v9-4-18ec29b1b1f3@gmail.com>
 <68014084.0c0a0220.394e75.122c@mx.google.com>
 <CAJ-ks9muaNU9v2LZ5=cmfXV6R5AO+joNOoPP=+hs-GJN=APfKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ-ks9muaNU9v2LZ5=cmfXV6R5AO+joNOoPP=+hs-GJN=APfKQ@mail.gmail.com>
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

On Thu, Apr 17, 2025 at 03:26:14PM -0400, Tamir Duberstein wrote:
[...]
> >
> > >          Ok(())
> > >      }
> > > diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
> > > index e5859217a579..4063f09d76d9 100644
> > > --- a/rust/kernel/device_id.rs
> > > +++ b/rust/kernel/device_id.rs
> > > @@ -82,7 +82,7 @@ impl<T: RawDeviceId, U, const N: usize> IdArray<T, U, N> {
> > >              unsafe {
> > >                  raw_ids[i]
> > >                      .as_mut_ptr()
> > > -                    .byte_offset(T::DRIVER_DATA_OFFSET as _)
> > > +                    .byte_add(T::DRIVER_DATA_OFFSET)
> > >                      .cast::<usize>()
> > >                      .write(i);
> > >              }
> > > diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> > > index f7e8f5f53622..70d12014e476 100644
> > > --- a/rust/kernel/devres.rs
> > > +++ b/rust/kernel/devres.rs
> > > @@ -45,7 +45,7 @@ struct DevresInner<T> {
> > >  /// # Example
> > >  ///
> > >  /// ```no_run
> > > -/// # use kernel::{bindings, c_str, device::Device, devres::Devres, io::{Io, IoRaw}};
> > > +/// # use kernel::{bindings, c_str, device::Device, devres::Devres, ffi::c_void, io::{Io, IoRaw}};
> > >  /// # use core::ops::Deref;
> > >  ///
> > >  /// // See also [`pci::Bar`] for a real example.
> > > @@ -59,19 +59,19 @@ struct DevresInner<T> {
> > >  ///     unsafe fn new(paddr: usize) -> Result<Self>{
> > >  ///         // SAFETY: By the safety requirements of this function [`paddr`, `paddr` + `SIZE`) is
> > >  ///         // valid for `ioremap`.
> > > -///         let addr = unsafe { bindings::ioremap(paddr as _, SIZE as _) };
> > > +///         let addr = unsafe { bindings::ioremap(paddr as bindings::phys_addr_t, SIZE) };
> >
> >
> > ///         let addr = unsafe { bindings::ioremap(bindings::phys_addr_t::from(paddr), SIZE) };
> >
> > better? Or even with .into()
> >
> > ///         let addr = unsafe { bindings::ioremap(paddr.into(), SIZE) };
> 
> This doesn't compile because `paddr` is usize, and
> `bindings::phys_addr_t` is u64 (on my machine, which is aarch64).
> 

Ok, looks like Rust yet doesn't provide From/Into between usize and u64
even if the pointer size is fixed. Latest discussion can be found at:

	https://github.com/rust-lang/rust/issues/41619#issuecomment-2056902943

Lemme see if we can get an issue tracking this. Thanks for taking a
look.

> > >  ///         if addr.is_null() {
> > >  ///             return Err(ENOMEM);
> > >  ///         }
> > >  ///
> > > -///         Ok(IoMem(IoRaw::new(addr as _, SIZE)?))
> > > +///         Ok(IoMem(IoRaw::new(addr as usize, SIZE)?))
> > >  ///     }
> > >  /// }
> > >  ///
> > >  /// impl<const SIZE: usize> Drop for IoMem<SIZE> {
> > >  ///     fn drop(&mut self) {
> > >  ///         // SAFETY: `self.0.addr()` is guaranteed to be properly mapped by `Self::new`.
> > > -///         unsafe { bindings::iounmap(self.0.addr() as _); };
> > > +///         unsafe { bindings::iounmap(self.0.addr() as *mut c_void); };
> > >  ///     }
> > >  /// }
> > >  ///
> > [...]
> > > diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> > > index 43ecf3c2e860..851a6339aa90 100644
> > > --- a/rust/kernel/dma.rs
> > > +++ b/rust/kernel/dma.rs
> > > @@ -38,7 +38,7 @@
> > >  impl Attrs {
> > >      /// Get the raw representation of this attribute.
> > >      pub(crate) fn as_raw(self) -> crate::ffi::c_ulong {
> > > -        self.0 as _
> > > +        self.0 as crate::ffi::c_ulong
> >
> >         crate::ffi::c_ulong::from(self.0)
> >
> > maybe, a C unsigned long should always be able to hold the whole `Attr`
> > and a lossly casting is what this function does.
> 
> This also doesn't compile: "the trait `core::convert::From<u32>` is
> not implemented for `usize`". Upstream has ambitions of running on
> 16-bit, I guess :)
> 

They do but they also have the target_pointer_width cfg, so they can
totally provide these functions. It's just they want to find a better
way (like the link I post above).

Regards,
Boqun
