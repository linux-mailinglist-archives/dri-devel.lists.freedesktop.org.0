Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33399B1229D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 19:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E87110E44E;
	Fri, 25 Jul 2025 17:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="YPemz9Vl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4BF710E38E;
 Fri, 25 Jul 2025 17:06:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753463195; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=LIed8KIRFEltgk/rFESIgvCFrQmocPYrKhRFam/U6iKdKfxAaAogQax24ewN6Nqctfig9lQHv6hwQXYlsxHRuSmZKL8CIwZl3xf/Tk9d3M+VFofF/4kABY9jQ8YljBND9KQWiyTQTjxLzE3LZ290u9OAmoQMeCwO1EJcBGPW2Dg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753463195;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=I3p0cmlDXTJ40vRzTy/x/1iLH5ttLbUdq/BrX3qem8g=; 
 b=Zql/xrrcoFiCl3NhU1H24McywT52cW7qVK3J+m9ZWura+oOg+eoTWPpf2yA0lh9rdmKeaXH17bFVWMIAzAKpg8ZwPPBPbX50v91Y2LY/4Iu8jCHrPNwecgAsjQIPEs+bgcGChV8nkeVKM5HPs0SYZrHcI1EKndi5UA+E50X0Dlw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753463195; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=I3p0cmlDXTJ40vRzTy/x/1iLH5ttLbUdq/BrX3qem8g=;
 b=YPemz9Vl2JL31QtuKFZ0GSiYA9Mk1s1so9egr+nJ8iWCUcYLnKhkgj9YBXb0PzxJ
 VfsCv9+fNRTCfIrrv+0Ng+7GRGfFpnA+tVq+pLsnCKzEgi7POSxKMQLsb4FzDG5y8ye
 qUiL2saYhxLlrJZImSvyrhLfOwhF+jBeMC+/smBE=
Received: by mx.zohomail.com with SMTPS id 1753463193434517.7493357147465;
 Fri, 25 Jul 2025 10:06:33 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v2 09/19] gpu: nova-core: register: add missing
 doccomments for fixed registers I/O accessors
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250718-nova-regs-v2-9-7b6a762aa1cd@nvidia.com>
Date: Fri, 25 Jul 2025 14:06:19 -0300
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C0299B00-B2E9-44F7-8527-D6C03D95786E@collabora.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
 <20250718-nova-regs-v2-9-7b6a762aa1cd@nvidia.com>
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
> Add the missing doccomments for these accessors, as having a bit of
> inline documentation is always helpful.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> drivers/gpu/nova-core/regs/macros.rs | 4 ++++
> 1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/nova-core/regs/macros.rs =
b/drivers/gpu/nova-core/regs/macros.rs
> index =
32fbd7e7deb9edeed91972a373a5a6ac7ce9db53..0a18a0d76b2265d3138f93ffc7c561b9=
4bca3187 100644
> --- a/drivers/gpu/nova-core/regs/macros.rs
> +++ b/drivers/gpu/nova-core/regs/macros.rs
> @@ -300,6 +300,7 @@ pub(crate) fn [<set_ $field>](mut self, value: =
$to_type) -> Self {
>         impl $name {
>             pub(crate) const OFFSET: usize =3D $offset;
>=20
> +            /// Read the register from its address in `io`.
>             #[inline]
>             pub(crate) fn read<const SIZE: usize, T>(io: &T) -> Self =
where
>                 T: ::core::ops::Deref<Target =3D =
::kernel::io::Io<SIZE>>,
> @@ -307,6 +308,7 @@ pub(crate) fn read<const SIZE: usize, T>(io: &T) =
-> Self where
>                 Self(io.read32($offset))
>             }
>=20
> +            /// Write the value contained in `self` to the register =
address in `io`.
>             #[inline]
>             pub(crate) fn write<const SIZE: usize, T>(self, io: &T) =
where
>                 T: ::core::ops::Deref<Target =3D =
::kernel::io::Io<SIZE>>,
> @@ -314,6 +316,8 @@ pub(crate) fn write<const SIZE: usize, T>(self, =
io: &T) where
>                 io.write32(self.0, $offset)
>             }
>=20
> +            /// Read the register from its address in `io` and run =
`f` on its value to obtain a new
> +            /// value to write back.

Ah, really neat!

>             #[inline]
>             pub(crate) fn alter<const SIZE: usize, T, F>(
>                 io: &T,
>=20
> --=20
> 2.50.1
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

