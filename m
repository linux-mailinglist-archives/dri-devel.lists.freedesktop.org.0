Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B30A38DE0
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 22:11:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 660A410E0E4;
	Mon, 17 Feb 2025 21:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="MiKsUqiZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADE810E5E0;
 Mon, 17 Feb 2025 21:11:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1739826666; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GxER9xBoXYNVmMpPkOezEl7juVUEqPvT7QqXQVkDYZiibyzEWtRrl3exdEGUy0WxeZyPJGEt/5hvRk+vPFOlNPBTz71BhmFP1jYZuSCj0RgcdpBf+m/4PigyU7ikLyy/rRHGUjkS1/W2QF17FY6Q1oHaYUKJ5H09XTLbK5Lucbs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1739826666;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=DSt9e2QeY4CPWpSX1AlnM+9a4nL9IwkcpgU0QN6Orh0=; 
 b=aKpGchhcwmfuIGjm8Bv9QjkRh3Evvn9BrzqMbYHC17597wTXeBxxhMj7P8dbptuh/eFgCaAm/TDHx0sBog3Cso68zvIQq2pD+85e3vWdu9mysD+8elD571FYS9E86YUKFdi7o4zwus1ozCckW9KY/wqCJmjGPQ/61Im4QsnJoOw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739826666; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=DSt9e2QeY4CPWpSX1AlnM+9a4nL9IwkcpgU0QN6Orh0=;
 b=MiKsUqiZ0eYLZaSt+Mpd49aUC2/JCSAYVpwJXydEGfwUXZSXiipCOrgCZQNLgHme
 KnILX4AqKWFk/NxWLDZDZK95o5Bmbwhw6GiARR2feXkoJFx1m/S82YSgeUJHbCmWTFF
 AY5Hdw8Zcx6aZKylqOCcbxSEwto4N0WvoLkvMLM8=
Received: by mx.zohomail.com with SMTPS id 1739826663606129.21187338334676;
 Mon, 17 Feb 2025 13:11:03 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH RFC 1/3] rust: add useful ops for u64
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250217-nova_timer-v1-1-78c5ace2d987@nvidia.com>
Date: Mon, 17 Feb 2025 18:10:47 -0300
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C1FF4314-C013-4AE1-A94E-444AFACDB4AC@collabora.com>
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <20250217-nova_timer-v1-1-78c5ace2d987@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
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

Hi Alex,=20

> On 17 Feb 2025, at 11:04, Alexandre Courbot <acourbot@nvidia.com> =
wrote:
>=20
> It is common to build a u64 from its high and low parts obtained from
> two 32-bit registers. Conversely, it is also common to split a u64 =
into
> two u32s to write them into registers. Add an extension trait for u64
> that implement these methods in a new `num` module.

Thank you for working on that. I find myself doing this manually =
extremely often indeed.


>=20
> It is expected that this trait will be extended with other useful
> operations, and similar extension traits implemented for other types.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> rust/kernel/lib.rs |  1 +
> rust/kernel/num.rs | 32 ++++++++++++++++++++++++++++++++
> 2 files changed, 33 insertions(+)
>=20
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index =
496ed32b0911a9fdbce5d26738b9cf7ef910b269..8c0c7c20a16aa96e3d3e444be3e03878=
650ddf77 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -59,6 +59,7 @@
> pub mod miscdevice;
> #[cfg(CONFIG_NET)]
> pub mod net;
> +pub mod num;
> pub mod of;
> pub mod page;
> #[cfg(CONFIG_PCI)]
> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
> new file mode 100644
> index =
0000000000000000000000000000000000000000..5e714cbda4575b8d74f50660580dc4c5=
683f8c2b
> --- /dev/null
> +++ b/rust/kernel/num.rs
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Numerical and binary utilities for primitive types.
> +
> +/// Useful operations for `u64`.
> +pub trait U64Ext {
> +    /// Build a `u64` by combining its `high` and `low` parts.
> +    ///
> +    /// ```
> +    /// use kernel::num::U64Ext;
> +    /// assert_eq!(u64::from_u32s(0x01234567, 0x89abcdef), =
0x01234567_89abcdef);
> +    /// ```
> +    fn from_u32s(high: u32, low: u32) -> Self;
> +
> +    /// Returns the `(high, low)` u32s that constitute `self`.
> +    ///
> +    /// ```
> +    /// use kernel::num::U64Ext;
> +    /// assert_eq!(u64::into_u32s(0x01234567_89abcdef), (0x1234567, =
0x89abcdef));
> +    /// ```
> +    fn into_u32s(self) -> (u32, u32);
> +}
> +
> +impl U64Ext for u64 {
> +    fn from_u32s(high: u32, low: u32) -> Self {
> +        ((high as u64) << u32::BITS) | low as u64
> +    }
> +
> +    fn into_u32s(self) -> (u32, u32) {

I wonder if a struct would make more sense here.

Just recently I had to debug an issue where I forgot the
right order for code I had just written. Something like:

let (pgcount, pgsize) =3D foo(); where the function actually
returned (pgsize, pgcount).

A proper struct with `high` and `low` might be more verbose, but
it rules out this issue.

> +        ((self >> u32::BITS) as u32, self as u32)
> +    }
> +}
>=20
> --=20
> 2.48.1
>=20

=E2=80=94 Daniel
>=20

