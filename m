Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C833E22C259
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 11:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A50D6E4F4;
	Fri, 24 Jul 2020 09:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1D76E4F4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 09:33:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6C766AC90;
 Fri, 24 Jul 2020 09:33:55 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] drm: add drmm_encoder_init()
To: Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20200723145614.18459-1-p.zabel@pengutronix.de>
 <cfffabc0edc59c33f2c0a77276bee20cafe11220.camel@pengutronix.de>
 <CAKMK7uGaAtk4AY5y=jbC7nDduRYFBfLSdHE8wykJ602Lk-3n+Q@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <6270df98-1f28-b4a6-6309-6420781cd444@suse.de>
Date: Fri, 24 Jul 2020 11:33:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGaAtk4AY5y=jbC7nDduRYFBfLSdHE8wykJ602Lk-3n+Q@mail.gmail.com>
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
Cc: Sascha Hauer <kernel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0576490755=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0576490755==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Le3jT9cHv7keWC1ZV9Pbx8Vay7Bzbyuxc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Le3jT9cHv7keWC1ZV9Pbx8Vay7Bzbyuxc
Content-Type: multipart/mixed; boundary="ftJnEeWVDbqJ0LO1cGiCEfEXBTy84wrmJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Sascha Hauer <kernel@pengutronix.de>
Message-ID: <6270df98-1f28-b4a6-6309-6420781cd444@suse.de>
Subject: Re: [PATCH v2 1/2] drm: add drmm_encoder_init()
References: <20200723145614.18459-1-p.zabel@pengutronix.de>
 <cfffabc0edc59c33f2c0a77276bee20cafe11220.camel@pengutronix.de>
 <CAKMK7uGaAtk4AY5y=jbC7nDduRYFBfLSdHE8wykJ602Lk-3n+Q@mail.gmail.com>
In-Reply-To: <CAKMK7uGaAtk4AY5y=jbC7nDduRYFBfLSdHE8wykJ602Lk-3n+Q@mail.gmail.com>

--ftJnEeWVDbqJ0LO1cGiCEfEXBTy84wrmJ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 24.07.20 um 11:07 schrieb Daniel Vetter:
> On Fri, Jul 24, 2020 at 10:49 AM Philipp Zabel <p.zabel@pengutronix.de>=
 wrote:
>>
>> On Thu, 2020-07-23 at 16:56 +0200, Philipp Zabel wrote:
>>> Add a drm_encoder_init() variant that allocates an encoder with
>>> drmm_kzalloc() and registers drm_encoder_cleanup() with
>>> drmm_add_action_or_reset().
>>>
>>> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
>=20
> Thanks for doing this!
>=20
>>> ---
>>> New in v2
>>> ---
>>>  drivers/gpu/drm/drm_encoder.c | 101 ++++++++++++++++++++++++++------=
--
>>>  include/drm/drm_encoder.h     |  30 ++++++++++
>>>  2 files changed, 108 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_enco=
der.c
>>> index e555281f43d4..91184f67333c 100644
>>> --- a/drivers/gpu/drm/drm_encoder.c
>>> +++ b/drivers/gpu/drm/drm_encoder.c
>>> @@ -26,6 +26,7 @@
>>>  #include <drm/drm_device.h>
>>>  #include <drm/drm_drv.h>
>>>  #include <drm/drm_encoder.h>
>>> +#include <drm/drm_managed.h>
>>>
>>>  #include "drm_crtc_internal.h"
>>>
>>> @@ -91,25 +92,10 @@ void drm_encoder_unregister_all(struct drm_device=
 *dev)
