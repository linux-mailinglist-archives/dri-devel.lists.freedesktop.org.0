Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB22731C1A4
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 19:40:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E1076E907;
	Mon, 15 Feb 2021 18:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF476E907
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 18:39:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 38F23ACD4;
 Mon, 15 Feb 2021 18:39:58 +0000 (UTC)
Subject: Re: [PATCH 0/6] drm: Move vmap out of commit tail for SHMEM-based
 drivers
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210204200308.24216-1-tzimmermann@suse.de>
 <20210205090514.ln6eeoqfcijrd5q2@sirius.home.kraxel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <b50fe1ac-57a5-26da-b358-d8c90578948d@suse.de>
Date: Mon, 15 Feb 2021 19:39:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205090514.ln6eeoqfcijrd5q2@sirius.home.kraxel.org>
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
Cc: airlied@linux.ie, sam@ravnborg.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: multipart/mixed; boundary="===============1194311571=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1194311571==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="65kZwvqIiuzbJZeYhiRShIjtH1xfj7yM2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--65kZwvqIiuzbJZeYhiRShIjtH1xfj7yM2
Content-Type: multipart/mixed; boundary="7tqD3VmYMHLzuULlIYlVHY9UeroFKCm2X";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, hdegoede@redhat.com, sean@poorly.run, sam@ravnborg.org,
 noralf@tronnes.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Message-ID: <b50fe1ac-57a5-26da-b358-d8c90578948d@suse.de>
Subject: Re: [PATCH 0/6] drm: Move vmap out of commit tail for SHMEM-based
 drivers
References: <20210204200308.24216-1-tzimmermann@suse.de>
 <20210205090514.ln6eeoqfcijrd5q2@sirius.home.kraxel.org>
In-Reply-To: <20210205090514.ln6eeoqfcijrd5q2@sirius.home.kraxel.org>

--7tqD3VmYMHLzuULlIYlVHY9UeroFKCm2X
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.02.21 um 10:05 schrieb Gerd Hoffmann:
>    Hi,
>=20
>> I smoke-tested the code by running fbdev, Xorg and weston with the
>> converted mgag200 driver.
>=20
> Looks sane to me.
> Survived cirrus smoke test too.

Reviewers are hard to find. Since you reviewed the shadow-plane=20
conversion for cirrus; may I ask you for a review of a similar patchset=20
in the ast driver. It's mostly about moving code around. In the end, ast =

cursors will use generic shadow planes as well.

=20
https://lore.kernel.org/dri-devel/20210209134632.12157-1-tzimmermann@suse=
=2Ede/

If you have something where I can help out with a review, let me know.

Best regards
Thomas

>=20
> Tested-by: Gerd Hoffmann <kraxel@redhat.com>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>=20
> take care,
>    Gerd
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--7tqD3VmYMHLzuULlIYlVHY9UeroFKCm2X--

--65kZwvqIiuzbJZeYhiRShIjtH1xfj7yM2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAqv/wFAwAAAAAACgkQlh/E3EQov+BF
HBAAtAkQJzvpwuAeTX/XI6z4jaCJk1TiKuYZP+/D6wL8wWZPbiR1mqLIjUCeddM86UQBNYbugIND
OGVH9vBBA6U/bc3hf8xKZWGJBPMye0J1sVHDxbuhUxS8xLSdI8bYv8v7/mlu3E1TAUF1g1u9VFj9
zn2biCquo9S/Z80vePIhhGuLf/VClnnU8BjoD3VVp4WeUP1gj/1/9NubcapTfMJERrYdVV6P1iJP
uLqFEhlzdCRJCkRw9CDHn6CTRQhyYqZBNbSKrL3sGtO+AXxReT7BA2qr1jeMgkp743azZFS6lSa2
D+Pr4cENKgeOX3B6xHWSUp2KiTRpOKYBwQWk5TTmflLYcZdVF/ORnH/Rcrdntva1zlwYmqRJY00A
gAnuI5c++zugmy5joH/xgRCOpm+VarvxqdOUYN4K4LK1LkSqkZwrjK48XqjDpVohnT+EdmW6qJNH
wpJmzR6a74wjZwRc7q8tiI1tZ7I7j1HRLOdz2XlP1pR1E+msYiOq3VzwM6f9UwJlJdK8ZCdZ5AR2
0X0bAJIEV/MAWJoFw5xKPWvT/1X4Hkuh9JnwFrPOojI2fr40XgqOpsbo1DdRTgsYs1pvERT0JvzD
lHysQqgoZrMPa6DtHdOcWIiL9B3Y8upI5uWIMVqywRJ+YwOWOWo433V0mVgFTpTMbYpColaoTjxK
xzc=
=aCVH
-----END PGP SIGNATURE-----

--65kZwvqIiuzbJZeYhiRShIjtH1xfj7yM2--

--===============1194311571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1194311571==--
