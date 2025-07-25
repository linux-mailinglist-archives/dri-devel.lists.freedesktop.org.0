Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC3BB121D4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 18:20:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4948410E9F2;
	Fri, 25 Jul 2025 16:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="CGCnLymC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB5310E9F2;
 Fri, 25 Jul 2025 16:20:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753460447; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PQ/pYVoygEyQua7VMe26tmZJfS4BfoSXCCiWR9r00YkgofjyM7L30UNqhMaCgY6w+C15gqtPiK+vO7jssi77lmdOEDF/QaBfOFy4+yB4HNctvPZncI+EHzzPG2Jz9mI07TkvzANKEfHBvTFUa+JQVcLrOVV5Lqsqmj9jB2VzITQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753460447;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=sM8yM5Zfl73gXawF9mBUpHP4adTD6nT62UNbsAdn/7U=; 
 b=PtNU4p2bLfTf9IvjObw9QtgJcjDDwOyLMBr+LghqlB5M9v4eh7k1OurkHesOLvWhlaxP/1MXxweQfiIP061d4st/pmOf2eKei1U9kyoOUF6WS5/o++/tlEnHKdKYD9a4FuFgHto1IBTr4Rqoghd0U7LCBztJdmwEQU1QFP14daw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753460447; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=sM8yM5Zfl73gXawF9mBUpHP4adTD6nT62UNbsAdn/7U=;
 b=CGCnLymC82ZOLRNV1RBinM1h5p5rsTP/ONteiR/E9z0AhZwhVoo3+pjxVynfmvNL
 3KsE7y/+kq6nK+iHBufvI1xKxNW3mF5Ave0sGfYorzaZHZbSyFYutb1jD/x/hxI8RHS
 AY020KAUi1J9OCJDks5bUoDfuCsjyxhTcAD5CBIk=
Received: by mx.zohomail.com with SMTPS id 1753460443953391.6558105529341;
 Fri, 25 Jul 2025 09:20:43 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v2 03/19] gpu: nova-core: register: allow fields named
 `offset`
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250718-nova-regs-v2-3-7b6a762aa1cd@nvidia.com>
Date: Fri, 25 Jul 2025 13:20:29 -0300
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Timur Tabi <ttabi@nvidia.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EEB967E2-D2E3-409F-8D47-3F6ABB5E1BCE@collabora.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
 <20250718-nova-regs-v2-3-7b6a762aa1cd@nvidia.com>
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
> `offset` is a common field name, yet using it triggers a build error =
due
> to the conflict between the uppercased field constant (which becomes
> `OFFSET` in this case) containing the bitrange of the field, and the
> `OFFSET` constant constaining the offset of the register.
>=20
> Fix this by adding `_RANGE` the field's range constant to avoid the
> name collision.
>=20
> Reported-by: Timur Tabi <ttabi@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> drivers/gpu/nova-core/regs.rs        | 4 ++--
> drivers/gpu/nova-core/regs/macros.rs | 2 +-
> 2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/nova-core/regs.rs =
b/drivers/gpu/nova-core/regs.rs
> index =
5ccfb61f850ac961be55841416ca21775309ea32..2df784f704d57b6ef31486afa0121c5c=
d83bb8b9 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -28,7 +28,7 @@ impl NV_PMC_BOOT_0 {
>     /// Combines `architecture_0` and `architecture_1` to obtain the =
architecture of the chip.
>     pub(crate) fn architecture(self) -> Result<Architecture> {
>         Architecture::try_from(
> -            self.architecture_0() | (self.architecture_1() << =
Self::ARCHITECTURE_0.len()),
> +            self.architecture_0() | (self.architecture_1() << =
Self::ARCHITECTURE_0_RANGE.len()),
>         )
>     }
>=20
> @@ -36,7 +36,7 @@ pub(crate) fn architecture(self) -> =
Result<Architecture> {
>     pub(crate) fn chipset(self) -> Result<Chipset> {
>         self.architecture()
>             .map(|arch| {
> -                ((arch as u32) << Self::IMPLEMENTATION.len()) | =
self.implementation() as u32
> +                ((arch as u32) << Self::IMPLEMENTATION_RANGE.len()) | =
self.implementation() as u32
>             })
>             .and_then(Chipset::try_from)
>     }
> diff --git a/drivers/gpu/nova-core/regs/macros.rs =
b/drivers/gpu/nova-core/regs/macros.rs
> index =
93e9055d5ebd5f78ea534aafd44d884da0fce345..d015a9f8a0b01afe1ff5093991845864=
aa81665e 100644
> --- a/drivers/gpu/nova-core/regs/macros.rs
> +++ b/drivers/gpu/nova-core/regs/macros.rs
> @@ -278,7 +278,7 @@ impl $name {
>             { $process:expr } $to_type:ty =3D> $res_type:ty $(, =
$comment:literal)?;
>     ) =3D> {
>         ::kernel::macros::paste!(
> -        const [<$field:upper>]: ::core::ops::RangeInclusive<u8> =3D =
$lo..=3D$hi;
> +        const [<$field:upper _RANGE>]: =
::core::ops::RangeInclusive<u8> =3D $lo..=3D$hi;
>         const [<$field:upper _MASK>]: u32 =3D ((((1 << $hi) - 1) << 1) =
+ 1) - ((1 << $lo) - 1);
>         const [<$field:upper _SHIFT>]: u32 =3D Self::[<$field:upper =
_MASK>].trailing_zeros();
>         );
>=20
> --=20
> 2.50.1
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
