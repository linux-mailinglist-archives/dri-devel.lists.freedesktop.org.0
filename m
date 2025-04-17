Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4D5A92BB5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 21:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5E910E3AC;
	Thu, 17 Apr 2025 19:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ONe2YQEw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF4810E3AC
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 19:26:53 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-30bfe0d2b6dso10947891fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 12:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744918011; x=1745522811; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZphEE6mRsXJVjDuLp4TlhI1glcfhD7HPw8PnXuxw7+Y=;
 b=ONe2YQEwzcf09AcCX1F0qDxNujhEViNGm1wNCfLpz0Q9QMCLu7XVM86IhkRU4PbA5y
 OSFTjRJmQu985uFbUq86Vrdr8yGXOSfrnXq5+mtDRAKuQ957uo7x3okCN6lNo/TaEN7U
 mQZm0UtGt8JLBxrRUPrVq+b5uyGSoPj5zxmH9kvKWrtThIPLHjSsjLrAKF2QYYJVlzzH
 +C9XFJhlctR+U3g8HtgdBKNWWxjR9l27uzSXYiuZweHhNkTq7llNLXazyK5/TluEUA4n
 bgCfRmPD77kjQahdJIGTPC38lZZXEzYr57/fSjfq2JQ1/qv3FbmdQL6A6HKgeY5b6YlM
 pGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744918011; x=1745522811;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZphEE6mRsXJVjDuLp4TlhI1glcfhD7HPw8PnXuxw7+Y=;
 b=ml3XJzE5ocZSce1Y8VYPuE+GgGMHQZNaxLvkvQr1yg/9gzUVPV+BtihCB6E/xK8QO7
 efteeCnt6s8y8RFWYVcKQd5PkVVfKGL3kIdm7EZrdXdkNEs4r54m919lkpw1CT6Q7pBi
 RFePIBGYisimFDPIRf6rio6wirf4cFqB9vCA2rvtTix86DAfK1YdG/+yPcxRs52jCvsG
 /x74bp3pN0fxu/Lw+HBDcWVpGuC3cyROedAsnlt0gR5vqUmkoRe16CeTbq2byrOpBznz
 3q3/x/9TSgML67FRLyywFImz1ozZW/Ecg0YvMfWMaP3EKKsSiJSE/QHCw1Ye+wQlO0iY
 26UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvXj6UxFG//0+sTNJ8c/0MZeeujCp5i/alIM7v3OXHcFdHa99KF8ClIGa8K7srGnwDeiqPQ+BAN30=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrhSpp8TJC9nlbca2caM8fGg0qYmb7KYUmCtfNVcIPpgFZu6Hn
 u14GoYOdgA2hevknCh5vUm1MINBwZBydy77Nfz+zCyuo7uCl09jr0iBpdogz49nj4yXQrIH9ocr
 +sXIOXS3MlajxeTszI3dHV4Z534s=
X-Gm-Gg: ASbGncv5U5c2UlimNYTEgZyLh2mbGvDMwbwqSN/ihBNtnsSUatasW7WXnGuJgx/NBX9
 6t0Z+siAmLFN/Jy/keg2slmnPtW6Wsnz4et/75QHNoURt6/o2N+jFAnxFq/uFIyErMRUrKyuluU
 Bf7bNTi95gaD5lyU4gVJjFT2OY5eKjhagUDzaufSuGn10bAfcYf4oKxU2h
X-Google-Smtp-Source: AGHT+IF2XTv7HEMjuAx71ffsVmOHEEMf+2KfvDr/EyFROldtRi3Nj0Q6tLUChxn/8pPu3HfKc/G6xbDuaC2Pjkx+paw=
X-Received: by 2002:a2e:a58c:0:b0:30b:edd8:886 with SMTP id
 38308e7fff4ca-310904d424bmr815101fa.9.1744918010897; Thu, 17 Apr 2025
 12:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250416-ptr-as-ptr-v9-0-18ec29b1b1f3@gmail.com>
 <20250416-ptr-as-ptr-v9-4-18ec29b1b1f3@gmail.com>
 <68014084.0c0a0220.394e75.122c@mx.google.com>
In-Reply-To: <68014084.0c0a0220.394e75.122c@mx.google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 17 Apr 2025 15:26:14 -0400
X-Gm-Features: ATxdqUHAtAIGsosX3Js7zsmhna_CZhgy2ypzTbcfLvguLbUlfr3PFS5qMUsCdB8
Message-ID: <CAJ-ks9muaNU9v2LZ5=cmfXV6R5AO+joNOoPP=+hs-GJN=APfKQ@mail.gmail.com>
Subject: Re: [PATCH v9 4/6] rust: enable `clippy::as_underscore` lint
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

