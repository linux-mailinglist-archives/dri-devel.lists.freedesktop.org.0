Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F6EB0767
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 06:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEDD6E153;
	Thu, 12 Sep 2019 04:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162D36E314
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 17:31:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8D01BB674;
 Wed, 11 Sep 2019 17:31:14 +0000 (UTC)
Subject: Re: [PATCH 2/2] drm/mgag200: Add vblank support
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20190909140633.31260-1-tzimmermann@suse.de>
 <20190909140633.31260-3-tzimmermann@suse.de>
 <20190910140103.GQ7482@intel.com>
 <37ca4ba3-6152-73c0-667b-e92556d351e2@suse.de>
 <20190911152103.GC7482@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNKFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwJQEEwEIAD4W
 IQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznTtgIbAwUJA8JnAAULCQgHAgYVCgkICwIEFgID
 AQIeAQIXgAAKCRBoDcEdUwt6I7D7CACBK42XW+7mCiK8ioXMEy1NzGbXC51RzGea8N83oEJS
 1KVUtQxrkDxgrW/WLSl/TfqHFsJpdEFOv1XubWbleun3uKPy0e5vZCd5UjZPkeNjnqfCYTDy
 hVVsdOuFbtWDppJyJrThLqr9AgSFmoCNNUt1SVpYEEOLNE6C32BhlnSq21VLC+YXTgO/ZHTa
 YXkq54hHj63jwrcjkBSCkXLh37kHeqnl++GHpN+3R+o3w2OpwHAlvVjdKPT27v1tVkiydsFG
 65Vd0n3m/ft+IOrGgxQM1C20uqKvsZGB4r3OGR50ekAybO7sjEJJ1Obl4ge/6RRqcvKz4LMb
 tGs85D6tPIeFzsBNBFs50uABCADGJj+DP1fk+UWOWrf4O61HTbC4Vr9QD2K4fUUHnzg2B6zU
 R1BPXqLGG0+lzK8kfYU/F5RjmEcClsIkAaFkg4kzKP14tvY1J5+AV3yNqcdg018HNtiyrSwI
 E0Yz/qm1Ot2NMZ0DdvVBg22IMsiudQ1tx9CH9mtyTbIXgACvl3PW2o9CxiHPE/bohFhwZwh/
 kXYYAE51lhinQ3oFEeQZA3w4OTvxSEspiQR8dg8qJJb+YOAc5IKk6sJmmM7JfFMWSr22satM
 23oQ3WvJb4RV6HTRTAIEyyZS7g2DhiytgMG60t0qdABG5KXSQW+OKlZRpuWwKWaLh3if/p/u
 69dvpanbABEBAAHCwHwEGAEIACYWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznS4AIbDAUJ
 A8JnAAAKCRBoDcEdUwt6I6X3CACJ8D+TpXBCqJE5xwog08+Dp8uBpx0T9n1wE0GQisZruACW
 NofYn8PTX9k4wmegDLwt7YQDdKxQ4+eTfZeLNQqWg6OCftH5Kx7sjWnJ09tOgniVdROzWJ7c
 VJ/i0okazncsJ+nq48UYvRGE1Swh3A4QRIyphWX4OADOBmTFl9ZYNPnh23eaC9WrNvFr7yP7
 iGjMlfEW8l6Lda//EC5VpXVNza0xeae0zFNst2R9pn+bLkihwDLWxOIyifGRxTqNxoS4I1aw
 VhxPSVztPMSpIA/sOr/N/p6JrBLn+gui2K6mP7bGb8hF+szfArYqz3T1rv1VzUWAJf5Wre5U
 iNx9uqqx
Message-ID: <8d46af64-a88c-272a-090f-91483b3c0b86@suse.de>
Date: Wed, 11 Sep 2019 19:31:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190911152103.GC7482@intel.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: airlied@redhat.com, feng.tang@intel.com, ying.huang@intel.com,
 dri-devel@lists.freedesktop.org, rong.a.chen@intel.com
Content-Type: multipart/mixed; boundary="===============0653476200=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0653476200==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vfWsybdcR3rszvm53smcfBfY5fEpYa9Ni"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vfWsybdcR3rszvm53smcfBfY5fEpYa9Ni
Content-Type: multipart/mixed; boundary="QI10Lrl5UZ7YZq3dhYLCmw5LJnwFQNroM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: feng.tang@intel.com, rong.a.chen@intel.com,
 dri-devel@lists.freedesktop.org, ying.huang@intel.com, airlied@redhat.com
