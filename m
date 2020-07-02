Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A335212592
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 16:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863826E037;
	Thu,  2 Jul 2020 14:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19DD6E037
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 14:07:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B7A64ADAA;
 Thu,  2 Jul 2020 14:07:29 +0000 (UTC)
Subject: Re: [PATCH] drm/hisilicon: Use drmm_kzalloc() instead of
 devm_kzalloc()
To: Tian Tao <tiantao6@hisilicon.com>, puck.chen@hisilicon.com,
 airlied@linux.ie, kraxel@redhat.com, alexander.deucher@amd.com,
 tglx@linutronix.de, dri-devel@lists.freedesktop.org,
 xinliang.liu@linaro.org, linux-kernel@vger.kernel.org, inuxarm@huawei.com
References: <1593652914-19639-1-git-send-email-tiantao6@hisilicon.com>
 <20200702131617.GY3278063@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <ae16cab6-1cb9-b7c2-81b6-eb81bf77bfb7@suse.de>
Date: Thu, 2 Jul 2020 16:07:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200702131617.GY3278063@phenom.ffwll.local>
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
Content-Type: multipart/mixed; boundary="===============0242938297=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0242938297==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IQNS5Lgj5hD7NbGynnevIaPaxKrc2MxkO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IQNS5Lgj5hD7NbGynnevIaPaxKrc2MxkO
Content-Type: multipart/mixed; boundary="c4VxCKalZJooM6U7Zw6IO46gjXHN6CXHI";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, puck.chen@hisilicon.com,
 airlied@linux.ie, kraxel@redhat.com, alexander.deucher@amd.com,
 tglx@linutronix.de, dri-devel@lists.freedesktop.org,
 xinliang.liu@linaro.org, linux-kernel@vger.kernel.org, inuxarm@huawei.com
Message-ID: <ae16cab6-1cb9-b7c2-81b6-eb81bf77bfb7@suse.de>
Subject: Re: [PATCH] drm/hisilicon: Use drmm_kzalloc() instead of
 devm_kzalloc()
References: <1593652914-19639-1-git-send-email-tiantao6@hisilicon.com>
 <20200702131617.GY3278063@phenom.ffwll.local>
In-Reply-To: <20200702131617.GY3278063@phenom.ffwll.local>

--c4VxCKalZJooM6U7Zw6IO46gjXHN6CXHI
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Daniel

Am 02.07.20 um 15:16 schrieb Daniel Vetter:
> On Thu, Jul 02, 2020 at 09:21:54AM +0800, Tian Tao wrote:
>> using the new API drmm_kzalloc() instead of devm_kzalloc()
>>
>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>> ---
>>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers=
/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>> index a6fd0c2..2f20704 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>> @@ -23,6 +23,7 @@
>>  #include <drm/drm_print.h>
>>  #include <drm/drm_probe_helper.h>
>>  #include <drm/drm_vblank.h>
>> +#include <drm/drm_managed.h>
>> =20
>>  #include "hibmc_drm_drv.h"
>>  #include "hibmc_drm_regs.h"
>> @@ -267,7 +268,7 @@ static int hibmc_load(struct drm_device *dev)
>>  	struct hibmc_drm_private *priv;
>>  	int ret;
>> =20
>> -	priv =3D devm_kzalloc(dev->dev, sizeof(*priv), GFP_KERNEL);
>> +	priv =3D drmm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>=20
> Hm would be nice if hisilicon could entirely switch over to embedding, =
and
> stop using the driver private pointer. Quite a bit more work though. As=
-is
> this change here isn't really brining you closer to that, pretty much a=
ll
> the lifetime bugs around hotunload are still there.

Well, it's a first step. The follow-up patch for embedding connector and
encoder removes more instances of devm_kzalloc().

Although I have to say, I'd rather review a longer patch series that
fully addresses the problem, instead the current one-by-one approach.

Best regards
Thomas

> -Daniel
>=20
>>  	if (!priv) {
>>  		DRM_ERROR("no memory to allocate for hibmc_drm_private\n");
>>  		return -ENOMEM;
>> --=20
>> 2.7.4
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--c4VxCKalZJooM6U7Zw6IO46gjXHN6CXHI--

--IQNS5Lgj5hD7NbGynnevIaPaxKrc2MxkO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl796h0UHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiMxgAf/Y6N6+WPdzEC1+R9KNYFQVb9OQUxO
26E4t+xaXRsT3YHdjP3N6T2J+NA94IWoJqqCemYpIXc3j7gamS/D0YEcfeNRQqkw
hzZjcqENDitaOrbJhn4SQBQc774xfu5TrfZpiz3HP4yIapJNS9HL6bmbUtnGbQqK
cuC+eYoftScnvsXJr6y6H/EIVwIW3tpcQTlOtzn3oHiYZUrid2tnN66bL/5ud3+T
fhHkwKJjLzsssPdooToPOg7zJmcYYOOAg9eJHzdalZqzMOcKzW9TK/kZYsvUJHky
XG1tgQtBL4ytdAPC3Bqo49MA/08b/ztACv5PJj/syQDjJlwCpmxnefrQtw==
=NxIC
-----END PGP SIGNATURE-----

--IQNS5Lgj5hD7NbGynnevIaPaxKrc2MxkO--

--===============0242938297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0242938297==--
