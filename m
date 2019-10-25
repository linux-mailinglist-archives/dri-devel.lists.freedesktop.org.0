Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18911E484C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 12:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B0F6E95B;
	Fri, 25 Oct 2019 10:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BF96E95B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 10:12:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A536AC142;
 Fri, 25 Oct 2019 10:12:35 +0000 (UTC)
Subject: Re: [PATCH 3/5] drm/udl: Add GEM object functions for free(), vmap(), 
 and vunmap()
To: Daniel Vetter <daniel@ffwll.ch>
References: <20191024144237.8898-1-tzimmermann@suse.de>
 <20191024144237.8898-4-tzimmermann@suse.de>
 <20191025074038.GQ11828@phenom.ffwll.local>
 <b3677f98-d357-8464-302b-4d1991bfc621@suse.de>
 <CAKMK7uGDHS9yQP5ZCc402_F+NyTphJjSKVR3wyHJ5j0GXUQUuw@mail.gmail.com>
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
Message-ID: <487893a0-1fe8-cc08-d301-d30f34c21ab6@suse.de>
Date: Fri, 25 Oct 2019 12:12:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGDHS9yQP5ZCc402_F+NyTphJjSKVR3wyHJ5j0GXUQUuw@mail.gmail.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1503805671=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1503805671==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LD96sSY4xOAmgYOIc0RAYfzR3Wh2QwF7d"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LD96sSY4xOAmgYOIc0RAYfzR3Wh2QwF7d
Content-Type: multipart/mixed; boundary="pjRqSPpAfHToRISUFtspNmGadpTiFiMHH";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <487893a0-1fe8-cc08-d301-d30f34c21ab6@suse.de>
Subject: Re: [PATCH 3/5] drm/udl: Add GEM object functions for free(), vmap(),
 and vunmap()
References: <20191024144237.8898-1-tzimmermann@suse.de>
 <20191024144237.8898-4-tzimmermann@suse.de>
 <20191025074038.GQ11828@phenom.ffwll.local>
 <b3677f98-d357-8464-302b-4d1991bfc621@suse.de>
 <CAKMK7uGDHS9yQP5ZCc402_F+NyTphJjSKVR3wyHJ5j0GXUQUuw@mail.gmail.com>
In-Reply-To: <CAKMK7uGDHS9yQP5ZCc402_F+NyTphJjSKVR3wyHJ5j0GXUQUuw@mail.gmail.com>

