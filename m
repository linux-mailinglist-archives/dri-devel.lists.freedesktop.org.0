Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F12B72E2AD7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:42:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94AB089C51;
	Fri, 25 Dec 2020 09:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F7489C80
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 13:59:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5ACF4ABA1;
 Thu, 24 Dec 2020 13:59:28 +0000 (UTC)
Message-ID: <da25a2c8fcdd5549b078446cd80db182896168c5.camel@suse.de>
Subject: Re: [PATCH V2 3/4] drm/v3d: Don't clear MMU control bits on exception
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 24 Dec 2020 14:59:27 +0100
In-Reply-To: <1608755714-18233-4-git-send-email-stefan.wahren@i2se.com>
References: <1608755714-18233-1-git-send-email-stefan.wahren@i2se.com>
 <1608755714-18233-4-git-send-email-stefan.wahren@i2se.com>
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 25 Dec 2020 09:42:09 +0000
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
Cc: devicetree@vger.kernel.org, Phil Elwell <phil@raspberrypi.org>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0328331732=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0328331732==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-SF/wIJ8KXzM2cPAzM0qP"


--=-SF/wIJ8KXzM2cPAzM0qP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-12-23 at 21:35 +0100, Stefan Wahren wrote:
> From: Phil Elwell <phil@raspberrypi.org>
>=20
> MMU exception conditions are reported in the V3D_MMU_CTRL register as
> write-1-to-clear (W1C) bits. The MMU interrupt handling code clears any
> exceptions, but does so by masking out any other bits and writing the
> result back. There are some important control bits in that register,
> including MMU_ENABLE, so a safer approach is to simply write back the
> value just read unaltered.
>=20
> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Regards,
Nicolas



--=-SF/wIJ8KXzM2cPAzM0qP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl/knr8ACgkQlfZmHno8
x/6jWgf8DvOFJ7x+Rt7bbYKe2TRB8OW5AEsJjP3/Z4mf05WCAp0ND4dwOzfE0RIM
dKq5eUneQl7w19aHRPqRMdZydruet70/Vw5cAHvdBVwENpni/jdmwxyxOCV8ZKL7
BfwjzHopcBF+cLq/X5jtkUtWMBBsw2leeWpqKejohPzEs6fqZb7Ndyr9KH55pILE
rB4cqJaxJ8UM06AYXWqZmZa7kF0ImPU15skR2QsVjIfEiI8m+zfhZOHEj2zIudJs
Og6Iw96bn5rxuB9+ayOVwJmzpXBNz9Ub6yJ4MfH8Qd64besQIXSLPqRHG/M9+80K
9Lm/Li+snkeMW16tZTtwQb6rLW5KRw==
=a/ej
-----END PGP SIGNATURE-----

--=-SF/wIJ8KXzM2cPAzM0qP--


--===============0328331732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0328331732==--

