Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F93B1234A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 19:53:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8528110E9FF;
	Fri, 25 Jul 2025 17:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="YHJbqExK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A960B10E9FE;
 Fri, 25 Jul 2025 17:53:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753466007; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jqtrjjYj6HTKfmj3aX84YVPfuEOQmzDFm9YNESPruAdi7c1IrBwq3zs6UUB3JNHFCcCwsZiKqIfBMvjpEWmpZMLMNjrvRxtEQBQK5ZaX+dyc1jdPircTEiWNmN27EudqehStmj1mR06THbEEx5hSI41iZpsBR8rlM8k1KWCLg/k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753466007;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=NPAGT4yPF+2r+2IWTtbeSzxA57WIMP0lOCJNqfVPWGw=; 
 b=WV+PSbnBOovgOZeIlpLRWWjxSsNPIxcuhrSreltZjIuMgc+XkaGbSiHDcUY6BNXWZ8+3GmwqqqPDLqEY3ui8NI3vkxQ05ANrvagsmrA7IWQ42IxTnUhDD+sBSvvyoaBcqmyA7bZ1+3iN+AslqygayKkMEcma7ED1/xmo0XMqHVc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753466006; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=NPAGT4yPF+2r+2IWTtbeSzxA57WIMP0lOCJNqfVPWGw=;
 b=YHJbqExK1umQIJ37NmjiJjzRbUQgNx0/hET6kydrgiqguVRDqEweR5Dc8yvGnUuf
 v9ttzki2C+3toJhVTXpm3rIy65Q/uCYhnZeG6aaiuUOlhVV8+BjGnWSBSKLUhG5YUaZ
 c5YU7VwYDFwJzE3xZke5mocBRayaqsxAeebwPPzY=
Received: by mx.zohomail.com with SMTPS id 1753466003670980.98516398806;
 Fri, 25 Jul 2025 10:53:23 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v2 12/19] gpu: nova-core: register: generate correct
 `Default` implementation
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250718-nova-regs-v2-12-7b6a762aa1cd@nvidia.com>
Date: Fri, 25 Jul 2025 14:53:09 -0300
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F7ED4635-7F50-4D92-B72B-08D000CD6E26@collabora.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
 <20250718-nova-regs-v2-12-7b6a762aa1cd@nvidia.com>
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
> The `Default` implementation of a register should be the aggregate of
> the default values of all its fields, and not simply be zeroed.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> drivers/gpu/nova-core/regs/macros.rs | 26 +++++++++++++++++++++++---
> 1 file changed, 23 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/nova-core/regs/macros.rs =
b/drivers/gpu/nova-core/regs/macros.rs
> index =
485cac806e4a6578059c657f3b31f15e361becbd..f0942dc29210f703fddd4d86b758173f=
75b3477a 100644
> --- a/drivers/gpu/nova-core/regs/macros.rs
> +++ b/drivers/gpu/nova-core/regs/macros.rs
> @@ -112,14 +112,14 @@ macro_rules! register {
>=20
>     // All rules below are helpers.
>=20
> -    // Defines the wrapper `$name` type, as well as its relevant =
implementations (`Debug`, `BitOr`,
> -    // and conversion to the value type) and field accessor methods.
> +    // Defines the wrapper `$name` type, as well as its relevant =
implementations (`Debug`,
> +    // `Default`, `BitOr`, and conversion to the value type) and =
field accessor methods.
>     (@core $name:ident $(, $comment:literal)? { $($fields:tt)* }) =3D> =
{
>         $(
>         #[doc=3D$comment]
>         )?
>         #[repr(transparent)]
> -        #[derive(Clone, Copy, Default)]
> +        #[derive(Clone, Copy)]
>         pub(crate) struct $name(u32);
>=20
>         impl ::core::ops::BitOr for $name {
> @@ -162,6 +162,7 @@ fn from(reg: $name) -> u32 {
>             )*
>         });
>         register!(@debug $name { $($field;)* });
> +        register!(@default $name { $($field;)* });
>     };
>=20
>     // Defines all the field getter/methods methods for `$name`.
> @@ -321,6 +322,25 @@ fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) =
-> ::core::fmt::Result {
>         }
>     };
>=20
> +    // Generates the `Default` implementation for `$name`.
> +    (@default $name:ident { $($field:ident;)* }) =3D> {
> +        /// Returns a value for the register where all fields are set =
to their default value.
> +        impl ::core::default::Default for $name {
> +            fn default() -> Self {
> +                #[allow(unused_mut)]
> +                let mut value =3D Self(Default::default());
> +
> +                ::kernel::macros::paste!(
> +                $(
> +                value.[<set_ $field>](Default::default());
> +                )*
> +                );
> +
> +                value
> +            }
> +        }
> +    };
> +
>     // Generates the IO accessors for a fixed offset register.
>     (@io $name:ident @ $offset:expr) =3D> {
>         #[allow(dead_code)]
>=20
> --=20
> 2.50.1
>=20
>=20

Also very neat.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

