Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B189AE5244
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 19:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D04B6EB12;
	Fri, 25 Oct 2019 17:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CDA76EB12
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 17:27:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 97ED1AEFF;
 Fri, 25 Oct 2019 17:26:58 +0000 (UTC)
Subject: Re: [PATCH 1/2] drm/fb-helper: Remove drm_fb_helper_defio_init() and
 update docs
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, daniel@ffwll.ch
References: <20191025092759.13069-1-tzimmermann@suse.de>
 <20191025092759.13069-2-tzimmermann@suse.de>
 <3db04b4e-4b23-1edb-7df8-893ca9b5709f@tronnes.org>
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
Message-ID: <7016126a-f498-1a4a-4721-c6305a961457@suse.de>
Date: Fri, 25 Oct 2019 19:26:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <3db04b4e-4b23-1edb-7df8-893ca9b5709f@tronnes.org>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1249379756=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1249379756==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="AYiKlZawoYPsTwbJ6P0YAMaM3HbuvFvui"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--AYiKlZawoYPsTwbJ6P0YAMaM3HbuvFvui
Content-Type: multipart/mixed; boundary="WGA4SCb5j9iDTzITHkF6lPUuGePX8QVTi";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Message-ID: <7016126a-f498-1a4a-4721-c6305a961457@suse.de>
Subject: Re: [PATCH 1/2] drm/fb-helper: Remove drm_fb_helper_defio_init() and
 update docs
References: <20191025092759.13069-1-tzimmermann@suse.de>
 <20191025092759.13069-2-tzimmermann@suse.de>
 <3db04b4e-4b23-1edb-7df8-893ca9b5709f@tronnes.org>
In-Reply-To: <3db04b4e-4b23-1edb-7df8-893ca9b5709f@tronnes.org>

--WGA4SCb5j9iDTzITHkF6lPUuGePX8QVTi
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 25.10.19 um 17:46 schrieb Noralf Tr=C3=B8nnes:
>=20
>=20
> Den 25.10.2019 11.27, skrev Thomas Zimmermann:
>> There are no users of drm_fb_helper_defio_init(), so we can remove
>> it. The documenation around defio support is a bit misleading and
>> should mention compatibility issues with SHMEM helpers. Clarify this.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/drm_fb_helper.c | 61 +++++++-------------------------=
-
>>  include/drm/drm_fb_helper.h     |  1 -
>>  2 files changed, 13 insertions(+), 49 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_=
helper.c
>> index b75ae8555baf..8ebeccdeed23 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -92,9 +92,12 @@ static DEFINE_MUTEX(kernel_fb_helper_lock);
>>   *
>>   * Drivers that support a dumb buffer with a virtual address and mmap=
 support,
>>   * should try out the generic fbdev emulation using drm_fbdev_generic=
_setup().
>> + * It will automatically set up deferred I/O if the driver requires a=
 shadow
>> + * buffer.
>>   *
>> - * Setup fbdev emulation by calling drm_fb_helper_fbdev_setup() and t=
ear it
>> - * down by calling drm_fb_helper_fbdev_teardown().
>> + * For other drivers, setup fbdev emulation by calling
>> + * drm_fb_helper_fbdev_setup() and tear it down by calling
>> + * drm_fb_helper_fbdev_teardown().
>>   *
>>   * At runtime drivers should restore the fbdev console by using
>>   * drm_fb_helper_lastclose() as their &drm_driver.lastclose callback.=

>> @@ -127,8 +130,10 @@ static DEFINE_MUTEX(kernel_fb_helper_lock);
>>   * always run in process context since the fb_*() function could be r=
unning in
>>   * atomic context. If drm_fb_helper_deferred_io() is used as the defe=
rred_io
>>   * callback it will also schedule dirty_work with the damage collecte=
d from the
>> - * mmap page writes. Drivers can use drm_fb_helper_defio_init() to se=
tup
>> - * deferred I/O (coupled with drm_fb_helper_fbdev_teardown()).
>> + * mmap page writes.
>> + *
>> + * Deferred I/O is not compatible with SHMEM. Such drivers should req=
uest an
>> + * fbdev shadow buffer and call drm_fbdev_generic_setup() instead.
>>   */
>> =20
>>  static void drm_fb_helper_restore_lut_atomic(struct drm_crtc *crtc)
>> @@ -679,49 +684,6 @@ void drm_fb_helper_deferred_io(struct fb_info *in=
fo,
>>  }
>>  EXPORT_SYMBOL(drm_fb_helper_deferred_io);
>> =20
>> -/**
>> - * drm_fb_helper_defio_init - fbdev deferred I/O initialization
>> - * @fb_helper: driver-allocated fbdev helper
>> - *
>> - * This function allocates &fb_deferred_io, sets callback to
>> - * drm_fb_helper_deferred_io(), delay to 50ms and calls fb_deferred_i=
o_init().
>> - * It should be called from the &drm_fb_helper_funcs->fb_probe callba=
ck.
>> - * drm_fb_helper_fbdev_teardown() cleans up deferred I/O.
>> - *
>> - * NOTE: A copy of &fb_ops is made and assigned to &info->fbops. This=
 is done
>> - * because fb_deferred_io_cleanup() clears &fbops->fb_mmap and would =
thereby
>> - * affect other instances of that &fb_ops.
>> - *
>> - * Returns:
>> - * 0 on success or a negative error code on failure.
>> - */
>> -int drm_fb_helper_defio_init(struct drm_fb_helper *fb_helper)
>> -{
>> -	struct fb_info *info =3D fb_helper->fbdev;
>> -	struct fb_deferred_io *fbdefio;
>> -	struct fb_ops *fbops;
>> -
>> -	fbdefio =3D kzalloc(sizeof(*fbdefio), GFP_KERNEL);
>> -	fbops =3D kzalloc(sizeof(*fbops), GFP_KERNEL);
>> -	if (!fbdefio || !fbops) {
>> -		kfree(fbdefio);
>> -		kfree(fbops);
>> -		return -ENOMEM;
>> -	}
>> -
>> -	info->fbdefio =3D fbdefio;
>> -	fbdefio->delay =3D msecs_to_jiffies(50);
>> -	fbdefio->deferred_io =3D drm_fb_helper_deferred_io;
>> -
>> -	*fbops =3D *info->fbops;
>> -	info->fbops =3D fbops;
>> -
>> -	fb_deferred_io_init(info);
>> -
>> -	return 0;
>> -}
>> -EXPORT_SYMBOL(drm_fb_helper_defio_init);
>> -
>=20
> With this gone you can remove the defio cleanup part from
> drm_fb_helper_fbdev_teardown() as well.
>=20
> And I see that there's no users left of that function (the same with
> *_seup()). Would be nice if you just removed them. I made them before I=

