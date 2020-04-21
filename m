Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1423E1B28F4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 16:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7AF26E992;
	Tue, 21 Apr 2020 14:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBB76E093;
 Tue, 21 Apr 2020 14:03:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 66C02AD77;
 Tue, 21 Apr 2020 14:03:16 +0000 (UTC)
Subject: Re: [PATCH 01/59] drm: Add devm_drm_dev_alloc macro
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-2-daniel.vetter@ffwll.ch>
 <4d5229c2-acb4-b76f-13c7-88a5f3de4760@suse.de>
 <CAKMK7uH2vhrQ7eTTF1B+==UJS9ZxhDv2RDvR0ct4P0vVJobf=w@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <ea9c5a37-118f-1243-26f7-f03a3068dfeb@suse.de>
Date: Tue, 21 Apr 2020 16:03:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uH2vhrQ7eTTF1B+==UJS9ZxhDv2RDvR0ct4P0vVJobf=w@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1033251819=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1033251819==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1wMJS6ZVNUsqc38e8Au6NxzVcL9Pzjj5e"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1wMJS6ZVNUsqc38e8Au6NxzVcL9Pzjj5e
Content-Type: multipart/mixed; boundary="8CFCZPU0BEGuROJ0ntBWIfBgGgnSCRJQK";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <ea9c5a37-118f-1243-26f7-f03a3068dfeb@suse.de>
Subject: Re: [PATCH 01/59] drm: Add devm_drm_dev_alloc macro
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-2-daniel.vetter@ffwll.ch>
 <4d5229c2-acb4-b76f-13c7-88a5f3de4760@suse.de>
 <CAKMK7uH2vhrQ7eTTF1B+==UJS9ZxhDv2RDvR0ct4P0vVJobf=w@mail.gmail.com>
In-Reply-To: <CAKMK7uH2vhrQ7eTTF1B+==UJS9ZxhDv2RDvR0ct4P0vVJobf=w@mail.gmail.com>

--8CFCZPU0BEGuROJ0ntBWIfBgGgnSCRJQK
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 21.04.20 um 12:45 schrieb Daniel Vetter:
> On Mon, Apr 20, 2020 at 3:37 PM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
>>
>> Hi
>>
>> Am 15.04.20 um 09:39 schrieb Daniel Vetter:
>>> Add a new macro helper to combine the usual init sequence in drivers,=

>>> consisting of a kzalloc + devm_drm_dev_init + drmm_add_final_kfree
>>> triplet. This allows us to remove the rather unsightly
>>> drmm_add_final_kfree from all currently merged drivers.
>>>
>>> The kerneldoc is only added for this new function. Existing kerneldoc=

>>> and examples will be udated at the very end, since once all drivers
>>> are converted over to devm_drm_dev_alloc we can unexport a lot of
>>> interim functions and make the documentation for driver authors a lot=

>>> cleaner and less confusing. There will be only one true way to
>>> initialize a drm_device at the end of this, which is going to be
>>> devm_drm_dev_alloc.
>>>
>>> v2:
>>> - Actually explain what this is for in the commit message (Sam)
>>> - Fix checkpatch issues (Sam)
>>>
>>> Acked-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
>>> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
>>> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>> Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>=20
> Thanks for taking a look, some questions on your suggestions below.
>=20
>> Sorry for being late. A number of nits are listed below. In any case:
>>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>> Best regards
>> Thomas
>>
>>> ---
>>>  drivers/gpu/drm/drm_drv.c | 23 +++++++++++++++++++++++
>>>  include/drm/drm_drv.h     | 33 +++++++++++++++++++++++++++++++++
>>>  2 files changed, 56 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>>> index 1bb4f636b83c..8e1813d2a12e 100644
>>> --- a/drivers/gpu/drm/drm_drv.c
>>> +++ b/drivers/gpu/drm/drm_drv.c
>>> @@ -739,6 +739,29 @@ int devm_drm_dev_init(struct device *parent,
>>>  }
>>>  EXPORT_SYMBOL(devm_drm_dev_init);
>>>
>>> +void *__devm_drm_dev_alloc(struct device *parent, struct drm_driver =
*driver,
>>> +                        size_t size, size_t offset)
>>
>> Maybe rename 'offset' of 'dev_offset' to make the relationship clear.
>=20
> Hm, I see the point of this (and the dev_field below, although I'd go
> with dev_member there for some consistency with other macros using
> offset_of or container_of), but I'm not sure about the dev_ prefix.
> Drivers use that sometimes for the struct device *, and usage for
> struct drm_device * is also very inconsistent. I've seen ddev, drm,
> dev and base (that one only for embedded structs ofc). So not sure
> which prefix to pick, aside from dev_ seems the most confusing. Got
> ideas?

We have pdev for the PCI device, dev for the abstract device, and things
like mdev for struct mga_device in mgag200. So I'd go with ddev. I don't
like drm, because it could be anything in DRM. I guess struct drm_driver
is more 'drm' than struct drm_device.

But all of this is bikeshedding. It's probably best to keep the patch
as-is, and maybe rename variables later if we ever find consent on the
naming.

