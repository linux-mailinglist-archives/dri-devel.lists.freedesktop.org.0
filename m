Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0D2AF83A4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 00:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3390E10E912;
	Thu,  3 Jul 2025 22:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NqJotm/T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A4210E912;
 Thu,  3 Jul 2025 22:42:01 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-32e14ce168eso4131081fa.1; 
 Thu, 03 Jul 2025 15:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751582520; x=1752187320; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D1Qg1F6O8BBVdVvv4eHMsC5wNUKHIHHTTLEMuZoIZA4=;
 b=NqJotm/TXHRxrxEFY4AMfHZ9plp1kHR/lyOP8YP0ug4VESKm4Bh9rPODV1VZe3Motv
 GyfjfPVohYe5UupBuaN3UhQUfZFJTcnW4NaM8eh6shptk/KdxgHMe7fPXLgruWJ/fIQS
 vJS0UgU5yeSIfcFGJ1no6DwvSkWeWQ9mPsYzXUorJw1YjDNgWxZ5m/X1FGRjjgxhP5my
 dAv822ltn30WdINpt13ZhtvE/RvHy09fHebTL9VLOScNfuHkKSPt6OtO3xZbR5IhjY1W
 YRwclpKajChpKB8X/fbkXjhw92vunf45dVbesINHlfwLfZ9HUoIC37fK1tySIfNr5Q1o
 vcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751582520; x=1752187320;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D1Qg1F6O8BBVdVvv4eHMsC5wNUKHIHHTTLEMuZoIZA4=;
 b=hw1TOpDx1+iasUsza1g/HCbnXHrzF7kuy1TsD0ThKCp3T7zfOS+eBW6g/DGv5RCnA0
 ljJ+5PnXd0EnEn/630M4mRV1RzTBTI2g2f6/AVFLIVMIHOPwMenXCtDlUhL/Jyd8WAZC
 ZJeRDo8SqOYKVJPUhTJGyMbINkMTwsmBjLJ5fPMo29x6fCs/0qDk1GVi3FPtmGeozOgz
 2CSFFZtd4Mv0C/Ks60d5cPKuCgc5OBlZwwxBTWovRBKqQPqNFYwqp3vcYKrc4jV27k7w
 Z5twX+yg57EjqS5MAQIDUYj/4assiZ9ZV9yMvXjXVwyYTpDe8GY7DIGcsH7ANsM4nrgD
 rH9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHIZ402kVlCRzyyjXZzWUljsPvkhEs8ZQIj3WqE1gXtaB2jZILlpkYdwdP+qPG9B09kZRMvVxJcpM=@lists.freedesktop.org,
 AJvYcCUK6OxBIIYXxs6Wbykdokv1nQQg+2PJ6lLqpqahY4kJWHyET66dGOqFo+jqcxbzrmT0Nj58/Pdh0w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5PDdgJ3tS3qBn7hak7/2aEWdrrMyhrArbSW+4j1ZOTWkwYYDB
 iVz+8jXMH5tNUftL7dtBqNZwUBKuj1pblOZycZPYWo9F/wtrENMiTQGQeB0zHX8zTeDqwKM+H73
 qQFc/05ONNggTarYgRf19zgWXueipmw8=
X-Gm-Gg: ASbGnctd+NynoSHQc7CTlwswHeS+VE83AR0vKS52+lG2YU/MCEOKkM9blKrO/YpIh3K
 NDDKtTYb1JcEiI5vp3+QYpEi4doZePOuk6o+gJdQvfvsPsplDjOjdItNljgFGuNTL2PglIBwq2m
 MIp4rFkJHPmaW8W6lqlbeFXYqMDzArXblDFs2fS6dKDT9stJVe9+6vPa7RKVdLoxCG1YrQBzVhb
 ZLmJQ==
