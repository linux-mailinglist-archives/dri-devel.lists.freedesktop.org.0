Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F31359612
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 09:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C935C6E479;
	Fri,  9 Apr 2021 07:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10EE6E479
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 07:09:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4F7DBB126;
 Fri,  9 Apr 2021 07:09:41 +0000 (UTC)
Subject: Re: [PATCH v2 03/10] drm/aperture: Move fbdev conflict helpers into
 drm_aperture.h
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <20210318102921.21536-4-tzimmermann@suse.de>
 <YG7R6ZkVNwrYaUWX@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <133ad936-f080-f063-b056-3c11b4d9f8d4@suse.de>
Date: Fri, 9 Apr 2021 09:09:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YG7R6ZkVNwrYaUWX@phenom.ffwll.local>
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
Content-Type: multipart/mixed; boundary="===============0864351079=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0864351079==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SfEooEkTlWBwU4yLXLYwo0Hwu4aYK44xI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SfEooEkTlWBwU4yLXLYwo0Hwu4aYK44xI
Content-Type: multipart/mixed; boundary="GFAmzOHVvtb20soidyJaaOtS1Xcm0WKBk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: bluescreen_avenger@verizon.net, geert+renesas@glider.be, corbet@lwn.net,
 airlied@linux.ie, emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, lgirdwood@gmail.com,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 broonie@kernel.org, kraxel@redhat.com, sam@ravnborg.org
Message-ID: <133ad936-f080-f063-b056-3c11b4d9f8d4@suse.de>
Subject: Re: [PATCH v2 03/10] drm/aperture: Move fbdev conflict helpers into
 drm_aperture.h
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <20210318102921.21536-4-tzimmermann@suse.de>
 <YG7R6ZkVNwrYaUWX@phenom.ffwll.local>
In-Reply-To: <YG7R6ZkVNwrYaUWX@phenom.ffwll.local>

--GFAmzOHVvtb20soidyJaaOtS1Xcm0WKBk
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.04.21 um 11:50 schrieb Daniel Vetter:
> On Thu, Mar 18, 2021 at 11:29:14AM +0100, Thomas Zimmermann wrote:
>> Fbdev's helpers for handling conflicting framebuffers are related to
>> framebuffer apertures, not console emulation. Therefore move them into=
 a
>> drm_aperture.h, which will contain the interfaces for the new aperture=

>> helpers.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Tested-by: nerdopolis <bluescreen_avenger@verizon.net>
>> ---
>>   Documentation/gpu/drm-internals.rst |  6 +++
>>   include/drm/drm_aperture.h          | 60 +++++++++++++++++++++++++++=
++
>>   include/drm/drm_fb_helper.h         | 56 ++-------------------------=

>>   3 files changed, 69 insertions(+), 53 deletions(-)
>>   create mode 100644 include/drm/drm_aperture.h
>>
>> diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/d=
rm-internals.rst
>> index 12272b168580..4c7642d2ca34 100644
>> --- a/Documentation/gpu/drm-internals.rst
>> +++ b/Documentation/gpu/drm-internals.rst
>> @@ -75,6 +75,12 @@ update it, its value is mostly useless. The DRM cor=
e prints it to the
>>   kernel log at initialization time and passes it to userspace through=
 the
