Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA5D7D6E90
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 16:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A4210E5B8;
	Wed, 25 Oct 2023 14:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4263410E5B8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 14:19:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 96D9A61DBC;
 Wed, 25 Oct 2023 14:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBE99C433C7;
 Wed, 25 Oct 2023 14:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698243582;
 bh=HUv0RMuGrpb8dPBdvDPChe7HWxUC49RFEkjOVrmX5xY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kBVyrrgs9Rwyf0GhTtqYupFAtBS6awdBhtopM7Aqk7vyvFx3a1v2/hhd1QNWfZ+dO
 oqOvr2UN61oGlLVR+fwWuIkxdJk2z4g6cAl0BbN7Ebhc79skf0wxUMwjVk7IJsZ41T
 8cu9iBibrwI04d/ShIQ67lLtEa30OuZia6FwCtI5MoslTyEJ+DDEYkLe+gUNXU7QnC
 koTmRgUxs1D7hFhPiSqah2AlpqyhuBd+htjAyxLyF5qMVoJE3dVT0DUokwuTAtlBvw
 CMqLE5tSm9kR+rqU2adItB4uMhr9kLgxcWgNqsS8KJEmegdRedqa5vhaxnzaS7jXBh
 LkDYMsiZRLdvg==
Date: Wed, 25 Oct 2023 16:19:39 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH] drm/doc: ci: Require more context for flaky tests
Message-ID: <5mhwzpeamncih6oorkdq44ub7msqatssg5w5f6y5bdjpy7mgf5@5jernjke5ypf>
References: <20231019094609.251787-1-mripard@kernel.org>
 <ba2cd566-328d-4a47-9ab8-05817c14f0bd@collabora.com>
 <b8b5def4-a178-4bfc-a7e8-1a2ebc80d7aa@collabora.com>
 <w723qfygjvfhyu2udaquqad6haea3m5adoclzxz47b2xzbuiir@mxel33ctr3bs>
 <4d2362d8-d88b-4878-8d1a-f54458ebfc9b@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7vlovdnxvkg4pjyp"
Content-Disposition: inline
In-Reply-To: <4d2362d8-d88b-4878-8d1a-f54458ebfc9b@collabora.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Vignesh Raman <vignesh.raman@collabora.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7vlovdnxvkg4pjyp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 25, 2023 at 09:47:07AM -0300, Helen Koike wrote:
> > > > > +=A0 # Version: 6.6-rc1
> > > > > +=A0 # Failure Rate: 100
> > >=20
> > > Maybe also:
> > >=20
> > >    # Pipeline url:
> > > https://gitlab.freedesktop.org/helen.fornazier/linux/-/pipelines/1014=
435
> >=20
> > Sounds like a good idea yeah :) Are those artifacts archived/deleted at
> > some point or do they stick around forever?
>=20
> Good point, I asked the admins, they stick for 4 weeks (could be more, but
> it is not forever) :(

That's not even a release cycle :/

I guess it's too short to be useful. We can definitely revisit if that
delay is extended at some point though.

Maxime

--7vlovdnxvkg4pjyp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTkj+wAKCRDj7w1vZxhR
xQCxAQDAnVDZRTG993pUhvl9m9sxsYmd3jdZcI0nN5xY2uDF/gEA3GMzkIi2Vynh
/rqRC0QnOts3/h6mJkybVivLKxnR4QU=
=5XoM
-----END PGP SIGNATURE-----

--7vlovdnxvkg4pjyp--
