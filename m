Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266D0EE7A4
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 19:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1D36E819;
	Mon,  4 Nov 2019 18:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2DD6E819
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 18:48:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AC018B1FE;
 Mon,  4 Nov 2019 18:48:41 +0000 (UTC)
Subject: Re: [PATCH 1/2] drm/fb-helper: Remove drm_fb_helper_defio_init() and
 update docs
To: Daniel Vetter <daniel@ffwll.ch>
References: <20191025092759.13069-1-tzimmermann@suse.de>
 <20191025092759.13069-2-tzimmermann@suse.de>
 <3db04b4e-4b23-1edb-7df8-893ca9b5709f@tronnes.org>
 <7016126a-f498-1a4a-4721-c6305a961457@suse.de>
 <CAKMK7uHr1iH8ibk7Mq-qz8FGPZiuNYcm2QvNXdXC4ZR2iP6uOg@mail.gmail.com>
 <5ea7beb9-2584-eddf-1d79-d9b484930d63@suse.de>
 <20191104095547.GC10326@phenom.ffwll.local>
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
Message-ID: <0e769e07-9307-f86e-56da-057968db8b4a@suse.de>
Date: Mon, 4 Nov 2019 19:48:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191104095547.GC10326@phenom.ffwll.local>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0150780292=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0150780292==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FzkkY18NULELHL01AAJodmUtvbC9IIkzA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FzkkY18NULELHL01AAJodmUtvbC9IIkzA
Content-Type: multipart/mixed; boundary="mGpUmHMEHdmJYu9F9PkiTPMTPxS9wRRlR";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <0e769e07-9307-f86e-56da-057968db8b4a@suse.de>
Subject: Re: [PATCH 1/2] drm/fb-helper: Remove drm_fb_helper_defio_init() and
 update docs
References: <20191025092759.13069-1-tzimmermann@suse.de>
 <20191025092759.13069-2-tzimmermann@suse.de>
 <3db04b4e-4b23-1edb-7df8-893ca9b5709f@tronnes.org>
 <7016126a-f498-1a4a-4721-c6305a961457@suse.de>
 <CAKMK7uHr1iH8ibk7Mq-qz8FGPZiuNYcm2QvNXdXC4ZR2iP6uOg@mail.gmail.com>
 <5ea7beb9-2584-eddf-1d79-d9b484930d63@suse.de>
 <20191104095547.GC10326@phenom.ffwll.local>
In-Reply-To: <20191104095547.GC10326@phenom.ffwll.local>

--mGpUmHMEHdmJYu9F9PkiTPMTPxS9wRRlR
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Daniel

Am 04.11.19 um 10:55 schrieb Daniel Vetter:
> On Mon, Oct 28, 2019 at 09:13:47AM +0100, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 25.10.19 um 20:54 schrieb Daniel Vetter:
>>> On Fri, Oct 25, 2019 at 7:26 PM Thomas Zimmermann <tzimmermann@suse.d=
e> wrote:
>>>>
>>>> Hi
>>>>
>>>> Am 25.10.19 um 17:46 schrieb Noralf Tr=C3=B8nnes:
>>>>>
>>>>>
>>>>> Den 25.10.2019 11.27, skrev Thomas Zimmermann:
>>>>>> There are no users of drm_fb_helper_defio_init(), so we can remove=

