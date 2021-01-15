Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5905A2F74E9
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 10:10:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D6E89E7B;
	Fri, 15 Jan 2021 09:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142228919E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 09:09:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A16F0AA6F;
 Fri, 15 Jan 2021 09:09:53 +0000 (UTC)
Subject: Re: [PATCH] drm/hisilicon/hibmc: Remove hibmc_ttm.c
To: "tiantao (H)" <tiantao6@huawei.com>, tiantao6@hisilicon.com
References: <20210113113107.12005-1-tzimmermann@suse.de>
 <7c5611ac-772e-6529-6072-e192d05c916d@suse.de>
 <9f3b2b83-5d8f-106b-1e5f-a799f0805c3e@huawei.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <4d07a90f-1389-2ed4-bb22-b9d792bb4c33@suse.de>
Date: Fri, 15 Jan 2021 10:09:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <9f3b2b83-5d8f-106b-1e5f-a799f0805c3e@huawei.com>
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Chen Feng <puck.chen@hisilicon.com>,
 dri-devel@lists.freedesktop.org, Gong junjie <gongjunjie2@huawei.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============0124557851=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0124557851==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="37E9fe0NuiYw6cxYHSlcx6OKa4vzKpN9h"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--37E9fe0NuiYw6cxYHSlcx6OKa4vzKpN9h
Content-Type: multipart/mixed; boundary="sBc5NX4B4OnPrFNKUrqRQDyUqZuzpDqp1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "tiantao (H)" <tiantao6@huawei.com>, tiantao6@hisilicon.com
Cc: dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 Xinliang Liu <xinliang.liu@linaro.org>, John Stultz
 <john.stultz@linaro.org>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Chen Feng <puck.chen@hisilicon.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Gong junjie <gongjunjie2@huawei.com>
Message-ID: <4d07a90f-1389-2ed4-bb22-b9d792bb4c33@suse.de>
Subject: Re: [PATCH] drm/hisilicon/hibmc: Remove hibmc_ttm.c
References: <20210113113107.12005-1-tzimmermann@suse.de>
 <7c5611ac-772e-6529-6072-e192d05c916d@suse.de>
 <9f3b2b83-5d8f-106b-1e5f-a799f0805c3e@huawei.com>
In-Reply-To: <9f3b2b83-5d8f-106b-1e5f-a799f0805c3e@huawei.com>

--sBc5NX4B4OnPrFNKUrqRQDyUqZuzpDqp1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.01.21 um 09:50 schrieb tiantao (H):
>=20
> =E5=9C=A8 2021/1/15 16:42, Thomas Zimmermann =E5=86=99=E9=81=93:
>> ping for review
>>
>> Am 13.01.21 um 12:31 schrieb Thomas Zimmermann:
>>> The file is not in use. It got re-added by a rebased patch. Removing
>>> it.
>>>
> Reviewed-by Tian Tao <tiantao6@hisilicon.com>

Thanks a lot. Pushed to -misc-next.

Best regards
Thomas

