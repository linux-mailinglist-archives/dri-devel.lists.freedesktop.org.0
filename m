Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 068B13602CB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 08:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C416E245;
	Thu, 15 Apr 2021 06:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A1B6E043
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 06:56:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E1639B035;
 Thu, 15 Apr 2021 06:56:22 +0000 (UTC)
Subject: Re: [PATCH v2 04/10] drm/aperture: Add infrastructure for aperture
 ownership
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <20210318102921.21536-5-tzimmermann@suse.de>
 <YG7RgQfj0yZHbL6L@phenom.ffwll.local>
 <a787dde9-70b0-cb38-f2bf-6e7b479525f9@suse.de>
 <YHAc3vdstgJzIAEL@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <0996ac00-9f7f-27ca-8b14-b551feff8ce4@suse.de>
Date: Thu, 15 Apr 2021 08:56:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YHAc3vdstgJzIAEL@phenom.ffwll.local>
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
 airlied@linux.ie, emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, lgirdwood@gmail.com,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 broonie@kernel.org, kraxel@redhat.com, sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============0740207395=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0740207395==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="EdLMrFfd2iTxNEnPUZeSbSHRqch54MIOc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EdLMrFfd2iTxNEnPUZeSbSHRqch54MIOc
Content-Type: multipart/mixed; boundary="RJ1gBV9Rlw7n79Ob1iRBnoaQcKY9t5gh5";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 kraxel@redhat.com, corbet@lwn.net, lgirdwood@gmail.com, broonie@kernel.org,
 sam@ravnborg.org, robh@kernel.org, emil.l.velikov@gmail.com,
 geert+renesas@glider.be, hdegoede@redhat.com,
 bluescreen_avenger@verizon.net, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, virtualization@lists.linux-foundation.org
Message-ID: <0996ac00-9f7f-27ca-8b14-b551feff8ce4@suse.de>
Subject: Re: [PATCH v2 04/10] drm/aperture: Add infrastructure for aperture
 ownership
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <20210318102921.21536-5-tzimmermann@suse.de>
 <YG7RgQfj0yZHbL6L@phenom.ffwll.local>
 <a787dde9-70b0-cb38-f2bf-6e7b479525f9@suse.de>
 <YHAc3vdstgJzIAEL@phenom.ffwll.local>
In-Reply-To: <YHAc3vdstgJzIAEL@phenom.ffwll.local>

--RJ1gBV9Rlw7n79Ob1iRBnoaQcKY9t5gh5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 09.04.21 um 11:22 schrieb Daniel Vetter:
>> Is it that easy? simepldrm's detach function has code to synchronize w=
ith
>> concurrent hotplug removals. If we can use drm_dev_unplug() for everyt=
hing,
>> I'm all for it.
>=20
> Uh, I should have looked at the code instead of just asking silly
> questions :-)
>=20
> Now I'm even more scared, and also more convinced that we're recreating=20
a
> bad version of some of the core driver model concepts.
>=20
> I think the ideal option here would be if drm_aperture could unload
> (unbind really) the platform driver for us, through the driver model. T=
hen
> there's only one place that keeps track whether the driver is unbound o=
r
> not. I'm not sure whether this can be done fully generic on a struct
> device, or whether we need special code for each type. Since atm we onl=
y
> have simpledrm we can just specialize on platform_device and it's good
> enough.

I meanwhile found that calling platform_device_unregister() is the right =

thing to do. It is like a hot-unplug event. It's simple to implement and =

removes the generic device as well. Any memory ranges for the generic=20
device are gone as well. Only the native driver's native device will=20
remain. That's better than the existing simplefb driver.

Which unregister function to call still driver-specific, so I kept the=20
callback.

Best regards
Thomas

>=20
> I think best here would be to Cc: gregkh on this patch and the simpledr=
m
> ->detach implementatation, and ask for his feedback as driver model
> maintainer. Maybe if you could hack together the platform_device unbind=

> path as proof of concept would be even better.
>=20
> Either way, this is really tricky.
> -Daniel
>=20
>>
>> Best regards
>> Thomas
>>
>>>
>>> Or maybe we should tie this more into the struct device mode and forc=
e an
>>> unload that way? That way devm cleanup would work as one expects, and=

