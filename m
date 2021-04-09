Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 636FB359606
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 09:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D456E466;
	Fri,  9 Apr 2021 07:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9104C6E466
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 07:06:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C8122AE56;
 Fri,  9 Apr 2021 07:06:57 +0000 (UTC)
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <20210318102921.21536-5-tzimmermann@suse.de>
 <YG7RgQfj0yZHbL6L@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 04/10] drm/aperture: Add infrastructure for aperture
 ownership
Message-ID: <a787dde9-70b0-cb38-f2bf-6e7b479525f9@suse.de>
Date: Fri, 9 Apr 2021 09:06:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YG7RgQfj0yZHbL6L@phenom.ffwll.local>
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
Content-Type: multipart/mixed; boundary="===============0135794968=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0135794968==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xIChLMcBZOV9r9hXXdymtcyvHLRjJgVb2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xIChLMcBZOV9r9hXXdymtcyvHLRjJgVb2
Content-Type: multipart/mixed; boundary="uSY4ZNw8KzGrZZVq4oAdXrWlIdEO65R7b";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 kraxel@redhat.com, corbet@lwn.net, lgirdwood@gmail.com, broonie@kernel.org,
 sam@ravnborg.org, robh@kernel.org, emil.l.velikov@gmail.com,
 geert+renesas@glider.be, hdegoede@redhat.com,
 bluescreen_avenger@verizon.net, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, virtualization@lists.linux-foundation.org
Message-ID: <a787dde9-70b0-cb38-f2bf-6e7b479525f9@suse.de>
Subject: Re: [PATCH v2 04/10] drm/aperture: Add infrastructure for aperture
 ownership
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <20210318102921.21536-5-tzimmermann@suse.de>
 <YG7RgQfj0yZHbL6L@phenom.ffwll.local>
In-Reply-To: <YG7RgQfj0yZHbL6L@phenom.ffwll.local>

--uSY4ZNw8KzGrZZVq4oAdXrWlIdEO65R7b
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.04.21 um 11:48 schrieb Daniel Vetter:
>=20
> Maybe just me, but to avoid overstretching the attention spawn of doc
> readers I'd avoid this example here. And maybe make the recommendation
> stronger, e.g. "PCI device drivers can avoid open-coding
> remove_conflicting_framebuffers() by calling
> drm_fb_helper_remove_conflicting_pci_framebuffers()."

It's a tutorial. In my expectation, everyone just copies the tutorial=20
code and fills the gaps.

>=20
>> + *
>> + * .. code-block:: c
>> + *
>> + *	static int probe(struct pci_dev *pdev)
>> + *	{
>> + *		int ret;
>> + *
>> + *		// Remove any generic drivers...
>> + *		ret =3D drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "=
example driver");
>> + *		if (ret)
>> + *			return ret;
>> + *
>> + *		// ... and initialize the hardware.
>> + *		...
>> + *
>> + *		drm_dev_register();
>> + *
>> + *		return 0;
>> + *	}
>> + *
>> + * Drivers that are susceptible to being removed be other drivers, su=
ch as
>> + * generic EFI or VESA drivers, have to register themselves as owners=
 of their
>> + * given framebuffer memory. Ownership of the framebuffer memory is a=
chived
>> + * by calling devm_aperture_acquire(). On success, the driver is the =
owner
>> + * of the framebuffer range. The function fails if the framebuffer is=
 already
