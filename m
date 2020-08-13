Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 239FF2438B8
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 12:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810296E9A5;
	Thu, 13 Aug 2020 10:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A00D6E9A5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 10:39:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 16FACAE16;
 Thu, 13 Aug 2020 10:39:22 +0000 (UTC)
Subject: Re: [PATCH] drm/malidp: Use struct drm_gem_object_funcs.get_sg_table
 internally
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200807111022.12117-1-tzimmermann@suse.de>
 <20200807131252.GG2352366@phenom.ffwll.local>
 <07a956c0-10ac-f6e2-73c5-3dd584c4d2d9@suse.de>
 <CAKMK7uHsYqNYuQrbddU7Or6HxZmS8po=WfYvk5z6V5hFuee=wQ@mail.gmail.com>
 <fa21a421-9527-046e-a703-09f4f7f79d16@suse.de>
 <20200813094817.GI2352366@phenom.ffwll.local>
 <3e142611-26be-ebf4-8a9b-37920e27fa7d@suse.de>
 <20200813103126.GM2352366@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <502eee83-80d2-d47a-8e29-ab4cf74151b3@suse.de>
Date: Thu, 13 Aug 2020 12:38:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200813103126.GM2352366@phenom.ffwll.local>
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
Cc: Dave Airlie <airlied@linux.ie>, Mali DP Maintainers <malidp@foss.arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: multipart/mixed; boundary="===============0994603437=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0994603437==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pbg6j07G9Fh86BmcTW5sGIWVqWbe8T2Kt"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pbg6j07G9Fh86BmcTW5sGIWVqWbe8T2Kt
Content-Type: multipart/mixed; boundary="M5XmyW9McKAHTHnYAsqiT6pqqRkIX0j7A";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mali DP Maintainers <malidp@foss.arm.com>,
 Emil Velikov <emil.velikov@collabora.com>
Message-ID: <502eee83-80d2-d47a-8e29-ab4cf74151b3@suse.de>
Subject: Re: [PATCH] drm/malidp: Use struct drm_gem_object_funcs.get_sg_table
 internally
References: <20200807111022.12117-1-tzimmermann@suse.de>
 <20200807131252.GG2352366@phenom.ffwll.local>
 <07a956c0-10ac-f6e2-73c5-3dd584c4d2d9@suse.de>
 <CAKMK7uHsYqNYuQrbddU7Or6HxZmS8po=WfYvk5z6V5hFuee=wQ@mail.gmail.com>
 <fa21a421-9527-046e-a703-09f4f7f79d16@suse.de>
 <20200813094817.GI2352366@phenom.ffwll.local>
 <3e142611-26be-ebf4-8a9b-37920e27fa7d@suse.de>
 <20200813103126.GM2352366@phenom.ffwll.local>
In-Reply-To: <20200813103126.GM2352366@phenom.ffwll.local>

--M5XmyW9McKAHTHnYAsqiT6pqqRkIX0j7A
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.08.20 um 12:31 schrieb Daniel Vetter:
> On Thu, Aug 13, 2020 at 12:28:55PM +0200, Thomas Zimmermann wrote:
>>
>>
>> Am 13.08.20 um 11:48 schrieb Daniel Vetter:
>>> On Thu, Aug 13, 2020 at 11:19:31AM +0200, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> Am 07.08.20 um 18:10 schrieb Daniel Vetter:
>>>>> On Fri, Aug 7, 2020 at 4:02 PM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>>>>>>
>>>>>> Hi
>>>>>>
>>>>>> Am 07.08.20 um 15:12 schrieb Daniel Vetter:
>>>>>>> On Fri, Aug 07, 2020 at 01:10:22PM +0200, Thomas Zimmermann wrote=
:
>>>>>>>> The malidp driver uses GEM object functions for callbacks. Fix i=
t to
>>>>>>>> use them internally as well.
>>>>>>>>
>>>>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>>> Fixes: ecdd6474644f ("drm/malidp: Use GEM CMA object functions")=

