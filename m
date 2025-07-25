Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2597B12312
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 19:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0741210E45D;
	Fri, 25 Jul 2025 17:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Y5XXeLho";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9529010E450;
 Fri, 25 Jul 2025 17:39:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753465157; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mucorryrwUcYH9fbM5BprHLdBuRQS3hB7v7XYCy40F39/XUZk2rrkFWXpHBzafRlJNLzqBBHz+l/XyTVxDhBM+7QCU7SGMceiIvBE2Pa16rEYkPO/EHtQanyQF1jaB0qokg0t3pg0/9iObS2I5Sx35ti3aOBYy3lg111p737rfI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753465157;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ThIFW51+VExQmgmCFcOAT+QSSe8lePT9PfJYdfc40l8=; 
 b=WIPFRjPy2wlyAXkkM3wtj6J1nTscu6e5ccF/0heH/KtJ1vjc2tAaSpm2/GfYIoSp6Z/NkOVbbi2o7G+0pv4OTteONVjjHr3+mnKWSzlrw0qd/MLeKk4fL5Lh1APJxEJzodAwOairZKaArn6Yn/Xlg6jRlYIk9Zf9cI+CqGFt8rw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753465157; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=ThIFW51+VExQmgmCFcOAT+QSSe8lePT9PfJYdfc40l8=;
 b=Y5XXeLhoGI5qRkbrSF+2IN10ubeiN2nyWrkO0vTi+YBQaKYUFoi9ImTPoBbspsMS
 vv+iAYX6B++cEqTraeA6Fivn3vcvt699MwPBY4c1c+dc6oAgfzMkmXkSwKmJOWAEmfN
 xLYH8UjfCjknIiiYUgrvLgflEvTshsFkUNAnWnCg=
Received: by mx.zohomail.com with SMTPS id 1753465154316628.2580006034739;
 Fri, 25 Jul 2025 10:39:14 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v2 10/19] gpu: nova-core: register: add fields dispatcher
 internal rule
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250718-nova-regs-v2-10-7b6a762aa1cd@nvidia.com>
Date: Fri, 25 Jul 2025 14:38:59 -0300
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E29F0B67-9214-48C3-9B58-808C6B1B7659@collabora.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
 <20250718-nova-regs-v2-10-7b6a762aa1cd@nvidia.com>
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
> Fields are complex and cumbersome to match in a rule, and were only
> captured in order to generate the field accessors. However, there are
> other places (like the `Debug` and `Default` implementations) where we
> would benefit from having access to at least some of the field
> information, but refrained from doing so because it would have meant
> matching the whole fields in a rule more complex than we need.
>=20
> Introduce a new `@fields_dispatcher` internal rule that captures all =
the
> field information and passes it to `@field_accessors`. It does not
> provide any functional change in itself, but allows us to reuse the
> captured field information partially to provide better `Debug` and
> `Default` implementations in following patches.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> drivers/gpu/nova-core/regs/macros.rs | 42 =
+++++++++++++++++++++++++++---------
> 1 file changed, 32 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/nova-core/regs/macros.rs =
b/drivers/gpu/nova-core/regs/macros.rs
> index =
0a18a0d76b2265d3138f93ffc7c561b94bca3187..8b081242595de620cbf94b405838a2da=
c67b8e83 100644
> --- a/drivers/gpu/nova-core/regs/macros.rs
> +++ b/drivers/gpu/nova-core/regs/macros.rs
> @@ -88,37 +88,33 @@
> macro_rules! register {
>     // Creates a register at a fixed offset of the MMIO space.
>     ($name:ident @ $offset:literal $(, $comment:literal)? { =
$($fields:tt)* } ) =3D> {
> -        register!(@common $name $(, $comment)?);
> -        register!(@field_accessors $name { $($fields)* });
> +        register!(@core $name $(, $comment)? { $($fields)* } );
>         register!(@io $name @ $offset);
>     };
>=20
>     // Creates an alias register of fixed offset register `alias` with =
its own fields.
>     ($name:ident =3D> $alias:ident $(, $comment:literal)? { =
$($fields:tt)* } ) =3D> {
> -        register!(@common $name $(, $comment)?);
> -        register!(@field_accessors $name { $($fields)* });
> +        register!(@core $name $(, $comment)? { $($fields)* } );
>         register!(@io $name @ $alias::OFFSET);
>     };
>=20
>     // Creates a register at a relative offset from a base address.
>     ($name:ident @ + $offset:literal $(, $comment:literal)? { =
$($fields:tt)* } ) =3D> {
> -        register!(@common $name $(, $comment)?);
> -        register!(@field_accessors $name { $($fields)* });
> +        register!(@core $name $(, $comment)? { $($fields)* } );
>         register!(@io $name @ + $offset);
>     };
>=20
>     // Creates an alias register of relative offset register `alias` =
with its own fields.
>     ($name:ident =3D> + $alias:ident $(, $comment:literal)? { =
$($fields:tt)* } ) =3D> {
> -        register!(@common $name $(, $comment)?);
> -        register!(@field_accessors $name { $($fields)* });
> +        register!(@core $name $(, $comment)? { $($fields)* } );
>         register!(@io $name @ + $alias::OFFSET);
>     };
>=20
>     // All rules below are helpers.
>=20
>     // Defines the wrapper `$name` type, as well as its relevant =
implementations (`Debug`, `BitOr`,
> -    // and conversion to regular `u32`).
> -    (@common $name:ident $(, $comment:literal)?) =3D> {
> +    // and conversion to the value type) and field accessor methods.
> +    (@core $name:ident $(, $comment:literal)? { $($fields:tt)* }) =3D> =
{
>         $(
>         #[doc=3D$comment]
>         )?
> @@ -149,6 +145,32 @@ fn from(reg: $name) -> u32 {
>                 reg.0
>             }
>         }
> +
> +        register!(@fields_dispatcher $name { $($fields)* });
> +    };
> +
> +    // Captures the fields and passes them to all the implementers =
that require field information.
> +    //
> +    // Used to simplify the matching rules for implementers, so they =
don't need to match the entire
> +    // complex fields rule even though they only make use of part of =
it.
> +    (@fields_dispatcher $name:ident {
> +        $($hi:tt:$lo:tt $field:ident as $type:tt
> +            $(?=3D> $try_into_type:ty)?
> +            $(=3D> $into_type:ty)?
> +            $(, $comment:literal)?
> +        ;
> +        )*
> +    }
> +    ) =3D> {
> +        register!(@field_accessors $name {
> +            $(
> +                $hi:$lo $field as $type
> +                $(?=3D> $try_into_type)?
> +                $(=3D> $into_type)?
> +                $(, $comment)?
> +            ;
> +            )*
> +        });
>     };
>=20
>     // Defines all the field getter/methods methods for `$name`.
>=20
> --=20
> 2.50.1
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
