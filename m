Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 454C7CA6B53
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 09:32:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 901A510E26B;
	Fri,  5 Dec 2025 08:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EpHlSGrK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFA410E26B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 08:32:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C8F3244162;
 Fri,  5 Dec 2025 08:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26500C4CEF1;
 Fri,  5 Dec 2025 08:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764923534;
 bh=c9amunadGf72qukjWj0Yig/o3zNWjowWuABEzR+a5j4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EpHlSGrKOs4sy2BLfgCYjpWCTF/aVgPpxmhRbSksP5gOYxTYuCGkmCSaP5zAYIOEl
 mtan7naNzAKDlhBNBPqtkADJHTnn8kdiwaxA1CQ25ySCrcHrrEmL57bGO0YIdmhpBC
 OmmOzqxhd4Mv6PYp8Lgjb64lWhBWX3AAhTjjM1VVuHelGXAIQuDxt6gcF687jmuuCo
 UOHbu4dvnrwMkC++mxqd4WOzq4HAdCP1rEEyVU10mNCaYRuRX8LjIXvmNI3bHDwPfA
 F0/PfQGSSLvJVEy1nvghXFi5uxc/Mp5q5PryzKxC2mbBhRwMjmIFCMALvTKpi5snOH
 RSvh9o+ZUusRg==
Date: Fri, 5 Dec 2025 09:32:11 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Linus Walleij <linusw@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Vicente Bergas <vicencb@gmail.com>
Subject: Re: [PATCH v5 0/3] drm/atomic-helpers: Fix MCDE/R-Car DU regressions
Message-ID: <20251205-magnificent-mink-of-completion-acef96@houat>
References: <20251130-mcde-drm-regression-thirdfix-v5-0-aed71a32981d@kernel.org>
 <20251202063403.GA18267@pendragon.ideasonboard.com>
 <aaec3da5-83bb-4de9-a999-67ed65711b90@ideasonboard.com>
 <20251203022229.GJ8219@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="w426pplwbuemy3ay"
Content-Disposition: inline
In-Reply-To: <20251203022229.GJ8219@pendragon.ideasonboard.com>
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


--w426pplwbuemy3ay
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 0/3] drm/atomic-helpers: Fix MCDE/R-Car DU regressions
MIME-Version: 1.0

On Wed, Dec 03, 2025 at 11:22:29AM +0900, Laurent Pinchart wrote:
> On Tue, Dec 02, 2025 at 10:58:50AM +0200, Tomi Valkeinen wrote:
> > On 02/12/2025 08:34, Laurent Pinchart wrote:
> > > On Sun, Nov 30, 2025 at 01:11:16PM +0100, Linus Walleij wrote:
> > >> This fixes two regressions experienced in the MCDE and
> > >> R-Car DU DRM drivers after
> > >> commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
> > >> "drm/atomic-helper: Re-order bridge chain pre-enable and post-disabl=
e"
> > >> caused a series of regressions in all panels that send
> > >> DSI commands in their .prepare() and .unprepare()
> > >> callbacks.
> > >>
> > >> This series make it possible to selectively bring back the
> > >> old behaviour with explicit semantics and implements
> > >> the old behaviour as modified commit tails in MCDE and
> > >> R-Car DU.
> > >=20
> > > We now have a third platform broken by
> > > c9b1150a68d9362a0827609fc0dc1664c0d8bfe1, see [1]. I think this calls
> > > for a revert, to give us the time to implement a correct solution.
> >
> > Perhaps... It's been very slow or not possible to get feedback regarding
> > (some) of the broken platforms, so I don't think we have a safe way of
> > changing the enable/disable sequence. I think the "correct" solution
> > then is to make this new enable/disable sequence either opt-in, offered
> > by the framework, or just implement it as a custom sequence in the
> > specific drm driver.
>=20
> I don't think that's right, sorry. We need to improve the bridge API to
> handle ordering properly. Changes to the commit tail handlers in display
> controller drivers are hacks, they handle issues with the internal DSI
> transmitters, but if you had a LVDS-to-DSI bridge in the pipeline things
> would still break.
>=20
> > Reverting c9b1150a68d9362a0827609fc0dc1664c0d8bfe1 will break DSI and
> > OLDI outputs on TI platforms, so we need to implement a fix for those
> > platforms before the revert, and there has been one or two fixes merged
> > for other platforms for this, which most likely also need to get revert=
ed.
>=20
> That's 3 vs. 1, so I think breaking DSI and OLDI with a revert is better
> than not reverting the commit. If we can merge a propert solution at the
> same time that's great, but the first target is to restore operation of
> the drivers that got broken.

Yeah, I agree. Could it be possible to flip the custom commit_tail
implementation and instead implement it into tidss while the core
changes are reverted to avoid the regressions and keeping tidss
functional?

Maxime

--w426pplwbuemy3ay
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaTKYhgAKCRAnX84Zoj2+
dm96AX9aFdLXVXxx6yJeAgbJvUYIUixO+lAuqMiQIJaRe59pt+BtEkeSLFw+SIuF
V7xf1BsBgPKNQ8TCge5gTH8thJ9iYxW+yrkQuIQWRs8cmIYJIC59Aue+lVXKhO22
wwTEoUkXUQ==
=NKno
-----END PGP SIGNATURE-----

--w426pplwbuemy3ay--