>> + * by another driver. See below for an example.
>> + *
>> + * .. code-block:: c
>> + *
>> + *	static struct drm_aperture_funcs ap_funcs =3D {
>> + *		.detach =3D ...
>=20
> Is there really value in allowing/forcing drivers to set up their own
> detach ops? You already make this specific to struct drm_device, an
> implementation that just calls drm_dev_unplug feels like the right thin=
g
> to do?

Is it that easy? simepldrm's detach function has code to synchronize=20
with concurrent hotplug removals. If we can use drm_dev_unplug() for=20
everything, I'm all for it.

Best regards
Thomas

>=20
> Or maybe we should tie this more into the struct device mode and force =
an
> unload that way? That way devm cleanup would work as one expects, and
> avoid the need for anything specific (hopefully) in this detach callbac=
k.
>=20
> Just feels a bit like we're reinventing half of the driver model here,
> badly.
>=20
>> + *	};
>> + *
>> + *	static int acquire_framebuffers(struct drm_device *dev, struct pci=
_dev *pdev)
>> + *	{
>> + *		resource_size_t start, len;
>> + *		struct drm_aperture *ap;
>> + *
>> + *		base =3D pci_resource_start(pdev, 0);
>> + *		size =3D pci_resource_len(pdev, 0);
>> + *
>> + *		ap =3D devm_acquire_aperture(dev, base, size, &ap_funcs);
>> + *		if (IS_ERR(ap))
>> + *			return PTR_ERR(ap);
>> + *
>> + *		return 0;
>> + *	}
>> + *
>> + *	static int probe(struct pci_dev *pdev)
>> + *	{
>> + *		struct drm_device *dev;
>> + *		int ret;
>> + *
>> + *		// ... Initialize the device...
>> + *		dev =3D devm_drm_dev_alloc();
>> + *		...
>> + *
>> + *		// ... and acquire ownership of the framebuffer.
>> + *		ret =3D acquire_framebuffers(dev, pdev);
>> + *		if (ret)
>> + *			return ret;
>> + *
>> + *		drm_dev_register();
>> + *
>> + *		return 0;
>> + *	}
>> + *
>> + * The generic driver is now subject to forced removal by other drive=
rs. This
>> + * is when the detach function in struct &drm_aperture_funcs comes in=
to play.
>> + * When a driver calls drm_fb_helper_remove_conflicting_framebuffers(=
) et al
>> + * for the registered framebuffer range, the DRM core calls struct
>> + * &drm_aperture_funcs.detach and the generic driver has to onload it=
self. It
>> + * may not access the device's registers, framebuffer memory, ROM, et=
c after
>> + * detach returned. If the driver supports hotplugging, detach can be=
 treated
