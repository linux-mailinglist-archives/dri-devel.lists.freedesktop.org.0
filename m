Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8818C316E
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 14:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D1010E107;
	Sat, 11 May 2024 12:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R8359fNt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFA710E107
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 12:59:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 78D336098A;
 Sat, 11 May 2024 12:59:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD9B1C2BBFC;
 Sat, 11 May 2024 12:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715432350;
 bh=7mUFrYFasyg0D5ghmubzeb0I1JT+OGqiTqWUaMx3Vtc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R8359fNtDMDkH1bx2UfEwjgmDVuwhVScnjOQ71LQoqai9NM7zhfOMXFNls917FrM8
 4xZQUKNO9+KGpkwaoR/2fsY1rYK/9eaPrniD5HplavmmPmZXP59G9N24Vw7VugghxJ
 VN6CLwqcji+N3mFRkEtJ1Wx9l4U2jwqDauOyzG8Y2eZjqzbWtq40dGVPYa6S+kJqVb
 AaAdqDCc+a2Sx8OFcIpOJfNH6/94rgdCE9Oqwn/L7Oft1qgI35cPAREvZyAfm7GSg8
 VdvKlXALzWQ/kG4wdTkgDChfKCVT8WDaYPOv5idjpfBWwBXl5Ej7Yhk1yuhlvurH2b
 vlHv4eXI+J8hA==
Date: Sat, 11 May 2024 13:59:03 +0100
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
Subject: Re: [PATCH 1/3] dt-bindings: display: samsung,ams495qa01: add
 missing SPI properties ref
Message-ID: <20240511-lid-depth-f29664519bd7@spud>
References: <20240509-dt-bindings-dsi-panel-reg-v1-0-8b2443705be0@linaro.org>
 <20240509-dt-bindings-dsi-panel-reg-v1-1-8b2443705be0@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2/wI+SpQ0UgMlFs6"
Content-Disposition: inline
In-Reply-To: <20240509-dt-bindings-dsi-panel-reg-v1-1-8b2443705be0@linaro.org>
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


--2/wI+SpQ0UgMlFs6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2024 at 11:42:51AM +0200, Krzysztof Kozlowski wrote:
> Samsung AMS495QA01 panel is a SPI device, so it should reference
> spi-peripheral-props.yaml schema to allow and validate the SPI device
> properties.
>=20
> Fixes: 92be07c65b22 ("dt-bindings: display: panel: Add Samsung AMS495QA01=
")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--2/wI+SpQ0UgMlFs6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj9rlwAKCRB4tDGHoIJi
0iA7AP4z/SpXYwQc+M1q8GGrK9XnK29OfT3DTaXJVMuASjZnkAEA9Vbey58W1Nsl
v/4W+TsdYBNh0T8/Omb/K3yj7+yiAwE=
=Tmx3
-----END PGP SIGNATURE-----

--2/wI+SpQ0UgMlFs6--
