Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD8FA93B43
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 18:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30F110E227;
	Fri, 18 Apr 2025 16:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SoarnBQB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BAC10E21D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 16:50:03 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-7c559b3eb0bso126475485a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 09:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744995002; x=1745599802; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:feedback-id:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wqsq8yPJja9MfMcD3tAjoUAZlgKfMc3FNlCDKzyz/mQ=;
 b=SoarnBQBzzHuKTBO46Fcq+Q6uPM5o43PMfBPtFGBN2aTB6elcsvDTkfu+y/CRR2Jya
 maIOWuiupe82aYUjmhdUXBdXAiIwkv7L2wOZU6z0UYWhJaBH3E0IszE1IRs8YLWwhutd
 zoL9oysUadbhOmP23KP3IG2CnS+QPuHBqelB/t6IRjrBkJGbm2hb03jaLXb52gPC2jh5
 VLa8PgFQdDerjXyrkc6pwcjVN2xNjAFWkywGQ6QBb5zCe4KQ6vw/OwTgbYXe/QlIAgIu
 XyRt6NO3K6EkwvYv4l24+V0A+rzgL/uHUJMG+dIS8tezWiSFbaHchk93HByAIxL7x+eq
 7U3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744995002; x=1745599802;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wqsq8yPJja9MfMcD3tAjoUAZlgKfMc3FNlCDKzyz/mQ=;
 b=j7Dp5U2EFpPqvi1bBpEDC6U0nZnCKjxrQyxCarb11eAvE/t0L7bZcGT0t+nxlZuDQH
 C7xLNi0TOOpgnT9Hkfywvb+tjXxWaBYb+zDWGs1OuWrXH2GiItA7Le2ycVSwp6/GrM5n
 RdZQ/Dekd8VaBHQ2poPpPE+WpMcLtZtdLoxSWM1ncidV9GTcK4lpcMqWKYMB1X0xCXUP
 CEyIPOYktBrpj347e11mli7oNqhSYOgLyLNWBENHB21uTsxJ2PxlaoPpEgGfn6gltJ89
 5S0SsQUDndemcPJscCwTnTksvF5q//oCIwGac/qvDUFxwMEShROXZC91rWj6BI+6ai40
 RuAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLJCtVnvE8f3/JrqTSVYl3bb4BXXJMfY4u9/Ji9WUScvcGcOG49Izwp/h/uuOxwFhxe0eP4qdYHhM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgV+npD9LvK8a8k4AUul0/c0Ps/iTpzooy3ZdK1LcK9l0xTlom
 BTQ2M3uLf/56HycIyF1jZiJGjWdBLw4f4Xf/DqFSR3dsj0amhsfH
X-Gm-Gg: ASbGnctVDOxpbnFfOKqnuK7p6Cx1gx8CR2uoD3r8E50UTKIyRR9PPD+CjM0S46c/xw1
 WlLfrStGH6dnFpjpS/3mv83yTZY1sdEGzcII4TD7numtvdkNWWvyGBlLMdUydV2GNOLIdCQHO1P
 Bij/hR7sFKF7vfIGA7VS464aWuNDiMJqyzOtd/BkKVuY56M/7h7VXYGcpf2V8NRgCxBY8I773QQ
 d7acHawrz6CYBO7yHF0xBr6NWwREIy9eZE+cW+q7Upu+KM1yXm2Tt8vpfCX5kDqRuAvmiZfrqwz
 3njX7NPaBXIzQwZWObaJzgDhDBFcULKy5Ex6+gxmsyC2gC+AIfFQZdlaGLvgt57v5LLBqtFs2yh
 Ay9b19iO/iuJYVbyj9w7HGOSHrmmsv1WyeSsontCHNw==
