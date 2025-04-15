Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 844B7A8A62F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 19:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AD910E139;
	Tue, 15 Apr 2025 17:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H6yETCuD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98D510E139
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 17:59:21 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-30bfc79ad97so73580991fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 10:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744739959; x=1745344759; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xy3kd4y2fU3jMELcdzdDFGgDJCCLaq6b5me66/U55f4=;
 b=H6yETCuD/VKWexH+BhVtnPIjoGYfiHS0b3VJatnz2FF7vNvuNPoOfY2ECh+mkRDWiA
 jedkxo5ytQ1yOw1eWVd86TzMNY5/J+LYg0bl+2s/T42RpWG2y0UIpH4igkeVhLtFjS8k
 Ksp8fElX/nfg23vTtZjiz5mAcbKzLvovFXNdzNkjrIDVgqjbbsyftjfyJYe+9Fx4tqyA
 DOlE8nJwUen+/+ARfK6dFYH+Mcs7BdUKC0EsMV+ELsd4dkv2VTB7c2KV6so/qs9EN67p
 TfEjWwa0ztz937XxIbTfzQM/FH5+gEzBF1rnHMppLaAp8kjkROUYGbRI9HvNctG0757q
 D5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744739959; x=1745344759;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xy3kd4y2fU3jMELcdzdDFGgDJCCLaq6b5me66/U55f4=;
 b=Ap+9hyzs0s1XunoH6zYEvLyI9acA2MXip419kWO4/P8CIrKwcvsOsR+9P7rbWN/QMl
 1vpmZK/TnHYUygtpkC5jL1Glun15IrB15MQdoaM5WWpspXHQKco1YHeLdFHBW6sMbKvt
 5XigcgkeAAn3/qbdYAcaKDH7qHvIEIMnveEDK8Zq0ucmgHT+MHrtZZ5TSi19r1l/EpLl
 evcip4Qfd0sJtTTIMaoot5kCgQcR6CBZVbe4Pmms3x4bshmxIf7gz0ubl4R4AgJiHz5o
 baSf8XVzIbAjtZ7dhsCrUErLU4IwACi2UJ96/ltbZmljzu0nh/CMyYBj+KpF/hZYbUtJ
 8v2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgYALNAscIRFZo1L9qDmrDMHuPsBDDgV492CKWxfiS34W7bDPLvAVnbH+p59xU/aZDtmEX9+e8Q78=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbovqbCEtwQ0wH9xvWTL0UV9n+chRq1x3C8PFpuLeQLPgyuWT4
 MjE9L8HAWP4ulbGyov8h7D38NwTJgEynNC4/sIpk3dByivvEjH+N1P2goQL6wT9kDEOrgYlWgzB
 4kc381rT84eRzck6pR6RtlQNMvyQ=
X-Gm-Gg: ASbGnct2nY099Ar4vGIs81jLEpirkht4HOOq77j/u7m6hYTpvKyGltHoQ3ML5urlm1y
 FYPFjwY8v+osEF4RWd3GUCuh3M+hUzkvRqwNqX+rVrBe2DoAV/X5KDd514P1EVGc/3ENcx2JGUd
 ppA3+3EyzbGBZGVkS9CFxxbDSJVbFm2BAFb8oEIw==
X-Google-Smtp-Source: AGHT+IEUNTX9p1/kWuAn/OzmQY0lqmIBQmlqMfDN8hWejN/w4TanfAbwc4EzQ3SRD5P4AkdcwY/5HBDJLXd2VI4DjpM=
X-Received: by 2002:a05:651c:510:b0:30b:c328:3cdc with SMTP id
 38308e7fff4ca-3107b567391mr1618391fa.2.1744739958790; Tue, 15 Apr 2025
 10:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250409-ptr-as-ptr-v8-0-3738061534ef@gmail.com>
 <20250409-ptr-as-ptr-v8-6-3738061534ef@gmail.com>
 <67fe9975.c80a0220.1b5785.66e7@mx.google.com>
