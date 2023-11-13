Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6EC7E9DD3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 14:51:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8247710E37C;
	Mon, 13 Nov 2023 13:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FB110E37C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 13:51:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2B5AECE14A1;
 Mon, 13 Nov 2023 13:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4F0C433C7;
 Mon, 13 Nov 2023 13:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699883492;
 bh=iFqPahuoh83wumWgleLiz2RLpBmfYMkmR7DyuX8vPYk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d/qKU1sCTST4XCiq2rnBXveYW9qQv+zyGbLqewoNKnkNUTQYTCrnxvw3cnfVsdRYu
 HoIJ+1lHWFyd5GfHuUunvKpCg35IgwF6E3DgwOsCGClSFyqsXHlfq0j97ZOqqP7VnI
 7OZy/0oBD0457n7ZPn/jdueNcgZSCMaaosxZmPebs3pQP0ju0HPRAREaoW3dH653ge
 ZatDRycD+NBm2MOub1wOjm4/Oj613dGYgWa9Lpg0FjqQQsCh740xWYSKJwCVNaHXvH
 N3N0Pey5zr9hO5pm+8og1XzRR6qOq6V6CCqyQFoQG44LPHnWxOsZ7I5y6qifnTUZ6W
 AWKD0ZCrMZkBQ==
Date: Mon, 13 Nov 2023 13:51:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 3/5] dt-bindings: gpu: samsung: constrain clocks in
 top-level properties
Message-ID: <20231113-sultry-cold-d63dd9f015d9@squawk>
References: <20231112184403.3449-1-krzysztof.kozlowski@linaro.org>
 <20231112184403.3449-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="LALutWf/IvU4IogO"
Content-Disposition: inline
In-Reply-To: <20231112184403.3449-3-krzysztof.kozlowski@linaro.org>
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


--LALutWf/IvU4IogO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 12, 2023 at 07:44:01PM +0100, Krzysztof Kozlowski wrote:
> When number of clock varies between variants, the Devicetree bindings
> coding convention expects to have widest constraints in top-level
> definition of the properties and narrow them in allOf:if:then block.
>=20
> This is more readable and sometimes allows to spot some errors in the
> bindings.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


=C5cked-by: Conor Dooley <conor.dooley@microchip.com>

--LALutWf/IvU4IogO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVIp3gAKCRB4tDGHoIJi
0v+fAQD7A3JOI53hTzh+WUXEKjg8LoR6kIE2f8e+LkynWk0urAD/YTToVxHZBwiP
mGKW+HpWeaaFQ+b4lscNPK2HRgp58gc=
=gltR
-----END PGP SIGNATURE-----

--LALutWf/IvU4IogO--
