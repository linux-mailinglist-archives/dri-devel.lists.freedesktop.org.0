Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFBDA7E2B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 10:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32B5899B5;
	Wed,  4 Sep 2019 08:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6DE899B5
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 08:43:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D1AACAE92;
 Wed,  4 Sep 2019 08:43:45 +0000 (UTC)
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
To: Feng Tang <feng.tang@intel.com>, Daniel Vetter <daniel@ffwll.ch>
References: <64d41701-55a4-e526-17ae-8936de4bc1ef@suse.de>
 <20190824051605.GA63850@shbuild999.sh.intel.com>
 <1b897bfe-fd40-3ae3-d867-424d1fc08c44@suse.de>
 <d114b0b6-6b64-406e-6c3f-a8b8d5502413@intel.com>
 <44029e80-ba00-8246-dec0-fda122d53f5e@suse.de>
 <90e78ce8-d46a-5154-c324-a05aa1743c98@intel.com>
 <2e1b4d65-d477-f571-845d-fa0a670859af@suse.de>
 <20190904062716.GC5541@shbuild999.sh.intel.com>
 <72c33bf1-9184-e24a-c084-26d9c8b6f9b7@suse.de>
 <CAKMK7uGdOtyDHZMSzY8J45bX57EFKo=DWNUi+WL+GVOzoBpUhw@mail.gmail.com>
 <20190904083558.GD5541@shbuild999.sh.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNKFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwJQEEwEIAD4W
 IQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznTtgIbAwUJA8JnAAULCQgHAgYVCgkICwIEFgID
 AQIeAQIXgAAKCRBoDcEdUwt6I7D7CACBK42XW+7mCiK8ioXMEy1NzGbXC51RzGea8N83oEJS
 1KVUtQxrkDxgrW/WLSl/TfqHFsJpdEFOv1XubWbleun3uKPy0e5vZCd5UjZPkeNjnqfCYTDy
 hVVsdOuFbtWDppJyJrThLqr9AgSFmoCNNUt1SVpYEEOLNE6C32BhlnSq21VLC+YXTgO/ZHTa
 YXkq54hHj63jwrcjkBSCkXLh37kHeqnl++GHpN+3R+o3w2OpwHAlvVjdKPT27v1tVkiydsFG
 65Vd0n3m/ft+IOrGgxQM1C20uqKvsZGB4r3OGR50ekAybO7sjEJJ1Obl4ge/6RRqcvKz4LMb
 tGs85D6tPIeFzsBNBFs50uABCADGJj+DP1fk+UWOWrf4O61HTbC4Vr9QD2K4fUUHnzg2B6zU
 R1BPXqLGG0+lzK8kfYU/F5RjmEcClsIkAaFkg4kzKP14tvY1J5+AV3yNqcdg018HNtiyrSwI
 E0Yz/qm1Ot2NMZ0DdvVBg22IMsiudQ1tx9CH9mtyTbIXgACvl3PW2o9CxiHPE/bohFhwZwh/
 kXYYAE51lhinQ3oFEeQZA3w4OTvxSEspiQR8dg8qJJb+YOAc5IKk6sJmmM7JfFMWSr22satM
 23oQ3WvJb4RV6HTRTAIEyyZS7g2DhiytgMG60t0qdABG5KXSQW+OKlZRpuWwKWaLh3if/p/u
 69dvpanbABEBAAHCwHwEGAEIACYWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznS4AIbDAUJ
 A8JnAAAKCRBoDcEdUwt6I6X3CACJ8D+TpXBCqJE5xwog08+Dp8uBpx0T9n1wE0GQisZruACW
 NofYn8PTX9k4wmegDLwt7YQDdKxQ4+eTfZeLNQqWg6OCftH5Kx7sjWnJ09tOgniVdROzWJ7c
 VJ/i0okazncsJ+nq48UYvRGE1Swh3A4QRIyphWX4OADOBmTFl9ZYNPnh23eaC9WrNvFr7yP7
 iGjMlfEW8l6Lda//EC5VpXVNza0xeae0zFNst2R9pn+bLkihwDLWxOIyifGRxTqNxoS4I1aw
 VhxPSVztPMSpIA/sOr/N/p6JrBLn+gui2K6mP7bGb8hF+szfArYqz3T1rv1VzUWAJf5Wre5U
 iNx9uqqx
Message-ID: <33d3ce15-6221-bd96-3f26-b710e4da6b1a@suse.de>
Date: Wed, 4 Sep 2019 10:43:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904083558.GD5541@shbuild999.sh.intel.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rong Chen <rong.a.chen@intel.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, LKP <lkp@01.org>
Content-Type: multipart/mixed; boundary="===============0071210272=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0071210272==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="z5u8L7PhZwl2omekefWdTSnCrm327WPWo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--z5u8L7PhZwl2omekefWdTSnCrm327WPWo
Content-Type: multipart/mixed; boundary="GAqvzYwfBSRNT5wxc8MZTQlopx9rsHEt8";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Feng Tang <feng.tang@intel.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rong Chen
 <rong.a.chen@intel.com>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel@daenzer.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, LKP <lkp@01.org>
