Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B90E7D8171
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 13:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D25F10E116;
	Thu, 26 Oct 2023 11:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B455610E116
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 11:02:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0B200632E8;
 Thu, 26 Oct 2023 11:02:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5723AC433C7;
 Thu, 26 Oct 2023 11:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698318149;
 bh=zLbYQc4RPWTm6cj1FIA+4zPQH0fAAIZl4M3R1dFrBsM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sjxLsn1VIYcAWpQScXeSXszBbvB9MgNCOaWTZox5XNfP3pxlItyNcyraUmdGFxeCr
 RxceoUO7SGLIubmfjcJcHoWkXsBV04SDdrzmanKOmR1/2C4NORDof7TfoEbdhvRBaA
 WNjfZW3RGCkucscZ/05I192kJ9iY8+k4TF1rOFaEe87qXy/dNbPn+Sdl77YS6Uaw8R
 HE0v6VUkrGI0rW3wiiyX2kNvPXvanQS5c4CdVeRe7jwIXFY0FEjez1AlBmhCCclwa5
 9EVPC1P7QoBKghdTYUlz9cKFglPbc94J/EPhwab8QsxWBzXbh0mfwxEFwfp8RI2BG0
 YOL3Rfd8TwXag==
Date: Thu, 26 Oct 2023 13:02:27 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: Re: [PATCH] drm/doc: ci: Require more context for flaky tests
Message-ID: <2cn4lsfadj7qjp3fapeu7z36xvzmuzecqic5vjascb4ybzelqa@izqhugbrzmv2>
References: <20231019094609.251787-1-mripard@kernel.org>
 <169831792811.896759.18431283797442582804.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wktlz4p62tnsz5c2"
Content-Disposition: inline
In-Reply-To: <169831792811.896759.18431283797442582804.b4-ty@kernel.org>
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
Cc: Helen Koike <helen.koike@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wktlz4p62tnsz5c2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2023 at 12:58:48PM +0200, Maxime Ripard wrote:
> On Thu, 19 Oct 2023 11:46:09 +0200, Maxime Ripard wrote:
> > Flaky tests can be very difficult to reproduce after the facts, which
> > will make it even harder to ever fix.
> >=20
> > Let's document the metadata we agreed on to provide more context to
> > anyone trying to address these fixes.
> >=20
> >=20
> > [...]
>=20
> Applied to drm/drm-misc (drm-misc-next).

b4 might have been confused, but I only applied the v2.

Maxime

--wktlz4p62tnsz5c2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTpHQwAKCRDj7w1vZxhR
xb9sAP95IDXAYq0n7cA+22GJJ2CuI3KWP+o3Mgo7Jx3KPA4hcwD9EwufmBuN0QfO
vvNsT+9Nvma+i8aKvxLDGe2KfdKQ7wo=
=IvG/
-----END PGP SIGNATURE-----

--wktlz4p62tnsz5c2--
