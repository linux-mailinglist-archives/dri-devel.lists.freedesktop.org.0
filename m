Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEFFA714EF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 11:36:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CFA510E6A3;
	Wed, 26 Mar 2025 10:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YXeKllph";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D118410E6A3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 10:35:57 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-30c05fd126cso58525541fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 03:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742985356; x=1743590156; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W5AiCDUgeTdwDyc9crOgWfabxPyQS/xAXOnubihQEcg=;
 b=YXeKllphxdFWYv+oba5bVk4b++f6hxeD/xc969jIrHp0y0wZlkvRo7dQUWhrg9jvQx
 Z6d8503nP1wAFx/nMse5dI0kX4FAonmqZ/oe1Uv2g53nL6jB+2zQmddhffk5l980t4s6
 wzu0X/yn1v//H2jgOsieHRUz92eW0d4BlkZtA+RU6G9a7BYnIO1uD5DU1/hmBk5Jv0lC
 3c55PqEq6GZNHWLC7429+79NCWAHn8d8vnlFk3AYPDZXHdpzxPybbX3KLI60bw/B4UPn
 x8mKeeXcSqa9lOJuoyF2QIVK+bC+ibfJ4N8IWOHJjnbvEEJqTRmLgn+v8WOuwe0bwTAz
 dN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742985356; x=1743590156;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W5AiCDUgeTdwDyc9crOgWfabxPyQS/xAXOnubihQEcg=;
 b=um8VOsYY0b+D3IcwZRvN6aubtsAxxup1jnFgYC0Hu357MByi4ZJBnkz+gVeCSSCMS2
 V2u0cf2zdcZ9g8cneCVtEXvXYEm35k+vdxHIVs2EeM4A0cyH+UWeS6WvjvyDEfmanUdW
 Fi/pG5IuAzUSQf7zjhtKHuFKZ7UCstR16dSbcvRH4C3F7B4oq32cppkoFdUae/QBCe1e
 ZwOAz0GPOHk+deaHqPphCLKxczwze0fXRGx9jKHnJUU4rXQWSCNz60Ya5qQzxsby+KE3
 bl8hIw+YwIU5Y72z/u3ecI3gaQMkyzapzA5AcTHwYLWysaUdhCs/FKy2G2WLzoI3egBp
 1d1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIPNA3rKdLtH+qa6bXZjlph2fq5k/c3nfe5oKsbhF06BHsBGVL1Hg8Nt4hzseFxLUKLZ3iYac57Ro=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxVOXG24HWvWf+o3gL6Wgu6ZzuKNXZYlFe7iJd3Sv0JHJj4wlf
 +Obv0TJJr10B8WfwSrcmnYk1AAs4+n9YeSRPKOccrtjr5vEHoxL9teeX2fy+bAY4BxUepch9mz4
 3GElkVgsEZRexyx+vYsWh331AMWk=
X-Gm-Gg: ASbGncuQ0PT1+XsUVtDEoacxlfmYjIMf0Gn+wz0bhAVx0JY9dX6WaN6gWW8hhXgaxrs
 4vgu21VTSphreeyfrCUquNrBB2vrSLnV7v+3nafzzW5AOEPwyOCe3KbiI2TyE7pYOWKJzy8MhY7
 lEgi+CtPz4c24UYF2ugTDLfXdJ5MVEN4vydj4+Na4wtbG8zJuXZaur9BQoZJc=
X-Google-Smtp-Source: AGHT+IH0DKwACe1nymEzj0ftx+SgXxFXIMCVyyNtqlvCyo9K6/6zTdS4KoA/gl5ad9HnVZ30KIalN9jorXqZaQaGEEE=
X-Received: by 2002:a2e:6a05:0:b0:308:ec25:9004 with SMTP id
 38308e7fff4ca-30d7e2bb98dmr75572281fa.35.1742985355748; Wed, 26 Mar 2025
 03:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250325-ptr-as-ptr-v7-0-87ab452147b9@gmail.com>
 <20250325-ptr-as-ptr-v7-7-87ab452147b9@gmail.com>
 <D8POWLFKWABG.37BVXN2QCL8MP@proton.me>
 <CAJ-ks9mUYw4FEJQfmDrHHt0oMy256jhp7qZ-CHp6R5c_sOCD4w@mail.gmail.com>
 <D8PPIYIJCNX8.13VPQULEI0ALN@proton.me>
 <CAJ-ks9k6220j6CQSOF4TDrgY9qq4PfV9uaMXz1Qk4m=eeSr5Ag@mail.gmail.com>
 <D8Q4MSXXZ7OI.1NC226MO02VSN@proton.me>
