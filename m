Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A95175545
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 09:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066A36E0E8;
	Mon,  2 Mar 2020 08:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836386E0CF;
 Mon,  2 Mar 2020 08:14:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0DE3CAAC7;
 Mon,  2 Mar 2020 08:14:46 +0000 (UTC)
Subject: Re: [PATCH 50/51] drm/udl: drop drm_driver.release hook
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
 <20200227181522.2711142-51-daniel.vetter@ffwll.ch>
 <9e49ba2e-3d1e-98a2-9a11-725bc8a95941@suse.de>
 <CAKMK7uGicrZxMeYmz13psgXgRYK1OrZmpHxsEKxet=qP_pRpcQ@mail.gmail.com>
 <013a54c4-edc6-b771-478f-e3e10a1d9a83@suse.de>
 <CAKMK7uG3MuLEhCSxP1HBoROD3FuixcRov57hTBO9BeZE+n98jg@mail.gmail.com>
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
Message-ID: <e9fa1b03-e4b7-d65b-8fb8-fe15c20fddc9@suse.de>
Date: Mon, 2 Mar 2020 09:14:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uG3MuLEhCSxP1HBoROD3FuixcRov57hTBO9BeZE+n98jg@mail.gmail.com>
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
Cc: Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1953507687=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1953507687==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SoUrstqenL2qSvw7OEZ0O0Qa55V3HufgA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SoUrstqenL2qSvw7OEZ0O0Qa55V3HufgA
Content-Type: multipart/mixed; boundary="1HSUuzybjPYxWdZtBLrY3tBhnnWqkgkw0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner
 <tglx@linutronix.de>, Sean Paul <sean@poorly.run>
Message-ID: <e9fa1b03-e4b7-d65b-8fb8-fe15c20fddc9@suse.de>
Subject: Re: [PATCH 50/51] drm/udl: drop drm_driver.release hook
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
 <20200227181522.2711142-51-daniel.vetter@ffwll.ch>
 <9e49ba2e-3d1e-98a2-9a11-725bc8a95941@suse.de>
 <CAKMK7uGicrZxMeYmz13psgXgRYK1OrZmpHxsEKxet=qP_pRpcQ@mail.gmail.com>
 <013a54c4-edc6-b771-478f-e3e10a1d9a83@suse.de>
 <CAKMK7uG3MuLEhCSxP1HBoROD3FuixcRov57hTBO9BeZE+n98jg@mail.gmail.com>
In-Reply-To: <CAKMK7uG3MuLEhCSxP1HBoROD3FuixcRov57hTBO9BeZE+n98jg@mail.gmail.com>

--1HSUuzybjPYxWdZtBLrY3tBhnnWqkgkw0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Daniel

Am 28.02.20 um 18:43 schrieb Daniel Vetter:
> On Fri, Feb 28, 2020 at 12:46 PM Thomas Zimmermann <tzimmermann@suse.de=
> wrote:
>>
>> Hi
>>
>> Am 28.02.20 um 09:40 schrieb Daniel Vetter:
>>> On Fri, Feb 28, 2020 at 8:44 AM Thomas Zimmermann <tzimmermann@suse.d=
e> wrote:
>>>>
>>>> Hi Daniel
>>>>
>>>> Am 27.02.20 um 19:15 schrieb Daniel Vetter:
>>>>> There's only two functions called from that:
>>>>> drm_kms_helper_poll_fini() and udl_free_urb_list(). Both of these a=
re
>>>>> also called from the ubs_driver->disconnect hook, so entirely
>>>>> pointless to do the same again in the ->release hook.
>>>>
>>>> The disconnect hook calls drm_kms_helper_poll_disable() instead if
>>>> _fini(). They are the same, except that _disable() does not clear
>>>> dev->mode_config.poll_enabled to false. Is this OK?
>>>
>>> oops, I overlooked that. But yeah for driver shutdown it's the same
>>> really, we're not going to re-enable. _disable is meant for suspend s=
o
>>> youc an re-enable again on resume.
>>>
>>> I'll augment the commit message on the next round to clarify that.
>>
>> Well, we have a managed API. It could support
>> drmm_kms_helper_poll_init(). :)
>=20
> You're ahead of the game here, but yes that's the plan. And a lot
> more. Ideally I really want to get rid of both bus_driver->remove and
> drm_driver->release callbacks for all drivers.
>=20
> Also, for polling you actually want devm_kms_poll_init, since polling
> should be stopped at unplug/remove time. Not at drm_driver release
> time :-)

Quite honestly, if you're not adding devm_kms_poll_init() now, why even
bother removing the _fini() call from release()? It hasn't been a
problem so far and it won't become one. Doing a half-baked change now
results in a potential WTF moment for other developers.

