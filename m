Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01431B57AA0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 14:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A46710E476;
	Mon, 15 Sep 2025 12:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="q2A8ggRK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F5F10E476
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 12:23:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 855D76020C;
 Mon, 15 Sep 2025 12:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9807AC4CEFE;
 Mon, 15 Sep 2025 12:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757938994;
 bh=jqrd4F599wjFXBZcervzvKqSubNiAnp6nziRzF5MIgM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q2A8ggRKLe4+CGM6ls1+YnDLmMf3S3FeOvzvwaXILV7GBs19ayC1J2KNodesVbrZr
 RRFWxxV+ceu0v/9+solFHC5Ir3zUchD8es8RMp13kuqLq5Pe7MEl13o0TS3vDP5Luy
 V4fuVuWH8lLfE3638aH25Coxnp/hRoKdUoz2DuSV4Uu0LufswZuQi3Qh4TrfBo8cT3
 Js7oUapD2BY4Gp15uir0qZS0cYSrdpBGklnjrb51Zix5DDLbY36aesO4aauywu/Rh8
 zUnOGan9pzV7T/TyeIiCMcRoHjWPYMtdcIhEPqD0FzQlHibSSDrd7GLueJJkf99wgN
 XMwbnyw88TKyw==
Date: Mon, 15 Sep 2025 14:23:11 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v8 0/3] drm/bridge: debugfs: show refcount and list
 removed bridges
Message-ID: <20250915-tunneling-guillemot-of-potency-b0f675@penduick>
References: <20250912-drm-bridge-debugfs-removed-v8-0-5c33d87ccb55@bootlin.com>
 <20250915-celadon-dalmatian-of-defense-ca56fb@penduick>
 <20250915123010.18fd21f9@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="vgsm6me4entxblgb"
Content-Disposition: inline
In-Reply-To: <20250915123010.18fd21f9@booty>
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


--vgsm6me4entxblgb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 0/3] drm/bridge: debugfs: show refcount and list
 removed bridges
MIME-Version: 1.0

On Mon, Sep 15, 2025 at 12:30:10PM +0200, Luca Ceresoli wrote:
> Hi Maxime,
>=20
> On Mon, 15 Sep 2025 10:13:16 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > Once the minor issue I've reported is fixed,
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
>=20
> Ok, thanks!
>=20
> v9 sent.
>=20
> Note that this series depends on [0] which is waiting for discussion to
> continue, so any feedback on drm_for_each_bridge_in_chain_scoped()
> would be very welcome to unlock both this and other series from being
> applied/sent.

Thanks for the reminder, I've reviewed it

Maxime

--vgsm6me4entxblgb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMgFLgAKCRAnX84Zoj2+
du4LAYDWJyAHlvGAIrTCz5X7RUON9sfarDjS08ZiABWMrdF9gxFKh3vhhoXbUxyt
HYuj2WQBgP+IYJShJVOgSdw758fb5iL9M7SIFj2SHRqP9Jsiyb8lBs1mVcExAw00
nsLCXZRvlQ==
=grnC
-----END PGP SIGNATURE-----

--vgsm6me4entxblgb--