--pjRqSPpAfHToRISUFtspNmGadpTiFiMHH
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 25.10.19 um 11:28 schrieb Daniel Vetter:
> On Fri, Oct 25, 2019 at 9:59 AM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote
>>
>> Hi
>>
>> Am 25.10.19 um 09:40 schrieb Daniel Vetter:
>>> On Thu, Oct 24, 2019 at 04:42:35PM +0200, Thomas Zimmermann wrote:
>>>> Implementing vmap() and vunmap() of struct drm_gem_object_funcs is
>>>> required by generic fbdev emulation. Supporting free() is easy as
>>>> well. More udl-specific interfaces can probably be replaced by GEM
>>>> object functions in later patches.
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> ---
>>>>  drivers/gpu/drm/udl/udl_gem.c | 34 ++++++++++++++++++++++++++++++++=
++
>>>>  1 file changed, 34 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/udl/udl_gem.c b/drivers/gpu/drm/udl/udl=
_gem.c
>>>> index 3ea0cd9ae2d6..6ca097c270d6 100644
>>>> --- a/drivers/gpu/drm/udl/udl_gem.c
>>>> +++ b/drivers/gpu/drm/udl/udl_gem.c
>>>> @@ -11,6 +11,8 @@
>>>>
>>>>  #include "udl_drv.h"
>>>>
>>>> +static const struct drm_gem_object_funcs udl_gem_object_funcs;
>>>> +
>>>>  struct udl_gem_object *udl_gem_alloc_object(struct drm_device *dev,=

>>>>                                          size_t size)
>>>>  {
>>>> @@ -25,6 +27,7 @@ struct udl_gem_object *udl_gem_alloc_object(struct=
 drm_device *dev,
>>>>              return NULL;
>>>>      }
>>>>
>>>> +    obj->base.funcs =3D &udl_gem_object_funcs;
>>>>      obj->flags =3D UDL_BO_CACHEABLE;
>>>>      return obj;
>>>>  }
>>>> @@ -230,3 +233,34 @@ int udl_gem_mmap(struct drm_file *file, struct =
drm_device *dev,
>>>>      mutex_unlock(&udl->gem_lock);
>>>>      return ret;
>>>>  }
>>>> +
>>>> +/*
>>>> + * Helpers for struct drm_gem_object_funcs
>>>> + */
>>>> +
>>>> +static void udl_gem_object_free(struct drm_gem_object *obj)
>>>> +{
>>>> +    udl_gem_free_object(obj);
>>>> +}
>>>> +
>>>> +static void *udl_gem_object_vmap(struct drm_gem_object *obj)
>>>> +{
>>>> +    struct udl_gem_object *uobj =3D to_udl_bo(obj);
>>>> +    int ret;
>>>> +
>>>> +    ret =3D udl_gem_vmap(uobj);
>>>> +    if (ret)
>>>> +            return ERR_PTR(ret);
>>>> +    return uobj->vmapping;
>>>> +}
>>>> +
>>>> +static void udl_gem_object_vunmap(struct drm_gem_object *obj, void =
*vaddr)
>>>> +{
>>>> +    return udl_gem_vunmap(to_udl_bo(obj));
>>>> +}
>>>> +
>>>> +static const struct drm_gem_object_funcs udl_gem_object_funcs =3D {=

>>>> +    .free   =3D udl_gem_object_free,
>>>> +    .vmap   =3D udl_gem_object_vmap,
>>>> +    .vunmap =3D udl_gem_object_vunmap,
>>>
>>> Yeah this doesn't work, you need to refcount the vmap here I think. I=
'd
>>
>> I see. Should have thought of that...
>>
>>> say simpler to first cut over to shmem helpers.
>>
>> Right. I was already attempting the conversion and the udl gem is more=

>> or less the same as shmem, except for the flags field. [1] The flag
>> signals page attributes for mmap-ing [2]. For prime-imported BOs its i=
s
>> set to writecombining, and for local BOs it is set to cached. Shmem
>> always maps with writecombining.
>>
>> I don't see why udl BOs are special wrt to mmap-ing. It seems to be so=
me
>> kind of optimization. Do you have an idea?
>>
>> Best regards
>> Thomas
>>
>> [1]
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/drivers/gpu/drm/udl/udl_drv.h?h=3Dv5.3#n78
>> [2]
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/drivers/gpu/drm/udl/udl_gem.c?h=3Dv5.3#n57
>=20
> udl doesn't set prefer_shadow =3D 1, which means compositors will rende=
r
> directly into the buffer. And for that you want caching. For imported
> dma-buf otoh you want wc to make sure it's coherent. Otherwise I guess
> udl would need to get the dma_buf_begin/end_cpu_access calls added
> (and that would probably be faster than going with wc for everything).
> So we do want cachable, it's going to suck otherwise.

Thanks for clarifying. Actually, it does have these calls in its dirty
handler. [1]

>=20
> But that should be fairly easy to do by overwriting the obj->mmap
> callback and wrapping it around the shmem one.

Is there a reason why shmem doesn't implement the wc-vs.cached logic?
Could this be added?

(I'm just trying to understand the available options here before
attempting to do a conversion.)

Best regards
Thomas

>=20
> What surprises me more is that udl supports mmap on imported dma-buf,
> that's some real quirky stuff. Not sure there's really other drivers
> doing that. Might be easier to rip that out :-)
> -Daniel
>=20

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/gpu/drm/udl/udl_fb.c?h=3Dv5.3#n293


--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--pjRqSPpAfHToRISUFtspNmGadpTiFiMHH--

--LD96sSY4xOAmgYOIc0RAYfzR3Wh2QwF7d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl2yyo8ACgkQaA3BHVML
eiMEAgf+P9e/+Ld4WyBpJPgnIjWxSornasvg0EojKu6amYwqY4gj2mYag8P7Bwuc
cMZwLXNXrbYU0xEb31qG4XfQsPFnNWvUE4dXxZUFzibh3wPYTSttmehhJ4qOye+r
KXdvImq+RyiJ4F3Cg6V/XX9rcmFU1E+6sZ5m40QwrzEeGdi1PW5QwvJIe30SllTa
H+0rh10+LOEaSW0JBAf99EzE5ARluA+L9q4gKccZd/p+XFzilfp05lJv4smS2ogT
CRKHsiH+tNVqZkKZU/4+X8CrXmEjbd+VEoiCrQa0S6iWSPArX1vB3jJtBejgW5Bt
HO/7ZB9Jlr100etrDgLebwHTG7JCpg==
=q7bW
-----END PGP SIGNATURE-----

--LD96sSY4xOAmgYOIc0RAYfzR3Wh2QwF7d--

--===============1503805671==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1503805671==--