>>>       }
>>>  }
>>>
>>> -/**
>>> - * drm_encoder_init - Init a preallocated encoder
>>> - * @dev: drm device
>>> - * @encoder: the encoder to init
>>> - * @funcs: callbacks for this encoder
>>> - * @encoder_type: user visible type of the encoder
>>> - * @name: printf style format string for the encoder name, or NULL f=
or default name
>>> - *
>>> - * Initialises a preallocated encoder. Encoder should be subclassed =
as part of
>>> - * driver encoder objects. At driver unload time drm_encoder_cleanup=
() should be
>>> - * called from the driver's &drm_encoder_funcs.destroy hook.
>>> - *
>>> - * Returns:
>>> - * Zero on success, error code on failure.
>>> - */
>>> -int drm_encoder_init(struct drm_device *dev,
>>> -                  struct drm_encoder *encoder,
>>> -                  const struct drm_encoder_funcs *funcs,
>>> -                  int encoder_type, const char *name, ...)
>>> +static int __drm_encoder_init(struct drm_device *dev,
>>> +                           struct drm_encoder *encoder,
>>> +                           const struct drm_encoder_funcs *funcs,
>>> +                           int encoder_type, const char *name, va_li=
st ap)
>>>  {
>>>       int ret;
>>>
>>> @@ -125,11 +111,7 @@ int drm_encoder_init(struct drm_device *dev,
>>>       encoder->encoder_type =3D encoder_type;
>>>       encoder->funcs =3D funcs;
>>>       if (name) {
>>> -             va_list ap;
>>> -
>>> -             va_start(ap, name);
>>>               encoder->name =3D kvasprintf(GFP_KERNEL, name, ap);
>>> -             va_end(ap);
>>>       } else {
>>>               encoder->name =3D kasprintf(GFP_KERNEL, "%s-%d",
>>>                                         drm_encoder_enum_list[encoder=
_type].name,
>>> @@ -150,6 +132,38 @@ int drm_encoder_init(struct drm_device *dev,
>>>
>>>       return ret;
>>>  }
>>> +
>>> +/**
>>> + * drm_encoder_init - Init a preallocated encoder
>>> + * @dev: drm device
>>> + * @encoder: the encoder to init
>>> + * @funcs: callbacks for this encoder
>>> + * @encoder_type: user visible type of the encoder
>>> + * @name: printf style format string for the encoder name, or NULL f=
or default name
>>> + *
>>> + * Initialises a preallocated encoder. Encoder should be subclassed =
as part of
>>> + * driver encoder objects. At driver unload time drm_encoder_cleanup=
() should be
>>> + * called from the driver's &drm_encoder_funcs.destroy hook.
>>> + *
>>> + * Returns:
>>> + * Zero on success, error code on failure.
>>> + */
>>> +int drm_encoder_init(struct drm_device *dev,
>>> +                  struct drm_encoder *encoder,
>>> +                  const struct drm_encoder_funcs *funcs,
>>> +                  int encoder_type, const char *name, ...)
>>> +{
>>> +     va_list ap;
>>> +     int ret;
>>> +
>>> +     if (name)
>>> +             va_start(ap, name);
>>> +     ret =3D __drm_encoder_init(dev, encoder, funcs, encoder_type, n=
ame, ap);
>>> +     if (name)
>>> +             va_end(ap);
>>> +
>>> +     return ret;
>>> +}
>>>  EXPORT_SYMBOL(drm_encoder_init);
>>>
>>>  /**
>>> @@ -181,6 +195,47 @@ void drm_encoder_cleanup(struct drm_encoder *enc=
oder)
>>>  }
>>>  EXPORT_SYMBOL(drm_encoder_cleanup);
>>>
>>> +void drmm_encoder_init_release(struct drm_device *dev, void *ptr)
>>> +{
>>> +     struct drm_encoder *encoder =3D ptr;
>>
>> I'll add
>>
>>         if (WARN_ON(!encoder->dev))
>>                 return;
>>
>> here.
>>
>>> +     drm_encoder_cleanup(encoder);
>>> +}
>>> +
>>> +void *__drmm_encoder_init(struct drm_device *dev, size_t size, size_=
t offset,
>>> +                       const struct drm_encoder_funcs *funcs,
>>> +                       int encoder_type, const char *name, ...)
>>> +{
>>> +     void *container;
>>> +     struct drm_encoder *encoder;
>>> +     va_list ap;
>>> +     int ret;
>>> +
>>> +     if (WARN_ON(!funcs || funcs->destroy))
>>> +             return ERR_PTR(-EINVAL);
>>> +
>>> +     container =3D drmm_kzalloc(dev, size, GFP_KERNEL);
>>> +     if (!container)
>>> +             return ERR_PTR(-EINVAL);
>>> +
>>> +     encoder =3D container + offset;
>>> +
>>> +     if (name)
>>> +             va_start(ap, name);
>>> +     ret =3D __drm_encoder_init(dev, encoder, funcs, encoder_type, n=
ame, ap);
>>> +     if (name)
>>> +             va_end(ap);
>>> +     if (ret)
>>> +             return ERR_PTR(ret);
>>> +
>>> +     ret =3D drmm_add_action_or_reset(dev, drmm_encoder_init_release=
, encoder);
>>> +     if (ret)
>>> +             return ERR_PTR(ret);
>>> +
>>> +     return container;
>>> +}
>>> +EXPORT_SYMBOL(__drmm_encoder_init);
>>> +
>>>  static struct drm_crtc *drm_encoder_get_crtc(struct drm_encoder *enc=
oder)
>>>  {
>>>       struct drm_connector *connector;
>>> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
>>> index a60f5f1555ac..54b82554ee88 100644
>>> --- a/include/drm/drm_encoder.h
>>> +++ b/include/drm/drm_encoder.h
>>> @@ -195,6 +195,36 @@ int drm_encoder_init(struct drm_device *dev,
>>>                    const struct drm_encoder_funcs *funcs,
>>>                    int encoder_type, const char *name, ...);
>>>
>>> +__printf(6, 7)
>>> +void *__drmm_encoder_init(struct drm_device *dev,
>>> +                       size_t size, size_t offset,
>>> +                       const struct drm_encoder_funcs *funcs,
>>> +                       int encoder_type,
>>> +                       const char *name, ...);
>>> +
>>> +/**
>>> + * drmm_encoder_init - Allocate and initialize an encoder
>>> + * @dev: drm device
>>> + * @type: the type of the struct which contains struct &drm_encoder
>>> + * @member: the name of the &drm_encoder within @type.
>>> + * @funcs: callbacks for this encoder
>>> + * @encoder_type: user visible type of the encoder
>>> + * @name: printf style format string for the encoder name, or NULL f=
or default name
>>> + *
>>> + * Allocates and initializes an encoder. Encoder should be subclasse=
d as part of
>>> + * driver encoder objects. Cleanup is automatically handled through =
registering
>>> + * drm_encoder_cleanup() with drmm_add_action().
>>> + *
>>> + * The @drm_encoder_funcs.destroy hook must be NULL.
>>> + *
>>> + * Returns:
>>> + * Pointer to new encoder, or ERR_PTR on failure.
>>> + */
>>> +#define drmm_encoder_init(dev, type, member, funcs, encoder_type, na=
me, ...) \
>>> +     ((type *) __drmm_encoder_init(dev, sizeof(type), \
>>> +                                   offsetof(type, member), funcs, \
>>> +                                   encoder_type, name, ##__VA_ARGS__=
))
>>> +
>>
>> Should this be called drmm_encoder_alloc instead?
>=20
> Yes. Same for the internal helper for consistency. Also see my other

I'd suggest calling it drmm_encoder_create() to express that it's _alloc
+ _init. Calling it just _alloc sounds as if it doesn't do the _init.

Best regards
Thomas

> reply, if the _alloc() variant is all that's needed that makes me
> happy, since then we don't need to code up the drmm_assert_managed
> check for the _init() variants to make sure drivers dont give it
> something stupid like a devm_kzalloc range :-)
> -Daniel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--ftJnEeWVDbqJ0LO1cGiCEfEXBTy84wrmJ--

--Le3jT9cHv7keWC1ZV9Pbx8Vay7Bzbyuxc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8aqvYUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiM6Jgf9GJolzclnUSdg+sdPaGYj9qP09taz
RxSeE3vvE/kxhCeb2gufOJZtQJLjKHKAAAhd7yqhJlXAL5Efz/51VRqKekKDEF24
G1D0Wqtm3itYpDQaU9D6xiUs3QTaGkAd54rD/LmEEPAFO0jkXIDtlvPJv2VhumMJ
XBVCgtPeogv1b3I8FAGtMgWr0qWRYNfAXsIiqkiQ5QRGmbYv+7j8jVs1iMQaq3c5
JlbE1YgWdXnbaH1+CFXj7iIWAOr7ihyHqbZD12rn/5lreuq0pcJ5sVwk0dWTgsSJ
ZE4SL9k/kfhM9fF2Wcr8D5LIBP0dX0yq0YL0LqFs6JK0gGcW/FMx+7/z4Q==
=Mc2W
-----END PGP SIGNATURE-----

--Le3jT9cHv7keWC1ZV9Pbx8Vay7Bzbyuxc--

--===============0576490755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0576490755==--
