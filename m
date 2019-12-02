Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E7610E700
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 09:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA4589C18;
	Mon,  2 Dec 2019 08:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DACB89C18
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 08:42:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 57108AE52;
 Mon,  2 Dec 2019 08:42:52 +0000 (UTC)
Subject: Re: [PATCH 3/3] drm/todo: Add entry for fb funcs related cleanups
To: Daniel Vetter <daniel@ffwll.ch>
References: <20191127180035.416209-1-daniel.vetter@ffwll.ch>
 <20191127180035.416209-3-daniel.vetter@ffwll.ch>
 <39e84cfd-9a06-bfad-1cc0-030a71ad1c9c@suse.de>
 <20191129185739.GL624164@phenom.ffwll.local>
 <20191129190512.GN624164@phenom.ffwll.local>
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
Message-ID: <9522356b-be12-85be-acf9-d79373cb0a1b@suse.de>
Date: Mon, 2 Dec 2019 09:42:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191129190512.GN624164@phenom.ffwll.local>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: aou@eecs.berkeley.edu, Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>, palmer@dabbelt.com,
 paul.walmsley@sifive.com, Daniel Vetter <daniel.vetter@intel.com>,
 davem@davemloft.net
Content-Type: multipart/mixed; boundary="===============1276390181=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1276390181==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="iiL8hq7zpLLaaG3Mg54oBSRgMRIBEO3Qo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iiL8hq7zpLLaaG3Mg54oBSRgMRIBEO3Qo
Content-Type: multipart/mixed; boundary="6LHh0CkF9qSJjmrB0pDYhTcU4mWAWAsUI";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, davem@davemloft.net,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Message-ID: <9522356b-be12-85be-acf9-d79373cb0a1b@suse.de>
Subject: Re: [PATCH 3/3] drm/todo: Add entry for fb funcs related cleanups
References: <20191127180035.416209-1-daniel.vetter@ffwll.ch>
 <20191127180035.416209-3-daniel.vetter@ffwll.ch>
 <39e84cfd-9a06-bfad-1cc0-030a71ad1c9c@suse.de>
 <20191129185739.GL624164@phenom.ffwll.local>
 <20191129190512.GN624164@phenom.ffwll.local>
In-Reply-To: <20191129190512.GN624164@phenom.ffwll.local>

--6LHh0CkF9qSJjmrB0pDYhTcU4mWAWAsUI
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

(cc: SPARC64 maintainer)
(cc: RISC-V maintainers)

Hi Daniel

Am 29.11.19 um 20:05 schrieb Daniel Vetter:
> On Fri, Nov 29, 2019 at 07:57:39PM +0100, Daniel Vetter wrote:
>> On Fri, Nov 29, 2019 at 10:34:10AM +0100, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 27.11.19 um 19:00 schrieb Daniel Vetter:
>>>> We're doing a great job for really simple drivers right now, but sti=
ll
>>>> a lot of boilerplate for the bigger ones.
>>>>
>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>>
>>> Just a small remark below, otherwise
>>>
>>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>
>>>
>>>> ---
>>>>  Documentation/gpu/todo.rst | 26 ++++++++++++++++++++++++++
>>>>  1 file changed, 26 insertions(+)
>>>>
>>>> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst=

>>>> index 3ec509381fc5..2d85f37284a1 100644
>>>> --- a/Documentation/gpu/todo.rst
>>>> +++ b/Documentation/gpu/todo.rst
>>>> @@ -182,6 +182,32 @@ Contact: Maintainer of the driver you plan to c=
onvert
>>>> =20
>>>>  Level: Intermediate
>>>> =20
>>>> +drm_framebuffer_funcs and drm_mode_config_funcs.fb_create cleanup
>>>> +-----------------------------------------------------------------
>>>> +
>>>> +A lot more drivers could be switched over to the drm_gem_framebuffe=
r helpers.
>>>> +Various hold-ups:
>>>> +
>>>> +- Need to switch over to the generic dirty tracking code using
>>>> +  drm_atomic_helper_dirtyfb first (e.g. qxl).
>>>> +
>>>> +- Need to switch to drm_fbdev_generic_setup(), otherwise a lot of t=
he custom fb
>>>> +  setup code can't be deleted.
>>>
>>> From what I remember, almost all of the obvious, low-hanging fruits h=
ave
>>> been picked here. The remaining fbdev users either have HW accelerati=
on
>>> (nouveau, gma500), or use the cfb drawing functions.
>>
>> I think a bunch of these (from you) aren't merged yet. I'll add a note=

