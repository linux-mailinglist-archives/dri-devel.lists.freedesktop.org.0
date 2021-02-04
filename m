Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F85530FC35
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 20:07:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3327489D30;
	Thu,  4 Feb 2021 19:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9052589D30;
 Thu,  4 Feb 2021 19:06:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 255D8AC45;
 Thu,  4 Feb 2021 19:06:55 +0000 (UTC)
To: Tong Zhang <ztong0001@gmail.com>
References: <20210204145712.1531203-1-kraxel@redhat.com>
 <20210204145712.1531203-3-kraxel@redhat.com>
 <d217112e-e49d-bd1f-0c39-3eac2dd721fd@suse.de>
 <60B8023C-78C9-441D-AA21-A13C4445F666@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v6 02/10] Revert "drm/qxl: do not run release if qxl
 failed to init"
Message-ID: <3feaeb62-fd50-5cca-26f7-42f6167ef77a@suse.de>
Date: Thu, 4 Feb 2021 20:06:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <60B8023C-78C9-441D-AA21-A13C4445F666@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Dave Airlie <airlied@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1140623342=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1140623342==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="sugShVuXIKVOGqdiIRIR03GxisZfIG58Q"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sugShVuXIKVOGqdiIRIR03GxisZfIG58Q
Content-Type: multipart/mixed; boundary="qbjhu3JTxQsoO1DR3tZmYIYIeQBYPtQYO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tong Zhang <ztong0001@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Message-ID: <3feaeb62-fd50-5cca-26f7-42f6167ef77a@suse.de>
Subject: Re: [PATCH v6 02/10] Revert "drm/qxl: do not run release if qxl
 failed to init"
References: <20210204145712.1531203-1-kraxel@redhat.com>
 <20210204145712.1531203-3-kraxel@redhat.com>
 <d217112e-e49d-bd1f-0c39-3eac2dd721fd@suse.de>
 <60B8023C-78C9-441D-AA21-A13C4445F666@gmail.com>
In-Reply-To: <60B8023C-78C9-441D-AA21-A13C4445F666@gmail.com>

--qbjhu3JTxQsoO1DR3tZmYIYIeQBYPtQYO
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Tong

Am 04.02.21 um 19:52 schrieb Tong Zhang:
> Hi Thomas,
>=20
> The original problem was qxl_device_init() can fail,
> when it fails there is no need to call
> 	qxl_modeset_fini(qdev);
> 	qxl_device_fini(qdev);
> But those two functions are otherwise called in the qxl_drm_release() -=


OK, makes sense. Thanks for the explanation.

>=20
> I have posted an updated patch.
> The new patch use the following logic
>=20
> +	if (!qdev->ddev.mode_config.funcs)
> +	  return;

This is again just papering over the issue. Better don't call=20
qxl_drm_release() in the error path if qxl_device_init() fails.

I see two solutions: either roll-back manually, or use our new managed=20
DRM interfaces. This is what the other drivers do.

Best regards
Thomas

> 	qxl_modeset_fini(qdev);
> 	qxl_device_fini(qdev);
>=20
> Thanks,
> - Tong
>=20
>=20
>> On Feb 4, 2021, at 1:34 PM, Thomas Zimmermann <tzimmermann@suse.de> wr=
ote:
>>
>> Hi
>>
>> Am 04.02.21 um 15:57 schrieb Gerd Hoffmann:
>>> This reverts commit b91907a6241193465ca92e357adf16822242296d.
>>
>> This should be in the correct format, as given by 'dim cite'.
>>
>> dim cite b91907a6241193465ca92e357adf16822242296d
>> b91907a62411 ("drm/qxl: do not run release if qxl failed to init")
>>
>>> Patch is broken, it effectively makes qxl_drm_release() a nop
>>> because on normal driver shutdown qxl_drm_release() is called
>>> *after* drm_dev_unregister().
>>> Cc: Tong Zhang <ztong0001@gmail.com>
>>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>>> ---
>>>   drivers/gpu/drm/qxl/qxl_drv.c | 2 --
>>>   1 file changed, 2 deletions(-)
>>> diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_=
drv.c
>>> index 34c8b25b5780..fb5f6a5e81d7 100644
>>> --- a/drivers/gpu/drm/qxl/qxl_drv.c
>>> +++ b/drivers/gpu/drm/qxl/qxl_drv.c
>>> @@ -144,8 +144,6 @@ static void qxl_drm_release(struct drm_device *de=
v)
>>>   	 * reodering qxl_modeset_fini() + qxl_device_fini() calls is
>>>   	 * non-trivial though.
>>>   	 */
>>> -	if (!dev->registered)
>>> -		return;
>>
>> I'm not sure what the original problem was, but I'm sure that this isn=
't the fix for it. If there's a problem with shutdown, the operations rat=
her have to be reordered correctly.
>>
>> With the citation style address:
>>
>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>>>   	qxl_modeset_fini(qdev);
>>>   	qxl_device_fini(qdev);
>>>   }
>>
>> --=20
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--qbjhu3JTxQsoO1DR3tZmYIYIeQBYPtQYO--

--sugShVuXIKVOGqdiIRIR03GxisZfIG58Q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAcRc0FAwAAAAAACgkQlh/E3EQov+Cv
zBAAt+AajrDpzr+ENbzKQ1EFljU7ebL45uSdlooyn8Q2PenAq6PffmdqW/MdbTZ+9bUsUb33Z6xi
tZVdCEnp41Hi9FdcIwnfM+oSck5Gi6QTJxLd7GH0rtTGXvz83xngZZzlxAVYEpstLozEDgqucuQ4
2aLUPeZx3E/A2OSBK1gVg3Yyqm78IlNLeMzfjgodJbABBBVdND2FF7MT4fsFxfsLWi4RrdCyJ6+d
LHXLXxnqYrjfZ2mfmmKJZUEV5AGo/nNJ0D+LIe9x1pTu37UtQpcgXUeeyECD+zrVdMjOpMfJgvS2
G4mVNWOa3UzJAeZ4YBGK/YTpknYa8l8eGXNGdeqSt96OYTWb/XgkFfMfMJKXl9ArkpjI5D9MlvM6
xWqZFGvaG1lExlIbCuyffjYp+sHJyRpN6jCiWdEcakrZHwoZM+gc9SIt2EeN1BTVKXkoKznoERX5
ddxXZAKLorqs7qHE4rfJ/pEOP5SiqOcgP2bBvfQRQ9mBiIY2bVJVpQxFSgc/wE7FGNrmUIWwk+UU
QB31SHD9BMSUbvnndgjqnoIlAKjNWpmbIf5k/d7aE43Z99EeGNlQIG2FomQLiEoMRIBTCDmuzVnX
Epcd0EgdSwab7aLjhnzN1d8DRn7vESe/u67wBDAeqt6zEZUDp5PTjOZOA5zkEcGmDycBte6is1Y8
G64=
=bdv9
-----END PGP SIGNATURE-----

--sugShVuXIKVOGqdiIRIR03GxisZfIG58Q--

--===============1140623342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1140623342==--
