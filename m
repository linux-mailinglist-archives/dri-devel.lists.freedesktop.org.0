Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E536BA61091
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 13:02:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9877110E35A;
	Fri, 14 Mar 2025 12:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oc2saaN9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE8010E35A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 12:02:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7D89AA465D4;
 Fri, 14 Mar 2025 11:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F47FC4CEE3;
 Fri, 14 Mar 2025 12:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741953735;
 bh=DxlDbkBzr4znIgU6IscNEeJX4PHbICaYy1q6UNsHLFM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oc2saaN9Xikyg6AgWau8kme9n7KeZo3balbPNV47lmtT5xJE2Dej//U4hWAFKAwtV
 63Ah7SuEHDObq+Dd4HWyEomOCXa6h5BkXOn4Qm7j9hx66ARWs18VglMXwoiHA16L07
 yToKkSAb+D6Y39WM9PPBJ+6nV+IcJwDDcxPweQShyIFfr6tsXargeIITqvjoYaWmI2
 Ey3vG/bS7tG9nCq4qrXj/f/5Vc4149b0BSJBU1wRka4MOX0TB02nWrbw8d7Wb8IAe/
 0zYrT/gj5j4ALMH28t5acAX8C+K1YEfLQkaKCIyiC8BFBujzV6FQn17YSop9s9FBSe
 IXRLfa+tdvRSQ==
Date: Fri, 14 Mar 2025 13:02:12 +0100
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Asahi Lina <lina@asahilina.net>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC v3 10/33] rust: drm/kms: Add
 ConnectorGuard::add_modes_noedid()
Message-ID: <20250314-observant-cyber-chowchow-bfe5f9@houat>
References: <20250305230406.567126-1-lyude@redhat.com>
 <20250305230406.567126-11-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="pez3lnltw5krpfnp"
Content-Disposition: inline
In-Reply-To: <20250305230406.567126-11-lyude@redhat.com>
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


--pez3lnltw5krpfnp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC v3 10/33] rust: drm/kms: Add
 ConnectorGuard::add_modes_noedid()
MIME-Version: 1.0

On Wed, Mar 05, 2025 at 05:59:26PM -0500, Lyude Paul wrote:
> A simple binding for drm_add_modes_noedid() using the ConnectorGuard type
> we just added.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/bindings/bindings_helper.h  |  1 +
>  rust/kernel/drm/kms/connector.rs | 11 +++++++++++
>  2 files changed, 12 insertions(+)
>=20
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index 27828dd36d4f2..846eb6eb8fc4c 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -13,6 +13,7 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_fbdev_dma.h>
> diff --git a/rust/kernel/drm/kms/connector.rs b/rust/kernel/drm/kms/conne=
ctor.rs
> index 14de3b0529f89..855a47b189a91 100644
> --- a/rust/kernel/drm/kms/connector.rs
> +++ b/rust/kernel/drm/kms/connector.rs
> @@ -446,6 +446,17 @@ fn deref(&self) -> &Self::Target {
>      }
>  }
> =20
> +impl<'a, T: DriverConnector> ConnectorGuard<'a, T> {
> +    /// Add modes for a [`ConnectorGuard`] without an EDID.
> +    ///
> +    /// Add the specified modes to the connector's mode list up to the g=
iven maximum resultion.
> +    /// Returns how many modes were added.
> +    pub fn add_modes_noedid(&self, (max_h, max_v): (i32, i32)) -> i32 {

Why do we need a tuple of i32 there instead of two u32/usize parameter?

And the return type should be unsigned as well.

Maxime

--pez3lnltw5krpfnp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9QawwAKCRAnX84Zoj2+
drIUAX44y6dqTjQt0FYqsmifts7sm6UEPpSeSxEgUIguEk9jAk+VzWO5ipvtIhGC
p9swKBoBgIJvQe6kLXZhdsL+wjDcJsDiP+y3OAp4lU/Rnn3rwCDMbZHxH4mKP/+Q
cUHYplPjHg==
=AXEJ
-----END PGP SIGNATURE-----

--pez3lnltw5krpfnp--
