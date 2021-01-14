Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8197A2F5C97
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 09:45:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513C289F4F;
	Thu, 14 Jan 2021 08:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350A889F4F
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 08:45:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B7370ABD6;
 Thu, 14 Jan 2021 08:45:34 +0000 (UTC)
Subject: Re: [PATCH] drm: Include <linux/mem_encrypt.h> in drm_cache.c
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
References: <20210114080535.17132-1-tzimmermann@suse.de>
 <52cbf649-8c19-d4e8-152b-cd0946e1aba8@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <e0e35bac-0094-1e38-a853-cbf2f9d9d301@suse.de>
Date: Thu, 14 Jan 2021 09:45:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <52cbf649-8c19-d4e8-152b-cd0946e1aba8@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, kernel test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1208610013=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1208610013==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TOiq0gwrLRq3H6Y4CbJLYCaDUnl3mCecO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TOiq0gwrLRq3H6Y4CbJLYCaDUnl3mCecO
Content-Type: multipart/mixed; boundary="l4gYzn6OEcFmkBw53CR3c0xCSctxlObjP";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, kernel test robot
 <lkp@intel.com>, dri-devel@lists.freedesktop.org
Message-ID: <e0e35bac-0094-1e38-a853-cbf2f9d9d301@suse.de>
Subject: Re: [PATCH] drm: Include <linux/mem_encrypt.h> in drm_cache.c
References: <20210114080535.17132-1-tzimmermann@suse.de>
 <52cbf649-8c19-d4e8-152b-cd0946e1aba8@amd.com>
In-Reply-To: <52cbf649-8c19-d4e8-152b-cd0946e1aba8@amd.com>

--l4gYzn6OEcFmkBw53CR3c0xCSctxlObjP
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 14.01.21 um 09:23 schrieb Christian K=C3=B6nig:
> Am 14.01.21 um 09:05 schrieb Thomas Zimmermann:
>> The function drm_need_swiotbl() needs mem_encrypt_active() from
>> <linux/mem_encrypt.h>. The include got lost when refactoring the
>> code recently.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Fixes: 3abc66706385 ("drm: Implement drm_need_swiotlb() in drm_cache.c=
")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: dri-devel@lists.freedesktop.org
>=20
> You are typing faster than me :)
>=20
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Pushed to -misc-next. Thanks for the fast reply.

Best regards
Thomas

>=20
>> ---
>> =C2=A0 drivers/gpu/drm/drm_cache.c | 1 +
>> =C2=A0 1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c=

>> index 49551a7fa22f..79a50ef1250f 100644
>> --- a/drivers/gpu/drm/drm_cache.c
>> +++ b/drivers/gpu/drm/drm_cache.c
>> @@ -30,6 +30,7 @@
>> =C2=A0 #include <linux/export.h>
>> =C2=A0 #include <linux/highmem.h>
>> +#include <linux/mem_encrypt.h>
>> =C2=A0 #include <xen/xen.h>
>> =C2=A0 #include <drm/drm_cache.h>
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--l4gYzn6OEcFmkBw53CR3c0xCSctxlObjP--

--TOiq0gwrLRq3H6Y4CbJLYCaDUnl3mCecO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAABK0FAwAAAAAACgkQlh/E3EQov+BS
jRAApB9X9J9KPDYU9zQRPP5GdUSRs+K4y41z4Lxuv9Hpu2rn7RfNDZwHEyQBc3pnliwSSygvGgg1
CTizcxwxIyt73wwR9ZFB09/mce9pJJQt6CrP0ATdu4BQs60RBJnYZ24Iw4uQcN2v5C+yFbU1HX2t
dz87g+jJlEOqhGc0ShCEIUPDRdDwpl/N2W99GREG+CX2frHhd+2Cx+/XUjudd/b1oGs539ozY5JC
exUFVnuBR9W7GC/ip0kXS0TAHnsMCSjsrDdl20N3yz1pdfsoHTslNdOk3GCHIqC7hts6B/AOj4XQ
CPPsQUui/l+xUcSxn/sBVMPyQNh2G1mKlZGpHMLu6GQxjTp+W2FjCz3cqC9gLBCn/fAU4WggG8kK
p1neOZ9QPHtQ+Kl9jaeJGaeLzCNHS5nW/iwj1aq/x1/4GkLooP6RC3y+2cT3tx/y7AcwQ3PK98Qy
mx5JlpCyPzEug3urY2k5dWDhuvdxcFZU3exwqKGy7/g7IJa883dJxL8JKQCSxnfxBmYQwdnTdURy
8irOBT4abh+ECC+cWPG6gRXhSzdoZpBwKVzaxp8NQFD0RA0hR+8UiS9mGclvHM/pwyRG5cRsjV4W
L6lG52xmMN55XJTTqKYryVKJr6u68OEUuNE5ZdaaWP29FIItIMtpHrG4XKIxOrsPsjcgHl9+MbRR
DfA=
=LS2B
-----END PGP SIGNATURE-----

--TOiq0gwrLRq3H6Y4CbJLYCaDUnl3mCecO--

--===============1208610013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1208610013==--
