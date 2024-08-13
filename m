Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDAA9500DE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 11:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9E110E2C6;
	Tue, 13 Aug 2024 09:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gX1FSwZp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4324710E2C6
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 09:08:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 769B66117E;
 Tue, 13 Aug 2024 09:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85F9C4AF0B;
 Tue, 13 Aug 2024 09:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723540114;
 bh=/84SsMkop9pAE0/ilDwpDyknfZaT20JA0YwOVXiSX6w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gX1FSwZpLAoQiq7Nbnrxyyokw7CW7ZTEQHaDUQRGDUl5qKBTtXJxLpT9wtd09AvBq
 UHd3Dq54pS4gNOPk5vU6g4n0yDl7t2yXJAYYNkE7iRQUp2KnK9QDbWz72pRHlntEOs
 K/UcQRTu7dxShMeqHUHwU+0vPg+LO7HkuuXZpX4jEMBRYK7SgENb18Pg1eMbhqUD6x
 XiT/vlCsm+hCu96xcWKzuPN8y3LmrK/5uhkx907zDvzGNvzJ9mEtmaJPEwKDna0qck
 +FAdA/1VoiT5MQny88gQIWDGrmJYu93PlwcDLbYsTvaw4+vFxgqG2K8e8dW4jyaUuG
 LRFDX89gzEX1g==
Date: Tue, 13 Aug 2024 10:08:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Takashi Iwai <tiwai@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 3/9] ASoC: test-component: use new of_graph functions
Message-ID: <28f4e558-734b-4c0f-b1d5-82f31679fb51@sirena.org.uk>
References: <875xsa8gws.wl-kuninori.morimoto.gx@renesas.com>
 <871q2y8gvl.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="UvXpPTbsvywwXUHF"
Content-Disposition: inline
In-Reply-To: <871q2y8gvl.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Say no, then negotiate.
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


--UvXpPTbsvywwXUHF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 09, 2024 at 04:22:38AM +0000, Kuninori Morimoto wrote:
> Current test-component.c is using for_each_endpoint_of_node()
> for parsing "port", because there was no "port" base loop before.
> It has been assuming 1 port has 1 endpoint here.

Acked-by: Mark Brown <broonie@kernel.org>

--UvXpPTbsvywwXUHF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma7IocACgkQJNaLcl1U
h9DL6wf/ccEnzGM5bE26J7HDrPiqIE/eCaPdxcacYmLMDYiMwI+/oImLFkpoyrkQ
BNR0YqfzZSwo1UdmG+p5uFw/qtup8HRTuQUPrttDzkDtWSfVdqLmnFfFas/ELxrs
V3NIGf5hnbULmlch/N8y61Eqe9SSn5S43JxYDiNdd2KlE5U4tiNum4zcM292hIpL
mlaiQCyI9Fcp2HaZEVStyyMAItpHZfXeFqYtKJS9gk8ddu6shM/AoO9DOdZ4CMb7
wggffLNrdtHaviAvgdPDs3DHhNq0m4RIwyLvITG5LMgXmBc6i5Eianf5ZErNRqnV
Zjh41pWBLTPVXSPaYRS1qnP5f7ku1g==
=ODw5
-----END PGP SIGNATURE-----

--UvXpPTbsvywwXUHF--
