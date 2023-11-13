Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A3B7E9DC3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 14:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D5A10E376;
	Mon, 13 Nov 2023 13:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E02310E376
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 13:49:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 9DCE9B80DF6;
 Mon, 13 Nov 2023 13:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C46D5C433C8;
 Mon, 13 Nov 2023 13:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699883374;
 bh=l6fOgzs+gRaEoFTmKLmNpHazwRq9v6934z3SOTaUCyc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MMa+rh+k1FLP/dpZGb/+ODoA8QjIaENmmfEToillG80CMfSVwM0qb2laozQ8CMe30
 u0MDyQuxJyY7/0eFkro3u0hHRXWFv7DHoOGiFbL+ew4yB/UAwpVidA86gGLsvrzsbM
 p8eA7qaYqFeIEVsOIierZfSWuU/BoIEwduma5ZiHn8gvHHovpXxzOYS46uLPcy/RuC
 MGoSyIMlVFDvkTzc/nyLshlGoFFvZlZrv1eJkCQ3lbtzyHPpNjqu49vsp/mNVLPz0i
 gVrrDTDVOnJZ9Ftyn/niLZsc8RbAeFjenKyUdZMLAtSNL+jlVsRVbTHbE9QOTuIKTj
 wGxKZ8sTU5yuQ==
Date: Mon, 13 Nov 2023 13:49:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 5/5] dt-bindings: gpu: samsung-scaler: constrain iommus
 and power-domains
Message-ID: <20231113-retool-reckless-970ed7808b92@squawk>
References: <20231112184403.3449-1-krzysztof.kozlowski@linaro.org>
 <20231112184403.3449-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vTwnha2EFbEr3bLJ"
Content-Disposition: inline
In-Reply-To: <20231112184403.3449-5-krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vTwnha2EFbEr3bLJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 12, 2023 at 07:44:03PM +0100, Krzysztof Kozlowski wrote:
> Provide specific constraints for iommus and power-domains, based on
> current DTS.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>


--vTwnha2EFbEr3bLJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVIpaAAKCRB4tDGHoIJi
0vdsAP9xzBEZfiwgQCchCiSAfgeayon8ZF+VGCkgyFOC7rrwCAEAnN4FItn+dkBg
Xr6OX2JuydUY/+gpRl7ykQ7fiXJRawo=
=da/7
-----END PGP SIGNATURE-----

--vTwnha2EFbEr3bLJ--
