Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4479EADD023
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 16:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C21510E74E;
	Tue, 17 Jun 2025 14:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JbCwVeoq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCAE10E74E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 14:40:47 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-3105ef2a071so59605841fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 07:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750171246; x=1750776046; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nA6qtEQYSObjmTSjXfycB+WycPATkd4P72jiPnHCAA4=;
 b=JbCwVeoqAoEUZpEJn78YloAsXzJZlOHuxMnC/tk4SyugNz0u6kWebS2lXyqb2Xn1Jf
 pqdFJDAYxe22vOSE8XhtFeSgGutbdP9Oc/luZBzf1cBfPI6drsmM8Cl9gYo9SqtxkQvB
 EY6srxcJeKsOPbFFlbn0FPNuMEY8kfG1G/AxjiI5vxxo74C/YhR1I/fyVHR3APB9ubiI
 azLIgUV8TZmHh2+k3Tpu0IouyjdmjgRKrnzG6nQJHgCwsvQp6+mm5gKX9TFLq2btV/gg
 Hz/1tgzoRJgxlVQGvlGiqiesuQgkU2oeOxDEIjOsZW9aupiUAfWDtff9edqge9XKtYXd
 QLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750171246; x=1750776046;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nA6qtEQYSObjmTSjXfycB+WycPATkd4P72jiPnHCAA4=;
 b=bY9CQSbdjuKUWbcXNoFJrl57zFbYcW+6Ie/vRUVosW/1dO+FaXfxE6ehLq+vfPpIVE
 j9fsEE+O/awYSJ35fEAxbloae6jefaS2pm/XqH94JuR4wGO56HHIifk6Z2b0rdAerEpS
 CxlZaH7k1ShI/nE7xbjQfVs5GExU0KVVuTEsfFvaNgXsNDYM7nJyCpMbf/mmyS1fC8Zt
 L7fCejUNp8p1Hj4LGTPmCCUt9etJOGSMdMKpAA6L56MheqPuOo0y1SSzSN/tqjn14LI5
 gE1iekD7eJRex9RvCCk+8ePCj3IIR5yQVC2AMmzyPeRMY0IdaVd1X8tPsnzxrZXsqG43
 W3ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5tUwYZtTSyiYWbFJj7vGkHGqIxq3nCjQbIx5ds0wMMNwZ3jkC80GhAOV6rCucT+FOX/CL7h4fhY0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJjA8vqHbw+4xhLB0pXWRzEfMQWGGhLkt5RDGkGcWxYKTFTay6
 EnfLDGfA/RKL912ohaeAskNQxgUNCZTCgKCiH6X0GHulV8/DbkIYQVng1yhBYs6a1kv/moGW3US
 31TqxUNeMfzkKgkqQoKo4E9weyJ/WuLCqWv6H
X-Gm-Gg: ASbGncuXkKCyX6FRvZgSdZeh4Po6opU91Xa/CfzL1MZtf4BOON1iu+ynz5DY9eGaF3o
 2apL8xr58OkSwzh7jCRGzVFbWPmLpbT5ZD5clPg/w8ldPSWbI126xFvS28ve6mGWRkNHQJsOgjR
 hYHLEzvkF6zobKQBEMVhLQrBFTvyIpixXy0OPNOW2NHBRYvRRPHmyg4v/PJYE=
X-Google-Smtp-Source: AGHT+IGkuuKjtvKBNl3QmjTudRGbGevTIb7oBUqZsL6XetkWnP5IqJY5hvQVch1DK/G++9+iLJKtCSGjfz4FCwve8jA=
X-Received: by 2002:a2e:bc15:0:b0:32a:7122:58cc with SMTP id
 38308e7fff4ca-32b4a2e24cbmr39908461fa.6.1750171245443; Tue, 17 Jun 2025
 07:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250617-opaque-from-raw-v1-1-a2e99efa3ba2@google.com>
