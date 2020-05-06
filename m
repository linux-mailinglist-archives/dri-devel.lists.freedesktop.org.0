Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 095C21C6AD0
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 10:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2810889C9A;
	Wed,  6 May 2020 08:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1958B89C9A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 08:06:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 80A37AB8F;
 Wed,  6 May 2020 08:06:27 +0000 (UTC)
Subject: Re: [PATCH] drm/ast: Don't check new mode if CRTC is being disabled
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200430091330.9824-1-tzimmermann@suse.de>
 <CACvgo50vfeN1-JUOYAu_8H2LJV5qXadZhM21Zw8yepyOyS7rWw@mail.gmail.com>
 <1f8ac420-00ff-f911-b91a-6013f2bcafa5@suse.de>
 <20200504153129.GM10381@phenom.ffwll.local>
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
Message-ID: <ade08354-36c3-1084-e74a-37c5292aa39c@suse.de>
Date: Wed, 6 May 2020 10:06:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200504153129.GM10381@phenom.ffwll.local>
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
Cc: cogarre@gmail.com, Emil Velikov <emil.l.velikov@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: multipart/mixed; boundary="===============0990516342=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0990516342==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="WsTxLCL6d9IzaoiBdCs0QWsPK2oEyEL4I"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WsTxLCL6d9IzaoiBdCs0QWsPK2oEyEL4I
Content-Type: multipart/mixed; boundary="o4aHzPKsCCxVh6d3pw6g9RXThAH4SSj5N";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: cogarre@gmail.com, Emil Velikov <emil.l.velikov@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Message-ID: <ade08354-36c3-1084-e74a-37c5292aa39c@suse.de>
Subject: Re: [PATCH] drm/ast: Don't check new mode if CRTC is being disabled
References: <20200430091330.9824-1-tzimmermann@suse.de>
 <CACvgo50vfeN1-JUOYAu_8H2LJV5qXadZhM21Zw8yepyOyS7rWw@mail.gmail.com>
 <1f8ac420-00ff-f911-b91a-6013f2bcafa5@suse.de>
 <20200504153129.GM10381@phenom.ffwll.local>
In-Reply-To: <20200504153129.GM10381@phenom.ffwll.local>

--o4aHzPKsCCxVh6d3pw6g9RXThAH4SSj5N
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 04.05.20 um 17:31 schrieb Daniel Vetter:
> On Mon, May 04, 2020 at 02:07:22PM +0200, Thomas Zimmermann wrote:
>> Hi Emil
>>
>> Am 01.05.20 um 15:20 schrieb Emil Velikov:
>>> Hi Thomas,
>>>
>>> Couple of fly-by ideas/suggestions.
>>>
>>> On Thu, 30 Apr 2020 at 10:13, Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
>>>>
>>>> Suspending failed because there's no mode if the CRTC is being
>>>> disabled. Early-out in this case. This fixes runtime PM for ast.
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> ---
>>>>  drivers/gpu/drm/ast/ast_mode.c | 3 +++
>>>>  1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/as=
t_mode.c
>>>> index 7a9f20a2fd303..089b7d9a0cf3f 100644
>>>> --- a/drivers/gpu/drm/ast/ast_mode.c
>>>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>>>> @@ -801,6 +801,9 @@ static int ast_crtc_helper_atomic_check(struct d=
rm_crtc *crtc,
>>>>                 return -EINVAL;
>>> Unrelated:
>>> This feels quite dirty. If AST1180 does not support atomic modeset
>>> simply remove the DRIVER_ATOMIC bit.
>>> You can do that at runtime, via drm_device::driver_features in say,
>>> ast_detect_chip()?
>>
>> The line you commented on dates back to non-atomic modesetting, but I
>> don't know what the story behind AST1180 is. It is explicitly disabled=

>> in the list of PCI IDs, but the driver has plenty of code for it. It
>> looks as if the chip can only do pageflipping with a pre-set video mod=
e.
>>
>> As it is right now, the AST1180 code could probably be deleted entirel=
y.
>>
>>>
>>> The drm_driver::driver_features is immutable, or it ought to be.
>>>
>>>>         }
>>>>
>>>> +       if (!state->enable)
>>>> +               return 0; /* no checks required if CRTC is being dis=
abled */
>>>> +
>>> I cannot think of a reason why a driver would need to perform
>>> crtc_atomic_check, if the crtc is being disabled.
>>> Can you spot any? If not, this should be better served in core, which=

>>> calls this callback.
>>> Correct?
>> Ast is a bit of a special case, because it tests the incoming mode
>> against a list of re-defined modes. With the crtc being disabled, the
>> incoming mode is 0 in all fields. Obviously that's not a valid mode, a=
nd
>> we need that additional test here.
>>
>> In the general case, I'd see 'crtc check' as part of the larger atomic=

>> infrastructure. I can imagine that configurations require the CRTC to =
be
>> enabled before other HW blocks work. So a driver might have a reason t=
o
>> run crtc's check even for disabled crtcs (at least to verify that the
>> crtc is not disabled). I don't think this can be handled in the core e=
asily.
>=20
> Jumping out of ->atomic_check callbacks when stuff is all off is fairly=

> standard pattern. So much standard that I'm kinda wondering whether we
> shouldn't just make it the default in atomic helpers - so many drivers
> forget to do it and break in funny ways.

If there comes a driver that really must handle the 'disable case' in
its check handler, such a change would be hard to revert. Removing the
check from the DRM core could regress drivers that depend on the new
semantics.

Best regards
Thomas

> -Daniel
>=20
>>
>> Best regards
>> Thomas
>>
>>>
>>> HTH
>>> -Emil
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
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
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--o4aHzPKsCCxVh6d3pw6g9RXThAH4SSj5N--

--WsTxLCL6d9IzaoiBdCs0QWsPK2oEyEL4I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6yb/cACgkQaA3BHVML
eiOPogf/fJSScjlbKDb1dSy0+z9gqt0cT4SjWpAnBiSBM4lrh30Ge/MKwFtSGp4o
39Jqu1E4GYTvJgRbowTrGd1FyaTykzs/6rwarTkYMJNUUNUM2VaDtEIn1kDVaMwT
rpVrfK5AHzbmt9tWAtGha9VUNEL9fCMIZynmpCBEEh2p5p0KUdxnQQxJU/UecwQE
9wfcZCA5QPDprFwmZzsc+RoCDQTA4lcSxwILptuZT+ZQTQVa3O6dzmXYximywZWd
9s7J+8n5crDqjH94TglmCZ0pUqUMaGBsS9o40IPxuhX2MPEY+huKuHmKMoXrnf6m
6pUuaxvnyg/K5I7FEpmmfK/XYwd7tA==
=bla2
-----END PGP SIGNATURE-----

--WsTxLCL6d9IzaoiBdCs0QWsPK2oEyEL4I--

--===============0990516342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0990516342==--
