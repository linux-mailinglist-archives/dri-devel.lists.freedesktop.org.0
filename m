Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7E792F60C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 09:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF0B10EC24;
	Fri, 12 Jul 2024 07:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hBUrWfst";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D6210EC24
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 07:16:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CBE3A61DEB;
 Fri, 12 Jul 2024 07:16:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07204C3277B;
 Fri, 12 Jul 2024 07:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720768609;
 bh=a3soWk5YrpHYzadO8T0v6/k/MULJ/RXZCmz/aDS/Di0=;
 h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
 b=hBUrWfstUCFAH8nuI8tDdD5p2nmtRjXwDo1WtIlGocGcozxAUPtiqGOQlZiOKFiDD
 gDM3d7EJpai9GY+Uwr7+HObFbkXhd710h5DVAp55tQ3TOqNKHq5EVqf1yTeZMKxMxd
 27CeXAMNhRROUyxafPTwVlWwLUSP6MxYnewToU4odqaOJ+Ucpz9wYu24vzWZJVWscf
 gfA4XjawLmYOuxESDNegLQqgZNxCKiQ8Jg5kzVT/7iB6zJA1y/Y2O884nB8HfgLMml
 IKbFkm53BXI3VdukY/HEnmP89maQR+aTWPd1d3CsD9+jylt99l5s3eGvmyJQjDesbr
 WSOMwKnlJ24HA==
Content-Type: multipart/signed;
 boundary=9176f20025f1545e5e2d16eddc53d12b19974cf957c338f054a6e4968c6f;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 12 Jul 2024 09:16:45 +0200
Message-Id: <D2NDK85U87AZ.2IL0CPIN04OEL@kernel.org>
Cc: "Adam Ford" <aford173@gmail.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Daniel Vetter" <daniel@ffwll.ch>, "David
 Airlie" <airlied@gmail.com>, "Frieder Schrempf"
 <frieder.schrempf@kontron.de>, "Inki Dae" <inki.dae@samsung.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Lucas Stach"
 <l.stach@pengutronix.de>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, <kernel@dh-electronics.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Marek Vasut" <marex@denx.de>, "Alexander Stein"
 <alexander.stein@ew.tq-group.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] drm: bridge: samsung-dsim: Initialize bridge on
 attach
X-Mailer: aerc 0.16.0
References: <20240625122824.148163-1-marex@denx.de>
 <4603431.cEBGB3zze1@steina-w>
 <f90aa303-f18b-4cca-bb7a-f94f74dfee36@denx.de>
 <D29SIGP58O7E.3AJ5VRGQ4I1VN@kernel.org>
 <1867bfd6-ad00-46a7-8bad-4a4441d9854c@denx.de>
In-Reply-To: <1867bfd6-ad00-46a7-8bad-4a4441d9854c@denx.de>
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

--9176f20025f1545e5e2d16eddc53d12b19974cf957c338f054a6e4968c6f
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Marek,

> >> Thank you for testing and keeping up with this. I will wait for more
> >> feedback if there is any (Frieder? Lucas? Michael?). If there are no
> >> objections, then I can merge it in a week or two ?
> >=20
> > I'll try to use your approach on the tc358775. Hopefully, I'll find
> > some time this week.
>
> So ... I wonder ... shall I apply these patches or not ?

As mentioned on IRC, I tried it to port it for the mediatek DSI
host, but I gave up and got doubts that this is the way to go. I
think this is too invasive (in a sense that it changes behavior) and
not that easy to implement on other drivers.

Given that this requirement is far more common across DSI bridges,
I'd favor a more general solution which isn't a workaround.

-michael

>
> I'll wait about a week or two before applying them, to get some input.


--9176f20025f1545e5e2d16eddc53d12b19974cf957c338f054a6e4968c6f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZpDYXRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jQWwGAr/PrY3WGeu+WVBTqzoa0NuKh64/Nzwpm
8Fph+RWRO2mTWBaSNBlJctvSw3RFrqXGAXsGnX2fpPcWOao3pFBLduyzSwUYbbCL
F257l9+4w/A/pVHwYPhAXKhWUwQ7ZW7AOVs=
=b7eb
-----END PGP SIGNATURE-----

--9176f20025f1545e5e2d16eddc53d12b19974cf957c338f054a6e4968c6f--
