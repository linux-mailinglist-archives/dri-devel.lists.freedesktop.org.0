Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B20674838
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 09:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198086E66D;
	Thu, 25 Jul 2019 07:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76896E636
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 07:23:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D43B2AD12;
 Thu, 25 Jul 2019 07:23:34 +0000 (UTC)
Message-ID: <25a729cd1aa40fe5fc53760be48721d3f56b67e6.camel@suse.de>
Subject: Re: [PATCH v2] Staging: fbtft: Fix GPIO handling
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Greg KH <gregkh@linuxfoundation.org>, Jan Sebastian
 =?ISO-8859-1?Q?G=F6tte?= <linux@jaseg.net>
Date: Thu, 25 Jul 2019 09:23:32 +0200
In-Reply-To: <20190725072132.GA18714@kroah.com>
References: <20190715143003.12819-1-nsaenzjulienne@suse.de>
 <7b8242ab-cc0c-d90b-60af-ff1c53789e44@opensynergy.com>
 <5a77c18f-7338-888f-2379-12171b6a545e@jaseg.net>
 <75ada52f-afa1-08bc-d0ce-966fc1110e70@jaseg.net>
 <20190725072132.GA18714@kroah.com>
User-Agent: Evolution 3.32.3 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 25 Jul 2019 07:29:33 +0000
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
 dri-devel@lists.freedesktop.org, bhanusreemahesh@gmail.com,
 Phil Reid <preid@electromag.com.au>
Content-Type: multipart/mixed; boundary="===============1630889973=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1630889973==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-dJ2ncZl/Tq5SUWotdfEp"


--=-dJ2ncZl/Tq5SUWotdfEp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-07-25 at 09:21 +0200, Greg KH wrote:
> On Wed, Jul 17, 2019 at 11:41:37PM +0900, Jan Sebastian G=C3=B6tte wrote:
> > Commit c440eee1a7a1 ("Staging: fbtft: Switch to the gpio descriptor
> > interface") breaks GPIO handling. In several places, checks to only set
> > a GPIO if it was configured ended up backwards.
> > I have tested this fix. The fixed driver works with a ili9486
> > display connected to a raspberry pi via SPI.
> >=20
> > Fixes: commit c440eee1a7a1d ("Staging: fbtft: Switch to the gpio descri=
ptor
> > interface")
> > Tested-by: Jan Sebastian G=C3=B6tte <linux@jaseg.net>
> > Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> > Signed-off-by: Jan Sebastian G=C3=B6tte <linux@jaseg.net>
> > ---
>=20
> Can this go on top of Phil's patches?  Or does it replace it?

This is needed on top of Phil patches.

Regards,
Nicolas


--=-dJ2ncZl/Tq5SUWotdfEp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl05WPUACgkQlfZmHno8
x/5gTAf/fIsoLKSE7JnAbBPihq8kbe1iDC8qQWHchEqQDL+A1r6QA0n+ujgSQfRY
Le/xoufXOHO29UeoJ4AUh05o8kaL7lDc8ip88dtd+4Kgl4p9LyQ1AbuKYi/ifGeW
u/AEbQhgsRu9gQMeUo1qjZQqzgbnNqSeRoimKNwelFruH0uIKwcgECcjiR6FHtvq
W7XoMzZ44YLGnS67QcbO0xtEqgWRetpXc2Li8xoWi1JT/vqYwT/My9udmNb1vvBE
SvfyGCry9zYS/7NL638P0qfTLm7WznpqHn41UV3Ptq7RaD6Idcm+Ai6OyczdviaF
wNVcIaFhx73LXuCdrESnpqF6CdhaHA==
=OcqC
-----END PGP SIGNATURE-----

--=-dJ2ncZl/Tq5SUWotdfEp--


--===============1630889973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1630889973==--

