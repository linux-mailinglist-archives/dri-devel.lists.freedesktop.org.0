Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB8AA8ABD5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 01:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2A910E162;
	Tue, 15 Apr 2025 23:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FYJNAyV7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A6310E162
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 23:09:20 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-3105ef2a06cso31161831fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 16:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744758559; x=1745363359; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I7Kcy+FpEQz078p0Ehtp32wqLtzAEaGTxMemghKhyto=;
 b=FYJNAyV7TYZ6k1OWefR3d044lLxoiT6G/o46YRRqiaYUONTDvS8fxaD5X8iQEl6hhe
 r4J+wrQt6XKrtOEeRvSOxkJdmoRI0I80j22vVVfqhZ51rs2YOBeSpkHVYZycJrTl2RXE
 ke5gGjPKb8bltdUkLife9w7sa20E7m4fnANnjfAkmV88tWnPT0PuJyRvAoKoD6J59u7E
 GCWEcx6xolqHWGHHV/RVDSOeG7lsXcwIwFO1Sv1AHcqFS4LgtcTfsqttqpkyAuethfgi
 qVpwIwx9V+llx9im+wmGsbnJF8kwnLZbS/3T7QjaAvP57o0jxC7CYR2WE/yPIMDtc0GH
 X8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744758559; x=1745363359;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I7Kcy+FpEQz078p0Ehtp32wqLtzAEaGTxMemghKhyto=;
 b=nx38bQxV2Mn9iO6JTr/B9acXRdVMjcpL9qq4reT8RMY/gr2w2R8bq0yABP8ZriivQd
 5pPOAmrNbUXv1selv4ZhXWqbN+IDnd1A+oTRp1rl9hKI3McGaRlDINItqZlITCqtCnKb
 bTKdA8vMmgiuWLpN4+/G3vvY3E3MVChgTrx5ozo++g6wT3TX26qsS0ogrMIMXWWL1Ysx
 3IyDIKMHv3Ew6U19wqKocs4w10TEHkR/uGBiX+nc9DT5wj+n9jnEsWT1WOEguDPhQW/2
 AchMulAQZvoI9hQYuXS/xxolRmJtPrZbzY+JIsr8+ItjGn1GGvwOv2/CsWZaa4qcTgFy
 D0kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOpQAcRZko32jrat2gptrsFByjiHZpIgT/2rvpfA3ByeJQMEJaA9IRm10mpCtriUTGXbnKRZgQP8I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzS/NnbYI8VFzKmbyQkVQj+IOl6qcwZKITFoqa/JOVXcY9uoQZL
 ZXCoUFYyTxnuR6WET3x7f7rtvBMcLnfK1m+mb2G8ri0dnaHp+8FmeQ36oUOQGR+Q1YzCCN2uE1K
 rOr+VvUUC527gZYCDrxaO4kx49Js=
X-Gm-Gg: ASbGncvB6Quzf8xqf9KdYngrQubHz/nJu2iUVQyl/XL7cwwqwO8SyAFP94mtzrI6wwV
 cAjvPsAhcoEyOcDGqUMG9TVDd8fdBabfjN2i/zUKvWrV8mThle8TZ7VpSD4HtHXhi0rnA/KPNJo
 4mB1B73xsagK6FTq+qcvUrGqPsF7DiLjROWUg++iqGh/1/zAenVc/iLR8=
X-Google-Smtp-Source: AGHT+IEOClcYh0ne13mL2B97v1ndd4wCIDRQP+Vb+U7dXrHL7d523qvWqArK1OI24MttcU2BoJUT4IQ2D71mhN0JVUM=
X-Received: by 2002:a2e:ad10:0:b0:30b:f924:3565 with SMTP id
 38308e7fff4ca-3107c340110mr2256771fa.37.1744758558236; Tue, 15 Apr 2025
 16:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250409-ptr-as-ptr-v8-0-3738061534ef@gmail.com>
 <20250409-ptr-as-ptr-v8-6-3738061534ef@gmail.com>
 <67fe9975.c80a0220.1b5785.66e7@mx.google.com>
 <CAJ-ks9mzyfvsxkyud_wLXfhLD_zP95bivCQ9i2aC-3ea=Y7+0A@mail.gmail.com>
 <67fea2d6.050a0220.8fa7f.6690@mx.google.com>
 <CAJ-ks9=G1ajyT8gwLHyvHW09Z2gG=Geg7LDS6iyRyqx_wyp5Sg@mail.gmail.com>
 <67fec6c1.0c0a0220.f907e.c6dd@mx.google.com>
 <CAJ-ks9mZ4qqRwQTWyGYgPy9kf3=od=zbvX67ELVgctU0t6qHuQ@mail.gmail.com>
 <67fee5a9.050a0220.25fe78.76d2@mx.google.com>
In-Reply-To: <67fee5a9.050a0220.25fe78.76d2@mx.google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 15 Apr 2025 19:08:42 -0400
X-Gm-Features: ATxdqUFEXFHyEGxkppQD4UFqWKx9xtKgQlsDNhukcdpShiLVI9K1fZVVqUnpnyg
Message-ID: <CAJ-ks9ni3iVY-PwUVdhxah325ovU5CWw=gfR+dhfPLGwDra8pQ@mail.gmail.com>
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

