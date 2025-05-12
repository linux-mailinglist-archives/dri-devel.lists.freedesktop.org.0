Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5656AAB3634
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 13:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DE410E18C;
	Mon, 12 May 2025 11:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Pw8Fga4n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E3810E18C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 11:50:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1747050588; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IeWV56GYZdPD/rCFSLMk8ECA9sViehSY0GcFEgeA69YjeJMQjNh0qI/4bd5h1C0lXmkmrS1UhTkjrshcPXTMUopXZk+CIeejtH7PAHSU8YcC19yXyAASBBbP14xJzqu7yTFVIEM1WyowDGrFaerxy9PPGgcBZ5Gb3dwoGrpAABs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1747050588;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ypLBf3MR7liu9tHQt1GbDT9p+WQwauRj8eH15ox24fc=; 
 b=QmXYLJsxtVrSDlTsgTGGNbUkqoXOGUtx8l/vvCYZxezksU9b9sqSCO74MufJ2dgmL+S5f6PNfJKqhfa8+VKvXhVJpj1hfsqzW/5evQFuFTToX9rfl2u+3frXpS3rmbuCw+ZdfgFf3TJZByb94hzIYq4VdzE9/4sHxUT5LVaYJQs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747050588; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=ypLBf3MR7liu9tHQt1GbDT9p+WQwauRj8eH15ox24fc=;
 b=Pw8Fga4nlQ+trBfPIBGzyf2RhOc09PKi2TpMd5yHuKrEFLhouZ/DhNjcyFSRoFsl
 xIZmizmwTjBmkJ+wZ2axcNni+F9tfEvKrNxlPgLwCZPoA3MXOPRm0LnLCMea/8FQQ+l
 ACDPSWh7snJt/aagfxmZxI+8HuRVRMhhKq5Ut6Ic=
Received: by mx.zohomail.com with SMTPS id 1747050585205203.50344662119107;
 Mon, 12 May 2025 04:49:45 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [RFC v3 01/33] rust: drm: Add a small handful of fourcc bindings
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250305230406.567126-2-lyude@redhat.com>
Date: Mon, 12 May 2025 08:49:28 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>, mcanal@igalia.com,
 Alice Ryhl <aliceryhl@google.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <sima@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Asahi Lina <lina@asahilina.net>, open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BE7E6D90-37A1-4A5B-A761-70AE5A82D5DA@collabora.com>
References: <20250305230406.567126-1-lyude@redhat.com>
 <20250305230406.567126-2-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
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

Hi Lyude,

> On 5 Mar 2025, at 19:59, Lyude Paul <lyude@redhat.com> wrote:
>=20
> This adds some very basic rust bindings for fourcc. We only have a =
single
> format code added for the moment, but this is enough to get a driver
> registered.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
> V3:
> * Drop FormatList and ModifierList
>  These aren't actually needed as pointed out by Louis Chauvet
> * Add a constant for FORMAT_MOD_INVALID
>  I realized that we actually need this because the format list isn't
>  terminated with a 0 like I thought, and we can't pick this up
>  automatically through bindgen
> * Split out the FormatInfo WIP
>  We'll want this someday, but not yet.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/kernel/drm/fourcc.rs | 21 +++++++++++++++++++++
> rust/kernel/drm/mod.rs    |  1 +
> 2 files changed, 22 insertions(+)
> create mode 100644 rust/kernel/drm/fourcc.rs
>=20
> diff --git a/rust/kernel/drm/fourcc.rs b/rust/kernel/drm/fourcc.rs
> new file mode 100644
> index 0000000000000..62203478b5955
> --- /dev/null
> +++ b/rust/kernel/drm/fourcc.rs
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +//! DRM fourcc bindings.
> +//!
> +//! C header: =
[`include/uapi/drm/drm_fourcc.h`](srctree/include/uapi/drm/drm_fourcc.h)
> +
> +/// Return a fourcc format code.
> +const fn fourcc_code(a: u8, b: u8, c: u8, d: u8) -> u32 {
> +    (a as u32) | (b as u32) << 8 | (c as u32) << 16 | (d as u32) << =
24
> +}
> +
> +// TODO: We manually import this because we don't have a reasonable =
way of getting constants from
> +// function-like macros in bindgen yet.
> +#[allow(dead_code)]
> +pub(crate) const FORMAT_MOD_INVALID: u64 =3D 0xffffffffffffff;

Isn=E2=80=99t this just u64::MAX?

> +
> +// TODO: We need to automate importing all of these. For the time =
being, just add the single one
> +// that we need
> +
> +/// 32 bpp RGB
> +pub const XRGB888: u32 =3D fourcc_code(b'X', b'R', b'2', b'4');
> diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
> index c44760a1332fa..2c12dbd181997 100644
> --- a/rust/kernel/drm/mod.rs
> +++ b/rust/kernel/drm/mod.rs
> @@ -5,5 +5,6 @@
> pub mod device;
> pub mod drv;
> pub mod file;
> +pub mod fourcc;
> pub mod gem;
> pub mod ioctl;
> --=20
> 2.48.1
>=20
>=20

