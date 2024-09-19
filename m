Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F325997C503
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 09:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDEF010E694;
	Thu, 19 Sep 2024 07:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Fi3QUfE4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7134410E692
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 07:43:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D76A0A43B06;
 Thu, 19 Sep 2024 07:42:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A2D8C4CEC4;
 Thu, 19 Sep 2024 07:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726731783;
 bh=2FlpB400FYHilY4CRboRWeQa299N/BZffZFhKBHPz2o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fi3QUfE4kY3F0uOwhIVxeTAGSmTF5x2wmIHr1IRHBxyZSiYv1cKDlLDjlngwV7vlT
 NcopmbLDHK1sFgeFEC4nBIAvUUB88XVv0HH8pYE8LBbRyMa1CtZZsxeQKShFkpoT8i
 0esdVkLuh1TmKZpMusJFNubHE+74jhHtxElb68F3RZxJmoG+1wcd3HuDuFXNuUJX/w
 xqXp00i0YttNxS5xtt0RrmQOJRUz+r7+ISMO7pTJB67koVHqwucfPlr9fXmiQhall8
 g3pGGBWTvr4mi4z8WWIcKcSs1S1ynvr/v5BD/bc7nLEckwqJTpMGzldDh9GVuhu1r4
 6cznHVTKrPCJA==
Date: Thu, 19 Sep 2024 08:43:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux@armlinux.org.uk,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, dharma.b@microchip.com, arnd@arndb.de,
 hari.prasathge@microchip.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/4] dt-bindings: display: bridge: add
 sam9x75-mipi-dsi binding
Message-ID: <20240919-economist-aqua-c22a1028e87c@squawk>
References: <20240918103119.385597-1-manikandan.m@microchip.com>
 <20240918103119.385597-2-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6wIDwJY7kKxRCN4O"
Content-Disposition: inline
In-Reply-To: <20240918103119.385597-2-manikandan.m@microchip.com>
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


--6wIDwJY7kKxRCN4O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2024 at 04:01:16PM +0530, Manikandan Muralidharan wrote:
> Add the 'sam9x75-mipi-dsi' compatible binding, which describes the
> Microchip's specific wrapper for the Synopsys DesignWare MIPI DSI HOST
> Controller for the sam9x75 series System-on-Chip (SoC) devices.
>=20
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--6wIDwJY7kKxRCN4O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuvWBgAKCRB4tDGHoIJi
0oiwAP4u4WtSIv6pvtbS2rA34vpsQzjx+zSrniNVEUYAyvVCyAD/Re51iWR/25NJ
pZ8fzikS6TfOzSc+u3p5O5551zi3rwM=
=yxo/
-----END PGP SIGNATURE-----

--6wIDwJY7kKxRCN4O--
