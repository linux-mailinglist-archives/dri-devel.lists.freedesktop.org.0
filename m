Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8F727A8CA
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27AED6E2ED;
	Mon, 28 Sep 2020 07:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DBF6E2ED;
 Mon, 28 Sep 2020 07:37:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 01189ACF5;
 Mon, 28 Sep 2020 07:37:54 +0000 (UTC)
Subject: Re: [PATCH v3 0/4] dma-buf: Flag vmap'ed memory as system or I/O
 memory
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20200925115601.23955-1-tzimmermann@suse.de>
 <20200926071334.GA42915@ravnborg.org>
 <8761e0dd-569e-0ea0-7bc5-25e4f7cb67cc@suse.de>
 <20200927191605.GA237178@ravnborg.org>
 <3f703297-7b4f-dcca-ea56-70b2413a1e3d@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <ef4400a7-397b-e550-7114-1d4238dd36f3@suse.de>
Date: Mon, 28 Sep 2020 09:37:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3f703297-7b4f-dcca-ea56-70b2413a1e3d@amd.com>
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
 tfiga@chromium.org, m.szyprowski@samsung.com, arnd@arndb.de, corbet@lwn.net,
 jonathanh@nvidia.com, matthew.auld@intel.com, linux+etnaviv@armlinux.org.uk,
 labbott@redhat.com, linux-media@vger.kernel.org, pawel@osciak.com,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, thomas.hellstrom@intel.com,
 rodrigo.vivi@intel.com, linux-tegra@vger.kernel.org, mchehab@kernel.org,
 gregkh@linuxfoundation.org, lmark@codeaurora.org, afd@ti.com,
 kyungmin.park@samsung.com, robin.murphy@arm.com
Content-Type: multipart/mixed; boundary="===============0907363106=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0907363106==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="duxyFgIt2kkaZekNOb8QQHKkIk2VRNfSk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--duxyFgIt2kkaZekNOb8QQHKkIk2VRNfSk
Content-Type: multipart/mixed; boundary="z2tzVgRJbxjjrmoi3dzP18iYabpUh0fGz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: linux-doc@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 kraxel@redhat.com, afd@ti.com, m.szyprowski@samsung.com, arnd@arndb.de,
 corbet@lwn.net, jonathanh@nvidia.com, matthew.auld@intel.com,
 linux+etnaviv@armlinux.org.uk, labbott@redhat.com,
 linux-media@vger.kernel.org, pawel@osciak.com,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, thomas.hellstrom@intel.com,
 rodrigo.vivi@intel.com, linux-tegra@vger.kernel.org, mchehab@kernel.org,
 gregkh@linuxfoundation.org, lmark@codeaurora.org, tfiga@chromium.org,
 kyungmin.park@samsung.com, robin.murphy@arm.com
Message-ID: <ef4400a7-397b-e550-7114-1d4238dd36f3@suse.de>
Subject: Re: [PATCH v3 0/4] dma-buf: Flag vmap'ed memory as system or I/O
 memory
References: <20200925115601.23955-1-tzimmermann@suse.de>
 <20200926071334.GA42915@ravnborg.org>
 <8761e0dd-569e-0ea0-7bc5-25e4f7cb67cc@suse.de>
 <20200927191605.GA237178@ravnborg.org>
 <3f703297-7b4f-dcca-ea56-70b2413a1e3d@amd.com>
In-Reply-To: <3f703297-7b4f-dcca-ea56-70b2413a1e3d@amd.com>

