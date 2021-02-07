Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 632C03126AF
	for <lists+dri-devel@lfdr.de>; Sun,  7 Feb 2021 19:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28FEB6E7D7;
	Sun,  7 Feb 2021 18:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2A76E7D5
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Feb 2021 18:33:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0191CAD6A;
 Sun,  7 Feb 2021 18:33:26 +0000 (UTC)
Subject: Re: [PATCH 0/6] drm: Move vmap out of commit tail for SHMEM-based
 drivers
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210204200308.24216-1-tzimmermann@suse.de>
 <20210205090514.ln6eeoqfcijrd5q2@sirius.home.kraxel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <88b6a41d-d457-6675-4692-c2dc773c9a2d@suse.de>
Date: Sun, 7 Feb 2021 19:33:24 +0100
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
Cc: airlied@linux.ie, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 sean@poorly.run
Content-Type: multipart/mixed; boundary="===============0279439633=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0279439633==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="cYpey3WLi2LTeiB95Top8wIoUEbSK1HRh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cYpey3WLi2LTeiB95Top8wIoUEbSK1HRh
Content-Type: multipart/mixed; boundary="Lddldf1ZWyKcn0Oi46pfKAKIpPvjlmRod";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: airlied@linux.ie, sam@ravnborg.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 dri-devel@lists.freedesktop.org, sean@poorly.run
Message-ID: <88b6a41d-d457-6675-4692-c2dc773c9a2d@suse.de>
Subject: Re: [PATCH 0/6] drm: Move vmap out of commit tail for SHMEM-based
 drivers
References: <20210204200308.24216-1-tzimmermann@suse.de>
 <20210205090514.ln6eeoqfcijrd5q2@sirius.home.kraxel.org>
In-Reply-To: <20210205090514.ln6eeoqfcijrd5q2@sirius.home.kraxel.org>

--Lddldf1ZWyKcn0Oi46pfKAKIpPvjlmRod
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
>=20
> Tested-by: Gerd Hoffmann <kraxel@redhat.com>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>

I had to add one additional patch to v2 of this patchset to make things=20
work with module-only builds. If you have a minute, could you ack this=20
as well? Thanks!

https://lore.kernel.org/dri-devel/20210205150628.28072-3-tzimmermann@suse=
=2Ede/

Best regards
Thomas

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


--Lddldf1ZWyKcn0Oi46pfKAKIpPvjlmRod--

--cYpey3WLi2LTeiB95Top8wIoUEbSK1HRh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAgMnQFAwAAAAAACgkQlh/E3EQov+Dj
dBAAq7SUGl7A9fN0DSOndk4NBjCGdrLQuE1yQAUzjPCdRIOlicf1w90KOzy4vfakAZRqYd8f7h5/
GABwSMhK51JH30uH0IPLXGY25bxQu/L3jhBeP8ySDiGSHcCXTTiNdLGkQwdocTkb+cI+OQKb5bdJ
Vhuwx57IvV8DcyzTCp3IGZkqztrHfDx36PfKcmiJ/JYemq42BtBu1eIinZXdwuQPQt/MOPPxKtNE
j6Q4eMi+xmBS6igezvyRu/2SlOFxuaRu+cBnCeERV77JwCS186yax5cq2rPtDMnUeHAG7qxGhIMB
fAQYpUViXIV6HTAaMuxg8FyQ4YrxTEDFV4XZGh7DoQB3HYyEvK8g3O+LsYJINaEsbjuKQodWOcH/
P6lqSmbM4VKwDjTOVL3wNcfqs50JnpxG92wYAIma4yzg0mE4V+7LpEeHgISerrGEwnMLorLBdtta
tL/1OYkwjcsejYrs58ONa5OrvoeFqL0nxOzj1NZVp3bmpyEz0JBJ0D0lIpHnds5ajkfCfK3dLLSf
AQsmMeX+0GZNJrSzvSkn/tG4ZNUHH1W1N3Kz6WwaA4nk/LiQzc+qjb9hlT7HW4uDQSy/oAFyW/Mc
HoyOWxhowJDkB37G5wOl1SA859iZeBtxVk+JZhKMqpK/IDp2/1q11ZYKJTP7SfdHZRzhaCm4bn7e
gSs=
=2HuM
-----END PGP SIGNATURE-----

--cYpey3WLi2LTeiB95Top8wIoUEbSK1HRh--

--===============0279439633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0279439633==--
