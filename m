Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C077E126B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 08:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8B86E966;
	Wed, 23 Oct 2019 06:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E776E966
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 06:48:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 02D2EB2BF;
 Wed, 23 Oct 2019 06:48:01 +0000 (UTC)
Subject: Re: [PATCH] drm/simple-kms: Standardize arguments for callbacks
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20191022155536.27939-1-daniel.vetter@ffwll.ch>
 <56867554-5169-e249-8e55-043d07be3e99@suse.de>
 <CAKMK7uHo2L8m+VT1vSMjOdScJmuSQP032HyAFj_aYiCJu+gaRQ@mail.gmail.com>
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
Message-ID: <64a4e824-f730-2ac4-0b02-4ead2bce4b69@suse.de>
Date: Wed, 23 Oct 2019 08:47:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHo2L8m+VT1vSMjOdScJmuSQP032HyAFj_aYiCJu+gaRQ@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Emil Velikov <emil.velikov@collabora.com>, Gerd Hoffmann <kraxel@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
 NET..." <virtualization@lists.linux-foundation.org>
Content-Type: multipart/mixed; boundary="===============1739545620=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1739545620==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3738eZazcuctdTVEnimlhMqC7srKkdmvs"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3738eZazcuctdTVEnimlhMqC7srKkdmvs
Content-Type: multipart/mixed; boundary="IDpWwrnJOX80L69oW7hJJsPBaVOSySCT3";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Emil Velikov <emil.velikov@collabora.com>
Message-ID: <64a4e824-f730-2ac4-0b02-4ead2bce4b69@suse.de>
Subject: Re: [PATCH] drm/simple-kms: Standardize arguments for callbacks
References: <20191022155536.27939-1-daniel.vetter@ffwll.ch>
 <56867554-5169-e249-8e55-043d07be3e99@suse.de>
 <CAKMK7uHo2L8m+VT1vSMjOdScJmuSQP032HyAFj_aYiCJu+gaRQ@mail.gmail.com>
In-Reply-To: <CAKMK7uHo2L8m+VT1vSMjOdScJmuSQP032HyAFj_aYiCJu+gaRQ@mail.gmail.com>

--IDpWwrnJOX80L69oW7hJJsPBaVOSySCT3
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 22.10.19 um 21:03 schrieb Daniel Vetter:
> On Tue, Oct 22, 2019 at 7:16 PM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
>>
>> Hi,
>>
>> there are two types of callbacks in struct
>> drm_simple_display_pipe_funcs: functions that are genuine to simple KM=
S,
>> and functions that are merely forwarded from another structure (crtc,
>> plane, etc).
>>
>> In the former category are enable(), disable(), check(), and update().=

