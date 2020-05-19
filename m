Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8A31D9010
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 08:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831476E4F8;
	Tue, 19 May 2020 06:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD956E4EA
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 06:31:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E0DEDAC64;
 Tue, 19 May 2020 06:31:39 +0000 (UTC)
Subject: Re: [PATCH 1/2] drm/shmem: Use cached mappings by default
To: Daniel Vetter <daniel@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>
References: <20200513150312.21421-1-tzimmermann@suse.de>
 <20200513150312.21421-2-tzimmermann@suse.de>
 <20200514124050.GV206103@phenom.ffwll.local>
 <CAL_JsqK5J78PS_miF8QmfcLJOiESV-f=hXB_CanFqK9yBgJ=6Q@mail.gmail.com>
 <6cec8a8a-d642-cd93-906a-eafab49a12d7@suse.de>
 <20200515141044.GH206103@phenom.ffwll.local>
 <3e09cc7d-c609-e10a-3fe9-f40f3bbfaeaf@suse.de>
 <20200518082354.jeuyt7uzek73pjkp@sirius.home.kraxel.org>
 <3bc1a032-2e7a-d7a8-e5e6-8d53a9e9bd3a@suse.de>
 <20200518101132.ves2qswskaiajh2y@sirius.home.kraxel.org>
 <20200518144034.GN206103@phenom.ffwll.local>
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
Message-ID: <ee20266d-e22d-809f-2b76-f63953e4aae3@suse.de>
Date: Tue, 19 May 2020 08:31:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200518144034.GN206103@phenom.ffwll.local>
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1253035350=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1253035350==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="AcXPGCKD0Zc0a5H3UuceDrmmELHniid5i"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--AcXPGCKD0Zc0a5H3UuceDrmmELHniid5i
Content-Type: multipart/mixed; boundary="ih2KhEeQWgFsiS2dfJhHihtvfhkQDlFd0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>
Cc: David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 Sean Paul <sean@poorly.run>, dri-devel <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Message-ID: <ee20266d-e22d-809f-2b76-f63953e4aae3@suse.de>
Subject: Re: [PATCH 1/2] drm/shmem: Use cached mappings by default
References: <20200513150312.21421-1-tzimmermann@suse.de>
 <20200513150312.21421-2-tzimmermann@suse.de>
 <20200514124050.GV206103@phenom.ffwll.local>
 <CAL_JsqK5J78PS_miF8QmfcLJOiESV-f=hXB_CanFqK9yBgJ=6Q@mail.gmail.com>
 <6cec8a8a-d642-cd93-906a-eafab49a12d7@suse.de>
 <20200515141044.GH206103@phenom.ffwll.local>
 <3e09cc7d-c609-e10a-3fe9-f40f3bbfaeaf@suse.de>
 <20200518082354.jeuyt7uzek73pjkp@sirius.home.kraxel.org>
 <3bc1a032-2e7a-d7a8-e5e6-8d53a9e9bd3a@suse.de>
 <20200518101132.ves2qswskaiajh2y@sirius.home.kraxel.org>
 <20200518144034.GN206103@phenom.ffwll.local>
In-Reply-To: <20200518144034.GN206103@phenom.ffwll.local>

--ih2KhEeQWgFsiS2dfJhHihtvfhkQDlFd0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 18.05.20 um 16:40 schrieb Daniel Vetter:
> On Mon, May 18, 2020 at 12:11:32PM +0200, Gerd Hoffmann wrote:
>> On Mon, May 18, 2020 at 10:50:15AM +0200, Thomas Zimmermann wrote:
>>> Hi Gerd
>>>
>>> Am 18.05.20 um 10:23 schrieb Gerd Hoffmann:
>>>>>> $ git grep drm_gem_shmem_mmap
>>>>>>
>>>>>> We also need correct access from userspace, otherwise the gpu is g=
oing to
>>>>>> be sad.
>>>>>
>>>>> I've been thinking about this, and I think it means that we can nev=
er
>>>>> have cached mappings anywhere. Even if shmem supports it internally=
 for
>>>>> most drivers, as soon as the page are exported, the importer could
>>>>> expect uncached memory.
>>>>
>>>> The importer should not expect anything but call dma-buf ops so the
>>>> exporter has a chance to handle this correctly.
>>>
>>> I have the following case in mind: Suppose the exporter maps cached
>>> pages and the importer expects uncached pages for DMA. There is
>>> map_dma_buf/unmap_dma_buf, which can implement a cache flush for the
>>> cached pages. Is it guaranteed that the importer calls this around ea=
ch
>>> DMA operation?
>>
>> I think the importer is supposed to do that, but I wouldn't surprised =
if
>> there are cases in tree where this isn't implemented correctly ...
>=20
> Yup, this is very much a case of "supposed to" but "in practice, many
> actually dont". The reason is that setting up mappings is expensive, so=

> best avoid.

Thanks to both of you for answering the question.

>=20
> We filled that gap a few years after dma-buf landed with the
> begin/end_cpu_access hooks, which allow the exporter to do cache flushi=
ng
> (using something like dma_sync_sg_for_device/cpu) and for this to all w=
ork
> properly. We even added ioctl so that the mmap on the dma-buf works
> correctly.
>=20
> But most importers still ignore this, so it's all fail :-/ But in theor=
y
> the pieces to make cached mappings work over dma-buf, even for importer=
s
> that need uncached, are all there.
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


--ih2KhEeQWgFsiS2dfJhHihtvfhkQDlFd0--

--AcXPGCKD0Zc0a5H3UuceDrmmELHniid5i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7DfUgACgkQaA3BHVML
eiPXZAf/RJQmiV8mC8ptrzQ9Kty8TOCvB1RB012NT3W/jwDan0AzLDt4XUqgN4s0
FaCLEx7ijDbED7jxm7icuuC69O/m5Lw5pdDvx1SpHjTZ6258SJ89bJWVdYjSpSTw
fduMdsfoOScxpVa9JSg8y1Lb70zNPznCuE0sdjnUvUOg1zi4tEdfCq/0shu6YKBE
lG7+qihif4Pk8Bi6k4pcvFkOf5fbrbFmO4Q8up9p//VHE/LaXGFnrWjZEybQKOBm
MLfwvEWTqGBWhIlVq8tyaBgyPYP2+e9SLPYrPzS3RY4NrNv217vwMZTMH8NQ5JQv
bq0PEgKjS6ExK+bs3nKuWGz675ZXgg==
=l7Bd
-----END PGP SIGNATURE-----

--AcXPGCKD0Zc0a5H3UuceDrmmELHniid5i--

--===============1253035350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1253035350==--
