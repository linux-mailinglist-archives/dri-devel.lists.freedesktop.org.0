Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A1214A9F3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 19:42:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50E66E8AA;
	Mon, 27 Jan 2020 18:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884B86E8A2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 18:42:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 097A7B13C;
 Mon, 27 Jan 2020 18:42:31 +0000 (UTC)
Subject: Re: [PATCH v4 01/15] drm: Initialize struct drm_crtc_state.no_vblank
 from device settings
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20200123092123.28368-1-tzimmermann@suse.de>
 <20200123092123.28368-2-tzimmermann@suse.de>
 <CACvgo53YvKjPNNshZoTjJehHyOX6e05kJ5gAXtjwxs+oLLv7vw@mail.gmail.com>
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
Message-ID: <183782e6-164c-bae8-90e0-906edb059a1d@suse.de>
Date: Mon, 27 Jan 2020 19:42:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CACvgo53YvKjPNNshZoTjJehHyOX6e05kJ5gAXtjwxs+oLLv7vw@mail.gmail.com>
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
 Hans de Goede <hdegoede@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 xen-devel@lists.xenproject.org, Emil Velikov <emil.velikov@collabora.com>,
 Sean Paul <sean@poorly.run>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============1669228699=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1669228699==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xOxj5EAc8eozWsu9aetd70iPvMav8MAEx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xOxj5EAc8eozWsu9aetd70iPvMav8MAEx
Content-Type: multipart/mixed; boundary="plrgK2rFyOclW2N2pxB9OddQThC5DZIA4";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 david@lechnology.com, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Sean Paul <sean@poorly.run>, oleksandr_andrushchenko@epam.com,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Emil Velikov <emil.velikov@collabora.com>, xen-devel@lists.xenproject.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Message-ID: <183782e6-164c-bae8-90e0-906edb059a1d@suse.de>
Subject: Re: [PATCH v4 01/15] drm: Initialize struct drm_crtc_state.no_vblank
 from device settings
References: <20200123092123.28368-1-tzimmermann@suse.de>
 <20200123092123.28368-2-tzimmermann@suse.de>
 <CACvgo53YvKjPNNshZoTjJehHyOX6e05kJ5gAXtjwxs+oLLv7vw@mail.gmail.com>
In-Reply-To: <CACvgo53YvKjPNNshZoTjJehHyOX6e05kJ5gAXtjwxs+oLLv7vw@mail.gmail.com>

--plrgK2rFyOclW2N2pxB9OddQThC5DZIA4
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Emil

Am 27.01.20 um 19:12 schrieb Emil Velikov:
> Hi Thomas,
>=20
> On Thu, 23 Jan 2020 at 09:21, Thomas Zimmermann <tzimmermann@suse.de> w=
rote:
>=20
>> @@ -174,12 +174,22 @@ struct drm_crtc_state {
>>          * @no_vblank:
>>          *
>>          * Reflects the ability of a CRTC to send VBLANK events. This =
state
>> -        * usually depends on the pipeline configuration, and the main=
 usuage
>> -        * is CRTCs feeding a writeback connector operating in oneshot=
 mode.
>> -        * In this case the VBLANK event is only generated when a job =
is queued
>> -        * to the writeback connector, and we want the core to fake VB=
LANK
>> -        * events when this part of the pipeline hasn't changed but ot=
hers had
>> -        * or when the CRTC and connectors are being disabled.
>> +        * usually depends on the pipeline configuration. If set to tr=
ue, DRM
>> +        * atomic helpers will sendout a fake VBLANK event during disp=
lay
>> +        * updates.
>> +        *
>> +        * One usage is for drivers and/or hardware without support fo=
r VBLANK
>> +        * interrupts. Such drivers typically do not initialize vblank=
ing
>> +        * (i.e., call drm_vblank_init() wit the number of CRTCs). For=
 CRTCs
>> +        * without initialized vblanking, the field is initialized to =
true and
>> +        * a VBLANK event will be send out on each update of the displ=
ay
>> +        * pipeline.
>> +        *
>> +        * Another usage is CRTCs feeding a writeback connector operat=
ing in
>> +        * oneshot mode. In this case the VBLANK event is only generat=
ed when
>> +        * a job is queued to the writeback connector, and we want the=
 core
>> +        * to fake VBLANK events when this part of the pipeline hasn't=
 changed
>> +        * but others had or when the CRTC and connectors are being di=
sabled.
>>          *
>=20
> Perhaps it's just me, yet the following ideas would make the topic
> significantly easier and clearer.
>=20
>  - adding explicit "fake" when talking about drm/atomic _helpers_
> generating/sending a VBLANK event.
> For example, in 15/15 the commit message says "fake", while inline
> comment omits it... Leading to the confusion pointed out.

No problem on being more precise here. I'll update the docs accordingly.

>=20
> - s/no_vblank/fake_vblank/g or s/no_vblank/no_hw_vblank/g
> Simple and concise. With slight inclination towards the former wording =
:-)

I'd prefer to not change the field's name. The current name 'no_vblank'
indicates state and lets helpers decide what to do with it. The name
'fake_vblank' indicates an instruction to the helpers, telling them what
to do. It does neither seem to fit into drm_crtc_state, nor into the
overall concept.

Best regards
Thomas

>=20
> If you and Daniel agree with the rename, then the first sentence of
> the description should probably be tweaked.
>=20
> HTH
> Emil
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--plrgK2rFyOclW2N2pxB9OddQThC5DZIA4--

--xOxj5EAc8eozWsu9aetd70iPvMav8MAEx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4vLxMACgkQaA3BHVML
eiMniQgAoMHRhI6ErQBZBW15wxr+4WFi1xiReRxPUJNhDs1YsUJvsMwE0AXBHbkh
j5lmVFmbd5rv/EMgDYibBpMVY/zAL1EYuuqxdEVS6YmhH63SUWNtIvcfnIakofEK
2MvRXne7UCX1Nh0l1vxr3iYailXChIGSC4FLQb3SrgDUGKGZw+pBEIH+7w4hwXOY
yVIPmaCLUXIcjBX1Wu6CA0IP2BinpAVa+6lpUJ7H2628CVTzwV5p7VyZhtEUawlJ
KR4W0gb1z864Biqs0IA2Ukp7WKHY51L96JhqwWofJULi5xIsmFptyW/gVND3MBW8
O0CfSFppbmZQhlT+vO3wof3qZmTbGg==
=b1dk
-----END PGP SIGNATURE-----

--xOxj5EAc8eozWsu9aetd70iPvMav8MAEx--

--===============1669228699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1669228699==--
