Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1013A0CFD
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 09:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334726E0EE;
	Wed,  9 Jun 2021 07:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E79F6E0EE
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 07:01:27 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 10697219BE;
 Wed,  9 Jun 2021 07:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623222086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oUkJuqf5tzIqwQMsszXFDj0oobchBlUyxZ4Pwk3rx3Y=;
 b=l0T5TKNcKDCeaq65ymaMgEizhvCnmWjNfHqRKIvPdRKAfPk38FLfCy+QVUzDpQ+Euc9KDr
 OWEn95Rwr5L4BMfNs4lezISc5bgtWagkPjGvw5rIR7hygZrMH8K0LicZZiFyJWLCK2Od5t
 E01cK7BQxgN38yVwN+gskyQQ8lI/QQM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623222086;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oUkJuqf5tzIqwQMsszXFDj0oobchBlUyxZ4Pwk3rx3Y=;
 b=hpUKjsNfrViljG+ULyjJ4/ehqlZqrS2mDSiCxDREEpC0YeOiY3T1t4R2MW48JcwV5qWkUl
 CHkOciZbXZ+HlgBg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id DD233118DD;
 Wed,  9 Jun 2021 07:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623222086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oUkJuqf5tzIqwQMsszXFDj0oobchBlUyxZ4Pwk3rx3Y=;
 b=l0T5TKNcKDCeaq65ymaMgEizhvCnmWjNfHqRKIvPdRKAfPk38FLfCy+QVUzDpQ+Euc9KDr
 OWEn95Rwr5L4BMfNs4lezISc5bgtWagkPjGvw5rIR7hygZrMH8K0LicZZiFyJWLCK2Od5t
 E01cK7BQxgN38yVwN+gskyQQ8lI/QQM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623222086;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oUkJuqf5tzIqwQMsszXFDj0oobchBlUyxZ4Pwk3rx3Y=;
 b=hpUKjsNfrViljG+ULyjJ4/ehqlZqrS2mDSiCxDREEpC0YeOiY3T1t4R2MW48JcwV5qWkUl
 CHkOciZbXZ+HlgBg==
Received: from director1.suse.de ([192.168.254.71]) by imap3-int with ESMTPSA
 id 6OQvNEVnwGCXKQAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Jun 2021 07:01:25 +0000
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210608090301.4752-1-tzimmermann@suse.de>
 <YL8198Rj9lBlfoQE@phenom.ffwll.local>
 <CAKMK7uFDh8i_6i34eAxzhc-kPmsWde7GYUVew3YcQ8ay4qa7MA@mail.gmail.com>
 <85445b2c-3af1-f83c-1049-cfca133e3d9f@suse.de>
 <CAKMK7uHVO+fW3Bt=Oag-AMCqfAM-MNKERkKm6KAKqysVcWuRuA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: Don't test for IRQ support in VBLANK ioctls
Message-ID: <caf42f58-bf72-a78f-74b2-6b40b58fe8ee@suse.de>
Date: Wed, 9 Jun 2021 09:01:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHVO+fW3Bt=Oag-AMCqfAM-MNKERkKm6KAKqysVcWuRuA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ldLnydBAEvWsJDWas82ErfAOW2ZUfLaLE"
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
--ldLnydBAEvWsJDWas82ErfAOW2ZUfLaLE
Content-Type: multipart/mixed; boundary="8rpPc2byV873ZdFvHJzlHBK490Km6oLrw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Dave Airlie <airlied@linux.ie>,
 "Syrjala, Ville" <ville.syrjala@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <caf42f58-bf72-a78f-74b2-6b40b58fe8ee@suse.de>
Subject: Re: [PATCH] drm: Don't test for IRQ support in VBLANK ioctls
References: <20210608090301.4752-1-tzimmermann@suse.de>
 <YL8198Rj9lBlfoQE@phenom.ffwll.local>
 <CAKMK7uFDh8i_6i34eAxzhc-kPmsWde7GYUVew3YcQ8ay4qa7MA@mail.gmail.com>
 <85445b2c-3af1-f83c-1049-cfca133e3d9f@suse.de>
 <CAKMK7uHVO+fW3Bt=Oag-AMCqfAM-MNKERkKm6KAKqysVcWuRuA@mail.gmail.com>
