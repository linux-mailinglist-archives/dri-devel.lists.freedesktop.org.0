Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3E1B42194
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 15:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D815110E88F;
	Wed,  3 Sep 2025 13:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="UWzPjg7H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FDCF10E88F;
 Wed,  3 Sep 2025 13:30:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756906205; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nu/jD3iyW8518XgRhqdkMjrEML10/xaiWdOZsb0zfX6pgGP5dCQznFBDOmC4BnPCnoBUeeopfFnRSC/QF3fUwv3NvV5fJSATbR+4x/P6ycPK4AbWrK1TcHUnII1W64kKNGcLX1D11aNiUfNE5L9ZSlvBx6ieNzZdeQ7DICcUPqw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756906205;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=4rdL4BMSJjWrp5Ar1gyiWHdHZrTo81ucFzwVlSGzyt4=; 
 b=X4vRD0WftvUzR7Lx4CVZod9PXp2ClbVKpaidophFVn9AP4Jv8ppQH8xs/+pf220ShBgVQUt+O8mOzU2/muJ1jJ/Xanv/zj3g2u/Gu3U9qis1VBeodaTYGletKpH+TL+QEVHCLmKIfseTy1DaVQCT7NBOtyY2LU+DujHrRYWUYXU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756906205; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=4rdL4BMSJjWrp5Ar1gyiWHdHZrTo81ucFzwVlSGzyt4=;
 b=UWzPjg7H9tY72eLTC7zboCAvOIaBAQa4VHxY+Efo+9xh06o5ZkI4C3lU4KVa5N5T
 RwnX/i0ybunYN4ej8m6r5yX3pDJj/BugHrEafnfjovotMHt7/qLqbUUVeAugHdU1Uis
 b1n7UCjf4mPNJXiIJlSuLjw8nvsr93IJwfK2+c9Q=
Received: by mx.zohomail.com with SMTPS id 1756906203342831.6629861652933;
 Wed, 3 Sep 2025 06:30:03 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 1/2] nova-core: Add a library for bitfields in Rust structs
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250824135954.2243774-1-joelagnelf@nvidia.com>
Date: Wed, 3 Sep 2025 10:29:46 -0300
Cc: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D0E4757B-B26C-49AE-9076-267C0CBC2577@collabora.com>
References: <20250824135954.2243774-1-joelagnelf@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
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

Hi Joel,

> On 24 Aug 2025, at 10:59, Joel Fernandes <joelagnelf@nvidia.com> =
wrote:
>=20
> Add a minimal bitfield library for defining in Rust structures (called
> bitstruct), similar in concept to bit fields in C structs. This will =
be used
> for defining page table entries and other structures in nova-core.
>=20
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
> drivers/gpu/nova-core/bitstruct.rs | 149 +++++++++++++++++++++++++++++
> drivers/gpu/nova-core/nova_core.rs |   1 +
> 2 files changed, 150 insertions(+)
> create mode 100644 drivers/gpu/nova-core/bitstruct.rs
>=20
> diff --git a/drivers/gpu/nova-core/bitstruct.rs =
b/drivers/gpu/nova-core/bitstruct.rs
> new file mode 100644
> index 000000000000..661a75da0a9c
> --- /dev/null
> +++ b/drivers/gpu/nova-core/bitstruct.rs
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// bitstruct.rs =E2=80=94 C-style library for bitfield-packed Rust =
structures
> +//
> +// A library that provides support for defining bit fields in Rust
> +// structures to circumvent lack of native language support for this.
> +//
> +// Similar usage syntax to the register! macro.
> +
> +use kernel::prelude::*;
> +
> +/// Macro for defining bitfield-packed structures in Rust.
> +/// The size of the underlying storage type is specified with =
#[repr(TYPE)].
> +///
> +/// # Example (just for illustration)
> +/// ```rust
> +/// bitstruct! {
> +///     #[repr(u64)]
> +///     pub struct PageTableEntry {
> +///         0:0       present     as bool,
> +///         1:1       writable    as bool,
> +///         11:9      available   as u8,
> +///         51:12     pfn         as u64,
> +///         62:52     available2  as u16,
> +///         63:63     nx          as bool,
> +///     }
> +/// }
> +/// ```
> +///
> +/// This generates a struct with methods:
> +/// - Constructor: `default()` sets all bits to zero.
> +/// - Field accessors: `present()`, `pfn()`, etc.
> +/// - Field setters: `set_present()`, `set_pfn()`, etc.
> +/// - Builder methods: `with_present()`, `with_pfn()`, etc.

I think this could use a short example highlighting the builder pattern. =
It may
be initially unclear that the methods can be chained, even though the =
word
=E2=80=9Cbuilder=E2=80=9D is being used.

