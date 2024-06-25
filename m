Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A34D916E07
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 18:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7782810E6BB;
	Tue, 25 Jun 2024 16:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eLbi8gAp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E085F10E6BB
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 16:25:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AD7B3CE1C1F;
 Tue, 25 Jun 2024 16:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14DC4C32781;
 Tue, 25 Jun 2024 16:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719332737;
 bh=11jynk5a/49/ElTJ9oo1LXDPA26BwDFO65Ty9CP0sI4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eLbi8gApgYzOooqbHt3pXRvY/aqVqEuWUIGT0CsiZR3e9y+8WYghRJFNfRMK8jBMh
 /LGtBdrfjEGpPQgIylcsJZi+/luO8Z0LUb0fp4ZAMXrqNv0gVf9Hyk/gyG82eabeN8
 vM8gQIggsa4uvJ75C1+HVIROSOgZ2j5rdBVDhyWBTJgJwFbWBcxraSp+M4j8j0+OGF
 Tk/p7n3J+NhBOh/ShrnjhzoySQsmwsN+I1P5byXlzlKFdDATn3fpjkyAuW0DkafKM3
 0Djwr+gyV7iVX5jsJhHb7MomXSaSN+TIAgkmoCwbvKu9F6d8PcNRouVXpM8KGtUcfG
 muzOE8EiR0UJA==
Date: Tue, 25 Jun 2024 17:25:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Gunnar Dibbern <gunnar.dibbern@lht.dlh.de>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add Ilitek ili9806e
 panel controller
Message-ID: <20240625-rage-quarrel-a11f952c335b@spud>
References: <20240625133317.2869038-1-mwalle@kernel.org>
 <20240625133317.2869038-2-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wAaoyByR7rwocqHF"
Content-Disposition: inline
In-Reply-To: <20240625133317.2869038-2-mwalle@kernel.org>
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


--wAaoyByR7rwocqHF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 03:33:16PM +0200, Michael Walle wrote:
> Add the device tree binding for the Ilitek ILI9806E controller which can
> be found on the Ortustech COME35H3P70ULC DSI display panel.
>=20
> There are no peculiarities except for two different power signals.
>=20
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--wAaoyByR7rwocqHF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnrvewAKCRB4tDGHoIJi
0g9nAQC2COqHdQsCfqnwo+sayhzov4sVoNF8rbDAdYwfX1Pf1AD/Rc5AvjVuPaED
vu0KoJdqYy8bZZT59CZas5Y1in7tXwM=
=MVgJ
-----END PGP SIGNATURE-----

--wAaoyByR7rwocqHF--
