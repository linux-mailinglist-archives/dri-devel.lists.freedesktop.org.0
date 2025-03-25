Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 125DBA70DC6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 00:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F6810E628;
	Tue, 25 Mar 2025 23:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d00qIP12";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E626410E628
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 23:54:52 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-30db3f3c907so11538441fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 16:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742946890; x=1743551690; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pB7DLVd4H6QiUxYIjx/2k/QTp6fyJCUONMOEFYG9jGU=;
 b=d00qIP12anQWqFUPu6a819Z2449HtSiOR6fQqwv+fHnBBJJPy6b4s+D9hbeJRgKF9e
 njVKp8upD8MbX36B6RRaY/Y7GsK1K8HqLuHW/N7GaBNWlUhpjvkWApC0woXBKw//Q73J
 vWIT9+Wlo/V3VFf7PzhI1HLWzoLwaJ9/B0JzsaH7egZdPEhkZKTxDoesT//itjOyR9a4
 LIasPPq7ZcVBAwnUp2LkFS5hA2ibzi16cs9LI7WJT8wkTruZnwpUUkXtH5woIKKKyWka
 5FldviMgoD6ZOYUe2rHLVilsNiaovrDz2bcPg0HZ/512fLDZWkjijj1Ycbq1DYw0mUEQ
 adWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742946890; x=1743551690;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pB7DLVd4H6QiUxYIjx/2k/QTp6fyJCUONMOEFYG9jGU=;
 b=KOd0fT2F9psQecho02HhLGOrL24HKncYMtsZO7NH03T8/R7GrRDcLcyE4SLRct9mSE
 5Kb4cgQsOJnsanaoj/WZ8HG2tBdwkEsieD69/obwIqSouSOkbXLZL6YD7mLEKpYt4ITF
 rP7shaUi5aWBTGDtwLmj4usqH38CxpXHJsZpDqkSFEVsv4+dRe3E0g68v2oQ11y+mmHh
 rEtSb07md9t+K9o1XKlogM3kOkOFcizoJUuH3Xm064NDrkrDVUbaLlj/Nih2bsCcaQxc
 bR8ADtbmrUmlwzhLT8+IzZZh84FE1/T29IqXGKsFfQcbBc+eLD6OgK+lVNuJzFiVuTod
 ffWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfStcubG7b49EAUXm6xBUkiJxuOk7YHlRAEJG7XqDqTrkqSTjWFOv8OmF9yJKlyQk9aa5c72z++8Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzw5wuwX3Vo6LRl0ck2Di/YG8e2eTKBaMYwCR2c+vE2A5sG2nw+
 YgL7wnREoK7a+mFXYK7LaMHnNaMw3wzporWIIAeeo1hbEpstBxWpmG1Zpet5o0bOM6VTZ3R5lFK
 kUUJNQlEzlLLq22oIXDwuqhFNZ7w=
X-Gm-Gg: ASbGncv3SvBzSEnWEniuace7JmguBrUoYTWkPkIZFzIXX/5idw2h7QXAGrd2l4+LWdo
 WFmIgigsKTTwxsGLzwthzNW1Bae8EXvpnVoYIHmpsAQuJzlelGtdMC2I2nzW8Qh7M8qRy4zk6GP
 I9DaRWGFr08kgLTLAEPojQJFuu0bBgZn+HLLh4eYUri8Yx48bGN/1JhLlijTGp
X-Google-Smtp-Source: AGHT+IEg1mlV1KCvvMCOJZ2ohnF8J2y7cC9+rBdT4VizZQCJYeiV1bsXLR4jAOajsN9bSIhV3DiNsWgYsqG+SYPmsOQ=
X-Received: by 2002:a2e:be1f:0:b0:30d:b216:ef0e with SMTP id
 38308e7fff4ca-30db216f00cmr15397781fa.17.1742946890132; Tue, 25 Mar 2025
 16:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250325-ptr-as-ptr-v7-0-87ab452147b9@gmail.com>
 <20250325-ptr-as-ptr-v7-7-87ab452147b9@gmail.com>
 <D8POWLFKWABG.37BVXN2QCL8MP@proton.me>
 <CAJ-ks9mUYw4FEJQfmDrHHt0oMy256jhp7qZ-CHp6R5c_sOCD4w@mail.gmail.com>
 <D8PPIYIJCNX8.13VPQULEI0ALN@proton.me>
In-Reply-To: <D8PPIYIJCNX8.13VPQULEI0ALN@proton.me>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 25 Mar 2025 19:54:14 -0400
X-Gm-Features: AQ5f1JrqN1yE_LZiN0APCcG96GfKe6UILX465X2ULhw-kc5Avbv5dHlRP2RM1po
Message-ID: <CAJ-ks9k6220j6CQSOF4TDrgY9qq4PfV9uaMXz1Qk4m=eeSr5Ag@mail.gmail.com>
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

On Tue, Mar 25, 2025 at 6:40=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On Tue Mar 25, 2025 at 11:33 PM CET, Tamir Duberstein wrote:
> > On Tue, Mar 25, 2025 at 6:11=E2=80=AFPM Benno Lossin <benno.lossin@prot=
on.me> wrote:
> >>
> >> On Tue Mar 25, 2025 at 9:07 PM CET, Tamir Duberstein wrote:
> >> > diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> >> > index 40034f77fc2f..6233af50bab7 100644
> >> > --- a/rust/kernel/str.rs
> >> > +++ b/rust/kernel/str.rs
> >> > @@ -29,7 +29,7 @@ pub const fn is_empty(&self) -> bool {
> >> >      #[inline]
> >> >      pub const fn from_bytes(bytes: &[u8]) -> &Self {
> >> >          // SAFETY: `BStr` is transparent to `[u8]`.
> >> > -        unsafe { &*(bytes as *const [u8] as *const BStr) }
> >> > +        unsafe { &*(core::mem::transmute::<*const [u8], *const Self=
>(bytes)) }
> >>
> >> Hmm I'm not sure about using `transmute` here. Yes the types are
> >> transparent, but I don't think that we should use it here.
> >
> > What's your suggestion? I initially tried
> >
> > let bytes: *const [u8] =3D bytes;
> > unsafe { &*bytes.cast() }
> >
> > but that doesn't compile because of the implicit Sized bound on pointer=
::cast.
>
> This is AFAIK one of the only places where we cannot get rid of the `as`
> cast. So:
>
>     let bytes: *const [u8] =3D bytes;
>     // CAST: `BStr` transparently wraps `[u8]`.
>     let bytes =3D bytes as *const BStr;
>     // SAFETY: `bytes` is derived from a reference.
>     unsafe { &*bytes }
>
> IMO a `transmute` is worse than an `as` cast :)

Hmm, looking at this again we can just transmute ref-to-ref and avoid
pointers entirely. We're already doing that in
`CStr::from_bytes_with_nul_unchecked`

Why is transmute worse than an `as` cast?
