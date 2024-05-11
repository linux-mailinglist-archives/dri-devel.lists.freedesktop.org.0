Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 731BC8C316D
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 14:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4CB10E048;
	Sat, 11 May 2024 12:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aUh0Yrr1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E2310E048
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 12:58:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E71E1CE01BE;
 Sat, 11 May 2024 12:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3D8C2BBFC;
 Sat, 11 May 2024 12:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715432322;
 bh=g9G7oMu4B/QiQlAbIRQ7UTs0dpw6tTeALLYU0kIXKmY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aUh0Yrr1FaisCxGYtYe3P5bZwLzDNEIDmL3o9aYgptvIc6jiYsCDwWxUIWMCwtjYZ
 yewsfrTUxjBBLEMyawlhzxx2fEvzl4K2hcv6IM8yBwz7LjelTXSeob38649B+FAw2a
 VEVx0VmYIzMnVvcfae0lBZoZ5CASYNQeZ9Zvnh+QI6t2vOWT8XHhFRbHUfQQjI05N9
 DTkPVpsyWIxp2HdWSWxwvXNIZhEDvC0yDf+uK+PpYeAr12F8JAlFAhakz6qI5nammE
 IlUnuao7duEz8CSf+X6JV186V7zx5xQdgTO4SVNOByY/u7GYNqR7ee9++oDz+NVK/S
 zDnNSlv+CxFrg==
Date: Sat, 11 May 2024 13:58:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Konrad Dybcio <konradybcio@gmail.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Heiko Stuebner <heiko@sntech.de>, Luca Weiss <luca.weiss@fairphone.com>,
 Dmitry Baryskov <dmitry.baryshkov@linaro.org>,
 Shawn Guo <shawn.guo@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: display: panel: constrain 'reg' in SPI
 panels
Message-ID: <20240511-gizmo-attic-fc4dff917af1@spud>
References: <20240509-dt-bindings-dsi-panel-reg-v1-0-8b2443705be0@linaro.org>
 <20240509-dt-bindings-dsi-panel-reg-v1-2-8b2443705be0@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PPvr9IV2m0OUjKgH"
Content-Disposition: inline
In-Reply-To: <20240509-dt-bindings-dsi-panel-reg-v1-2-8b2443705be0@linaro.org>
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


--PPvr9IV2m0OUjKgH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2024 at 11:42:52AM +0200, Krzysztof Kozlowski wrote:
> SPI-attached devices could have more than one chip-select, thus their
> bindings are supposed to constrain the 'reg' property to match hardware.
> Add missing 'reg' constrain for SPI-attached display panels.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--PPvr9IV2m0OUjKgH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj9rewAKCRB4tDGHoIJi
0k+wAQC9NFi60nEG0IT9rsXvel4SH48N8CPnUkfZNDN9n+JiEwEAtE7FMl36skZw
dkladI4t3xdvRRNRSsfh253nM0JnnQI=
=fNjt
-----END PGP SIGNATURE-----

--PPvr9IV2m0OUjKgH--