On Tue, Apr 15, 2025 at 7:03=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Tue, Apr 15, 2025 at 04:59:01PM -0400, Tamir Duberstein wrote:
> [...]
> > > > > > > > diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_=
id.rs
> > > > > > > > index 4063f09d76d9..37cc03d1df4c 100644
> > > > > > > > --- a/rust/kernel/device_id.rs
> > > > > > > > +++ b/rust/kernel/device_id.rs
> > > > > > > > @@ -136,7 +136,8 @@ impl<T: RawDeviceId, U, const N: usize>=
 IdTable<T, U> for IdArray<T, U, N> {
> > > > > > > >      fn as_ptr(&self) -> *const T::RawType {
> > > > > > > >          // This cannot be `self.ids.as_ptr()`, as the retu=
rn pointer must have correct provenance
> > > > > > > >          // to access the sentinel.
> > > > > > > > -        (self as *const Self).cast()
> > > > > > > > +        let this: *const Self =3D self;
> > > > > > >
> > > > > > > Hmm.. so this lint usually just requires to use a let stateme=
nt instead
> > > > > > > of as expression when casting a reference to a pointer? Not 1=
00%
> > > > > > > convinced this results into better code TBH..
> > > > > >
> > > > > > The rationale is in the lint description and quoted in the comm=
it
> > > > > > message: "Using `as` casts may result in silently changing muta=
bility
> > > > > > or type.".
> > > > > >
> > > > >
> > > > > Could you show me how you can silently change the mutability or t=
ype? A
> > > > > simple try like below doesn't compile:
> > > > >
> > > > >         let x =3D &42;
> > > > >         let ptr =3D x as *mut i32; // <- error
> > > > >         let another_ptr =3D x as *const i64; // <- error
> > > >
> > > > I think the point is that the meaning of an `as` cast can change wh=
en
> > > > the type of `x` changes, which can happen at a distance. The exampl=
e
> > >
> > > So my example shows that you can only use `as` to convert a `&T` into=
 a
> > > `*const T`, no matter how far it happens, and..
> >
> > I don't think you're engaging with the point I'm making here. Suppose
> > the type is `&mut T` initially and `as _` is being used to convert it
> > to `*mut T`; now if the type of `&mut T` changes to `*const T`, you hav=
e
> > completely different semantics.
> >
>
> You're right, I had some misunderstanding, the "`_`" part of `as _`
> seems to be a red herring, the problematic code snippet you meant can be
> shown as (without a `as _`):
>
>         f(x as *mut T); // f() takes a `*mut T`.
>
> where it compiles with `x` being either a `&mut T` or `*const T`, and
> `as` has different meanings in these cases.
>
> > >
> > > > shown in the clippy docs uses `as _`, which is where you get into r=
eal
> > > > trouble.
> > > >
> > >
> > > ... no matter whether `as _` is used or not. Of course once you have =
a
> > > `*const T`, using `as` can change it to a different type or mutabilit=
y,
> > > but that's a different problem. Your argument still lacks convincing
> > > evidences or examples showing this is a real trouble. For example, if
> > > you have a `x` of type `&i32`, and do a `x as _` somewhere, you will
> > > have a compiler error once compilers infers a type that is not `*cons=
t
> > > i32` for `_`. If your argument being it's better do the
> > > reference-to-pointer conversion explicitly, then that makes some sens=
e,
> > > but I still don't think we need to do it globablly.
> >
> > Can you help me understand what it is I need to convince you of? There
> > was prior discussion in
> > https://lore.kernel.org/all/D8PGG7NTWB6U.3SS3A5LN4XWMN@proton.me/,
> > where it was suggested to use this lint.
> >
> > I suppose in any discussion of a chance, we should also enumerate the
> > costs -- you're taking the position that the status quo is preferable,
> > yes? Can you help me understand why?
> >
>
> In this case the status quo is not having the lint, which allows users
> to convert a raw pointer from a reference with `as`. What you proposed
> in patch is to do the conversion with a stand-alone let statement, and
> that IMO doesn't suit all the cases: we are dealing with C code a lot,
> that means dealing raw pointers a lot, it's handy and logically tight if
> we have an expression that converts a Rust location into a raw pointer.
> And forcing let statements every time is not really reasonble because of
> this.
>
> Also I didn't get the problematic code the lint can prevent as well
> until very recent discussion in this thread.
>
> I would not say the status quo is preferable, more like your changes in
> this patch complicate some simple patterns which are reasonable to me.
> And it's also weird that we use a lint but don't use its suggestion.
>
> So in short, I'm not against this lint, but if we only use let-statement
> resolution, I need to understand why and as you said, we need to
> evaluate the cost.
>
> > >
> > > > > also from the link document you shared, looks like the suggestion=
 is to
> > > > > use core::ptr::from_{ref,mut}(), was this ever considered?
> > > >
> > > > I considered it, but I thought it was ugly. We don't have a linter =
to
> > > > enforce it, so I'd be surprised if people reached for it.
> > > >
> > >
> > > I think avoiding the extra line of `let` is a win, also I don't get w=
hy
> > > you feel it's *ugly*: having the extra `let` line is ugly to me ;-)
> >
> > I admit it's subjective, so I'm happy to change it. But I've never
> > seen that syntax used, and we lack enforcement for either one, so I
> > don't find much value in arguing over this.
> >
>
> If the original code use "as" for conversion purposes, I think it's good
> to be consistent and using from_ref() or from_mut(): they are just
> bullet-proof version of conversions, and having a separate let statement
> looks like a distraction to me. If for new code, and the author has a
> reason for let statement, then it's fine.

Fine by me. I'll change the let statements to those methods on the next spi=
n.

Thanks for your feedback.
Tamir