Message-ID: <8d46af64-a88c-272a-090f-91483b3c0b86@suse.de>
Subject: Re: [PATCH 2/2] drm/mgag200: Add vblank support
References: <20190909140633.31260-1-tzimmermann@suse.de>
 <20190909140633.31260-3-tzimmermann@suse.de>
 <20190910140103.GQ7482@intel.com>
 <37ca4ba3-6152-73c0-667b-e92556d351e2@suse.de>
 <20190911152103.GC7482@intel.com>
In-Reply-To: <20190911152103.GC7482@intel.com>

--QI10Lrl5UZ7YZq3dhYLCmw5LJnwFQNroM
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 11.09.19 um 17:21 schrieb Ville Syrj=C3=A4l=C3=A4:
> On Wed, Sep 11, 2019 at 05:08:45PM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 10.09.19 um 16:01 schrieb Ville Syrj=C3=A4l=C3=A4:
>>> On Mon, Sep 09, 2019 at 04:06:33PM +0200, Thomas Zimmermann wrote:
>>>> Support for vblank requires VSYNC to signal an interrupt, which is b=
roken
>>>> on Matrox chipsets.
>>>
>>> I don't remember there being anything wrong with the vsync interrupt.=

>>> What makes you think it's broken?
>>>
>>>> The workaround that is used here and in other free
>>>> Matrox drivers is to program <linecomp> to the value of <vdisplay> a=
nd
>>>> enable the VLINE interrupt. This triggers an interrupt at the same t=
ime
>>>> when VSYNC begins.
>>>
>>> You're programming it to fire at start of vblank, not start of vsync.=

