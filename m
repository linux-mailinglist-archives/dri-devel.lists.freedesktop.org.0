Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D262F7547
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 10:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A1589E5F;
	Fri, 15 Jan 2021 09:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0352D89E5F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 09:28:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8F485B732;
 Fri, 15 Jan 2021 09:28:04 +0000 (UTC)
Subject: Re: [PATCH] drm: Set vm_ops to GEM object's values during mmap
To: kieran.bingham+renesas@ideasonboard.com, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20210115083938.21747-1-tzimmermann@suse.de>
 <ac1a64d7-d117-521b-ec7a-61116a3f0df0@ideasonboard.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <11206023-8595-6b68-5e74-d4b7edcc528e@suse.de>
Date: Fri, 15 Jan 2021 10:28:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <ac1a64d7-d117-521b-ec7a-61116a3f0df0@ideasonboard.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1734533552=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1734533552==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Kh1vec4IXbb3kVcSRWMCju6lb4o7n30xZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Kh1vec4IXbb3kVcSRWMCju6lb4o7n30xZ
Content-Type: multipart/mixed; boundary="woZYELypJFcdFV6NGkoxQ7j9AqNuGQbn7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kieran.bingham+renesas@ideasonboard.com, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <11206023-8595-6b68-5e74-d4b7edcc528e@suse.de>
Subject: Re: [PATCH] drm: Set vm_ops to GEM object's values during mmap
References: <20210115083938.21747-1-tzimmermann@suse.de>
 <ac1a64d7-d117-521b-ec7a-61116a3f0df0@ideasonboard.com>
In-Reply-To: <ac1a64d7-d117-521b-ec7a-61116a3f0df0@ideasonboard.com>

--woZYELypJFcdFV6NGkoxQ7j9AqNuGQbn7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.01.21 um 10:17 schrieb Kieran Bingham:
> Hi Thomas,
>=20
> On 15/01/2021 08:39, Thomas Zimmermann wrote:
>> The GEM mmap code relies on the GEM object's mmap callback to set the
>> VMA's vm_ops field. This is easily forgotten and lead to a memory leak=

>=20
>   s/lead/can lead/
>=20
>> in the CMA helpers. Instead set the vm_ops field in the DRM core code
>> to the GEM object's value. Drivers with different needs can override
>> this in their mmap callback.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Fixes: f5ca8eb6f9bd ("drm/cma-helper: Implement mmap as GEM CMA object=
 functions")
>> Reported-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>=20
> This also works here.
>   - https://paste.ubuntu.com/p/S2Q586rgwT/
>=20
> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Great! I have to send out another iteration of the patch, but I think=20
the change is such that I can keep the Tested-by.

Best regards
Thomas

>=20
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Eric Anholt <eric@anholt.net>
>> Cc: dri-devel@lists.freedesktop.org
>> ---
>>   drivers/gpu/drm/drm_gem.c   | 23 ++++++++++++-----------
>>   drivers/gpu/drm/drm_prime.c |  4 ++++
>>   2 files changed, 16 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index 34b2f111c01c..54d95621fcbb 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -1069,27 +1069,28 @@ int drm_gem_mmap_obj(struct drm_gem_object *ob=
j, unsigned long obj_size,
>>  =20
>>   	vma->vm_private_data =3D obj;
>>  =20
>> +	if (!obj->funcs->vm_ops) {
>> +		ret =3D -EINVAL;
>> +		goto err_drm_gem_object_put;
>> +	}
>> +	vma->vm_ops =3D obj->funcs->vm_ops;
>> +
>>   	if (obj->funcs->mmap) {
>>   		ret =3D obj->funcs->mmap(obj, vma);
>> -		if (ret) {
>> -			drm_gem_object_put(obj);
>> -			return ret;
>> -		}
>> +		if (ret)
>> +			goto err_drm_gem_object_put;
>>   		WARN_ON(!(vma->vm_flags & VM_DONTEXPAND));
>>   	} else {
>> -		if (obj->funcs->vm_ops)
>> -			vma->vm_ops =3D obj->funcs->vm_ops;
>> -		else {
>> -			drm_gem_object_put(obj);
>> -			return -EINVAL;
>> -		}
>> -
>>   		vma->vm_flags |=3D VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP=
;
>>   		vma->vm_page_prot =3D pgprot_writecombine(vm_get_page_prot(vma->vm=
_flags));
>>   		vma->vm_page_prot =3D pgprot_decrypted(vma->vm_page_prot);
>>   	}
>>  =20
>>   	return 0;
>> +
>> +err_drm_gem_object_put:
>> +	drm_gem_object_put(obj);
>> +	return ret;
>>   }
>>   EXPORT_SYMBOL(drm_gem_mmap_obj);
>>  =20
>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c=

>> index 683aa29ecd3b..0549ec190583 100644
>> --- a/drivers/gpu/drm/drm_prime.c
>> +++ b/drivers/gpu/drm/drm_prime.c
>> @@ -717,6 +717,10 @@ int drm_gem_prime_mmap(struct drm_gem_object *obj=
, struct vm_area_struct *vma)
>>   	vma->vm_pgoff +=3D drm_vma_node_start(&obj->vma_node);
>>  =20
>>   	if (obj->funcs && obj->funcs->mmap) {
>> +		if (!obj->funcs->vm_ops)
>> +			return -EINVAL;
>> +		vma->vm_ops =3D obj->funcs->vm_ops;
>> +
>>   		ret =3D obj->funcs->mmap(obj, vma);
>>   		if (ret)
>>   			return ret;
>>
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


--woZYELypJFcdFV6NGkoxQ7j9AqNuGQbn7--

--Kh1vec4IXbb3kVcSRWMCju6lb4o7n30xZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmABYCMFAwAAAAAACgkQlh/E3EQov+DI
JA/+KUHr9mwgJLB8GbEaQwHxAXj279VeoEYJ36PRCKuZT25WgqFMFM701cfppSWy06ahBT0cr3IY
+hXW65ru6GFlcqslks2FLIzzzVkNZZN6/gREN7WwvEailn7I5/ILoFcEGLbo9Ui6JyfgsxagHAJc
DPnJNRWbuy1w/s49/BWE1VoUJMmf4KXVnvkBCMiAqhGGirlUTogVD+YXjjSDzk6q0rR0Pd0r5rY4
kuNEUd3spPxHGLNxLXBAE5sC07zKe6FgYJjBXHY9uKGYeSN+3vZzbsdRLUjs7AMcoG5PLCPR3v9a
9xVT+EMcoEJrIIm7iUO2+p6h7Vvn9jaTb2+QGSCK+AAOhetPinjY7SXHXpeUNIPL3IMik+y0VS56
GGCNZoCQUR+A8am08bqtMI9N1qEDQ2ClJj8+ZZdMDB2uZCZVtCXe3ccyXgtQI76gQ9Cnx7OX48s6
epuhJ579ytsbng0FnMK/gIrkH1vM19cYS+StEiRbdIv+aiS1T6/VjEPbFCKF9mYlISwRuxY4vzkG
qZIel5c1sVoG3X1Gq02msw6UVwte4jtadd/sAKi+GgPBoUBuYEZ3Ni8h9kB+Gq/IJL36U5V4a5g1
wKdsGmbvOgMTFRZvYljQOdSONsTrJ+9EPytxrP5nmLSZ+hc5k0fKWfItKSCpomfHJfn0U5+vNMbV
9ro=
=r8+2
-----END PGP SIGNATURE-----

--Kh1vec4IXbb3kVcSRWMCju6lb4o7n30xZ--

--===============1734533552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1734533552==--
