Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC06A71C89
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 17:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0A010E751;
	Wed, 26 Mar 2025 16:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ca5b7zH3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E52210E759
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 16:58:01 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30c461a45f8so1055321fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 09:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743008279; x=1743613079; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YqICdU+/Fj/rPyvr8c71jUD3Qz8HzL0I+xuDALYEeNo=;
 b=Ca5b7zH34c1FzNiLgxSQOXP5j7iTxgAP7yVmvb/ehKwcPbjFwOS+yk3p78yG3PebWU
 69RHGI+6ODFSSp6dxFstG7fPQCfXwU3+MEcYvcAleqqvjCS8hBNS9WVWDqKA/EZvKHbo
 Sm1/kkjnu/7WhKTEIIrLlyiv7WgmTRLuiWp/ec9i6wc/EOyE3/OHoJUix+uIyercwju5
 xpAqpmKR0/wIFjj4MC9n1RAZG/b7riaKcHtgwEMqmnOtHi4Sk5Q3+H6PYbEsRo+2X7Kg
 ao0qqY4xteIwcyiB8HpvBw9Egcme9wTuh+ewQ6pQBuP/tg697BoRSHWo66oEPxVSMhfR
 XTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743008279; x=1743613079;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YqICdU+/Fj/rPyvr8c71jUD3Qz8HzL0I+xuDALYEeNo=;
 b=cyFbPrU21nfLNIJpHlx24tG701Zo52qf4xe2q1thcb6iwA1oHWvlucIAux86gN+vYI
 6OS7LTa4ko8C3pxvHCZ87jO+D+mah19jaywUqIZXgmU+EtzUgUsJbXcv5vQLIhed4bza
 ob2teHvp2z44NP7UpGaVbV6lras2Y2TsC8JcNsjujTMP5rQCOoWs4hdzwP3unhhgS3pn
 h62izOyzxI5pTN71wTiEMEYfRfPTIQqE5xS1MuL19UsunkYM85mrpV7oSNSIwUuO6oiS
 HCYHWkfwfjtG+4VDXrXY484VqJcpuGt70bQw6QTHQ6xIWX+G2/OmXRmRvR8mathev0tW
 YyQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKGXjvvNVToI4od5CGhv4C/W9u00U64TjvEGrzEZvRGpLku7aLF7ArCsjBtcVqDRlyGhI+Cuz5uQ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSELel2LzHoeUG5Qy29jdsYq8NNmSYvN4QNUjo5Jos8Q/6SYZQ
 z6x0rFdKxPg1iqiQrnIkjGHcftOxBSJqpymVLsAe7D7uUREXs8o7eunjbPEmqIKaTzjQ30qxmCH
 DM2ewmvmDTUGp230b4sWZh17hASk=
X-Gm-Gg: ASbGncs+xbimuSbetN91E3eRg+ZqHjRkkY4Fpod3GQZ9yUhuCAXRlZVpFJNn5DJii+L
 5gmuy9ynTxD1Vft32coaBPoUsNvDzm29SY7hFVrXpxlXxMSmHCA92EULOK1mwZ6xQOw14NPw9WK
 2WWg5WJCJR6IsAn/KQoCJSffbdMLXjsHxzL4cK472t6A==
X-Google-Smtp-Source: AGHT+IHPmamLHlMJlHI8sBUo4uWAXvfGRb8nW0bPTmn1FCPvvjT2j+y8ppF5Dq8MM/1VqdX3RkASobn3JxoYQd4Kpg4=
X-Received: by 2002:a2e:a901:0:b0:302:48fd:6922 with SMTP id
 38308e7fff4ca-30dc5f4fc11mr2688291fa.37.1743008279197; Wed, 26 Mar 2025
 09:57:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250325-ptr-as-ptr-v7-0-87ab452147b9@gmail.com>
 <20250325-ptr-as-ptr-v7-7-87ab452147b9@gmail.com>
 <D8POWLFKWABG.37BVXN2QCL8MP@proton.me>
 <CAJ-ks9mUYw4FEJQfmDrHHt0oMy256jhp7qZ-CHp6R5c_sOCD4w@mail.gmail.com>
 <D8PPIYIJCNX8.13VPQULEI0ALN@proton.me>
 <CAJ-ks9k6220j6CQSOF4TDrgY9qq4PfV9uaMXz1Qk4m=eeSr5Ag@mail.gmail.com>
 <D8Q4MSXXZ7OI.1NC226MO02VSN@proton.me>
 <CAJ-ks9nHKpQPuSBypXTSATYhbAFkQTJzUq8jN0nu4t=Kw+0xxg@mail.gmail.com>
 <D8QCK3CQES3Y.3LTZ4MVO5B3KT@proton.me>
In-Reply-To: <D8QCK3CQES3Y.3LTZ4MVO5B3KT@proton.me>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 26 Mar 2025 12:57:22 -0400
X-Gm-Features: AQ5f1JqRV6BswIsFmo4Lj79OnLQkYDCkrkMtDbiR3sIOJuzkCqt-e4S8pI8XxRU
Message-ID: <CAJ-ks9nKT2PUDm6=b4AB1QUWwwvcqPn7Vz60=c0B+uFMZrqPew@mail.gmail.com>
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