> embarked on the generic fbdev solution. I think it's better to try and
> make the generic emulation usable for "everyone" and avoid the need for=

> drivers to have to do their own special stuff.=20

The last user was vboxvideo, which I converted ~2 weeks ago. I haven't
removed them yet, as there's a TODO item to convert drivers over to them.=


=46rom a quick 'git grep':

Most drivers that uses drm_fb_helper_sys_*() in its fb_ops could
probably be converted over to generic fbdev. That's hibmc (I have some
untested patches for it), msm, omapdrm, tegra, and udl (currently being
converted).

Only nouveau and gma500 have some form of HW acceleration.

The rest of the drivers (10) uses drm_fb_helper_cfb_*() functions. Are
these strictly required, or can they be made available within generic fbd=
ev?

Best regards
Thomas

> code to avoid the shadow buffering would aid in that as Daniel have
> talked about.
>=20
> Either way you choose, this patch is:
>=20
> Reviewed-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
>=20
>>  /**
>>   * drm_fb_helper_sys_read - wrapper around fb_sys_read
>>   * @info: fb_info struct pointer
>> @@ -2356,7 +2318,10 @@ static const struct drm_client_funcs drm_fbdev_=
client_funcs =3D {
>>   *
>>   * Drivers that set the dirty callback on their framebuffer will get =
a shadow
>>   * fbdev buffer that is blitted onto the real buffer. This is done in=
 order to
>> - * make deferred I/O work with all kinds of buffers.
>> + * make deferred I/O work with all kinds of buffers. A shadow buffer =
can be
>> + * requested explicitly by setting struct drm_mode_config.prefer_shad=
ow or
>> + * struct drm_mode_config.prefer_shadow_fbdev to true beforehand. Thi=
s is
>> + * required to use generic fbdev emulation with SHMEM helpers.
>>   *
>>   * This function is safe to call even when there are no connectors pr=
esent.
>>   * Setup will be retried on the next hotplug event.
>> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h=

>> index 8dcc012ccbc8..2338e9f94a03 100644
>> --- a/include/drm/drm_fb_helper.h
>> +++ b/include/drm/drm_fb_helper.h
>> @@ -235,7 +235,6 @@ void drm_fb_helper_unlink_fbi(struct drm_fb_helper=
 *fb_helper);
>> =20
>>  void drm_fb_helper_deferred_io(struct fb_info *info,
>>  			       struct list_head *pagelist);
>> -int drm_fb_helper_defio_init(struct drm_fb_helper *fb_helper);
>> =20
>>  ssize_t drm_fb_helper_sys_read(struct fb_info *info, char __user *buf=
,
>>  			       size_t count, loff_t *ppos);
>>
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


--WGA4SCb5j9iDTzITHkF6lPUuGePX8QVTi--

--AYiKlZawoYPsTwbJ6P0YAMaM3HbuvFvui
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl2zMF4ACgkQaA3BHVML
eiNKFAgAmmPLHGikUH1DeCvncFYXlmfn6cE8PJx+Iu5lvHRFnxRDvfOp1qNHBaGt
dNIBE8ekYTznu0cAUTjwihUWYz8pzBKkoktUo0Da21IiMebmPsCDN4cF78cHPkgB
hWQywDDHRYPIhk2QaWA26JeNnOxsy7sQyLX56KlrnW044gUzPYREb/pXdEfo6x13
GfIewZfzVopKAIdX85RBrtJHfKWmFNFH0IpgK4fWu6xh1G4pInkx/AohXPNv5rXS
SCrZApFIC488NAhguXa3ugiiGVhBrHGLd255v/8AcV665zpz69Pzsp07haSFv+9o
URLcGcPMcNJZPgsZqnrQDPMUsyNcww==
=fgNk
-----END PGP SIGNATURE-----

--AYiKlZawoYPsTwbJ6P0YAMaM3HbuvFvui--

--===============1249379756==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1249379756==--
