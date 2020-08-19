Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D31D2495C9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 08:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A74D6E19C;
	Wed, 19 Aug 2020 06:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F62389F19
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 06:58:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7D471ADBB;
 Wed, 19 Aug 2020 06:58:57 +0000 (UTC)
Subject: Re: [PATCH] drm/malidp: Use struct drm_gem_object_funcs.get_sg_table
 internally
To: Liviu Dudau <liviu.dudau@arm.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20200807111022.12117-1-tzimmermann@suse.de>
 <20200807131252.GG2352366@phenom.ffwll.local>
 <07a956c0-10ac-f6e2-73c5-3dd584c4d2d9@suse.de>
 <CAKMK7uHsYqNYuQrbddU7Or6HxZmS8po=WfYvk5z6V5hFuee=wQ@mail.gmail.com>
 <fa21a421-9527-046e-a703-09f4f7f79d16@suse.de>
 <20200813094817.GI2352366@phenom.ffwll.local>
 <3e142611-26be-ebf4-8a9b-37920e27fa7d@suse.de>
 <20200813103126.GM2352366@phenom.ffwll.local>
 <502eee83-80d2-d47a-8e29-ab4cf74151b3@suse.de>
 <CAKMK7uFRVmceJa4p16vWuUUAepZq9Vang-XEBeM22bQNgRFRgw@mail.gmail.com>
 <20200818171530.GJ159988@e110455-lin.cambridge.arm.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <6da76917-383c-e11e-1ed4-10282397768f@suse.de>
Date: Wed, 19 Aug 2020 08:58:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200818171530.GJ159988@e110455-lin.cambridge.arm.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: multipart/mixed; boundary="===============1594243162=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1594243162==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="zfVozXWOvmkI8nx4h35BkP0cSuMgmP24p"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zfVozXWOvmkI8nx4h35BkP0cSuMgmP24p
Content-Type: multipart/mixed; boundary="Nn7mlvVJNBbRor5t0kPEZP56vZgK0Y8P9";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Liviu Dudau <liviu.dudau@arm.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@linux.ie>, Mali DP Maintainers
 <malidp@foss.arm.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Message-ID: <6da76917-383c-e11e-1ed4-10282397768f@suse.de>
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
 <502eee83-80d2-d47a-8e29-ab4cf74151b3@suse.de>
 <CAKMK7uFRVmceJa4p16vWuUUAepZq9Vang-XEBeM22bQNgRFRgw@mail.gmail.com>
 <20200818171530.GJ159988@e110455-lin.cambridge.arm.com>
In-Reply-To: <20200818171530.GJ159988@e110455-lin.cambridge.arm.com>

--Nn7mlvVJNBbRor5t0kPEZP56vZgK0Y8P9
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 18.08.20 um 19:15 schrieb Liviu Dudau:
> On Thu, Aug 13, 2020 at 02:01:19PM +0200, Daniel Vetter wrote:
>> On Thu, Aug 13, 2020 at 12:39 PM Thomas Zimmermann <tzimmermann@suse.d=
e> wrote:
>>>
>>> Hi
>>>
>>> Am 13.08.20 um 12:31 schrieb Daniel Vetter:
>>>> On Thu, Aug 13, 2020 at 12:28:55PM +0200, Thomas Zimmermann wrote:
>>>>>
>>>>>
>>>>> Am 13.08.20 um 11:48 schrieb Daniel Vetter:
>>>>>> On Thu, Aug 13, 2020 at 11:19:31AM +0200, Thomas Zimmermann wrote:=

