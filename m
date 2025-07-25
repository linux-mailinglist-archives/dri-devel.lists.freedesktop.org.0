Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ECDB12285
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 19:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19AF810E384;
	Fri, 25 Jul 2025 17:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="jQHwOxrv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3B310E384;
 Fri, 25 Jul 2025 17:05:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753463101; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Z+Xa3sFvmmG1FOTixUWU0T3FQ9soYrGH+9fzBIRt3e44LY1u5/CKwbosbunAD1E1UVBzwGlTNWKtygQRJDRHUnn2bWK6iYXUmSLdMmeyF15o5PnpvRrhUkGL4RHH/jpHYr1eRFVEkWoOZ89A5tdP1DsS2iqDm0kO35YOcShsXps=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753463101;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=zcXRIrGkjYpShXkccGnec8D6aV41fr1yHU/dYkIUT28=; 
 b=WV5Uxq+IouaIQWGPZXT1IDrUhcyGmYX2vJAnWr15kr5k6HCq+crcZkuWDi2rPy9eH0Mrq0ri2J29WRm7cloEUUywGBvSWyRklezql1cyro+8hAYz24861lbx1MahKFLHay09fGHesBx46Vq+FpRvdmvcfO2V/Ygg+ASKOLjTWx8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753463101; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=zcXRIrGkjYpShXkccGnec8D6aV41fr1yHU/dYkIUT28=;
 b=jQHwOxrvkSibJKBykPnN7/hzyfC1llTDy5GIaZ6wr1wWJpPCfIvjPlQf9YTMgYya
 CiIkAzwfgvKAcXOLFCZcS8DY66Kv/dtSkKIUtSDKEb3dh5WZeT/DiF+dPxLBLAaN0/b
 g8oU812y5TyRBx27SjxP2FADRjcyD/YXJv/CGiKI=
Received: by mx.zohomail.com with SMTPS id 1753463099523440.891345684548;
 Fri, 25 Jul 2025 10:04:59 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v2 08/19] gpu: nova-core: register: fix documentation and
 indentation
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250718-nova-regs-v2-8-7b6a762aa1cd@nvidia.com>
Date: Fri, 25 Jul 2025 14:04:45 -0300
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F812FC0F-E17B-4784-895F-29E7DF087B6F@collabora.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
 <20250718-nova-regs-v2-8-7b6a762aa1cd@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
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



> On 18 Jul 2025, at 04:26, Alexandre Courbot <acourbot@nvidia.com> =
wrote:
>=20
> Fix a few documentation inconsistencies, and harmonize indentation =
where
> possible.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> drivers/gpu/nova-core/regs/macros.rs | 34 =
+++++++++-------------------------
> 1 file changed, 9 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/gpu/nova-core/regs/macros.rs =
b/drivers/gpu/nova-core/regs/macros.rs
> index =
4da897787c065e69657ce65327e3290af403a615..32fbd7e7deb9edeed91972a373a5a6ac=
7ce9db53 100644
> --- a/drivers/gpu/nova-core/regs/macros.rs
> +++ b/drivers/gpu/nova-core/regs/macros.rs
> @@ -87,44 +87,28 @@
> /// providing its own `completed` field.
> macro_rules! register {
>     // Creates a register at a fixed offset of the MMIO space.
> -    (
> -        $name:ident @ $offset:literal $(, $comment:literal)? {
> -            $($fields:tt)*
> -        }
> -    ) =3D> {
> +    ($name:ident @ $offset:literal $(, $comment:literal)? { =
$($fields:tt)* } ) =3D> {
>         register!(@common $name $(, $comment)?);
>         register!(@field_accessors $name { $($fields)* });
>         register!(@io $name @ $offset);
>     };
>=20
> -    // Creates a alias register of fixed offset register `alias` with =
its own fields.
> -    (
> -        $name:ident =3D> $alias:ident $(, $comment:literal)? {
> -            $($fields:tt)*
> -        }
> -    ) =3D> {
> +    // Creates an alias register of fixed offset register `alias` =
with its own fields.
> +    ($name:ident =3D> $alias:ident $(, $comment:literal)? { =
$($fields:tt)* } ) =3D> {
>         register!(@common $name $(, $comment)?);
>         register!(@field_accessors $name { $($fields)* });
>         register!(@io $name @ $alias::OFFSET);
>     };
>=20
>     // Creates a register at a relative offset from a base address.
> -    (
> -        $name:ident @ + $offset:literal $(, $comment:literal)? {
> -            $($fields:tt)*
> -        }
> -    ) =3D> {
> +    ($name:ident @ + $offset:literal $(, $comment:literal)? { =
$($fields:tt)* } ) =3D> {
>         register!(@common $name $(, $comment)?);
>         register!(@field_accessors $name { $($fields)* });
>         register!(@io $name @ + $offset);
>     };
>=20
> -    // Creates a alias register of relative offset register `alias` =
with its own fields.
> -    (
> -        $name:ident =3D> + $alias:ident $(, $comment:literal)? {
> -            $($fields:tt)*
> -        }
> -    ) =3D> {
> +    // Creates an alias register of relative offset register `alias` =
with its own fields.
> +    ($name:ident =3D> + $alias:ident $(, $comment:literal)? { =
$($fields:tt)* } ) =3D> {
>         register!(@common $name $(, $comment)?);
>         register!(@field_accessors $name { $($fields)* });
>         register!(@io $name @ + $alias::OFFSET);
> @@ -259,7 +243,7 @@ impl $name {
>             { |f| <$into_type>::from(f as $type) } $into_type =3D> =
$into_type $(, $comment)?;);
>     };
>=20
> -    // Shortcut for fields defined as non-`bool` without the `=3D>` =
or `?=3D>` syntax.
> +    // Shortcut for non-boolean fields defined without the `=3D>` or =
`?=3D>` syntax.
>     (
>         @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as =
$type:tt
>             $(, $comment:literal)?;
> @@ -310,7 +294,7 @@ pub(crate) fn [<set_ $field>](mut self, value: =
$to_type) -> Self {
>         );
>     };
>=20
> -    // Creates the IO accessors for a fixed offset register.
> +    // Generates the IO accessors for a fixed offset register.
>     (@io $name:ident @ $offset:expr) =3D> {
>         #[allow(dead_code)]
>         impl $name {
> @@ -344,7 +328,7 @@ pub(crate) fn alter<const SIZE: usize, T, F>(
>         }
>     };
>=20
> -    // Create the IO accessors for a relative offset register.
> +    // Generates the IO accessors for a relative offset register.
>     (@io $name:ident @ + $offset:literal) =3D> {
>         #[allow(dead_code)]
>         impl $name {
>=20
> --=20
> 2.50.1
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