Message-ID: <33d3ce15-6221-bd96-3f26-b710e4da6b1a@suse.de>
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
References: <64d41701-55a4-e526-17ae-8936de4bc1ef@suse.de>
 <20190824051605.GA63850@shbuild999.sh.intel.com>
 <1b897bfe-fd40-3ae3-d867-424d1fc08c44@suse.de>
 <d114b0b6-6b64-406e-6c3f-a8b8d5502413@intel.com>
 <44029e80-ba00-8246-dec0-fda122d53f5e@suse.de>
 <90e78ce8-d46a-5154-c324-a05aa1743c98@intel.com>
 <2e1b4d65-d477-f571-845d-fa0a670859af@suse.de>
 <20190904062716.GC5541@shbuild999.sh.intel.com>
 <72c33bf1-9184-e24a-c084-26d9c8b6f9b7@suse.de>
 <CAKMK7uGdOtyDHZMSzY8J45bX57EFKo=DWNUi+WL+GVOzoBpUhw@mail.gmail.com>
 <20190904083558.GD5541@shbuild999.sh.intel.com>
In-Reply-To: <20190904083558.GD5541@shbuild999.sh.intel.com>

--GAqvzYwfBSRNT5wxc8MZTQlopx9rsHEt8
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 04.09.19 um 10:35 schrieb Feng Tang:
> Hi Daniel,
>=20
> On Wed, Sep 04, 2019 at 10:11:11AM +0200, Daniel Vetter wrote:
>> On Wed, Sep 4, 2019 at 8:53 AM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
>>>
>>> Hi
>>>
>>> Am 04.09.19 um 08:27 schrieb Feng Tang:
>>>>> Thank you for testing. But don't get too excited, because the patch=

>>>>> simulates a bug that was present in the original mgag200 code. A
>>>>> significant number of frames are simply skipped. That is apparently=
 the
>>>>> reason why it's faster.
>>>>
>>>> Thanks for the detailed info, so the original code skips time-consum=
ing
>>>> work inside atomic context on purpose. Is there any space to optmise=
 it?
>>>> If 2 scheduled update worker are handled at almost same time, can on=
e be
>>>> skipped?
>>>
>>> To my knowledge, there's only one instance of the worker. Re-scheduli=
ng
>>> the worker before a previous instance started, will not create a seco=
nd
>>> instance. The worker's instance will complete all pending updates. So=
 in
>>> some way, skipping workers already happens.
>>
>> So I think that the most often fbcon update from atomic context is the=

>> blinking cursor. If you disable that one you should be back to the old=

>> performance level I think, since just writing to dmesg is from process=

>> context, so shouldn't change.
>=20
> Hmm, then for the old driver, it should also do the most update in
> non-atomic context?=20
>=20
> One other thing is, I profiled that updating a 3MB shadow buffer needs
> 20 ms, which transfer to 150 MB/s bandwidth. Could it be related with
> the cache setting of DRM shadow buffer? say the orginal code use a
> cachable buffer?
>=20
>=20
>>
>> https://unix.stackexchange.com/questions/3759/how-to-stop-cursor-from-=
blinking
>>
>> Bunch of tricks, but tbh I haven't tested them.
>=20
> Thomas has suggested to disable curson by
> 	echo 0 > /sys/devices/virtual/graphics/fbcon/cursor_blink
>=20
> We tried that way, and no change for the performance data.

There are several ways of disabling the cursor. On my test system, I ente=
red

  tput civis

before the test and got better performance. Did you try this as well?

Best regards
Thomas

>=20
> Thanks,
> Feng
>=20
>>
>> In any case, I still strongly advice you don't print anything to dmesg=

>> or fbcon while benchmarking, because dmesg/printf are anything but
>> fast, especially if a gpu driver is involved. There's some efforts to
>> make the dmesg/printk side less painful (untangling the console_lock
>> from printk), but fundamentally printing to the gpu from the kernel
>> through dmesg/fbcon won't be cheap. It's just not something we
>> optimize beyond "make sure it works for emergencies".
>> -Daniel
>>
>>>
>>> Best regards
>>> Thomas
>>>
>>>>
>>>> Thanks,
>>>> Feng
>>>>
>>>>>
>>>>> Best regards
>>>>> Thomas
>>>> _______________________________________________
>>>> dri-devel mailing list
>>>> dri-devel@lists.freedesktop.org
>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>
>>>
>>> --
>>> Thomas Zimmermann
>>> Graphics Driver Developer
>>> SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
>>> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
>>> HRB 21284 (AG N=C3=BCrnberg)
>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>>
>>
>> --=20
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> +41 (0) 79 365 57 48 - http://blog.ffwll.ch

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--GAqvzYwfBSRNT5wxc8MZTQlopx9rsHEt8--

--z5u8L7PhZwl2omekefWdTSnCrm327WPWo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl1veTwACgkQaA3BHVML
eiN7CAf/SM9JDoFBaUDWj8xO1i+O4qpKpzL0OAfmSuxHySqrhdIuIozl8XbP1KFF
SQ2dZWkFxTaR01c4dp8C1bwbYNejR6LapZKzQKIlzKSYdXIbtUPeG8cFV6IfFELl
bTWa6NW2c6oWQVHwOwXpKlKqtEBG7Dq7uYNhkavsWjdAOnG68e8jhAyLClvbURRQ
XL/pthimnw53eIKHlGgRU+/Ps5KKjMlDZ8hEa3Uuew+oBLeziCfMnqpyUeU5Tp1D
riQ+Ogtf0V3VC4VyE43ftY8n/DBXW8y03mkIX5y1lAlldYt9mQDLiTQviWpzVOiW
uOg0B9LuCPsEbk09sKs/4ue4Hz7kxQ==
=HaY+
-----END PGP SIGNATURE-----

--z5u8L7PhZwl2omekefWdTSnCrm327WPWo--

--===============0071210272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0071210272==--
