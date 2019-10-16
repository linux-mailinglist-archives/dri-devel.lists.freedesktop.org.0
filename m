Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BD3D9260
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 15:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6866E406;
	Wed, 16 Oct 2019 13:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD9896E406
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 13:24:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 11031AD2B;
 Wed, 16 Oct 2019 13:24:01 +0000 (UTC)
Subject: Re: [PATCH] drm: Funnel drm logs to tracepoints
To: Pekka Paalanen <ppaalanen@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20191010204823.195540-1-sean@poorly.run>
 <242462f0-ac8d-ab8a-e567-74678da3f68f@suse.de>
 <20191015191156.GW85762@art_vandelay> <20191015200233.GK1208@intel.com>
 <CAKMK7uE_DiXH_Gz6JBObv_Fs7cUhkH1wTVw4LDx2GZVueqYAPA@mail.gmail.com>
 <20191016160557.73b634c9@eldfell.localdomain>
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
Message-ID: <d6b47400-c254-4f6b-5fac-59693571dee0@suse.de>
Date: Wed, 16 Oct 2019 15:23:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191016160557.73b634c9@eldfell.localdomain>
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0402244112=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0402244112==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dRpHQiFGMKa6fxTuaRu6ElKVCUClh5mDe"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dRpHQiFGMKa6fxTuaRu6ElKVCUClh5mDe
Content-Type: multipart/mixed; boundary="RZtKojYZReCiaAVEtfJfQg53RezLKFYJm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Pekka Paalanen <ppaalanen@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Sean Paul <sean@poorly.run>, dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <d6b47400-c254-4f6b-5fac-59693571dee0@suse.de>
Subject: Re: [PATCH] drm: Funnel drm logs to tracepoints
References: <20191010204823.195540-1-sean@poorly.run>
 <242462f0-ac8d-ab8a-e567-74678da3f68f@suse.de>
 <20191015191156.GW85762@art_vandelay> <20191015200233.GK1208@intel.com>
 <CAKMK7uE_DiXH_Gz6JBObv_Fs7cUhkH1wTVw4LDx2GZVueqYAPA@mail.gmail.com>
 <20191016160557.73b634c9@eldfell.localdomain>
In-Reply-To: <20191016160557.73b634c9@eldfell.localdomain>

--RZtKojYZReCiaAVEtfJfQg53RezLKFYJm
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 16.10.19 um 15:05 schrieb Pekka Paalanen:
> On Wed, 16 Oct 2019 00:35:39 +0200
> Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>=20
>> Yeah I don't think tuning the spam level will ever work. What we need
>> is some external input (most likely from the user clicking the "my
>> external screen doesn't work" button, or maybe the compositor
>> realizing something that should work didn't, or some other thing that
>> indicates trouble), and then retroactively capture all
>> debug/informational message leading up to doom.
>>
>> But without that external "houston we have a problem" input all the
>> debug spam is really just spam and unwanted. btw even if we don't spam=

>> dmesg if we enable too much we might have simply trouble with all the
>> printk formatting work we do for nothing. So maybe we need something
>> like trace_printk which iirc delays the formatting until the stuff
>> actually gets read from the log buffer. Plus trace_printk might make
>> it clear enough that it's not stable uapi ... so maybe we do want
>> trace_printk in the end?
>>
>> Just not really looking forward to reimplementing half the tracing
>> infrastructure just for this ...
>=20
> Hi,
>=20
> a thought about the UAPI:
>=20
> Debugfs is not good because it's not supposed to be touched or even
> present in production, right?

I'm running Tumbleweed where debugfs is mounted by default for root. I
could live having the user to mount debugfs to get the file's content.

> specifically be available in production. So a new file in some fs
> somewhere it should be, and userspace in production can read it at will=

> to attach to a bug report.
>=20
> Those semantics, "only use this content for attaching into a bug
> report" should be made very clear in the UAPI.

Has this ever worked? As soon as a userspace program starts depending on
the content of this file, it becomes kabi. From the incidents I know,
Linus has always been quite strict about this. Even for broken interfaces=
=2E

> I believe it has to be a ring buffer that is being continuously written=

> also during normal operations, so that we don't have to ask end users
> to reproduce the issue again just to get some logs. Maybe the issue
> happens once in a fortnight. The information must be extractable after
> the fact, without before-hand preparations.

Agreed.

Best regards
Thomas

>=20
>=20
> Thanks,
> pq
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--RZtKojYZReCiaAVEtfJfQg53RezLKFYJm--

--dRpHQiFGMKa6fxTuaRu6ElKVCUClh5mDe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl2nGeEACgkQaA3BHVML
eiNJWQf/R2sOQDXxfTenHJ9dXCtt9QfC/dRg4qc5hxRA1GWllQh3wCcQWq3qbuXb
DhKrW9xGz3nyEuuuhSvCY/Pec5/4u/oj9HIykGyMuz/zoX/xnBRY4DTPrGJTGah1
eGSe3LqY7sm0Qwe6+CL/JB8tAOCzIUZ1Cc9vL+TFtSoU2cmUBGpb/RWoBbP0tLMR
BlkX942pBj2XAITCXsCrJWvuDFYqiJEB5ArepvTRyeUtkbcNgBthjvMWClddju5a
012g3gSY7BmxAO6dwSO0HuS4rRMIHBnOUuxA1pGxCdejf9/yedRDH0/DFRMUBfxp
qjaQ1yj/w+kQQGxdvC618O/OGqMlDw==
=ziOe
-----END PGP SIGNATURE-----

--dRpHQiFGMKa6fxTuaRu6ElKVCUClh5mDe--

--===============0402244112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0402244112==--