>=20
>>> +{
>>> +     void *container;
>>> +     struct drm_device *drm;
>>> +     int ret;
>>> +
>>> +     container =3D kzalloc(size, GFP_KERNEL);
>>> +     if (!container)
>>> +             return ERR_PTR(-ENOMEM);
>>> +
>>> +     drm =3D container + offset;
>>
>> While convenient, I somewhat dislike the use of void* variables. I'd u=
se
>> unsigned char* for container and do an explicit cast to struct
>> drm_device* here.
>=20
> I thought ever since C89 the explicit recommendation for untyped
> pointer math has been void *, and no longer char *, with the spec
> being explicit that void * pointer math works exactly like char *. So

=46rom how I understand the C spec, I think it's the other way around. I
had to look up the sections from the C11 spec:

Sec 6.5.6 Additive operators

 2 For addition, either both operands shall have arithmetic type, or
   one operand shall be a pointer to a complete object type and the
   other shall have integer type. (Incrementing is equivalent to adding
   1.)

About void it says that it's not a complete type.

Sec 6.2.5 Types

 19 The void type comprises an empty set of values; it is an incomplete
    object type that cannot be completed.

Arithmetic on void* is a gcc extension AFAIK.

> not clear on why you think char * is preferred here. I'm also not
> aware of any other kernel code that casts to char * for untyped
> pointer math. So unless you have some supporting evidence, I'll skip
> this one, ok?

I'm really just bikeshedding on things I'd have done differently.

Best regards
Thomas

>=20
> Thanks, Daniel
>=20
>>> +     ret =3D devm_drm_dev_init(parent, drm, driver);
>>> +     if (ret) {
>>> +             kfree(container);
>>> +             return ERR_PTR(ret);
>>> +     }
>>> +     drmm_add_final_kfree(drm, container);
>>> +
>>> +     return container;
>>> +}
>>> +EXPORT_SYMBOL(__devm_drm_dev_alloc);
>>> +
>>>  /**
>>>   * drm_dev_alloc - Allocate new DRM device
>>>   * @driver: DRM driver to allocate device for
>>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>>> index e7c6ea261ed1..f07f15721254 100644
>>> --- a/include/drm/drm_drv.h
>>> +++ b/include/drm/drm_drv.h
>>> @@ -626,6 +626,39 @@ int devm_drm_dev_init(struct device *parent,
>>>                     struct drm_device *dev,
>>>                     struct drm_driver *driver);
>>>
>>> +void *__devm_drm_dev_alloc(struct device *parent, struct drm_driver =
*driver,
>>> +                        size_t size, size_t offset);
>>> +
>>> +/**
>>> + * devm_drm_dev_alloc - Resource managed allocation of a &drm_device=
 instance
>>> + * @parent: Parent device object
>>> + * @driver: DRM driver
>>> + * @type: the type of the struct which contains struct &drm_device
>>> + * @member: the name of the &drm_device within @type.
>>> + *
>>> + * This allocates and initialize a new DRM device. No device registr=
ation is done.
>>> + * Call drm_dev_register() to advertice the device to user space and=
 register it
>>> + * with other core subsystems. This should be done last in the devic=
e
>>> + * initialization sequence to make sure userspace can't access an in=
consistent
>>> + * state.
>>> + *
>>> + * The initial ref-count of the object is 1. Use drm_dev_get() and
>>> + * drm_dev_put() to take and drop further ref-counts.
>>> + *
>>> + * It is recommended that drivers embed &struct drm_device into thei=
r own device
>>> + * structure.
>>> + *
>>> + * Note that this manages the lifetime of the resulting &drm_device
>>> + * automatically using devres. The DRM device initialized with this =
function is
>>> + * automatically put on driver detach using drm_dev_put().
>>> + *
>>> + * RETURNS:
>>> + * Pointer to new DRM device, or ERR_PTR on failure.
>>> + */
>>> +#define devm_drm_dev_alloc(parent, driver, type, member) \
>>
>> I'd replace 'member' with 'dev_field' to make the relation ship clear.=

>>
>>> +     ((type *) __devm_drm_dev_alloc(parent, driver, sizeof(type), \
>>> +                                    offsetof(type, member)))
>>> +
>>>  struct drm_device *drm_dev_alloc(struct drm_driver *driver,
>>>                                struct device *parent);
>>>  int drm_dev_register(struct drm_device *dev, unsigned long flags);
>>>
>>
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--8CFCZPU0BEGuROJ0ntBWIfBgGgnSCRJQK--

--1wMJS6ZVNUsqc38e8Au6NxzVcL9Pzjj5e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6e/SEACgkQaA3BHVML
eiNVrQf/UQ1M53lrCV+y05Y+PxqjK4ZXREK5R+Bfm+kvPsabpEUbVPs63CG69yQP
kSwVv1Glau6OwQBw+D97q8AoahqmEWFl0HHaQnbh2HU7lGWRfRaOrhPx1ak7hawh
QJw7ZHm7t3LRLrrtOy3AycFczuI+oXNRSJ3JpdzW9MCHGELHHmlua5Q6c/c9hxjl
DEy95p9/0iRxb+G4JMKEbfose7BelkLIcM3GkvHouqr8kxKVuPbVKiyJ0syWdOkt
YDOQWvDEoMV5mrMDhfUWnaIrwjOoqI1e8ia6iXXVSAut/KHs+Oa8w56hKLKubQ1F
m54T4S7DNHxF0bN/8ExREFkAzUTU5w==
=1Wf7
-----END PGP SIGNATURE-----

--1wMJS6ZVNUsqc38e8Au6NxzVcL9Pzjj5e--

--===============1033251819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1033251819==--
