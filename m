Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3E41D7293
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 10:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6488A89B48;
	Mon, 18 May 2020 08:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9B489B48
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 08:13:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4B3F2AB89;
 Mon, 18 May 2020 08:13:51 +0000 (UTC)
Subject: Re: [PATCH 1/2] drm/shmem: Use cached mappings by default
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200513150312.21421-1-tzimmermann@suse.de>
 <20200513150312.21421-2-tzimmermann@suse.de>
 <20200514124050.GV206103@phenom.ffwll.local>
 <CAL_JsqK5J78PS_miF8QmfcLJOiESV-f=hXB_CanFqK9yBgJ=6Q@mail.gmail.com>
 <6cec8a8a-d642-cd93-906a-eafab49a12d7@suse.de>
 <20200515141044.GH206103@phenom.ffwll.local>
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
Message-ID: <3e09cc7d-c609-e10a-3fe9-f40f3bbfaeaf@suse.de>
Date: Mon, 18 May 2020 10:13:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200515141044.GH206103@phenom.ffwll.local>
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
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============0071580316=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0071580316==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bbX7xtiq38HQrZ827mU9oydf9VzfYU3DW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bbX7xtiq38HQrZ827mU9oydf9VzfYU3DW
Content-Type: multipart/mixed; boundary="67mlwVANhpy136gtBHCw5CzyD0izA2gsK";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Herring <robh@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Sean Paul <sean@poorly.run>
Message-ID: <3e09cc7d-c609-e10a-3fe9-f40f3bbfaeaf@suse.de>
Subject: Re: [PATCH 1/2] drm/shmem: Use cached mappings by default
References: <20200513150312.21421-1-tzimmermann@suse.de>
 <20200513150312.21421-2-tzimmermann@suse.de>
 <20200514124050.GV206103@phenom.ffwll.local>
 <CAL_JsqK5J78PS_miF8QmfcLJOiESV-f=hXB_CanFqK9yBgJ=6Q@mail.gmail.com>
 <6cec8a8a-d642-cd93-906a-eafab49a12d7@suse.de>
 <20200515141044.GH206103@phenom.ffwll.local>
In-Reply-To: <20200515141044.GH206103@phenom.ffwll.local>

--67mlwVANhpy136gtBHCw5CzyD0izA2gsK
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.05.20 um 16:10 schrieb Daniel Vetter:
> On Fri, May 15, 2020 at 08:58:02AM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 14.05.20 um 22:36 schrieb Rob Herring:
>>> On Thu, May 14, 2020 at 7:40 AM Daniel Vetter <daniel@ffwll.ch> wrote=
:
>>>>
>>>> On Wed, May 13, 2020 at 05:03:11PM +0200, Thomas Zimmermann wrote:
>>>>> SHMEM-buffer backing storage is allocated from system memory; which=
 is
>>>>> typically cachable. Currently, only virtio uses cachable mappings; =
udl
>>>>> uses its own vmap/mmap implementation for cachable mappings. Other
>>>>> drivers default to writecombine mappings.
>>>>
>>>> I'm pretty sure this breaks all these drivers. quick grep on a few
>>>> functions says this is used by lima, panfrost, v3d. And they definit=
ely
>>>> need uncached/wc stuff afaiui. Or I'm completely missing something?
>>>
>>
>> OK. I think I'll just make a patch that adds a .gem_create_object help=
er
>> that sets the map_cached flag. So drivers can opt-in.
>>
>>> Yes, that would be my guess. DMA is usually non-coherent on Arm.
>>
>> Can one of you give me some pointer to what you're looking at? For
>> example, I grepped for use of vmap within lima and only found [1].
>> That's a for memcpy with no DMA involved. There's got to be something
>> I'm missing.
>>
>> Best regards
>> Thomas
>>
>> [1]
>> https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/lima/lim=
a_sched.c#n391
>=20
> $ git grep drm_gem_shmem_mmap
>=20
> We also need correct access from userspace, otherwise the gpu is going =
to
> be sad.

I've been thinking about this, and I think it means that we can never
have cached mappings anywhere. Even if shmem supports it internally for
most drivers, as soon as the page are exported, the importer could
expect uncached memory.

Given that, I think the correct thing to do is to udl's gem code and use
the default implementation.

Best regards
Thomas


> -Daniel
>>
>>>
>>> Rob
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


--67mlwVANhpy136gtBHCw5CzyD0izA2gsK--

--bbX7xtiq38HQrZ827mU9oydf9VzfYU3DW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7CQ7sACgkQaA3BHVML
eiNTAQgAvvsZkoGMVzridqLRvskYrf+RUnLywiMJH1FAQQb9A4PhB4EhiKV9/R3G
RmDGG6cdvZQvM+vAfg/03DtZ8Z//1cJa4Ryzab8gnaIMeONgQjxufzjZ2Ypv2wu5
LO0ZSJWTOJDwSydyDhDlxQFKNObz6OzSHwpRe8T9YHhmeW+AJQLzxRScsRzOAKBG
eEFzn/tUNcMUUxOeDQJx/IHtDM10dvOzqYeZsQqIYP4xU/DGeramQqQClab7ofE8
C9OVZ2xJnch/y/oxNGoauYqKvFGrWA3aar5BXIzgXKxqDEqCSQrNgb9e9l1p0KGA
z1XXZk34rIlR9qMaYX4Km2LQe/jOAw==
=Qvj4
-----END PGP SIGNATURE-----

--bbX7xtiq38HQrZ827mU9oydf9VzfYU3DW--

--===============0071580316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0071580316==--
