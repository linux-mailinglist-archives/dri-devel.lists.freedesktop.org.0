Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEEB6780D9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 17:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7429910E4EE;
	Mon, 23 Jan 2023 16:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 73108 seconds by postgrey-1.36 at gabe;
 Mon, 23 Jan 2023 14:35:19 UTC
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C615110E4AB
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 14:35:19 +0000 (UTC)
Received: (Authenticated sender: didi.debian@cknow.org)
 by mail.gandi.net (Postfix) with ESMTPSA id 49325240008;
 Mon, 23 Jan 2023 14:35:15 +0000 (UTC)
From: Diederik de Haas <didi.debian@cknow.org>
To: David Airlie <airlied@redhat.com>,
 "open list:AGPGART DRIVER" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] agp/amd64: Fix full name of the GPL
Date: Mon, 23 Jan 2023 15:35:04 +0100
Message-ID: <2864476.hPRh1b3E4p@prancing-pony>
Organization: Connecting Knowledge
In-Reply-To: <bd2df24b-e19e-2ba4-c3e8-0d555f69b453@wanadoo.fr>
References: <20230122181632.54267-1-didi.debian@cknow.org>
 <bd2df24b-e19e-2ba4-c3e8-0d555f69b453@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2917665.PWPBeqnEoL";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Mailman-Approved-At: Mon, 23 Jan 2023 16:04:33 +0000
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

--nextPart2917665.PWPBeqnEoL
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH] agp/amd64: Fix full name of the GPL
Date: Mon, 23 Jan 2023 15:35:04 +0100
Message-ID: <2864476.hPRh1b3E4p@prancing-pony>
Organization: Connecting Knowledge
In-Reply-To: <bd2df24b-e19e-2ba4-c3e8-0d555f69b453@wanadoo.fr>
MIME-Version: 1.0

On Sunday, 22 January 2023 20:49:22 CET Christophe JAILLET wrote:
> Le 22/01/2023 =E0 19:16, Diederik de Haas a =E9crit :
> > Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
> > ---
> >=20
> >   drivers/char/agp/amd64-agp.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
> > index ce8651436609..3020fd92fd00 100644
> > --- a/drivers/char/agp/amd64-agp.c
> > +++ b/drivers/char/agp/amd64-agp.c
> > @@ -1,7 +1,7 @@
> >=20
> >   // SPDX-License-Identifier: GPL-2.0-only
> >   /*
> >  =20
> >    * Copyright 2001-2003 SuSE Labs.
> >=20
> > - * Distributed under the GNU public license, v2.
> > + * Distributed under the GNU General Public License, v2.
> >=20
> >    *
> >    * This is a GART driver for the AMD Opteron/Athlon64 on-CPU
> >    northbridge.
> >    * It also includes support for the AMD 8151 AGP bridge,
>=20
> maybe the line can just be removed.
> There is already a SPDX-License-Identifier above.

Hi,

That does sound reasonable, but I'm now seeing it as a legal issue [1] and =
no
longer as a spelling one. Strictly speaking it seems there is a discrepancy
between the SPDX identifier and the 'full' license statement.
While it may be reasonable to *assume* the "GNU General Public License, v2"
was meant, when it comes to license/legal stuff, I think that does not suff=
ice.

So I'd like to retract my patch submission and want to leave it up to people
who are in a position to resolve this issue, if that needs to be done.

Apologies for the noise.

Diederik

[1] https://lore.kernel.org/lkml/ad99d227-ce82-319b-6323-b70ac009d0e7@roeck=
=2Dus.net/
--nextPart2917665.PWPBeqnEoL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCY86bGAAKCRDXblvOeH7b
bpDmAP9dkD6xv0+7accWtErOCfRIgkP5DZA86jJpwo3vBmbRSQD9HO65FfldWmSO
OPgm2CWJWdARSiR7d8Aa/AHJaj4X1QM=
=pjaj
-----END PGP SIGNATURE-----

--nextPart2917665.PWPBeqnEoL--



