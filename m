Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BACEDA936D6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 14:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2DF10E1B7;
	Fri, 18 Apr 2025 12:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gb0AWL1b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAE710E1B7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 12:08:40 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-54acc0cd458so2125185e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 05:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744978119; x=1745582919; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1K31X9OFoOMTBOdzael8QB7KwUChqs1GlIHBZO6H7qI=;
 b=gb0AWL1bqrxx92umZntXLD5e3mtzjBj7NDrH1Z5TDRXlVGXOPtP6Nn5JIMi0VrzKtN
 UPpri6w93FXIlyE6GzPBzPmF3b8da5TsA2O+9j7jcwZfnWuhAtKiyOZ8PTFIMh0Qydfd
 55XkqFGe8mvmbvY+fEKMoTCtsTTGFVZD3I/34K1sjWoKTEwJKoVKK3SjkyDupIckES0e
 wCX2ULuZfq4IVO26DY9hbfWwF8zyJ75q8VCFByCZNPskyz9vyM5AgWiFZQe2RKhNICrj
 Tp6KmgCEzjhpFFhWRGcpvFjon5pmy74pMLqIjGQpx+SDrm8rcXnPR7249QKVPuHBForf
 V5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744978119; x=1745582919;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1K31X9OFoOMTBOdzael8QB7KwUChqs1GlIHBZO6H7qI=;
 b=M+YlI5SYQk6huv97EEFwd6HT+CUrQdudTcK+zUV6F27c6ThUJfk1EvfuQdZNSu2DHc
 6hGF/wOgOgpLHxsE5LZE/VOMPN2Vracjd0uZNyI0XUlozu48BJHF8JMtzIZjptbr9bfA
 5645gGHOT54Vn+1gg9QHyh37Aj0rLQnDNDfWjDsI1FBdQcBkkbiZch5bBlYBMERs2zhO
 eoolv6Oci6/xzC+sOm7yEjksLI/ftGT6/eBVNxFUBhy2CwVipsJMeHFT9uhN1Dzu3kES
 Vomc0Mnu0K76SC6j73oZ5sF2+cL8seFGxZR+5I0/Rr+U0FsaCU+qeRJQskjQm94gII9P
 3wOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKxj8r9epSIjr0ldEUYwAC9XP7ErSRocODcIEj6kiFKsmXlNowKRy/8Ct5xaxpWBuJPfuwOWgwB40=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXkCYoget+hJ5uppu9nJHrotGg0w9mQ5ouXpjzjqjYDlPV+JA5
 BForRLuKDeZg4ZEtJZ3ufpekBieU1JsLCSArrK7PdOhPSxiP4/z+2Zx3qTwztOXF/k5MljzRyik
 V9ixe3ZtWdt+L5JSSNzuT/yckJoM=
X-Gm-Gg: ASbGncsxLPSJ2xkc/pupbAs3dIPY5SnroeJ4uM3P578znvyB8BotgmRMKpJiRcbIU0/
 VfizZNGNXi+/QE+IUMHgOAxm4yuPl9Kb3EUg/elPggUk29SAVdRllzY+98RfhxVgdEJVpLch2lk
 3b9IY0p9YvXkEF9AVj0Ar0YH/wUrmIZLrdNlNdukmZ2UmA3RLH91RUhNM2LssXYjgoKw==
X-Google-Smtp-Source: AGHT+IF8kKbV5UC52Ac9mSy0x9OfKQssvbteOWX4HNd6egKudSVM9JvkIrKNxIs0ohLhnyxnMsd3TXRcYhnO17vRS0A=
X-Received: by 2002:a05:6512:401a:b0:549:8a44:493e with SMTP id
 2adb3069b0e04-54d6e61c6a5mr601106e87.5.1744978118388; Fri, 18 Apr 2025
 05:08:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250416-ptr-as-ptr-v9-0-18ec29b1b1f3@gmail.com>
 <20250416-ptr-as-ptr-v9-4-18ec29b1b1f3@gmail.com>
 <68014084.0c0a0220.394e75.122c@mx.google.com>
 <CAJ-ks9muaNU9v2LZ5=cmfXV6R5AO+joNOoPP=+hs-GJN=APfKQ@mail.gmail.com>
 <680160b8.050a0220.223d09.180f@mx.google.com>
In-Reply-To: <680160b8.050a0220.223d09.180f@mx.google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 18 Apr 2025 08:08:02 -0400
X-Gm-Features: ATxdqUE65QceaCS4mRYzjRsd6XCyLrCNHhZ8_Q1GJ1KEma-RrDsEP9owSjJfvAc
Message-ID: <CAJ-ks9=TXjk8W18ZMG4mx0JpYvXr4nwnUJqjCnqvW9zu2Y1xjA@mail.gmail.com>
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