In-Reply-To: <D8Q4MSXXZ7OI.1NC226MO02VSN@proton.me>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 26 Mar 2025 06:35:19 -0400
X-Gm-Features: AQ5f1JrL9k74M9QnPZ9eBW9sSNazpeGZMopS8Asu-Kcyr5Yu4M92EoF_Ba4pH7Y
Message-ID: <CAJ-ks9nHKpQPuSBypXTSATYhbAFkQTJzUq8jN0nu4t=Kw+0xxg@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] rust: enable `clippy::ref_as_ptr` lint
To: Benno Lossin <benno.lossin@proton.me>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-pci@vger.kernel.org, linux-block@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 netdev@vger.kernel.org
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

On Wed, Mar 26, 2025 at 6:31=E2=80=AFAM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On Wed Mar 26, 2025 at 12:54 AM CET, Tamir Duberstein wrote:
> > On Tue, Mar 25, 2025 at 6:40=E2=80=AFPM Benno Lossin <benno.lossin@prot=
on.me> wrote:
> >> On Tue Mar 25, 2025 at 11:33 PM CET, Tamir Duberstein wrote:
> >> > On Tue, Mar 25, 2025 at 6:11=E2=80=AFPM Benno Lossin <benno.lossin@p=
roton.me> wrote:
> >> >> On Tue Mar 25, 2025 at 9:07 PM CET, Tamir Duberstein wrote:
> >> >> > diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> >> >> > index 40034f77fc2f..6233af50bab7 100644
> >> >> > --- a/rust/kernel/str.rs
> >> >> > +++ b/rust/kernel/str.rs
> >> >> > @@ -29,7 +29,7 @@ pub const fn is_empty(&self) -> bool {
> >> >> >      #[inline]
> >> >> >      pub const fn from_bytes(bytes: &[u8]) -> &Self {
> >> >> >          // SAFETY: `BStr` is transparent to `[u8]`.
> >> >> > -        unsafe { &*(bytes as *const [u8] as *const BStr) }
> >> >> > +        unsafe { &*(core::mem::transmute::<*const [u8], *const S=
elf>(bytes)) }
> >> >>
> >> >> Hmm I'm not sure about using `transmute` here. Yes the types are
> >> >> transparent, but I don't think that we should use it here.
> >> >
> >> > What's your suggestion? I initially tried
> >> >
> >> > let bytes: *const [u8] =3D bytes;
> >> > unsafe { &*bytes.cast() }
> >> >
> >> > but that doesn't compile because of the implicit Sized bound on poin=
ter::cast.
> >>
> >> This is AFAIK one of the only places where we cannot get rid of the `a=
s`
> >> cast. So:
> >>
> >>     let bytes: *const [u8] =3D bytes;
> >>     // CAST: `BStr` transparently wraps `[u8]`.
> >>     let bytes =3D bytes as *const BStr;
> >>     // SAFETY: `bytes` is derived from a reference.
> >>     unsafe { &*bytes }
> >>
> >> IMO a `transmute` is worse than an `as` cast :)
> >
> > Hmm, looking at this again we can just transmute ref-to-ref and avoid
> > pointers entirely. We're already doing that in
> > `CStr::from_bytes_with_nul_unchecked`
> >
> > Why is transmute worse than an `as` cast?
>
> It's right in the docs: "`transmute` should be the absolute last
> resort." [1]. IIRC, Gary was a bit more lenient in its use, but I think
> we should avoid it as much as possible such that people copying code or
> taking inspiration also don't use it.
>
> So for both cases I'd prefer an `as` cast.
>
> [1]: https://doc.rust-lang.org/std/mem/fn.transmute.html

I don't follow the logic. The trouble with `as` casts is that they are
very lenient in what they allow, and to do these conversions with `as`
casts requires ref -> pointer -> pointer -> pointer deref versus a
single transmute. The safety comment perfectly describes why it's OK
to do: the types are transparent. So why is `as` casting pointers
better? It's just as unchecked as transmuting, and worse, it requires
a raw pointer dereference.
