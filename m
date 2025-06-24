Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AF6AE5D5E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 09:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A438010E1F9;
	Tue, 24 Jun 2025 07:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tOZI3s2w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C258C10E1F9
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 07:05:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1158661154;
 Tue, 24 Jun 2025 07:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47843C4CEE3;
 Tue, 24 Jun 2025 07:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750748712;
 bh=eukB8mJ6ncQwPDrZTpnRZ9v5SsQk3rVKzvfudt/NYmw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tOZI3s2wfEv1AlWZ4E/MRDxT+dG65Q61XT9WL5mBS3jcZPqAw6VwWgyolFis4w9PD
 odWzXectA7BGD6HDWWfd0VG6T46J26dFHuhzpUiz19Kro1c5l56Tufn2/tiNXXahfQ
 mIb5URlRXkOWQ0DML1xRigZnxt7Dd35yKnzpQPkpZKEAwK0jb0t+qZRdQaBt6Y3Mx2
 aI4yudkky0fXziI/Nk4FWDSKJaYjG5Cyr7b5kyTsXttoLg96GMi5sgCdbrtpzn6vaA
 IFxws7CZ9ozvLFmEkBLkHNWx/H2ArrKKnn4FIFUwziaZIqf8F3T1VeUakXW70qVedA
 qT7JWJc+XX5kA==
Date: Tue, 24 Jun 2025 09:05:09 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 2/5] drm/bridge: get the bridge returned by
 drm_bridge_chain_get_first_bridge()
Message-ID: <20250624-precise-loon-of-mastery-ebad24@houat>
References: <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-0-0321845fcafb@bootlin.com>
 <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-2-0321845fcafb@bootlin.com>
 <be6a4d90-2c6e-42be-9948-df1840fd2f83@nxp.com>
 <20250623160903.01c56bfc@booty>
 <1d8908b1-b38e-4226-9433-cd9405c7ca63@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="n2sylnxjileb3gpr"
Content-Disposition: inline
In-Reply-To: <1d8908b1-b38e-4226-9433-cd9405c7ca63@nxp.com>
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


--n2sylnxjileb3gpr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 2/5] drm/bridge: get the bridge returned by
 drm_bridge_chain_get_first_bridge()
MIME-Version: 1.0

On Tue, Jun 24, 2025 at 10:44:03AM +0800, Liu Ying wrote:
> On 06/23/2025, Luca Ceresoli wrote:
> > On Mon, 23 Jun 2025 10:56:13 +0800
> > Liu Ying <victor.liu@nxp.com> wrote:
> >=20
> >> On 06/21/2025, Luca Ceresoli wrote:
> >>> drm_bridge_chain_get_first_bridge() returns a bridge pointer that the
> >>> caller could hold for a long time. Increment the refcount of the retu=
rned
> >>> bridge and document it must be put by the caller. =20
> >>
> >> To make sure the incremented refcount is decremented once this patch is
> >> applied, does it make sense to squash patch 3, 4 and 5 into this one?
> >=20
> > I see there is a trade off here between bisectability and patch
> > readability.
> >=20
> > However about bisectability the problem is limited for this series. To
> > get an actual get/put imbalance you'd have to be able to remove the
> > bridge, but removing (part of) the bridge chain is not at all supported
> > right now, and it won't be until after chapter 4 of this work (see
> > cover letter).
> >=20
> > However I realize there is an issue if:
> > * patch 2 is applied but patches 3/4/5 are not
> >   (it does not make sense to apply this series partially, but this
> >   might happen when cherry-picking?)
>=20
> Yes for cherry-picking and bisecting.
>=20
> > * an entire DRM card is removed where
> >   drm_bridge_chain_get_first_bridge() is used by some components
> >=20
> > If both happen we'd have a get without put, thus a missing free and a
> > memory leak for the container struct.
>=20
> Yes, that's a memory leak.
>=20
> > Note that, besides drm_bridge_chain_get_first_bridge() that this
> > series covers, there are various other accessors: see items 1.E.{2..8}
>=20
> IIUC, without those items addressed, the issue we have is use-after-free,
> but not the memory leak this patch introduces(without squash).

Given that this structure is going to be allocated a couple of times in
the system life at best, and that the situation prior to the work Luca
has been doing was a use-after-free, I'm not really concerned about a
transient memory leak in a situation that cannot happen.

If people want to come and backport random patches without looking at
the whole thing, that's their problem.

Maxime

--n2sylnxjileb3gpr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFpOJQAKCRAnX84Zoj2+
doGDAYDGXM7w79pHAhwD/Toi8Tf7Ko2GEnXH4ChZ9svR68EvHRbyf0xO9Ks5KkZH
Gsd79QUBfjoS0KN+H67nrkLbjDtRVTDvSyjBZI7nQQ4JPzv7bafVx4WlQaMrji2I
LY0GD5ZnCw==
=ipG2
-----END PGP SIGNATURE-----

--n2sylnxjileb3gpr--
