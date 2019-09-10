Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD58AED41
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 16:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10156E0FE;
	Tue, 10 Sep 2019 14:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCBD6E0FC
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 14:38:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 86DF5B703;
 Tue, 10 Sep 2019 14:38:54 +0000 (UTC)
Subject: Re: [PATCH 2/2] drm/mgag200: Add vblank support
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20190909140633.31260-1-tzimmermann@suse.de>
 <20190909140633.31260-3-tzimmermann@suse.de>
 <20190910140103.GQ7482@intel.com>
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
Message-ID: <d54c35fd-7ef7-2158-dcb7-e08617707f83@suse.de>
Date: Tue, 10 Sep 2019 16:38:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910140103.GQ7482@intel.com>
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
Cc: feng.tang@intel.com, rong.a.chen@intel.com, dri-devel@lists.freedesktop.org,
 ying.huang@intel.com, airlied@redhat.com
Content-Type: multipart/mixed; boundary="===============1020538861=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1020538861==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="uBk0AjHPiL8c8BWESzmMOd4I7hJlGVLZS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uBk0AjHPiL8c8BWESzmMOd4I7hJlGVLZS
Content-Type: multipart/mixed; boundary="kJi7bqIXYUYMwBBmPgOJFI51i6Eu5bSRs";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: daniel@ffwll.ch, airlied@redhat.com, noralf@tronnes.org,
 rong.a.chen@intel.com, feng.tang@intel.com, ying.huang@intel.com,
 dri-devel@lists.freedesktop.org
Message-ID: <d54c35fd-7ef7-2158-dcb7-e08617707f83@suse.de>
Subject: Re: [PATCH 2/2] drm/mgag200: Add vblank support
References: <20190909140633.31260-1-tzimmermann@suse.de>
 <20190909140633.31260-3-tzimmermann@suse.de>
 <20190910140103.GQ7482@intel.com>
In-Reply-To: <20190910140103.GQ7482@intel.com>

--kJi7bqIXYUYMwBBmPgOJFI51i6Eu5bSRs
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

thanks for the feedback.

Am 10.09.19 um 16:01 schrieb Ville Syrj=C3=A4l=C3=A4:
> On Mon, Sep 09, 2019 at 04:06:33PM +0200, Thomas Zimmermann wrote:
>> Support for vblank requires VSYNC to signal an interrupt, which is bro=
ken
>> on Matrox chipsets.
>=20
> I don't remember there being anything wrong with the vsync interrupt.
> What makes you think it's broken?

I tested vsync with the same code as in this patch, with extra spin
locks to protect against concurrent register access (vsync uses crtc11h).=


A few things constantly went wrong: I never received it when setting
linecomp to vdisplay. However it fired when linecomp was ~0. Then I
regularly missed the first interrupt (but only the first), and
occasionally my test system crashed when I entered commands on the
serial terminal. The vsync irq is maybe not entirely broken, but appears
to be much harder to get right.

>> The workaround that is used here and in other free
>> Matrox drivers is to program <linecomp> to the value of <vdisplay> and=

>> enable the VLINE interrupt. This triggers an interrupt at the same tim=
e
>> when VSYNC begins.
>=20
> You're programming it to fire at start of vblank, not start of vsync.

Ah, sorry for messing up terminology; will be fixed. No matter what's
wrong with the vsync irq: there's no vblank irq, so using linecomp
should be the way to go in any case.

>=20
>>
>> VLINE uses separate registers for enabling and clearing pending interr=
upts.
>> No extra syncronization between irq handler and the rest of the driver=
 is
