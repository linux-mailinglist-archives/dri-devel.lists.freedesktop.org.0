Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F81A9238A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 19:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111F810E2F1;
	Thu, 17 Apr 2025 17:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dFs9w35O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237DE89C0D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 17:13:00 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7c5c815f8efso86466685a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 10:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744909979; x=1745514779; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:feedback-id:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MalP9T0FOVBPSQ7hdLh//NHSp0ARkV8JPukt1uR1PUg=;
 b=dFs9w35ONztQv+U9WBMEaeb3z48WQm79uR9YiVnsmZi+B0X6lw9r+HhRaGHwOL8gTQ
 QEco+M7QER5bmfLh1YhEJCXu+a7KjAhLOtVeoP3iyXaDlanHcg7argeShwxiUHqAtmIr
 88qVNhlyGDdAH5Bjqo8ERw6UYhivp0Ef7ldejQQTczBJ5Fm7zt3KInDxsm2O4qsYaZQ2
 MtsUm/MNbjYk703ADf0wSFQEeRKTExw363nERgm/BmVNAA9nV0B5DwjhZm6BDc3ejOSd
 7NZf9v7gSN08AGM9+DSB93AEz/lyPsX/f9Q+AAGXRT+LhT3+bVcOdKLVx0WS47OETmHB
 uhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744909979; x=1745514779;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MalP9T0FOVBPSQ7hdLh//NHSp0ARkV8JPukt1uR1PUg=;
 b=w4lTsoE7U45HSL45M+nsIsa4k+1a0xBOsiqlEazXy4SUeJ4xatMo829yuMwtd7nSyU
 Il/EFC4UP8zO4pcnpPHVvXuo6VNTnH+Pcocd6Vr03QYLRMT/gE+xOf+lp9M6onegQKR5
 q8CyzbYGWsC9cYe7CxqwQQrwSZdTIKfLzLwDwS9n9aoPqxvCjRrnvf3OMOeT4kDwuhAR
 qFqlhftQ45iZ3Nw841C9XkuKaZeSPVSiGy8weNm5VmnpK24dDM1JVtlvbH3OKKktI6lF
 QqSfkwvnmegPB59CdCEV+Zld0adX13l+iTTNCUFWmpt/ZbGsex3DATrBd7AAxAmEI9Uu
 l6ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5cDdFGZ6MoLt68xZTFwrVQDuVEi32TgygCe5Sm1+TMtn9aA6fwdwBDdXQPyTumN8J2KQ+zHE6jko=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfAmbxQILgTxACG9m2ShznlqHLd0W4ciqqTFP6kkVuwDePZyZP
 e2NXhRCCt8dad7oHqvqKx/UTTrzAL3fjRIvnOqs6NYZyHj1kdwTDL64/yg==
X-Gm-Gg: ASbGncuo3VwnpgHxg6tQ/OzIuwoA28ARnrdkVulGoXl2uHJq0lKbJOLgzM7R9nwLVOF
 Jg2msx645NniMAVAorCFH/YHki3fg793DYVFC3no2GNnStnKbIoolskcCuMuRs39QImFREjm8G0
 kD2kCYQ0eI6Xj8A9/9euRtWmiNZWiVoLvn2taFSlz5yW80rUNH7x9se29wbtnxIO1Tf1J5PEMqg
 NbRQuUYvWdxRIbJHMuA52mZl5qhLnG1jqVPH2P1tVbBtMkSTYtIJKgTCY0yTsgOm+CuFC5NNqVw
 iTe1YtlJ+c7A8T8oWzDIRBFRsaRrkQzKi4wViIdBbvejreQajBimvG16LaIv9lQJgp+dDmLF78A
 lH1TPYlgcjOUTFDAtWIurJk+nYPCOWdw=
X-Google-Smtp-Source: AGHT+IE1U46a7zOOtONq+QwBpax7Ahpds1E61gFA8qmT13V9WuNjWi2ccq8I+2TPW5mk2fqOlsESrw==
X-Received: by 2002:a05:620a:2409:b0:7c5:cdb5:271b with SMTP id
 af79cd13be357-7c918fec2d8mr831126785a.15.1744909979301; 
 Thu, 17 Apr 2025 10:12:59 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com
 (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c925a8d2bfsm12902585a.28.2025.04.17.10.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 10:12:58 -0700 (PDT)
Message-ID: <6801369a.050a0220.2b2efe.0e72@mx.google.com>
X-Google-Original-Message-ID: <aAE2lwwjI9Csr7Kq@winterfell.>
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfauth.phl.internal (Postfix) with ESMTP id A85251200043;
 Thu, 17 Apr 2025 13:12:57 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Thu, 17 Apr 2025 13:12:57 -0400
X-ME-Sender: <xms:mTYBaKtPCX7hTJAXfh3Cy_qkehcb4j40eAV_zC-gJRP9srDYf0yGrw>
 <xme:mTYBaPepJAsVpiQG0hAtgDrwnJZtShi6JOXMb13sfHgmD6jaupfXdsj1kd_B06aXE
 UYozOVcM-GE8TOHAQ>
X-ME-Received: <xmr:mTYBaFygZIhapB2yIA8EpcA9kTa7jOq8q2HtCt2e3PYuqyG3bdPJvIMuJB5itw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdelkeefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:mTYBaFNbnly-XmcLgzboyy0blulaxf0g_gvx5OspvUJihMB5uzMr3A>
 <xmx:mTYBaK84QRzrqbAEIeK_fit7VpwxMszuiY6oBiljD6osiizhHtkHhA>
 <xmx:mTYBaNX47CQC2l341GOfs0S74VKiJamzlrjNck9b-e-ERxjmbDuOtw>
 <xmx:mTYBaDfibi2GAvOragNKXULPCEIkgES2H3JOaJeBZwW64PWC01KaMA>
 <xmx:mTYBaEeI2DwRz__Rqild4X0j7hF0LYyp_jEGBEtNDHFCuDTOSLYyo8y9>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Apr 2025 13:12:56 -0400 (EDT)
Date: Thu, 17 Apr 2025 10:12:55 -0700
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
Subject: Re: [PATCH v9 2/6] rust: enable `clippy::ptr_cast_constness` lint
References: <20250416-ptr-as-ptr-v9-0-18ec29b1b1f3@gmail.com>
 <20250416-ptr-as-ptr-v9-2-18ec29b1b1f3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-ptr-as-ptr-v9-2-18ec29b1b1f3@gmail.com>
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

On Wed, Apr 16, 2025 at 01:36:06PM -0400, Tamir Duberstein wrote:
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
> ---
>  Makefile                        | 1 +
>  rust/kernel/block/mq/request.rs | 4 ++--
>  rust/kernel/dma.rs              | 2 +-
>  3 files changed, 4 insertions(+), 3 deletions(-)
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
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index f395d1a6fe48..43ecf3c2e860 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -186,7 +186,7 @@ pub fn alloc_attrs(
>              dev: dev.into(),
>              dma_handle,
>              count,
> -            cpu_addr: ret.cast(),
> +            cpu_addr: ret.cast::<T>(),

Is this change necessary? The rest looks good to me.

Regards,
Boqun

>              dma_attrs,
>          })
>      }
> 
> -- 
> 2.49.0
> 