>>>>>> it. The documenation around defio support is a bit misleading and
>>>>>> should mention compatibility issues with SHMEM helpers. Clarify th=
is.
>>>>>>
>>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>> ---
>>>>>>  drivers/gpu/drm/drm_fb_helper.c | 61 +++++++---------------------=
-----
>>>>>>  include/drm/drm_fb_helper.h     |  1 -
>>>>>>  2 files changed, 13 insertions(+), 49 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm=
_fb_helper.c
>>>>>> index b75ae8555baf..8ebeccdeed23 100644
>>>>>> --- a/drivers/gpu/drm/drm_fb_helper.c
>>>>>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>>>>>> @@ -92,9 +92,12 @@ static DEFINE_MUTEX(kernel_fb_helper_lock);
>>>>>>   *
>>>>>>   * Drivers that support a dumb buffer with a virtual address and =
mmap support,
>>>>>>   * should try out the generic fbdev emulation using drm_fbdev_gen=
eric_setup().
>>>>>> + * It will automatically set up deferred I/O if the driver requir=
es a shadow
>>>>>> + * buffer.
>>>>>>   *
>>>>>> - * Setup fbdev emulation by calling drm_fb_helper_fbdev_setup() a=
nd tear it
>>>>>> - * down by calling drm_fb_helper_fbdev_teardown().
>>>>>> + * For other drivers, setup fbdev emulation by calling
>>>>>> + * drm_fb_helper_fbdev_setup() and tear it down by calling
>>>>>> + * drm_fb_helper_fbdev_teardown().
>>>>>>   *
>>>>>>   * At runtime drivers should restore the fbdev console by using
>>>>>>   * drm_fb_helper_lastclose() as their &drm_driver.lastclose callb=
ack.
>>>>>> @@ -127,8 +130,10 @@ static DEFINE_MUTEX(kernel_fb_helper_lock);
>>>>>>   * always run in process context since the fb_*() function could =
be running in
>>>>>>   * atomic context. If drm_fb_helper_deferred_io() is used as the =
deferred_io
>>>>>>   * callback it will also schedule dirty_work with the damage coll=
ected from the
>>>>>> - * mmap page writes. Drivers can use drm_fb_helper_defio_init() t=
o setup
>>>>>> - * deferred I/O (coupled with drm_fb_helper_fbdev_teardown()).
>>>>>> + * mmap page writes.
>>>>>> + *
>>>>>> + * Deferred I/O is not compatible with SHMEM. Such drivers should=
 request an
>>>>>> + * fbdev shadow buffer and call drm_fbdev_generic_setup() instead=
=2E
>>>>>>   */
>>>>>>
>>>>>>  static void drm_fb_helper_restore_lut_atomic(struct drm_crtc *crt=
c)
>>>>>> @@ -679,49 +684,6 @@ void drm_fb_helper_deferred_io(struct fb_info=
 *info,
>>>>>>  }
>>>>>>  EXPORT_SYMBOL(drm_fb_helper_deferred_io);
>>>>>>
>>>>>> -/**
>>>>>> - * drm_fb_helper_defio_init - fbdev deferred I/O initialization
>>>>>> - * @fb_helper: driver-allocated fbdev helper
>>>>>> - *
>>>>>> - * This function allocates &fb_deferred_io, sets callback to
>>>>>> - * drm_fb_helper_deferred_io(), delay to 50ms and calls fb_deferr=
ed_io_init().
>>>>>> - * It should be called from the &drm_fb_helper_funcs->fb_probe ca=
llback.
>>>>>> - * drm_fb_helper_fbdev_teardown() cleans up deferred I/O.
>>>>>> - *
>>>>>> - * NOTE: A copy of &fb_ops is made and assigned to &info->fbops. =
This is done
>>>>>> - * because fb_deferred_io_cleanup() clears &fbops->fb_mmap and wo=
uld thereby
>>>>>> - * affect other instances of that &fb_ops.
>>>>>> - *
>>>>>> - * Returns:
>>>>>> - * 0 on success or a negative error code on failure.
>>>>>> - */
>>>>>> -int drm_fb_helper_defio_init(struct drm_fb_helper *fb_helper)
>>>>>> -{
>>>>>> -    struct fb_info *info =3D fb_helper->fbdev;
>>>>>> -    struct fb_deferred_io *fbdefio;
>>>>>> -    struct fb_ops *fbops;
>>>>>> -
>>>>>> -    fbdefio =3D kzalloc(sizeof(*fbdefio), GFP_KERNEL);
>>>>>> -    fbops =3D kzalloc(sizeof(*fbops), GFP_KERNEL);
>>>>>> -    if (!fbdefio || !fbops) {
>>>>>> -            kfree(fbdefio);
>>>>>> -            kfree(fbops);
>>>>>> -            return -ENOMEM;
>>>>>> -    }
>>>>>> -
>>>>>> -    info->fbdefio =3D fbdefio;
>>>>>> -    fbdefio->delay =3D msecs_to_jiffies(50);
>>>>>> -    fbdefio->deferred_io =3D drm_fb_helper_deferred_io;
>>>>>> -
>>>>>> -    *fbops =3D *info->fbops;
>>>>>> -    info->fbops =3D fbops;
>>>>>> -
>>>>>> -    fb_deferred_io_init(info);
>>>>>> -
>>>>>> -    return 0;
>>>>>> -}
>>>>>> -EXPORT_SYMBOL(drm_fb_helper_defio_init);
>>>>>> -
>>>>>
>>>>> With this gone you can remove the defio cleanup part from
>>>>> drm_fb_helper_fbdev_teardown() as well.
>>>>>
>>>>> And I see that there's no users left of that function (the same wit=
h
>>>>> *_seup()). Would be nice if you just removed them. I made them befo=
re I
>>>>> embarked on the generic fbdev solution. I think it's better to try =
and
>>>>> make the generic emulation usable for "everyone" and avoid the need=
 for
