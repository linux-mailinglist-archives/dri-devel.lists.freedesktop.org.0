Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0074A27C47F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 13:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2794489CDD;
	Tue, 29 Sep 2020 11:14:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BB289C98;
 Tue, 29 Sep 2020 11:14:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E7A71AB91;
 Tue, 29 Sep 2020 11:14:25 +0000 (UTC)
Subject: Re: [PATCH v3 0/4] dma-buf: Flag vmap'ed memory as system or I/O
 memory
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20200925115601.23955-1-tzimmermann@suse.de>
 <20200926071334.GA42915@ravnborg.org>
 <8761e0dd-569e-0ea0-7bc5-25e4f7cb67cc@suse.de>
 <20200927191605.GA237178@ravnborg.org>
 <3f703297-7b4f-dcca-ea56-70b2413a1e3d@amd.com>
 <ef4400a7-397b-e550-7114-1d4238dd36f3@suse.de>
 <49c4dcec-cd69-510a-9781-e8fa5fb669f9@amd.com>
 <20200929091445.GI438822@phenom.ffwll.local>
 <774e382e-6e60-450c-ee88-bd9ea2916fb4@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <e0a1e44b-7cc4-a540-09c5-b0f5cd175dd5@suse.de>
Date: Tue, 29 Sep 2020 13:14:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <774e382e-6e60-450c-ee88-bd9ea2916fb4@amd.com>
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
Cc: linux-doc@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, kraxel@redhat.com,
 afd@ti.com, Sam Ravnborg <sam@ravnborg.org>, m.szyprowski@samsung.com,
 arnd@arndb.de, corbet@lwn.net, jonathanh@nvidia.com, matthew.auld@intel.com,
 linux+etnaviv@armlinux.org.uk, labbott@redhat.com, linux-media@vger.kernel.org,
 pawel@osciak.com, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 thomas.hellstrom@intel.com, rodrigo.vivi@intel.com,
 linux-tegra@vger.kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
 lmark@codeaurora.org, tfiga@chromium.org, kyungmin.park@samsung.com,
 robin.murphy@arm.com
Content-Type: multipart/mixed; boundary="===============0720200401=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0720200401==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="d5wa8tFJrIhLAHa5BlZ56tvfg9VRjdx9F"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--d5wa8tFJrIhLAHa5BlZ56tvfg9VRjdx9F
Content-Type: multipart/mixed; boundary="a8ukwTSd2RU62nvcRGK5k5EFPVkAWoTMu";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-doc@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 kraxel@redhat.com, tfiga@chromium.org, Sam Ravnborg <sam@ravnborg.org>,
 m.szyprowski@samsung.com, arnd@arndb.de, corbet@lwn.net,
 jonathanh@nvidia.com, matthew.auld@intel.com, linux+etnaviv@armlinux.org.uk,
 labbott@redhat.com, linux-media@vger.kernel.org, pawel@osciak.com,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, thomas.hellstrom@intel.com,
 rodrigo.vivi@intel.com, linux-tegra@vger.kernel.org, mchehab@kernel.org,
 gregkh@linuxfoundation.org, lmark@codeaurora.org, afd@ti.com,
 kyungmin.park@samsung.com, robin.murphy@arm.com
Message-ID: <e0a1e44b-7cc4-a540-09c5-b0f5cd175dd5@suse.de>
Subject: Re: [PATCH v3 0/4] dma-buf: Flag vmap'ed memory as system or I/O
 memory
References: <20200925115601.23955-1-tzimmermann@suse.de>
 <20200926071334.GA42915@ravnborg.org>
 <8761e0dd-569e-0ea0-7bc5-25e4f7cb67cc@suse.de>
 <20200927191605.GA237178@ravnborg.org>
 <3f703297-7b4f-dcca-ea56-70b2413a1e3d@amd.com>
 <ef4400a7-397b-e550-7114-1d4238dd36f3@suse.de>
 <49c4dcec-cd69-510a-9781-e8fa5fb669f9@amd.com>
 <20200929091445.GI438822@phenom.ffwll.local>
 <774e382e-6e60-450c-ee88-bd9ea2916fb4@amd.com>
