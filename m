Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4277117365B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 12:46:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037C86F423;
	Fri, 28 Feb 2020 11:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D79B6F423;
 Fri, 28 Feb 2020 11:46:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C81E1B393;
 Fri, 28 Feb 2020 11:46:38 +0000 (UTC)
Subject: Re: [PATCH 50/51] drm/udl: drop drm_driver.release hook
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
 <20200227181522.2711142-51-daniel.vetter@ffwll.ch>
 <9e49ba2e-3d1e-98a2-9a11-725bc8a95941@suse.de>
 <CAKMK7uGicrZxMeYmz13psgXgRYK1OrZmpHxsEKxet=qP_pRpcQ@mail.gmail.com>
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
Message-ID: <013a54c4-edc6-b771-478f-e3e10a1d9a83@suse.de>
Date: Fri, 28 Feb 2020 12:46:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGicrZxMeYmz13psgXgRYK1OrZmpHxsEKxet=qP_pRpcQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0575871755=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0575871755==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="mz5Ppj6b8oK6D5ky5468cjofMdBJbTSTE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mz5Ppj6b8oK6D5ky5468cjofMdBJbTSTE
Content-Type: multipart/mixed; boundary="QIKjLrQYwWpjTfCEkh6HjP4Xv6vfpMa9t";
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
Message-ID: <013a54c4-edc6-b771-478f-e3e10a1d9a83@suse.de>
Subject: Re: [PATCH 50/51] drm/udl: drop drm_driver.release hook
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
 <20200227181522.2711142-51-daniel.vetter@ffwll.ch>
 <9e49ba2e-3d1e-98a2-9a11-725bc8a95941@suse.de>
 <CAKMK7uGicrZxMeYmz13psgXgRYK1OrZmpHxsEKxet=qP_pRpcQ@mail.gmail.com>
In-Reply-To: <CAKMK7uGicrZxMeYmz13psgXgRYK1OrZmpHxsEKxet=qP_pRpcQ@mail.gmail.com>

--QIKjLrQYwWpjTfCEkh6HjP4Xv6vfpMa9t
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 28.02.20 um 09:40 schrieb Daniel Vetter:
> On Fri, Feb 28, 2020 at 8:44 AM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
>>
>> Hi Daniel
>>
>> Am 27.02.20 um 19:15 schrieb Daniel Vetter:
>>> There's only two functions called from that:
>>> drm_kms_helper_poll_fini() and udl_free_urb_list(). Both of these are=

>>> also called from the ubs_driver->disconnect hook, so entirely
>>> pointless to do the same again in the ->release hook.
>>
>> The disconnect hook calls drm_kms_helper_poll_disable() instead if
>> _fini(). They are the same, except that _disable() does not clear
>> dev->mode_config.poll_enabled to false. Is this OK?
>=20
> oops, I overlooked that. But yeah for driver shutdown it's the same
> really, we're not going to re-enable. _disable is meant for suspend so
> youc an re-enable again on resume.
>=20
> I'll augment the commit message on the next round to clarify that.

Well, we have a managed API. It could support
drmm_kms_helper_poll_init(). :)

Best regards
Thomas

> -Daniel
>=20
>=20
>> Best regards
>> Thomas
>>
>>>
>>> Furthermore by the time we clean up the drm_driver we really shouldn'=
t
>>> be touching hardware anymore, so stopping the poll worker and freeing=

