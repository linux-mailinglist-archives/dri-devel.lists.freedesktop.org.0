Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A41FAA922FA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 18:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9085F10EB64;
	Thu, 17 Apr 2025 16:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FiNY4382";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5F310EB64
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 16:48:48 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7c08fc20194so190262385a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 09:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744908527; x=1745513327; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:feedback-id:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z0pUawgfEW0CPBUqb9LoWc3jadoXhqOKMLKHi6zM6mQ=;
 b=FiNY4382d4TapzyicZVxIae7HfAlVwHEAoERBw3BY0ZS2NmhzpaWQpMtJPOV5FOZFY
 GmzZfJuZw6GxA4XmU29D3gVs5L56jxfXv8xpINJ4wYg81Dax5zUuoXDAwSQm9j7R9GCu
 Tw8swEpsP5Hy93bPXZZuunaRa+dGMtLyzAKiA9A11VjZyDsAQaHwxmVj05fotjU7MGMr
 tnfp4U5qIglCGHZpo6AkPvDDzM4Zez5X8aYPtO0NYmpVl8mGvwl26FhBEnvuMkDTlSKK
 gyl6KQClxy9R4p+osA3ZOA5YxtNs6apoTh9W7xWEqOZOFjZXFNnFquMpvk4bYmCQWySt
 bB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744908527; x=1745513327;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z0pUawgfEW0CPBUqb9LoWc3jadoXhqOKMLKHi6zM6mQ=;
 b=bD/hbq71X1J40RQ/4Pi5yTxmozf1EgkWdLfuolNNuW6eV4gBsj9a2cPUQiGYVgY8sz
 +OKBNJWaNMfc5WBMTq6nBCbe54Sqi1LmhOGyjvu+V6+3EUbpW2xsVQ4RQwKBgeKC4DhU
 SP9sfmjs3OozKUG7/kE4vXDt9C+QoLx8CjKQfhHrve7mL5L1d5+Xb0CoLqqUxWaqSU32
 Wx84gdLsC5AQrKLye4I/uGw8vnW8whxqyjChh4XXg1gqXZD7gjs0M7zo9ZQQP5/m81uT
 01yLCRpnMHQCj07+qufF01zqi05SjZskDxJN3Fndxt7/dcchb/tZxTl9d03MGmzeFKEc
 dvyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsxnGwkZySJ0XIBtiJNwgsoP14B/7ZsTqgkbWsztPeDKBNLkxeWoXi2kOVidJwn0o0Nj2wLlf44NM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUHdC5P+ih6huSfjDsGpDgyqxCxpjR33uaDfehmWoGO0+5Yq35
 mf9mlqgPMFpE9bhgFCeh0KxyhUk2mAdCHh/LRj7UOaEUAxepoWNK
X-Gm-Gg: ASbGncvFeuvZWmreHUu0xobC74r/9gF3ZqZzyHIpXRYdjsfi9QDXKamb/VdsJ8Bnfok
 uZa38EyszWVYBR0jQEWeyqEnhINLRNqXo4+ebApi4Rb6Gk6FXErczgH0/+dtUwK7qZNOsjv4U8o
 vXys44eluVC5PuPjwCv9iIUeiKy53d5vUtm2i/vwdOWGNnHT9F3XN4spBUgln+p34tOImD5l0/2
 VeEEMYBzwkg2xZqZWGKjXx8DSKm+oAiyEGXLITmVrRkwVF4xcvBNXbLcaI4HB1hcYGTXyEt89Ia
 hhSBgC29Y8LtIRke9eaHbpSDszBwhgBjaCNguhqo9GZ536ddTzcRc6/2Is13YvXmqfzwrq/+siD
 ZVhTasY2zXRY48qpUSGl39JHD+u6naQk=
