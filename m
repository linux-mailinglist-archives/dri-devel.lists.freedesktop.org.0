Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6F339F49D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 13:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D40C6EBA2;
	Tue,  8 Jun 2021 11:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BB76E902
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 11:07:09 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B4FE6219C2;
 Tue,  8 Jun 2021 11:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623150427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ypw+Yjwpf94CB9Dk8bv19k4U/Nz+t5uLrHsNZgF9Lrw=;
 b=CuPSTxPHFenT5PzLkiJRZiO9JSxAPnNV8J4jCMXqsR9EFMtdUZixcAdaJBgk/MDnxzgsGa
 2bf2759c6jdR8hggxpvDcHHJA3LtfH6GC6gCqr12/ViIyg9tMXosSYA2jnY0NvO10XldXl
 wJgtVcRkyxeXGlezm2iXpjxdW4+fQ44=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623150427;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ypw+Yjwpf94CB9Dk8bv19k4U/Nz+t5uLrHsNZgF9Lrw=;
 b=c9PBQnLYhzp82Dyezyy49Up85O702XdtI++YV63U8X8ekUZEtBLqQqpj1BTRlpVmAY/kXu
 CA66YYWKjBar7EDA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 90F5B118DD;
 Tue,  8 Jun 2021 11:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623150427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ypw+Yjwpf94CB9Dk8bv19k4U/Nz+t5uLrHsNZgF9Lrw=;
 b=CuPSTxPHFenT5PzLkiJRZiO9JSxAPnNV8J4jCMXqsR9EFMtdUZixcAdaJBgk/MDnxzgsGa
 2bf2759c6jdR8hggxpvDcHHJA3LtfH6GC6gCqr12/ViIyg9tMXosSYA2jnY0NvO10XldXl
 wJgtVcRkyxeXGlezm2iXpjxdW4+fQ44=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623150427;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ypw+Yjwpf94CB9Dk8bv19k4U/Nz+t5uLrHsNZgF9Lrw=;
 b=c9PBQnLYhzp82Dyezyy49Up85O702XdtI++YV63U8X8ekUZEtBLqQqpj1BTRlpVmAY/kXu
 CA66YYWKjBar7EDA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id xhZ8IltPv2DKFwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Jun 2021 11:07:07 +0000
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210608090301.4752-1-tzimmermann@suse.de>
 <YL8198Rj9lBlfoQE@phenom.ffwll.local>
 <CAKMK7uFDh8i_6i34eAxzhc-kPmsWde7GYUVew3YcQ8ay4qa7MA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: Don't test for IRQ support in VBLANK ioctls
Message-ID: <85445b2c-3af1-f83c-1049-cfca133e3d9f@suse.de>
Date: Tue, 8 Jun 2021 13:07:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFDh8i_6i34eAxzhc-kPmsWde7GYUVew3YcQ8ay4qa7MA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vKHTVsTB3tnlLJujphCFBb8VUZzdWabsP"
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
Cc: Dave Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vKHTVsTB3tnlLJujphCFBb8VUZzdWabsP
Content-Type: multipart/mixed; boundary="pZ6QNEcCNbRI7l0TBE8MgNJra0aoV8zwa";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Dave Airlie <airlied@linux.ie>,
 "Syrjala, Ville" <ville.syrjala@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <85445b2c-3af1-f83c-1049-cfca133e3d9f@suse.de>
Subject: Re: [PATCH] drm: Don't test for IRQ support in VBLANK ioctls
References: <20210608090301.4752-1-tzimmermann@suse.de>
 <YL8198Rj9lBlfoQE@phenom.ffwll.local>
 <CAKMK7uFDh8i_6i34eAxzhc-kPmsWde7GYUVew3YcQ8ay4qa7MA@mail.gmail.com>
In-Reply-To: <CAKMK7uFDh8i_6i34eAxzhc-kPmsWde7GYUVew3YcQ8ay4qa7MA@mail.gmail.com>