In-Reply-To: <67fe9975.c80a0220.1b5785.66e7@mx.google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 15 Apr 2025 13:58:41 -0400
X-Gm-Features: ATxdqUFTqoXZoDoJwXjqPF28obJ4nUC4URNzmlSsg0OP0AFuuXDbvBbZrCOdGZQ
Message-ID: <CAJ-ks9mzyfvsxkyud_wLXfhLD_zP95bivCQ9i2aC-3ea=Y7+0A@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] rust: enable `clippy::ref_as_ptr` lint
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

Hi Boqun, thanks for having a look!

On Tue, Apr 15, 2025 at 1:37=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Wed, Apr 09, 2025 at 10:47:23AM -0400, Tamir Duberstein wrote:
> > In Rust 1.78.0, Clippy introduced the `ref_as_ptr` lint [1]:
> >
> > > Using `as` casts may result in silently changing mutability or type.
> >
> > While this doesn't eliminate unchecked `as` conversions, it makes such
> > conversions easier to scrutinize.  It also has the slight benefit of
> > removing a degree of freedom on which to bikeshed. Thus apply the
> > changes and enable the lint -- no functional change intended.
> >
> > Link: https://rust-lang.github.io/rust-clippy/master/index.html#ref_as_=
ptr [1]
> > Suggested-by: Benno Lossin <benno.lossin@proton.me>
> > Link: https://lore.kernel.org/all/D8PGG7NTWB6U.3SS3A5LN4XWMN@proton.me/
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> >  Makefile                 |  1 +
> >  rust/bindings/lib.rs     |  1 +
> >  rust/kernel/device_id.rs |  3 ++-
> >  rust/kernel/fs/file.rs   |  3 ++-
> >  rust/kernel/str.rs       |  6 ++++--
> >  rust/kernel/uaccess.rs   | 10 ++++------
> >  rust/uapi/lib.rs         |  1 +
> >  7 files changed, 15 insertions(+), 10 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index eb5a942241a2..2a16e02f26db 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -485,6 +485,7 @@ export rust_common_flags :=3D --edition=3D2021 \
> >                           -Wclippy::no_mangle_with_rust_abi \
> >                           -Wclippy::ptr_as_ptr \
> >                           -Wclippy::ptr_cast_constness \
> > +                         -Wclippy::ref_as_ptr \
> >                           -Wclippy::undocumented_unsafe_blocks \
> >                           -Wclippy::unnecessary_safety_comment \
> >                           -Wclippy::unnecessary_safety_doc \
> > diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
> > index b105a0d899cc..2b69016070c6 100644
> > --- a/rust/bindings/lib.rs
> > +++ b/rust/bindings/lib.rs
> > @@ -27,6 +27,7 @@
> >  #[allow(dead_code)]
> >  #[allow(clippy::cast_lossless)]
> >  #[allow(clippy::ptr_as_ptr)]
> > +#[allow(clippy::ref_as_ptr)]
> >  #[allow(clippy::undocumented_unsafe_blocks)]
> >  mod bindings_raw {
> >      // Manual definition for blocklisted types.
> > diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
> > index 4063f09d76d9..37cc03d1df4c 100644
> > --- a/rust/kernel/device_id.rs
> > +++ b/rust/kernel/device_id.rs
> > @@ -136,7 +136,8 @@ impl<T: RawDeviceId, U, const N: usize> IdTable<T, =
U> for IdArray<T, U, N> {
> >      fn as_ptr(&self) -> *const T::RawType {
> >          // This cannot be `self.ids.as_ptr()`, as the return pointer m=
ust have correct provenance
> >          // to access the sentinel.
> > -        (self as *const Self).cast()
> > +        let this: *const Self =3D self;
>
> Hmm.. so this lint usually just requires to use a let statement instead
> of as expression when casting a reference to a pointer? Not 100%
> convinced this results into better code TBH..

The rationale is in the lint description and quoted in the commit
message: "Using `as` casts may result in silently changing mutability
or type.".

>
> > +        this.cast()
> >      }
> >
> >      fn id(&self, index: usize) -> &T::RawType {
> > diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
> > index 791f493ada10..559a4bfa123f 100644
> > --- a/rust/kernel/fs/file.rs
> > +++ b/rust/kernel/fs/file.rs
> > @@ -359,12 +359,13 @@ impl core::ops::Deref for File {
> >      type Target =3D LocalFile;
> >      #[inline]
> >      fn deref(&self) -> &LocalFile {
> > +        let this: *const Self =3D self;
> >          // SAFETY: The caller provides a `&File`, and since it is a re=
ference, it must point at a
> >          // valid file for the desired duration.
> >          //
> >          // By the type invariants, there are no `fdget_pos` calls that=
 did not take the
> >          // `f_pos_lock` mutex.
> > -        unsafe { LocalFile::from_raw_file((self as *const Self).cast()=
) }
> > +        unsafe { LocalFile::from_raw_file(this.cast()) }
> >      }
> >  }
> >
> > diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> > index 40034f77fc2f..75b4a18c67c4 100644
> > --- a/rust/kernel/str.rs
> > +++ b/rust/kernel/str.rs
> > @@ -28,8 +28,9 @@ pub const fn is_empty(&self) -> bool {
> >      /// Creates a [`BStr`] from a `[u8]`.
> >      #[inline]
> >      pub const fn from_bytes(bytes: &[u8]) -> &Self {
> > +        let bytes: *const [u8] =3D bytes;
> >          // SAFETY: `BStr` is transparent to `[u8]`.
> > -        unsafe { &*(bytes as *const [u8] as *const BStr) }
> > +        unsafe { &*(bytes as *const BStr) }
>
>         unsafe { &*(bytes.cast::<BStr>()) }
>
> ? I'm curious why this dodged the other lint (ptr_as_ptr).

The reason it has to be written this way is that BStr is !Sized, and
`pointer::cast` has an implicit Sized bound.

Perhaps the lint is smart enough to avoid the suggestion in that case?
Seems like yes:
https://github.com/rust-lang/rust-clippy/blob/d3267e9230940757fde2fcb608605=
bf8dbfd85e1/clippy_lints/src/casts/ptr_as_ptr.rs#L36.

>
> >      }
> >
> >      /// Strip a prefix from `self`. Delegates to [`slice::strip_prefix=
`].
> > @@ -289,8 +290,9 @@ pub const fn from_bytes_with_nul(bytes: &[u8]) -> R=
esult<&Self, CStrConvertError
> >      /// `NUL` byte (or the string will be truncated).
> >      #[inline]
> >      pub unsafe fn from_bytes_with_nul_unchecked_mut(bytes: &mut [u8]) =
-> &mut CStr {
> > +        let bytes: *mut [u8] =3D bytes;
> >          // SAFETY: Properties of `bytes` guaranteed by the safety prec=
ondition.
> > -        unsafe { &mut *(bytes as *mut [u8] as *mut CStr) }
> > +        unsafe { &mut *(bytes as *mut CStr) }
>
> Ditto.
>
> >      }
> >
> >      /// Returns a C pointer to the string.
> > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> > index 80a9782b1c6e..7a6fc78fc314 100644
> > --- a/rust/kernel/uaccess.rs
> > +++ b/rust/kernel/uaccess.rs
> > @@ -240,9 +240,10 @@ pub fn read_raw(&mut self, out: &mut [MaybeUninit<=
u8>]) -> Result {
> >      /// Fails with [`EFAULT`] if the read happens on a bad address, or=
 if the read goes out of
> >      /// bounds of this [`UserSliceReader`]. This call may modify `out`=
 even if it returns an error.
> >      pub fn read_slice(&mut self, out: &mut [u8]) -> Result {
> > +        let out: *mut [u8] =3D out;
> >          // SAFETY: The types are compatible and `read_raw` doesn't wri=
te uninitialized bytes to
> >          // `out`.
> > -        let out =3D unsafe { &mut *(out as *mut [u8] as *mut [MaybeUni=
nit<u8>]) };
> > +        let out =3D unsafe { &mut *(out as *mut [MaybeUninit<u8>]) };
>
> Ditto.

Same rationale here.

Cheers.
Tamir
