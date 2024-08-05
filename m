Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B52947C3C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 15:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063D810E0E8;
	Mon,  5 Aug 2024 13:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eQgCMXZ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3343010E0E8
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 13:53:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 33CDE60C11;
 Mon,  5 Aug 2024 13:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 889E6C32782;
 Mon,  5 Aug 2024 13:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722866001;
 bh=qM0W3+uiHF24kyHGspvhQCNNR+HYuycNyzo1WKDpPvc=;
 h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
 b=eQgCMXZ4M9VGbtC8ej7BFPktaug6jOsM7OzS0/Ob5J6CF7w4VMeMJ+p84PPwmwURO
 Y8MvYao20qoZ0q9KN9quDq4ryKE87H1AwDKKVYWj0wty5mIsRl0oFXGSv4j49jUeMY
 V7BV7EH3gNhUuhiU2AFU7gWyxzZ/UmE6QnAFXQeDRu7A3X1bROXtuq8OZn/pevrfWG
 7GplHv4Inw6xikHvvosDGPUUPVTzNkp3DZSTUYApIhujzFKwQkLjqsR4OyalC2PbCV
 GCX1qG8UK/CZpWVBIQoiauu3uadZUcjbCVPVay/xoNWg5mfsYaqAUG0vJ1RhVsfLlg
 ykxx38WpVs//Q==
Content-Type: multipart/signed;
 boundary=6e0a24126f65f65c33734dbb27c8b4c56556d1ee74b01984351e5fa3e521;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 05 Aug 2024 15:53:09 +0200
Message-Id: <D3810T7V0L98.3AE6ASE5IRXM@kernel.org>
Subject: Re: [PATCH v2 1/2] drm: bridge: samsung-dsim: Initialize bridge on
 attach
Cc: "Marek Vasut" <marex@denx.de>, "Adam Ford" <aford173@gmail.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Daniel Vetter"
 <daniel@ffwll.ch>, "David Airlie" <airlied@gmail.com>, "Frieder Schrempf"
 <frieder.schrempf@kontron.de>, "Inki Dae" <inki.dae@samsung.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Lucas Stach"
 <l.stach@pengutronix.de>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, <kernel@dh-electronics.com>,
 "Marek Vasut" <marex@denx.de>
From: "Michael Walle" <mwalle@kernel.org>
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>,
 <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.16.0
References: <20240625122824.148163-1-marex@denx.de>
 <5476416.LvFx2qVVIh@steina-w>
In-Reply-To: <5476416.LvFx2qVVIh@steina-w>
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

--6e0a24126f65f65c33734dbb27c8b4c56556d1ee74b01984351e5fa3e521
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> with more and more patches for TC9595 support got meged into linux-next,
> only a few remain on my patch stack.
>
> This is one of them and is necessary for DP support:
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

As mentioned in [1] I expect a new version of this series with a
proper documentation update that will then (hopefully) be acked by
the maintainers.

Apart from that, I'm still not convinced that the .attach() callback
is the correct place to put the lanes into LP-11 mode. E.g. the
MediaTek DSI host needs to already know the HS clock rate before
configuring the D-PHY. Something which isn't available at the time
.attach() is called. Marek mentioned, that one should start with
lowest possible clock rate and later reconfigure it to the correct
rate. I'm not sure this is possible without taking the clock lanes
out of LP-11 mode again (i.e. disabling the PHY altogether to change
its PLL). But doing so will violate the bridge requirements again.

-michael

[1] https://lore.kernel.org/dri-devel/D2R83VFPUWE3.3MBX3LQOCDFWA@kernel.org=
/

--6e0a24126f65f65c33734dbb27c8b4c56556d1ee74b01984351e5fa3e521
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZrDZRxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jHQgGAz79ZPaRSILFzurmVLdDu5Z9+xzhOCAT3
pifRnlJtZIdcangOrfNYu7KlE8QBkNq/AYDlbKCFe3hYWemB39OnAmldirrT/gKI
P8LYJveX5YDi8xPEMwAeQSyDuXN/b1jMMYA=
=23LK
-----END PGP SIGNATURE-----

--6e0a24126f65f65c33734dbb27c8b4c56556d1ee74b01984351e5fa3e521--