In-Reply-To: <774e382e-6e60-450c-ee88-bd9ea2916fb4@amd.com>

--a8ukwTSd2RU62nvcRGK5k5EFPVkAWoTMu
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 29.09.20 um 13:09 schrieb Christian K=C3=B6nig:
> Am 29.09.20 um 11:14 schrieb Daniel Vetter:
>> On Mon, Sep 28, 2020 at 01:22:13PM +0200, Christian K=C3=B6nig wrote:
>>> Am 28.09.20 um 09:37 schrieb Thomas Zimmermann:
>>>> Hi
>>>>
>>>> Am 28.09.20 um 08:50 schrieb Christian K=C3=B6nig:
>>>>> Am 27.09.20 um 21:16 schrieb Sam Ravnborg:
>>>>>> Hi Thomas.
>>>>>>
>>>>>>>> struct simap {
>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union {
>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void __iomem *vaddr_iomem;
>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *vaddr;
>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool is_iomem;=

>>>>>>>> };
>>>>>>>>
>>>>>>>> Where simap is a shorthand for system_iomem_map
>>>>>>>> And it could al be stuffed into a include/linux/simap.h file.
>>>>>>>>
>>>>>>>> Not totally sold on the simap name - but wanted to come up with
>>>>>>>> something.
>>>>>>> Yes. Others, myself included, have suggested to use a name that
>>>>>>> does not
>>>>>>> imply a connection to the dma-buf framework, but no one has come
>>>>>>> up with
>>>>>>> =C2=A0 =C2=A0 a good name.
>>>>>>>
>>>>>>> I strongly dislike simap, as it's entirely non-obvious what it do=
es.
>>>>>>> dma-buf-map is not actually wrong. The structures represents the
>>>>>>> mapping
>>>>>>> of a dma-able buffer in most cases.
>>>>>>>
>>>>>>>> With this approach users do not have to pull in dma-buf to use
>>>>>>>> it and
>>>>>>>> users will not confuse that this is only for dma-buf usage.
>>>>>>> There's no need to enable dma-buf. It's all in the header file
>>>>>>> without
>>>>>>> dependencies on dma-buf. It's really just the name.
>>>>>>>
>>>>>>> But there's something else to take into account. The whole issue
>>>>>>> here is
>>>>>>> that the buffer is disconnected from its originating driver, so
>>>>>>> we don't
>>>>>>> know which kind of memory ops we have to use. Thinking about it, =
I
>>>>>>> realized that no one else seemed to have this problem until now.
>>>>>>> Otherwise there would be a solution already. So maybe the dma-buf=

>>>>>>> framework *is* the native use case for this data structure.
>>>>>> We have at least:
>>>>>> linux/fb.h:
>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0union {
>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char __iomem *sc=
reen_base;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Virtual address */
>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *screen_buf=
fer;
>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0};
>>>>>>
>>>>>> Which solve more or less the same problem.
>>>> I thought this was for convenience. The important is_iomem bit is
>>>> missing.
>>>>
>>>>> I also already noted that in TTM we have exactly the same problem
>>>>> and a
>>>>> whole bunch of helpers to allow operations on those pointers.
>>>> How do you call this within TTM?
>>> ttm_bus_placement, but I really don't like that name.
>>>
>>>> The data structure represents a pointer to either system or I/O memo=
ry,
>>>> but not necessatrily device memory. It contains raw data. That would=

>>>> give something like
>>>>
>>>> =C2=A0=C2=A0=C2=A0 struct databuf_map
>>>> =C2=A0=C2=A0=C2=A0 struct databuf_ptr
>>>> =C2=A0=C2=A0=C2=A0 struct dbuf_map
>>>> =C2=A0=C2=A0=C2=A0 struct dbuf_ptr
>>>>
>>>> My favorite would be dbuf_ptr. It's short and the API names would ma=
ke
>>>> sense: dbuf_ptr_clear() for clearing, dbuf_ptr_set_vaddr() to set an=

>>>> address, dbuf_ptr_incr() to increment, etc. Also, the _ptr indicates=

>>>> that it's a single address; not an offset with length.
>>> Puh, no idea. All of that doesn't sound like it 100% hits the underly=
ing
>>> meaning of the structure.
>> Imo first let's merge this and then second with more users we might co=
me
>> up with a better name. And cocci is fairly good at large-scale rename,=
 to
>> the point where we manged to rename struct fence to struct dma_fence.
>=20
> Agreed, renaming things later on is easy if somebody comes up with
> something better.
>=20
> But blocking a necessary technical change just because of the naming is=

> usually not a good idea.

OK, merged now.

Best regards
Thomas

>=20
> Christian.
>=20
>>
>> Also this entire thread here imo shows that we haven't yet figured out=

>> the
>> perfect name anyway, and I don't think it's worth it to hold this up
>> because of this bikeshed :-)
>>
>> Cheers, Daniel
>>
>>> Christian.
>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>> Christian.
>>>>>
>>>>>>> Anyway, if a better name than dma-buf-map comes in, I'm willing t=
o
>>>>>>> rename the thing. Otherwise I intend to merge the patchset by the=

