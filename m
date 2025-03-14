Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D1DA60F43
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 11:45:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C4910E30C;
	Fri, 14 Mar 2025 10:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m3QCcD2F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922FB10E30C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 10:44:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 21AC1A45234;
 Fri, 14 Mar 2025 10:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE63C4CEE3;
 Fri, 14 Mar 2025 10:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741949094;
 bh=3xXe9cL0jqciAGlNVAvM5pFZkd0H2R4t8V4HdIfECpE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m3QCcD2FP143X+Wwipr0T0R9vkNiZ57VQOk3kn8gLTRBj3xBE8yqnncAxAeRpjUAR
 2jRJV5rXv6OihKzrWBWrWU505xGkQy+lnCmhXtfnRv0KvkeCSrxFBCtKjIN0Ki9lfo
 stePMsqsZaKKJyQBZq5wEUtcVkK2hFYPTjadO8Plgdcgy3pRcrsUi+LgOVxUdNjIqf
 SKrWZKPonjA6Po69VAP2NgkiulqrMwtFtpTB/PjFBLaSnBFrCObjKqmbbDpNJ0Oe6f
 XdapsEuMwnOHXMnZrG4sY3dPuKhUwKa0W5QmgjlvZsLwQ6wObwBOK8QlHbMhyk8nJx
 4i47tZurPprxg==
Date: Fri, 14 Mar 2025 11:44:52 +0100
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
Subject: Re: [RFC v3 03/33] rust: drm/kms: Introduce the main
 ModeConfigObject traits
Message-ID: <20250314-friendly-hilarious-axolotl-ccf19e@houat>
References: <20250305230406.567126-1-lyude@redhat.com>
 <20250305230406.567126-4-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ndn5jrobqdpkuzie"
Content-Disposition: inline
In-Reply-To: <20250305230406.567126-4-lyude@redhat.com>
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


--ndn5jrobqdpkuzie
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC v3 03/33] rust: drm/kms: Introduce the main
 ModeConfigObject traits
MIME-Version: 1.0

On Wed, Mar 05, 2025 at 05:59:19PM -0500, Lyude Paul wrote:
> The KMS API has a very consistent idea of a "mode config object", which
> includes any object with a drm_mode_object struct embedded in it. These
> objects have their own object IDs which DRM exposes to userspace, and we
> introduce the ModeConfigObject trait to represent any object matching the=
se
> characteristics.
>=20
> One slightly less consistent trait of these objects however: some mode
> objects have a reference count, while others don't. Since rust requires
> that we are able to define the lifetime of an object up-front, we introdu=
ce
> two other super-traits of ModeConfigObject for this:

I'm not entirely sure what you mean by that, sorry. Would you have a
small example of the challenge that forced you to split it into two
separate traits?

> * StaticModeObject - this trait represents any mode object which does not
>   have a reference count of its own. Such objects can be considered to
>   share the lifetime of their parent KMS device

I think that part is true for both cases. I'm not aware of any
reference-counted object that might outlive the DRM device. Do you have
an example?

> * RcModeObject - this trait represents any mode object which does have its
>   own reference count. Objects implementing this trait get a free blanket
>   implementation of AlwaysRefCounted, and as such can be used with the AR=
ef
>   container without us having to implement AlwaysRefCounted for each
>   individual mode object.
>=20
> This will be able to handle most lifetimes we'll need with one exception:
> it's entirely possible a driver may want to hold a "owned" reference to a
> static mode object.

I guess it kind of derives from the conversation above, but would you
have an example of a driver wanting to have a reference to a mode object
that isn't on the same lifetime than the DRM device?

Maxime

--ndn5jrobqdpkuzie
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9QIngAKCRAnX84Zoj2+
dgfCAYDJpSkIJQ3BIcvY8iCyi3ZbDQocyJRHjcZWbIu4GbuAmznpS+V/4Vg3uNAj
I5FNIC8Bf09cFAOnftFn/5P4DEJYaWozLHdDPvRj/vL7WvHwqyLfFjXW7SoF+EGL
ZNEgAHlSHA==
=PqlL
-----END PGP SIGNATURE-----

--ndn5jrobqdpkuzie--