>>>
>>>>
>>>> VLINE uses separate registers for enabling and clearing pending inte=
rrupts.
>>>> No extra syncronization between irq handler and the rest of the driv=
er is
>>>> required.
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> ---
>>>>  drivers/gpu/drm/mgag200/mgag200_drv.c  |  1 +
>>>>  drivers/gpu/drm/mgag200/mgag200_drv.h  |  1 +
>>>>  drivers/gpu/drm/mgag200/mgag200_main.c | 33 ++++++++++++++++++++
>>>>  drivers/gpu/drm/mgag200/mgag200_mode.c | 42 +++++++++++++++++++++++=
---
>>>>  4 files changed, 73 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm=
/mgag200/mgag200_drv.c
>>>> index 4f9df3b93598..cff265973154 100644
>>>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
>>>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
>>>> @@ -67,6 +67,7 @@ static struct drm_driver driver =3D {
>>>>  	.driver_features =3D DRIVER_GEM | DRIVER_MODESET,
>>>>  	.load =3D mgag200_driver_load,
>>>>  	.unload =3D mgag200_driver_unload,
>>>> +	.irq_handler =3D mgag200_irq_handler,
>>>>  	.fops =3D &mgag200_driver_fops,
>>>>  	.name =3D DRIVER_NAME,
>>>>  	.desc =3D DRIVER_DESC,
>>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm=
/mgag200/mgag200_drv.h
>>>> index 1c93f8dc08c7..88cf256d135f 100644
>>>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
>>>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
>>>> @@ -195,6 +195,7 @@ void mgag200_modeset_fini(struct mga_device *mde=
v);
>>>>  				/* mgag200_main.c */
>>>>  int mgag200_driver_load(struct drm_device *dev, unsigned long flags=
);
>>>>  void mgag200_driver_unload(struct drm_device *dev);
>>>> +irqreturn_t mgag200_irq_handler(int irq, void *arg);
>>>> =20
>>>>  				/* mgag200_i2c.c */
>>>>  struct mga_i2c_chan *mgag200_i2c_create(struct drm_device *dev);
>>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/dr=
m/mgag200/mgag200_main.c
>>>> index a9773334dedf..5941607796e8 100644
>>>> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
>>>> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
>>>> @@ -10,7 +10,9 @@
>>>> =20
>>>>  #include <drm/drm_crtc_helper.h>
>>>>  #include <drm/drm_gem_framebuffer_helper.h>
>>>> +#include <drm/drm_irq.h>
>>>>  #include <drm/drm_pci.h>
>>>> +#include <drm/drm_vblank.h>
>>>> =20
>>>>  #include "mgag200_drv.h"
>>>> =20
>>>> @@ -186,10 +188,18 @@ int mgag200_driver_load(struct drm_device *dev=
, unsigned long flags)
>>>>  	}
>>>>  	mdev->cursor.pixels_current =3D NULL;
>>>> =20
>>>> +	r =3D drm_vblank_init(dev, 1);
>>>> +	if (r)
>>>> +		goto err_modeset;
>>>> +
>>>>  	r =3D drm_fbdev_generic_setup(mdev->dev, 0);
>>>>  	if (r)
>>>>  		goto err_modeset;
>>>> =20
>>>> +	r =3D drm_irq_install(dev, dev->pdev->irq);
>>>> +	if (r)
>>>> +		goto err_modeset;
>>>> +
>>>>  	return 0;
>>>> =20
>>>>  err_modeset:
>>>> @@ -207,8 +217,31 @@ void mgag200_driver_unload(struct drm_device *d=
ev)
>>>> =20
>>>>  	if (mdev =3D=3D NULL)
>>>>  		return;
>>>> +	drm_irq_uninstall(dev);
>>>>  	mgag200_modeset_fini(mdev);
>>>>  	drm_mode_config_cleanup(dev);
>>>>  	mgag200_mm_fini(mdev);
>>>>  	dev->dev_private =3D NULL;
>>>>  }
>>>> +
>>>> +irqreturn_t mgag200_irq_handler(int irq, void *arg)
>>>> +{
>>>> +	struct drm_device *dev =3D arg;
>>>> +	struct mga_device *mdev =3D dev->dev_private;
>>>> +	struct drm_crtc *crtc;
>>>> +	u32 status, iclear;
>>>> +
>>>> +	status =3D RREG32(0x1e14);
>>>> +
>>>> +	if (status & 0x00000020) { /* test <vlinepen> */
>>>> +		drm_for_each_crtc(crtc, dev) {
>>>> +			drm_crtc_handle_vblank(crtc);
>>>> +		}
>>>
>>> A bit odd way to write that but as long this driver doesn't support
>>> crtc2 it should be fine.
>>>
>>>> +		iclear =3D RREG32(0x1e18);
>>>> +		iclear |=3D 0x00000020; /* set <vlineiclr> */
>>>> +		WREG32(0x1e18, iclear);
>>>> +		return IRQ_HANDLED;
>>>> +	}
>>>> +
>>>> +	return IRQ_NONE;
>>>> +};
>>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/dr=
m/mgag200/mgag200_mode.c
>>>> index 5e778b5f1a10..ffe5f15d0a7d 100644
>>>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>>>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>>>> @@ -905,6 +905,7 @@ static int mga_crtc_mode_set(struct drm_crtc *cr=
tc,
>>>>  	const struct drm_framebuffer *fb =3D crtc->primary->fb;
>>>>  	int hdisplay, hsyncstart, hsyncend, htotal;
>>>>  	int vdisplay, vsyncstart, vsyncend, vtotal;
>>>> +	int linecomp;
>>>>  	int pitch;
>>>>  	int option =3D 0, option2 =3D 0;
>>>>  	int i;
>>>> @@ -1042,6 +1043,13 @@ static int mga_crtc_mode_set(struct drm_crtc =
*crtc,
>>>>  	vsyncend =3D mode->vsync_end - 1;
>>>>  	vtotal =3D mode->vtotal - 2;
>>>> =20
>>>> +	/* The VSYNC interrupt is broken on Matrox chipsets. We use
>>>> +	 * the VLINE interrupt instead. It triggers when the current
>>>> +	 * linecomp has been reached. Therefore keep <linecomp> in
>>>> +	 * sync with <vdisplay>.
>>>> +	 */
>>>> +	linecomp =3D vdisplay;
>>>
>>> I have an odd recollection that you want vdisplay+1 here if you
>>> want the interrupt to fire at the correct time.
>>
>> I double-checked and found that vdisplay is the value originally used =
by
>> this driver, by the fbdev driver and by Xorg's mga driver.
>=20
> Sure, but what does the hardware actually want?
>=20

I set linecomp to vdisplay+1 and got a DRM warning about missing a
vblank event.

Best regards
Thomas


--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--QI10Lrl5UZ7YZq3dhYLCmw5LJnwFQNroM--

--vfWsybdcR3rszvm53smcfBfY5fEpYa9Ni
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl15L14ACgkQaA3BHVML
eiPAgggAnDdT97un+HQdOSMbqLvFjkpvnKxIq6S/3Jp7oUeDA6bW13Dms3pXOxex
K6f/uZJU6vWbnMzL7AMynDN0zpMnuvY97/kcvCYeGKpE+xuYZ+zyDDuyz4KfApDN
d+xVniU3en1eQUyt2wcv6hq+w7PRgoBYwyb/rul7YGxRBSUbgGGj/mLXO74N4WEt
+ap13Z1HEs5AYVUtQBRgFVUFChU2aPU2fwVwfXiUHRPaTH/5J2wcDuHMbluMAZU5
efAu54j9IxEsd9C7xp6mdUJ3DhCMtvlFMvfYvZqlTrbvGp1d9e4J+1UD/Z+A8XlA
in23DsGlSINn/959M4Ox+bI56Idaew==
=J7Os
-----END PGP SIGNATURE-----

--vfWsybdcR3rszvm53smcfBfY5fEpYa9Ni--

--===============0653476200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0653476200==--