> +/// - Raw conversion: `from_raw()`, `into_raw()`
> +#[allow(unused_macros)]
> +macro_rules! bitstruct {
> +    (
> +        #[repr($storage:ty)]
> +        $vis:vis struct $name:ident {
> +            $(
> +                $hi:literal : $lo:literal $field:ident as =
$field_type:tt
> +            ),* $(,)?
> +        }
> +    ) =3D> {
> +        #[repr(transparent)]
> +        #[derive(Copy, Clone, Default)]
> +        $vis struct $name($storage);
> +
> +        impl $name {
> +            /// Create from raw value
> +            #[inline(always)]
> +            $vis const fn from_raw(val: $storage) -> Self {
> +                Self(val)
> +            }
> +
> +            /// Get raw value
> +            #[inline(always)]
> +            $vis const fn into_raw(self) -> $storage {
> +                self.0
> +            }
> +        }
> +
> +        impl core::fmt::Debug for $name {
> +            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> =
core::fmt::Result {
> +                write!(f, "{}({:#x})", stringify!($name), self.0)
> +            }
> +        }
> +
> +        // Generate all field methods
> +        $(
> +            bitstruct_field_impl!($vis, $name, $storage, $hi, $lo, =
$field as $field_type);
> +        )*
> +    };
> +}
> +
> +/// Helper to calculate mask for bit fields
> +#[allow(unused_macros)]
> +macro_rules! bitstruct_mask {
> +    ($hi:literal, $lo:literal, $storage:ty) =3D> {{
> +        let width =3D ($hi - $lo + 1) as usize;
> +        let storage_bits =3D 8 * core::mem::size_of::<$storage>();
> +        if width >=3D storage_bits {
> +            <$storage>::MAX
> +        } else {
> +            ((1 as $storage) << width) - 1

Can=E2=80=99t we have a build_assert here instead?

> +        }
> +    }};
> +}
> +
> +#[allow(unused_macros)]
> +macro_rules! bitstruct_field_impl {
> +    ($vis:vis, $struct_name:ident, $storage:ty, $hi:literal, =
$lo:literal, $field:ident as $field_type:tt) =3D> {
> +        impl $struct_name {
> +            #[inline(always)]
> +            $vis const fn $field(&self) -> $field_type {
> +                let field_val =3D (self.0 >> $lo) & =
bitstruct_mask!($hi, $lo, $storage);
> +                bitstruct_cast_value!(field_val, $field_type)
> +            }
> +        }
> +        bitstruct_make_setters!($vis, $struct_name, $storage, $hi, =
$lo, $field, $field_type);
> +    };
> +}
> +
> +/// Helper macro to convert extracted value to target type
> +///
> +/// Special handling for bool types is required because the `as` =
keyword
> +/// cannot be used to convert to bool in Rust. For bool fields, we =
check
> +/// if the extracted value is non-zero. For all other types, we use =
the
> +/// standard `as` conversion.
> +#[allow(unused_macros)]
> +macro_rules! bitstruct_cast_value {
> +    ($field_val:expr, bool) =3D> {
> +        $field_val !=3D 0
> +    };
> +    ($field_val:expr, $field_type:tt) =3D> {
> +        $field_val as $field_type
> +    };
> +}
> +
> +#[allow(unused_macros)]
> +macro_rules! bitstruct_write_bits {
> +    ($raw:expr, $hi:literal, $lo:literal, $val:expr, $storage:ty) =3D> =
{{
> +        let mask =3D bitstruct_mask!($hi, $lo, $storage);
> +        ($raw & !(mask << $lo)) | ((($val as $storage) & mask) << =
$lo)
> +    }};
> +}
> +
> +#[allow(unused_macros)]
> +macro_rules! bitstruct_make_setters {

> +    ($vis:vis, $struct_name:ident, $storage:ty, $hi:literal, =
$lo:literal, $field:ident, $field_type:tt) =3D> {
> +        ::kernel::macros::paste! {
> +            impl $struct_name {
> +                #[inline(always)]
> +                #[allow(dead_code)]
> +                $vis fn [<set_ $field>](&mut self, val: $field_type) =
{
> +                    self.0 =3D bitstruct_write_bits!(self.0, $hi, =
$lo, val, $storage);
> +                }
> +
> +                #[inline(always)]
> +                #[allow(dead_code)]
> +                $vis const fn [<with_ $field>](mut self, val: =
$field_type) -> Self {
> +                    self.0 =3D bitstruct_write_bits!(self.0, $hi, =
$lo, val, $storage);
> +                    self
> +                }
> +            }
> +        }
> +    };
> +}
> diff --git a/drivers/gpu/nova-core/nova_core.rs =
b/drivers/gpu/nova-core/nova_core.rs
> index cb2bbb30cba1..54505cad4a73 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -2,6 +2,7 @@
>=20
> //! Nova Core GPU Driver
>=20
> +mod bitstruct;
> mod dma;
> mod driver;
> mod falcon;
> --=20
> 2.34.1
>=20
>=20

The code itself looks good. Thanks for doing this work, it will be =
useful for Tyr :)

=E2=80=94 Daniel=
