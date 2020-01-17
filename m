Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E40140466
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 08:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3877C6F3E9;
	Fri, 17 Jan 2020 07:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BD06F3E9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 07:17:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7DF46AAB8;
 Fri, 17 Jan 2020 07:17:17 +0000 (UTC)
Subject: Re: [PATCH v2 4/4] drm/simple-kms: Let DRM core send VBLANK events by
 default
To: Daniel Vetter <daniel@ffwll.ch>, Emil Velikov <emil.l.velikov@gmail.com>
References: <20200115125226.13843-1-tzimmermann@suse.de>
 <20200115125226.13843-5-tzimmermann@suse.de>
 <20200116064107.GB8400@dvetter-linux.ger.corp.intel.com>
 <33fdd33f-ce8d-70d3-544e-fac727d2686b@suse.de>
 <CACvgo52gwC6U5HjnsQSUUDgE7Gp_EDb-QqCY8VDFjAX7cE0Lxg@mail.gmail.com>
 <20200116235951.GD8400@dvetter-linux.ger.corp.intel.com>
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
Message-ID: <fa8a22b5-9c19-7896-5b0d-06b038ed4862@suse.de>
Date: Fri, 17 Jan 2020 08:17:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200116235951.GD8400@dvetter-linux.ger.corp.intel.com>
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
Cc: david@lechnology.com, oleksandr_andrushchenko@epam.com,
 Dave Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 xen-devel@lists.xenproject.org, Emil Velikov <emil.velikov@collabora.com>,
 Sean Paul <sean@poorly.run>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/mixed; boundary="===============0362535187=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0362535187==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="31xbyValn4E7bq95B5drBIEMmXCNmZCnm"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--31xbyValn4E7bq95B5drBIEMmXCNmZCnm
Content-Type: multipart/mixed; boundary="S5QhwU6gaKPyTq4N0LqU8xziaGJOq80j1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>, Emil Velikov <emil.l.velikov@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 oleksandr_andrushchenko@epam.com, Dave Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Hans de Goede <hdegoede@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 xen-devel@lists.xenproject.org, Emil Velikov <emil.velikov@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>, david@lechnology.com
Message-ID: <fa8a22b5-9c19-7896-5b0d-06b038ed4862@suse.de>
Subject: Re: [PATCH v2 4/4] drm/simple-kms: Let DRM core send VBLANK events by
 default
References: <20200115125226.13843-1-tzimmermann@suse.de>
 <20200115125226.13843-5-tzimmermann@suse.de>
 <20200116064107.GB8400@dvetter-linux.ger.corp.intel.com>
 <33fdd33f-ce8d-70d3-544e-fac727d2686b@suse.de>
 <CACvgo52gwC6U5HjnsQSUUDgE7Gp_EDb-QqCY8VDFjAX7cE0Lxg@mail.gmail.com>
 <20200116235951.GD8400@dvetter-linux.ger.corp.intel.com>
In-Reply-To: <20200116235951.GD8400@dvetter-linux.ger.corp.intel.com>

--S5QhwU6gaKPyTq4N0LqU8xziaGJOq80j1
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 17.01.20 um 00:59 schrieb Daniel Vetter:
> On Thu, Jan 16, 2020 at 05:22:34PM +0000, Emil Velikov wrote:
>> Hi all,
>>
>> On Thu, 16 Jan 2020 at 07:37, Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
>>
>>>> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu=
/drm/drm_atomic_state_helper.c
>>>> index 7cf3cf936547..23d2f51fc1d4 100644
>>>> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
>>>> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
>>>> @@ -149,6 +149,11 @@ void __drm_atomic_helper_crtc_duplicate_state(s=
truct drm_crtc *crtc,
>>>>       /* Self refresh should be canceled when a new update is availa=
ble */
>>>>       state->active =3D drm_atomic_crtc_effectively_active(state);
>>>>       state->self_refresh_active =3D false;
>>>> +
>>>> +     if (drm_dev_has_vblank(crtc->dev))
>>>> +             state->no_vblank =3D true;
>>>> +     else
>>>> +             state->no_vblank =3D false;
>>>>  }
>>>>  EXPORT_SYMBOL(__drm_atomic_helper_crtc_duplicate_state);
>>>
>>> I think the if/else branches are in the wrong order.
>=20
> Yeah fumbled that.
>=20
>>> But generally speaking, is it really that easy? The xen driver alread=
y
>>> has to work around simple-kms's auto-enabling of no_vblank (see patch=