>>>>>>> Hi
>>>>>>>
>>>>>>> Am 07.08.20 um 18:10 schrieb Daniel Vetter:
>>>>>>>> On Fri, Aug 7, 2020 at 4:02 PM Thomas Zimmermann <tzimmermann@su=
se.de> wrote:
>>>>>>>>>
>>>>>>>>> Hi
>>>>>>>>>
>>>>>>>>> Am 07.08.20 um 15:12 schrieb Daniel Vetter:
>>>>>>>>>> On Fri, Aug 07, 2020 at 01:10:22PM +0200, Thomas Zimmermann wr=
ote:
>>>>>>>>>>> The malidp driver uses GEM object functions for callbacks. Fi=
x it to
>>>>>>>>>>> use them internally as well.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>>>>>> Fixes: ecdd6474644f ("drm/malidp: Use GEM CMA object function=
s")
>>>>>>>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>>>>>> Cc: Emil Velikov <emil.velikov@collabora.com>
>>>>>>>>>>> Cc: Liviu Dudau <liviu.dudau@arm.com>
>>>>>>>>>>> Cc: Brian Starkey <brian.starkey@arm.com>
>>>>>>>>>>> ---
>>>>>>>>>>>  drivers/gpu/drm/arm/malidp_planes.c | 2 +-
>>>>>>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gp=
u/drm/arm/malidp_planes.c
>>>>>>>>>>> index ab45ac445045..351a85088d0e 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/arm/malidp_planes.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/arm/malidp_planes.c
>>>>>>>>>>> @@ -346,7 +346,7 @@ static bool malidp_check_pages_threshold(=
struct malidp_plane_state *ms,
>>>>>>>>>>>              if (cma_obj->sgt)
>>>>>>>>>>>                      sgt =3D cma_obj->sgt;
>>>>>>>>>>>              else
>>>>>>>>>>> -                    sgt =3D obj->dev->driver->gem_prime_get_=
sg_table(obj);
>>>>>>>>>>> +                    sgt =3D obj->funcs->get_sg_table(obj);
>>>>>>>>>>
>>>>>>>>>> Uh if there's not a switch somewhere I'd just call the right f=
unction
>>>>>>>>>> directly. Or call the right wrapper for this, this feels a bit=
 fishy ...
>>>>>>>>>
>>>>>>>>> The driver initializes the pointer via CMA helper macro to an
>>>>>>>>> CMA-internal default. Calling the actual function here is fragi=
le if the
>>>>>>>>> CMA-internal default ever changes.
>>>>>>>>>
>>>>>>>>> But I have no strong feelings. I'll go with whatever the driver=
's
>>>>>>>>> maintainer prefers.
>=20
> Hi,
>=20
> Sorry for the silence, I was on holiday.
>=20
>>>>>>>>
>>>>>>>> What I meant is: There should be an exported helper to get at th=
e sgt.
>>>>>>>> Drivers using helpers shouldn't need to do this kind of stuff he=
re.
>>>>>>>>
>>>>>>>> Also the entire code is fairly suspect, getting at the sgt from
>>>>>>>> plane_check is a bit iffy. But that's a different kind of proble=
m.
>>>>>>>
>>>>>>> I tried to somehow move the code to CMA, but it's not easy. There=
's no
>>>>>>> good place to put the look-up code of sgt. And sgt is later being=
 freed
>>>>>>> iff it came from the callback (and not freed if it was stored in =
the
>>>>>>> object). AFIACT the best options are to either keep the code here=
 or
>>>>>>> move the entire function to CMA helpers.
>>>>>>
>>>>>> Ok I read some code ... I'm confused. From the control flow it loo=
ks like
>>>>>> malidp is using cma helpers. Otherwise why does the upcasting not =
blow up
>>>>>> sometimes.
>>>>>>
>>>>>> But cma helpers already check at import time that any imported dma=
-buf is
>>>>>> contiguous, and they guarantee to fill out the cma_obj->sgt.
>>>>>>
>>>>>> So really no idea what this code is doing here.
>>>>>>
>>>>>> It's also not correct, since it doesn't coalesce sgt entries, sinc=
e a
>>>>>> range might be split up, but still mapped into a contiguous dma_ad=
dr_t
>>>>>> range when you take it all together. The code in
>>>>>> drm_gem_cma_prime_import_sg_table() gets this more right.
>>>>>>
>>>>>> So maybe right fix is to just ditch this all, and use cma helpers =
fully?
>>>>>
>>>>> The driver already does use CMA, including
>>>>> drm_gem_cma_prime_import_sg_table().
>>>>>
>>>>> The patched code is not about importing/exporting sg tables. It
>>>>> configures the MMU's prefetching pattern by looking at some of the =
page
>>>>> sizes. I don't feel confident enough with this code to alter it. I'=
d
>>>>> expect to break the heuristics.
>=20
> That's right, this piece of code has nothing to do with importing dma-b=
uf or
> checking if things are contiguous. Mali DP hardware has a prefetcher bl=
ock that
> can generate some fake requests during vblank to get the MMU pagetables=
 cached
> so that reads from the buffers can be done without waiting for page wal=
ks. The
> block supports two modes, a full page or partial page request (to cater=
 for the
> ends of the buffer that might not be a full page).
>=20
> The patch proposed looks good to me, so:
>=20
> Acked-by: Liviu Dudau <liviu.dudau@arm.com>
>=20
> I will push the patch into drm-misc-next if Daniel has no other comment=
s.

Thanks for explaining. The patch has already been merged.

Best regards
Thomas

>=20
> Best regards,
> Liviu
>=20
>>>>
>>>> Hm ok, no idea either.
>>>>
>>>> But then we can just assume that cma_obj->sgt is always set, and we =
don't
>>>> have to call anything. If a driver uses cma helpers, and cma doesn't=
 set
>>>> ->sgt over the lifetime of the buffer, that breaks a cma helper assu=
mption
>>>> since cma doens't support swap-out.
>>>
>>> Really? I just looked at drm_gem_cma_helper.c and ->sgt is only ever =
set
>>> on imports, and only freed for imported memory. I'm confused now...
>>
>> Hm right this works differently than I thought, for native cma objects=

>> we just store padd/vaddr and that's it. Still feels wrong that malidp
>> digs around in an internal helper that's meant for exporting as a
>> dma-buf.
>>
>> Oh well I guess this is just a very special special case.
>>
>> Reviewed-by: Daniel Vetter <daniel@ffwll.ch>
>>
>>>
>>> Best regards
>>> Thomas
>>>
>>>>
>>>> So converting the if to a WARN_ON and failing with an error, and the=
n
>>>> remove the else should work.
>>>> -Daniel
>>>>
>>>>>
>>>>> Best regards
>>>>> Thomas
>>>>>
>>>>>> -Daniel
>>>>>>
>>>>>>>
>>>>>>> Best regards
>>>>>>> Thomas
>>>>>>>
>>>>>>>> -Daniel
>>>>>>>>
>>>>>>>
>>>>>>> --
>>>>>>> Thomas Zimmermann
>>>>>>> Graphics Driver Developer
>>>>>>> SUSE Software Solutions Germany GmbH
>>>>>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>>>>>>> (HRB 36809, AG N=C3=BCrnberg)
>>>>>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>
>>>>> --
>>>>> Thomas Zimmermann
>>>>> Graphics Driver Developer
>>>>> SUSE Software Solutions Germany GmbH
>>>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>>>>> (HRB 36809, AG N=C3=BCrnberg)
>>>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>>>>
>>>>
>>>>
>>>>
>>>>
>>>
>>> --
>>> Thomas Zimmermann
>>> Graphics Driver Developer
>>> SUSE Software Solutions Germany GmbH
>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>>> (HRB 36809, AG N=C3=BCrnberg)
>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>>
>>
>>
>> --=20
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Nn7mlvVJNBbRor5t0kPEZP56vZgK0Y8P9--

--zfVozXWOvmkI8nx4h35BkP0cSuMgmP24p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl88zZMUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiOyDQf/T+gASP4fVQEa2PeRAFDwh41DF0F1
D8dV0yUMqOkpPVo0Anl8sTLZ+JLV617USqragzwRPXSvaADMMKmQD0QBsK4e0iLf
tBpElTkYwbqiU2LRO1RTFoiABX8NKLEoc7+Q1NU+kjUYWC7ZtF1sdfCSkmVt5mju
xthuBPAyuT6qbZ5VX4va3ax5a9lbRuqYr7Dn1jhtrykFqUJGFu1GmCbmZMfXMPW3
VWM0cKT29jcPNAis5UdpqKAw3c2lyprQ/FX/lkB6w+VSauUakKoF0cRfNwhVBjhe
AgLjVzxUe3hkaivMclgOTVFaiyvEKfENzvtnI2okBDvYJqQpUh2yG4xn8w==
=tm7Z
-----END PGP SIGNATURE-----

--zfVozXWOvmkI8nx4h35BkP0cSuMgmP24p--

--===============1594243162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1594243162==--
