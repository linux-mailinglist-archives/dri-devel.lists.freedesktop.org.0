Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0ECA6109A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 13:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEEE10E26E;
	Fri, 14 Mar 2025 12:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GWgE8Vok";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7113910E26E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 12:04:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 97703A45234;
 Fri, 14 Mar 2025 11:58:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92356C4CEE3;
 Fri, 14 Mar 2025 12:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741953863;
 bh=eDunAIeASy7Pjg5qTAnpOdksPevECMyo44pXuVgDuJU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GWgE8VokPJ+VVTMmnh2Ulc2HT3tMuksI6Yz65gHuVo/M5VfTaPCDCrBBmJbydELb7
 eyEmiMzTGKNzIoxWyYXAIbE0SsP26wS6CZeNSmL/IAxgN9eGxT6g/+x8DNyU48iyPJ
 ci0GyECBRgEmafpLZ4JWeIY+Ro3F2XfIQr2GNR4rOcC+q/a5mm5HA+YDf7xG41eUsL
 +U0DR2FUCNmvHdFdMoI3rjZf/VxmZWOBoriOt7NjKtkjnv0ZtU67lK07Ja0e5r/fg/
 J2N9Oe9uZ7my29QjUohutm/Ek2X6yYDXj6zIyOPsSdQJhR0MJcnDK0JEegRcfBJxw5
 lAY4CV0hO6KVg==
Date: Fri, 14 Mar 2025 13:04:20 +0100
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
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC v3 12/33] rust: drm/kms: Add RawConnector and
 RawConnectorState
Message-ID: <20250314-meteoric-flounder-of-success-f9c9e1@houat>
References: <20250305230406.567126-1-lyude@redhat.com>
 <20250305230406.567126-13-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="s26t2q64hdk63c6l"
Content-Disposition: inline
In-Reply-To: <20250305230406.567126-13-lyude@redhat.com>
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


--s26t2q64hdk63c6l
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC v3 12/33] rust: drm/kms: Add RawConnector and
 RawConnectorState
MIME-Version: 1.0

