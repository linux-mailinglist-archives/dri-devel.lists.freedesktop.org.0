Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A53357B74
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 06:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9CF6E9F0;
	Thu,  8 Apr 2021 04:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98966E9F0;
 Thu,  8 Apr 2021 04:45:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EDB42AFB7;
 Thu,  8 Apr 2021 04:45:56 +0000 (UTC)
Subject: Re: [PATCH 3/8] drm/amdgpu: Implement mmap as GEM object function
To: Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 bskeggs@redhat.com, ray.huang@amd.com, linux-graphics-maintainer@vmware.com,
 sroland@vmware.com, zackr@vmware.com, shashank.sharma@amd.com,
 sam@ravnborg.org, emil.velikov@collabora.com, nirmoy.das@amd.com
References: <20210406090903.7019-1-tzimmermann@suse.de>
 <20210406090903.7019-4-tzimmermann@suse.de>
 <6b261dab-4a4d-f0c6-95c0-f720c7df12c1@amd.com>
 <b76d1922-c9a5-8533-657a-2c1149832347@suse.de>
 <9db18654-770f-459b-a89a-c57dc8a21bac@amd.com>
 <573dca0f-d017-3614-5e4f-d8d0b6bc413f@amd.com>
 <780bb477-77c3-2f3c-2417-edeffccd63b9@amd.com>
 <a152c174-c0fe-fc6f-9fa0-9054ffe415a9@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <235e9a2b-c38f-6dba-a78f-03166133ddb0@suse.de>
Date: Thu, 8 Apr 2021 06:45:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a152c174-c0fe-fc6f-9fa0-9054ffe415a9@amd.com>
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
Cc: nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0337968065=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0337968065==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4pRK71fWfG6OpeezEOr8yzTHEOHj44DVL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4pRK71fWfG6OpeezEOr8yzTHEOHj44DVL
Content-Type: multipart/mixed; boundary="vzKT5KdpOlgisjbOnMd1Ydf6Y6AUL4AoD";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 bskeggs@redhat.com, ray.huang@amd.com, linux-graphics-maintainer@vmware.com,
 sroland@vmware.com, zackr@vmware.com, shashank.sharma@amd.com,
 sam@ravnborg.org, emil.velikov@collabora.com, nirmoy.das@amd.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Message-ID: <235e9a2b-c38f-6dba-a78f-03166133ddb0@suse.de>
Subject: Re: [PATCH 3/8] drm/amdgpu: Implement mmap as GEM object function
References: <20210406090903.7019-1-tzimmermann@suse.de>
 <20210406090903.7019-4-tzimmermann@suse.de>
 <6b261dab-4a4d-f0c6-95c0-f720c7df12c1@amd.com>
 <b76d1922-c9a5-8533-657a-2c1149832347@suse.de>
 <9db18654-770f-459b-a89a-c57dc8a21bac@amd.com>
 <573dca0f-d017-3614-5e4f-d8d0b6bc413f@amd.com>
 <780bb477-77c3-2f3c-2417-edeffccd63b9@amd.com>
 <a152c174-c0fe-fc6f-9fa0-9054ffe415a9@amd.com>
In-Reply-To: <a152c174-c0fe-fc6f-9fa0-9054ffe415a9@amd.com>

--vzKT5KdpOlgisjbOnMd1Ydf6Y6AUL4AoD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 07.04.21 um 21:49 schrieb Felix Kuehling:
> On 2021-04-07 3:34 p.m., Felix Kuehling wrote:
>> On 2021-04-07 7:25 a.m., Christian K=C3=B6nig wrote:
>>>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Don't verify access for KFD BOs. They=
 don't have a GEM
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * object associated with them.
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>> +=C2=A0=C2=A0=C2=A0 if (bo->kfd_bo)
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>>>>>> Who does the access verification now?
>>>>> This is somewhat confusing.
>>>>>
>>>>> I took this check as-is, including the comment, from amdgpu's
>>>>> verify_access function. The verify_access function was called by
>>>>> ttm_bo_mmap. It returned 0 and ttm_bo_mmap did the mapping.
>>>> This is probably a left-over from when we mapped BOs using /dev/kfd.=
 We
>>>> changed this to use /dev/dri/renderD* a long time ago to fix CPU=20
>>>> mapping
>>>> invalidations on memory evictions. I think we can let GEM do the acc=
ess
>>>> check.
>>>
>>> Ok, good to know.
>>>
>>> Thomas can you remove the extra handling in a separate prerequisite=20
>>> patch?
>>>
>>> If anybody then bisects to this patch we at least know what to do to =

>>> get it working again.
>>
>> FWIW, I ran KFDTest test with this shortcut removed on current=20
>> amd-staging-drm-next + my HMM patch series, and it didn't seem to=20
>> cause any issues.
>=20
> Wait, I celebrated too soon. I was running the wrong kernel. I do see=20
> some failures where access is being denied. I need to do more debugging=
=20
> to figure out what's causing that.

OK, thanks for looking into this. I'll wait a bit before sending out the =

new patchset.

Best regards
Thomas

>=20
> Regards,
>  =C2=A0 Felix
>=20
>=20
>>
>> Regards,
>> =C2=A0 Felix
>>
>>
>>>
>>> Regards,
>>> Christian.=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--vzKT5KdpOlgisjbOnMd1Ydf6Y6AUL4AoD--

--4pRK71fWfG6OpeezEOr8yzTHEOHj44DVL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBuioMFAwAAAAAACgkQlh/E3EQov+Bu
Hg//TAty7cdL/nBNpj/ingRUpa20dLLqPZ5kCSSDz3zXr8PqhpczDDF4HPs93gFJ5hh0I/0hKPGI
zHim/XybNAg7yeklnKoZA/Rd3DwwXzGj+/zgNko8ayiJ65yBoasLD2Hl0APocMb7TqQYHHeVvtyC
Bx3jo5n6uOnmBHdTGDffVd1m62VrO7YqheE3qPd+HoMbRLqIuynZpupnA8v8GMF3wgT4VsDOgV65
u2lqgUpVCYQ9fNmetixU9jQFYvUbLtEo3tZQkpypWQhU9zDe0NhRHaLzgupK4aU5cgux7PveSB4d
ORb+SjTeumCaWGVu1FSz4gwAyRHdyx/5fmOBc4SqncAj/yvGeiDc+1xhOTOjbdwcUxrmrX+zwouj
Yswm2UUb7q0ZDpiRKfGBS1fHEleHBt+qJuFUuhAsUxGkUCxvzNF2dqN/y4qKtZPh9WGWFxbUEJsZ
35mebgeFExCqhOdh9S6BARfYns6pt4kJGQuf6eoX4RLDcYDSeO26cbHpkRiFPA50m5jode0S+pR5
j9vAnFsA09nKYmcyKU16/iA6Uqzuf0t4Vqg9F47Or1zY4bjecmd28UhnrUSDR5rglQHHdHlVRuvT
z/sdxqxZ8B0rUNHbdKzXLPZgPfmdBduaYJyfX3sIm0jfcsY8ve9izdWbzS0EAASxNmfqk49Hu7F8
e9Y=
=6dvU
-----END PGP SIGNATURE-----

--4pRK71fWfG6OpeezEOr8yzTHEOHj44DVL--

--===============0337968065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0337968065==--
