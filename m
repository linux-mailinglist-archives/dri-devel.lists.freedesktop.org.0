Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 121A593F30F
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 12:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C74410E381;
	Mon, 29 Jul 2024 10:45:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=heusel.eu header.i=christian@heusel.eu header.b="aIkAWYdf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 319 seconds by postgrey-1.36 at gabe;
 Mon, 29 Jul 2024 08:53:26 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDC710E338;
 Mon, 29 Jul 2024 08:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
 s=s1-ionos; t=1722243204; x=1722848004; i=christian@heusel.eu;
 bh=N+NwBbz+/aJSBJUMWMagSHJ6kZuiXC8iiLcDvJJtxAM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=aIkAWYdfnSdB/BSneVxyHttpJHdlX+I0e/5//U894N6QcMbhsIDHWoOgAiaL3vpL
 ZuZc+Szg3ubxvxe2a33N70+FzCiuInsuiT6s1KidzhQx3iKKzMXRXmsUd6C6MsdpV
 WGDeeGhpYcaIV79IODJ0EhYzPWWjFOJJMdu/Cw/c++ACXey+sgttQ66XGwlmTXxuM
 y8TQxDolpaOXqijmYlyooCS6RA/8TF+T7HatLu8fFnjs0N3XttV4alYluU4oDRa7Q
 Iy6JIPPKYIzqFth9zKqYtyjx4lPebBYc/8AFlZ06tFave7lvRY9iS2KeRg9YNhcj6
 F6fJs4y7QyJRT4nT5Q==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([141.70.80.5]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MVJZv-1sfBg84Bkt-00Ukrx; Mon, 29
 Jul 2024 10:48:00 +0200
Date: Mon, 29 Jul 2024 10:47:58 +0200
From: Christian Heusel <christian@heusel.eu>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Greg KH <gregkh@linuxfoundation.org>, "Lin, Wayne" <Wayne.Lin@amd.com>, 
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
 "Wu, Hersen" <hersenxs.wu@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "kevin@holm.dev" <kevin@holm.dev>
Subject: Re: [REGRESSION] No image on 4k display port displays connected
 through usb-c dock in kernel 6.10
Message-ID: <b7f0f3e1-522b-4763-be31-dcee1948f7b3@heusel.eu>
References: <d74a7768e957e6ce88c27a5bece0c64dff132e24@holm.dev>
 <9ca719e4-2790-4804-b2cb-4812899adfe8@leemhuis.info>
 <fd8ece71459cd79f669efcfd25e4ce38b80d4164@holm.dev>
 <CO6PR12MB54897CE472F9271B25883DF6FCB72@CO6PR12MB5489.namprd12.prod.outlook.com>
 <e2050c2e-582f-4c6c-bf5f-54c5abd375cb@leemhuis.info>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="n63a2yfaefc6qmdi"
Content-Disposition: inline
In-Reply-To: <e2050c2e-582f-4c6c-bf5f-54c5abd375cb@leemhuis.info>
X-Provags-ID: V03:K1:VUQmBHNbUxSuivJa3UWDZUqROOuD+vc3R6CCCrrh1OCODtgXJZY
 whBiOcObwswdViHJ7YQFJWyEGkXfr5cc17ziisLlaAyGJQtzW9LNeUIG1daJeIbnckfphJr
 kIfm1yEZmZtTsw+BEw6S2QdqYF3E0UzgvrM6rkWWVIL3M3rsVmwO6MxdO1CKyRkQkRKwRik
 u5VMTw6Z6RC7sZmXJ+NcQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BpXulR7GWOU=;jSFCaL6BH+dWZ9GEequ1mAyiBXF
 /0hrtQPNPq0MU3DY6JTWgcSQzTsVYqXtVPJ9rQTCFdFj09eUuYQnqj6RHPXb/kZTzPZoCLlFv
 M2TT27qQf2bLUaL+2bipHHbxZcPaauEuN035dvH+ooWxTXMhvHO1oDkWnDygDCArO6TyiL3hf
 pvInd4/SrlT4m27CX2SQdst46/y1QDq54zLIuuguRl64cu9IYHRKD7oSdVkMr1r0JVwuB9k+C
 iTs3cNP4DjsbZihv9Zx6qt4ewZP2C/XmmaCV9pEl3dh1NzuLf1i3v0sREImgn0a26pAF7Hzmq
 D2OGYi5jpL4abo685rBXcVGETqvh2KQsH2uT2+VVJGvvWkdnhtjehuWF8UMN3T+1Zdwcsplz/
 QqEKl9UWaz3xnW2v19BlCw2puOuN5eAMDFxqqK5Jjj+B3h71bn16TSlCCJ+AgUkKo8vTXZFBI
 Ks28cgG4M69xaJcSYD+Xt/dvStxYtkraaMqJ25l8K/8GshW6Jyfmwq3qIQAwfXMuQpbYAf7fU
 KkiTNoLUFnf5FPYEJ3+wQGePB8XsLwHtpZZ88xB5ozuzUgvbgotg4EKhFwGdVQpn0jjrplyU0
 pwGDWziBLWc61f9ZNYOlEfuSDEVbVLeJSc9C7Nvq6zn+V3Ffd9QAfkNLXTHD3ddQeb7FTxSKu
 vjbajmHa6rIv6SmwgLVnlhNXujPzPz6lgQRW965LMyG5CXRaoY9JJNIZm0B4aJ+JfeWJ803GI
 KoOq3pkOFHRgLkjYMLtPfXWNlF6pDT8vAjQM7gJJ4aFqziZtYsFBpNwzzdn9AnnWAsWebwu1V
 lr
X-Mailman-Approved-At: Mon, 29 Jul 2024 10:45:09 +0000
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


--n63a2yfaefc6qmdi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 24/07/29 10:35AM, Linux regression tracking (Thorsten Leemhuis) wrote:
> [+Greg +stable]
>=20
> On 29.07.24 10:16, Lin, Wayne wrote:
> >
> > Thanks for the report.
> >=20
> > Patch fa57924c76d995 ("drm/amd/display: Refactor function dm_dp_mst_is_=
port_support_mode()")
> > is kind of correcting problems causing by commit:
> > 4df96ba6676034 ("drm/amd/display: Add timing pixel encoding for mst mod=
e validation")
> >=20
> > Sorry if it misses fixes tag and would suggest to backport to fix it. T=
hanks!
>=20
> Greg, seem it would be wise to pick up fa57924c76d995 for 6.10.y as
> well, despite a lack of Fixes or stable tags.
>=20
> Ciao, Thorsten

The issue is that the fixing commit does not apply to the 6.10 series
without conflict and the offending commit does not revert cleanly
aswell.

Cheers,
Chris

--n63a2yfaefc6qmdi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmanVz4ACgkQwEfU8yi1
JYUDMQ//Y8/U38qoRUI7sbmJIBjtkpE62b//dAJYdlSyjbvLe2/qOs+pp0oXFn4D
bkw39ja845pauQ0ISjSOm3lJkxLxsHHhU4Ea9z1ww1wrONnPTPImpf3v7bKPnVJu
pHS6fYP61Wfpktv+lXbsscprlWyvejjRwlwSJT8NXKdPtIn7qXK/hQkmYZQg7CwO
GGjBMAOG/ocpLk9UGkmCN8ncArXDpzP+jIJMl0LE6TNtiBl6V6rtFsqEm2dVCqtJ
pLE4FT/t3/FfAaRMn2U1HyLTsxYy/FIYtQr5eogDcShmkKL2k9mHfTJuKxKhvYWU
z1qfWD0T1pxGnl+EnKUmnuX+ypACWYpGRLWdoIWJLke9aKCjpF559xEArom3djfb
KK3yOm9EjxXQYqZuroLCYn8IA+OlWuIZX8wo2g/6/WsVnxM5pb6QeuZMNAs9Il/8
UxaOxBNMx5eyGqNEvlBaG3re/wsfwKucjA3fqnjVqoc31527EpNcH/3edRtwdARd
ApvEueEJXC//c+liEQFhXwc+p+yGAWpf0jAagpd5Z3XdvQkcMOEFrejsOLuZb7/Z
nnEluHAheR+CrUAQEefHWjjjcrNx8/yFKmLj7yTeV7T9VwKkbTEW7mJFgFp56fFf
MlSoriJ2BgHDaHW7gRUisq0D+CopuNS3nQUBGc4unCALCCLlIGI=
=jOkp
-----END PGP SIGNATURE-----

--n63a2yfaefc6qmdi--
