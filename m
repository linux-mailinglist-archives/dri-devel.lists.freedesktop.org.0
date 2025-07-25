Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CDAB1236F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 19:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D705E10EA05;
	Fri, 25 Jul 2025 17:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="TrxnGsco";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A445510E22C;
 Fri, 25 Jul 2025 17:59:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753466380; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ivaxwE8EZyytMhEQ0gmz9+ZpLV6y2q8bh3pVrq89n54od03DDJaA5DzvnNBbfCX8JyT7+sEhpzX1SMSkxXjTTUAtKIWxhKqh7Dq9Q87jVIqg8wwmOahHOYc9+a43ckZKLmhnJdVCvbr/YXWRsEQ6Ksd7wEWLleIhmQsbyurDE2c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753466380;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=/gMV77BlIAy8KyUFz7OcEqEfPlu0qBZBOgi8au2RuEw=; 
 b=I3CHMpjaqDgQOm1Z//AqGxXDr/Dyir53XFlGT5e+BSxj8xbFQp+Ti80oTgC2SYJC6S4qEHwiB1beXP6jyNonxECHl+n0IJKtwJAUd6DbTHrRTbVkDSsW4XmGdaF8kYzahl+zW1Rwo2dh9JgpM/G8lOBZHw8Y+DqV3k6xbfKasEY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753466380; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=/gMV77BlIAy8KyUFz7OcEqEfPlu0qBZBOgi8au2RuEw=;
 b=TrxnGscoaTGFXO9ldk/EGL2qIx+B0UYmbMbr5sSTf58ffTDKDQnzMhhE9RizdkAJ
 TjkKwZxLY0vDwcHtgf+u9Pzv/tEwE/bzZ89l4Ee1OE8c3s9bjzmrsMfS2uYWgo8KJAa
 AQkH/ii8YWkaJfzWfZOw3ZanTlr/DX8+64Z00P6g=
Received: by mx.zohomail.com with SMTPS id 1753466377644926.1313834883316;
 Fri, 25 Jul 2025 10:59:37 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v2 14/19] gpu: nova-core: register: use #[inline(always)]
 for all methods
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250718-nova-regs-v2-14-7b6a762aa1cd@nvidia.com>
Date: Fri, 25 Jul 2025 14:59:24 -0300
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <67E28AC5-3EE3-4E0B-9CA1-BBDADA5A28C0@collabora.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
 <20250718-nova-regs-v2-14-7b6a762aa1cd@nvidia.com>
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
> These methods should always be inlined, so use the strongest compiler
> hint that exists to maximize the chance they will indeed be.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> drivers/gpu/nova-core/regs/macros.rs | 16 ++++++++--------
> 1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/nova-core/regs/macros.rs =
b/drivers/gpu/nova-core/regs/macros.rs
> index =
bfa0220050d4ba03c9fcd75c9be1ed8dbaa4f290..a9f754056c3521b2a288f34bf3d78ec5=
6db53451 100644
> --- a/drivers/gpu/nova-core/regs/macros.rs
> +++ b/drivers/gpu/nova-core/regs/macros.rs
> @@ -280,7 +280,7 @@ impl $name {
>         #[doc=3D"Returns the value of this field:"]
>         #[doc=3D$comment]
>         )?
> -        #[inline]
> +        #[inline(always)]
>         pub(crate) fn $field(self) -> $res_type {
>             ::kernel::macros::paste!(
>             const MASK: u32 =3D $name::[<$field:upper _MASK>];
> @@ -296,7 +296,7 @@ pub(crate) fn $field(self) -> $res_type {
>         #[doc=3D"Sets the value of this field:"]
>         #[doc=3D$comment]
>         )?
> -        #[inline]
> +        #[inline(always)]
>         pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> =
Self {
>             const MASK: u32 =3D $name::[<$field:upper _MASK>];
>             const SHIFT: u32 =3D $name::[<$field:upper _SHIFT>];
> @@ -348,7 +348,7 @@ impl $name {
>             pub(crate) const OFFSET: usize =3D $offset;
>=20
>             /// Read the register from its address in `io`.
> -            #[inline]
> +            #[inline(always)]
>             pub(crate) fn read<const SIZE: usize, T>(io: &T) -> Self =
where
>                 T: ::core::ops::Deref<Target =3D =
::kernel::io::Io<SIZE>>,
>             {
> @@ -356,7 +356,7 @@ pub(crate) fn read<const SIZE: usize, T>(io: &T) =
-> Self where
>             }
>=20
>             /// Write the value contained in `self` to the register =
address in `io`.
> -            #[inline]
> +            #[inline(always)]
>             pub(crate) fn write<const SIZE: usize, T>(self, io: &T) =
where
>                 T: ::core::ops::Deref<Target =3D =
::kernel::io::Io<SIZE>>,
>             {
> @@ -365,7 +365,7 @@ pub(crate) fn write<const SIZE: usize, T>(self, =
io: &T) where
>=20
>             /// Read the register from its address in `io` and run `f` =
on its value to obtain a new
>             /// value to write back.
> -            #[inline]
> +            #[inline(always)]
>             pub(crate) fn alter<const SIZE: usize, T, F>(
>                 io: &T,
>                 f: F,
> @@ -385,7 +385,7 @@ pub(crate) fn alter<const SIZE: usize, T, F>(
>         impl $name {
>             pub(crate) const OFFSET: usize =3D $offset;
>=20
> -            #[inline]
> +            #[inline(always)]
>             pub(crate) fn read<const SIZE: usize, T>(
>                 io: &T,
>                 base: usize,
> @@ -395,7 +395,7 @@ pub(crate) fn read<const SIZE: usize, T>(
>                 Self(io.read32(base + $offset))
>             }
>=20
> -            #[inline]
> +            #[inline(always)]
>             pub(crate) fn write<const SIZE: usize, T>(
>                 self,
>                 io: &T,
> @@ -406,7 +406,7 @@ pub(crate) fn write<const SIZE: usize, T>(
>                 io.write32(self.0, base + $offset)
>             }
>=20
> -            #[inline]
> +            #[inline(always)]
>             pub(crate) fn alter<const SIZE: usize, T, F>(
>                 io: &T,
>                 base: usize,
>=20
> --=20
> 2.50.1
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