In-Reply-To: <CAKMK7uHVO+fW3Bt=Oag-AMCqfAM-MNKERkKm6KAKqysVcWuRuA@mail.gmail.com>

--8rpPc2byV873ZdFvHJzlHBK490Km6oLrw
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.06.21 um 14:39 schrieb Daniel Vetter:
> On Tue, Jun 8, 2021 at 1:07 PM Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
>>
>> Hi
>>
>> Am 08.06.21 um 11:23 schrieb Daniel Vetter:
>>> On Tue, Jun 8, 2021 at 11:18 AM Daniel Vetter <daniel@ffwll.ch> wrote=
:
>>>>
>>>> On Tue, Jun 08, 2021 at 11:03:01AM +0200, Thomas Zimmermann wrote:
>>>>> Replace the IRQ check in VBLANK ioctls with a check for vblank
>>>>> support. IRQs might be enabled wthout vblanking being supported.
>>>>
>>>> Nah, or if they are, that's a broken driver. irq_enabled here really=
 only
>>>> means vblank_irq_enabled (maybe we should rename it). I'd like to
>>>> understand the motivation here a bit better to make sure we'r not ju=
st
>>>> papering over a driver bug.
>>
>> It's not about a driver bug.
>>
>> For using simpledrm early during boot, at least some parts of DRM need=

>> to be built into the kernel binary. I'm looking for ways to reduce the=

>> size of the DRM-core objects. One low-hanging fruit is all the HW
>> mid-layers that are present in DRM. Moving them behind CONFIG_DRM_LEGA=
CY
>> reduces the size of the binary for most of us. Few build with UMS supp=
ort.
>=20
> Uh, I'd like to see the full picture for that one first. Both total
> amounts of bytes saved vs. gpu completely modularized (including all
> the fbdev/con stuff), and what this does to simpledrm. If we end up
> with duplicated code just to shave off a few bytes from the overal
> beast, then I'm not sure that's worth it.

Just some more context:

For booting with early simpledrm, the drm core and kms helpers need to=20
go into the kernel image. On my Suse Tumbleweed system (with v5.12.4),=20
the kernel binary is ~11 MiB, drm.ko is ~200 KiB and drm_kms_helper.ko=20
is ~120 KiB. The difference isn't that huge, but some of my colleagues=20
are concerned about the increase in binary's size.


So I'm looking for opportunities to improve this. Left-over legacy code=20
is an easy target to remove from the binary.

>=20
> Bunch more comments on this discussion here below.
>=20
>> The IRQ code is the final HW mid-layer that is still present. I have a=

>> patchset that pushes drm_irq_install() et al into KMS drivers and move=
s
>> drm_irq.o behind CONFIG_DRM_LEGACY. But now all KMS drivers have to
>> maintain the irq_enabled flag, even though it's not used by most of
>> them. And in the DRM core (sans legacy) only these 3 VBLANK ioctls
>> depend on it.
>>
>> The patch attemps to replace the core's dependency, so that KMS driver=
s
>> don't have to maintain irq_enabled. Most can then use plain
>> request_irq()/free_irq().
>=20
> drm_driver->irq_enabled has nothing to do with request_irq/free_irq
> for modern drivers.
>=20
>> VBLANK support is already test-able by calling the rsp function. Or
>> there's per-CRTC state IIRC. If there really is a need for an addition=
al
>> global flag, it should be enabled via drm_vblank_init(), but not
>> drm_irq_install().
>=20
> Yes, for modern drivers. Not for legacy drivers.
>=20
> Also drivers shouldn't maint the drm_device->irq_enabled flag at all,
> that's only done for legacy drivers. So if the enable/disable the irq
> over suspend/resume then if we go with the full split between kms and
> legacy driver paths, then for kms drivers they should _not_ update
> irq_enabled.
>=20
>>>> Also as-is this breaks legacy drivers, which do enable/disable irqs =
at
>>>> runtime with the legacy IRQ_CONTROL ioctl, so we can't just throw th=
is
>>>> out. Hence this cleanup here is only ok for non-legacy drivers.
>>
>> That only affects drm_wait_vblank_ioctl(). We could have make the test=
 a