>>> the urb allocations in ->disconnect is the right thing to do.
>>>
>>> Now disconnect still cleans things up before unregistering the driver=
,
>>> but that's a different issue.
>>>
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>> Cc: Dave Airlie <airlied@redhat.com>
>>> Cc: Sean Paul <sean@poorly.run>
>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Emil Velikov <emil.l.velikov@gmail.com>
>>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>>> Cc: "Noralf Tr=C3=B8nnes" <noralf@tronnes.org>
>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>> Cc: Thomas Gleixner <tglx@linutronix.de>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> ---
>>>  drivers/gpu/drm/udl/udl_drv.c  |  6 ------
>>>  drivers/gpu/drm/udl/udl_drv.h  |  1 -
>>>  drivers/gpu/drm/udl/udl_main.c | 10 ----------
>>>  3 files changed, 17 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_=
drv.c
>>> index b447fb053e78..7f140898df3e 100644
>>> --- a/drivers/gpu/drm/udl/udl_drv.c
>>> +++ b/drivers/gpu/drm/udl/udl_drv.c
>>> @@ -34,14 +34,8 @@ static int udl_usb_resume(struct usb_interface *in=
terface)
>>>
>>>  DEFINE_DRM_GEM_FOPS(udl_driver_fops);
>>>
>>> -static void udl_driver_release(struct drm_device *dev)
>>> -{
>>> -     udl_fini(dev);
>>> -}
>>> -
>>>  static struct drm_driver driver =3D {
>>>       .driver_features =3D DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESE=
T,
>>> -     .release =3D udl_driver_release,
>>>
>>>       /* gem hooks */
>>>       .gem_create_object =3D udl_driver_gem_create_object,
>>> diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_=
drv.h
>>> index 1de7eb1b6aac..2642f94a63fc 100644
>>> --- a/drivers/gpu/drm/udl/udl_drv.h
>>> +++ b/drivers/gpu/drm/udl/udl_drv.h
>>> @@ -76,7 +76,6 @@ int udl_submit_urb(struct drm_device *dev, struct u=
rb *urb, size_t len);
>>>  void udl_urb_completion(struct urb *urb);
>>>
>>>  int udl_init(struct udl_device *udl);
>>> -void udl_fini(struct drm_device *dev);
>>>
>>>  int udl_render_hline(struct drm_device *dev, int log_bpp, struct urb=
 **urb_ptr,
>>>                    const char *front, char **urb_buf_ptr,
>>> diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl=
_main.c
>>> index 538718919916..f5d27f2a5654 100644
>>> --- a/drivers/gpu/drm/udl/udl_main.c
>>> +++ b/drivers/gpu/drm/udl/udl_main.c
>>> @@ -351,13 +351,3 @@ int udl_drop_usb(struct drm_device *dev)
>>>       udl_free_urb_list(dev);
>>>       return 0;
>>>  }
>>> -
>>> -void udl_fini(struct drm_device *dev)
>>> -{
>>> -     struct udl_device *udl =3D to_udl(dev);
>>> -
>>> -     drm_kms_helper_poll_fini(dev);
>>> -
>>> -     if (udl->urbs.count)
>>> -             udl_free_urb_list(dev);
>>> -}
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


--QIKjLrQYwWpjTfCEkh6HjP4Xv6vfpMa9t--

--mz5Ppj6b8oK6D5ky5468cjofMdBJbTSTE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5Y/ZoACgkQaA3BHVML
eiMyIwf/S7IzqAygJNInjMG5EDZfHSEpnQbvWjU9blnS1NA98BlB3NtPAlV1MucG
8TGcz8PWqvKlNBm1yET0P061WtVqeir9BLV5F19Xd4wTztpMH4NCH5LMcxMBZ6Ex
rMEfbv4iM23UO7HVEyX74G+3fV5AXF8WC6kLtO+J17YoZ0Q8chWGvwSxnrviqEgH
GVZYJTy9wBIGAlN0p7xlr8y8hnW6h8tmHi3ZsPBGBzwlFyBF8ImlRAtkhAAyEJDK
Vsn6Veg4QmIRc5PcGOXdCeT5Sn8PRY5JEWxOeUo9zv3icThRR1UfHP3KVPzgAEE7
1eS7mF3RlX3seiK13UteXiMBCeTEOQ==
=FQd4
-----END PGP SIGNATURE-----

--mz5Ppj6b8oK6D5ky5468cjofMdBJbTSTE--

--===============0575871755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0575871755==--