>> required.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/mgag200/mgag200_drv.c  |  1 +
>>  drivers/gpu/drm/mgag200/mgag200_drv.h  |  1 +
>>  drivers/gpu/drm/mgag200/mgag200_main.c | 33 ++++++++++++++++++++
>>  drivers/gpu/drm/mgag200/mgag200_mode.c | 42 +++++++++++++++++++++++--=
-
>>  4 files changed, 73 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/m=
gag200/mgag200_drv.c
>> index 4f9df3b93598..cff265973154 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
>> @@ -67,6 +67,7 @@ static struct drm_driver driver =3D {
>>  	.driver_features =3D DRIVER_GEM | DRIVER_MODESET,
>>  	.load =3D mgag200_driver_load,
>>  	.unload =3D mgag200_driver_unload,
>> +	.irq_handler =3D mgag200_irq_handler,
>>  	.fops =3D &mgag200_driver_fops,
>>  	.name =3D DRIVER_NAME,
>>  	.desc =3D DRIVER_DESC,
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/m=
gag200/mgag200_drv.h
>> index 1c93f8dc08c7..88cf256d135f 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
>> @@ -195,6 +195,7 @@ void mgag200_modeset_fini(struct mga_device *mdev)=
;
>>  				/* mgag200_main.c */
>>  int mgag200_driver_load(struct drm_device *dev, unsigned long flags);=

>>  void mgag200_driver_unload(struct drm_device *dev);
>> +irqreturn_t mgag200_irq_handler(int irq, void *arg);
>> =20
>>  				/* mgag200_i2c.c */
>>  struct mga_i2c_chan *mgag200_i2c_create(struct drm_device *dev);
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/=
mgag200/mgag200_main.c
>> index a9773334dedf..5941607796e8 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
>> @@ -10,7 +10,9 @@
>> =20
>>  #include <drm/drm_crtc_helper.h>
>>  #include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_irq.h>
>>  #include <drm/drm_pci.h>
>> +#include <drm/drm_vblank.h>
>> =20
>>  #include "mgag200_drv.h"
>> =20
>> @@ -186,10 +188,18 @@ int mgag200_driver_load(struct drm_device *dev, =
unsigned long flags)
>>  	}
>>  	mdev->cursor.pixels_current =3D NULL;
>> =20
>> +	r =3D drm_vblank_init(dev, 1);
>> +	if (r)
>> +		goto err_modeset;
>> +
>>  	r =3D drm_fbdev_generic_setup(mdev->dev, 0);
>>  	if (r)
>>  		goto err_modeset;
>> =20
>> +	r =3D drm_irq_install(dev, dev->pdev->irq);
>> +	if (r)
>> +		goto err_modeset;
>> +
>>  	return 0;
>> =20
>>  err_modeset:
>> @@ -207,8 +217,31 @@ void mgag200_driver_unload(struct drm_device *dev=
)
>> =20
>>  	if (mdev =3D=3D NULL)
>>  		return;
>> +	drm_irq_uninstall(dev);
>>  	mgag200_modeset_fini(mdev);
>>  	drm_mode_config_cleanup(dev);
>>  	mgag200_mm_fini(mdev);
>>  	dev->dev_private =3D NULL;
>>  }
>> +
>> +irqreturn_t mgag200_irq_handler(int irq, void *arg)
>> +{
>> +	struct drm_device *dev =3D arg;
>> +	struct mga_device *mdev =3D dev->dev_private;
>> +	struct drm_crtc *crtc;
>> +	u32 status, iclear;
>> +
>> +	status =3D RREG32(0x1e14);
>> +
>> +	if (status & 0x00000020) { /* test <vlinepen> */
>> +		drm_for_each_crtc(crtc, dev) {
>> +			drm_crtc_handle_vblank(crtc);
>> +		}
>=20
> A bit odd way to write that but as long this driver doesn't support
> crtc2 it should be fine.
>=20
>> +		iclear =3D RREG32(0x1e18);
>> +		iclear |=3D 0x00000020; /* set <vlineiclr> */
>> +		WREG32(0x1e18, iclear);
>> +		return IRQ_HANDLED;
>> +	}
>> +
>> +	return IRQ_NONE;
>> +};
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/=
mgag200/mgag200_mode.c
>> index 5e778b5f1a10..ffe5f15d0a7d 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> @@ -905,6 +905,7 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc=
,
>>  	const struct drm_framebuffer *fb =3D crtc->primary->fb;
>>  	int hdisplay, hsyncstart, hsyncend, htotal;
>>  	int vdisplay, vsyncstart, vsyncend, vtotal;
>> +	int linecomp;
>>  	int pitch;
>>  	int option =3D 0, option2 =3D 0;
>>  	int i;
>> @@ -1042,6 +1043,13 @@ static int mga_crtc_mode_set(struct drm_crtc *c=
rtc,
>>  	vsyncend =3D mode->vsync_end - 1;
>>  	vtotal =3D mode->vtotal - 2;
>> =20
>> +	/* The VSYNC interrupt is broken on Matrox chipsets. We use
>> +	 * the VLINE interrupt instead. It triggers when the current
>> +	 * linecomp has been reached. Therefore keep <linecomp> in
>> +	 * sync with <vdisplay>.
>> +	 */
>> +	linecomp =3D vdisplay;
>=20
> I have an odd recollection that you want vdisplay+1 here if you
> want the interrupt to fire at the correct time.
>=20
> Sine linecomp also resets the memory address counter to 0 you
> should probably see one bogus line at the bottom of the screen
> if my recollection of that +1 is correct.

It works reliably on my test system, but I'll double-check against
existing drivers.

> But maybe my memory is wrong.
>=20
>> +
>>  	WREG_GFX(0, 0);
>>  	WREG_GFX(1, 0);
>>  	WREG_GFX(2, 0);
>> @@ -1063,12 +1071,12 @@ static int mga_crtc_mode_set(struct drm_crtc *=
crtc,
>>  		 ((vdisplay & 0x100) >> 7) |
>>  		 ((vsyncstart & 0x100) >> 6) |
>>  		 ((vdisplay & 0x100) >> 5) |
>> -		 ((vdisplay & 0x100) >> 4) | /* linecomp */
>> +		 ((linecomp & 0x100) >> 4) |
>>  		 ((vtotal & 0x200) >> 4)|
>>  		 ((vdisplay & 0x200) >> 3) |
>>  		 ((vsyncstart & 0x200) >> 2));
>>  	WREG_CRT(9, ((vdisplay & 0x200) >> 4) |
>> -		 ((vdisplay & 0x200) >> 3));
>> +		 ((linecomp & 0x200) >> 3));
>>  	WREG_CRT(10, 0);
>>  	WREG_CRT(11, 0);
>>  	WREG_CRT(12, 0);
>> @@ -1083,7 +1091,7 @@ static int mga_crtc_mode_set(struct drm_crtc *cr=
tc,
>>  	WREG_CRT(21, vdisplay & 0xFF);
>>  	WREG_CRT(22, (vtotal + 1) & 0xFF);
>>  	WREG_CRT(23, 0xc3);
>> -	WREG_CRT(24, vdisplay & 0xFF);
>> +	WREG_CRT(24, linecomp & 0xff);
>> =20
>>  	ext_vga[0] =3D 0;
>>  	ext_vga[5] =3D 0;
>> @@ -1099,7 +1107,7 @@ static int mga_crtc_mode_set(struct drm_crtc *cr=
tc,
>>  		((vdisplay & 0x400) >> 8) |
>>  		((vdisplay & 0xc00) >> 7) |
>>  		((vsyncstart & 0xc00) >> 5) |
>> -		((vdisplay & 0x400) >> 3);
>> +		((linecomp & 0x400) >> 3);
>>  	if (fb->format->cpp[0] * 8 =3D=3D 24)
>>  		ext_vga[3] =3D (((1 << bppshift) * 3) - 1) | 0x80;
>>  	else
>> @@ -1411,6 +1419,30 @@ static void mga_crtc_disable(struct drm_crtc *c=
rtc)
>>  	crtc->primary->fb =3D NULL;
>>  }
>> =20
>> +static int mga_crtc_enable_vblank(struct drm_crtc *crtc)
>> +{
>> +	struct drm_device *dev =3D crtc->dev;
>> +	struct mga_device *mdev =3D dev->dev_private;
>> +	u32 ien;
>> +
>> +	ien =3D RREG32(0x1e1c);
>=20
> MGAREG_IEN?

I'll go through the changes and use constants everywhere.

Best regards
Thomas

>> +	ien |=3D 0x00000020; /* set <vlineien> */
>> +	WREG32(0x1e1c, ien);
>> +
>> +	return 0;
>> +}
>> +
>> +static void mga_crtc_disable_vblank(struct drm_crtc *crtc)
>> +{
>> +	struct drm_device *dev =3D crtc->dev;
>> +	struct mga_device *mdev =3D dev->dev_private;
>> +	u32 ien;
>> +
>> +	ien =3D RREG32(0x1e1c);
>> +	ien &=3D 0xffffffdf; /* clear <vlineien> */
>> +	WREG32(0x1e1c, ien);
>> +}
>> +
>>  /* These provide the minimum set of functions required to handle a CR=
TC */
>>  static const struct drm_crtc_funcs mga_crtc_funcs =3D {
>>  	.cursor_set =3D mga_crtc_cursor_set,
>> @@ -1418,6 +1450,8 @@ static const struct drm_crtc_funcs mga_crtc_func=
s =3D {
>>  	.gamma_set =3D mga_crtc_gamma_set,
>>  	.set_config =3D drm_crtc_helper_set_config,
>>  	.destroy =3D mga_crtc_destroy,
>> +	.enable_vblank =3D mga_crtc_enable_vblank,
>> +	.disable_vblank =3D mga_crtc_disable_vblank,
>>  };
>> =20
>>  static const struct drm_crtc_helper_funcs mga_helper_funcs =3D {
>> --=20
>> 2.23.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--kJi7bqIXYUYMwBBmPgOJFI51i6Eu5bSRs--

--uBk0AjHPiL8c8BWESzmMOd4I7hJlGVLZS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl13tXoACgkQaA3BHVML
eiMhnggAlVcrdDaUVCiQUuLkHynge1ShaTS7zyASfuK009f3c5Gh2lHVT/dV7cs5
+OzOw2pkG239HPA1LwFO1hGuWxBBr5WHmCwhRDCWJZd90QhWvN832XTGeSQkVNlC
K/bGYa28KmHq2vaXfgNhElumDZEn9fF1IQvKgpqwnMcWtts5Vdinpy10j1TCXtej
ozZEygVNrCk6e/1kx+nxt3Yr9EjPAE5lUlpAmOVyFMqMGyfh6/32XP5ffQ0RaTaH
w96vXgPYdL40GzbhjKEB38EV/Yn0xQaqiJp1bCwtuMLw2ihqIHvLbwrqMmopebTy
HNsghRvmTLys+NNk+qsEN4vvzBJlog==
=mQSI
-----END PGP SIGNATURE-----

--uBk0AjHPiL8c8BWESzmMOd4I7hJlGVLZS--

--===============1020538861==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1020538861==--