>>>>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>>> Cc: Emil Velikov <emil.velikov@collabora.com>
>>>>>>>> Cc: Liviu Dudau <liviu.dudau@arm.com>
>>>>>>>> Cc: Brian Starkey <brian.starkey@arm.com>
>>>>>>>> ---
>>>>>>>>  drivers/gpu/drm/arm/malidp_planes.c | 2 +-
>>>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/d=
rm/arm/malidp_planes.c
>>>>>>>> index ab45ac445045..351a85088d0e 100644
>>>>>>>> --- a/drivers/gpu/drm/arm/malidp_planes.c
>>>>>>>> +++ b/drivers/gpu/drm/arm/malidp_planes.c
>>>>>>>> @@ -346,7 +346,7 @@ static bool malidp_check_pages_threshold(str=
uct malidp_plane_state *ms,
>>>>>>>>              if (cma_obj->sgt)
>>>>>>>>                      sgt =3D cma_obj->sgt;
>>>>>>>>              else
>>>>>>>> -                    sgt =3D obj->dev->driver->gem_prime_get_sg_=
table(obj);
>>>>>>>> +                    sgt =3D obj->funcs->get_sg_table(obj);
>>>>>>>
>>>>>>> Uh if there's not a switch somewhere I'd just call the right func=
tion
>>>>>>> directly. Or call the right wrapper for this, this feels a bit fi=
shy ...
>>>>>>
>>>>>> The driver initializes the pointer via CMA helper macro to an
>>>>>> CMA-internal default. Calling the actual function here is fragile =
if the
>>>>>> CMA-internal default ever changes.
>>>>>>
>>>>>> But I have no strong feelings. I'll go with whatever the driver's
>>>>>> maintainer prefers.
>>>>>
>>>>> What I meant is: There should be an exported helper to get at the s=
gt.
>>>>> Drivers using helpers shouldn't need to do this kind of stuff here.=

>>>>>
>>>>> Also the entire code is fairly suspect, getting at the sgt from
>>>>> plane_check is a bit iffy. But that's a different kind of problem.
>>>>
>>>> I tried to somehow move the code to CMA, but it's not easy. There's =
no
>>>> good place to put the look-up code of sgt. And sgt is later being fr=
eed
>>>> iff it came from the callback (and not freed if it was stored in the=

>>>> object). AFIACT the best options are to either keep the code here or=

>>>> move the entire function to CMA helpers.
>>>
>>> Ok I read some code ... I'm confused. From the control flow it looks =
like
>>> malidp is using cma helpers. Otherwise why does the upcasting not blo=
w up
>>> sometimes.
>>>
>>> But cma helpers already check at import time that any imported dma-bu=
f is
>>> contiguous, and they guarantee to fill out the cma_obj->sgt.
>>>
>>> So really no idea what this code is doing here.
>>>
>>> It's also not correct, since it doesn't coalesce sgt entries, since a=

>>> range might be split up, but still mapped into a contiguous dma_addr_=
t
>>> range when you take it all together. The code in
>>> drm_gem_cma_prime_import_sg_table() gets this more right.
>>>
>>> So maybe right fix is to just ditch this all, and use cma helpers ful=
ly?
>>
>> The driver already does use CMA, including
>> drm_gem_cma_prime_import_sg_table().
>>
>> The patched code is not about importing/exporting sg tables. It
>> configures the MMU's prefetching pattern by looking at some of the pag=
e
>> sizes. I don't feel confident enough with this code to alter it. I'd
>> expect to break the heuristics.
>=20
> Hm ok, no idea either.
>=20
> But then we can just assume that cma_obj->sgt is always set, and we don=
't
> have to call anything. If a driver uses cma helpers, and cma doesn't se=
t
> ->sgt over the lifetime of the buffer, that breaks a cma helper assumpt=
ion
> since cma doens't support swap-out.

Really? I just looked at drm_gem_cma_helper.c and ->sgt is only ever set
on imports, and only freed for imported memory. I'm confused now...

Best regards
Thomas

>=20
> So converting the if to a WARN_ON and failing with an error, and then
> remove the else should work.
> -Daniel
>=20
>>
>> Best regards
>> Thomas
>>
>>> -Daniel
>>>
>>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>> -Daniel
>>>>>
>>>>
>>>> --=20
>>>> Thomas Zimmermann
>>>> Graphics Driver Developer
>>>> SUSE Software Solutions Germany GmbH
>>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>>>> (HRB 36809, AG N=C3=BCrnberg)
>>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>>>
>>>
>>>
>>>
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

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--M5XmyW9McKAHTHnYAsqiT6pqqRkIX0j7A--

--pbg6j07G9Fh86BmcTW5sGIWVqWbe8T2Kt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl81GEAUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiP/HggAh/8dbvMIxsXDs3B2b3x7vPgKtSK/
+cADwgfC8YdEO2Zb08jc9fOHnIriFemDxqeXE4d3A51rM8RP9Mo+w2RvjLrM7YlU
9enMDOSqXqvkWHK/wMRws1e0avFsSKt/SHhk6POp1mJOc/iKv214h4tnodtG/D+R
xVIBc+FvJ+iB5o8AFufzrY4dGVQqgo5auk+71Av/jXa+5ezu9w0eRvNJ/L3NewPN
JxABGZ6Lcm1u50qdXHpOc1f0tuatEVsExdIe5h2liWXinbloBoEaNy7tpGKqP+Ey
dgdhNga3ZF8vVrUf32nNnYmxuC1vZBjmlqrv2refxr9u1QbEO/QMEbnKEA==
=reYq
-----END PGP SIGNATURE-----

--pbg6j07G9Fh86BmcTW5sGIWVqWbe8T2Kt--

--===============0994603437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0994603437==--