>>   DRM_IOCTL_VERSION ioctl.
>>  =20
>> +Managing Ownership of the Framebuffer Aperture
>> +----------------------------------------------
>> +
>> +.. kernel-doc:: include/drm/drm_aperture.h
>> +   :internal:
>> +
>>   Device Instance and Driver Handling
>>   -----------------------------------
>>  =20
>> diff --git a/include/drm/drm_aperture.h b/include/drm/drm_aperture.h
>> new file mode 100644
>> index 000000000000..13766efe9517
>> --- /dev/null
>> +++ b/include/drm/drm_aperture.h
>> @@ -0,0 +1,60 @@
>> +/* SPDX-License-Identifier: MIT */
>> +
>> +#ifndef _DRM_APERTURE_H_
>> +#define _DRM_APERTURE_H_
>> +
>> +#include <linux/fb.h>
>> +#include <linux/vgaarb.h>
>> +
>> +/**
>> + * drm_fb_helper_remove_conflicting_framebuffers - remove firmware-co=
nfigured framebuffers
>=20
> Annoying bikeshed, but I'd give them drm_aperture_ prefixes, for ocd
> consistency. Also make them real functions, they're quite big and will
> grow more in the next patch.
>=20
> I'm also not super happy about the naming here but oh well.

The original name for this was platform helpers, which was worse. So=20
it's not like we're not improving. :)

I'll take this patch + some docs from patch 4 + your feedback and turn=20
it into a separate patchset. It should be useful even without simpledrm.

Best regards
Thomas

>=20
> Either way: Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
>> + * @a: memory range, users of which are to be removed
>> + * @name: requesting driver name
>> + * @primary: also kick vga16fb if present
>> + *
>> + * This function removes framebuffer devices (initialized by firmware=
/bootloader)
>> + * which use memory range described by @a. If @a is NULL all such dev=
ices are
>> + * removed.
>> + */
>> +static inline int
>> +drm_fb_helper_remove_conflicting_framebuffers(struct apertures_struct=
 *a,
>> +					      const char *name, bool primary)
>> +{
>> +#if IS_REACHABLE(CONFIG_FB)
>> +	return remove_conflicting_framebuffers(a, name, primary);
>> +#else
>> +	return 0;
>> +#endif
>> +}
>> +
>> +/**
>> + * drm_fb_helper_remove_conflicting_pci_framebuffers - remove firmwar=
e-configured
>> + *                                                     framebuffers f=
or PCI devices
>> + * @pdev: PCI device
>> + * @name: requesting driver name
>> + *
>> + * This function removes framebuffer devices (eg. initialized by firm=
ware)
>> + * using memory range configured for any of @pdev's memory bars.
>> + *
>> + * The function assumes that PCI device with shadowed ROM drives a pr=
imary
>> + * display and so kicks out vga16fb.
>> + */
>> +static inline int
>> +drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pde=
v,
>> +						  const char *name)
>> +{
>> +	int ret =3D 0;
>> +
>> +	/*
>> +	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
>> +	 * otherwise the vga fbdev driver falls over.
>> +	 */
>> +#if IS_REACHABLE(CONFIG_FB)
>> +	ret =3D remove_conflicting_pci_framebuffers(pdev, name);
>> +#endif
>> +	if (ret =3D=3D 0)
>> +		ret =3D vga_remove_vgacon(pdev);
>> +	return ret;
>> +}
>> +
>> +#endif
>> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h=

