Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A11EAC516B
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 16:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C4F10E178;
	Tue, 27 May 2025 14:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NG6HPwxK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751D189F49;
 Tue, 27 May 2025 14:57:49 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-3106217268dso31590761fa.1; 
 Tue, 27 May 2025 07:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748357868; x=1748962668; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SNE3eNQigcgAPplki00LvwTSib7PfNi6+3iBJNr9+88=;
 b=NG6HPwxK713ughst6Vnmk3ciLetc+DpFSMx30ZvyeRpg/DHaw48WTF4h1xfxUpoRNP
 ntxAhJT2cZApUqA4zmyKRDmEiEiGAQ2J1rT5op0N6OOeErVsFidXqt5/8MNcr9c4JkAR
 z0ty8+scYTQEnY/fHIBJbmnlugQWId0l272Pz4BspFxKG0wLewx7RdaZnjl2Xt1I5YWM
 XhTPSEPfXyUOyOiSnGWYm9BDDsAYNf0mV02Ogfvll+x/+7FJfIkh8vfU+hhDeB2i9hMv
 vyDBDorfQcCeRFjlVVxaP2FjlmsAsb8Va0nHPiA8shec8W4hlGlZbzwgopprpe1RP+AX
 7BMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748357868; x=1748962668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SNE3eNQigcgAPplki00LvwTSib7PfNi6+3iBJNr9+88=;
 b=Q/K51fbagPV27AKVmWLGGmAs9RuQ9q6vTrfFmYkOlHUlTzc6+re47uAb5X+fHNYGmj
 fGwa5wJ/pNRoxJ0u4LuRuWUCBYw4nwACnnoxOPffpJLfITAwYvdFv3BCH2weMU7DixsQ
 rWg/1Nv7zWDJzjxCIrI3R7KTi4qPvraX81hp9VesV7egF4ieltIWbA9i0GSgzWPSumBT
 NwH4dp79M0o000t6p6Vbbk0BorFBSA6YqVLszwleRPsD1t0Q8O6jtPlnTbv05rDBRop2
 v3AN6PGkGoOQc3MELcDYxEKxqe5hm8V6Nra9fyG2v7Mpfis42tqr8OydOghFXXrw4jms
 iKUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUqDFMpUvQ5/rHF7W8q/tE5nBb/M591aefDAkkID/c2VhKR7q2Q8ox50aDp4HvVjg0VjScaI6/QQo=@lists.freedesktop.org,
 AJvYcCVl16MYyaygez5Ik6jGqNbrJB5UhZPZTHG+ZrGQOHmB2GQM2RApCb3TTrwzT6ahkgURzB8lYc2yZw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFngkoaiyoT45iEVfITlbKhRWIocs9Zb4WKp+U4QhEPFXblMof
 +fo/1mJqld9ebM9P9tV3bubM7naF1stAOXwnLGI6WyzkCUCMOsUJ9BGAXBD0lPoCDCYsDbkhY4E
 ytTqC2o7Bdy9uTzIBloiz7bobKAIRXvc=
X-Gm-Gg: ASbGncvJ1nmGO042akD/LKQcgwXkMER2fnrbYgOd3FkbbvkGFnIsjTxR3wufV4KgMH4
 TgLfMMtbWfCKAG3RIob72hSciqDZkL7nxQHycj54Q3nT6tAkbx9hQ79ZM1djx+CNRUBlYzUDfQ+
 TSmkF5fOXT8fpSTniK5yFbKtfzV7u8zQQkGcYSaDQF86AE5aB6
X-Google-Smtp-Source: AGHT+IGMpsgNs0H0v36WCubbxlinvgNLfiVk9IX6EmewrCYJWnUCTsflWg1QTkNc19iE0AzQz3ot/ZAJjdnwjF/SkXc=
X-Received: by 2002:a2e:8a93:0:b0:32a:604c:504e with SMTP id
 38308e7fff4ca-32a604c5122mr6252591fa.38.1748357867433; Tue, 27 May 2025
 07:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
 <20250524-cstr-core-v10-2-6412a94d9d75@gmail.com>
 <DA66BBX1PDGI.10NHLG3D4CIT7@kernel.org>
 <CAJ-ks9m48gmar0WWP9WknV2JLqkKNU0X4nwXaQ+JdG+b-EcVxA@mail.gmail.com>
 <CAH5fLgiUhvp9P7oSf4Rtv5jK1SNebW9-r5YFHVzCZjEwaR=Mjg@mail.gmail.com>
