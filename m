Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFF4A923C8
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 19:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BF110E329;
	Thu, 17 Apr 2025 17:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G2jYd4i9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA65210E329
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 17:17:19 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-549967c72bcso1220441e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 10:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744910238; x=1745515038; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=irzU/UEG8kWXnz04y8/ocsz9zbHZsT12yci/WpMA35E=;
 b=G2jYd4i9Hfl3Lo6Kdgd14nkVK/s5ldvv+qy/NVmHmfDcQIcu9fDZhLgMiZ7eESDRcp
 J6nF6uCX9kBmfbUHRf55ERONMjoSvQPDrqqYbXMWKqNrN4deMRAG4ydKWzjL12AhIPof
 a+UAajB5wPhEZ5YV2UA912rUNYJYDF5WXb4UnK1qz7t7vD2+KF+q8m/FhH8VfofNXKQG
 /Jle1CMCFdf9fF71ne10moWyvZhKezbc6sLGdEHcnYWJPNFxi4wjb7CpPeyRMuuI6oye
 8YByuZa6fZtXySjt4lTtFXE9uqhouVFJEMFQJZIvCUHbKBlMMJZ4zzZPKVb+876guhDo
 R6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744910238; x=1745515038;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=irzU/UEG8kWXnz04y8/ocsz9zbHZsT12yci/WpMA35E=;
 b=tfqEwVhcE1kxlkaWiCTxnyrWtVohgzbIK9YSElKEwq9HkMIcPQ4S4HsBglloo99S7S
 JX+UxoXnFtKEoONrkAVHPKkUsJIUSnA+F/A67MY6+RwRKEpHIJ09QLqLu+j/RLI+fU+z
 kOn4VOOB6qki3/H9ExlPV84hNcx4B5Bqbehry2ibwl4TsCYlyIlzf0KlxnlLISCLMl2x
 sM19qaT8a7K90M++07NsZjbgQ9pOOicAGow6CBU6sPgf901Byl/FoG0OAXTjcSAMtTix
 3zfiw1eIXLu2mrEecq2JK64AQ7WB7WtHqZKRIwvHgaL0CiF3xj6Vy0dkFxkM1kzvj6DO
 3eXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0NYbaY5ttwvofnLdE92XYNO76Ivm8e+lSg7+NvOco0IiVzDm4d35ux9vcUbTuyNXCVLF+3PEI7xI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxS7KGh+6w50GYIIoTHr4iF+yVKr/unc5k0b6AwcVal8OqT5S+d
 ZBY1R/oIFRUQAc7gnFj3JT7vrbJkIFECTy/Mo7/VIbs5vNfLB7zRKJSwgkYq9aJeXlbNXAAX48n
 znRUStE/th9JIkOe1IWxh+AvGt94=
X-Gm-Gg: ASbGncsFFosqyoYdPDndpR0mjxZr1hTZNdBPVAKK/3hr/m/VauXxUuhfBDF7+JCC/FM
 opPngxCLJY+F/Ct1Krne6WPq5Re6IAx/XvBLYvyFuB38DyjqYZ9x3T8WVhNFJSsnJjItfARB9B3
 f5y5gWy7C0SDJB5mmljnVOID9ej49zFGRKLPxrTvSMCrAYg5sEyJnnwWc=
X-Google-Smtp-Source: AGHT+IFQfth8jvV7Bf/HOqbfX7Brb6rYBsKlQ6GVbcLqvA9U4UF13IxDpTt2GrR5ecq2BkENHIaNtobIdQOlMP5DNNQ=
X-Received: by 2002:a05:6512:33c9:b0:545:5d:a5cd with SMTP id
 2adb3069b0e04-54d64a7b6a8mr2598030e87.6.1744910237922; Thu, 17 Apr 2025
 10:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250416-ptr-as-ptr-v9-0-18ec29b1b1f3@gmail.com>
 <20250416-ptr-as-ptr-v9-2-18ec29b1b1f3@gmail.com>
 <6801369a.050a0220.2b2efe.0e72@mx.google.com>
