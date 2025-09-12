Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72184B549CD
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 12:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D269710EBFB;
	Fri, 12 Sep 2025 10:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kjZ6ou1t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1973110EBFB
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 10:28:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1E23A60200;
 Fri, 12 Sep 2025 10:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38229C4CEF1;
 Fri, 12 Sep 2025 10:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757672907;
 bh=XHvzLANHb2pGo7ihBR6DIe9uzZw6cuzHHxU8rvOBtPI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kjZ6ou1tv7rLaLTktshdDoPDpCPf1Lh/9rsEb2nWvUHx8btvCO9M91SQ/okITnPuM
 rfR1ZNmrQWqHG5C5JqK5pUge+KPh+OELNjJ7HkotzHgeH6uZNdABJDZNPhSzJLY3U9
 D7bHiVsO/nYMSIBWgZ0TUKSYuoaJilMo2PPAv9YWOe5UJC9daf8W8LOemYn/2XDEbq
 sOFnRSju8/NQbdYcsoS+2M/5hb2kOVO+voD3QggvX2d/mDH6WqrZX30aATuphqkCcf
 U8VQepCjeCUWkhNbpuNY5+gw/bmSvl84SqPZyFZJooNORHvHnNDG5Pa7CLcqYCHLot
 030QNhShgfwLw==
Date: Fri, 12 Sep 2025 12:28:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Miguel Gazquez <miguel.gazquez@bootlin.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Phong LE <ple@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, miquel.raynal@bootlin.com,
 kory.maincent@bootlin.com, 
 romain.gantois@bootlin.com, praneeth@ti.com, Aradhya Bhatia <a-bhatia1@ti.com>
Subject: Re: [PATCH] drm/bridge: ite-it66121: Add drm_connector support
Message-ID: <20250912-tricky-offbeat-cicada-e8bc2d@penduick>
References: <20250909-it66121-fix-v1-1-bc79ca83df17@bootlin.com>
 <do5zciwcanpiciy52zj3nn6igmwlgmbcfdwbibv2ijxm2fif5s@ib6jhzi5h2jo>
 <6164422a-6265-4726-8da5-68bb8eafb9e6@bootlin.com>
 <20250911-innocent-daffodil-macaque-797f13@houat>
 <012046ab-d866-4b3a-8c8a-e130bc2b9628@bootlin.com>
 <2l5kp4ojrcsg2apcpv7mzeeypwynecyfesenks6zzvnst3qkbt@4yhbosy2zhah>
 <e6af5c37-d18a-423e-b822-367441a48f86@bootlin.com>
 <21f80397-be9c-49bd-b814-ea5f0eb5fdc8@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="b5r5hogjlsaahvlz"
Content-Disposition: inline
In-Reply-To: <21f80397-be9c-49bd-b814-ea5f0eb5fdc8@bootlin.com>
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


--b5r5hogjlsaahvlz
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/bridge: ite-it66121: Add drm_connector support
MIME-Version: 1.0

On Thu, Sep 11, 2025 at 05:47:57PM +0200, Miguel Gazquez wrote:
> Le 11/09/2025 =E0 17:40, Miguel Gazquez a =E9crit=A0:
> > Le 11/09/2025 =E0 15:09, Dmitry Baryshkov a =E9crit=A0:
> > > On Thu, Sep 11, 2025 at 02:49:59PM +0200, Miguel Gazquez wrote:
> > > >=20
> > > >=20
> > > > Le 11/09/2025 =E0 11:50, Maxime Ripard a =E9crit=A0:
> > > > > On Thu, Sep 11, 2025 at 10:51:06AM +0200, Miguel Gazquez wrote:
> > > > > >=20
> > > > > >=20
> > > > > > Le 10/09/2025 =E0 04:28, Dmitry Baryshkov a =E9crit=A0:
> > > > > > > On Tue, Sep 09, 2025 at 06:16:43PM +0200, Miguel Gazquez wrot=
e:
> > > > > > > > From: Aradhya Bhatia <a-bhatia1@ti.com>
> > > > > > > >=20
> > > > > > > > Add support for DRM connector and make the driver support t=
he older
> > > > > > > > format of attaching connectors onto the encoder->bridge->co=
nnector
> > > > > > > > chain.
> > > > > > > > This makes the driver compatible with display controller th=
at only
> > > > > > > > supports the old format.
> > > > > > > >=20
> > > > > > > > [Miguel Gazquez: Rebased + made driver work with or without
> > > > > > > > DRM_BRIDGE_ATTACH_NO_CONNECTOR]
> > > > > > >=20
> > > > > > > What is the use case for not using DRM_BRIDGE_ATTACH_NO_CONNE=
CTOR?
> > > > > >=20
> > > > > > Some display controller drivers (like the tilcdc) call
> > > > > > drm_bridge_attach
> > > > > > without DRM_BRIDGE_ATTACH_NO_CONNECTOR, so the bridge
> > > > > > must support both with
> > > > > > and without DRM_BRIDGE_ATTACH_NO_CONNECTOR to be
> > > > > > compatible with all display
> > > > > > controllers.
> > > > >=20
> > > > > I'd rather convert tilcdc to use DRM_BRIDGE_ATTACH_NO_CONNECTOR t=
hen.
> > > >=20
> > > > The problem is that doing that break devicetrees using the tilcdc a=
nd a
> > > > bridge who doesn't support DRM_BRIDGE_ATTACH_NO_CONNECTOR (there are
> > > > multiple bridges that don't support
> > > > DRM_BRIDGE_ATTACH_NO_CONNECTOR), and if
> > > > my understanding is correct breaking devicetrees is not allowed.
> > >=20
> > > How does it break devicetree? The drm_bridge_connector isn't a part of
> > > DT.
> >=20
> >=20
> > In the current situation, a board could have the tilcdc linked with a
> > bridge that does not support DRM_BRIDGE_ATTACH_NO_CONNECTOR (for
> > example, the analogix-anx6345) , and everything will work fine.
> > If we convert the tilcdc to always use DRM_BRIDGE_ATTACH_NO_CONNECTOR,
> > that same configuration will stop working.
> >=20
> > When I said "breaking devicetree" I meant that a devicetree describing
> > this setup would no longer produce a working system, not that the DT
> > files or bindings themselves are incorrect.
> > I didn't find any upstream dts with this configuration, but maybe there
> > is some out-of-tree dts which would be affected.
> > As far as I understand, we should avoid that.
> >=20
>=20
> If I can rephrase myself, is my understanding correct ? Do we care about
> breaking out-of-tree dts ?

There's only so much we can do, and we can't fix issues we can't know
about. So no.

Maxime

--b5r5hogjlsaahvlz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMP1xwAKCRAnX84Zoj2+
dvFUAX4mGzr+jhCS+JMrw0EOA1ttiPb9P5MJpffpYl0eKwA4c4dvT4RoSwj4aDWd
GZko+C8BfR0tqqWniPbxIPbfBsehe8DQq1xZlq4pHBwpQPK+C7IJWwfhSBcMrpuI
ljCJs6Dseg==
=J7wq
-----END PGP SIGNATURE-----

--b5r5hogjlsaahvlz--