>> about sys vs cfb. About gma500/nouveau, I'm kinda tempted to just ditc=
h
>> the acceleration ... but maybe someone cares, dunno.
>=20
> Correction, we already have a task for drm_fbdev_generic_setup, and tha=
t
> mentions the sys/cfb issue already. So I'll leave this as-is.

Maybe refer to the related TODO item.

> -Daniel
>=20
>>
>>> The TODO item should probably mention this, with some advise to do so=
me
>>> extra testing for compatibility or performance after moving to generi=
c
>>> fbdev.
>>
>> Testing (at least on x86) won't catch the cfb/sysfb stuff, since it's
>> exactly the same asm instructions :-/ tbh I still don't know where thi=
s
>> actually makes a difference.

I briefly looked through the code of the CFB helpers. They use the
helpers at [1] for accessing the framebuffer. Those are special for
several architectures. [2]

SPARC64 expands to assembly instructions. [3] The rest appears to have
regular memory instructions in their implementations of __raw_readb().
Although not listed here, I found that RISC V has assembly code in
__raw_readb(). [4]

In the CFB code, there's also bit-shifting code that cares about
endianess. [5] In the end it seems to depends on FBINFO_FOREIGN_ENDIAN,
but the only user I could find was mb862xxfb. [6]

I don't know what the hand-crafted assembly instructions do in detail,
but for the moment we seem to be good without CFB code.

Best regards
Thomas


[1] https://elixir.bootlin.com/linux/v5.4/source/include/linux/fb.h#L564
[2] https://elixir.bootlin.com/linux/v5.4/source/include/linux/fb.h#L527
[3]
https://elixir.bootlin.com/linux/v5.4/source/arch/sparc/include/asm/io_64=
=2Eh#L20
[4]
https://elixir.bootlin.com/linux/v5.4/source/arch/riscv/include/asm/io.h#=
L59
[5] https://elixir.bootlin.com/linux/v5.4/source/include/linux/fb.h#L578
[6]
https://elixir.bootlin.com/linux/v5.4/source/drivers/video/fbdev/mb862xx/=
mb862xxfbdrv.c#L501

>> -Daniel
>>
>>>
>>> Best regards
>>> Thomas
>>>
>>>> +
>>>> +- Many drivers wrap drm_gem_fb_create() only to check for valid for=
mats. For
>>>> +  atomic drivers we could check for valid formats by calling
>>>> +  drm_plane_check_pixel_format() against all planes, and pass if an=
y plane
>>>> +  supports the format. For non-atomic that's not possible since lik=
e the format
>>>> +  list for the primary plane is fake and we'd therefor reject valid=
 formats.
>>>> +
>>>> +- Many drivers subclass drm_framebuffer, we'd need a embedding comp=
atible
>>>> +  version of the varios drm_gem_fb_create functions. Maybe called
>>>> +  drm_gem_fb_create/_with_dirty/_with_funcs as needed.
>>>> +
>>>> +Contact: Daniel Vetter
>>>> +
>>>> +Level: Intermediate
>>>> +
>>>>  Clean up mmap forwarding
>>>>  ------------------------
>>>> =20
>>>>
>>>
>>> --=20
>>> Thomas Zimmermann
>>> Graphics Driver Developer
>>> SUSE Software Solutions Germany GmbH
>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>>> (HRB 36809, AG N=C3=BCrnberg)
>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>>
>>
>>
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


--6LHh0CkF9qSJjmrB0pDYhTcU4mWAWAsUI--

--iiL8hq7zpLLaaG3Mg54oBSRgMRIBEO3Qo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3kzooACgkQaA3BHVML
eiMRFQgAmO9NMFQ8BbV8DMkTARbJomLc0hjNy/nNyaRt0ZFhs/hFhj5skXndW1ME
dXCB79wVTvwny185kssp7PkMmpXzN9UEKVPlY33zK2i9divy1f2qTxvwDpEKGfEP
ojX1zmOFd/y1sw1wdOwg+UQ/VuqmONkn3XjdG5AUnZq4gigEu0Vjo1OZvBo+OAQ1
snW7RVPRX7T0loK9OXPF/9gr/exBHEUfXYJe09jNI3eqUbn5WQIR8+CH8TH8+qkk
vjWqygtKovUphNvECViDSFwPACjSvKsU7/h/75UvJkgyzbvQUNRLDyAsrFNzxRwU
BQkcTX53H4I2k1f1OTWkA9KE856umA==
=yaoA
-----END PGP SIGNATURE-----

--iiL8hq7zpLLaaG3Mg54oBSRgMRIBEO3Qo--

--===============1276390181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1276390181==--