>>>>> drivers to have to do their own special stuff.
>>>>
>>>> The last user was vboxvideo, which I converted ~2 weeks ago. I haven=
't
>>>> removed them yet, as there's a TODO item to convert drivers over to =
them.
>>>>
>>>> From a quick 'git grep':
>>>>
>>>> Most drivers that uses drm_fb_helper_sys_*() in its fb_ops could
>>>> probably be converted over to generic fbdev. That's hibmc (I have so=
me
>>>> untested patches for it), msm, omapdrm, tegra, and udl (currently be=
ing
>>>> converted).
>>>>
>>>> Only nouveau and gma500 have some form of HW acceleration.
>>>>
>>>> The rest of the drivers (10) uses drm_fb_helper_cfb_*() functions. A=
re
>>>> these strictly required, or can they be made available within generi=
c fbdev?
>>>
>>> Take a pile of digging through a few fb horrors, but this boils down =
to:
>>>
>>> *sys* functions operate on an fb that works like normal system memory=
=2E
>>>
>>> *cfb* functions operate on void __iomem * instead. Which makes a huge=

>>> difference on some architectures, but afaiui neither x86 nor arm care=
=2E
>>> On ppc it seems to make a difference sometimes.
>>>
>>> So for shmem we should use *sys* functions, for vram *cfb*.
>>>
>>> And that leads me to realizing that drm_gem_vram_vmap has the totally=

>>> wrong type, it should be void __iomem *. There's this fancy is_iomem
>>> parameter for ttm_kmap_obj_virtual that should help you figure out th=
e
>>> right type, but only nouveau bothers to implement this correctly.
>>>
>>> I'm honestly not sure whether we should care.
>>
>> I remember getting an eamil about this from some automated test system=
=2E
>> I haven't had time to change it and it's apparently not urgent.
>>
>> If we really want to fix the problem, we'd have to propagage is_iomem
>> through the DRM core; probably touching every vmap callback. OTOH this=

>> might not be a bad thing. With is_iomem available in the generic fbdev=

>> emulation, it could select between sys and cfb functions and support
>> drivers with cfb-based fbdev as well.
>=20
> is_iomem doesn't work, it's hack, since the change is in the function
> prototypes/signatures. So we'd need to make sure we have 2 sets of kern=
el
> mapping functions for everything, plus 2 sets of anything that accesses=

> through the kernel.
>=20
> It's a huge task, and I'm really not sure we have any architecture we c=
are
> about this ...

But the caller of vmap() doesn't know if it is I/O memory. It has to get
this information via vmap() from the memory manager. Having two
individual vmap() functions (and picking the correct one) would be quite
a burden to the caller.

But what's wrong with casting the returned address to void __iomem* if
is_iomem is true?

To get an idea of how well this works, I made a patchset to propagate
is_iomem through all the vmap() interfaces in DRM. I found that most
drivers' memory managers are SHMEM- or CMA-based and don't have to
bother. The rest is based on TTM, which already returns the correct
value for is_iomem. I didn't modify dma-buf interfaces and simply
assumed 'false' here.