X-Google-Smtp-Source: AGHT+IF/t3ZEtmjCL9D2hV/pUOr7MKQyCU+hJLvbY3a+HlkEEdLNrViyvM7S6Yvq56dYm7fbL0DEEZ7CtTi3HmveDVA=
X-Received: by 2002:a2e:b8d5:0:b0:32a:6312:bfc1 with SMTP id
 38308e7fff4ca-32e5f5e9318mr633481fa.24.1751582519435; Thu, 03 Jul 2025
 15:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
 <20250701-cstr-core-v13-2-29f7d3eb97a6@gmail.com>
 <DB2BDSN1JH51.14ZZPETJORBC6@kernel.org>
 <CAJ-ks9nC=AyBPXRY3nJ0NuZvjFskzMcOkVNrBEfXD2hZ5uRntQ@mail.gmail.com>
 <DB2IJ9HBIM0W.3N0JVGKX558QI@kernel.org>
 <CAJ-ks9nF5+m+_bn0Pzi9yU0pw0TyN7Fs4x--mQ4ygyHz4A6hzg@mail.gmail.com>
 <DB2PIGAQHCJR.3BF8ZHECYH3KB@kernel.org>
In-Reply-To: <DB2PIGAQHCJR.3BF8ZHECYH3KB@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 3 Jul 2025 18:41:23 -0400
X-Gm-Features: Ac12FXx5T1CWZv8EzyusKcnGahP16LvJ8y4OiMbwugKJnpUmBKST0YNjwC9XD5U
Message-ID: <CAJ-ks9=WmuXLJ6KkMEOP2jTvM_YBJO10SNsq0DU2J+_d4jp7qw@mail.gmail.com>
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

On Thu, Jul 3, 2025 at 4:36=E2=80=AFPM Benno Lossin <lossin@kernel.org> wro=
te:
>
> On Thu Jul 3, 2025 at 8:55 PM CEST, Tamir Duberstein wrote:
> > On Thu, Jul 3, 2025 at 11:08=E2=80=AFAM Benno Lossin <lossin@kernel.org=
> wrote:
> >> On Thu Jul 3, 2025 at 3:55 PM CEST, Tamir Duberstein wrote:
> >> > On Thu, Jul 3, 2025 at 5:32=E2=80=AFAM Benno Lossin <lossin@kernel.o=
rg> wrote:
> >> >> On Tue Jul 1, 2025 at 6:49 PM CEST, Tamir Duberstein wrote:
> >> >> > Introduce a `fmt!` macro which wraps all arguments in
> >> >> > `kernel::fmt::Adapter` and a `kernel::fmt::Display` trait. This e=
nables
> >> >> > formatting of foreign types (like `core::ffi::CStr`) that do not
> >> >> > implement `core::fmt::Display` due to concerns around lossy conve=
rsions which
> >> >> > do not apply in the kernel.
> >> >> >
> >> >> > Replace all direct calls to `format_args!` with `fmt!`.
> >> >> >
> >> >> > Replace all implementations of `core::fmt::Display` with implemen=
tations
> >> >> > of `kernel::fmt::Display`.
> >> >> >
> >> >> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> >> >> > Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089=
-General/topic/Custom.20formatting/with/516476467
> >> >> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> >> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> >> >> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> >> >> > ---
> >> >> >  drivers/block/rnull.rs       |  2 +-
> >> >> >  drivers/gpu/nova-core/gpu.rs |  4 +-
> >> >> >  rust/kernel/block/mq.rs      |  2 +-
> >> >> >  rust/kernel/device.rs        |  2 +-
> >> >> >  rust/kernel/fmt.rs           | 89 ++++++++++++++++++++++++++++++=
+++++++++
> >> >> >  rust/kernel/kunit.rs         |  6 +--
> >> >> >  rust/kernel/lib.rs           |  1 +
> >> >> >  rust/kernel/prelude.rs       |  3 +-
> >> >> >  rust/kernel/print.rs         |  4 +-
> >> >> >  rust/kernel/seq_file.rs      |  2 +-
> >> >> >  rust/kernel/str.rs           | 22 ++++------
> >> >> >  rust/macros/fmt.rs           | 99 ++++++++++++++++++++++++++++++=
++++++++++++++
> >> >> >  rust/macros/lib.rs           | 19 +++++++++
> >> >> >  rust/macros/quote.rs         |  7 ++++
> >> >> >  scripts/rustdoc_test_gen.rs  |  2 +-
> >> >> >  15 files changed, 236 insertions(+), 28 deletions(-)
> >> >>
> >> >> This would be a lot easier to review if he proc-macro and the call
> >> >> replacement were different patches.
> >> >>
> >> >> Also the `kernel/fmt.rs` file should be a different commit.
> >> >
> >> > Can you help me understand why? The changes you ask to be separated
> >> > would all be in different files, so why would separate commits make =
it
> >> > easier to review?
> >>
> >> It takes less time to go through the entire patch and give a RB. I can
> >> take smaller time chunks and don't have to get back into the entire
> >> context of the patch when I don't have 30-60min available.
> >
> > Ah, I see what you mean. Yeah, the requirement to RB the entire patch
> > does mean there's a benefit to smaller patches.
> >
> >> In this patch the biggest problem is the rename & addition of new
> >> things, maybe just adding 200 lines in those files could be okay to go
> >> together, see below for more.
> >
> > After implementing your suggestion of re-exporting things from
> > `kernel::fmt` the diffstat is
> >
> > 26 files changed, 253 insertions(+), 51 deletions(-)
> >
> > so I guess I could do all the additions in one patch, but then
> > *everything* else has to go in a single patch together because the
> > formatting macros either want core::fmt::Display or
> > kernel::fmt::Display; they can't work in a halfway state.
>
> I don't understand, can't you just do:
>
> * add `rust/kernel/fmt.rs`,
> * add `rust/macros/fmt.rs`,
> * change all occurrences of `core::fmt` to `kernel::fmt` and
>   `format_args!` to `fmt!`.

