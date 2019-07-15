Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F436A05A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 03:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDD36E06E;
	Tue, 16 Jul 2019 01:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4E4897B5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 15:14:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 69CC0ACBA;
 Mon, 15 Jul 2019 15:14:29 +0000 (UTC)
Message-ID: <ba7c763b5c2a2d5edc4c0f700dabe08c47970600.camel@suse.de>
Subject: Re: [PATCH] Staging: fbtft: Fix GPIO handling
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Jan Sebastian =?ISO-8859-1?Q?G=F6tte?= <linux@jaseg.net>
Date: Mon, 15 Jul 2019 17:14:27 +0200
In-Reply-To: <294c94d2-d2c1-514d-ba6d-c62e98017bc0@jaseg.net>
References: <20190715143003.12819-1-nsaenzjulienne@suse.de>
 <7b8242ab-cc0c-d90b-60af-ff1c53789e44@opensynergy.com>
 <5a77c18f-7338-888f-2379-12171b6a545e@jaseg.net>
 <294c94d2-d2c1-514d-ba6d-c62e98017bc0@jaseg.net>
User-Agent: Evolution 3.32.3 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 16 Jul 2019 01:36:34 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: devel@driverdev.osuosl.org, leobras.c@gmail.com,
 linux-fbdev@vger.kernel.org, nishadkamdar@gmail.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 bhanusreemahesh@gmail.com, Phil Reid <preid@electromag.com.au>
Content-Type: multipart/mixed; boundary="===============0043617464=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0043617464==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-QmBqWije45AXLJOH4tKP"


--=-QmBqWije45AXLJOH4tKP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-07-16 at 00:04 +0900, Jan Sebastian G=C3=B6tte wrote:
> Commit c440eee1a7a1 ("Staging: fbtft: Switch to the gpio descriptor
> interface") breaks GPIO handling. In several places, checks to only set
> a GPIO if it was configured ended up backwards.
> I have tested this fix. The fixed driver works with a ili9486
> display connected to a raspberry pi via SPI.
>=20
> Fixes: commit c440eee1a7a1d ("Staging: fbtft: Switch to the gpio descript=
or
> interface")
> Tested-by: Jan Sebastian G=C3=B6tte <linux@jaseg.net>
> Signed-off-by: Jan Sebastian G=C3=B6tte <linux@jaseg.net>

Thanks Jan, this version is indeed more complete.

Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Regards,
Nicolas


--=-QmBqWije45AXLJOH4tKP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl0smFMACgkQlfZmHno8
x/7xwQf9FFwqX1/6VPgDb4yvg7MXgCePh5zi7ffVRp75KpkfnNhAaKVX2v80j1XF
363ZZxrH2l67NyEorRbbFcqVRQh5vrIPExE/yAOTtnD1JTiZ3BnaBsKMmRfNVFgq
dQN2uxi7hW0xeSRGOb3PrtgVLB58UvOcSfTRX9++C+fy9W+BBqacK3qB5Ib5IRAJ
iRDVyyz45WTo7D6DgDiU/A/7vZnCTrNvu8Mw8R4FWdUbrfEzu1HUR/bem1KTAzIe
NEeAE9oe60C4dz3xd4Hfa5R7L0DCivs/PlzBtOGLTXu59L4DT7X/RdD3yKzbnH4X
dgfIdTNtBQv4XOgazxOdnbgFIzfLlw==
=7p4W
-----END PGP SIGNATURE-----

--=-QmBqWije45AXLJOH4tKP--


--===============0043617464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0043617464==--

