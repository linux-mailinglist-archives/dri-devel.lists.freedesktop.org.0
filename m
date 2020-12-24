Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6366F2E2ACE
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1BB589B95;
	Fri, 25 Dec 2020 09:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD40889C80
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 13:58:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0A1D4ABA1;
 Thu, 24 Dec 2020 13:58:39 +0000 (UTC)
Message-ID: <c3ce6aca901a3d2da8ab1fea6ce17f8c084b5c7e.camel@suse.de>
Subject: Re: [PATCH V2 2/4] drm/v3d: Set dma_mask as well as coherent_dma_mask
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 24 Dec 2020 14:58:37 +0100
In-Reply-To: <1608755714-18233-3-git-send-email-stefan.wahren@i2se.com>
References: <1608755714-18233-1-git-send-email-stefan.wahren@i2se.com>
 <1608755714-18233-3-git-send-email-stefan.wahren@i2se.com>
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
Content-Type: multipart/mixed; boundary="===============1067402243=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1067402243==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-1wKll40e10M4j7o6LSbl"


--=-1wKll40e10M4j7o6LSbl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-12-23 at 21:35 +0100, Stefan Wahren wrote:
> From: Phil Elwell <phil@raspberrypi.org>
>=20
> Both coherent_dma_mask and dma_mask act as constraints on allocations
> and bounce buffer usage, so be sure to set dma_mask to the appropriate
> value otherwise the effective mask could be incorrect.
>=20
> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Regards,
Nicolas


--=-1wKll40e10M4j7o6LSbl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl/kno0ACgkQlfZmHno8
x/57jggAnTVWmU7LA3RjoLmA7L9CR7XdU8yvH4waItoU2TDcTpGRfBMXOAzKoOWA
AyDTyWt6MMMq8qTDj+mkSy2vm0nteG4yeyMETKhD/8AA+Jxy47PTzCX/BHscsFa6
UfnDJLb/bMUDPpXERQKgoH0KNUPAeVOBdi0eGXB3S5xaqqGP1tMq7+YWFdABxyIh
Ab/NwVJ5N/pUa/nmwbiIUS0LjHpvQUL7FVv2y+VJ0Kvua0+Ib9N3roAGHd5qBGlM
BEcOzz+LSCRtWL0t9muOg1ogq6KtEott4vkwk9mhACh2s3A7mkLE7MYV2UsH/0Qm
MJ7M90OfCpjwykkN1BRqp81UtNOWXg==
=nGpd
-----END PGP SIGNATURE-----

--=-1wKll40e10M4j7o6LSbl--


--===============1067402243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1067402243==--

