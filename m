Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7203CA61178
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 13:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5569F10E25C;
	Fri, 14 Mar 2025 12:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Bi2H7ffs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8EA10E25C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 12:37:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 46AE65C0FA8;
 Fri, 14 Mar 2025 12:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4094AC4CEE3;
 Fri, 14 Mar 2025 12:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741955831;
 bh=KxIEi80jVpscrOK/T0CTnVvYvlg+rggm6v1zExgqMf4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bi2H7ffspq5mUhqYPpqGiyD5qbRWU5E5NCz4rKvmB10E4ARnYw3tlY7hmiXF0YsnC
 Yg9l8fR0jBW8mJmC1SLOM1576pjxsqkSaMyX2QwoE33prMfzw5Vs6QKpTpPbS9YBYV
 vxtOlslfV6Lleq49KOtVqF5QGZQFrGNHfKfMcp0QZGFjajrDDBYR5J3P0z+6hWZHH5
 VuQEBSVgqABjRBd79gcfXpfY6DPiD+WowJ7WHUFrZTU0BqvVAYi7UnS7SGQ/iV2S0g
 y4zTsk+4dCiIzwq5yJccECizZotGryLzeCPAk2wb6rbbNUHEcC7wlWLxCzLevqSyp8
 USRWn9qBS/8BA==
Date: Fri, 14 Mar 2025 13:37:09 +0100
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
Subject: Re: [RFC v3 31/33] rust: drm/kms: Add VblankSupport
Message-ID: <20250314-archetypal-unnatural-rat-7108da@houat>
References: <20250305230406.567126-1-lyude@redhat.com>
 <20250305230406.567126-32-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="denalhorl4a6pqr5"
Content-Disposition: inline
In-Reply-To: <20250305230406.567126-32-lyude@redhat.com>
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


--denalhorl4a6pqr5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC v3 31/33] rust: drm/kms: Add VblankSupport
MIME-Version: 1.0

On Wed, Mar 05, 2025 at 05:59:47PM -0500, Lyude Paul wrote:
> This commit adds bindings for implementing vblank support for a driver's
> CRTCs. These bindings are optional, to account for the fact that not all
> drivers have dedicated hardware vblanks.

Do we really have drivers not having a vblank implementation?

Not having dedicated hardware vblank, sure. vkms and any writeback
implementation are probably in this case. But they still provide some
vblank implementation.

> In order to accomplish this, we introduce the VblankSupport trait which c=
an
> be implemented on DriverCrtc by drivers which support vblanks. This works
> in the same way as the main Kms trait - drivers which don't support
> hardware vblanks can simply pass PhantomData<Self> to the associated type
> on DriverCrtc. If a driver chooses to implement VblankSupport, VblankImpl
> will be implemented by DRM automatically - and can be passed to the
> VblankImpl associated type on DriverCrtc.
>=20
> Additionally, we gate methods which only apply to vblank-supporting drive=
rs
> by introducing a VblankDriverCrtc trait that is automatically implemented
> by DRM for CRTC drivers implementing VblankSupport. This works basically =
in
> the same way as Kms and KmsDriver, but for CRTCs.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
>=20
> Notes:
>=20
> * One thing to keep in mind: this trait is implemented on the CRTC as
>   opposed to the KMS driver due to the possibility that a driver may have
>   multiple different types of CRTCs. As a result, it's not impossible that
>   there could potentially be differences in each type's vblank hardware
>   implementation.

It's not that it's not impossible, it's that it's pretty normal
actually. Any KMS driver supporting writeback for example is very likely
to have two different vblank implementation, depending on whether you're
using one of the actual CRTC, or the controller that provides writeback
support.

Maxime

--denalhorl4a6pqr5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9Qi9AAKCRAnX84Zoj2+
do/eAX9yJy9NAkB+1E0Shmq6BDnL840ADjFH93KOoYYZHkUYGNoGIpYG749RluCz
EY4kUXYBfi3JFhwvnggIWQbdYhVAzsCm/mTyvK0znth+gePVNlcQt4k2joyJk0X7
jb2imnMWlg==
=Xryc
-----END PGP SIGNATURE-----

--denalhorl4a6pqr5--