>>> avoid the need for anything specific (hopefully) in this detach callb=
ack.
>>>
>>> Just feels a bit like we're reinventing half of the driver model here=
,
>>> badly.
>>>
>>>> + *	};
>>>> + *
>>>> + *	static int acquire_framebuffers(struct drm_device *dev, struct p=
ci_dev *pdev)
>>>> + *	{
>>>> + *		resource_size_t start, len;
>>>> + *		struct drm_aperture *ap;
>>>> + *
>>>> + *		base =3D pci_resource_start(pdev, 0);
>>>> + *		size =3D pci_resource_len(pdev, 0);
>>>> + *
>>>> + *		ap =3D devm_acquire_aperture(dev, base, size, &ap_funcs);
>>>> + *		if (IS_ERR(ap))
>>>> + *			return PTR_ERR(ap);
>>>> + *
>>>> + *		return 0;
>>>> + *	}
>>>> + *
>>>> + *	static int probe(struct pci_dev *pdev)
>>>> + *	{
>>>> + *		struct drm_device *dev;
>>>> + *		int ret;
>>>> + *
>>>> + *		// ... Initialize the device...
>>>> + *		dev =3D devm_drm_dev_alloc();
>>>> + *		...
>>>> + *
>>>> + *		// ... and acquire ownership of the framebuffer.
>>>> + *		ret =3D acquire_framebuffers(dev, pdev);
>>>> + *		if (ret)
>>>> + *			return ret;
>>>> + *
>>>> + *		drm_dev_register();
>>>> + *
>>>> + *		return 0;
>>>> + *	}
>>>> + *
>>>> + * The generic driver is now subject to forced removal by other dri=
vers. This
>>>> + * is when the detach function in struct &drm_aperture_funcs comes =
into play.
>>>> + * When a driver calls drm_fb_helper_remove_conflicting_framebuffer=
s() et al
>>>> + * for the registered framebuffer range, the DRM core calls struct
>>>> + * &drm_aperture_funcs.detach and the generic driver has to onload =
itself. It
>>>> + * may not access the device's registers, framebuffer memory, ROM, =
etc after
>>>> + * detach returned. If the driver supports hotplugging, detach can =
be treated
>>>> + * like an unplug event.
>>>> + *
>>>> + * .. code-block:: c
>>>> + *
>>>> + *	static void detach_from_device(struct drm_device *dev,
>>>> + *				       resource_size_t base,
>>>> + *				       resource_size_t size)
>>>> + *	{
>>>> + *		// Signal unplug
>>>> + *		drm_dev_unplug(dev);
>>>> + *
>>>> + *		// Maybe do other clean-up operations
>>>> + *		...
>>>> + *	}
>>>> + *
>>>> + *	static struct drm_aperture_funcs ap_funcs =3D {
>>>> + *		.detach =3D detach_from_device,
>>>> + *	};
>>>> + */
>>>> +
>>>> +/**
>>>> + * struct drm_aperture - Represents a DRM framebuffer aperture
>>>> + *
>>>> + * This structure has no public fields.
>>>> + */
>>>> +struct drm_aperture {
>>>> +	struct drm_device *dev;
>>>> +	resource_size_t base;
>>>> +	resource_size_t size;
>>>> +
>>>> +	const struct drm_aperture_funcs *funcs;
>>>> +
>>>> +	struct list_head lh;
>>>> +};
>>>> +
>>>> +static LIST_HEAD(drm_apertures);
>>>> +
>>>> +static DEFINE_MUTEX(drm_apertures_lock);
>>>> +
>>>> +static bool overlap(resource_size_t base1, resource_size_t end1,
>>>> +		    resource_size_t base2, resource_size_t end2)
>>>> +{
>>>> +	return (base1 < end2) && (end1 > base2);
>>>> +}
>>>> +
>>>> +static void devm_aperture_acquire_release(void *data)
>>>> +{
>>>> +	struct drm_aperture *ap =3D data;
>>>> +	bool detached =3D !ap->dev;
>>>> +
>>>> +	if (!detached)
>>>
>>> Uh this needs a comment that if ap->dev is NULL then we're called fro=
m
>>> drm_aperture_detach_drivers() and hence the lock is already held.
>>>
>>>> +		mutex_lock(&drm_apertures_lock);
>>>
>>> and an
>>>
>>> 	else
>>> 		locdep_assert_held(&drm_apertures_lock);
>>>
>>> here to check that. I was scratching my head first quite a bit how yo=
u'd
>>> solve the deadlock, this is a neat solution (much simpler than anythi=
ng I
>>> came up with in my head). But needs comments.
>>>
>>>> +
>>>> +	list_del(&ap->lh);
>>>> +
>>>> +	if (!detached)
>>>> +		mutex_unlock(&drm_apertures_lock);
>>>> +}
>>>> +
>>>> +/**
>>>> + * devm_aperture_acquire - Acquires ownership of a framebuffer on b=
ehalf of a DRM driver.
>>>> + * @dev:	the DRM device to own the framebuffer memory
>>>> + * @base:	the framebuffer's byte offset in physical memory
>>>> + * @size:	the framebuffer size in bytes
>>>> + * @funcs:	callback functions
>>>> + *
>>>> + * Installs the given device as the new owner. The function fails i=
f the
>>>> + * framebuffer range, or parts of it, is currently owned by another=20
driver.
>>>> + * To evict current owners, callers should use
>>>> + * drm_fb_helper_remove_conflicting_framebuffers() et al. before ca=
lling this
>>>> + * function. Acquired apertures are released automatically if the u=
nderlying
>>>> + * device goes away.
>>>> + *
>>>> + * Returns:
>>>> + * An instance of struct &drm_aperture on success, or a pointer-enc=
oded
>>>> + * errno value otherwise.
>>>> + */
>>>> +struct drm_aperture *
>>>> +devm_aperture_acquire(struct drm_device *dev,
>>>> +		      resource_size_t base, resource_size_t size,
>>>> +		      const struct drm_aperture_funcs *funcs)
>>>> +{
>>>> +	size_t end =3D base + size;
>>>> +	struct list_head *pos;
>>>> +	struct drm_aperture *ap;
>>>> +	int ret;
>>>> +
>>>> +	mutex_lock(&drm_apertures_lock);
>>>> +
>>>> +	list_for_each(pos, &drm_apertures) {
>>>> +		ap =3D container_of(pos, struct drm_aperture, lh);
>>>> +		if (overlap(base, end, ap->base, ap->base + ap->size))
>>>> +			return ERR_PTR(-EBUSY);
>>>> +	}
>>>> +
>>>> +	ap =3D devm_kzalloc(dev->dev, sizeof(*ap), GFP_KERNEL);
>>>> +	if (!ap)
>>>> +		return ERR_PTR(-ENOMEM);
>>>> +
>>>> +	ap->dev =3D dev;
>>>> +	ap->base =3D base;
>>>> +	ap->size =3D size;
>>>> +	ap->funcs =3D funcs;
>>>> +	INIT_LIST_HEAD(&ap->lh);
>>>> +
>>>> +	list_add(&ap->lh, &drm_apertures);
>>>> +
>>>> +	mutex_unlock(&drm_apertures_lock);
>>>> +
>>>> +	ret =3D devm_add_action_or_reset(dev->dev, devm_aperture_acquire_r=
elease, ap);
>>>> +	if (ret)
>>>> +		return ERR_PTR(ret);
>>>> +
>>>> +	return ap;
>>>> +}
>>>> +EXPORT_SYMBOL(devm_aperture_acquire);
>>>> +
>>>> +void drm_aperture_detach_drivers(resource_size_t base, resource_siz=
e_t size)
>>>> +{
>>>> +	resource_size_t end =3D base + size;
>>>> +	struct list_head *pos, *n;
>>>> +
>>>> +	mutex_lock(&drm_apertures_lock);
>>>> +
>>>> +	list_for_each_safe(pos, n, &drm_apertures) {
>>>> +		struct drm_aperture *ap =3D
>>>> +			container_of(pos, struct drm_aperture, lh);
>>>> +		struct drm_device *dev =3D ap->dev;
>>>> +
>>>> +		if (!overlap(base, end, ap->base, ap->base + ap->size))
>>>> +			continue;
>>>> +
>>>> +		ap->dev =3D NULL; /* detach from device */
>>>> +		if (drm_WARN_ON(dev, !ap->funcs->detach))
>>>> +			continue;
>>>> +		ap->funcs->detach(dev, ap->base, ap->size);
>>>> +	}
>>>> +
>>>> +	mutex_unlock(&drm_apertures_lock);
>>>> +}
>>>> +EXPORT_SYMBOL(drm_aperture_detach_drivers);
>>>
>>> Is this just exported because of the inline functions in the headers?=20
Imo
>>> better to make them proper functions (they're big after your patch&no=
t
>>> perf critical, so not good candidates for inlining anyway).
>>>
>>>> diff --git a/include/drm/drm_aperture.h b/include/drm/drm_aperture.h=