>> Those should probably receive a simple display pipe as their first arg=
ument.
>=20
> mode_valid _very_ much belongs to this category too, since there's
> mode_valid hooks also on other objects. But simple pipe helper
> condenses that down to one mode_valid hook (we could also put the
> mode_valid onto encoder, wouldn't change anything).
>=20
>> In the latter category are mode_valid(), prepare_fb(), cleanup_fb(),
>> enable_vblank(), and disable_vblank(). IMHO those functions should
>> receive a pointer to the original structure as their first argument.
>> This type provides the context in which the operations make sense. (Ev=
en
>> their documentation already refers to the original structure.)
>=20
> Now on those you can maybe make a case that they only exist in one
> object. But the entire point of simple helpers was to condense the zoo
> of drm types down to one. Only reason you don't also get a
> drm_simple_display_pipe_state is that this one would be a bit more
> work to make work correctly. If we full on leak all the underlying
> objects, then you might as well set them up yourself and set up all
> the hooks, it's just a few more lines of code.
>=20
> Imo for simple pipe we should go more into that direction, not less.
>=20
>> I admit that not all are as shareable as prepare_fb() and enable_fb().=

>> But what else than boiler-plate wrappers do we get from simple display=

>> pipe here?
>=20
> Boiler plate wrappers is pretty much the entire point of simple pipe
> helpers. Anytime you're interested in the things it abstracts away
> (crtc, plane, encoder) you probably want your own atomic
> implementation.

I was speaking of boiler-plate code in drivers and other helpers (e.g.,
drm_gem_fb_simple_display_pipe_prepare_fb() )

TBH I don't think it is possible to build and use simple pipe without
exposing the underlying primitives (crtc, plane, connector). This would
require a completely separate set of atomic helpers. IMHO the current
simple pipe is a mid-layer and comes with typical mid-layer problems.

Anyway, given your rational for the current design, I'll update my
recent patches for prepare_fb() to support simple pipe.

For this patch

  Acked-By: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

> conversion is a good fit, it's not meant to be useful for all small
> drivers. Only for the _really_ simple ones.
>=20
> Otherwise if we readd all the bells and whistles to simple pipe
> helpers, then we just end back where we started. That's also why I
> personally think explicit simple wrappers would fit better, instead of
> wrestling the prepare/cleanup_fb functions to match full atomic
> helpers.
> -Daniel
>=20
>>
>> Best regards
>> Thomas
>>
>> Am 22.10.19 um 17:55 schrieb Daniel Vetter:
>>> Passing the wrong type feels icky, everywhere else we use the pipe as=

>>> the first parameter. Spotted while discussing patches with Thomas
>>> Zimmermann.
>>>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
>>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>>> Cc: Eric Anholt <eric@anholt.net>
>>> Cc: Emil Velikov <emil.velikov@collabora.com>
>>> Cc: virtualization@lists.linux-foundation.org
>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>> ---
>>>  drivers/gpu/drm/cirrus/cirrus.c         | 2 +-
>>>  drivers/gpu/drm/drm_simple_kms_helper.c | 2 +-
>>>  drivers/gpu/drm/pl111/pl111_display.c   | 4 ++--
>>>  include/drm/drm_simple_kms_helper.h     | 2 +-
>>>  4 files changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/cirrus/cirrus.c b/drivers/gpu/drm/cirrus=
/cirrus.c
>>> index 7d08d067e1a4..248c9f765c45 100644
>>> --- a/drivers/gpu/drm/cirrus/cirrus.c
>>> +++ b/drivers/gpu/drm/cirrus/cirrus.c
>>> @@ -390,7 +390,7 @@ static int cirrus_conn_init(struct cirrus_device =
*cirrus)
>>>  /* -----------------------------------------------------------------=
- */
>>>  /* cirrus (simple) display pipe                                     =
       */
>>>
>>> -static enum drm_mode_status cirrus_pipe_mode_valid(struct drm_crtc *=
crtc,
>>> +static enum drm_mode_status cirrus_pipe_mode_valid(struct drm_simple=
_display_pipe *pipe,
>>>                                                  const struct drm_dis=
play_mode *mode)
>>>  {
>>>       if (cirrus_check_size(mode->hdisplay, mode->vdisplay, NULL) < 0=
)
>>> diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/dr=
m/drm_simple_kms_helper.c
>>> index 046055719245..15fb516ae2d8 100644
>>> --- a/drivers/gpu/drm/drm_simple_kms_helper.c
>>> +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
>>> @@ -43,7 +43,7 @@ drm_simple_kms_crtc_mode_valid(struct drm_crtc *crt=
c,
>>>               /* Anything goes */
>>>               return MODE_OK;
>>>
>>> -     return pipe->funcs->mode_valid(crtc, mode);
>>> +     return pipe->funcs->mode_valid(pipe, mode);
>>>  }
>>>
>>>  static int drm_simple_kms_crtc_check(struct drm_crtc *crtc,
>>> diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/=
pl111/pl111_display.c
>>> index 024771a4083e..703ddc803c55 100644
>>> --- a/drivers/gpu/drm/pl111/pl111_display.c
>>> +++ b/drivers/gpu/drm/pl111/pl111_display.c
>>> @@ -48,10 +48,10 @@ irqreturn_t pl111_irq(int irq, void *data)
>>>  }
>>>
>>>  static enum drm_mode_status
>>> -pl111_mode_valid(struct drm_crtc *crtc,
>>> +pl111_mode_valid(struct drm_simple_display_pipe *pipe,
>>>                const struct drm_display_mode *mode)
>>>  {
>>> -     struct drm_device *drm =3D crtc->dev;
>>> +     struct drm_device *drm =3D pipe->crtc.dev;
>>>       struct pl111_drm_dev_private *priv =3D drm->dev_private;
>>>       u32 cpp =3D priv->variant->fb_bpp / 8;
>>>       u64 bw;
>>> diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_si=
mple_kms_helper.h
>>> index 4d89cd0a60db..15afee9cf049 100644
>>> --- a/include/drm/drm_simple_kms_helper.h
>>> +++ b/include/drm/drm_simple_kms_helper.h
>>> @@ -49,7 +49,7 @@ struct drm_simple_display_pipe_funcs {
>>>        *
>>>        * drm_mode_status Enum
>>>        */
>>> -     enum drm_mode_status (*mode_valid)(struct drm_crtc *crtc,
>>> +     enum drm_mode_status (*mode_valid)(struct drm_simple_display_pi=
pe *pipe,
>>>                                          const struct drm_display_mod=
e *mode);
>>>
>>>       /**
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


--IDpWwrnJOX80L69oW7hJJsPBaVOSySCT3--

--3738eZazcuctdTVEnimlhMqC7srKkdmvs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl2v96AACgkQaA3BHVML
eiNyQAf/bHb3V1RDufKDc3sepf4QTxO+0RDoM9lloJKdcVq9t26IfQAMinzjluEk
zxwOy0pdI1VjWMdqnKNeTuUpmndh6kSsDhLkSB/zJtZme5ORRrfovA7/I5pkGwiQ
Oc9wLEv5OlVv8Q0b08eNeaN6WE3UrurKXL4y8nt7uuuBVyQEu84xkVlw4+4PuHFo
Oz19wOwkIhPhUQLlI/9+KyNWo4wEZfElWB9c8+FXk2IzoD1UlAFxbELQR+KWpqfS
1W7LPRboFODusOuCa9jt9p+yR3qGWjkasJu4Wna7gxLBi+bmyZ/v6lLB3fEFRnA2
oSuy2HOjtF/3pVjRMv3ceTn40o88QA==
=ZgIZ
-----END PGP SIGNATURE-----

--3738eZazcuctdTVEnimlhMqC7srKkdmvs--

--===============1739545620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1739545620==--
