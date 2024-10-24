Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4159AEC15
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 18:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A7F10E3A0;
	Thu, 24 Oct 2024 16:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HFVTXZV4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B1510E39E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 16:30:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 81035A45676;
 Thu, 24 Oct 2024 16:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5748CC4CEC7;
 Thu, 24 Oct 2024 16:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729787411;
 bh=baCRscFJcyoIeJGjDhH7YHeA+ksnEpgYG35/hHxCOto=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HFVTXZV4yGAsaKqgM5OMp7eJbPpb/WUKmiQiyXJ/S7l43PIBrrz6NbJx8SUpmkKws
 dMPjoNEEFiKTqyfRMKbhabw1+EUjGhCtWJnucDPpam0GwHPOk9l4B61NXkX7wrWT1T
 OFr5gy2LRxshLdhW78CL/BMHSlbEfcsFqlnKhXDCrIesy2ycV90/axFKPXVSZkFbdj
 GtDbfcmxGDVzmd871dZsyorgXUJLWR5POmBnKqXnzjiNcl9RlQV/KAzu8FiEe0EvCl
 jKMRhIUpJBq1IB2LjSMdIuZ4xkngxXWMh0G0EvVRB4pqhP0/J7K2WZjnkvvOGanwNa
 ReN0OU1DUu9gQ==
Date: Thu, 24 Oct 2024 17:30:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: sn65dsi83: Add interrupt
Message-ID: <20241024-cruelly-wool-f03401567c51@spud>
References: <20241024095539.1637280-1-herve.codina@bootlin.com>
 <20241024095539.1637280-2-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9GMWCsnkIho7utQ/"
Content-Disposition: inline
In-Reply-To: <20241024095539.1637280-2-herve.codina@bootlin.com>
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


--9GMWCsnkIho7utQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 11:55:37AM +0200, Herve Codina wrote:
> Both the TI SN65DSI83 and SN65DSI84 bridges have an IRQ pin to signal
> errors using interrupt.
>=20
> This interrupt is not documented in the binding.
>=20
> Add the missing interrupts property.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--9GMWCsnkIho7utQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxp2CwAKCRB4tDGHoIJi
0nElAP4nxMS+d9i9cBJT2NS/4zKx3DyetfbIhEUQg4atuPvAtQD7B9O02PJmTQQv
HKR8oXpkoaC+W1Ia0J96LgL8Q/LG8As=
=pY8d
-----END PGP SIGNATURE-----

--9GMWCsnkIho7utQ/--
