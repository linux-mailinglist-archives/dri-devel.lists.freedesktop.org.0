Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FECA61016
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 12:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029F110E9D9;
	Fri, 14 Mar 2025 11:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cdrlzM/K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E2310E9D9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 11:37:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EBCD8A458FE;
 Fri, 14 Mar 2025 11:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D1AC4CEEB;
 Fri, 14 Mar 2025 11:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741952261;
 bh=/ducklgq3qbSOMbklVlJ6IhWYbVozO9MW5vXqgwzMz0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cdrlzM/KyasdCQ1zX4PQ2FgwFqa/9SAz4YDqQ4dQe6ZAPufzBE7OwknbsqhB62YUs
 J5myiyorEy8FraM1qP86aosDXhhH2crWP+DDN21vvXBkuwARlw8+u42FB/AnyiyA7f
 NjIYnjuGkrkGF/a99wrZjCrdFMaWcFUGWw7KYDjv14kQa4HNBv0kfk9/K2mL5sOyJg
 EF27jhioS2M+d8lfruZlytqR1RgppsVi13MgQfhxAFV5lNbEr8RBLaDyiVyqAkXZFg
 Kjmmb62JmiqxOsjxz6Skq0y9c+hwcLkKTkgVOZapogydbuvYCAURiRP/3XGPUpxoL7
 xcIVkJrFfNjjg==
Date: Fri, 14 Mar 2025 12:37:38 +0100
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
Subject: Re: [RFC v3 05/33] rust: drm/kms: Add drm_plane bindings
Message-ID: <20250314-tunneling-brown-hornet-a6c584@houat>
References: <20250305230406.567126-1-lyude@redhat.com>
 <20250305230406.567126-6-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="duvbmloyjxh2mbgy"
Content-Disposition: inline
In-Reply-To: <20250305230406.567126-6-lyude@redhat.com>
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


--duvbmloyjxh2mbgy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC v3 05/33] rust: drm/kms: Add drm_plane bindings
MIME-Version: 1.0

On Wed, Mar 05, 2025 at 05:59:21PM -0500, Lyude Paul wrote:
> The next step is adding a set of basic bindings to create a plane, which
> has to happen before we can create a CRTC (since we need to be able to at
> least specify a primary plane for a CRTC upon creation). This mostly
> follows the same general pattern as connectors (AsRawPlane,
> AsRawPlaneState, etc.).
>=20
> There is one major difference with planes vs. other types of atomic mode
> objects: drm_plane_state isn't the only base plane struct used in DRM
> drivers, as some drivers will use helpers like drm_shadow_plane_state whi=
ch
> have a drm_plane_state embedded within them.

It's one of the things where I also think you could have broken down the
patch some more. drm_shadow_plane_state, while useful, is not central
and could be handled later on. Both would ease the review, and we could
merge the "central" plane support without it if we disagree only on that
part for example.


> Since we'll eventually be adding bindings for shadow planes, we introduce=
 a
> PlaneStateHelper trait - which represents any data type which can be used
> as the main wrapping structure around a drm_plane_state - and we implement
> this trait for PlaneState<T>. This trait can be used in our C callbacks to
> allow for drivers to use different wrapping structures without needing to
> implement a separate set of FFI callbacks for each type. Currently planes
> are the only type I'm aware of which do this.

And I don't think it's any different to any other driver structure. It
looks like most of the users except two don't have any additional data
so can't we do something like

struct ShadowPlaneState<T: Default> {
	...,

	data: T,
}

And just put that into PlaneState just like any other driver?

Maxime

--duvbmloyjxh2mbgy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9QU/QAKCRAnX84Zoj2+
dpDKAX49Gw6qHl6j7xEXXRSEwjih+jxSiFoh9OJ48hfFg08oCXGyiMh3sDuHbUPp
Q4QU9lYBgKIW9H+1CKLusAv0dhXRvGYLWEYZnQYF7y9MXRSvwLSONAJsWF2efxZB
uGElPX8uFw==
=o7sn
-----END PGP SIGNATURE-----

--duvbmloyjxh2mbgy--