>> + * like an unplug event.
>> + *
>> + * .. code-block:: c
>> + *
>> + *	static void detach_from_device(struct drm_device *dev,
>> + *				       resource_size_t base,
>> + *				       resource_size_t size)
>> + *	{
>> + *		// Signal unplug
>> + *		drm_dev_unplug(dev);
>> + *
>> + *		// Maybe do other clean-up operations
>> + *		...
>> + *	}
>> + *
>> + *	static struct drm_aperture_funcs ap_funcs =3D {
>> + *		.detach =3D detach_from_device,
>> + *	};
>> + */
>> +
>> +/**
>> + * struct drm_aperture - Represents a DRM framebuffer aperture
>> + *
>> + * This structure has no public fields.
>> + */
>> +struct drm_aperture {
>> +	struct drm_device *dev;
>> +	resource_size_t base;
>> +	resource_size_t size;
>> +
>> +	const struct drm_aperture_funcs *funcs;
>> +
>> +	struct list_head lh;
>> +};
>> +
>> +static LIST_HEAD(drm_apertures);
>> +
>> +static DEFINE_MUTEX(drm_apertures_lock);
>> +
>> +static bool overlap(resource_size_t base1, resource_size_t end1,
>> +		    resource_size_t base2, resource_size_t end2)
>> +{
>> +	return (base1 < end2) && (end1 > base2);
>> +}
>> +
>> +static void devm_aperture_acquire_release(void *data)
>> +{
>> +	struct drm_aperture *ap =3D data;
>> +	bool detached =3D !ap->dev;
>> +
>> +	if (!detached)
>=20
> Uh this needs a comment that if ap->dev is NULL then we're called from
> drm_aperture_detach_drivers() and hence the lock is already held.
>=20
>> +		mutex_lock(&drm_apertures_lock);
>=20
> and an
>=20
> 	else
> 		locdep_assert_held(&drm_apertures_lock);
>=20
> here to check that. I was scratching my head first quite a bit how you'=
d
> solve the deadlock, this is a neat solution (much simpler than anything=
 I
> came up with in my head). But needs comments.
>=20
>> +
>> +	list_del(&ap->lh);
>> +
>> +	if (!detached)
>> +		mutex_unlock(&drm_apertures_lock);
>> +}
>> +
>> +/**
>> + * devm_aperture_acquire - Acquires ownership of a framebuffer on beh=
alf of a DRM driver.
>> + * @dev:	the DRM device to own the framebuffer memory
>> + * @base:	the framebuffer's byte offset in physical memory
>> + * @size:	the framebuffer size in bytes
>> + * @funcs:	callback functions
>> + *
>> + * Installs the given device as the new owner. The function fails if =
the
>> + * framebuffer range, or parts of it, is currently owned by another d=
river.
>> + * To evict current owners, callers should use
>> + * drm_fb_helper_remove_conflicting_framebuffers() et al. before call=
ing this
>> + * function. Acquired apertures are released automatically if the und=
erlying
>> + * device goes away.
>> + *
>> + * Returns:
>> + * An instance of struct &drm_aperture on success, or a pointer-encod=
ed
>> + * errno value otherwise.
>> + */
>> +struct drm_aperture *
>> +devm_aperture_acquire(struct drm_device *dev,
>> +		      resource_size_t base, resource_size_t size,
>> +		      const struct drm_aperture_funcs *funcs)
>> +{
>> +	size_t end =3D base + size;
>> +	struct list_head *pos;
>> +	struct drm_aperture *ap;
>> +	int ret;
>> +
>> +	mutex_lock(&drm_apertures_lock);
>> +
>> +	list_for_each(pos, &drm_apertures) {
>> +		ap =3D container_of(pos, struct drm_aperture, lh);
>> +		if (overlap(base, end, ap->base, ap->base + ap->size))
>> +			return ERR_PTR(-EBUSY);
>> +	}
>> +
>> +	ap =3D devm_kzalloc(dev->dev, sizeof(*ap), GFP_KERNEL);
>> +	if (!ap)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	ap->dev =3D dev;
>> +	ap->base =3D base;
>> +	ap->size =3D size;
>> +	ap->funcs =3D funcs;
>> +	INIT_LIST_HEAD(&ap->lh);
>> +
>> +	list_add(&ap->lh, &drm_apertures);
>> +
>> +	mutex_unlock(&drm_apertures_lock);
>> +
>> +	ret =3D devm_add_action_or_reset(dev->dev, devm_aperture_acquire_rel=
ease, ap);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	return ap;
>> +}
>> +EXPORT_SYMBOL(devm_aperture_acquire);
>> +
>> +void drm_aperture_detach_drivers(resource_size_t base, resource_size_=
t size)
>> +{
>> +	resource_size_t end =3D base + size;
>> +	struct list_head *pos, *n;
>> +
>> +	mutex_lock(&drm_apertures_lock);
>> +
>> +	list_for_each_safe(pos, n, &drm_apertures) {
>> +		struct drm_aperture *ap =3D
>> +			container_of(pos, struct drm_aperture, lh);
>> +		struct drm_device *dev =3D ap->dev;
>> +
>> +		if (!overlap(base, end, ap->base, ap->base + ap->size))
>> +			continue;
>> +
>> +		ap->dev =3D NULL; /* detach from device */
>> +		if (drm_WARN_ON(dev, !ap->funcs->detach))
>> +			continue;
>> +		ap->funcs->detach(dev, ap->base, ap->size);
>> +	}
>> +
>> +	mutex_unlock(&drm_apertures_lock);
>> +}
>> +EXPORT_SYMBOL(drm_aperture_detach_drivers);
>=20
> Is this just exported because of the inline functions in the headers? I=
mo
> better to make them proper functions (they're big after your patch&not
> perf critical, so not good candidates for inlining anyway).
>=20
>> diff --git a/include/drm/drm_aperture.h b/include/drm/drm_aperture.h
>> index 13766efe9517..696cec75ef78 100644
>> --- a/include/drm/drm_aperture.h
>> +++ b/include/drm/drm_aperture.h
>> @@ -4,8 +4,30 @@
>>   #define _DRM_APERTURE_H_
>>  =20
>>   #include <linux/fb.h>
>> +#include <linux/pci.h>
>>   #include <linux/vgaarb.h>
>>  =20
>> +struct drm_aperture;
>> +struct drm_device;
>> +
>> +struct drm_aperture_funcs {
>> +	void (*detach)(struct drm_device *dev, resource_size_t base, resourc=
e_size_t size);
>> +};
>> +
>> +struct drm_aperture *
>> +devm_aperture_acquire(struct drm_device *dev,
>> +		      resource_size_t base, resource_size_t size,
>> +		      const struct drm_aperture_funcs *funcs);
>> +
>> +#if defined(CONFIG_DRM_APERTURE)
>> +void drm_aperture_detach_drivers(resource_size_t base, resource_size_=
t size);
>> +#else
>> +static inline void
>> +drm_aperture_detach_drivers(resource_size_t base, resource_size_t siz=
e)
>> +{
>> +}
>> +#endif
>> +
>>   /**
>>    * drm_fb_helper_remove_conflicting_framebuffers - remove firmware-c=
onfigured framebuffers
>>    * @a: memory range, users of which are to be removed
>> @@ -20,6 +42,11 @@ static inline int
>>   drm_fb_helper_remove_conflicting_framebuffers(struct apertures_struc=
t *a,
>>   					      const char *name, bool primary)
>>   {
>> +	int i;
>> +
>> +	for (i =3D 0; i < a->count; ++i)
>> +		drm_aperture_detach_drivers(a->ranges[i].base, a->ranges[i].size);
>> +
>>   #if IS_REACHABLE(CONFIG_FB)
>>   	return remove_conflicting_framebuffers(a, name, primary);
>>   #else
>> @@ -43,7 +70,16 @@ static inline int
>>   drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pd=
ev,
>>   						  const char *name)
>>   {
>> -	int ret =3D 0;
>> +	resource_size_t base, size;
>> +	int bar, ret =3D 0;
>> +
>> +	for (bar =3D 0; bar < PCI_STD_NUM_BARS; bar++) {
>> +		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
>> +			continue;
>> +		base =3D pci_resource_start(pdev, bar);
>> +		size =3D pci_resource_len(pdev, bar);
>> +		drm_aperture_detach_drivers(base, size);
>> +	}
>>  =20
>>   	/*
>>   	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
>> --=20
>> 2.30.1
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--uSY4ZNw8KzGrZZVq4oAdXrWlIdEO65R7b--

--xIChLMcBZOV9r9hXXdymtcyvHLRjJgVb2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBv/RAFAwAAAAAACgkQlh/E3EQov+Dd
Sw/+NZBvdghrzPJYl6qcc9lsrdPODHnVq8EJg/k3QT9SQPOciXUjmpaAWHDOoIpI2sTQrgNcwoTl
wCP/VGdCdg2vubgs7n6KNeOCReThTVC3SeauoaC1scBGhrnbciThy3t4yu0WNnIkM88Rt10slIZo
lJ8Ei4+jYDRqBE+bSHvObGqA3UQJd2YGB63g2SeGjec/nbCiYcUBnWqtz/pqvUCKHjDn0hfh94W6
3Z/OMj4K7XRzkPB0ChSBr3k73MRRXonXG8pfzKYS1cPGnCHXDkC4whRNYX+FB4wB/7kMT85VgJ6s
t8EosOku17xp8fHLEJhD0o6mGmoQt3yc55l7EEJppNHri/NS4gLPauUopgUfalIXJcuXJaRACiG/
wjmzX8+uiNEQOYPux6X+EibDugt5lGo4Fjx/X95ROUbg7R5pq6uIHlqOkiWoerK8dJPyNX6AobIk
gkxeTfEZvsIzkxMucG9B8Nv38gmvSeuPB+qe92c/2K92RzjgmMBt1deMdT510ypiWU5TmkEvbF03
q2mLaOB3O1TbJXYnQZVJ88O9lUR5OUiVDR0XD1lbYeMm7HQO6I94PW26XkjmbtE9qzZkAfO04+zr
1RQsxCtbLy26xgGPpay0VqL86UiZaPbiBNetQRvAMAl1qerDcj6qJM6gbLQDRTli+c54H3aDL0UL
y5I=
=aEk5
-----END PGP SIGNATURE-----

--xIChLMcBZOV9r9hXXdymtcyvHLRjJgVb2--

--===============0135794968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0135794968==--