On Wed, Mar 05, 2025 at 05:59:28PM -0500, Lyude Paul wrote:
> Now that we have more then one way to refer to connectors, we also want to
> ensure that any methods which are common to any kind of connector type can
> be used on all connector representations. This is where RawConnector and
> RawConnectorState come in: we implement these traits for any type which
> implements AsRawConnector or AsRawConnectorState respectively.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/drm/kms/connector.rs | 35 ++++++++++++++++++++++++++++++++
>  rust/kernel/drm/kms/crtc.rs      | 26 ++++++++++++++++++++++--
>  2 files changed, 59 insertions(+), 2 deletions(-)
>=20
> diff --git a/rust/kernel/drm/kms/connector.rs b/rust/kernel/drm/kms/conne=
ctor.rs
> index 244db1cfdc552..0cfe346b4760e 100644
> --- a/rust/kernel/drm/kms/connector.rs
> +++ b/rust/kernel/drm/kms/connector.rs
> @@ -397,6 +397,27 @@ pub fn attach_encoder(&self, encoder: &impl AsRawEnc=
oder) -> Result {
>      }
>  }
> =20
> +/// Common methods available on any type which implements [`AsRawConnect=
or`].
> +///
> +/// This is implemented internally by DRM, and provides many of the basi=
c methods for working with
> +/// connectors.
> +pub trait RawConnector: AsRawConnector {
> +    /// Return the index of this DRM connector
> +    #[inline]
> +    fn index(&self) -> u32 {
> +        // SAFETY: The index is initialized by the time we expose DRM co=
nnector objects to users,
> +        // and is invariant throughout the lifetime of the connector
> +        unsafe { (*self.as_raw()).index }
> +    }
> +
> +    /// Return the bitmask derived from this DRM connector's index
> +    #[inline]
> +    fn mask(&self) -> u32 {
> +        1 << self.index()
> +    }
> +}
> +impl<T: AsRawConnector> RawConnector for T {}
> +
>  unsafe extern "C" fn connector_destroy_callback<T: DriverConnector>(
>      connector: *mut bindings::drm_connector,
>  ) {
> @@ -536,6 +557,20 @@ pub trait FromRawConnectorState: AsRawConnectorState=
 {
>      unsafe fn from_raw_mut<'a>(ptr: *mut bindings::drm_connector_state) =
-> &'a mut Self;
>  }
> =20
> +/// Common methods available on any type which implements [`AsRawConnect=
orState`].
> +///
> +/// This is implemented internally by DRM, and provides many of the basi=
c methods for working with
> +/// the atomic state of [`Connector`]s.
> +pub trait RawConnectorState: AsRawConnectorState {
> +    /// Return the connector that this atomic state belongs to.
> +    fn connector(&self) -> &Self::Connector {
> +        // SAFETY: This is guaranteed safe by type invariance, and we're=
 guaranteed by DRM that
> +        // `self.state.connector` points to a valid instance of a `Conne=
ctor<T>`
> +        unsafe { Self::Connector::from_raw((*self.as_raw()).connector) }
> +    }
> +}
> +impl<T: AsRawConnectorState> RawConnectorState for T {}
> +
>  /// The main interface for a [`struct drm_connector_state`].
>  ///
>  /// This type is the main interface for dealing with the atomic state of=
 DRM connectors. In
> diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
> index 95c79ffb584cd..9950b09754072 100644
> --- a/rust/kernel/drm/kms/crtc.rs
> +++ b/rust/kernel/drm/kms/crtc.rs
> @@ -341,6 +341,26 @@ pub unsafe trait ModesettableCrtc: AsRawCrtc {
>      /// The type that should be returned for a CRTC state acquired using=
 this CRTC interface
>      type State: FromRawCrtcState;
>  }
> +
> +/// Common methods available on any type which implements [`AsRawCrtc`].
> +///
> +/// This is implemented internally by DRM, and provides many of the basi=
c methods for working with
> +/// CRTCs.
> +pub trait RawCrtc: AsRawCrtc {
> +    /// Return the index of this CRTC.
> +    fn index(&self) -> u32 {
> +        // SAFETY: The index is initialized by the time we expose Crtc o=
bjects to users, and is
> +        // invariant throughout the lifetime of the Crtc
> +        unsafe { (*self.as_raw()).index }
> +    }
> +
> +    /// Return the index of this DRM CRTC in the form of a bitmask.
> +    fn mask(&self) -> u32 {
> +        1 << self.index()
> +    }
> +}
> +impl<T: AsRawCrtc> RawCrtc for T {}
> +
>  unsafe impl Zeroable for bindings::drm_crtc_state {}
> =20
>  impl<T: DriverCrtcState> Sealed for CrtcState<T> {}
> @@ -432,8 +452,10 @@ pub trait AsRawCrtcState {
>      }
>  }
> =20
> -/// A trait for providing common methods which can be used on any type t=
hat can be used as an atomic
> -/// CRTC state.
> +/// Common methods available on any type which implements [`AsRawCrtcSta=
te`].
> +///
> +/// This is implemented internally by DRM, and provides many of the basi=
c methods for working with
> +/// the atomic state of [`Crtc`]s.
>  pub trait RawCrtcState: AsRawCrtcState {
>      /// Return the CRTC that owns this state.
>      fn crtc(&self) -> &Self::Crtc {

This looks like unrelated changes, or at least it's not mentioned in the co=
mmit log at all.

Maxime

--s26t2q64hdk63c6l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9QbRAAKCRAnX84Zoj2+
dhauAYDZdcNDT/zBuvE5DOr9kacVBlWkfSGrs2fOz1QWIj4U74eBG41HPoqxsYHK
Qieb6PYBgIF6VyGWr5UxoOQQxZBx5dI7WtX5wLDhc1G+MTNRa4BMPxAYNRxevb44
vDIQcgoHaw==
=eioq
-----END PGP SIGNATURE-----

--s26t2q64hdk63c6l--
