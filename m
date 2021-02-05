Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F703310C96
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 15:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD8B6F44A;
	Fri,  5 Feb 2021 14:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CEB6F44A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 14:30:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AEFAAAC9B;
 Fri,  5 Feb 2021 14:30:50 +0000 (UTC)
Subject: Re: [kraxel:drm-testing 11/15] ERROR: modpost: "drm_gem_vunmap"
 undefined!
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kernel test robot <lkp@intel.com>
References: <202102052044.rE4lLngg-lkp@intel.com>
 <e68e3ad5-42a8-ae50-f05f-65f978efaa75@suse.de>
Message-ID: <1810055d-7394-fdf8-03ac-d9c094246d1f@suse.de>
Date: Fri, 5 Feb 2021 15:30:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <e68e3ad5-42a8-ae50-f05f-65f978efaa75@suse.de>
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
Cc: kbuild-all@lists.01.org, Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1370591511=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1370591511==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dn156qhjoNQbBTjtd5j4NcZphoS9Rv7Zo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dn156qhjoNQbBTjtd5j4NcZphoS9Rv7Zo
Content-Type: multipart/mixed; boundary="66vaZXvBSLBKoWOqY4xksVtw0WYftu8ec";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <1810055d-7394-fdf8-03ac-d9c094246d1f@suse.de>
Subject: Re: [kraxel:drm-testing 11/15] ERROR: modpost: "drm_gem_vunmap"
 undefined!
References: <202102052044.rE4lLngg-lkp@intel.com>
 <e68e3ad5-42a8-ae50-f05f-65f978efaa75@suse.de>
In-Reply-To: <e68e3ad5-42a8-ae50-f05f-65f978efaa75@suse.de>

--66vaZXvBSLBKoWOqY4xksVtw0WYftu8ec
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


Am 05.02.21 um 14:22 schrieb Thomas Zimmermann:
>> All errors (new ones prefixed by >>, old ones prefixed by <<):
>>
>>>> ERROR: modpost: "drm_gem_vunmap" [drivers/gpu/drm/drm_kms_helper.ko]=
=20
>>>> undefined!
>>>> ERROR: modpost: "drm_gem_vmap" [drivers/gpu/drm/drm_kms_helper.ko]=20
>>>> undefined!
>=20
> These are in drm_gem.c and build unconditionally. It's not clear to me =

> how this can fail. Ideas, anyone?

Oh, they are not exported. Can we export them?

>=20
> Best regards
> Thomas
>=20
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--66vaZXvBSLBKoWOqY4xksVtw0WYftu8ec--

--dn156qhjoNQbBTjtd5j4NcZphoS9Rv7Zo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAdVpkFAwAAAAAACgkQlh/E3EQov+Bn
tw/8D4INMOdUm5TTr7I2kDFmjtur1sFim1KB56a1xZxMrgJX7osCXU7gdUXrSDmOmGY1UeaUYYcy
JiQsXw4LuoTzojfVKnqFBdatJvzeWXylTTkeSziDLcg5ZZokypWrOfMyEHKW0g3m8F0Hvu57v0iu
hiWNosZ7UtiXMxDqbsEpucNXqsaI4ERmiW0RrZjOIZejhf4NJmjHsiA2OYW9DSF8+qEN5gEL2QeF
czNAOrjo3AyTmSsVA9icUADECiAkaIjbTL1uX1rPKdnRBDbW+3lvhzMECZftkOVX3v8DowGqZfQv
js0XQOM2C7e1HEO12l/ZFlXFZnoh+cG1WFRDS2ovVW72NOjphFwr2bBg6fEJPPDAq8cRMBjTALG+
NC6bXS5Qk5kCH2jfN+J56AcMDxRx2LT7foFybUSH5E22msExeIRLNMkeDsPc+8UAOpHgtNYOpXrI
rbrLsW2zHk5aTe6e58N0fMd951atZH3p1Zbr6pGIabsHv9fJvFd+pUeUhl2PmeZbgTAjsX6awTfh
fQUYhFXIZ+KrTdiIomYjDmEB1RHgXydgktw7Cll/YNauToB+YV+JuI7mZUDRr4ERN6usFXl2CNKf
tkdLl7F51NN565w9zSzQXtPYYQDaiJcJMOzHnQsqlzABuW3o8nOqSpIrW1VPoWzpzbXryWi0D2rE
Zr8=
=Qmwc
-----END PGP SIGNATURE-----

--dn156qhjoNQbBTjtd5j4NcZphoS9Rv7Zo--

--===============1370591511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1370591511==--