Rather clean up release() when you add the managed devm_kms_poll_init()
and have a nice, clear patch.

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
>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>>
>>>>> Furthermore by the time we clean up the drm_driver we really should=
n't
>>>>> be touching hardware anymore, so stopping the poll worker and freei=
ng
>>>>> the urb allocations in ->disconnect is the right thing to do.
>>>>>
>>>>> Now disconnect still cleans things up before unregistering the driv=
er,
>>>>> but that's a different issue.
>>>>>
>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>>>> Cc: Dave Airlie <airlied@redhat.com>
>>>>> Cc: Sean Paul <sean@poorly.run>
>>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> Cc: Emil Velikov <emil.l.velikov@gmail.com>
>>>>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>>>>> Cc: "Noralf Tr=C3=B8nnes" <noralf@tronnes.org>
>>>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>>>> Cc: Thomas Gleixner <tglx@linutronix.de>
>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>> ---
>>>>>  drivers/gpu/drm/udl/udl_drv.c  |  6 ------
>>>>>  drivers/gpu/drm/udl/udl_drv.h  |  1 -
>>>>>  drivers/gpu/drm/udl/udl_main.c | 10 ----------
>>>>>  3 files changed, 17 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/ud=
l_drv.c
>>>>> index b447fb053e78..7f140898df3e 100644
>>>>> --- a/drivers/gpu/drm/udl/udl_drv.c
>>>>> +++ b/drivers/gpu/drm/udl/udl_drv.c
>>>>> @@ -34,14 +34,8 @@ static int udl_usb_resume(struct usb_interface *=
interface)
>>>>>
>>>>>  DEFINE_DRM_GEM_FOPS(udl_driver_fops);
>>>>>
>>>>> -static void udl_driver_release(struct drm_device *dev)
>>>>> -{
>>>>> -     udl_fini(dev);
>>>>> -}
>>>>> -
>>>>>  static struct drm_driver driver =3D {
>>>>>       .driver_features =3D DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODE=
SET,
>>>>> -     .release =3D udl_driver_release,
>>>>>
>>>>>       /* gem hooks */
>>>>>       .gem_create_object =3D udl_driver_gem_create_object,
>>>>> diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/ud=
l_drv.h
>>>>> index 1de7eb1b6aac..2642f94a63fc 100644
>>>>> --- a/drivers/gpu/drm/udl/udl_drv.h
>>>>> +++ b/drivers/gpu/drm/udl/udl_drv.h
>>>>> @@ -76,7 +76,6 @@ int udl_submit_urb(struct drm_device *dev, struct=
 urb *urb, size_t len);
>>>>>  void udl_urb_completion(struct urb *urb);
>>>>>
>>>>>  int udl_init(struct udl_device *udl);
>>>>> -void udl_fini(struct drm_device *dev);
>>>>>
>>>>>  int udl_render_hline(struct drm_device *dev, int log_bpp, struct u=
rb **urb_ptr,
>>>>>                    const char *front, char **urb_buf_ptr,
>>>>> diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/u=
dl_main.c
>>>>> index 538718919916..f5d27f2a5654 100644
>>>>> --- a/drivers/gpu/drm/udl/udl_main.c
>>>>> +++ b/drivers/gpu/drm/udl/udl_main.c
>>>>> @@ -351,13 +351,3 @@ int udl_drop_usb(struct drm_device *dev)
>>>>>       udl_free_urb_list(dev);
>>>>>       return 0;
>>>>>  }
>>>>> -
>>>>> -void udl_fini(struct drm_device *dev)
>>>>> -{
>>>>> -     struct udl_device *udl =3D to_udl(dev);
>>>>> -
>>>>> -     drm_kms_helper_poll_fini(dev);
>>>>> -
>>>>> -     if (udl->urbs.count)
>>>>> -             udl_free_urb_list(dev);
>>>>> -}
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


--1HSUuzybjPYxWdZtBLrY3tBhnnWqkgkw0--

--SoUrstqenL2qSvw7OEZ0O0Qa55V3HufgA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5cwHUACgkQaA3BHVML
eiPi3Af+MqCGa3slEm9tnpnumV3bQcLLaUmRYU3XbZtH0VYEF1debcxYNisVScCu
5XLnEHHtoRpkxig/bGvGNssBQorkmW+BAek0lMnHCTf9bT/eLbS22WWoe/TDjWsv
8BsbF2aChSZRUJD2VxWaBrlIDtFPUdrToqW0a4J+OKGz7mrrMjGZQhLwOtqBSkEw
VolUrDNkJsSzP7uk3uk17zcusihKKvkg5AB2k7mkHKIWFsaWytaGD+ireyvAYOX/
qXxEF1XXSSeJNnpr1y6WR+CBSU2r1LdcMvHTqhQ5nFNrZmtXo14VaC6S0bMka78X
F0qwcaIEVbXG7YFDzlECmb2WvX5B5g==
=76xj
-----END PGP SIGNATURE-----

--SoUrstqenL2qSvw7OEZ0O0Qa55V3HufgA--

--===============1953507687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1953507687==--