>> bit more fancy to only test this field for legacy drivers.
>=20
> Yeah that's needed in there.
>=20
>>>> Finally if you do this cleanup I think we should go through drivers =
and
>>>> drop the irq_enabled =3D true settings that are littered around. For=
 that
>>>> cleanup I think this patch makes sense.
>>
>> As I said, it was the initial plan. For a quick grepping, drivers appe=
ar
>> to use irq_enabled mostly redundantly to the core. For the few drivers=

>> that might need irq_enabled, we could duplicate it in the local device=

>> structure.
>=20
> I only see 3 cases
> - legacy drivers
> - kms drivers which set it to get around these tests
> - radeon (amdgpu is just copypasta from radeon), which probably carry
> this purely for hysterical reasons back from the days when radeon.ko
> could run in both legacy or in kms mode with a cmdline option.
>=20
> There's some more drivers that use it because they don't trust the irq
> cleanup, I'd also leave them as-is.
>=20
> Legacy drivers you can ignore, radeon/amd probably to big a fish to
> fry to clean up the confusione&mess, everyone else you should be able
> to just delete all the lines that set irq_enabled to something. With
> that (but not yet your full plan to make drm_irq.c optional) and the
> fixed version of this patch (i.e. not breaking legacy drivers) I think
> this here makes sense as a cleanup.

Great, thanks for the feedback.

Best regards
Thomas

> -Daniel
>=20
>>
>> Best regards
>> Thomas
>>
>>>
>>> I forgot to add: We already do this check that you're adding here
>>> because later on we validate the provided crtc index against
>>> dev->num_crtcs. vblank support is confusing because it lives both in =
a
>>> kms and legacy driver world.
>>> -Daniel
>>>
>>>>> This change also removes the DRM framework's only dependency on
>>>>> IRQ state for non-legacy drivers.
>>>>>
>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> ---
>>>>>    drivers/gpu/drm/drm_irq.c    | 10 +++-------
>>>>>    drivers/gpu/drm/drm_vblank.c |  6 +++---
>>>>>    2 files changed, 6 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
>>>>> index c3bd664ea733..1d7785721323 100644
>>>>> --- a/drivers/gpu/drm/drm_irq.c
>>>>> +++ b/drivers/gpu/drm/drm_irq.c
>>>>> @@ -74,10 +74,8 @@
>>>>>     * only supports devices with a single interrupt on the main dev=
ice stored in
>>>>>     * &drm_device.dev and set as the device paramter in drm_dev_all=
oc().
>>>>>     *
>>>>> - * These IRQ helpers are strictly optional. Drivers which roll the=
ir own only
>>>>> - * need to set &drm_device.irq_enabled to signal the DRM core that=
 vblank
>>>>> - * interrupts are working. Since these helpers don't automatically=
 clean up the
