Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B5AB9530E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 11:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8764310E5C3;
	Tue, 23 Sep 2025 09:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BoGDgFtM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F39C10E5C2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 09:15:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A8154443FC;
 Tue, 23 Sep 2025 09:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1553C4CEF5;
 Tue, 23 Sep 2025 09:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758618958;
 bh=r4W0Q7yRk/k7WLrEVInb2E7qxaBJKWjWLrpOkCyodBQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BoGDgFtMQq48xPvsST4FJIg46n8eXsOuP9ExIEtGDHMeBSocOKY1xAxDi+Vwzkz3B
 nyLRFTPQG2AHLGiQ5LkzSyDlmgkZY5B6wKs7RUhzbuJNyTMBHFvPGezBjF+ffVUwB1
 AZhdM9fGHLC+YH6AR1KFZQkJahAIJq7lPfEXVmWeWB5MFeNamh+IKKkBHFe97WepYl
 oQGjz1PdSrrUpHzLOR3onl3QMfQP7yJOO2wRlFeYMYk0uH/AmvUF7t+EGB8nuN0DOR
 3RIf87V6F1loyQ5nZcMTZQY6eyhLXFLmUNWqdI5zcXvsarigqZIRGG4wsOZwYQoDSD
 I4pA/yjUWybOA==
Date: Tue, 23 Sep 2025 11:15:55 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/29] drm: Implement state readout support
Message-ID: <20250923-spry-aloof-bullfrog-4febcc@penduick>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <abd349f5-48eb-4646-aca3-d70dd9f4bff0@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="v2ib37ztbiu2x2yg"
Content-Disposition: inline
In-Reply-To: <abd349f5-48eb-4646-aca3-d70dd9f4bff0@suse.de>
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


--v2ib37ztbiu2x2yg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 00/29] drm: Implement state readout support
MIME-Version: 1.0

Hi Thomas,

On Tue, Sep 02, 2025 at 04:13:21PM +0200, Thomas Zimmermann wrote:
> Hi Maxime,
>=20
> there are a number of patches in this series that can be merged immediate=
ly,
> and likely should.

Ack, I'll do a first pass to apply the preliminary patches if (or when)
they get reviewed.

> Is the state-compare code really necessary? Doing this separately might e=
ase
> the review.

My understanding was that Sima wanted to be part of it, but I guess we
can introduce it later on if she agrees.

Maxime

--v2ib37ztbiu2x2yg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaNJlSgAKCRAnX84Zoj2+
dg6/AYCLCBl5ysWRKi5mZbcjC5DsuKSAFM3rLn2lnmfAyFAr92hsAJ6rGxHuUd6Q
SYmr8ocBf0JO+ObyHDBSZ3MjWrzUJbbxREa2/2dgEuw6K6wK4JPF0bQLWr87nEE2
+04R+tcmpA==
=CCPk
-----END PGP SIGNATURE-----

--v2ib37ztbiu2x2yg--
