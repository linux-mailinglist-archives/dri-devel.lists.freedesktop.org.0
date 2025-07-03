Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C4CAF80CC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 20:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1B3110E048;
	Thu,  3 Jul 2025 18:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bGrqRVb2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E24310E048;
 Thu,  3 Jul 2025 18:56:08 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-32cd499007aso1944841fa.0; 
 Thu, 03 Jul 2025 11:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751568966; x=1752173766; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8dlaeAwrvJ5aPEylVD9MPrXhE+oUlcOe0WL6Bhz2K6Q=;
 b=bGrqRVb2O4ZF1s2kPmZ4YPXJMu79fVrYI90xPQAD17zXNV5h4SCbri7Y0O9wnTKxvN
 kJP+3uiBhBXKV90GSHn1PrPQlSS4wrpQ1TVvvbbSKhiXFVZziuZ0NcFvE8BYl4JXpi/J
 BoZeUnEJ6CEEXphdI2ve8/QSOjjITIxAghh+pf5tYnumvcoxZi2LqDnqnqKIZt4lwQit
 KamSPm2Wsa+jZ/Th0aiDtUavoxZc1vG4+VNZgUT8C7olfvHEB/IUvkjZtq/GbXinoiUW
 xh+s1m1gNc78zMJnxiz0haSPwi4masvLFYjeaKFtsHu2/Oz72nlwD7n3SwecPA3Ze9sJ
 4eAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751568966; x=1752173766;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8dlaeAwrvJ5aPEylVD9MPrXhE+oUlcOe0WL6Bhz2K6Q=;
 b=YiUi8BNASVzsFEf6ntE8jjuhZDCMnSf4dqZ3vOvguOb0QSpCXsHP+SwRBtmUTffP3d
 zIPfZa50Xs/qOCbhsC/nQcpDij3tEzlrJM5Ry1GvtwwWQ4nHFdfUxspyTw0IAJMwy+lg
 WI40bGxT3v9JWGhSSyp0a66NA5ISWgfCJG2knuaRMvcxRLxrhwIh4ePAFdi0wrZjP+qb
 mpxQZqJYrQTHX2uqcqgu6OwLY00fV+P5zfPcWEONwbJsoV8GqXwj1FA8yp4GVEG0OytX
 wxXF9MoCz51sAuvGYxs6t2oWf0MV8ryjSo2/oFxy+BU6YtZblfdicoVeqF0lhJvyRIaz
 gLuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVj1zbY5AT4GraPvvhk3wiNOwTlePyTAAEb6bHr7ScJ911p8N2s9laqsXKDKXJ/hWnsNww9by8GAQ==@lists.freedesktop.org,
 AJvYcCXxzvFxslgiIbOOmbl1H8V6hV6hDO57vLQ3r8dgVcIJ/kJzQpX9F6+zqxKdC9YA5gox7d1/CDI0JuA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyd7swBminKlaZDrIASCF0pgqBdms03h+VHs373CATI5yqn9+Fe
 wJaPBBHa/o59fE2CiyIFGxaU++boDqTK8AVciCvy14vNe2Kg4tdUqFB4L4ZcUvJM4JtfujbyDpn
 yXrPRvRqp9/UTEpRRQdwayv2iTpsUuvs=
X-Gm-Gg: ASbGncuDQmkEiA9iiw/LQ0H5I5Sh6J9Vk6gaGoW+T6LecEBaYQlzHn2KsLyV9fgmK+/
 3OliVkF5NuNbH5PeMbB5MEr0sptrf4XGYYDPi7q0NUcXUxB0rCOXMFrSf5G80KieKxpk1EixR6R
 tyHPI80CCj6GrG/An5QbXhJjSVBNlvfJT0Y+X9nxY9ziEC+g==
X-Google-Smtp-Source: AGHT+IED1JBlPUd1eRe4RrZF/42GMBs1msnXpWGnR4Sjy9Tl8Qa7LsZTxooDAniTWu0s2lDdtE1e4sjgynV0m7hycZM=
X-Received: by 2002:a2e:be9e:0:b0:32b:3689:8d80 with SMTP id
 38308e7fff4ca-32dfffc1d46mr29314031fa.18.1751568966060; Thu, 03 Jul 2025
 11:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
 <20250701-cstr-core-v13-2-29f7d3eb97a6@gmail.com>
 <DB2BDSN1JH51.14ZZPETJORBC6@kernel.org>
 <CAJ-ks9nC=AyBPXRY3nJ0NuZvjFskzMcOkVNrBEfXD2hZ5uRntQ@mail.gmail.com>
 <DB2IJ9HBIM0W.3N0JVGKX558QI@kernel.org>