In-Reply-To: <6801369a.050a0220.2b2efe.0e72@mx.google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 17 Apr 2025 13:16:41 -0400
X-Gm-Features: ATxdqUGVXR8XPoYd_1-AlkCxTNrT7fcGAI3ugseBILGoNw_bpXd8V7C18NyvQ7c
Message-ID: <CAJ-ks9nJuojWyXtCZmnOX3EPq0xoThJ+H6PCaXFWf3Fpr6QqJA@mail.gmail.com>
Subject: Re: [PATCH v9 2/6] rust: enable `clippy::ptr_cast_constness` lint
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
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
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Apr 17, 2025 at 1:12=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Wed, Apr 16, 2025 at 01:36:06PM -0400, Tamir Duberstein wrote:
> > In Rust 1.72.0, Clippy introduced the `ptr_cast_constness` lint [1]:
> >
> > > Though `as` casts between raw pointers are not terrible,
> > > `pointer::cast_mut` and `pointer::cast_const` are safer because they
> > > cannot accidentally cast the pointer to another type.
> >
> > There are only 2 affected sites:
> > - `*mut T as *const U as *mut U` becomes `(*mut T).cast()`
> > - `&self as *const Self as *mut Self` becomes
> >   `core::ptr::from_ref(self).cast_mut()`.
> >
> > Apply these changes and enable the lint -- no functional change
> > intended.
> >
> > Link: https://rust-lang.github.io/rust-clippy/master/index.html#ptr_cas=
t_constness [1]
> > Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> >  Makefile                        | 1 +
> >  rust/kernel/block/mq/request.rs | 4 ++--
> >  rust/kernel/dma.rs              | 2 +-
> >  3 files changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 5d2931344490..7b85b2a8d371 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -481,6 +481,7 @@ export rust_common_flags :=3D --edition=3D2021 \
> >                           -Aclippy::needless_lifetimes \
> >                           -Wclippy::no_mangle_with_rust_abi \
> >                           -Wclippy::ptr_as_ptr \
> > +                         -Wclippy::ptr_cast_constness \
> >                           -Wclippy::undocumented_unsafe_blocks \
> >                           -Wclippy::unnecessary_safety_comment \
> >                           -Wclippy::unnecessary_safety_doc \
> > diff --git a/rust/kernel/block/mq/request.rs b/rust/kernel/block/mq/req=
uest.rs
> > index 4a5b7ec914ef..af5c9ac94f36 100644
> > --- a/rust/kernel/block/mq/request.rs
> > +++ b/rust/kernel/block/mq/request.rs
> > @@ -69,7 +69,7 @@ pub(crate) unsafe fn aref_from_raw(ptr: *mut bindings=
::request) -> ARef<Self> {
> >          // INVARIANT: By the safety requirements of this function, inv=
ariants are upheld.
> >          // SAFETY: By the safety requirement of this function, we own =
a
> >          // reference count that we can pass to `ARef`.
> > -        unsafe { ARef::from_raw(NonNull::new_unchecked(ptr as *const S=
elf as *mut Self)) }
> > +        unsafe { ARef::from_raw(NonNull::new_unchecked(ptr.cast())) }
> >      }
> >
> >      /// Notify the block layer that a request is going to be processed=
 now.
> > @@ -155,7 +155,7 @@ pub(crate) fn wrapper_ref(&self) -> &RequestDataWra=
pper {
> >          // the private data associated with this request is initialize=
d and
> >          // valid. The existence of `&self` guarantees that the private=
 data is
> >          // valid as a shared reference.
> > -        unsafe { Self::wrapper_ptr(self as *const Self as *mut Self).a=
s_ref() }
> > +        unsafe { Self::wrapper_ptr(core::ptr::from_ref(self).cast_mut(=
)).as_ref() }
> >      }
> >  }
> >
> > diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> > index f395d1a6fe48..43ecf3c2e860 100644
> > --- a/rust/kernel/dma.rs
> > +++ b/rust/kernel/dma.rs
> > @@ -186,7 +186,7 @@ pub fn alloc_attrs(
> >              dev: dev.into(),
> >              dma_handle,
> >              count,
> > -            cpu_addr: ret.cast(),
> > +            cpu_addr: ret.cast::<T>(),
>
> Is this change necessary? The rest looks good to me.

Ah, it belongs in the preceding patch. I'll fix that on the next spin.