>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Fixes: 4d4dad21cc7b ("drm/hibmc: Remove references to struct=20
>>> drm_device.pdev")
>>> Reported-by: Tian Tao <tiantao6@hisilicon.com>
>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>> Cc: Xinliang Liu <xinliang.liu@linaro.org>
>>> Cc: Tian Tao=C2=A0 <tiantao6@hisilicon.com>
>>> Cc: John Stultz <john.stultz@linaro.org>
>>> Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
>>> Cc: Chen Feng <puck.chen@hisilicon.com>
>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Cc: Gong junjie <gongjunjie2@huawei.com>
>>> ---
>>> =C2=A0 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c | 61 -------------=
--------
>>> =C2=A0 1 file changed, 61 deletions(-)
>>> =C2=A0 delete mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c=

>>>
>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c=20
>>> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
>>> deleted file mode 100644
>>> index 77f075075db2..000000000000
>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
>>> +++ /dev/null
>>> @@ -1,61 +0,0 @@
>>> -// SPDX-License-Identifier: GPL-2.0-or-later
>>> -/* Hisilicon Hibmc SoC drm driver
>>> - *
>>> - * Based on the bochs drm driver.
>>> - *
>>> - * Copyright (c) 2016 Huawei Limited.
>>> - *
>>> - * Author:
>>> - *=C2=A0=C2=A0=C2=A0 Rongrong Zou <zourongrong@huawei.com>
>>> - *=C2=A0=C2=A0=C2=A0 Rongrong Zou <zourongrong@gmail.com>
>>> - *=C2=A0=C2=A0=C2=A0 Jianhua Li <lijianhua@huawei.com>
>>> - */
>>> -
>>> -#include <linux/pci.h>
>>> -
>>> -#include <drm/drm_atomic_helper.h>
>>> -#include <drm/drm_gem.h>
>>> -#include <drm/drm_gem_framebuffer_helper.h>
>>> -#include <drm/drm_gem_vram_helper.h>
>>> -#include <drm/drm_print.h>
>>> -
>>> -#include "hibmc_drm_drv.h"
>>> -
>>> -int hibmc_mm_init(struct hibmc_drm_private *hibmc)
>>> -{
>>> -=C2=A0=C2=A0=C2=A0 struct drm_vram_mm *vmm;
>>> -=C2=A0=C2=A0=C2=A0 int ret;
>>> -=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D hibmc->dev;
>>> -=C2=A0=C2=A0=C2=A0 struct pci_dev *pdev =3D to_pci_dev(dev->dev);
>>> -
>>> -=C2=A0=C2=A0=C2=A0 vmm =3D drm_vram_helper_alloc_mm(dev, pci_resourc=
e_start(pdev, 0),
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hibmc->fb=
_size);
>>> -=C2=A0=C2=A0=C2=A0 if (IS_ERR(vmm)) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D PTR_ERR(vmm);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_err(dev, "Error initi=
alizing VRAM MM; %d\n", ret);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> -=C2=A0=C2=A0=C2=A0 }
>>> -
>>> -=C2=A0=C2=A0=C2=A0 return 0;
>>> -}
>>> -
>>> -void hibmc_mm_fini(struct hibmc_drm_private *hibmc)
>>> -{
>>> -=C2=A0=C2=A0=C2=A0 if (!hibmc->dev->vram_mm)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>> -
>>> -=C2=A0=C2=A0=C2=A0 drm_vram_helper_release_mm(hibmc->dev);
>>> -}
>>> -
>>> -int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,=

>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 struct drm_mode_create_dumb *args)
>>> -{
>>> -=C2=A0=C2=A0=C2=A0 return drm_gem_vram_fill_create_dumb(file, dev, 0=
, 128, args);
>>> -}
>>> -
>>> -const struct drm_mode_config_funcs hibmc_mode_funcs =3D {
>>> -=C2=A0=C2=A0=C2=A0 .mode_valid =3D drm_vram_helper_mode_valid,
>>> -=C2=A0=C2=A0=C2=A0 .atomic_check =3D drm_atomic_helper_check,
>>> -=C2=A0=C2=A0=C2=A0 .atomic_commit =3D drm_atomic_helper_commit,
>>> -=C2=A0=C2=A0=C2=A0 .fb_create =3D drm_gem_fb_create,
>>> -};
>>>
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--sBc5NX4B4OnPrFNKUrqRQDyUqZuzpDqp1--

--37E9fe0NuiYw6cxYHSlcx6OKa4vzKpN9h
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmABW98FAwAAAAAACgkQlh/E3EQov+D4
pA//WzWflDs+6yh1V/1DNGnU/O66O0ZdfMT3GlyvNUNe6fSwCzft9zc/+MST8FdHQdEr/BjVbPei
F1Wqk+UwKSuuEOtaaUUUqsr37tFm6FXMhqGFaDa9ZWy1FoW7Jgv5MCWn6lNkVPr6P7w6jsZnKlX3
boMkh1mUHxKCtwFL6TAIsuoaKqWwcV3nw8mXRhO35IuEolGNTklzx2Uw2caPWcLrO5Z4cj3VWkPg
FcaGNn0jK/nIpsFTghahFx8O+MyEkrGc7A1V5Ic0JdCcG0XLsKUD3faYN6vCcH4afdaCBH+I8Lrp
ALS+b7xpMWN+75II3BaM1AEuv0siC9UEIYkSsnSBjk1CDqbtA1X0rhF5hTfQVCS5gHjZnaQ+CPyV
eJMmmQLaIP0RUU2c1UfWI3QGyjHBNuXfCrW+xETbtAzsEmC69TAbcVa+7+8pCP9DTCqz5lyuFTCE
SRd8hcjXs/D23sMPRxJ2q1smOy+jryXsKocF7CFWwlnhTqbXiXWf38J76/dYg4fq5Md5ktNmGgP6
Wn++1ghGIaJ6pxNBE9GnyI7BFwCt8FcRg45sfSIIQ4hj8ECLeqgVvnnt30s51a6Ttg14oVcXUiRj
DGDl5Rf3zF7ihgEGPZGxB4t+PimhNLE0ls7FGX67TTYi7GtIPut9vsq6NBGLslpLyTykyc8m6HYh
SCM=
=hmH0
-----END PGP SIGNATURE-----

--37E9fe0NuiYw6cxYHSlcx6OKa4vzKpN9h--

--===============0124557851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0124557851==--