In-Reply-To: <DB2IJ9HBIM0W.3N0JVGKX558QI@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 3 Jul 2025 14:55:30 -0400
X-Gm-Features: Ac12FXxiBqIHZiPi3oRBzp1Rr9KNYcKSHhX18HEqYkevVJN6WhbjlGZhD89_4qA
Message-ID: <CAJ-ks9nF5+m+_bn0Pzi9yU0pw0TyN7Fs4x--mQ4ygyHz4A6hzg@mail.gmail.com>
Subject: Re: [PATCH v13 2/5] rust: support formatting of foreign types
To: Benno Lossin <lossin@kernel.org>
Cc: Michal Rostecki <vadorovsky@protonmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, 
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, llvm@lists.linux.dev, 
 linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org, 
 linux-block@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-clk@vger.kernel.org
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

On Thu, Jul 3, 2025 at 11:08=E2=80=AFAM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Thu Jul 3, 2025 at 3:55 PM CEST, Tamir Duberstein wrote:
> > On Thu, Jul 3, 2025 at 5:32=E2=80=AFAM Benno Lossin <lossin@kernel.org>=
 wrote:
> >> On Tue Jul 1, 2025 at 6:49 PM CEST, Tamir Duberstein wrote:
> >> > Introduce a `fmt!` macro which wraps all arguments in
> >> > `kernel::fmt::Adapter` and a `kernel::fmt::Display` trait. This enab=
les
> >> > formatting of foreign types (like `core::ffi::CStr`) that do not
> >> > implement `core::fmt::Display` due to concerns around lossy conversi=
ons which
> >> > do not apply in the kernel.
> >> >
> >> > Replace all direct calls to `format_args!` with `fmt!`.
> >> >
> >> > Replace all implementations of `core::fmt::Display` with implementat=
ions
> >> > of `kernel::fmt::Display`.
> >> >
> >> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> >> > Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-Ge=
neral/topic/Custom.20formatting/with/516476467
> >> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> >> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> >> > ---
> >> >  drivers/block/rnull.rs       |  2 +-
> >> >  drivers/gpu/nova-core/gpu.rs |  4 +-
> >> >  rust/kernel/block/mq.rs      |  2 +-
> >> >  rust/kernel/device.rs        |  2 +-
> >> >  rust/kernel/fmt.rs           | 89 +++++++++++++++++++++++++++++++++=
++++++
> >> >  rust/kernel/kunit.rs         |  6 +--
> >> >  rust/kernel/lib.rs           |  1 +
> >> >  rust/kernel/prelude.rs       |  3 +-
> >> >  rust/kernel/print.rs         |  4 +-
> >> >  rust/kernel/seq_file.rs      |  2 +-
> >> >  rust/kernel/str.rs           | 22 ++++------
> >> >  rust/macros/fmt.rs           | 99 +++++++++++++++++++++++++++++++++=
+++++++++++
> >> >  rust/macros/lib.rs           | 19 +++++++++
> >> >  rust/macros/quote.rs         |  7 ++++
> >> >  scripts/rustdoc_test_gen.rs  |  2 +-
> >> >  15 files changed, 236 insertions(+), 28 deletions(-)
> >>
> >> This would be a lot easier to review if he proc-macro and the call
> >> replacement were different patches.
> >>
> >> Also the `kernel/fmt.rs` file should be a different commit.
> >
> > Can you help me understand why? The changes you ask to be separated
> > would all be in different files, so why would separate commits make it
> > easier to review?
>
> It takes less time to go through the entire patch and give a RB. I can
> take smaller time chunks and don't have to get back into the entire
> context of the patch when I don't have 30-60min available.

Ah, I see what you mean. Yeah, the requirement to RB the entire patch
does mean there's a benefit to smaller patches.

> In this patch the biggest problem is the rename & addition of new
> things, maybe just adding 200 lines in those files could be okay to go
> together, see below for more.

After implementing your suggestion of re-exporting things from
`kernel::fmt` the diffstat is

26 files changed, 253 insertions(+), 51 deletions(-)

so I guess I could do all the additions in one patch, but then
*everything* else has to go in a single patch together because the
formatting macros either want core::fmt::Display or
kernel::fmt::Display; they can't work in a halfway state.