On Thu, Apr 17, 2025 at 4:12=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Thu, Apr 17, 2025 at 03:26:14PM -0400, Tamir Duberstein wrote:
> [...]
> > >
> > > >          Ok(())
> > > >      }
> > > > diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
> > > > index e5859217a579..4063f09d76d9 100644
> > > > --- a/rust/kernel/device_id.rs
> > > > +++ b/rust/kernel/device_id.rs
> > > > @@ -82,7 +82,7 @@ impl<T: RawDeviceId, U, const N: usize> IdArray<T=
, U, N> {
> > > >              unsafe {
> > > >                  raw_ids[i]
> > > >                      .as_mut_ptr()
> > > > -                    .byte_offset(T::DRIVER_DATA_OFFSET as _)
> > > > +                    .byte_add(T::DRIVER_DATA_OFFSET)
> > > >                      .cast::<usize>()
> > > >                      .write(i);
> > > >              }
> > > > diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> > > > index f7e8f5f53622..70d12014e476 100644
> > > > --- a/rust/kernel/devres.rs
> > > > +++ b/rust/kernel/devres.rs
> > > > @@ -45,7 +45,7 @@ struct DevresInner<T> {
> > > >  /// # Example
> > > >  ///
> > > >  /// ```no_run
> > > > -/// # use kernel::{bindings, c_str, device::Device, devres::Devres=
, io::{Io, IoRaw}};
> > > > +/// # use kernel::{bindings, c_str, device::Device, devres::Devres=
, ffi::c_void, io::{Io, IoRaw}};
> > > >  /// # use core::ops::Deref;
> > > >  ///
> > > >  /// // See also [`pci::Bar`] for a real example.
> > > > @@ -59,19 +59,19 @@ struct DevresInner<T> {
> > > >  ///     unsafe fn new(paddr: usize) -> Result<Self>{
> > > >  ///         // SAFETY: By the safety requirements of this function=
 [`paddr`, `paddr` + `SIZE`) is
> > > >  ///         // valid for `ioremap`.
> > > > -///         let addr =3D unsafe { bindings::ioremap(paddr as _, SI=
ZE as _) };
> > > > +///         let addr =3D unsafe { bindings::ioremap(paddr as bindi=
ngs::phys_addr_t, SIZE) };
> > >
> > >
> > > ///         let addr =3D unsafe { bindings::ioremap(bindings::phys_ad=
dr_t::from(paddr), SIZE) };
> > >
> > > better? Or even with .into()
> > >
> > > ///         let addr =3D unsafe { bindings::ioremap(paddr.into(), SIZ=
E) };
> >
> > This doesn't compile because `paddr` is usize, and
> > `bindings::phys_addr_t` is u64 (on my machine, which is aarch64).
> >
>
> Ok, looks like Rust yet doesn't provide From/Into between usize and u64
> even if the pointer size is fixed. Latest discussion can be found at:
>
>         https://github.com/rust-lang/rust/issues/41619#issuecomment-20569=
02943
>
> Lemme see if we can get an issue tracking this. Thanks for taking a
> look.
>
> > > >  ///         if addr.is_null() {
> > > >  ///             return Err(ENOMEM);
> > > >  ///         }
> > > >  ///
> > > > -///         Ok(IoMem(IoRaw::new(addr as _, SIZE)?))
> > > > +///         Ok(IoMem(IoRaw::new(addr as usize, SIZE)?))
> > > >  ///     }
> > > >  /// }
> > > >  ///
> > > >  /// impl<const SIZE: usize> Drop for IoMem<SIZE> {
> > > >  ///     fn drop(&mut self) {
> > > >  ///         // SAFETY: `self.0.addr()` is guaranteed to be properl=
y mapped by `Self::new`.
> > > > -///         unsafe { bindings::iounmap(self.0.addr() as _); };
> > > > +///         unsafe { bindings::iounmap(self.0.addr() as *mut c_voi=
d); };
> > > >  ///     }
> > > >  /// }
> > > >  ///
> > > [...]
> > > > diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> > > > index 43ecf3c2e860..851a6339aa90 100644
> > > > --- a/rust/kernel/dma.rs
> > > > +++ b/rust/kernel/dma.rs
> > > > @@ -38,7 +38,7 @@
> > > >  impl Attrs {
> > > >      /// Get the raw representation of this attribute.
> > > >      pub(crate) fn as_raw(self) -> crate::ffi::c_ulong {
> > > > -        self.0 as _
> > > > +        self.0 as crate::ffi::c_ulong
> > >
> > >         crate::ffi::c_ulong::from(self.0)
> > >
> > > maybe, a C unsigned long should always be able to hold the whole `Att=
r`
> > > and a lossly casting is what this function does.
> >
> > This also doesn't compile: "the trait `core::convert::From<u32>` is
> > not implemented for `usize`". Upstream has ambitions of running on
> > 16-bit, I guess :)
> >
>
> They do but they also have the target_pointer_width cfg, so they can
> totally provide these functions. It's just they want to find a better
> way (like the link I post above).

Did you want me to hold off on the respin on this point, or shall I go ahea=
d?
