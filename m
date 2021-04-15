Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 071423612C2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 21:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BA16EABC;
	Thu, 15 Apr 2021 19:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B286EABD
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 19:12:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 80EE3B125;
 Thu, 15 Apr 2021 19:12:17 +0000 (UTC)
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <20210318102921.21536-5-tzimmermann@suse.de>
 <YG7RgQfj0yZHbL6L@phenom.ffwll.local>
 <a787dde9-70b0-cb38-f2bf-6e7b479525f9@suse.de>
 <YHAc3vdstgJzIAEL@phenom.ffwll.local>
 <0996ac00-9f7f-27ca-8b14-b551feff8ce4@suse.de>
 <YHg4Ux7L3FTV45ST@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 04/10] drm/aperture: Add infrastructure for aperture
 ownership
Message-ID: <78b42ee2-6846-32f3-3ed8-0173ff031f0a@suse.de>
Date: Thu, 15 Apr 2021 21:12:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YHg4Ux7L3FTV45ST@phenom.ffwll.local>
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
Cc: bluescreen_avenger@verizon.net, geert+renesas@glider.be, corbet@lwn.net,
 airlied@linux.ie, linux-doc@vger.kernel.org, emil.l.velikov@gmail.com,
 lgirdwood@gmail.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 broonie@kernel.org, kraxel@redhat.com, sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============1863956733=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1863956733==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LZDxcCarnThux4YG1ReTlSxm5cn3NIYl7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LZDxcCarnThux4YG1ReTlSxm5cn3NIYl7
Content-Type: multipart/mixed; boundary="OZDRayy34zTJ7CGri4CxMHyMAv5jtJsH3";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: bluescreen_avenger@verizon.net, geert+renesas@glider.be, corbet@lwn.net,
 airlied@linux.ie, emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, lgirdwood@gmail.com,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 broonie@kernel.org, kraxel@redhat.com, sam@ravnborg.org
Message-ID: <78b42ee2-6846-32f3-3ed8-0173ff031f0a@suse.de>
Subject: Re: [PATCH v2 04/10] drm/aperture: Add infrastructure for aperture
 ownership
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <20210318102921.21536-5-tzimmermann@suse.de>
 <YG7RgQfj0yZHbL6L@phenom.ffwll.local>
 <a787dde9-70b0-cb38-f2bf-6e7b479525f9@suse.de>
 <YHAc3vdstgJzIAEL@phenom.ffwll.local>
 <0996ac00-9f7f-27ca-8b14-b551feff8ce4@suse.de>
 <YHg4Ux7L3FTV45ST@phenom.ffwll.local>
In-Reply-To: <YHg4Ux7L3FTV45ST@phenom.ffwll.local>

--OZDRayy34zTJ7CGri4CxMHyMAv5jtJsH3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.04.21 um 14:57 schrieb Daniel Vetter:
> On Thu, Apr 15, 2021 at 08:56:20AM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 09.04.21 um 11:22 schrieb Daniel Vetter:
>>>> Is it that easy? simepldrm's detach function has code to synchronize=20
with
>>>> concurrent hotplug removals. If we can use drm_dev_unplug() for ever=
ything,
>>>> I'm all for it.
>>>
>>> Uh, I should have looked at the code instead of just asking silly
>>> questions :-)
>>>
>>> Now I'm even more scared, and also more convinced that we're recreati=
ng
>> a
>>> bad version of some of the core driver model concepts.
>>>
>>> I think the ideal option here would be if drm_aperture could unload
>>> (unbind really) the platform driver for us, through the driver model.=20
Then
>>> there's only one place that keeps track whether the driver is unbound=20
or
>>> not. I'm not sure whether this can be done fully generic on a struct
>>> device, or whether we need special code for each type. Since atm we o=
nly
>>> have simpledrm we can just specialize on platform_device and it's goo=
d
>>> enough.
>>
>> I meanwhile found that calling platform_device_unregister() is the rig=
ht
>> thing to do. It is like a hot-unplug event. It's simple to implement a=
nd
>> removes the generic device as well. Any memory ranges for the generic =
device
>> are gone as well. Only the native driver's native device will remain. =
That's
>> better than the existing simplefb driver.
>=20
> That sounds great.
>=20
>> Which unregister function to call still driver-specific, so I kept the=

>> callback.
>=20
> Could we have the callback in core code, and you do something like
> drm_aperture_acquire_platform (and later on drm_aperture_acquire_pci or=

> whatever, although tbh I'm not sure we ever get anything else than
> platform). That function can do a runtime check that drm_device->dev is=