>>>> index 13766efe9517..696cec75ef78 100644
>>>> --- a/include/drm/drm_aperture.h
>>>> +++ b/include/drm/drm_aperture.h
>>>> @@ -4,8 +4,30 @@
>>>>    #define _DRM_APERTURE_H_
>>>>    #include <linux/fb.h>
>>>> +#include <linux/pci.h>
>>>>    #include <linux/vgaarb.h>
>>>> +struct drm_aperture;
>>>> +struct drm_device;
>>>> +
>>>> +struct drm_aperture_funcs {
>>>> +	void (*detach)(struct drm_device *dev, resource_size_t base, resou=
rce_size_t size);
>>>> +};
>>>> +
>>>> +struct drm_aperture *
>>>> +devm_aperture_acquire(struct drm_device *dev,
>>>> +		      resource_size_t base, resource_size_t size,
>>>> +		      const struct drm_aperture_funcs *funcs);
>>>> +
>>>> +#if defined(CONFIG_DRM_APERTURE)
>>>> +void drm_aperture_detach_drivers(resource_size_t base, resource_siz=
e_t size);
>>>> +#else
>>>> +static inline void
>>>> +drm_aperture_detach_drivers(resource_size_t base, resource_size_t s=
ize)
>>>> +{
>>>> +}
>>>> +#endif
>>>> +
>>>>    /**
>>>>     * drm_fb_helper_remove_conflicting_framebuffers - remove firmwar=
e-configured framebuffers
>>>>     * @a: memory range, users of which are to be removed
>>>> @@ -20,6 +42,11 @@ static inline int
>>>>    drm_fb_helper_remove_conflicting_framebuffers(struct apertures_st=
ruct *a,
>>>>    					      const char *name, bool primary)
>>>>    {
>>>> +	int i;
>>>> +
>>>> +	for (i =3D 0; i < a->count; ++i)
>>>> +		drm_aperture_detach_drivers(a->ranges[i].base, a->ranges[i].size)=
;
>>>> +
>>>>    #if IS_REACHABLE(CONFIG_FB)
>>>>    	return remove_conflicting_framebuffers(a, name, primary);
>>>>    #else
>>>> @@ -43,7 +70,16 @@ static inline int
>>>>    drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev =
*pdev,
>>>>    						  const char *name)
>>>>    {
>>>> -	int ret =3D 0;
>>>> +	resource_size_t base, size;
>>>> +	int bar, ret =3D 0;
>>>> +
>>>> +	for (bar =3D 0; bar < PCI_STD_NUM_BARS; bar++) {
>>>> +		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
>>>> +			continue;
>>>> +		base =3D pci_resource_start(pdev, bar);
>>>> +		size =3D pci_resource_len(pdev, bar);
>>>> +		drm_aperture_detach_drivers(base, size);
>>>> +	}
>>>>    	/*
>>>>    	 * WARNING: Apparently we must kick fbdev drivers before vgacon,=

>>>> --=20
>>>> 2.30.1
>>>>
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


--RJ1gBV9Rlw7n79Ob1iRBnoaQcKY9t5gh5--

--EdLMrFfd2iTxNEnPUZeSbSHRqch54MIOc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmB345QFAwAAAAAACgkQlh/E3EQov+CV
hxAAikvt8fzgXMGUr0QoEM+uYAsY+sS5h+wxzAbZ2ovPvaMKJjrFxIrqPukTUtxCkr2POgNVPUSV
xkaYEm0cSxIcKZKDPYjNYn13OFM3rwpjyxn37w3NgwmjKg/NR/OQ4P+WeD0T78DLXqc4P2rKiMnJ
rrM93p5cj4vzYz/4EW2dOvShcPxHDzyz0SXxFW04hF+uw/OMEMoDVDHHQUY59XiMZXJjonApMJaA
6gyyZUFUlkpk4SX8mBs7DBAsEr4pgzopwcpamXZo7Mq80rLUNGYeFpG8mRBz12EA6w5oTsXYi5Fq
tZkkyuTJuhqdWMp0njYyQ73+DzB65b+lBAknOn8Dkh9VxmEONDGP8r+xn2SVTwW0idmuEy0oDXNy
+oCv5hUpKU0yosIsO7uvsJwnQmjRJQBYuDSqjkw2LG+EwiFD2TrMYU48XuiAvV2oaFeoBu2AlLd0
v/k/kAkyNJVRb+tF9jDwmEK+00YnmHbSueFohxhofqH4AxFX3cYlaO4YO/70d88wKiVqPVTKUyoJ
rIlZ4ezVqFJgkdFF9AXZSH5aqhIjAPQ9hwBGRf8pwxC2pajkKaHL9TkVSy0W8f+NHID2+cTMl87e
PcPBVTStXkmWs5XKhKVJLemq0enjKZ5H9lbyyPMesTKkeGfkneS7wpv/WAXNJ41LfiKTkcvSz5Es
2/0=
=sv77
-----END PGP SIGNATURE-----

--EdLMrFfd2iTxNEnPUZeSbSHRqch54MIOc--

--===============0740207395==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0740207395==--
