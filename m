Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B04AD7610
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 17:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29BB10E8AC;
	Thu, 12 Jun 2025 15:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EXJsmDST";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F9010E8B1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 15:30:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4644CA51E2E;
 Thu, 12 Jun 2025 15:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2742DC4CEEA;
 Thu, 12 Jun 2025 15:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749742217;
 bh=ZYe5VuTizv6cLyCXZAe69ksDuxTDKafKtBpZ+ydLU8g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EXJsmDSTN5rIn9KOOJw9nkl2hFejRyVWk0FYT4/7RfqUR4KoKILK2Iixf3/y+QuCX
 voG8hX5o+ipvNTnwr6mZ4r65oc++dZuZqUu3RJy7+tCyU5+xTkdAi5XNI2FKl8qVXu
 qaGedbGcPwUKF/c2098M61JRLui1GvFVzbSSqwcocOeI9Wgl5TdvcLDryiBj+eASqv
 JSRPMCV2I3Q3ft5OTLU2Rtk97XOpVLXxCjcz/oWd7UwhqJjYiy1YZDQFIVk3glfjez
 AwNCRuxM2yOYaWNS7aNPDrkoViTAP1HbqqoXwQM9mJuYb+uzqnu9MoWgPoFaYd6HLN
 2CRqHL/hKCXfQ==
Date: Thu, 12 Jun 2025 16:30:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: document Samsung
 S6E8AA5X01 panel driver
Message-ID: <20250612-lively-duplex-ff45181ffd5a@spud>
References: <20250612-panel-samsung-s6e8aa5x01-v1-0-06dcba071ea6@disroot.org>
 <20250612-panel-samsung-s6e8aa5x01-v1-1-06dcba071ea6@disroot.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oIPRfQLPeZSrwhTs"
Content-Disposition: inline
In-Reply-To: <20250612-panel-samsung-s6e8aa5x01-v1-1-06dcba071ea6@disroot.org>
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


--oIPRfQLPeZSrwhTs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 08:22:41PM +0530, Kaustabh Chakraborty wrote:
> Samsung S6E8AA5X01 is an AMOLED MIPI DSI panel controller. Document the
> compatible and devicetree properties of this panel driver. Timings are
> provided through the devicetree node as panels are available in
> different sizes.
>=20
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--oIPRfQLPeZSrwhTs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEryhAAKCRB4tDGHoIJi
0ju+AQDPB87WoSU5h5E67DBchhB299Zn7B0ap+rS8+e1CKv4egEA7w6g031TcD0b
YPOL3AOVGx7UaD+vN3g7XChnrc4L3A4=
=xx6g
-----END PGP SIGNATURE-----

--oIPRfQLPeZSrwhTs--
