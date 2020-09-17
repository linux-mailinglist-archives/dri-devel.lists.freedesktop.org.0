Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D06826D4C9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 09:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B0D6E1E2;
	Thu, 17 Sep 2020 07:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5C76E184
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 07:33:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0BEC2ADBB;
 Thu, 17 Sep 2020 07:16:22 +0000 (UTC)
Subject: Re: [PATCH 0/3] dma-buf: Flag vmap'ed memory as system or I/O memory
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
References: <20200914112521.1327-1-tzimmermann@suse.de>
 <20200916093756.GC438822@phenom.ffwll.local>
 <0378c326-28c6-371e-45d2-8b81ccbda84f@suse.de>
 <20200916122405.GQ438822@phenom.ffwll.local>
 <53743f37-4142-c076-296f-bfcba0840121@amd.com>
 <5192750d-6e99-3dae-286b-3fe0ded0d094@shipmail.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <eacc23d0-b18d-9b26-851d-e534174d43e3@suse.de>
Date: Thu, 17 Sep 2020 09:16:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <5192750d-6e99-3dae-286b-3fe0ded0d094@shipmail.org>
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
Content-Type: multipart/mixed; boundary="===============0747942647=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0747942647==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="uxJvT4Us4Le5dPFrdGQZoCDaGYvFFxZ3h"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uxJvT4Us4Le5dPFrdGQZoCDaGYvFFxZ3h
Content-Type: multipart/mixed; boundary="zW9WkKE1eYbqAMXwbqQcXvj43gpxi9EQe";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
Message-ID: <eacc23d0-b18d-9b26-851d-e534174d43e3@suse.de>
Subject: Re: [PATCH 0/3] dma-buf: Flag vmap'ed memory as system or I/O memory
References: <20200914112521.1327-1-tzimmermann@suse.de>
 <20200916093756.GC438822@phenom.ffwll.local>
 <0378c326-28c6-371e-45d2-8b81ccbda84f@suse.de>
 <20200916122405.GQ438822@phenom.ffwll.local>
 <53743f37-4142-c076-296f-bfcba0840121@amd.com>
 <5192750d-6e99-3dae-286b-3fe0ded0d094@shipmail.org>
In-Reply-To: <5192750d-6e99-3dae-286b-3fe0ded0d094@shipmail.org>

--zW9WkKE1eYbqAMXwbqQcXvj43gpxi9EQe
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Christian and Thomas

Am 16.09.20 um 15:37 schrieb Thomas Hellstr=C3=B6m (Intel):
>=20
> On 9/16/20 2:59 PM, Christian K=C3=B6nig wrote:
>> Am 16.09.20 um 14:24 schrieb Daniel Vetter:
>>> On Wed, Sep 16, 2020 at 12:48:20PM +0200, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> Am 16.09.20 um 11:37 schrieb Daniel Vetter:
>>>>> On Mon, Sep 14, 2020 at 01:25:18PM +0200, Thomas Zimmermann wrote:
>>>>>> Dma-buf provides vmap() and vunmap() for retrieving and releasing
>>>>>> mappings
>>>>>> of dma-buf memory in kernel address space. The functions operate
>>>>>> with plain
>>>>>> addresses and the assumption is that the memory can be accessed
>>>>>> with load
>>>>>> and store operations. This is not the case on some architectures
>>>>>> (e.g.,
>>>>>> sparc64) where I/O memory can only be accessed with dedicated
>>>>>> instructions.
>>>>>>
>>>>>> This patchset introduces struct dma_buf_map, which contains the
>>>>>> address of
>>>>>> a buffer and a flag that tells whether system- or I/O-memory
>>>>>> instructions
>>>>>> are required.
>>>>>>
>>>>>> Some background: updating the DRM framebuffer console on sparc64
>>>>>> makes the
>>>>>> kernel panic. This is because the framebuffer memory cannot be
>>>>>> accessed with
>>>>>> system-memory instructions. We currently employ a workaround in
>>>>>> DRM to
>>>>>> address this specific problem. [1]
>>>>>>
>>>>>> To resolve the problem, we'd like to address it at the most common=

>>>>>> point,
>>>>>> which is the dma-buf framework. The dma-buf mapping ideally knows
>>>>>> if I/O
>>>>>> instructions are required and exports this information to it's
>>>>>> users. The
>>>>>> new structure struct dma_buf_map stores the buffer address and a
>>>>>> flag that
>>>>>> signals I/O memory. Affected users of the buffer (e.g., drivers,
>>>>>> frameworks)
>>>>>> can then access the memory accordingly.
>>>>>>
>>>>>> This patchset only introduces struct dma_buf_map, and updates
>>>>>> struct dma_buf
>>>>>> and it's interfaces. Further patches can update dma-buf users. For=