--z2tzVgRJbxjjrmoi3dzP18iYabpUh0fGz
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 28.09.20 um 08:50 schrieb Christian K=C3=B6nig:
> Am 27.09.20 um 21:16 schrieb Sam Ravnborg:
>> Hi Thomas.
>>
>>>> struct simap {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 void __iomem *vaddr_iomem;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 void *vaddr;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool is_iomem;
>>>> };
>>>>
>>>> Where simap is a shorthand for system_iomem_map
>>>> And it could al be stuffed into a include/linux/simap.h file.
>>>>
>>>> Not totally sold on the simap name - but wanted to come up with
>>>> something.
>>> Yes. Others, myself included, have suggested to use a name that does =
not
>>> imply a connection to the dma-buf framework, but no one has come up w=
ith
>>> =C2=A0 a good name.
>>>
>>> I strongly dislike simap, as it's entirely non-obvious what it does.
>>> dma-buf-map is not actually wrong. The structures represents the mapp=
ing
>>> of a dma-able buffer in most cases.
>>>
>>>> With this approach users do not have to pull in dma-buf to use it an=
d
>>>> users will not confuse that this is only for dma-buf usage.
>>> There's no need to enable dma-buf. It's all in the header file withou=
t
>>> dependencies on dma-buf. It's really just the name.
>>>
>>> But there's something else to take into account. The whole issue here=
 is
>>> that the buffer is disconnected from its originating driver, so we do=
n't
>>> know which kind of memory ops we have to use. Thinking about it, I
>>> realized that no one else seemed to have this problem until now.
>>> Otherwise there would be a solution already. So maybe the dma-buf
>>> framework *is* the native use case for this data structure.
>> We have at least:
>> linux/fb.h:
>> =C2=A0=C2=A0=C2=A0=C2=A0union {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char __iomem *screen_base;=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Virtual address */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *screen_buffer;
>> =C2=A0=C2=A0=C2=A0=C2=A0};
>>
>> Which solve more or less the same problem.

I thought this was for convenience. The important is_iomem bit is missing=
=2E

>=20
> I also already noted that in TTM we have exactly the same problem and a=

> whole bunch of helpers to allow operations on those pointers.

How do you call this within TTM?

The data structure represents a pointer to either system or I/O memory,
but not necessatrily device memory. It contains raw data. That would
give something like

  struct databuf_map
  struct databuf_ptr
  struct dbuf_map
  struct dbuf_ptr

My favorite would be dbuf_ptr. It's short and the API names would make
sense: dbuf_ptr_clear() for clearing, dbuf_ptr_set_vaddr() to set an
address, dbuf_ptr_incr() to increment, etc. Also, the _ptr indicates
that it's a single address; not an offset with length.

Best regards
Thomas

>=20
> Christian.
>=20
>>
>> =C2=A0
>>> Anyway, if a better name than dma-buf-map comes in, I'm willing to
>>> rename the thing. Otherwise I intend to merge the patchset by the end=
 of
>>> the week.
>> Well, the main thing is that I think this shoud be moved away from
>> dma-buf. But if indeed dma-buf is the only relevant user in drm then
>> I am totally fine with the current naming.
>>
>> One alternative named that popped up in my head: struct sys_io_map {}
>> But again, if this is kept in dma-buf then I am fine with the current
>> naming.
>>
>> In other words, if you continue to think this is mostly a dma-buf
>> thing all three patches are:
>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0Sam
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


--z2tzVgRJbxjjrmoi3dzP18iYabpUh0fGz--

--duxyFgIt2kkaZekNOb8QQHKkIk2VRNfSk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9xks0UHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiOiIgf+MRwLMbmWIUj56GAzO03dFDuIZYk5
PGLRe0N+ZEg3tB4J3q3r9GWwp9ZqNT+8Lp0Uf62ldHFp0+IXoDLRVzUxlFUwmYSK
PF9UXiUtZ3mqBQTgf2+da0wPKs2kVna8fFotPw3i9YZuzb6Ek1lWteUApQyNOAY+
OoND1zDS4U1cyYNTr5ze+kUF9ts/qgwIwD5MBLDpAY0Fw3ltKrwcY7IbHPpI/DE7
W0HruD7xhGmu19JqePKo7+lIIamGWIXdlMlbYB/fgFGXkyPIu8rzjEa3OZKnzjbG
zm+b3QTZlW3/Qd3na75b76WSfFTO9rlLF/liNEq/L2AksA2ueQ1+yQWXig==
=w71+
-----END PGP SIGNATURE-----

--duxyFgIt2kkaZekNOb8QQHKkIk2VRNfSk--

--===============0907363106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0907363106==--
