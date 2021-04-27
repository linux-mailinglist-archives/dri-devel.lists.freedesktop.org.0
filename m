Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4FE36C5FA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 14:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD856E198;
	Tue, 27 Apr 2021 12:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8946E198
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 12:21:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F408DB190;
 Tue, 27 Apr 2021 12:21:01 +0000 (UTC)
Subject: Re: [PATCH v2] drm/bochs: Add screen blanking support
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210421080859.14869-1-tiwai@suse.de>
 <d1b1fa01-2254-f5cf-0ed0-f8e9c1c3f9ae@suse.de> <s5hk0oo1c9d.wl-tiwai@suse.de>
 <a557e727-d866-3dd3-ec96-741e7da7cf62@suse.de>
 <20210427095604.razo3nrqbfhcjrmd@sirius.home.kraxel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <1a16dde0-1120-e271-22d9-2bd7b0b90417@suse.de>
Date: Tue, 27 Apr 2021 14:21:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210427095604.razo3nrqbfhcjrmd@sirius.home.kraxel.org>
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: multipart/mixed; boundary="===============1520565807=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1520565807==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="eLC8cuCHdSDqorpH5Pmuo86STy6qQpDGX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--eLC8cuCHdSDqorpH5Pmuo86STy6qQpDGX
Content-Type: multipart/mixed; boundary="z5s2LaZeCszjDlDVbFVB9KJnbDv8V686s";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Message-ID: <1a16dde0-1120-e271-22d9-2bd7b0b90417@suse.de>
Subject: Re: [PATCH v2] drm/bochs: Add screen blanking support
References: <20210421080859.14869-1-tiwai@suse.de>
 <d1b1fa01-2254-f5cf-0ed0-f8e9c1c3f9ae@suse.de> <s5hk0oo1c9d.wl-tiwai@suse.de>
 <a557e727-d866-3dd3-ec96-741e7da7cf62@suse.de>
 <20210427095604.razo3nrqbfhcjrmd@sirius.home.kraxel.org>
In-Reply-To: <20210427095604.razo3nrqbfhcjrmd@sirius.home.kraxel.org>

--z5s2LaZeCszjDlDVbFVB9KJnbDv8V686s
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 27.04.21 um 11:56 schrieb Gerd Hoffmann:
>>> I'm fine to change in any better way, of course, so feel free to
>>> modify the patch.
>>
>> If no one objects, I'll merge it as-is. It's somewhat wrong wrt to VGA=
, but
>> apparently what qemu wants.
>=20
> No objections.
>=20
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>

Great. Merged now. Thanks everyone.

>=20
> FYI: cirrus is in the same situation, the modesetting works with qemu
> but is possibly incomplete and might not work on cirrus real hardware
> (it only binds to the qemu subsystem id for that reason).
>=20
> take care,
>    Gerd
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--z5s2LaZeCszjDlDVbFVB9KJnbDv8V686s--

--eLC8cuCHdSDqorpH5Pmuo86STy6qQpDGX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCIAa0FAwAAAAAACgkQlh/E3EQov+DK
ZQ/8D98N8lvdBtKvjRWyf2CphBqM/RIWZxYaHHKk2EZDdznwRBBTWaYiu+2v0Wih0Px/E227gVQZ
XDPMKK5tloxwHQ8H6cCAyJJaLia4bId0cwZDqfO3iWecwJqVa5Z2CHQ7jGtD1v0dsbVSJ02P66tY
IXNn7So7/c1CQRytJMLbmSeh+L73wR3eodIhTxCYhwIt1GHMI/QAq6R2nW4XkFKvMdvyYjxOnm4p
vjuJ5ylaUNvH4y+ZW3shUdQWqi0HVu+auepckt/H5eBm1dqn48lwscnLKxaAdaxe/yUIqpy04P9+
ZzKjbDqk4fnCLX8KRHedIDzxt6KYC3iOUeRt9dsQBp4ZBILggXsYmwUqXO15ZK1XyvO+x9wmdfYz
AGARVay0WCdyLs2MRnlse9Mf7XyKN0qCkg1FEMz9Q7IVDoW5VBSgY6bODZj0OavgbFnS1hA6yARI
5TVpSJNH2WZ2oPX1qQr/URWtdbmYcHmS9ZT4dH8Pk1c/h6ZYxGdMU6l5RFug1CIFdHVXQMT6wh0t
pAn0j4++PuBIhLurgF8ghj5l0u5twrGSKU7kCaeCPZSE2+610X6qIDYXgZKuJwCyQHK/6ChKDCrM
ghPWJyA3xVqxhlg23IWsx4xb5GNBan5jjKeHcrAAh2VlAQe0kV9BxuwQhiUx1A1nfsuoVOGLAAgb
0Fs=
=ZS0w
-----END PGP SIGNATURE-----

--eLC8cuCHdSDqorpH5Pmuo86STy6qQpDGX--

--===============1520565807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1520565807==--
