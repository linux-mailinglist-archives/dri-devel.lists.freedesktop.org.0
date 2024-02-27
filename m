Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1553868AE1
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 09:40:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498AE10E082;
	Tue, 27 Feb 2024 08:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hFdAO9SK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A067910E082
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 08:40:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 128E9614B5;
 Tue, 27 Feb 2024 08:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81465C433F1;
 Tue, 27 Feb 2024 08:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709023248;
 bh=Em2a/urkZDyhcXpSnAimfdTbiXDrAu+aKcEZkJz8nzc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hFdAO9SK13Wnhfno5w3knzVTwmLQj6XFlc+XKNmJ5wOjiNXuY7tsajBkpBscq/djS
 yxpYZfTLTZwqsMdJ7VMPqKKZ9dNfCGVxcmT4ALq0U01HC17UjjEixxZVML3341vDoX
 TFUUjTXREv66Ks18ILHy8dhxIevaCpZsxeB7R3QEv0aNvudxtZ/EYkw9V7QXl5ip11
 Bvp2Pf5mYMIY2FT0ZU5m9Csn7Q639+e0lAlHqkP3ZOW3tVkl/N9uSdjPAAs5MxlazB
 Uxd8ERTL0JzWPzHIQf8kwMgjJlemg+LZxjOvpH2/O/MJT/HUYZ3M2obBa1AMnbORjt
 mWo6InlSEJuhw==
Date: Tue, 27 Feb 2024 09:40:46 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 Daniel Stone <daniels@collabora.com>
Subject: Re: [rerere PATCH] nightly.conf: Switch drm.git to gitlab
Message-ID: <cio25i4zde6mww37tiifpbd5uk2nz543bizehmyrxm4zsndpxb@4nreyv3rwqie>
References: <20240226151631.130754-1-mripard@kernel.org>
 <87jzmql3tj.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="b34pmoefkc5xgjnl"
Content-Disposition: inline
In-Reply-To: <87jzmql3tj.fsf@intel.com>
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


--b34pmoefkc5xgjnl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 27, 2024 at 10:16:40AM +0200, Jani Nikula wrote:
> On Mon, 26 Feb 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > Start the big migration with drm.git.
> >
> > Existing remotes need to be adjusted with
> >
> > git remote set-url drm ssh://git@gitlab.freedesktop.org:drm/kernel.git
>=20
> It should be either
>=20
> git@gitlab.freedesktop.org:drm/kernel.git
>=20
> or
>=20
> ssh://git@gitlab.freedesktop.org/drm/kernel.git
>=20
> (Note the : vs / in there.)

I caught that one before merging it, so we should be all set, thanks for th=
e report :)

Maxime

--b34pmoefkc5xgjnl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZd2gDQAKCRDj7w1vZxhR
xcTLAP9ZsZrr9RpBggRj4h74YDJwkO8CDu7VmQ995MWl61IkXgEAuIH+N8FWXuYP
cpXoEDt0iSweKr95tS7LD70NyO+ixA4=
=vs+h
-----END PGP SIGNATURE-----

--b34pmoefkc5xgjnl--
