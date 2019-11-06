Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 021DEF10F7
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 09:22:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58646E1A3;
	Wed,  6 Nov 2019 08:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D306E1A3
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 08:22:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2CDD2AD09;
 Wed,  6 Nov 2019 08:22:26 +0000 (UTC)
Subject: Re: [PATCH 3/3] drm/udl: Switch to SHMEM
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20191028084549.30243-1-tzimmermann@suse.de>
 <20191028084549.30243-4-tzimmermann@suse.de>
 <20191105110521.zwv35ihnqlmwla3u@sirius.home.kraxel.org>
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
Message-ID: <67c86556-9b8e-3bb8-161b-754f63d25d8d@suse.de>
Date: Wed, 6 Nov 2019 09:22:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191105110521.zwv35ihnqlmwla3u@sirius.home.kraxel.org>
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
Cc: sean@poorly.run, dri-devel@lists.freedesktop.org, airlied@redhat.com,
 sam@ravnborg.org, emil.velikov@collabora.com
Content-Type: multipart/mixed; boundary="===============0461102253=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0461102253==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="EsEcsv8h5FPJnCPIlzxPFa75xeZFCf5Qn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EsEcsv8h5FPJnCPIlzxPFa75xeZFCf5Qn
Content-Type: multipart/mixed; boundary="9VaQpgqdZ11wloREsGVKwx4d3q6XytsSQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch, noralf@tronnes.org,
 sam@ravnborg.org, emil.velikov@collabora.com, dri-devel@lists.freedesktop.org
Message-ID: <67c86556-9b8e-3bb8-161b-754f63d25d8d@suse.de>
Subject: Re: [PATCH 3/3] drm/udl: Switch to SHMEM
References: <20191028084549.30243-1-tzimmermann@suse.de>
 <20191028084549.30243-4-tzimmermann@suse.de>
 <20191105110521.zwv35ihnqlmwla3u@sirius.home.kraxel.org>
In-Reply-To: <20191105110521.zwv35ihnqlmwla3u@sirius.home.kraxel.org>

--9VaQpgqdZ11wloREsGVKwx4d3q6XytsSQ
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.11.19 um 12:05 schrieb Gerd Hoffmann:
> On Mon, Oct 28, 2019 at 09:45:49AM +0100, Thomas Zimmermann wrote:
>> Udl's GEM code and the generic SHMEM are almost identical. Replace
>> the former with SHMEM. The dmabuf support in udl is being removed
>> in favor of the generic GEM PRIME functions.
>>
>> The main difference is in the caching flags for mmap pages. By
>> default, SHMEM always sets (uncached) write combining. In udl's
>> memory management code, only imported buffers use write combining.
>> Memory pages of locally created buffer objects are mmap'ed with
>> caching enabled. To keep the optimization, udl provides its own
>> mmap function for GEM objects where it fixes up the mapping flags.
>=20
> Hmm, couldn't spot anything wrong, but it's rather hard to see the
> actual changes here ...
>=20
> Any chance that having a separate "remove all dead code obsoleted by
> shmem helpers" patch helps?

Let me see what I can do.

Best regards
Thomas

>=20
> cheers,
>   Gerd
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--9VaQpgqdZ11wloREsGVKwx4d3q6XytsSQ--

--EsEcsv8h5FPJnCPIlzxPFa75xeZFCf5Qn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3CgsEACgkQaA3BHVML
eiNpNAgApsStL+y7JH90+0+DpBCj4aDT8/gUUUs44FWLjSQr4vkT2ifTL+5GZyg3
oX0QFXE3KUR7rn3L4U3JamYqX04FBzolBrz7O+3Fju8mJGS4NfKBqofy9nrAZ6V2
zonoWQ+tvRsounkQ9GfSDWTbY7+1V5OW2CPQzqxwaKElHoZEZL7+c/IxcypmPG66
oc7QTP9LSVeaOv2gCc0w/z07G4f83qC6AylJggjH6OgfNx268bM4tU6UyXKzepwX
HMV/yMdY6g8wX+PyFvYeGxulmYVGUKLZquRpYiP3Tre+1ekkj1v8J8fexIZR+Aak
hvJrHPFearEyanqjWxItgn073F6fyQ==
=2IJr
-----END PGP SIGNATURE-----

--EsEcsv8h5FPJnCPIlzxPFa75xeZFCf5Qn--

--===============0461102253==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0461102253==--