>>> 4). Maybe this settings interferes with other drivers as well. At lea=
st
>>> the calls for sending fake vblanks should be removed from all affecte=
d
>>> drivers.
>=20
> Hm xen is really special, in that it has a flip complete event, but not=
 a
> vblank. I think forcing drivers to overwrite stuff in that case makes
> sense.
>=20
>> I'm not sure if setting no_vblank based on dev->num_crtcs is the corre=
ct thing.
>> From the original commit and associated description for no_vblank:
>>
>> In some cases CRTCs are active but are not able to generating events, =
at
>> least not at every frame at it's expected to.
>> This is typically the case when the CRTC is feeding a writeback connec=
tor...
>=20
> Yeah, but Thomas' series here wants to extend that. And I think if we r=
oll
> this out the common case will be "no hw vblank", and the writeback spec=
ial

Default values should usually be 0 for zalloc and static initializers.
Should we rename no_vblank to has_vblank then?

> case is going to be the exception to the exception. Yup, patch 1 that
> updates the docs doesn't reflect that, which is why I'm bringing up mor=
e
> suggestions here around code & semantics of all these pieces to make th=
em
> do the most reasonable thing for most of the drivers.
>=20
>> Reflects the ability of a CRTC to send VBLANK events....
>>
>>
>> The proposed handling of no_vblank feels a little dirty, although
>> nothing better comes to mind.
>> Nevertheless code seems perfectly reasonable, so if it were me I'd mer=
ge it.
>=20
> The idea with setting it very early is that drivers can overwrite it ve=
ry
> easily. Feels slightly dirty, so I guess we could also set it somewhere=
 in
> the atomic_helper_check function (similar to how we set the various
> crtc->*_changed flags, but we're not entirely consistent on these eithe=
r).
>=20
> For the overall thing what feels irky to me is making this no_vblank
> default logic (however we end up computing it in the end, whether like
> this or what I suggested) specific to simple pipe helpers feels kinda
> wrong. Simple pipe tends to have a higher ratio of drivers for hw witho=
ut
> vblank support, but by far not the only ones. Having that special case
> feels confusing to me (and likely will trip up some people, vblank and
> event handling is already a huge source of confusion in drm).

Making it a default for simple KMS was only the start. I intended to
cover all drivers at some point. I just didn't want to go through all
drivers at once.

I guess for the patchset's v3 I'll audit all drivers for the use of
no_blank and drm_crtc_send_vblank_event(); and convert the possible
candidates.

Best regards
Thomas

>=20
> One idea behind drm_dev_has_vblank() is also that we could formalize a =
bit
> all that, at least for the usual case - xen and maybe others being some=

> exceptions as usual (hence definitely not something the core code shoul=
d
> handle).
>=20
> Cheers, Daniel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--S5QhwU6gaKPyTq4N0LqU8xziaGJOq80j1--

--31xbyValn4E7bq95B5drBIEMmXCNmZCnm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4hX3oACgkQaA3BHVML
eiOx3wf+JL6tqWlEX9L40nwERe3Rlr1Xvm8ER1K8MDUck/KmXTB3g7JQAG5VJNK0
GS6Ty7upA/SBZqxeI/cj96fVQ/Gq4WmZ+89EeTDXI5BNm56vJeL+VF+7BW1nSYGn
MqaKotRUhYOTRShgDRlSzyhvZCTQG82HUQb50y/dPGJMb5a48qwxG4XVhc24zV6V
Suw+MpBWQlYwOqKXGviNiJUfSvS7XhH4r66hDPcJLawuCG3LCp7m5r0JcZJW2qbL
SBmdgjJ4NeLr7oteSPn2BOEW8+9Zas86xaV5Ekxn/oRR3Jw9W+1uWWYVQlycpWJz
3t3ViGqnZGaSTTCI4P25n4iJGgkXIA==
=RnyY
-----END PGP SIGNATURE-----

--31xbyValn4E7bq95B5drBIEMmXCNmZCnm--

--===============0362535187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0362535187==--