>
> > I prefer to keep things in one commit because the changes are highly
> > interdependent. The proc macro doesn't make sense without
> > kernel/fmt.rs and kernel/fmt.rs is useless without the proc macro.
>
> I think that `Adapter`, the custom `Display` and their impl blocks
> don't need to be in the same commit as the proc-macro. They are related,
> but maybe someone is not well-versed in proc-macros and thus doesn't
> want to review that part.

Sure, I guess I will split them. But as noted above: changing the
formatting macros and all the types' trait implementations has to be a
"flag day" change.

>
> >> > diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
> >> > new file mode 100644
> >> > index 000000000000..348d16987de6
> >> > --- /dev/null
> >> > +++ b/rust/kernel/fmt.rs
> >> > @@ -0,0 +1,89 @@
> >> > +// SPDX-License-Identifier: GPL-2.0
> >> > +
> >> > +//! Formatting utilities.
> >> > +
> >> > +use core::fmt;
> >>
> >> I think we should pub export all types that we are still using from
> >> `core::fmt`. For example `Result`, `Formatter`, `Debug` etc.
> >>
> >> That way I can still use the same pattern of importing `fmt` and then
> >> writing
> >>
> >>     impl fmt::Display for MyType {
> >>         fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {}
> >>     }
> >
> > Great idea, done for the next spin. It would be nice to be able to
> > lint against references to `core::fmt` outside of kernel/fmt.rs.
>
> I think there was something in clippy that can do that globally and we
> could allow that in this file?

I didn't find anything suitable. Do you have one in mind?

> >> > +
> >> > +/// Internal adapter used to route allow implementations of formatt=
ing traits for foreign types.
> >> > +///
> >> > +/// It is inserted automatically by the [`fmt!`] macro and is not m=
eant to be used directly.
> >> > +///
> >> > +/// [`fmt!`]: crate::prelude::fmt!
> >> > +#[doc(hidden)]
> >> > +pub struct Adapter<T>(pub T);
> >> > +
> >> > +macro_rules! impl_fmt_adapter_forward {
> >> > +    ($($trait:ident),* $(,)?) =3D> {
> >> > +        $(
> >> > +            impl<T: fmt::$trait> fmt::$trait for Adapter<T> {
> >> > +                fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::R=
esult {
> >> > +                    let Self(t) =3D self;
> >> > +                    fmt::$trait::fmt(t, f)
> >> > +                }
> >> > +            }
> >> > +        )*
> >> > +    };
> >> > +}
> >> > +
> >> > +impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary,=
 Pointer, LowerExp, UpperExp);
> >> > +
> >> > +/// A copy of [`fmt::Display`] that allows us to implement it for f=
oreign types.
> >> > +///
> >> > +/// Types should implement this trait rather than [`fmt::Display`].=
 Together with the [`Adapter`]
> >> > +/// type and [`fmt!`] macro, it allows for formatting foreign types=
 (e.g. types from core) which do
> >> > +/// not implement [`fmt::Display`] directly.
> >> > +///
> >> > +/// [`fmt!`]: crate::prelude::fmt!
> >> > +pub trait Display {
> >> > +    /// Same as [`fmt::Display::fmt`].
> >> > +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result;
> >> > +}
> >> > +
> >> > +impl<T: ?Sized + Display> Display for &T {
> >> > +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> >> > +        Display::fmt(*self, f)
> >> > +    }
> >> > +}
> >> > +
> >> > +impl<T: ?Sized + Display> fmt::Display for Adapter<&T> {
> >> > +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> >> > +        let Self(t) =3D self;
> >> > +        Display::fmt(t, f)
> >>
> >> Why not `Display::fmt(&self.0, f)`?
> >
> > I like destructuring because it shows me that there's only one field.
> > With `self.0` I don't see that.
>
> And what is the benefit here?

In general the benefit is that the method does not ignore some portion
of `Self`. A method that uses `self.0` would not provoke a compiler
error in case another field is added, while this form would.

>
> >> > +
> >> > +    let mut args =3D TokenStream::from_iter(first_opt);
> >> > +    {
> >> > +        let mut flush =3D |args: &mut TokenStream, current: &mut To=
kenStream| {
> >>
> >> You don't need to pass `args` as a closure argument, since you always
> >> call it with `&mut args`.
> >
> > This doesn't work because of the borrow checker. If I wrote what you
> > suggest, then `args` is mutably borrowed by the closure, which
> > prohibits the mutable borrow needed for the .extend() call here:
>
> Ahh right... Well then it's fine.
>
> ---
> Cheers,
> Benno