>>>>>> example,
>>>>>> there's a prototype patchset for DRM that fixes the framebuffer
>>>>>> problem. [2]
>>>>>>
>>>>>> Further work: TTM, one of DRM's memory managers, already exports a=
n
>>>>>> is_iomem flag of its own. It could later be switched over to
>>>>>> exporting struct
>>>>>> dma_buf_map, thus simplifying some code. Several DRM drivers
>>>>>> expect their
>>>>>> fbdev console to operate on I/O memory. These could possibly be
>>>>>> switched over
>>>>>> to the generic fbdev emulation, as soon as the generic code uses
>>>>>> struct
>>>>>> dma_buf_map.
>>>>>>
>>>>>> [1]
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Flore.kernel.org%2Fdri-devel%2F20200725191012.GA434957%40ravnborg.org%2F=
&amp;data=3D02%7C01%7Cchristian.koenig%40amd.com%7C04e3cc3e03ae40f1fa0f08=
d85a3b6a68%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63735855852473238=
5&amp;sdata=3DwTmFuB95GhKUU%2F2Q91V0%2BtzAu4%2BEe3VBUcriBy3jx2g%3D&amp;re=
served=3D0
>>>>>>
>>>>>> [2]
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Flore.kernel.org%2Fdri-devel%2F20200806085239.4606-1-tzimmermann%40suse.=
de%2F&amp;data=3D02%7C01%7Cchristian.koenig%40amd.com%7C04e3cc3e03ae40f1f=
a0f08d85a3b6a68%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637358558524=
732385&amp;sdata=3DL4rBHmegO63b%2FiTQdTyH158KNxAZwSuJCQOaFszo5L0%3D&amp;r=
eserved=3D0
>>>>>>
>>>>> lgtm, imo ready to convert the follow-up patches over to this. But
>>>>> I think
>>>>> would be good to get at least some ack from the ttm side for the
>>>>> overall
>>>>> plan.
>>>> Yup, it would be nice if TTM could had out these types automatically=
=2E
>>>> Then all TTM-based drivers would automatically support it.
>>>>
>>>>> Also, I think we should put all the various helpers (writel/readl,
>>>>> memset,
>>>>> memcpy, whatever else) into the dma-buf-map.h helper, so that most
>>>>> code
>>>>> using this can just treat it as an abstract pointer type and never
>>>>> look
>>>>> underneath it.
>>>> We have some framebuffer helpers that rely on pointer arithmetic, so=

>>>> we'd need that too. No big deal wrt code, but I was worried about th=
e
>>>> overhead. If a loop goes over framebuffer memory, there's an if/else=

>>>> branch for each access to the memory buffer.
>>> If we make all the helpers static inline, then the compiler should be=

>>> able
>>> to see that dma_buf_map.is_iomem is always the same, and produced rea=
lly
>>> optimized code for it by pulling that check out from all the loops.
>>>
>>> So should only result in somewhat verbose code of having to call
>>> dma_buf_map pointer arthimetic helpers, but not in bad generated code=
=2E
>>> Still worth double-checking I think, since e.g. on x86 the generated
>>> code
>>> should be the same for both cases (but maybe the compiler doesn't see=

>>> through the inline asm to realize that, so we might end up with 2
>>> copies).
>>
>> Can we have that even independent of DMA-buf? We have essentially the
>> same problem in TTM and the code around that is a complete mess if you=

>> ask me.
>>
>> Christian.
>>
> I think this patchset looks good. Changing ttm_bo_kmap() over to
> returning a struct dma-buf-map would probably work just fine. If we the=
n
> can have a set of helpers to operate on it, that's great.
>=20
> /Thomas

Can I count this as an A-b by one of you?

Best regards
Thomas

>=20
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--zW9WkKE1eYbqAMXwbqQcXvj43gpxi9EQe--

--uxJvT4Us4Le5dPFrdGQZoCDaGYvFFxZ3h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9jDTIUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiM5BAf/VxjLY2e12LiNz7eZxYXeddR3p3aQ
tEx97wmSftfyMc9fzM0Itrzr1ipNzgpk9W5HtJIOZLivg3K8Y1VH9si+g7IykgqR
38yPic7I60pYMdj1ZosAnsY6PKzu5bIEPJ2b7kQ5D+rjaoidCXi9OknIVeaESyEV
cLkbFWZw+tjqiNwguiio47jJ82UCEA7mpGULBWl4WUKfKtMn3UWiqs0AcS7EcXC2
vTNUYMxd+FDlK77OYFE8Vbd7nmoVZXri5Weyujr5DazPNd72YMe9k8YhKd5CvgkM
9GbSY5L5+WYCco/mSjxC5sOn9+3DvIG94qvo1W5pZKiOeDuhCsyRgSsbEg==
=P7ku
-----END PGP SIGNATURE-----

--uxJvT4Us4Le5dPFrdGQZoCDaGYvFFxZ3h--

--===============0747942647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0747942647==--
