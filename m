Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE0811F20E
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5EC6E33F;
	Sat, 14 Dec 2019 14:42:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C426E914
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:50:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 26FC7292BC7
Date: Fri, 13 Dec 2019 10:49:56 -0500
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] drm/panfrost: Prefix interrupt handlers' names
Message-ID: <20191213154956.GB3042@kevin>
References: <20191213123942.22891-1-ezequiel@collabora.com>
 <26b59d91-f974-de29-5ca8-6fbc2db29a11@baylibre.com>
 <31fd8f77-99b3-9edf-a23b-1484d9dcf48f@arm.com>
 <20191213143225.GB3640@kevin>
 <b44f31b3-ff81-1b41-e25c-cb424f990606@arm.com>
MIME-Version: 1.0
In-Reply-To: <b44f31b3-ff81-1b41-e25c-cb424f990606@arm.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Sat, 14 Dec 2019 14:42:54 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: multipart/mixed; boundary="===============1918907061=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1918907061==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KFztAG8eRSV9hGtP"
Content-Disposition: inline


--KFztAG8eRSV9hGtP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2019 at 03:31:45PM +0000, Robin Murphy wrote:
> On 13/12/2019 2:32 pm, Alyssa Rosenzweig wrote:
> > > TBH it would probably be sufficient to save the bother of allocating
> > > strings and just settle on "panfrost-{gpu,job,mmu}", since upstream
> > > users are unlikely to ever come across a system with more than one
> > > Mali in it ;)
> >=20
> > Agreed.
> >=20
> > ----Wait, you said *upstream*? Are there .... oh no
>=20
> Heh, fear not - I'm only thinking of the "Juno board with FPGA prototyping
> stack" setup, and the people using those in anger are all working on some
> other driver anyway ;)

Gotcha :)

--KFztAG8eRSV9hGtP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl3zsyQACgkQ/v5QWgr1
WA1TxRAAn4HQc67B+nBsiFLHShkbBC7DHdPrbMrr0uL26Gmai7Kn1Nspjn+AIme8
vEvTyetozGUXseXyNof0rLImn1e5xAophRORgiQLNjLROPdi+RTgIjMVzAxiJ0FT
okOVZCdCHDXNkm8HucKMsZ5GQL5SL12bRL/xmNzSnjI0h08onzAqpHJekcmgPVFx
e3GrRJkYupFLqS4Uy1yMTrPk/IJJ8RKkorQh5axFfWGeXVtbgMkdFe/mT24OKQJe
PSaiRtE1SzPb8Hjutx7jlgYzn4X/LIYDyChBf+kG9xyiqHCwlO+0fyTCS4K9v5BC
qb8lA75N5roExR7KVu6ccaXx3d/ru6LSk0HKrGjYajIIVLuU52dHKZpV+rxNKWEm
nAqyioj2lXjFtephQ/4ezq1mFiTJUA/XOI0KhYqiBNnOUuZ5o4Cn54Hk8MvrwxfN
+lEYZRX1JlySQNFZsCTz5ZFHAg8bGz7Fr5YjeqbVlGpYRUvdhzSNrLA0KNVnxgGb
I32nHGScdEISW0Ona7OIh5G4qvi6kNOVGxmpA6va/TxUMthJc5FP6qoMQ312ZDgx
ss3VZL5fGfxS7d4lpf2e9biursCdhMuYSQHXUi4G9iIDAogTyenxMz9GstJZF6pZ
U0Qas8WlEccvUQ1tTPjyKEEEoeA0K3LewL8QHx7dG/VHgnWA+DE=
=BStY
-----END PGP SIGNATURE-----

--KFztAG8eRSV9hGtP--

--===============1918907061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1918907061==--