>>>>> - * requested interrupt like e.g. devm_request_irq() they're not re=
ally
>>>>> + * These IRQ helpers are strictly optional. Since these helpers do=
n't automatically
>>>>> + * clean up the requested interrupt like e.g. devm_request_irq() t=
hey're not really
>>>>>     * recommended.
>>>>>     */
>>>>>
>>>>> @@ -91,9 +89,7 @@
>>>>>     * and after the installation.
>>>>>     *
>>>>>     * This is the simplified helper interface provided for drivers =
with no special
>>>>> - * needs. Drivers which need to install interrupt handlers for mul=
tiple
>>>>> - * interrupts must instead set &drm_device.irq_enabled to signal t=
he DRM core
>>>>> - * that vblank interrupts are available.
>>>>> + * needs.
>>>>>     *
>>>>>     * @irq must match the interrupt number that would be passed to =
request_irq(),
>>>>>     * if called directly instead of using this helper function.
>>>>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vbl=
ank.c
>>>>> index 3417e1ac7918..165286fef478 100644
>>>>> --- a/drivers/gpu/drm/drm_vblank.c
>>>>> +++ b/drivers/gpu/drm/drm_vblank.c
>>>>> @@ -1748,7 +1748,7 @@ int drm_wait_vblank_ioctl(struct drm_device *=
dev, void *data,
>>>>>         unsigned int pipe_index;
>>>>>         unsigned int flags, pipe, high_pipe;
>>>>>
>>>>> -     if (!dev->irq_enabled)
>>>>> +     if (!drm_dev_has_vblank(dev))
>>>>>                 return -EOPNOTSUPP;
>>>>>
>>>>>         if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
>>>>> @@ -2023,7 +2023,7 @@ int drm_crtc_get_sequence_ioctl(struct drm_de=
vice *dev, void *data,
>>>>>         if (!drm_core_check_feature(dev, DRIVER_MODESET))
>>>>>                 return -EOPNOTSUPP;
>>>>>
>>>>> -     if (!dev->irq_enabled)
>>>>> +     if (!drm_dev_has_vblank(dev))
>>>>>                 return -EOPNOTSUPP;
>>>>>
>>>>>         crtc =3D drm_crtc_find(dev, file_priv, get_seq->crtc_id);
>>>>> @@ -2082,7 +2082,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_=
device *dev, void *data,
>>>>>         if (!drm_core_check_feature(dev, DRIVER_MODESET))
>>>>>                 return -EOPNOTSUPP;
>>>>>
>>>>> -     if (!dev->irq_enabled)
>>>>> +     if (!drm_dev_has_vblank(dev))
>>>>>                 return -EOPNOTSUPP;
>>>>>
>>>>>         crtc =3D drm_crtc_find(dev, file_priv, queue_seq->crtc_id);=

>>>>> --
>>>>> 2.31.1
>>>>>
>>>>
>>>> --
>>>> Daniel Vetter
>>>> Software Engineer, Intel Corporation
>>>> http://blog.ffwll.ch
>>>
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


--8rpPc2byV873ZdFvHJzlHBK490Km6oLrw--

--ldLnydBAEvWsJDWas82ErfAOW2ZUfLaLE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDAZ0UFAwAAAAAACgkQlh/E3EQov+BO
MhAAjB9INVJDVJgQ9nGZ56U6VTZznTguoQzTI9dSzqpIyR5st2D7syQ5S7bjy6YoNDI7VFA19B+A
/gpPR0R/pXFO+W1cV1wEm++xlBAhxLJUe0Dd1r5Era9qV5Jkte8FSMH+t/LDdrFYTKleZ1IV6KIj
BlaO0jSfB3fr0DYkoAY1yIA14zRFDoZxsGozndHkdQ78mJAOic65y3buOUNBgJJcErlAlxKVXEb4
txDobLAQr9oKeIjbNqlaDRxSjzElgu9F8e7LwSCdIa3kI0x2nnuWtYr946vwISUFYajyIrNiPMaU
9MX6ffApXecPoj8L2jtS4btGbW8bKrl5JdD7+54INZOFQT6chhacjPegfgZXbPT/9GX20MCtA7Z0
mNiDU6vxefikjlWaA28L9EpUDTnng2FFqo33Zcz7DP8f03ruLlmsW+PZLN/LHYUnf8nDNvfrZmoP
1bd1ovZbPbK/af3rUMpqnMwnSmp/pnGeEDEz/TlngSEswh7r5IT45TWfdRnoXGC06A6VriiOX0v8
UYi+S+s879V8VHeIgUlkf0IV+mxpAYzeiTmZYk9NZHlCh4ZJpugCJp+OGijTIDLPiwkrH6Vwxetw
JysYnys+zOJONrMfljdSN8Nd3Iq3/vHQRYrMUKdZYIC/lRWs+4g+mxbqUSR7h18HdS0p6Jh641EQ
uQw=
=/siF
-----END PGP SIGNATURE-----

--ldLnydBAEvWsJDWas82ErfAOW2ZUfLaLE--
