Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AC1221C0E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 07:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0650E6E28A;
	Thu, 16 Jul 2020 05:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896F46E28A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 05:44:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C7F05B1A9;
 Thu, 16 Jul 2020 05:44:40 +0000 (UTC)
Subject: Re: [PATCH 0/8] drm/mgag200: Support desktop chips
To: Dave Airlie <airlied@gmail.com>
References: <20200715145902.13122-1-tzimmermann@suse.de>
 <CAPM=9tx1+cNHR3aYWFNey9veYn18A=b1Tgm9Pa4UvKjUSFg22g@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <e88a2b2d-185c-fef4-6928-446e1ac0c95c@suse.de>
Date: Thu, 16 Jul 2020 07:44:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPM=9tx1+cNHR3aYWFNey9veYn18A=b1Tgm9Pa4UvKjUSFg22g@mail.gmail.com>
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
Cc: John Donnelly <john.p.donnelly@oracle.com>,
 kernel test robot <rong.a.chen@intel.com>, Egbert Eich <eich@suse.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: multipart/mixed; boundary="===============0654074382=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0654074382==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="K9mbtuF4pqrEXaUFwTcTXgzBun6duqndU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--K9mbtuF4pqrEXaUFwTcTXgzBun6duqndU
Content-Type: multipart/mixed; boundary="9utUqrymrBTA3fjOJkN4Jb5J3R3sS2Mrf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>
Cc: John Donnelly <john.p.donnelly@oracle.com>,
 kernel test robot <rong.a.chen@intel.com>, Egbert Eich <eich@suse.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Message-ID: <e88a2b2d-185c-fef4-6928-446e1ac0c95c@suse.de>
Subject: Re: [PATCH 0/8] drm/mgag200: Support desktop chips
References: <20200715145902.13122-1-tzimmermann@suse.de>
 <CAPM=9tx1+cNHR3aYWFNey9veYn18A=b1Tgm9Pa4UvKjUSFg22g@mail.gmail.com>
In-Reply-To: <CAPM=9tx1+cNHR3aYWFNey9veYn18A=b1Tgm9Pa4UvKjUSFg22g@mail.gmail.com>

--9utUqrymrBTA3fjOJkN4Jb5J3R3sS2Mrf
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.07.20 um 21:56 schrieb Dave Airlie:
> On Thu, 16 Jul 2020 at 00:59, Thomas Zimmermann <tzimmermann@suse.de> w=
rote:
>>
>> This patchset puts device initialization in the correct order and
>> adds support for G200 Desktop chips (PCI ids 0x520 and 0x521).
>=20
> why? :-)

With G200 support in place, we can add also support for the newer cards
in the G-Series up to the G550. Believe it or not, the G550 for PCIe is
still being actively marketed and manufactured by Matrox. [1] Even the
predecessor chips G450 was only EOLed in Oct 2016. [2] So while the
chips might be 20yrs old, the devices are still current.

Best regards
Thomas

[1]
https://matrox.com/graphics/en/products/graphics_cards/g_series/g550pcie/=
?productTabs=3D1
[2] https://www.matrox.com/graphics/en/products/legacy/g_series/g450pci/

>=20
> I'm pretty sure I NAKed the previous version because the userspace
> experience for these old cards was probably better with
> xorg-x11-drv-mga, but hey maybe it isn't anymore and we should go
> ahead. I know SuSE use these for testing, but apart from that do we
> really think we have any users for this?
>=20
> Dave.
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


--9utUqrymrBTA3fjOJkN4Jb5J3R3sS2Mrf--

--K9mbtuF4pqrEXaUFwTcTXgzBun6duqndU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8P6UMUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPt8Af/fqb6B0tMJYlM/ChOLYfYsg0YrBqu
tGD8u1ubqPKaLysxTT/TR7abCOWiA4jmmQC3Dj1I5utxs6lh2CveBmnX2m4MaH8o
qiFr6541f3Ak68tV6QdmEE5I29Mx996BmHZh2U62NuzJKx2RPkIr4xkFFgZF+CAy
VsIX1jMnoSrH8gO2GRCc3qET/LL2KQrfTlChDVD+0BOoquDIDpSjCgyA6a50/q4N
zEV3dP4thgguW26Ob26qMDAN2DwGoulFQ5sl+6RactBXJp1IOLB7rYavQIAZEWoY
y3SiwkIz+Nk6dzoC7KL+I5g+YfU5aBz4h9ui2Hxfjeua/EnAhf/JRPuKTQ==
=JBIy
-----END PGP SIGNATURE-----

--K9mbtuF4pqrEXaUFwTcTXgzBun6duqndU--

--===============0654074382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0654074382==--