In-Reply-To: <CAH5fLgiUhvp9P7oSf4Rtv5jK1SNebW9-r5YFHVzCZjEwaR=Mjg@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 27 May 2025 10:57:11 -0400
X-Gm-Features: AX0GCFv2oY8lzrXQtwfj6_dQyq0RFoGjtHhR6-NzX_hnZZ_7RGNdHOXxleigo1M
Message-ID: <CAJ-ks9=prR2TNFhqip8MsjtTWKkoUhoMG75v2mSLF1UaRNwJLg@mail.gmail.com>
Subject: Re: [PATCH v10 2/5] rust: support formatting of foreign types
To: Alice Ryhl <aliceryhl@google.com>
Cc: Benno Lossin <lossin@kernel.org>,
 Michal Rostecki <vadorovsky@protonmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
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
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
 nouveau@lists.freedesktop.org, linux-block@vger.kernel.org
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

On Tue, May 27, 2025 at 8:44=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Tue, May 27, 2025 at 12:18=E2=80=AFAM Tamir Duberstein <tamird@gmail.c=
om> wrote:
> > > > +}
> > > > +
> > > > +fn make_ident<'a, T: IntoIterator<Item =3D &'a str>>(
> > > > +    span: Span,
> > > > +    names: T,
> > > > +) -> impl Iterator<Item =3D TokenTree> + use<'a, T> {
> > > > +    names.into_iter().flat_map(move |name| {
> > > > +        [
> > > > +            TokenTree::Punct(Punct::new(':', Spacing::Joint)),
> > > > +            TokenTree::Punct(Punct::new(':', Spacing::Alone)),
> > > > +            TokenTree::Ident(Ident::new(name, span)),
> > > > +        ]
> > > > +    })
> > > > +}
> > > > diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> > > > index d31e50c446b0..fa956eaa3ba7 100644
> > > > --- a/rust/macros/lib.rs
> > > > +++ b/rust/macros/lib.rs
> > > > @@ -10,6 +10,7 @@
> > > >  mod quote;
> > > >  mod concat_idents;
> > > >  mod export;
> > > > +mod fmt;
> > > >  mod helpers;
> > > >  mod kunit;
> > > >  mod module;
> > > > @@ -196,6 +197,24 @@ pub fn export(attr: TokenStream, ts: TokenStre=
am) -> TokenStream {
> > > >      export::export(attr, ts)
> > > >  }
> > > >
> > > > +/// Like [`core::format_args!`], but automatically wraps arguments=
 in [`kernel::fmt::Adapter`].
> > > > +///
> > > > +/// This macro allows generating `core::fmt::Arguments` while ensu=
ring that each argument is wrapped
> > > > +/// with `::kernel::fmt::Adapter`, which customizes formatting beh=
avior for kernel logging.
> > > > +///
> > > > +/// Named arguments used in the format string (e.g. `{foo}`) are d=
etected and resolved from local
> > > > +/// bindings. All positional and named arguments are automatically=
 wrapped.
> > > > +///
> > > > +/// This macro is an implementation detail of other kernel logging=
 macros like [`pr_info!`] and
> > > > +/// should not typically be used directly.
> > > > +///
> > > > +/// [`kernel::fmt::Adapter`]: ../kernel/fmt/struct.Adapter.html
> > > > +/// [`pr_info!`]: ../kernel/macro.pr_info.html
> > > > +#[proc_macro]
> > > > +pub fn fmt(input: TokenStream) -> TokenStream {
> > >
> > > I'm wondering if we should name this `format_args` instead in order t=
o
> > > better communicate that it's a replacement for `core::format_args!`.
> >
> > Unfortunately that introduces ambiguity in cases where
> > kernel::prelude::* is imported because core::format_args is in core's
> > prelude.
>
> I'm pretty sure that glob imports are higher priority than the core
> prelude? Or is this because there are macros that now incorrectly use
> kernel::prelude::format_args when they should use the one from core?

compiler says no, e.g.:

error[E0659]: `format_args` is ambiguous
    --> rust/doctests_kernel_generated.rs:8783:25
     |
8783 |     kernel::kunit::info(format_args!("    #
rust_doctest_kernel_workqueue_rs_3.location:
rust/kernel/workqueue.rs:77\n"));
     |                         ^^^^^^^^^^^ ambiguous name
     |
     =3D note: ambiguous because of a conflict between a name from a
glob import and an outer scope during import or macro resolution
     =3D note: `format_args` could refer to a macro from prelude
note: `format_args` could also refer to the macro imported here
    --> rust/doctests_kernel_generated.rs:8772:9
     |
8772 |     use kernel::prelude::*;
     |         ^^^^^^^^^^^^^^^^^^
     =3D help: consider adding an explicit import of `format_args` to disam=
biguate
