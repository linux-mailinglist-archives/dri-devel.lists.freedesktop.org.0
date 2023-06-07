Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AA17267D3
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 19:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95B410E209;
	Wed,  7 Jun 2023 17:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594B610E209
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 17:54:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 299C863B46;
 Wed,  7 Jun 2023 17:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E93C433D2;
 Wed,  7 Jun 2023 17:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686160477;
 bh=t9VMLHpwDUMRX+sjzy9JXqecsOwAcppqiOl5uvHgkwM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f7lwImtQWmfcsD3AaKRkzMR6LsIKj+bZ3d7pRI2oiE5mHGFq6wSkteK7sbA3aU+jd
 sRfA6M5mXyKGf1b8k3jKG6kKYqmbeVnCQ6g2sbGFXbLkP5M71eKKxDx0Z06e/CNck3
 GwaKRpe1gpqSh1F6Yc3VPSvVlMEBqyQqlE+kg8pFEAtPAOCDMuyyhW8fky3+1f4Yui
 dSb3eHN2COqCnronx9tl85n34dcYhgxgmnXW8OKO5az1FEhI6dRFZ/BAKmFLcWWcj+
 UOYCNMKGDIwzB40MVU+85Zvocx+Ccq8Kp5FGkscGn3v1SpB2iB4QNHgu9bdwI8vJuc
 r08HOiyyafqkg==
Date: Wed, 7 Jun 2023 18:54:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>
Subject: Re: [PATCH v1 2/8] dt-bindings: display: panel: mipi-dbi-spi: add
 spi-3wire property
Message-ID: <20230607-talcum-purging-92caedf423f1@spud>
References: <20230607115508.2964574-1-l.goehrs@pengutronix.de>
 <20230607115508.2964574-2-l.goehrs@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KRHE2d73KvjNQ2FN"
Content-Disposition: inline
In-Reply-To: <20230607115508.2964574-2-l.goehrs@pengutronix.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--KRHE2d73KvjNQ2FN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 07, 2023 at 01:55:01PM +0200, Leonard G=F6hrs wrote:
> Some MIPI DBI panels support a three wire mode (clock, chip select,
> bidirectional data) that can be used to ask the panel if it is already set
> up by e.g. the bootloader and can thus skip the initialization.
> This enables a flicker-free boot.
>=20
> Signed-off-by: Leonard G=F6hrs <l.goehrs@pengutronix.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--KRHE2d73KvjNQ2FN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIDEWAAKCRB4tDGHoIJi
0p1gAP0cKhUNjF0VGGTzVmkkas++loSoMeqKZSPC/dWXhVwfFgEAhRkljA73KAnQ
I4TX62PntZEAHLMlF/0QvgeC6Q88eg0=
=42vw
-----END PGP SIGNATURE-----

--KRHE2d73KvjNQ2FN--