X-Google-Smtp-Source: AGHT+IGjqTF4f9smmVkb3wgWaIXUFVJ5bhyDcAmk4QFxgPcVtKxPUq6oNVaI94PfU1W5J6bp6Dym2A==
X-Received: by 2002:a05:620a:4112:b0:7c5:9b93:8f64 with SMTP id
 af79cd13be357-7c92800f4ccmr542294585a.37.1744995001792; 
 Fri, 18 Apr 2025 09:50:01 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com
 (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c925ac5018sm124259085a.52.2025.04.18.09.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 09:50:01 -0700 (PDT)
Message-ID: <680282b9.050a0220.3b746a.5cf9@mx.google.com>
X-Google-Original-Message-ID: <aAKCtQe8o73FA8db@winterfell.>
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfauth.phl.internal (Postfix) with ESMTP id 0E13C1200043;
 Fri, 18 Apr 2025 12:50:00 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Fri, 18 Apr 2025 12:50:00 -0400
X-ME-Sender: <xms:t4ICaPrgLkWEbH6GWhTGPaFLVQbWrWOHlfTfkbUonj_YAvDMD-KU1Q>
 <xme:t4ICaJqChA3dlMw71yhy8csoqqK5Y4iLQ0Z62MWQRL5LWGE5fFQMMMJHqxl4-Vp_7
 SP1XzVYBXxDcpDtJg>
X-ME-Received: <xmr:t4ICaMNPGrgxWdPMVCQLF2Mu2gBYuu6YOb47AYWzWqRWmLPK1aR1dgLJ-C0K0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedvieejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:t4ICaC6UhO1CZnKjR6Ik-hzIl3GtGbvNVc1I-IDE4qls3LYxm5xgUQ>
 <xmx:t4ICaO4vQPmAJgA9EQ9e4E1UXeaGRebhXTNU3grxc_kkgAjUxFqXfg>
 <xmx:t4ICaKjYst-8W_IjfguRa7uGthyObF8qia3gL-YVcCE_LCjZovMezA>
 <xmx:t4ICaA7BSsupuce3_SqR3OsmGrEA4G9TNiV4jY5WZn2qvcS_4fm5JQ>
 <xmx:uIICaNKT393DPp0R4GPwnosQuFP000EMpmjxlybcE0RtxwLUKggyEoYo>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Apr 2025 12:49:59 -0400 (EDT)
Date: Fri, 18 Apr 2025 09:49:57 -0700
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
Subject: Re: [PATCH v10 2/6] rust: enable `clippy::ptr_cast_constness` lint
References: <20250418-ptr-as-ptr-v10-0-3d63d27907aa@gmail.com>
 <20250418-ptr-as-ptr-v10-2-3d63d27907aa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-ptr-as-ptr-v10-2-3d63d27907aa@gmail.com>
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

On Fri, Apr 18, 2025 at 11:37:18AM -0400, Tamir Duberstein wrote:
> In Rust 1.72.0, Clippy introduced the `ptr_cast_constness` lint [1]:
> 
> > Though `as` casts between raw pointers are not terrible,
> > `pointer::cast_mut` and `pointer::cast_const` are safer because they
> > cannot accidentally cast the pointer to another type.
> 
> There are only 2 affected sites:
> - `*mut T as *const U as *mut U` becomes `(*mut T).cast()`
> - `&self as *const Self as *mut Self` becomes
>   `core::ptr::from_ref(self).cast_mut()`.
> 
> Apply these changes and enable the lint -- no functional change
> intended.
> 
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#ptr_cast_constness [1]
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> ---
>  Makefile                        | 1 +
>  rust/kernel/block/mq/request.rs | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 5d2931344490..7b85b2a8d371 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -481,6 +481,7 @@ export rust_common_flags := --edition=2021 \
>  			    -Aclippy::needless_lifetimes \
>  			    -Wclippy::no_mangle_with_rust_abi \
>  			    -Wclippy::ptr_as_ptr \
> +			    -Wclippy::ptr_cast_constness \
>  			    -Wclippy::undocumented_unsafe_blocks \
>  			    -Wclippy::unnecessary_safety_comment \
>  			    -Wclippy::unnecessary_safety_doc \
> diff --git a/rust/kernel/block/mq/request.rs b/rust/kernel/block/mq/request.rs
> index 4a5b7ec914ef..af5c9ac94f36 100644
> --- a/rust/kernel/block/mq/request.rs
> +++ b/rust/kernel/block/mq/request.rs
> @@ -69,7 +69,7 @@ pub(crate) unsafe fn aref_from_raw(ptr: *mut bindings::request) -> ARef<Self> {
>          // INVARIANT: By the safety requirements of this function, invariants are upheld.
>          // SAFETY: By the safety requirement of this function, we own a
>          // reference count that we can pass to `ARef`.
> -        unsafe { ARef::from_raw(NonNull::new_unchecked(ptr as *const Self as *mut Self)) }
> +        unsafe { ARef::from_raw(NonNull::new_unchecked(ptr.cast())) }
>      }
>  
>      /// Notify the block layer that a request is going to be processed now.
> @@ -155,7 +155,7 @@ pub(crate) fn wrapper_ref(&self) -> &RequestDataWrapper {
>          // the private data associated with this request is initialized and
>          // valid. The existence of `&self` guarantees that the private data is
>          // valid as a shared reference.
> -        unsafe { Self::wrapper_ptr(self as *const Self as *mut Self).as_ref() }
> +        unsafe { Self::wrapper_ptr(core::ptr::from_ref(self).cast_mut()).as_ref() }
>      }
>  }
>  
> 
> -- 
> 2.49.0
> 