On Wed, Mar 26, 2025 at 12:43=E2=80=AFPM Benno Lossin <benno.lossin@proton.=
me> wrote:
>
> On Wed Mar 26, 2025 at 11:35 AM CET, Tamir Duberstein wrote:
> > On Wed, Mar 26, 2025 at 6:31=E2=80=AFAM Benno Lossin <benno.lossin@prot=
on.me> wrote:
> >> On Wed Mar 26, 2025 at 12:54 AM CET, Tamir Duberstein wrote:
> >> > On Tue, Mar 25, 2025 at 6:40=E2=80=AFPM Benno Lossin <benno.lossin@p=
roton.me> wrote:
> >> >> On Tue Mar 25, 2025 at 11:33 PM CET, Tamir Duberstein wrote:
> >> >> > On Tue, Mar 25, 2025 at 6:11=E2=80=AFPM Benno Lossin <benno.lossi=
n@proton.me> wrote:
> >> >> >> On Tue Mar 25, 2025 at 9:07 PM CET, Tamir Duberstein wrote:
> >> >> >> > diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> >> >> >> > index 40034f77fc2f..6233af50bab7 100644
> >> >> >> > --- a/rust/kernel/str.rs
> >> >> >> > +++ b/rust/kernel/str.rs
> >> >> >> > @@ -29,7 +29,7 @@ pub const fn is_empty(&self) -> bool {
> >> >> >> >      #[inline]
> >> >> >> >      pub const fn from_bytes(bytes: &[u8]) -> &Self {
> >> >> >> >          // SAFETY: `BStr` is transparent to `[u8]`.
> >> >> >> > -        unsafe { &*(bytes as *const [u8] as *const BStr) }
> >> >> >> > +        unsafe { &*(core::mem::transmute::<*const [u8], *cons=
t Self>(bytes)) }
> >> >> >>
> >> >> >> Hmm I'm not sure about using `transmute` here. Yes the types are
> >> >> >> transparent, but I don't think that we should use it here.
> >> >> >
> >> >> > What's your suggestion? I initially tried
> >> >> >
> >> >> > let bytes: *const [u8] =3D bytes;
> >> >> > unsafe { &*bytes.cast() }
> >> >> >
> >> >> > but that doesn't compile because of the implicit Sized bound on p=
ointer::cast.
> >> >>
> >> >> This is AFAIK one of the only places where we cannot get rid of the=
 `as`
> >> >> cast. So:
> >> >>
> >> >>     let bytes: *const [u8] =3D bytes;
> >> >>     // CAST: `BStr` transparently wraps `[u8]`.
> >> >>     let bytes =3D bytes as *const BStr;
> >> >>     // SAFETY: `bytes` is derived from a reference.
> >> >>     unsafe { &*bytes }
> >> >>
> >> >> IMO a `transmute` is worse than an `as` cast :)
> >> >
> >> > Hmm, looking at this again we can just transmute ref-to-ref and avoi=
d
> >> > pointers entirely. We're already doing that in
> >> > `CStr::from_bytes_with_nul_unchecked`
> >> >
> >> > Why is transmute worse than an `as` cast?
> >>
> >> It's right in the docs: "`transmute` should be the absolute last
> >> resort." [1]. IIRC, Gary was a bit more lenient in its use, but I thin=
k
> >> we should avoid it as much as possible such that people copying code o=
r
> >> taking inspiration also don't use it.
> >>
> >> So for both cases I'd prefer an `as` cast.
> >>
> >> [1]: https://doc.rust-lang.org/std/mem/fn.transmute.html
> >
> > I don't follow the logic. The trouble with `as` casts is that they are
> > very lenient in what they allow, and to do these conversions with `as`
> > casts requires ref -> pointer -> pointer -> pointer deref versus a
> > single transmute. The safety comment perfectly describes why it's OK
> > to do: the types are transparent. So why is `as` casting pointers
> > better? It's just as unchecked as transmuting, and worse, it requires
> > a raw pointer dereference.
>
> Note that you're not transmuting `[u8]` to `BStr`, but `*const [u8]` to
> `*const BStr`. Those pointers have provenance and I'm not sure if
> transmuting them preserves it.

In the current code you're looking at, yes. But in the code I have
locally I'm transmuting `[u8]` to `BStr`. See my earlier reply where I
said "Hmm, looking at this again we can just transmute ref-to-ref and
avoid pointers entirely. We're already doing that in
`CStr::from_bytes_with_nul_unchecked`".

> I tried to find some existing issues about the topic and found that
> there exists a clippy lint `transmute_ptr_to_ptr`. There is an issue
> asking for a better justification [1] and it seems like nobody provided
> one there. Maybe we should ask the opsem team what happens to provenance
> when transmuting?

Yeah, we should do this - but again: not relevant in this discussion.