>> index 3b273f9ca39a..d06a3942fddb 100644
>> --- a/include/drm/drm_fb_helper.h
>> +++ b/include/drm/drm_fb_helper.h
>> @@ -30,13 +30,13 @@
>>   #ifndef DRM_FB_HELPER_H
>>   #define DRM_FB_HELPER_H
>>  =20
>> -struct drm_fb_helper;
>> -
>> +#include <drm/drm_aperture.h>
>>   #include <drm/drm_client.h>
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_device.h>
>>   #include <linux/kgdb.h>
>> -#include <linux/vgaarb.h>
>> +
>> +struct drm_fb_helper;
>>  =20
>>   enum mode_set_atomic {
>>   	LEAVE_ATOMIC_MODE_SET,
>> @@ -451,54 +451,4 @@ drm_fbdev_generic_setup(struct drm_device *dev, u=
nsigned int preferred_bpp)
>>  =20
>>   #endif
>>  =20
>> -/**
>> - * drm_fb_helper_remove_conflicting_framebuffers - remove firmware-co=
nfigured framebuffers
>> - * @a: memory range, users of which are to be removed
>> - * @name: requesting driver name
>> - * @primary: also kick vga16fb if present
>> - *
>> - * This function removes framebuffer devices (initialized by firmware=
/bootloader)
>> - * which use memory range described by @a. If @a is NULL all such dev=
ices are
>> - * removed.
>> - */
>> -static inline int
>> -drm_fb_helper_remove_conflicting_framebuffers(struct apertures_struct=
 *a,
>> -					      const char *name, bool primary)
>> -{
>> -#if IS_REACHABLE(CONFIG_FB)
>> -	return remove_conflicting_framebuffers(a, name, primary);
>> -#else
>> -	return 0;
>> -#endif
>> -}
>> -
>> -/**
>> - * drm_fb_helper_remove_conflicting_pci_framebuffers - remove firmwar=
e-configured framebuffers for PCI devices
>> - * @pdev: PCI device
>> - * @name: requesting driver name
>> - *
>> - * This function removes framebuffer devices (eg. initialized by firm=
ware)
>> - * using memory range configured for any of @pdev's memory bars.
>> - *
>> - * The function assumes that PCI device with shadowed ROM drives a pr=
imary
>> - * display and so kicks out vga16fb.
>> - */
>> -static inline int
>> -drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pde=
v,
>> -						  const char *name)
>> -{
>> -	int ret =3D 0;
>> -
>> -	/*
>> -	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
>> -	 * otherwise the vga fbdev driver falls over.
>> -	 */
>> -#if IS_REACHABLE(CONFIG_FB)
>> -	ret =3D remove_conflicting_pci_framebuffers(pdev, name);
>> -#endif
>> -	if (ret =3D=3D 0)
>> -		ret =3D vga_remove_vgacon(pdev);
>> -	return ret;
>> -}
>> -
>>   #endif
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


--GFAmzOHVvtb20soidyJaaOtS1Xcm0WKBk--

--SfEooEkTlWBwU4yLXLYwo0Hwu4aYK44xI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBv/bQFAwAAAAAACgkQlh/E3EQov+BU
8Q/+P2/+ZwUIPL7X7ikiT0UUY87D1b3yXqe+EjBSfApy0fg3MUqhLWE07DjJZmIDXfVJ/VN6envU
iaVFA7WKuG78bILxbPdw5TCZtLNR3FI5gc+lKr4MjucLV9YebXvjfaiEk+pjFkYaRxABwuYIw1p6
3LgWi9nqRBrZlUgDxT/UHLOmtwKOEUbAYIqQ39I+EZ2ZclC0pUatOo6cogc9caL+jOS5RX1HhL3g
MJHQlMTHm6cyhAElhO0CdiY959B+X8b35gZGBMvxuXvib7PptejhY3I2YEJH79BB7/s88bhZBdsy
swnVi4CasXgXxauztWIv4Ve9FWmNpMJEAPecMcMO/cbbgAIiv6IITShEXzC0zNxa6mb5tQwyPHup
qaFab5+AFlbxpmk1xovViY8ereIbbzmbQFgVC3bQdr4NS5wtGZUZ/LPVUWiWgEQAyHGrRjhNf4vM
aNrWaMhtoeDHsC6gdUvxgydCXoB0zwYWUSV+wvj1mwmRgqyVi5s3b9yIRe8EycG+rfrEl5EBghgN
NTu8qSacVF4VUToXSnOC1UtDeq1g4NqbU7n/rNkW20kkCKX4G3HsfmRqSgkuSD6tpFUKXUNgnFJu
JmTZKccPkz6a6s82sBuR1iWGt4m8sLejHphMA8DSeGsgyqTO2EoWGW+visBE3IQWRvV4moy/uMpt
1Oc=
=ADd+
-----END PGP SIGNATURE-----

--SfEooEkTlWBwU4yLXLYwo0Hwu4aYK44xI--

--===============0864351079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0864351079==--
