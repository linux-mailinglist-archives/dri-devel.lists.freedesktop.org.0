Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E5E27A9EC
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 10:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B976E409;
	Mon, 28 Sep 2020 08:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43F56E409
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 08:48:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5793AB295;
 Mon, 28 Sep 2020 08:48:33 +0000 (UTC)
Subject: Re: [PATCH] drm/rockchip: Include <drm/drm_gem_cma_helper> for
 drm_gem_cm_vm_ops
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200928081643.8575-1-tzimmermann@suse.de>
 <20200928084019.GA625010@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <7e928cd3-d185-065d-40de-1541b08d2ec4@suse.de>
Date: Mon, 28 Sep 2020 10:48:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200928084019.GA625010@ravnborg.org>
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
Cc: kernel test robot <lkp@intel.com>, airlied@linux.ie,
 Daniel Vetter <daniel.vetter@ffwll.ch>, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 christian.koenig@amd.com, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0226558006=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0226558006==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="EircRPPndu5aQfYtI8jvR1Ocn3eSs9CSN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EircRPPndu5aQfYtI8jvR1Ocn3eSs9CSN
Content-Type: multipart/mixed; boundary="Rl6PXXLecLjTnTXorlT1DNJKA3WNaD2aO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: hjc@rock-chips.com, heiko@sntech.de, airlied@linux.ie, daniel@ffwll.ch,
 christian.koenig@amd.com, kernel test robot <lkp@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Message-ID: <7e928cd3-d185-065d-40de-1541b08d2ec4@suse.de>
Subject: Re: [PATCH] drm/rockchip: Include <drm/drm_gem_cma_helper> for
 drm_gem_cm_vm_ops
References: <20200928081643.8575-1-tzimmermann@suse.de>
 <20200928084019.GA625010@ravnborg.org>
In-Reply-To: <20200928084019.GA625010@ravnborg.org>

--Rl6PXXLecLjTnTXorlT1DNJKA3WNaD2aO
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 28.09.20 um 10:40 schrieb Sam Ravnborg:
> Hi Thomas.
> On Mon, Sep 28, 2020 at 10:16:43AM +0200, Thomas Zimmermann wrote:
>> Include <drm/drm_gem_cma_helper.h> to get drm_gem_cma_vm_ops. Fallout
>> from the recent conversion to GEM object functions.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Fixes: 0d590af3140d ("drm/rockchip: Convert to drm_gem_object_funcs")
>=20
> As this has only hit drm-misc-next and not pushed anywhere else there i=
s
> really no need for the Fixes: tag. At least thats my understanding.

I'm not sure what the upstream requirements are. As part of my dayjob, I
maintain drivers for Suse distributions. If we pick the original patch,
we also want the fixes. We have scripts that look for these Fixes tags
to find the fixes. So it's helpful.

>=20
> Otherwise the patch is equal to what I posted in the weekend so:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Thanks

Best regards
Thomas

>=20
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>> Cc: Sandy Huang <hjc@rock-chips.com>
>> Cc: "Heiko St=C3=BCbner" <heiko@sntech.de>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-rockchip@lists.infradead.org
>> ---
>>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu=
/drm/rockchip/rockchip_drm_gem.c
>> index 1cf4631461c9..7d5ebb10323b 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
>> @@ -10,6 +10,7 @@
>> =20
>>  #include <drm/drm.h>
>>  #include <drm/drm_gem.h>
>> +#include <drm/drm_gem_cma_helper.h>
>>  #include <drm/drm_prime.h>
>>  #include <drm/drm_vma_manager.h>
>> =20
>> --=20
>> 2.28.0
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


--Rl6PXXLecLjTnTXorlT1DNJKA3WNaD2aO--

--EircRPPndu5aQfYtI8jvR1Ocn3eSs9CSN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9xo18UHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiMaQQf/WSSvGQ2C62ake0lnnvQo3S3Io+WN
53Nzj/HQZ7QM1KjAPofEQu//jfD/Ut2q9LsWzRAduaGhwgmWKfDJ2fmho51hTRGf
7pPC0e+uq4xt9e+z97x4TuNr2Jaz4EP2t7GZzLW0MkaFlRH/8dBD0ROs3isIWxv/
oo6KcKmECFjgSpERUMoSwSN4v2YHtObOGRfd83EsFiY/PncZzW7I4EW8xyagI5iC
PV+QOXKi0s8NLymzErzjV6ytkgpy+1vSWzo9h2SauLCit6KsNf9+qUdUyYH2C9fP
vyQLqrp4mr9SUkDDJQ+EPOuEGTzm1yk6EJKsj9JKVTU1qleMBE9FGGeKJQ==
=6PQO
-----END PGP SIGNATURE-----

--EircRPPndu5aQfYtI8jvR1Ocn3eSs9CSN--

--===============0226558006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0226558006==--