X-Google-Smtp-Source: AGHT+IFqkF5iMwBpXMvWqqewwowNgnxq9EadSO8ifpl/XPQFt56qdQuYpaKX5BT0fokVGfFcYHT2Ow==
X-Received: by 2002:a05:620a:2989:b0:7c5:9fd3:a90b with SMTP id
 af79cd13be357-7c91908401fmr1075906385a.47.1744908527121; 
 Thu, 17 Apr 2025 09:48:47 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com
 (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c925b6a3c9sm9483185a.100.2025.04.17.09.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 09:48:46 -0700 (PDT)
Message-ID: <680130ee.050a0220.393a1.0995@mx.google.com>
X-Google-Original-Message-ID: <aAEw60BILp8RZGu3@winterfell.>
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfauth.phl.internal (Postfix) with ESMTP id A9F6C120007A;
 Thu, 17 Apr 2025 12:48:45 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-09.internal (MEProxy); Thu, 17 Apr 2025 12:48:45 -0400
X-ME-Sender: <xms:7TABaAH-jdZcQcOxerlipQT_koonBUeu8UgPUZegwdwik1L638QDmQ>
 <xme:7TABaJUojDtbB3jfQ4o-3Q2R_fDNYgrhWuJHAewiRPpTngh362wooPsDcL94zhnT7
 mozpsPXjlyPqLrZIQ>
X-ME-Received: <xmr:7TABaKJ93915T2vT-PypctMLcVw9jjLSz7g1t6AKiBq4H_8bF5IBtddAOIo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeljeelucetufdoteggodetrf
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
X-ME-Proxy: <xmx:7TABaCF2Q9VAnNaVCci07g_j4WAk86p_F36oOLXLlogh7DgFK1zJSA>
 <xmx:7TABaGW2iiqKclwpLocPWmZdhgRRLKUSFuS0244ZHM2SViDTyRH2EA>
 <xmx:7TABaFMD8fiLH8R9nEaZAjdOOYTIpS6-51h5fwH2eAY6amkB0mci0Q>
 <xmx:7TABaN2NvASHYA-UXVAg1C8la2gbX43EpgPYcnyrOHneqkvOP2yYcQ>
 <xmx:7TABaPXBKeLtxfoZkALq6Jv5FqyuGPj49rlRazoccB9gDtT4jGK3ABXa>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Apr 2025 12:48:44 -0400 (EDT)
Date: Thu, 17 Apr 2025 09:48:43 -0700
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
Subject: Re: [PATCH v9 1/6] rust: enable `clippy::ptr_as_ptr` lint
References: <20250416-ptr-as-ptr-v9-0-18ec29b1b1f3@gmail.com>
 <20250416-ptr-as-ptr-v9-1-18ec29b1b1f3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-ptr-as-ptr-v9-1-18ec29b1b1f3@gmail.com>
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

On Wed, Apr 16, 2025 at 01:36:05PM -0400, Tamir Duberstein wrote:
> In Rust 1.51.0, Clippy introduced the `ptr_as_ptr` lint [1]:
> 
> > Though `as` casts between raw pointers are not terrible,
> > `pointer::cast` is safer because it cannot accidentally change the
> > pointer's mutability, nor cast the pointer to other types like `usize`.
> 
> There are a few classes of changes required:
> - Modules generated by bindgen are marked
>   `#[allow(clippy::ptr_as_ptr)]`.
> - Inferred casts (` as _`) are replaced with `.cast()`.
> - Ascribed casts (` as *... T`) are replaced with `.cast::<T>()`.
> - Multistep casts from references (` as *const _ as *const T`) are
>   replaced with `core::ptr::from_ref(&x).cast()` with or without `::<T>`
>   according to the previous rules. The `core::ptr::from_ref` call is
>   required because `(x as *const _).cast::<T>()` results in inference
>   failure.
> - Native literal C strings are replaced with `c_str!().as_char_ptr()`.
> - `*mut *mut T as _` is replaced with `let *mut *const T = (*mut *mut
>   T)`.cast();` since pointer to pointer can be confusing.
> 
> Apply these changes and enable the lint -- no functional change
> intended.
> 
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#ptr_as_ptr [1]
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

A few nits below though...

> ---
>  Makefile                               |  1 +
>  rust/bindings/lib.rs                   |  1 +
>  rust/kernel/alloc/allocator_test.rs    |  2 +-
>  rust/kernel/alloc/kvec.rs              |  4 ++--
>  rust/kernel/device.rs                  |  4 ++--
>  rust/kernel/devres.rs                  |  2 +-
>  rust/kernel/dma.rs                     |  4 ++--
>  rust/kernel/error.rs                   |  2 +-
>  rust/kernel/firmware.rs                |  3 ++-
>  rust/kernel/fs/file.rs                 |  2 +-
>  rust/kernel/kunit.rs                   | 11 +++++++----
>  rust/kernel/list/impl_list_item_mod.rs |  2 +-
>  rust/kernel/pci.rs                     |  2 +-
>  rust/kernel/platform.rs                |  4 +++-
>  rust/kernel/print.rs                   |  6 +++---
>  rust/kernel/seq_file.rs                |  2 +-
>  rust/kernel/str.rs                     |  2 +-
>  rust/kernel/sync/poll.rs               |  2 +-
>  rust/kernel/time/hrtimer/pin.rs        |  2 +-
>  rust/kernel/time/hrtimer/pin_mut.rs    |  2 +-
>  rust/kernel/workqueue.rs               | 10 +++++-----
>  rust/uapi/lib.rs                       |  1 +
>  22 files changed, 40 insertions(+), 31 deletions(-)
> 
[...]
> diff --git a/rust/kernel/list/impl_list_item_mod.rs b/rust/kernel/list/impl_list_item_mod.rs
> index a0438537cee1..1f9498c1458f 100644
> --- a/rust/kernel/list/impl_list_item_mod.rs
> +++ b/rust/kernel/list/impl_list_item_mod.rs
> @@ -34,7 +34,7 @@ pub unsafe trait HasListLinks<const ID: u64 = 0> {
>      unsafe fn raw_get_list_links(ptr: *mut Self) -> *mut ListLinks<ID> {
>          // SAFETY: The caller promises that the pointer is valid. The implementer promises that the
>          // `OFFSET` constant is correct.
> -        unsafe { (ptr as *mut u8).add(Self::OFFSET) as *mut ListLinks<ID> }
> +        unsafe { ptr.cast::<u8>().add(Self::OFFSET).cast() }

I think we better do:

	unsafe { ptr.byte_add(Self::OFFSET).cast() }

here, similar for a few instances below. Maybe in a follow-up patch?
byte_add() is way more clear about what is done here.

Regards,
Boqun

>      }
>  }
>  
[...]
> @@ -457,7 +457,7 @@ fn get_work_offset(&self) -> usize {
>      #[inline]
>      unsafe fn raw_get_work(ptr: *mut Self) -> *mut Work<T, ID> {
>          // SAFETY: The caller promises that the pointer is valid.
> -        unsafe { (ptr as *mut u8).add(Self::OFFSET) as *mut Work<T, ID> }
> +        unsafe { ptr.cast::<u8>().add(Self::OFFSET).cast::<Work<T, ID>>() }
>      }
>  
>      /// Returns a pointer to the struct containing the [`Work<T, ID>`] field.
> @@ -472,7 +472,7 @@ unsafe fn work_container_of(ptr: *mut Work<T, ID>) -> *mut Self
>      {
>          // SAFETY: The caller promises that the pointer points at a field of the right type in the
>          // right kind of struct.
> -        unsafe { (ptr as *mut u8).sub(Self::OFFSET) as *mut Self }
> +        unsafe { ptr.cast::<u8>().sub(Self::OFFSET).cast::<Self>() }
>      }
>  }
>  
[...]
