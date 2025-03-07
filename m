Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB1AA56DC2
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 17:33:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A10C10E079;
	Fri,  7 Mar 2025 16:32:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AmqZXY3e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315AD10EBE4
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 16:32:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D6F2EA45279;
 Fri,  7 Mar 2025 16:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87472C4CED1;
 Fri,  7 Mar 2025 16:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741365170;
 bh=IYtqKF6RNYuUGwDssKjvbaMKZWh50JK81ILez6ZwBro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AmqZXY3eAmBagMUhD/bF9pCoaMAre3597fTvRXSrgx4KDSzpE7OIrhKyPOsl9G1zE
 mHIiqQa3IM0TYy7GRM4nhxbbpZEc+CuhqdCQpru3xe08YHQWWiYMMKRsD0YYO0szML
 i8ho+W8Xm+/vmKubB9gMO7H3jKK+YCXJwnYSKeDSBMIJJ6gnHj+SeHS0Ia0I4u1Ny2
 ONY5aGltXyKbwzcdExuTaaXPyVX5yDfQe1ncNqFXYUSQK15T/tGjgMsASAF2BEL2AH
 tO9AbhOVMerxDn7HL3x7O1rzkoAcId7EgyftX2f8uMno4a25bkvjnwHaRE3tiAR4UF
 JD7iZDmoKjlww==
Date: Fri, 7 Mar 2025 17:32:46 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 Danilo Krummrich <dakr@kernel.org>, mcanal@igalia.com,
 Alice Ryhl <aliceryhl@google.com>, 
 Simona Vetter <sima@ffwll.ch>, Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Asahi Lina <lina@asahilina.net>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC v3 01/33] rust: drm: Add a small handful of fourcc bindings
Message-ID: <20250307-hypersonic-beryl-buzzard-d06c5f@houat>
References: <20250305230406.567126-1-lyude@redhat.com>
 <20250305230406.567126-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mbognbzweqfbmz6c"
Content-Disposition: inline
In-Reply-To: <20250305230406.567126-2-lyude@redhat.com>
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


--mbognbzweqfbmz6c
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC v3 01/33] rust: drm: Add a small handful of fourcc bindings
MIME-Version: 1.0

Hi,

On Wed, Mar 05, 2025 at 05:59:17PM -0500, Lyude Paul wrote:
> This adds some very basic rust bindings for fourcc. We only have a single
> format code added for the moment, but this is enough to get a driver
> registered.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
> V3:
> * Drop FormatList and ModifierList
>   These aren't actually needed as pointed out by Louis Chauvet
> * Add a constant for FORMAT_MOD_INVALID
>   I realized that we actually need this because the format list isn't
>   terminated with a 0 like I thought, and we can't pick this up
>   automatically through bindgen
> * Split out the FormatInfo WIP
>   We'll want this someday, but not yet.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/drm/fourcc.rs | 21 +++++++++++++++++++++
>  rust/kernel/drm/mod.rs    |  1 +
>  2 files changed, 22 insertions(+)
>  create mode 100644 rust/kernel/drm/fourcc.rs
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
> +//! C header: [`include/uapi/drm/drm_fourcc.h`](srctree/include/uapi/drm=
/drm_fourcc.h)
> +
> +/// Return a fourcc format code.
> +const fn fourcc_code(a: u8, b: u8, c: u8, d: u8) -> u32 {
> +    (a as u32) | (b as u32) << 8 | (c as u32) << 16 | (d as u32) << 24
> +}
> +
> +// TODO: We manually import this because we don't have a reasonable way =
of getting constants from
> +// function-like macros in bindgen yet.
> +#[allow(dead_code)]
> +pub(crate) const FORMAT_MOD_INVALID: u64 =3D 0xffffffffffffff;
> +
> +// TODO: We need to automate importing all of these. For the time being,=
 just add the single one
> +// that we need
> +
> +/// 32 bpp RGB
> +pub const XRGB888: u32 =3D fourcc_code(b'X', b'R', b'2', b'4');

It would be nice to keep the DRM prefix still. Fourccs aren't quite
standardized and the ones from v4l2 and DRM don't match for the same
formats.

The rest looks good to me

Maxime

--mbognbzweqfbmz6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ8sfrgAKCRDj7w1vZxhR
xVjHAQD6iHjWhdGUo4ttrAjNAbZcn611frmBg/w0iAIZKE9PaQD/e87kUsZqmpF5
VaUSzEUHmsQFXkNdEd+Dl4HibbOOEQc=
=lIqa
-----END PGP SIGNATURE-----

--mbognbzweqfbmz6c--
