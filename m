Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E43E87BB24
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 11:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA6410EA23;
	Thu, 14 Mar 2024 10:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o3jZCmdL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423B010F48E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 10:20:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A55EDCE1BD8;
 Thu, 14 Mar 2024 10:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC75C43390;
 Thu, 14 Mar 2024 10:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710411611;
 bh=fBCom8ToeEHNjaY4G4ZUw7DCMQHUdPGYRbplhPNNJdQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o3jZCmdLz0MJiL87yzSPhpH3N4OXRQqpvwtPd9bkpdzIDFbwCYwOz7qazVlamnJc+
 yvfyj1dV9jdCcGaa2v0awM+1BjEKjxj+wLxT4gc2PjRVxJVRJ2f2SUEQnSaVVtD6ps
 c7/z+xyjToqTsVWsBsqt5zPkNgHAqmjUWZ6vqQsRMMCxOspwhO5GsymU7RWvFTgDFb
 +aKvRsiZ5872SfRhsZIjc0oDC+e4aSn9vHs4bjYD/7+dk6ud9Ep/fhZRaWli1V9aDz
 81OaQ/Nr0WnKXIoVwRK5UblC1CBe4vnqSUFOFHn3q74ZlTmbO7ddwNbnS3LvfUNtsG
 EMbWa8/KuHd9g==
Date: Thu, 14 Mar 2024 11:20:09 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sebastian Wick <sebastian.wick@redhat.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm: Document requirements for driver-specific KMS
 props in new drivers
Message-ID: <20240314-portable-pragmatic-weasel-7dd91e@houat>
References: <20240311155904.323488-1-sebastian.wick@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="w57l5nqlkliw3m2d"
Content-Disposition: inline
In-Reply-To: <20240311155904.323488-1-sebastian.wick@redhat.com>
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


--w57l5nqlkliw3m2d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 04:58:58PM +0100, Sebastian Wick wrote:
> When extending support for a driver-specific KMS property to additional
> drivers, we should apply all the requirements for new properties and
> make sure the semantics are the same and documented.
>=20
> v2: devs of the driver which introduced property shall help and ack
>=20
> Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

We probably want to have Dave or Sima ack on that one too

Maxime

--w57l5nqlkliw3m2d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZfLPWAAKCRDj7w1vZxhR
xfghAQC7OSZf7yywB2sm09qtEq9WVbV1okCQlxILrOaq2QR50AEAmpIZIpqTPGyg
bxCHCG25dSkSR8Z7mCnUI41Wkl38DQg=
=SJRy
-----END PGP SIGNATURE-----

--w57l5nqlkliw3m2d--