--pZ6QNEcCNbRI7l0TBE8MgNJra0aoV8zwa
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.06.21 um 11:23 schrieb Daniel Vetter:
> On Tue, Jun 8, 2021 at 11:18 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>
>> On Tue, Jun 08, 2021 at 11:03:01AM +0200, Thomas Zimmermann wrote:
>>> Replace the IRQ check in VBLANK ioctls with a check for vblank
>>> support. IRQs might be enabled wthout vblanking being supported.
>>
>> Nah, or if they are, that's a broken driver. irq_enabled here really o=
nly
>> means vblank_irq_enabled (maybe we should rename it). I'd like to
>> understand the motivation here a bit better to make sure we'r not just=

>> papering over a driver bug.

It's not about a driver bug.

For using simpledrm early during boot, at least some parts of DRM need=20
to be built into the kernel binary. I'm looking for ways to reduce the=20
size of the DRM-core objects. One low-hanging fruit is all the HW=20
mid-layers that are present in DRM. Moving them behind CONFIG_DRM_LEGACY =

reduces the size of the binary for most of us. Few build with UMS support=
=2E

The IRQ code is the final HW mid-layer that is still present. I have a=20
patchset that pushes drm_irq_install() et al into KMS drivers and moves=20
drm_irq.o behind CONFIG_DRM_LEGACY. But now all KMS drivers have to=20
maintain the irq_enabled flag, even though it's not used by most of=20
them. And in the DRM core (sans legacy) only these 3 VBLANK ioctls=20
depend on it.

The patch attemps to replace the core's dependency, so that KMS drivers=20
don't have to maintain irq_enabled. Most can then use plain=20
request_irq()/free_irq().

VBLANK support is already test-able by calling the rsp function. Or=20
there's per-CRTC state IIRC. If there really is a need for an additional =

global flag, it should be enabled via drm_vblank_init(), but not=20
drm_irq_install().

>>
>> Also as-is this breaks legacy drivers, which do enable/disable irqs at=

>> runtime with the legacy IRQ_CONTROL ioctl, so we can't just throw this=

>> out. Hence this cleanup here is only ok for non-legacy drivers.

That only affects drm_wait_vblank_ioctl(). We could have make the test a =

bit more fancy to only test this field for legacy drivers.

>>
>> Finally if you do this cleanup I think we should go through drivers an=
d
>> drop the irq_enabled =3D true settings that are littered around. For t=
hat
>> cleanup I think this patch makes sense.

As I said, it was the initial plan. For a quick grepping, drivers appear =

to use irq_enabled mostly redundantly to the core. For the few drivers=20
that might need irq_enabled, we could duplicate it in the local device=20
structure.

Best regards
Thomas

>=20
> I forgot to add: We already do this check that you're adding here
> because later on we validate the provided crtc index against
> dev->num_crtcs. vblank support is confusing because it lives both in a
> kms and legacy driver world.
> -Daniel
>=20
>>> This change also removes the DRM framework's only dependency on
>>> IRQ state for non-legacy drivers.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>   drivers/gpu/drm/drm_irq.c    | 10 +++-------
>>>   drivers/gpu/drm/drm_vblank.c |  6 +++---
>>>   2 files changed, 6 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
>>> index c3bd664ea733..1d7785721323 100644
>>> --- a/drivers/gpu/drm/drm_irq.c
>>> +++ b/drivers/gpu/drm/drm_irq.c
>>> @@ -74,10 +74,8 @@
>>>    * only supports devices with a single interrupt on the main device=
 stored in
>>>    * &drm_device.dev and set as the device paramter in drm_dev_alloc(=
).
>>>    *
>>> - * These IRQ helpers are strictly optional. Drivers which roll their=
 own only
>>> - * need to set &drm_device.irq_enabled to signal the DRM core that v=
blank
>>> - * interrupts are working. Since these helpers don't automatically c=
lean up the
>>> - * requested interrupt like e.g. devm_request_irq() they're not real=
ly
>>> + * These IRQ helpers are strictly optional. Since these helpers don'=
t automatically
>>> + * clean up the requested interrupt like e.g. devm_request_irq() the=
y're not really
>>>    * recommended.
>>>    */
>>>
>>> @@ -91,9 +89,7 @@
>>>    * and after the installation.
>>>    *
>>>    * This is the simplified helper interface provided for drivers wit=
h no special
>>> - * needs. Drivers which need to install interrupt handlers for multi=
ple
>>> - * interrupts must instead set &drm_device.irq_enabled to signal the=
 DRM core
