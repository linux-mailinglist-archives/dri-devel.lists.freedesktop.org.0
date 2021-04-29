Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9FE36F02D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 21:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81456F494;
	Thu, 29 Apr 2021 19:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B102F6F494;
 Thu, 29 Apr 2021 19:22:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 13299B21C;
 Thu, 29 Apr 2021 19:22:29 +0000 (UTC)
Subject: Re: [PATCH v8 1/5] drm/ast: Remove reference to struct drm_device.pdev
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>
References: <20210429105101.25667-1-tzimmermann@suse.de>
 <20210429105101.25667-2-tzimmermann@suse.de>
 <8f601e6a07dc4fa4aa46577cfcd9c317@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <87569f49-224e-47ee-27dd-e4ab17eb1e2f@suse.de>
Date: Thu, 29 Apr 2021 21:22:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <8f601e6a07dc4fa4aa46577cfcd9c317@intel.com>
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
Cc: Dave Airlie <airlied@redhat.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 lkp <lkp@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1786772059=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1786772059==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UlJjLPqDYM8awof3QFFO6ShJmI3xiJGdr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UlJjLPqDYM8awof3QFFO6ShJmI3xiJGdr
Content-Type: multipart/mixed; boundary="NEwJFD5pPmOBT4klsMkxVZ0X5ZX1NTux8";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>
Cc: lkp <lkp@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Message-ID: <87569f49-224e-47ee-27dd-e4ab17eb1e2f@suse.de>
Subject: Re: [PATCH v8 1/5] drm/ast: Remove reference to struct
 drm_device.pdev
References: <20210429105101.25667-1-tzimmermann@suse.de>
 <20210429105101.25667-2-tzimmermann@suse.de>
 <8f601e6a07dc4fa4aa46577cfcd9c317@intel.com>
In-Reply-To: <8f601e6a07dc4fa4aa46577cfcd9c317@intel.com>

--NEwJFD5pPmOBT4klsMkxVZ0X5ZX1NTux8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 29.04.21 um 18:04 schrieb Ruhl, Michael J:
>=20
>=20
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of=

>> Thomas Zimmermann
>> Sent: Thursday, April 29, 2021 6:51 AM
>> To: jani.nikula@linux.intel.com; joonas.lahtinen@linux.intel.com; Vivi=
, Rodrigo
>> <rodrigo.vivi@intel.com>; airlied@linux.ie; daniel@ffwll.ch; chris@chr=
is-
>> wilson.co.uk
>> Cc: lkp <lkp@intel.com>; intel-gfx@lists.freedesktop.org; dri-
>> devel@lists.freedesktop.org; Thomas Zimmermann
>> <tzimmermann@suse.de>; Dave Airlie <airlied@redhat.com>
>> Subject: [PATCH v8 1/5] drm/ast: Remove reference to struct
>> drm_device.pdev
>>
>> Using struct drm_device.pdev is deprecated. Upcast with to_pci_dev()
>>from struct drm_device.dev to get the PCI device structure.
>=20
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Awesome! Thanks a lot for the timely response. I pushed everything into=20
drm-misc-next before the bitrot sets in again.

Best regards
Thomas

>=20
> m
>=20
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Fixes: ba4e0339a6a3 ("drm/ast: Fixed CVE for DP501")
>> Cc: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
>> Cc: kernel test robot <lkp@intel.com>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Dave Airlie <airlied@redhat.com>
>> Cc: dri-devel@lists.freedesktop.org
>> ---
>> drivers/gpu/drm/ast/ast_main.c | 1 -
>> 1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_main.c
>> b/drivers/gpu/drm/ast/ast_main.c
>> index 189d783f6e2c..6b49a92dc75f 100644
>> --- a/drivers/gpu/drm/ast/ast_main.c
>> +++ b/drivers/gpu/drm/ast/ast_main.c
>> @@ -411,7 +411,6 @@ struct ast_private *ast_device_create(const struct=

>> drm_driver *drv,
>> 		return ast;
>> 	dev =3D &ast->base;
>>
>> -	dev->pdev =3D pdev;
>> 	pci_set_drvdata(pdev, dev);
>>
>> 	ast->regs =3D pcim_iomap(pdev, 1, 0);
>> --
>> 2.31.1
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--NEwJFD5pPmOBT4klsMkxVZ0X5ZX1NTux8--

--UlJjLPqDYM8awof3QFFO6ShJmI3xiJGdr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCLB3MFAwAAAAAACgkQlh/E3EQov+Ap
og//T27Dl2dTtLyBjNUmqlA0tSJM//yKDMkC9GaYBtEHu5FUOvrDJ9xor0ZWCewBX4HjgN5odXk/
Jd5XQwWgGMDttp/X/CCOEyGDxnxqm/HJA7q10abKxjW98cmKz+rOjy4/0EIM8ozDhzWuYv4L3iVt
n1z71Vs7YtjYrHxzNo3rYjY6ycuDIKu+IYUcZR4hdbYP1iDg0wKHQBzgooViZWjK6CePMjCqWmm3
Cy8EK7pCxrPz2cx3UOpX7XbwpIlfPJlDgzUeIYJ4Zz0byLwV402oLa4P5o70yNtg4jV58+ACetXq
kV2FSK6p23KSh10egxAXSt9a8u6HC/h0SiR6iaiIOx8BW5moAOoD0zidA0d+/P2bG6VlmwEKwPtw
NmmlGNGG86pGwFWto1CkCsF7aIk/LL9hZ0IXb03TSvi6YKgES0zXtVvbKZQe0V9odm96NejVN3bO
DwQW37P9twiV/mRQj9Vq32e+8PHnXlo+I+x6Mltwfu/RZeDgcLZmEDsixJsY0L71P99+yZfFM/X4
BkTcTYAWVuHKYiWwjK53XUCp6WdnwR9aCzaIGqSxFL23GW3dzRM3y1FszbCpY7uUUDJXjIe/j34W
bhCOVj5TionEQjotLCuoBaC20BOeZSSsm5zOiwYQjUUx6jx/Fp+UGZ3OwWSYzyVZT3povtF5iE+7
XNs=
=cNA9
-----END PGP SIGNATURE-----

--UlJjLPqDYM8awof3QFFO6ShJmI3xiJGdr--

--===============1786772059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1786772059==--
