Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 714A8ADAE4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 16:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8E589CA2;
	Mon,  9 Sep 2019 14:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C649B89CA2
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 14:12:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3F647B671;
 Mon,  9 Sep 2019 14:12:42 +0000 (UTC)
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
To: Feng Tang <feng.tang@intel.com>
References: <c6e220fe-230c-265c-f2fc-b0948d1cb898@intel.com>
 <20190812072545.GA63191@shbuild999.sh.intel.com>
 <20190813093616.GA65475@shbuild999.sh.intel.com>
 <64d41701-55a4-e526-17ae-8936de4bc1ef@suse.de>
 <20190824051605.GA63850@shbuild999.sh.intel.com>
 <1b897bfe-fd40-3ae3-d867-424d1fc08c44@suse.de>
 <d114b0b6-6b64-406e-6c3f-a8b8d5502413@intel.com>
 <44029e80-ba00-8246-dec0-fda122d53f5e@suse.de>
 <90e78ce8-d46a-5154-c324-a05aa1743c98@intel.com>
 <2e1b4d65-d477-f571-845d-fa0a670859af@suse.de>
 <20190904062716.GC5541@shbuild999.sh.intel.com>
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
Message-ID: <6806e973-4cf7-bcac-54b4-4fac21698ece@suse.de>
Date: Mon, 9 Sep 2019 16:12:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904062716.GC5541@shbuild999.sh.intel.com>
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
 michel@daenzer.net, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, lkp@01.org
Content-Type: multipart/mixed; boundary="===============0578346010=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0578346010==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="OghadfcRL1Pt0IHP3lIOLZqSfLuo3H0Bn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--OghadfcRL1Pt0IHP3lIOLZqSfLuo3H0Bn
Content-Type: multipart/mixed; boundary="b7WbaORTxilxycXJuBGn51oxVbT81WZtM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Feng Tang <feng.tang@intel.com>
Cc: Rong Chen <rong.a.chen@intel.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>, michel@daenzer.net, lkp@01.org,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <6806e973-4cf7-bcac-54b4-4fac21698ece@suse.de>
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
References: <c6e220fe-230c-265c-f2fc-b0948d1cb898@intel.com>
 <20190812072545.GA63191@shbuild999.sh.intel.com>
 <20190813093616.GA65475@shbuild999.sh.intel.com>
 <64d41701-55a4-e526-17ae-8936de4bc1ef@suse.de>
 <20190824051605.GA63850@shbuild999.sh.intel.com>
 <1b897bfe-fd40-3ae3-d867-424d1fc08c44@suse.de>
 <d114b0b6-6b64-406e-6c3f-a8b8d5502413@intel.com>
 <44029e80-ba00-8246-dec0-fda122d53f5e@suse.de>
 <90e78ce8-d46a-5154-c324-a05aa1743c98@intel.com>
 <2e1b4d65-d477-f571-845d-fa0a670859af@suse.de>
 <20190904062716.GC5541@shbuild999.sh.intel.com>
In-Reply-To: <20190904062716.GC5541@shbuild999.sh.intel.com>

--b7WbaORTxilxycXJuBGn51oxVbT81WZtM
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 04.09.19 um 08:27 schrieb Feng Tang:
> Hi Thomas,
>=20
> On Wed, Aug 28, 2019 at 12:51:40PM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 28.08.19 um 11:37 schrieb Rong Chen:
>>> Hi Thomas,
>>>
>>> On 8/28/19 1:16 AM, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> Am 27.08.19 um 14:33 schrieb Chen, Rong A:
>>>>> Both patches have little impact on the performance from our side.
>>>> Thanks for testing. Too bad they doesn't solve the issue.
>>>>
>>>> There's another patch attached. Could you please tests this as well?=

>>>> Thanks a lot!
>>>>
>>>> The patch comes from Daniel Vetter after discussing the problem on I=
RC.
>>>> The idea of the patch is that the old mgag200 code might display muc=
h
>>>> less frames that the generic code, because mgag200 only prints from
>>>> non-atomic context. If we simulate this with the generic code, we sh=
ould
>>>> see roughly the original performance.
>>>>
>>>>
>>>
>>> It's cool, the patch "usecansleep.patch" can fix the issue.
>>
>> Thank you for testing. But don't get too excited, because the patch
>> simulates a bug that was present in the original mgag200 code. A
>> significant number of frames are simply skipped. That is apparently th=
e
>> reason why it's faster.
>=20
> Thanks for the detailed info, so the original code skips time-consuming=

> work inside atomic context on purpose. Is there any space to optmise it=
?
> If 2 scheduled update worker are handled at almost same time, can one b=
e
> skipped?

We discussed ideas on IRC and decided that screen updates could be
synchronized with vblank intervals. This may give some rate limiting to
the output.

If you like, you could try the patch set at [1]. It adds the respective
code to console and mgag200.

Best regards
Thomas

[1]
https://lists.freedesktop.org/archives/dri-devel/2019-September/234850.ht=
ml

>=20
> Thanks,
> Feng
>=20
>>
>> Best regards
>> Thomas

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--b7WbaORTxilxycXJuBGn51oxVbT81WZtM--

--OghadfcRL1Pt0IHP3lIOLZqSfLuo3H0Bn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl12XdUACgkQaA3BHVML
eiP39wgAhj5qgMm7uHo8dffCx5/RrEV1TPzaPcuruhI+cIB0ULF8ZeFJ5O4PpxmN
S3Z1hh4q3m7jRlJ8WOFxfqHLFy4iU1fGFL99M7lHitoHLIttmvRC9Qa3yA4v3Z6z
tD+f+/Ozm954vgKhlkEadsmF8VvkeOLn6XX8O+JVg+rxpDMmEBVoCnYWDjys+N4j
7MVEHnKVHe3Hf1vZVCa69NClsvpjRSdNuASdQzqjuwjYDFDYWgrQWXkFl4sBrmn7
6CKSCbfRbkBfB739vB3WlK3X9RNwKzK62TnwJJptRtT62lDXLlBtBwC2MsBiBGh7
V9FOYDlUTxKUWf7BcUN1JjU7/Kl4dw==
=WP66
-----END PGP SIGNATURE-----

--OghadfcRL1Pt0IHP3lIOLZqSfLuo3H0Bn--

--===============0578346010==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0578346010==--