On Thu, Apr 17, 2025 at 1:55=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Wed, Apr 16, 2025 at 01:36:08PM -0400, Tamir Duberstein wrote:
> > In Rust 1.63.0, Clippy introduced the `as_underscore` lint [1]:
> >
> > > The conversion might include lossy conversion or a dangerous cast tha=
t
> > > might go undetected due to the type being inferred.
> > >
> > > The lint is allowed by default as using `_` is less wordy than always
> > > specifying the type.
> >
> > Always specifying the type is especially helpful in function call
> > contexts where the inferred type may change at a distance. Specifying
> > the type also allows Clippy to spot more cases of `useless_conversion`.
> >
> > The primary downside is the need to specify the type in trivial getters=
.
> > There are 4 such functions: 3 have become slightly less ergonomic, 1 wa=
s
> > revealed to be a `useless_conversion`.
> >
> > While this doesn't eliminate unchecked `as` conversions, it makes such
> > conversions easier to scrutinize.  It also has the slight benefit of
> > removing a degree of freedom on which to bikeshed. Thus apply the
> > changes and enable the lint -- no functional change intended.
> >
> > Link: https://rust-lang.github.io/rust-clippy/master/index.html#as_unde=
rscore [1]
> > Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> >  Makefile                           |  1 +
> >  rust/kernel/block/mq/operations.rs |  2 +-
> >  rust/kernel/block/mq/request.rs    |  2 +-
> >  rust/kernel/device_id.rs           |  2 +-
> >  rust/kernel/devres.rs              | 15 ++++++++-------
> >  rust/kernel/dma.rs                 |  2 +-
> >  rust/kernel/error.rs               |  2 +-
> >  rust/kernel/io.rs                  | 18 +++++++++---------
> >  rust/kernel/miscdevice.rs          |  2 +-
> >  rust/kernel/of.rs                  |  6 +++---
> >  rust/kernel/pci.rs                 |  9 ++++++---
> >  rust/kernel/str.rs                 |  8 ++++----
> >  rust/kernel/workqueue.rs           |  2 +-
> >  13 files changed, 38 insertions(+), 33 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 04a5246171f9..57080a64913f 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -475,6 +475,7 @@ export rust_common_flags :=3D --edition=3D2021 \
> >                           -Wunreachable_pub \
> >                           -Wclippy::all \
> >                           -Wclippy::as_ptr_cast_mut \
> > +                         -Wclippy::as_underscore \
> >                           -Wclippy::ignored_unit_patterns \
> >                           -Wclippy::mut_mut \
> >                           -Wclippy::needless_bitwise_bool \
> > diff --git a/rust/kernel/block/mq/operations.rs b/rust/kernel/block/mq/=
operations.rs
> > index 864ff379dc91..d18ef55490da 100644
> > --- a/rust/kernel/block/mq/operations.rs
> > +++ b/rust/kernel/block/mq/operations.rs
> > @@ -101,7 +101,7 @@ impl<T: Operations> OperationsVTable<T> {
> >          if let Err(e) =3D ret {
> >              e.to_blk_status()
> >          } else {
> > -            bindings::BLK_STS_OK as _
> > +            bindings::BLK_STS_OK as u8
> >          }
> >      }
> >
> > diff --git a/rust/kernel/block/mq/request.rs b/rust/kernel/block/mq/req=
uest.rs
> > index af5c9ac94f36..22697104bf8c 100644
> > --- a/rust/kernel/block/mq/request.rs
> > +++ b/rust/kernel/block/mq/request.rs
> > @@ -125,7 +125,7 @@ pub fn end_ok(this: ARef<Self>) -> Result<(), ARef<=
Self>> {
> >          // success of the call to `try_set_end` guarantees that there =
are no
> >          // `ARef`s pointing to this request. Therefore it is safe to h=
and it
> >          // back to the block layer.
> > -        unsafe { bindings::blk_mq_end_request(request_ptr, bindings::B=
LK_STS_OK as _) };
> > +        unsafe { bindings::blk_mq_end_request(request_ptr, bindings::B=
LK_STS_OK as u8) };
> >
>
> We could consider defining a const block::mq::BLK_STATUS_OK as:
>
>         const BLK_STATUS_OK: u8 =3D bindings::BLK_STS_OK as u8;
>
> , because repeating the as pattern is a bit err-prone. But maybe in a
> later patch.

Sure. I think there's only this instance at the moment.

>
> >          Ok(())
> >      }
> > diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
> > index e5859217a579..4063f09d76d9 100644
> > --- a/rust/kernel/device_id.rs
> > +++ b/rust/kernel/device_id.rs
> > @@ -82,7 +82,7 @@ impl<T: RawDeviceId, U, const N: usize> IdArray<T, U,=
 N> {
> >              unsafe {
> >                  raw_ids[i]
> >                      .as_mut_ptr()
> > -                    .byte_offset(T::DRIVER_DATA_OFFSET as _)
> > +                    .byte_add(T::DRIVER_DATA_OFFSET)
> >                      .cast::<usize>()
> >                      .write(i);
> >              }
> > diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> > index f7e8f5f53622..70d12014e476 100644
> > --- a/rust/kernel/devres.rs
> > +++ b/rust/kernel/devres.rs
> > @@ -45,7 +45,7 @@ struct DevresInner<T> {
> >  /// # Example
> >  ///
> >  /// ```no_run
> > -/// # use kernel::{bindings, c_str, device::Device, devres::Devres, io=
::{Io, IoRaw}};
> > +/// # use kernel::{bindings, c_str, device::Device, devres::Devres, ff=
i::c_void, io::{Io, IoRaw}};
> >  /// # use core::ops::Deref;
> >  ///
> >  /// // See also [`pci::Bar`] for a real example.
> > @@ -59,19 +59,19 @@ struct DevresInner<T> {
> >  ///     unsafe fn new(paddr: usize) -> Result<Self>{
> >  ///         // SAFETY: By the safety requirements of this function [`p=
addr`, `paddr` + `SIZE`) is
> >  ///         // valid for `ioremap`.
> > -///         let addr =3D unsafe { bindings::ioremap(paddr as _, SIZE a=
s _) };
> > +///         let addr =3D unsafe { bindings::ioremap(paddr as bindings:=
:phys_addr_t, SIZE) };
>
>
> ///         let addr =3D unsafe { bindings::ioremap(bindings::phys_addr_t=
::from(paddr), SIZE) };
>
> better? Or even with .into()
>
> ///         let addr =3D unsafe { bindings::ioremap(paddr.into(), SIZE) }=
;

This doesn't compile because `paddr` is usize, and
`bindings::phys_addr_t` is u64 (on my machine, which is aarch64).

> >  ///         if addr.is_null() {
> >  ///             return Err(ENOMEM);
> >  ///         }
> >  ///
> > -///         Ok(IoMem(IoRaw::new(addr as _, SIZE)?))
> > +///         Ok(IoMem(IoRaw::new(addr as usize, SIZE)?))
> >  ///     }
> >  /// }
> >  ///
> >  /// impl<const SIZE: usize> Drop for IoMem<SIZE> {
> >  ///     fn drop(&mut self) {
> >  ///         // SAFETY: `self.0.addr()` is guaranteed to be properly ma=
pped by `Self::new`.
> > -///         unsafe { bindings::iounmap(self.0.addr() as _); };
> > +///         unsafe { bindings::iounmap(self.0.addr() as *mut c_void); =
};
> >  ///     }
> >  /// }
> >  ///
> [...]
> > diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> > index 43ecf3c2e860..851a6339aa90 100644
> > --- a/rust/kernel/dma.rs
> > +++ b/rust/kernel/dma.rs
> > @@ -38,7 +38,7 @@
> >  impl Attrs {
> >      /// Get the raw representation of this attribute.
> >      pub(crate) fn as_raw(self) -> crate::ffi::c_ulong {
> > -        self.0 as _
> > +        self.0 as crate::ffi::c_ulong
>
>         crate::ffi::c_ulong::from(self.0)
>
> maybe, a C unsigned long should always be able to hold the whole `Attr`
> and a lossly casting is what this function does.

This also doesn't compile: "the trait `core::convert::From<u32>` is
not implemented for `usize`". Upstream has ambitions of running on
16-bit, I guess :)

>
> >      }
> >
> >      /// Check whether `flags` is contained in `self`.
> [...]
> > @@ -70,19 +70,19 @@ pub fn maxsize(&self) -> usize {
> >  ///     unsafe fn new(paddr: usize) -> Result<Self>{
> >  ///         // SAFETY: By the safety requirements of this function [`p=
addr`, `paddr` + `SIZE`) is
> >  ///         // valid for `ioremap`.
> > -///         let addr =3D unsafe { bindings::ioremap(paddr as _, SIZE a=
s _) };
> > +///         let addr =3D unsafe { bindings::ioremap(paddr as bindings:=
:phys_addr_t, SIZE) };
>
> Similarly:
>
> ///         let addr =3D unsafe { bindings::ioremap(paddr.into(), SIZE) }=
;
>
> or `from()`.

As above, doesn't compile.

> >  ///         if addr.is_null() {
> >  ///             return Err(ENOMEM);
> >  ///         }
> >  ///
> > -///         Ok(IoMem(IoRaw::new(addr as _, SIZE)?))
> > +///         Ok(IoMem(IoRaw::new(addr as usize, SIZE)?))
> >  ///     }
> >  /// }
> >  ///
> >  /// impl<const SIZE: usize> Drop for IoMem<SIZE> {
> >  ///     fn drop(&mut self) {
> >  ///         // SAFETY: `self.0.addr()` is guaranteed to be properly ma=
pped by `Self::new`.
> > -///         unsafe { bindings::iounmap(self.0.addr() as _); };
> > +///         unsafe { bindings::iounmap(self.0.addr() as *mut c_void); =
};
> >  ///     }
> >  /// }
> >  ///
> [...]
>
> The rest looks good to me. Thanks!
>
> Regards,
> Boqun

Thanks!
