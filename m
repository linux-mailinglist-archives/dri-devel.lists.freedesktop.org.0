Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69471305D18
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 14:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA4E89CB3;
	Wed, 27 Jan 2021 13:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FC489C96;
 Wed, 27 Jan 2021 13:27:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7B5DBAF90;
 Wed, 27 Jan 2021 13:27:36 +0000 (UTC)
Subject: Re: [PATCH v5 1/5] drm/i915: Remove references to struct
 drm_device.pdev
To: Chris Wilson <chris@chris-wilson.co.uk>, airlied@linux.ie,
 daniel@ffwll.ch, jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com
References: <20210127124135.11750-1-tzimmermann@suse.de>
 <20210127124135.11750-2-tzimmermann@suse.de>
 <161175197533.2943.2162038120755672032@build.alporthouse.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <f2d5376c-bb69-6abc-8a17-cd9adb7c8be8@suse.de>
Date: Wed, 27 Jan 2021 14:27:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <161175197533.2943.2162038120755672032@build.alporthouse.com>
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: multipart/mixed; boundary="===============1988766698=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1988766698==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dphm0mSbMyJh1jZnXXoLmaUAkBZ7m7uir"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dphm0mSbMyJh1jZnXXoLmaUAkBZ7m7uir
Content-Type: multipart/mixed; boundary="9D5OEpSgOwqLweuuKvOstoHTCa7hdyret";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Chris Wilson <chris@chris-wilson.co.uk>, airlied@linux.ie,
 daniel@ffwll.ch, jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <f2d5376c-bb69-6abc-8a17-cd9adb7c8be8@suse.de>
Subject: Re: [PATCH v5 1/5] drm/i915: Remove references to struct
 drm_device.pdev
References: <20210127124135.11750-1-tzimmermann@suse.de>
 <20210127124135.11750-2-tzimmermann@suse.de>
 <161175197533.2943.2162038120755672032@build.alporthouse.com>
In-Reply-To: <161175197533.2943.2162038120755672032@build.alporthouse.com>

--9D5OEpSgOwqLweuuKvOstoHTCa7hdyret
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 27.01.21 um 13:52 schrieb Chris Wilson:
> Quoting Thomas Zimmermann (2021-01-27 12:41:31)
>> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/driver=
s/gpu/drm/i915/selftests/mock_gem_device.c
>> index 0188f877cab2..2a07a008de2e 100644
>> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>> @@ -146,7 +146,6 @@ struct drm_i915_private *mock_gem_device(void)
>>          }
>>  =20
>>          pci_set_drvdata(pdev, i915);
>> -       i915->drm.pdev =3D pdev;
>=20
> Strictly this removal is still too early. Though it's a mock device and=

> we shouldn't be touching the pci_dev that often, semantically those
> accesses are not removed until later.

I just didn't notice this instance. I'll add it to the other patch. Sorry=
=2E

Best regards
Thomas

>=20
>>  =20
>>          dev_pm_domain_set(&pdev->dev, &pm_domain);
>>          pm_runtime_enable(&pdev->dev);
>> diff --git a/drivers/gpu/drm/i915/selftests/mock_gtt.c b/drivers/gpu/d=
rm/i915/selftests/mock_gtt.c
>> index 7270fc8ca801..5c7ae40bba63 100644
>> --- a/drivers/gpu/drm/i915/selftests/mock_gtt.c
>> +++ b/drivers/gpu/drm/i915/selftests/mock_gtt.c
>> @@ -74,7 +74,7 @@ struct i915_ppgtt *mock_ppgtt(struct drm_i915_privat=
e *i915, const char *name)
>>          ppgtt->vm.i915 =3D i915;
>>          ppgtt->vm.total =3D round_down(U64_MAX, PAGE_SIZE);
>>          ppgtt->vm.file =3D ERR_PTR(-ENODEV);
>> -       ppgtt->vm.dma =3D &i915->drm.pdev->dev;
>> +       ppgtt->vm.dma =3D i915->drm.dev;
>=20
> We can remove this shorthand later.
> -Chris
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


--9D5OEpSgOwqLweuuKvOstoHTCa7hdyret--

--dphm0mSbMyJh1jZnXXoLmaUAkBZ7m7uir
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmARakcFAwAAAAAACgkQlh/E3EQov+Dq
7Q//df1cLwytrgwIYo2uxnCGh0mVPMrE/l84WkXvPd0ye8ctoIOJnX+rYo4P8yKW34NuLzRQ9QXO
QRfMywyk5yMzrcm1B2h+KYEGv1IjGYQWDaeZR6/j50N/VaFVbmWCRjsfalZSOJG1d5KFLQWDqgA3
k7x/7uB0i21WG4Vp1Vb8OI44prEwjv1ODpvIfCcKd1vBob0JiUh+vrAulXwGbw4CKOzxfvCXfolV
u2rYegY4Y37RAmcye2IH+NER7slx3cXu9zZpBFPKajmPpUfJDGv7ptDJgMv3Ya6v2Hv+GZaHhpA+
61ASl+WZLTmI512sEih1d5gKykEej8F+uD5ZU6lU0uL0EU3IsILmtLR1ODp1iThAdENeTi17EInb
528xkSJ7stUg8MHbnW5K2ybk6bdmvs8AI09vXsA+NwJ9mYcVlaK78NuswKkY1+c8AZwZ2XcDIyee
icRaX4wE0v+ZCu621kNR60SnrSF3++KHsJFqMiz1H9CTlI6wC9uCBgNQLkPlea8vt4kNDHOA803F
oR6gUltmIbco9RWLM7wH5KgxOYn1c1RkIG8oPIWDkg3Z4dEw9CwOiriJO3oPXnp1+3db6I1vMf5T
kWt4g15Dr8vBgBIl96Yb+DInm6baZD1kwgBvbzVL1FX/1kcFr60UzxKLw2qUlzJeguklZwpt9Xxq
kOs=
=mW6+
-----END PGP SIGNATURE-----

--dphm0mSbMyJh1jZnXXoLmaUAkBZ7m7uir--

--===============1988766698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1988766698==--