> actually a platform dev.

Somehow I knew you wouldn't like the current abstraction. :)

>=20
> Another idea: Do the runtime casting in the core without anything? Atm =
we
> have platform that needs support, maybe pci device, so we could easily
> extend this and just let it do the right thing. Then no callback is
> needed. I.e.
>=20
> 	if (is_platform_dev(drm_device->dev))
> 		platform_device_unregister(drm_device->dev);
> 	else
> 		WARN(1, "not yet implemented\n");
>=20
> or something like that.

I don't like that. I spend time to remove the usb and pci device=20
pointers from code and structs. I don't want to introduce a new=20
hard-coded special case here.

>=20
> I just find the callback to essentially unregister a device a bit
> redundant.

I'd like to go with your first idea. The callback would be internal and=20
the public acquire function is specifically for firmware-based platform=20
devices. That covers simple-framebuffer, VESA, EFI, and probably any=20
other generic interface that fbdev supported in the last 20+ yrs. I=20
don't think we'll ever need anything else.

Still, I'd like to have some abstraction between the internals of the=20
aperture helpers and our actual use case. I'll update the patchset=20
accordingly.

Best regards
Thomas

> -Daniel
>=20
>>
>> Best regards
>> Thomas
>>
>>>
>>> I think best here would be to Cc: gregkh on this patch and the simple=
drm
>>> ->detach implementatation, and ask for his feedback as driver model
>>> maintainer. Maybe if you could hack together the platform_device unbi=
nd
>>> path as proof of concept would be even better.
>>>
>>> Either way, this is really tricky.
>>> -Daniel
>>>
>>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>>
>>>>> Or maybe we should tie this more into the struct device mode and fo=
rce an
>>>>> unload that way? That way devm cleanup would work as one expects, a=
nd
>>>>> avoid the need for anything specific (hopefully) in this detach cal=
lback.
>>>>>
>>>>> Just feels a bit like we're reinventing half of the driver model he=
re,
>>>>> badly.
>>>>>
>>>>>> + *	};
>>>>>> + *
>>>>>> + *	static int acquire_framebuffers(struct drm_device *dev, struct=20
pci_dev *pdev)
>>>>>> + *	{
>>>>>> + *		resource_size_t start, len;
>>>>>> + *		struct drm_aperture *ap;
>>>>>> + *
>>>>>> + *		base =3D pci_resource_start(pdev, 0);
>>>>>> + *		size =3D pci_resource_len(pdev, 0);
>>>>>> + *
>>>>>> + *		ap =3D devm_acquire_aperture(dev, base, size, &ap_funcs);
>>>>>> + *		if (IS_ERR(ap))
>>>>>> + *			return PTR_ERR(ap);
>>>>>> + *
>>>>>> + *		return 0;
>>>>>> + *	}
>>>>>> + *
>>>>>> + *	static int probe(struct pci_dev *pdev)
>>>>>> + *	{
>>>>>> + *		struct drm_device *dev;
>>>>>> + *		int ret;
>>>>>> + *
>>>>>> + *		// ... Initialize the device...
>>>>>> + *		dev =3D devm_drm_dev_alloc();
>>>>>> + *		...
>>>>>> + *
>>>>>> + *		// ... and acquire ownership of the framebuffer.
>>>>>> + *		ret =3D acquire_framebuffers(dev, pdev);
>>>>>> + *		if (ret)
>>>>>> + *			return ret;
>>>>>> + *
>>>>>> + *		drm_dev_register();
>>>>>> + *
>>>>>> + *		return 0;
>>>>>> + *	}
>>>>>> + *
>>>>>> + * The generic driver is now subject to forced removal by other d=
rivers. This
>>>>>> + * is when the detach function in struct &drm_aperture_funcs come=
s into play.
>>>>>> + * When a driver calls drm_fb_helper_remove_conflicting_framebuff=
ers() et al
>>>>>> + * for the registered framebuffer range, the DRM core calls struc=
t
>>>>>> + * &drm_aperture_funcs.detach and the generic driver has to onloa=
d itself. It
>>>>>> + * may not access the device's registers, framebuffer memory, ROM=
, etc after
>>>>>> + * detach returned. If the driver supports hotplugging, detach ca=
n be treated
>>>>>> + * like an unplug event.
>>>>>> + *
>>>>>> + * .. code-block:: c
>>>>>> + *
>>>>>> + *	static void detach_from_device(struct drm_device *dev,
>>>>>> + *				       resource_size_t base,
>>>>>> + *				       resource_size_t size)
>>>>>> + *	{
>>>>>> + *		// Signal unplug
>>>>>> + *		drm_dev_unplug(dev);
>>>>>> + *
>>>>>> + *		// Maybe do other clean-up operations
>>>>>> + *		...
>>>>>> + *	}
>>>>>> + *
>>>>>> + *	static struct drm_aperture_funcs ap_funcs =3D {
>>>>>> + *		.detach =3D detach_from_device,
>>>>>> + *	};
>>>>>> + */
>>>>>> +
>>>>>> +/**
>>>>>> + * struct drm_aperture - Represents a DRM framebuffer aperture
>>>>>> + *
>>>>>> + * This structure has no public fields.
>>>>>> + */
>>>>>> +struct drm_aperture {
>>>>>> +	struct drm_device *dev;
>>>>>> +	resource_size_t base;
>>>>>> +	resource_size_t size;
>>>>>> +
>>>>>> +	const struct drm_aperture_funcs *funcs;
>>>>>> +
>>>>>> +	struct list_head lh;
>>>>>> +};
>>>>>> +
>>>>>> +static LIST_HEAD(drm_apertures);
>>>>>> +
>>>>>> +static DEFINE_MUTEX(drm_apertures_lock);
>>>>>> +
>>>>>> +static bool overlap(resource_size_t base1, resource_size_t end1,
>>>>>> +		    resource_size_t base2, resource_size_t end2)
>>>>>> +{
>>>>>> +	return (base1 < end2) && (end1 > base2);
>>>>>> +}
>>>>>> +
>>>>>> +static void devm_aperture_acquire_release(void *data)
>>>>>> +{
>>>>>> +	struct drm_aperture *ap =3D data;
>>>>>> +	bool detached =3D !ap->dev;
>>>>>> +
>>>>>> +	if (!detached)
>>>>>
>>>>> Uh this needs a comment that if ap->dev is NULL then we're called f=
rom
>>>>> drm_aperture_detach_drivers() and hence the lock is already held.
>>>>>
>>>>>> +		mutex_lock(&drm_apertures_lock);
>>>>>
>>>>> and an
>>>>>
>>>>> 	else
>>>>> 		locdep_assert_held(&drm_apertures_lock);
>>>>>
>>>>> here to check that. I was scratching my head first quite a bit how =
you'd
>>>>> solve the deadlock, this is a neat solution (much simpler than anyt=
hing I
>>>>> came up with in my head). But needs comments.
>>>>>
>>>>>> +
>>>>>> +	list_del(&ap->lh);
>>>>>> +
>>>>>> +	if (!detached)
>>>>>> +		mutex_unlock(&drm_apertures_lock);
>>>>>> +}
>>>>>> +
>>>>>> +/**
>>>>>> + * devm_aperture_acquire - Acquires ownership of a framebuffer on=20
behalf of a DRM driver.
>>>>>> + * @dev:	the DRM device to own the framebuffer memory
>>>>>> + * @base:	the framebuffer's byte offset in physical memory
>>>>>> + * @size:	the framebuffer size in bytes
>>>>>> + * @funcs:	callback functions
>>>>>> + *
>>>>>> + * Installs the given device as the new owner. The function fails=20
if the
>>>>>> + * framebuffer range, or parts of it, is currently owned by
>>>>>> another
>> driver.
>>>>>> + * To evict current owners, callers should use
>>>>>> + * drm_fb_helper_remove_conflicting_framebuffers() et al. before =
calling this
>>>>>> + * function. Acquired apertures are released automatically if the=20
underlying
>>>>>> + * device goes away.
>>>>>> + *
>>>>>> + * Returns:
>>>>>> + * An instance of struct &drm_aperture on success, or a pointer-e=
ncoded
>>>>>> + * errno value otherwise.
>>>>>> + */
>>>>>> +struct drm_aperture *
>>>>>> +devm_aperture_acquire(struct drm_device *dev,
>>>>>> +		      resource_size_t base, resource_size_t size,
>>>>>> +		      const struct drm_aperture_funcs *funcs)
>>>>>> +{
>>>>>> +	size_t end =3D base + size;
>>>>>> +	struct list_head *pos;
>>>>>> +	struct drm_aperture *ap;
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	mutex_lock(&drm_apertures_lock);
>>>>>> +
>>>>>> +	list_for_each(pos, &drm_apertures) {
>>>>>> +		ap =3D container_of(pos, struct drm_aperture, lh);
>>>>>> +		if (overlap(base, end, ap->base, ap->base + ap->size))
>>>>>> +			return ERR_PTR(-EBUSY);
>>>>>> +	}
>>>>>> +
>>>>>> +	ap =3D devm_kzalloc(dev->dev, sizeof(*ap), GFP_KERNEL);
>>>>>> +	if (!ap)
>>>>>> +		return ERR_PTR(-ENOMEM);
>>>>>> +
>>>>>> +	ap->dev =3D dev;
>>>>>> +	ap->base =3D base;
>>>>>> +	ap->size =3D size;
>>>>>> +	ap->funcs =3D funcs;
>>>>>> +	INIT_LIST_HEAD(&ap->lh);
>>>>>> +
>>>>>> +	list_add(&ap->lh, &drm_apertures);
>>>>>> +
>>>>>> +	mutex_unlock(&drm_apertures_lock);
>>>>>> +
>>>>>> +	ret =3D devm_add_action_or_reset(dev->dev, devm_aperture_acquire=
_release, ap);
>>>>>> +	if (ret)
>>>>>> +		return ERR_PTR(ret);
>>>>>> +
>>>>>> +	return ap;
>>>>>> +}
>>>>>> +EXPORT_SYMBOL(devm_aperture_acquire);
>>>>>> +
>>>>>> +void drm_aperture_detach_drivers(resource_size_t base, resource_s=
ize_t size)
>>>>>> +{
>>>>>> +	resource_size_t end =3D base + size;
>>>>>> +	struct list_head *pos, *n;
>>>>>> +
>>>>>> +	mutex_lock(&drm_apertures_lock);
>>>>>> +
>>>>>> +	list_for_each_safe(pos, n, &drm_apertures) {
>>>>>> +		struct drm_aperture *ap =3D
>>>>>> +			container_of(pos, struct drm_aperture, lh);
>>>>>> +		struct drm_device *dev =3D ap->dev;
>>>>>> +
>>>>>> +		if (!overlap(base, end, ap->base, ap->base + ap->size))
>>>>>> +			continue;
>>>>>> +
>>>>>> +		ap->dev =3D NULL; /* detach from device */
>>>>>> +		if (drm_WARN_ON(dev, !ap->funcs->detach))
>>>>>> +			continue;
>>>>>> +		ap->funcs->detach(dev, ap->base, ap->size);
>>>>>> +	}
>>>>>> +
>>>>>> +	mutex_unlock(&drm_apertures_lock);
>>>>>> +}
>>>>>> +EXPORT_SYMBOL(drm_aperture_detach_drivers);
>>>>>
>>>>> Is this just exported because of the inline functions in the
>>>>> headers?
>> Imo
>>>>> better to make them proper functions (they're big after your patch&=
not
>>>>> perf critical, so not good candidates for inlining anyway).
>>>>>
>>>>>> diff --git a/include/drm/drm_aperture.h b/include/drm/drm_aperture=
=2Eh
>>>>>> index 13766efe9517..696cec75ef78 100644
>>>>>> --- a/include/drm/drm_aperture.h
>>>>>> +++ b/include/drm/drm_aperture.h
>>>>>> @@ -4,8 +4,30 @@
>>>>>>     #define _DRM_APERTURE_H_
>>>>>>     #include <linux/fb.h>
>>>>>> +#include <linux/pci.h>
>>>>>>     #include <linux/vgaarb.h>
>>>>>> +struct drm_aperture;
>>>>>> +struct drm_device;
>>>>>> +
>>>>>> +struct drm_aperture_funcs {
>>>>>> +	void (*detach)(struct drm_device *dev, resource_size_t base, res=
ource_size_t size);
>>>>>> +};
>>>>>> +
>>>>>> +struct drm_aperture *
>>>>>> +devm_aperture_acquire(struct drm_device *dev,
>>>>>> +		      resource_size_t base, resource_size_t size,
>>>>>> +		      const struct drm_aperture_funcs *funcs);
>>>>>> +
>>>>>> +#if defined(CONFIG_DRM_APERTURE)
>>>>>> +void drm_aperture_detach_drivers(resource_size_t base, resource_s=
ize_t size);
>>>>>> +#else
>>>>>> +static inline void
>>>>>> +drm_aperture_detach_drivers(resource_size_t base, resource_size_t=20
size)
>>>>>> +{
>>>>>> +}
>>>>>> +#endif
>>>>>> +
>>>>>>     /**
>>>>>>      * drm_fb_helper_remove_conflicting_framebuffers - remove firm=
ware-configured framebuffers
>>>>>>      * @a: memory range, users of which are to be removed
>>>>>> @@ -20,6 +42,11 @@ static inline int
>>>>>>     drm_fb_helper_remove_conflicting_framebuffers(struct apertures=
_struct *a,
>>>>>>     					      const char *name, bool primary)
>>>>>>     {
>>>>>> +	int i;
>>>>>> +
>>>>>> +	for (i =3D 0; i < a->count; ++i)
>>>>>> +		drm_aperture_detach_drivers(a->ranges[i].base, a->ranges[i].siz=
e);
>>>>>> +
>>>>>>     #if IS_REACHABLE(CONFIG_FB)
>>>>>>     	return remove_conflicting_framebuffers(a, name, primary);
>>>>>>     #else
>>>>>> @@ -43,7 +70,16 @@ static inline int
>>>>>>     drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_d=
ev *pdev,
>>>>>>     						  const char *name)
>>>>>>     {
>>>>>> -	int ret =3D 0;
>>>>>> +	resource_size_t base, size;
>>>>>> +	int bar, ret =3D 0;
>>>>>> +
>>>>>> +	for (bar =3D 0; bar < PCI_STD_NUM_BARS; bar++) {
>>>>>> +		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
>>>>>> +			continue;
>>>>>> +		base =3D pci_resource_start(pdev, bar);
>>>>>> +		size =3D pci_resource_len(pdev, bar);
>>>>>> +		drm_aperture_detach_drivers(base, size);
>>>>>> +	}
>>>>>>     	/*
>>>>>>     	 * WARNING: Apparently we must kick fbdev drivers before vgac=
on,
>>>>>> --=20
>>>>>> 2.30.1
>>>>>>
>>>>>
>>>>
>>>> --=20
>>>> Thomas Zimmermann
>>>> Graphics Driver Developer
>>>> SUSE Software Solutions Germany GmbH
>>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>>>> (HRB 36809, AG N=C3=BCrnberg)
>>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>>>
>>>
>>>
>>>
>>>
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
>=20
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--OZDRayy34zTJ7CGri4CxMHyMAv5jtJsH3--

--LZDxcCarnThux4YG1ReTlSxm5cn3NIYl7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmB4kA8FAwAAAAAACgkQlh/E3EQov+AL
qw/7BK1VNDiGSEh1soR4gjBgae+StNGSd153UfmSKbS+xhRpGdC4//BSBc1DVZ7kZGVRg4udEL1M
O0BzWlChHPale1vxleFEUd6NOF6PCxTR2zsMMFPKTPdNefy9Ue4Xd5O/iriccVnE5ECvbl2j4H4a
4xoZHwVvw2I7RD0LpaJ/pdI52V4o3CHrTNhTvLx1FYuObugt/s0URIwTtratHJ2dxxOQYs4Vqdvq
W0bHA+DW6Ne5IhxrBLj8jSVgIT5FljRVbY17jMMf9gy2Ud8TQ5cpOpRiX8knotiiq7WED0aFNeeX
TfBnEmOF7dxAGHqAwAtiuY45qG5R1NnkvsWMoylV28sHRl366LIRY+2WmjE817cLbWVPqOtPceWn
Fq6I+SVHxgMw7//3oTtqk3880eGNcU7nfIr/IT7pV6g7H/tuiw0VmGmdmD6fF/6tCMUgzZLoMLO2
xFBH0yGaufFtsZyEQcdLzwD25m0R10gH+if8nI831IZB1Fwp2P/oxjl5T8eIyyzNUu5LfB+FNBZ+
KHRNST+pBWcB0GDR3P9u4UaEAo2WaMqWioOLjkpXfBqgtwHEUicVQ3/cH7gX1DBCW+IB8aRzdqs4
4WEAl8xl/ltmpO5vSj+TZRbxi9DsEN05w8aGst6LwZY/oGbKJIMgoUbU1ZdQEeQ1gK7nR/Kc21V9
Bwc=
=/mGs
-----END PGP SIGNATURE-----

--LZDxcCarnThux4YG1ReTlSxm5cn3NIYl7--

--===============1863956733==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1863956733==--