The final patches modify the fbdev emulation to use either sys or cfb
functions, depending on the value of is_iomem. Admittedly, I don't have
the hardware where it makes a differences, but the change wasn't that
hard either.

I can probably post the patchset later this week for RFC.

Best regards
Thomas

> -Daniel
>=20
>>
>> Best regards
>> Thomas
>>
>>> -Daniel
>>>
>>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>> code to avoid the shadow buffering would aid in that as Daniel have=

>>>>> talked about.
>>>>>
>>>>> Either way you choose, this patch is:
>>>>>
>>>>> Reviewed-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
>>>>>
>>>>>>  /**
>>>>>>   * drm_fb_helper_sys_read - wrapper around fb_sys_read
>>>>>>   * @info: fb_info struct pointer
>>>>>> @@ -2356,7 +2318,10 @@ static const struct drm_client_funcs drm_fb=
dev_client_funcs =3D {
>>>>>>   *
>>>>>>   * Drivers that set the dirty callback on their framebuffer will =
get a shadow
>>>>>>   * fbdev buffer that is blitted onto the real buffer. This is don=
e in order to
>>>>>> - * make deferred I/O work with all kinds of buffers.
>>>>>> + * make deferred I/O work with all kinds of buffers. A shadow buf=
fer can be
>>>>>> + * requested explicitly by setting struct drm_mode_config.prefer_=
shadow or
>>>>>> + * struct drm_mode_config.prefer_shadow_fbdev to true beforehand.=
 This is
>>>>>> + * required to use generic fbdev emulation with SHMEM helpers.
>>>>>>   *
>>>>>>   * This function is safe to call even when there are no connector=
s present.
>>>>>>   * Setup will be retried on the next hotplug event.
>>>>>> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_help=
er.h
>>>>>> index 8dcc012ccbc8..2338e9f94a03 100644
>>>>>> --- a/include/drm/drm_fb_helper.h
>>>>>> +++ b/include/drm/drm_fb_helper.h
>>>>>> @@ -235,7 +235,6 @@ void drm_fb_helper_unlink_fbi(struct drm_fb_he=
lper *fb_helper);
>>>>>>
>>>>>>  void drm_fb_helper_deferred_io(struct fb_info *info,
>>>>>>                             struct list_head *pagelist);
>>>>>> -int drm_fb_helper_defio_init(struct drm_fb_helper *fb_helper);
>>>>>>
>>>>>>  ssize_t drm_fb_helper_sys_read(struct fb_info *info, char __user =
*buf,
>>>>>>                             size_t count, loff_t *ppos);
>>>>>>
>>>>> _______________________________________________
>>>>> dri-devel mailing list
>>>>> dri-devel@lists.freedesktop.org
>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>>
>>>>
>>>> --
>>>> Thomas Zimmermann
>>>> Graphics Driver Developer
>>>> SUSE Software Solutions Germany GmbH
>>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>>>> (HRB 36809, AG N=C3=BCrnberg)
>>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>>>
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


--mGpUmHMEHdmJYu9F9PkiTPMTPxS9wRRlR--

--FzkkY18NULELHL01AAJodmUtvbC9IIkzA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3AcoMACgkQaA3BHVML
eiPvpAgAhiT7Y9Goe74Y2fknMFII9FK+YGIh85oXrcLtWTvT++CTv8k+DzWpb6Ct
RJP2ySm/gDBzTRlo+n7+P17ST3xAqGhkXxiscEyW5g7/l8rGoSLzeTxyPh4NBzY/
HXzZLkslvgpIJSyNIHdsvDWD8IY2SxgmdzCviic0g/419qGVUGSdsQ+LgKjT8On8
hsZee7DTQbmXvjje8K1+Rw4KL97U/ZB9uT7m68nY22HmKfv0zJImf3mdpVCyTXci
WRsVC/ViKkYIb6JoP04WNwKNy2UqRF4UpbGeGhV6L8k91gLGo5ct3mcjD3YyQAhU
x8Q1Mltiy+L1Nua924cfLgJ9kVhKjw==
=v1A1
-----END PGP SIGNATURE-----

--FzkkY18NULELHL01AAJodmUtvbC9IIkzA--

--===============0150780292==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0150780292==--