>>> - * that vblank interrupts are available.
>>> + * needs.
>>>    *
>>>    * @irq must match the interrupt number that would be passed to req=
uest_irq(),
>>>    * if called directly instead of using this helper function.
>>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblan=
k.c
>>> index 3417e1ac7918..165286fef478 100644
>>> --- a/drivers/gpu/drm/drm_vblank.c
>>> +++ b/drivers/gpu/drm/drm_vblank.c
>>> @@ -1748,7 +1748,7 @@ int drm_wait_vblank_ioctl(struct drm_device *de=
v, void *data,
>>>        unsigned int pipe_index;
>>>        unsigned int flags, pipe, high_pipe;
>>>
>>> -     if (!dev->irq_enabled)
>>> +     if (!drm_dev_has_vblank(dev))
>>>                return -EOPNOTSUPP;
>>>
>>>        if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
>>> @@ -2023,7 +2023,7 @@ int drm_crtc_get_sequence_ioctl(struct drm_devi=
ce *dev, void *data,
>>>        if (!drm_core_check_feature(dev, DRIVER_MODESET))
>>>                return -EOPNOTSUPP;
>>>
>>> -     if (!dev->irq_enabled)
>>> +     if (!drm_dev_has_vblank(dev))
>>>                return -EOPNOTSUPP;
>>>
>>>        crtc =3D drm_crtc_find(dev, file_priv, get_seq->crtc_id);
>>> @@ -2082,7 +2082,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_de=
vice *dev, void *data,
>>>        if (!drm_core_check_feature(dev, DRIVER_MODESET))
>>>                return -EOPNOTSUPP;
>>>
>>> -     if (!dev->irq_enabled)
>>> +     if (!drm_dev_has_vblank(dev))
>>>                return -EOPNOTSUPP;
>>>
>>>        crtc =3D drm_crtc_find(dev, file_priv, queue_seq->crtc_id);
>>> --
>>> 2.31.1
>>>
>>
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch
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


--pZ6QNEcCNbRI7l0TBE8MgNJra0aoV8zwa--

--vKHTVsTB3tnlLJujphCFBb8VUZzdWabsP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmC/T1sFAwAAAAAACgkQlh/E3EQov+DB
6A//RIWbfSITuiRDYdwSma2I/SJW4cKC/uGTJ9Ot0tpOPuEe789KPEzKf0wW18xA8afsef4slrZw
pxllAnLrJkQ6oGZWNO/LornJQKcVaFX5hRG86SrXn0BcOotgFUyFRBR43nXZABfxiYl3//AKrP0l
pnpGBQvsIPU05W45oS8p+McYZBYgwI2CwfCBLtmMnUHSZeQE1kaPqwitU/BEjiw9cCROAxUlBzrF
f9j6BvuRkzfEA2k2KqcYI/pLjCWRuhWiEc3Gmjn6K25K1PB4R/4+9ZC2Dy2z30ktdjV+XlTJ5GZx
37g9+02LVpANluBiHfUoTt2/pNPC2PSzMAZOJ8688wA63jlsXYJxc+RuEpuQf/AhYfPZKLLiXTP1
MU5r4mE0VKKjXWabQ5fHfOGNafb3C/lqosqpQS5n7F4nv+R/OXvGcBy5KBQFdhpiiomQNNRDTV7j
sFr3MKKfVHsN6ysx15jmwQzI9q4+OFdrc8Bpq0fu0OFGLWti2uzLy3pFIpAV1ogGKqfijrly0Btu
BlxGvILX6UheOzOXJDGdliyb+uHoT0D9jcYDTtS0+S9OgiPlFScTG+Xpf10KYN5Gh4lIy8sjnOMd
649HqWte9yRRV6gDhQBYyL9sjzlVWgBUbU+rritsIMtqO6y2i3YeRpj7x78AWIQFCK71E1ntv6CC
hlU=
=2qDo
-----END PGP SIGNATURE-----

--vKHTVsTB3tnlLJujphCFBb8VUZzdWabsP--
