Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE79A70CEC
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 23:34:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C888F10E613;
	Tue, 25 Mar 2025 22:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MN+V7AWA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763A910E613
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 22:33:57 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-54996d30bfbso5738175e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 15:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742942036; x=1743546836; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Rhrkp4C3mtJ8SrlSBMmU8WkZfHfXdyvYKhxaaowYRs=;
 b=MN+V7AWA2f84w/ymcq83MlnR7EeaXBZMVmKDUD7iEFL9dj/UlGW6Sz5n/RsokUMei1
 ggPzupYCenFaG6J828AMrQVwGoc/PXS7szfDViKi51hTFB9jjkvmOzowizN0pEYqY4VU
 mMLdYHOrXGDNSOhpHa2pJeverpvBsA2BcH1ILx8d0jbpdvLJfPZeHl9oK6bKxeSsBWT2
 6K5dROKSQ0PipcLrUxDx2mAcRnb7bC8hTZXPydblx25CnBk1f/Zlv6PpXPjNeq7N6ZG1
 8LxvV0j1t1f6uWc4jJ/pUZOIGU2ejPXlkxNqRxE6qzpo2gApmQu9O6r5KDfmXNokRMlR
 ZDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742942036; x=1743546836;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Rhrkp4C3mtJ8SrlSBMmU8WkZfHfXdyvYKhxaaowYRs=;
 b=nQTEw/3BYJBiyVa3WNITo+8c/OzHwp55J0Y8xPG6kc6RSmY0YkpL1N+z7v90X2w4Bs
 LSBsek/XuGahsnUuDly5z3cXRT1Xp7vqgjos/9htEazwnZP6ZH/eDS4fI+mg0NhD63fP
 nBoHzs+ddsX+6q74wjw06PVo8VNYx49AIgcD4/oDrN92AqD4lp+GbtWoU2vxhYbDgjLL
 9abt7F6Ra4tZnsbqecCPu+37yLnfVJW4YFmPddUjrvbrXm0g+7LVFpC8oCqqGoieGFbF
 +zErMiOwomYbqoOphZO5S6L1PXrtXznyLzWDz+eDrtjBUnaxwKe+gk9WQEdMocVVP5hE
 AU4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgWnmUF5uEEhRkLIEWDVa0wAMJ5EmP+np0V1vufEFXlzWIQevONIzBePQZSrKsKTck4yVxDNv3TJE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQOzPgkbPF3O+TWKWvMuMFPT8YNNwO/rohHkgDpEMU9K7pgQH1
 gpmO0CrZF/FvjyACB65Y2PqxR66pvKu6fd/+hQkYWmHgd3VGAOFtlcJayn2/gnpMtgYwkrBpUKH
 6Bfa+/hLs4wq/FKBScE4SZ38WyNs=
X-Gm-Gg: ASbGncuJYi7LKcMn2XbBxz4dsHd6i4bHvA4AuJ0Vu9ef4us/L/GJi57Wo7pWd2iz1/M
 t6VjzNT38bKpViOa4t/FU3mp/XAvMhjfNI85q5Lq66eLQOZLyoZLc2bemYm8fZk3kA86WbpFNG2
 fimD+DA3xHCoEerm43MmDnZeUb33z7py8MwDxHDnXcenVHo73IwSKplc4RotHi0hJbgFeClQ==
X-Google-Smtp-Source: AGHT+IF7oNHiA79ygoevBMCH/M8kBbwg6m++h2lH8/S2V9ylq5tEJ7Ga+KdvKmKrJrM61cBMQiYIb8DxAdgeGsC/R6E=
X-Received: by 2002:a05:6512:31c9:b0:545:5a5:b69f with SMTP id
 2adb3069b0e04-54ad64799edmr5883337e87.9.1742942035388; Tue, 25 Mar 2025
 15:33:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250325-ptr-as-ptr-v7-0-87ab452147b9@gmail.com>
 <20250325-ptr-as-ptr-v7-7-87ab452147b9@gmail.com>
 <D8POWLFKWABG.37BVXN2QCL8MP@proton.me>
In-Reply-To: <D8POWLFKWABG.37BVXN2QCL8MP@proton.me>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 25 Mar 2025 18:33:19 -0400
X-Gm-Features: AQ5f1JosKyWe583mjIwVAHNfBxS6svc8VZc6q_vCfw8uzWZ3UtE-6_9jMFmmSrw
Message-ID: <CAJ-ks9mUYw4FEJQfmDrHHt0oMy256jhp7qZ-CHp6R5c_sOCD4w@mail.gmail.com>
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

On Tue, Mar 25, 2025 at 6:11=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On Tue Mar 25, 2025 at 9:07 PM CET, Tamir Duberstein wrote:
> > diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> > index 40034f77fc2f..6233af50bab7 100644
> > --- a/rust/kernel/str.rs
> > +++ b/rust/kernel/str.rs
> > @@ -29,7 +29,7 @@ pub const fn is_empty(&self) -> bool {
> >      #[inline]
> >      pub const fn from_bytes(bytes: &[u8]) -> &Self {
> >          // SAFETY: `BStr` is transparent to `[u8]`.
> > -        unsafe { &*(bytes as *const [u8] as *const BStr) }
> > +        unsafe { &*(core::mem::transmute::<*const [u8], *const Self>(b=
ytes)) }
>
> Hmm I'm not sure about using `transmute` here. Yes the types are
> transparent, but I don't think that we should use it here.

What's your suggestion? I initially tried

let bytes: *const [u8] =3D bytes;
unsafe { &*bytes.cast() }

but that doesn't compile because of the implicit Sized bound on pointer::ca=
st.

>
> >      }
> >
> >      /// Strip a prefix from `self`. Delegates to [`slice::strip_prefix=
`].
> > @@ -290,7 +290,7 @@ pub const fn from_bytes_with_nul(bytes: &[u8]) -> R=
esult<&Self, CStrConvertError
> >      #[inline]
> >      pub unsafe fn from_bytes_with_nul_unchecked_mut(bytes: &mut [u8]) =
-> &mut CStr {
> >          // SAFETY: Properties of `bytes` guaranteed by the safety prec=
ondition.
> > -        unsafe { &mut *(bytes as *mut [u8] as *mut CStr) }
> > +        unsafe { &mut *(core::mem::transmute::<*mut [u8], *mut Self>(b=
ytes)) }
> >      }
> >
> >      /// Returns a C pointer to the string.
> > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> > index 80a9782b1c6e..c042b1fe499e 100644
> > --- a/rust/kernel/uaccess.rs
> > +++ b/rust/kernel/uaccess.rs
> > @@ -242,7 +242,7 @@ pub fn read_raw(&mut self, out: &mut [MaybeUninit<u=
8>]) -> Result {
> >      pub fn read_slice(&mut self, out: &mut [u8]) -> Result {
> >          // SAFETY: The types are compatible and `read_raw` doesn't wri=
te uninitialized bytes to
> >          // `out`.
> > -        let out =3D unsafe { &mut *(out as *mut [u8] as *mut [MaybeUni=
nit<u8>]) };
> > +        let out =3D unsafe { &mut *(core::mem::transmute::<*mut [u8], =
*mut [MaybeUninit<u8>]>(out)) };
>
> I have a patch that adds a `cast_slice_mut` method that could be used
> here, so I can fix it in that series. But let's not use `transmute` here
> either.

See above - I don't know what else I could write here.
