Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8277C917A5F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 10:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A81A10E7B2;
	Wed, 26 Jun 2024 08:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rDxPmajC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1250510E7B2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 08:02:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C67BACE2102;
 Wed, 26 Jun 2024 08:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E13C2BD10;
 Wed, 26 Jun 2024 08:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719388963;
 bh=FbB/Z5+KjO3VfexghKvRCuqfnZ7nRSNBrmU6jYALXvw=;
 h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
 b=rDxPmajCQ+t/othjaM9q0NOeBKKxYALa52uWNux6d2fUM+mbEGEa2FCgzF2j7WkDY
 WdbCBHONGIUm4GbYZWEr1qUTCNLa2PY5pzxLOp6pckBUwWcwOqoeLdiuiirbbHd8ho
 O9zDB2Fp8t6+FNl3eu5VeYXm6DsVp4XRmbWHUDs8OiohS6yiJGJr10dPZxYz4bKe5/
 yEZr+ygHdHWo99q7MesjHaEYGq1lsFtbYPFKOm1EpxDD862ctV1rAcIItxpqK0cO1N
 mgFhKlJ+xkORwgCZd3PW+lu8vymefiDwy3xRCoQEhfTH71zzoHV9cvTwq/Iz71hPqE
 xUF+d09cty2eg==
Content-Type: multipart/signed;
 boundary=daa5f82f372e1039bdf7cfa6b36253793d74f217cf91a1d7c020819de255;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 26 Jun 2024 10:02:24 +0200
Message-Id: <D29SIGP58O7E.3AJ5VRGQ4I1VN@kernel.org>
To: "Marek Vasut" <marex@denx.de>, "Alexander Stein"
 <alexander.stein@ew.tq-group.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] drm: bridge: samsung-dsim: Initialize bridge on
 attach
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
X-Mailer: aerc 0.16.0
References: <20240625122824.148163-1-marex@denx.de>
 <4603431.cEBGB3zze1@steina-w>
 <f90aa303-f18b-4cca-bb7a-f94f74dfee36@denx.de>
In-Reply-To: <f90aa303-f18b-4cca-bb7a-f94f74dfee36@denx.de>
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

--daa5f82f372e1039bdf7cfa6b36253793d74f217cf91a1d7c020819de255
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Jun 26, 2024 at 5:21 AM CEST, Marek Vasut wrote:
> Thank you for testing and keeping up with this. I will wait for more=20
> feedback if there is any (Frieder? Lucas? Michael?). If there are no=20
> objections, then I can merge it in a week or two ?

I'll try to use your approach on the tc358775. Hopefully, I'll find
some time this week.

-michael

--daa5f82f372e1039bdf7cfa6b36253793d74f217cf91a1d7c020819de255
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZnvLEhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hJZAF/UFk3Ogonjzie0IXPp/3+uuhqFHlWNZQH
K3CTunuZ/d6aUNLk1Px2aBe3m3qtYicwAXsG6LjH8ATSDfEn3KGjWehnzKkJfguh
YvwmTRv72eR3wXYVPexlGxsPnugAimwJUZM=
=wr0R
-----END PGP SIGNATURE-----

--daa5f82f372e1039bdf7cfa6b36253793d74f217cf91a1d7c020819de255--
