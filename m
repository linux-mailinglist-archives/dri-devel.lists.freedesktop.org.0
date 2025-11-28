Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103A6C91916
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 11:07:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C6710E8C1;
	Fri, 28 Nov 2025 10:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l2yBoTlN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D1010E8D0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 10:07:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B97D243EA2;
 Fri, 28 Nov 2025 10:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42179C4CEF1;
 Fri, 28 Nov 2025 10:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764324468;
 bh=nJ0BswuVS/EdOZoizNULEjccdAUO5ZVsCOoooSIjtg8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l2yBoTlNsMo/Y5hD4HCWe7fQ7X3tSI2/NrfzcDPYpANz7mDtW278y+Qv1rPGS1fki
 up3HRRiAi3M8Qlqgm7lReH9+s+OC0NKpqdZ2U7BhnkVW3x/8TMQaTj7P7Ui2JPksrZ
 AczOxUn77JFYAJ7NCpZosPpbLcQRV1ElrzHSFKZLIAq66bbfFKur97gMYuTFNibfaP
 LBW7mxjn15ndPwyuOvASwBH5s62dewePxtOrn61bXpho4NO5ast8BjgVT7oF+Jr59A
 dcPOfsTiaVTUcI4FmqgfSOfQHC4pcSbb55gP932Qucgsd5nY2Nlbdhg4bJ5xZ5dX8J
 gZKesKH/TuKEg==
Date: Fri, 28 Nov 2025 11:07:45 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Francesco Dolcini <francesco@dolcini.it>,
 Emanuele Ghidoli <ghidoliemanuele@gmail.com>, 
 =?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Subject: Re: [PATCH v3 0/2] drm/bridge: handle gracefully atomic updates
 during bridge removal
Message-ID: <20251128-cheerful-muscular-chameleon-1ec2f5@houat>
References: <20251112-drm-bridge-atomic-vs-remove-v3-0-85db717ce094@bootlin.com>
 <546bc098a35360c659b6dfb88d5cb451@kernel.org>
 <DEK6B0KMDCCN.3U4FLO44L04FC@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="oryfzjzt56jfjgkm"
Content-Disposition: inline
In-Reply-To: <DEK6B0KMDCCN.3U4FLO44L04FC@bootlin.com>
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


--oryfzjzt56jfjgkm
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/2] drm/bridge: handle gracefully atomic updates
 during bridge removal
MIME-Version: 1.0

On Fri, Nov 28, 2025 at 09:09:17AM +0100, Luca Ceresoli wrote:
> Hi Maxime,
>=20
> +Cc Emanuele, Francesco, Jo=E3o
>=20
> On Thu Nov 27, 2025 at 7:35 PM CET, Maxime Ripard wrote:
> > On Wed, 12 Nov 2025 17:34:33 +0100, Luca Ceresoli wrote:
> >> This is a first attempt at gracefully handling the case of atomic upda=
tes
> >> happening concurrently to physical removal of DRM bridges.
> >>
> >> This is part of the work to support hotplug of DRM bridges. The grand =
plan
> >> was discussed in [1].
> >>
> >> [ ... ]
> >
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
>=20
> Thanks for reviewing!
>=20
> Two alternative patches [0][1] have been sent to address the issue with
> PLL_UNLOCK, and both would conflict with patch 2 of this series. So I'd
> keep this series on hold for a while, waiting for a decision to be taken
> about how the PLL_UNLOCK issue will be handled. I'll then rebase this
> series as needed.

Yep, agreed.

Maxime

--oryfzjzt56jfjgkm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaSl0bQAKCRAnX84Zoj2+
dqs0AYDd1pJJzYFp7ugB096cqDaWRBUIJVD5TtUShhFuVGtlngtq4vfcZkdHEtxH
bxLCu74BgLeLl4gzIIaITAnCmqZuhgte6BB660syyt1jlLUXFxL2DX0AskUNjxI2
7Y/6xr8TrA==
=RSoR
-----END PGP SIGNATURE-----

--oryfzjzt56jfjgkm--