>>>>>>> end of
>>>>>>> the week.
>>>>>> Well, the main thing is that I think this shoud be moved away from=

>>>>>> dma-buf. But if indeed dma-buf is the only relevant user in drm th=
en
>>>>>> I am totally fine with the current naming.
>>>>>>
>>>>>> One alternative named that popped up in my head: struct sys_io_map=
 {}
>>>>>> But again, if this is kept in dma-buf then I am fine with the curr=
ent
>>>>>> naming.
>>>>>>
>>>>>> In other words, if you continue to think this is mostly a dma-buf
>>>>>> thing all three patches are:
>>>>>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>>>>>>
>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0Sam
>>>>> _______________________________________________
>>>>> dri-devel mailing list
>>>>> dri-devel@lists.freedesktop.org
>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D02%7C0=
1%7Cchristian.koenig%40amd.com%7C71c630a7ca1d48476eed08d864581e4f%7C3dd89=
61fe4884e608e11a82d994e183d%7C0%7C0%7C637369676925032848&amp;sdata=3DCsek=
zASvj2lY%2B74FIiLc9B5QG7AHma8B2M5y8Cassj4%3D&amp;reserved=3D0
>>>>>
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


--a8ukwTSd2RU62nvcRGK5k5EFPVkAWoTMu--

--d5wa8tFJrIhLAHa5BlZ56tvfg9VRjdx9F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9zFw0UHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPYbgf/bmBu+Gd3NpzkT8pFUN1dRsahSqM5
n0jwfOUWm491Spj9p1NPJo6DgG9hQl3Xwl3SxWtnbRqGxsZeLtxfzw4cvjDeNrW3
wJAsATiswp7uI0wpNKRlw2WuljpdMza59woaOiSICGN9UfHBycPF0ALZL3QT7FrZ
2cUGmBIxGQUrJUlTJtoZdMwMIzzWBDlpA/Sd0Tw3SSjgnsxvgEFCUcThng4v06OK
E1hJZDkMqLOJ9+mGs3EAflFGWlSYSwsxRn8N7FEodbWcn0fIcgfCejjGF9IE8C1D
9oiz4Mia2tdQ41izsnW4djv6OCOne/Zjp8TPjtFa8eDFNEMa05VPpzI+8g==
=hFdN
-----END PGP SIGNATURE-----

--d5wa8tFJrIhLAHa5BlZ56tvfg9VRjdx9F--

--===============0720200401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0720200401==--