Yes, such a split could be done - I will do so in the next spin


> The last one could be split by subsystem, no? Some subsystems might
> interact and thus need simultaneous splitting, but there should be some
> independent ones.

Yes, it probably can. As you say, some subsystems might interact - the
claimed benefit of doing this subsystem-by-subsystem split is that it
avoids conflicts with ongoing work that will conflict with a large
patch, but this is also the downside; if ongoing work changes the set
of interactions between subsystems then a maintainer may find
themselves unable to emit the log message they want (because one
subsystem is using kernel::fmt while another is still on core::fmt).

>
> >> > I prefer to keep things in one commit because the changes are highly
> >> > interdependent. The proc macro doesn't make sense without
> >> > kernel/fmt.rs and kernel/fmt.rs is useless without the proc macro.
> >>
> >> I think that `Adapter`, the custom `Display` and their impl blocks
> >> don't need to be in the same commit as the proc-macro. They are relate=
d,
> >> but maybe someone is not well-versed in proc-macros and thus doesn't
> >> want to review that part.
> >
> > Sure, I guess I will split them. But as noted above: changing the
> > formatting macros and all the types' trait implementations has to be a
> > "flag day" change.
>
> See above.
>
> >> >> > +impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Bina=
ry, Pointer, LowerExp, UpperExp);
> >> >> > +
> >> >> > +/// A copy of [`fmt::Display`] that allows us to implement it fo=
r foreign types.
> >> >> > +///
> >> >> > +/// Types should implement this trait rather than [`fmt::Display=
`]. Together with the [`Adapter`]
> >> >> > +/// type and [`fmt!`] macro, it allows for formatting foreign ty=
pes (e.g. types from core) which do
> >> >> > +/// not implement [`fmt::Display`] directly.
> >> >> > +///
> >> >> > +/// [`fmt!`]: crate::prelude::fmt!
> >> >> > +pub trait Display {
> >> >> > +    /// Same as [`fmt::Display::fmt`].
> >> >> > +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result;
> >> >> > +}
> >> >> > +
> >> >> > +impl<T: ?Sized + Display> Display for &T {
> >> >> > +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> >> >> > +        Display::fmt(*self, f)
> >> >> > +    }
> >> >> > +}
> >> >> > +
> >> >> > +impl<T: ?Sized + Display> fmt::Display for Adapter<&T> {
> >> >> > +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> >> >> > +        let Self(t) =3D self;
> >> >> > +        Display::fmt(t, f)
> >> >>
> >> >> Why not `Display::fmt(&self.0, f)`?
> >> >
> >> > I like destructuring because it shows me that there's only one field=
.
> >> > With `self.0` I don't see that.
> >>
> >> And what is the benefit here?
> >
> > In general the benefit is that the method does not ignore some portion
> > of `Self`. A method that uses `self.0` would not provoke a compiler
> > error in case another field is added, while this form would.
>
> Yeah, but why would that change happen here? And even if it got another
> field, why would that invalidate the impl of `fn fmt`?

I don't know, but I would rather force a person to make that decision
when they add another field rather than assume that such an addition
wouldn't require changes here.
