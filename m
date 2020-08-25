Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DA22512B3
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 09:10:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABC36E866;
	Tue, 25 Aug 2020 07:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C442C6E866
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 07:10:36 +0000 (UTC)
Received: from localhost (p54b333df.dip0.t-ipconnect.de [84.179.51.223])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C35662074D;
 Tue, 25 Aug 2020 07:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598339436;
 bh=FWfgAaWELOpnq9T2ZqffNJ7A9qnO3QfKuIy+OMg+Nkc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f3Wq0A6wK+XyCx0NdyaVbiOp2OMrI3KPwj1V3RQ/NOii/Sv8XJMYsbLmiBZPZxHLr
 0oPOxmO4ZW2uxwUXqLpZCKZIApP5fRkbLXbO9bWzKlL5g/hG5Vx0qfVAI9CAKfOqMV
 tmM358uBo/FCFQE7cpCl+yIXbi94y/ptPbOUqIoI=
Date: Tue, 25 Aug 2020 09:10:33 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Whitespace clean-ups in schema files
Message-ID: <20200825071033.GB1861@ninjato>
References: <20200812203618.2656699-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200812203618.2656699-1-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-fbdev@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0092570370=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0092570370==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JYK4vJDZwFMowpUq"
Content-Disposition: inline


--JYK4vJDZwFMowpUq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2020 at 02:36:18PM -0600, Rob Herring wrote:
> Clean-up incorrect indentation, extra spaces, long lines, and missing
> EOF newline in schema files. Most of the clean-ups are for list
> indentation which should always be 2 spaces more than the preceding
> keyword.
>=20
> Found with yamllint (which I plan to integrate into the checks).
>=20
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-spi@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: linux-hwmon@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> Cc: netdev@vger.kernel.org
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-serial@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

I trust you guys in figuring out the details, so for touching I2C:

Acked-by: Wolfram Sang <wsa@kernel.org>


--JYK4vJDZwFMowpUq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9EuWkACgkQFA3kzBSg
KbZbPA/+MqNMzGTVXT++2afD+v/Qkum1LRbeldro+e0ewQSps4tnW/eHg9RaemYr
BwxfsOZA+EJp0lGOnRM5/vhPMoInlSEwJSBlxtjratUScfPiR7D4ljKXGaUQv4IV
l9cXBZuOeLnSerxdYsuGrs8M0uqe4rAc3jt/FGD4rSgawNTN1HieFaQ0vq/0I5Gi
pyJv09alaosBuqNYc37Gqm9Ddk6xEJb8lvwrVqeS2ZGMFmfJuFlsuLKhwdgen/og
Wik6VZEjyUHJbyZgkcwMn6rTVTnopK7E0RYmdap35Bh6MAZ3auQ4eQU2tktY3L0G
+NL/ah9FAvmPH1RAR7KmXzZxVYX2ZoWm3AJVpCIvlc9toZI5NdOwdruT+KlTLHIY
T0vs7B3wqsrD4pHputHdDtf9iSZDB0FiTi44yJjReI72Yb47gDXXK7tOcewvq33Y
J9dv/HeT85ER8dZ3fCssLdOsIVSE5ZGaDGjP9M4hPo5ZqM5WlMcqW13gmBsEaY3W
quFFx4pgOXFmnO+7fCb0OIoySeTtgCMNqSwekaNsrbK8dBsFhMx62IzUwwCwL8ST
clLrMsK81BA4v5hiU1SXC5zAJJG1W0FEpGvIuQRa5YxW8goqwIJrEuvy8jWLhg1x
kB4BNFdQdBMg8xw0GSHGDhOZhIxgC5t/fvrbiLmqazzmbfCE1i8=
=71f2
-----END PGP SIGNATURE-----

--JYK4vJDZwFMowpUq--

--===============0092570370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0092570370==--