In-Reply-To: <20250617-opaque-from-raw-v1-1-a2e99efa3ba2@google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 17 Jun 2025 10:40:09 -0400
X-Gm-Features: AX0GCFv7lU3SvnR9E3OzendU9NdImRIdabiEAKbvNCS_347sx3bZCnind6a_fJU
Message-ID: <CAJ-ks9=Sy3S8Rir-RftkF7_ZCV4WVsCOPHYX3WN41MY1ukFwKQ@mail.gmail.com>
Subject: Re: [PATCH] rust: types: add Opaque::from_raw
To: Alice Ryhl <aliceryhl@google.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, Jun 17, 2025 at 9:38=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Since commit b20fbbc08a36 ("rust: check type of `$ptr` in
> `container_of!`") we have enforced that the field pointer passed to
> container_of! must match the declared field. This caused mismatches when
> using a pointer to bindings::x for fields of type Opaque<bindings::x>.
>
> This situation encourages the user to simply pass field.cast() to the
> container_of! macro, but this is not great because you might
> accidentally pass a *mut bindings::y when the field type is
> Opaque<bindings::x>, which would be wrong.
>
> To help catch this kind of mistake, add a new Opaque::from_raw that
> wraps a raw pointer in Opaque without changing the inner type.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Tamir Duberstein <tamird@gmail.com>

> ---
>  rust/kernel/drm/device.rs  | 4 +---
>  rust/kernel/drm/gem/mod.rs | 4 +---
>  rust/kernel/lib.rs         | 7 +++++++
>  rust/kernel/types.rs       | 5 +++++
>  4 files changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index 624d7a4c83ead64b93325189f481d9b37c3c6eae..763c825d53aaba4f874361b78=
5587b2c5129d49a 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -135,11 +135,9 @@ pub(crate) fn as_raw(&self) -> *mut bindings::drm_de=
vice {
>      ///
>      /// `ptr` must be a valid pointer to a `struct device` embedded in `=
Self`.
>      unsafe fn from_drm_device(ptr: *const bindings::drm_device) -> *mut =
Self {
> -        let ptr: *const Opaque<bindings::drm_device> =3D ptr.cast();
> -
>          // SAFETY: By the safety requirements of this function `ptr` is =
a valid pointer to a
>          // `struct drm_device` embedded in `Self`.
> -        unsafe { crate::container_of!(ptr, Self, dev) }.cast_mut()
> +        unsafe { crate::container_of!(Opaque::from_raw(ptr), Self, dev) =
}.cast_mut()
>      }
>
>      /// Not intended to be called externally, except via declare_drm_ioc=
tls!()
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index 4cd69fa84318c3ff2cec57949e9bab05559a3c2f..5b80c248761bb39914a63ad79=
47aa8d3779054ef 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -125,11 +125,9 @@ fn as_raw(&self) -> *mut bindings::drm_gem_object {
>      }
>
>      unsafe fn as_ref<'a>(self_ptr: *mut bindings::drm_gem_object) -> &'a=
 Self {
> -        let self_ptr: *mut Opaque<bindings::drm_gem_object> =3D self_ptr=
.cast();
> -
>          // SAFETY: `obj` is guaranteed to be in an `Object<T>` via the s=
afety contract of this
>          // function
> -        unsafe { &*crate::container_of!(self_ptr, Object<T>, obj) }
> +        unsafe { &*crate::container_of!(Opaque::from_raw(self_ptr), Obje=
ct<T>, obj) }
>      }
>  }
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 6b4774b2b1c37f4da1866e993be6230bc6715841..d2402d42b8776c9399a7dfdbe=
7bd61de7ef8dba3 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -204,6 +204,13 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
>
>  /// Produces a pointer to an object from a pointer to one of its fields.
>  ///
> +/// If you encounter a type mismatch due to the [`Opaque`] type, then us=
e [`Opaque::raw_get`] or
> +/// [`Opaque::from_raw`] to resolve the mismatch.
> +///
> +/// [`Opaque`]: crate::types::Opaque
> +/// [`Opaque::raw_get`]: crate::types::Opaque::raw_get
> +/// [`Opaque::from_raw`]: crate::types::Opaque::from_raw
> +///
>  /// # Safety
>  ///
>  /// The pointer passed to this macro, and the pointer returned by this m=
acro, must both be in
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index 22985b6f69820d6df8ff3aae0bf815fad36a9d92..a79295500b3c812326cea8a9d=
339a8545a7f457d 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -413,6 +413,11 @@ pub const fn get(&self) -> *mut T {
>      pub const fn raw_get(this: *const Self) -> *mut T {
>          UnsafeCell::raw_get(this.cast::<UnsafeCell<MaybeUninit<T>>>()).c=
ast::<T>()
>      }
> +
> +    /// The opposite operation of [`Opaque::raw_get`].
> +    pub const fn from_raw(this: *const T) -> *const Self {
> +        this.cast()
> +    }
>  }
>
>  /// Types that are _always_ reference counted.
>
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250617-opaque-from-raw-ac5b8ef6faa2
>
> Best regards,
> --
> Alice Ryhl <aliceryhl@google.com>
