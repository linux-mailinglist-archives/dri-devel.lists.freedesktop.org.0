Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27071A6ECDD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 10:43:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8366A10E394;
	Tue, 25 Mar 2025 09:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c7EGESl2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EE610E521
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 09:43:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A56A9A4A63B;
 Tue, 25 Mar 2025 09:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13445C4CEE4;
 Tue, 25 Mar 2025 09:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742895828;
 bh=npI0ndsczys6+b4roCsPnmGmK3zIFp25GSsVytASrkc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c7EGESl22gT6F6f7NGR0wf2KlQOYKzG6WRbZRCS1YzkvF+SUgAyo4F352/hr817pc
 oLvuLYnm6wyKpkZAuPvQB//CW5ljDyGI713pAEODubEvqutRs+TFSJa0JM00aymOGH
 qhvrNgSW5UX85pac+6Fg0XmcSFpZYzkFee/PVWvRb8asYzwCi2V6xJDk+lGu/oWsEU
 BhWKYdophdPgOF9cF38/Xm7lHHc7W4cCy8257dY97W9q/SYK+FuR96VjEtJk2lTYJF
 0ws+0fGJO4J1kDuAsmuAr5MqDyPpkUw9bZYX0eHP+gcc2IpYpf5BL2jZIGwBCW+45K
 XBBAYtjlrr0lQ==
Date: Tue, 25 Mar 2025 10:43:45 +0100
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
Message-ID: <20250325-sage-catfish-of-art-5eede3@houat>
References: <20250305230406.567126-1-lyude@redhat.com>
 <20250305230406.567126-11-lyude@redhat.com>
 <20250314-observant-cyber-chowchow-bfe5f9@houat>
 <dea3218eb31f3e91d2a10f93a7bc6cfa674546e6.camel@redhat.com>
 <2d39187892737438c35791aa59681b1af7e62de7.camel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="oxntiycjdkz5tlww"
Content-Disposition: inline
In-Reply-To: <2d39187892737438c35791aa59681b1af7e62de7.camel@redhat.com>
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


--oxntiycjdkz5tlww
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC v3 10/33] rust: drm/kms: Add
 ConnectorGuard::add_modes_noedid()
MIME-Version: 1.0

On Fri, Mar 21, 2025 at 07:52:23PM -0400, Lyude Paul wrote:
> On Fri, 2025-03-21 at 19:50 -0400, Lyude Paul wrote:
> > On Fri, 2025-03-14 at 13:02 +0100, Maxime Ripard wrote:
> > > On Wed, Mar 05, 2025 at 05:59:26PM -0500, Lyude Paul wrote:
> > > > A simple binding for drm_add_modes_noedid() using the ConnectorGuar=
d type
> > > > we just added.
> > > >=20
> > > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > > ---
> > > >  rust/bindings/bindings_helper.h  |  1 +
> > > >  rust/kernel/drm/kms/connector.rs | 11 +++++++++++
> > > >  2 files changed, 12 insertions(+)
> > > >=20
> > > > diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindin=
gs_helper.h
> > > > index 27828dd36d4f2..846eb6eb8fc4c 100644
> > > > --- a/rust/bindings/bindings_helper.h
> > > > +++ b/rust/bindings/bindings_helper.h
> > > > @@ -13,6 +13,7 @@
> > > >  #include <drm/drm_crtc.h>
> > > >  #include <drm/drm_device.h>
> > > >  #include <drm/drm_drv.h>
> > > > +#include <drm/drm_edid.h>
> > > >  #include <drm/drm_encoder.h>
> > > >  #include <drm/drm_file.h>
> > > >  #include <drm/drm_fbdev_dma.h>
> > > > diff --git a/rust/kernel/drm/kms/connector.rs b/rust/kernel/drm/kms=
/connector.rs
> > > > index 14de3b0529f89..855a47b189a91 100644
> > > > --- a/rust/kernel/drm/kms/connector.rs
> > > > +++ b/rust/kernel/drm/kms/connector.rs
> > > > @@ -446,6 +446,17 @@ fn deref(&self) -> &Self::Target {
> > > >      }
> > > >  }
> > > > =20
> > > > +impl<'a, T: DriverConnector> ConnectorGuard<'a, T> {
> > > > +    /// Add modes for a [`ConnectorGuard`] without an EDID.
> > > > +    ///
> > > > +    /// Add the specified modes to the connector's mode list up to=
 the given maximum resultion.
> > > > +    /// Returns how many modes were added.
> > > > +    pub fn add_modes_noedid(&self, (max_h, max_v): (i32, i32)) -> =
i32 {
> > >=20
> > > Why do we need a tuple of i32 there instead of two u32/usize paramete=
r?
> > >=20
> > > And the return type should be unsigned as well.
> >=20
> > I think I was just copying C (or whatever the bindings here translate t=
he C
> > type to), but I don't see any issue with changing this to u32.
>=20
> ...wait. Now I remember why I did this: it's not that we expect it to be
> unsigned, it's that the largest possible u32 value cannot be expressed in=
 a
> i32, and I think the C side of things uses i32. Days like this I really w=
ish
> we had a u31...
>=20
> think it would be OK for us to convert this to unsigned on the C side of
> things?

Yeah, I can't think of a valid reason to use a signed integer for a
maximum size.

Maxime

--oxntiycjdkz5tlww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ+J6zQAKCRAnX84Zoj2+
dpXTAYDGVzbqu/X+saivvhCPH2YLWD6MWARZYKBOIeGahaH7hJR2bFSLODMnxhn/
CZFm0CgBgJCwgds5uW6jOhXIdiWbMZ+/Fp/7ySr9uAG4GFSgohPdfPD17FvpAqoR
Uz+a+/6NCQ==
=eYMF
-----END PGP SIGNATURE-----

--oxntiycjdkz5tlww--
