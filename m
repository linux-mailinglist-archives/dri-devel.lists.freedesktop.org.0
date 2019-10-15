Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7BAD76C4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 14:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DF889D89;
	Tue, 15 Oct 2019 12:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7573D89D89
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 12:46:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B083DB427;
 Tue, 15 Oct 2019 12:46:44 +0000 (UTC)
Subject: Re: [PATCH v2 14/15] staging/mgakms: Import matroxfb driver source
 code
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sean@poorly.run, b.zolnierkie@samsung.com,
 ajax@redhat.com, ville.syrjala@linux.intel.com, malat@debian.org,
 michel@daenzer.net, corbet@lwn.net, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20191014140416.28517-1-tzimmermann@suse.de>
 <20191014140416.28517-15-tzimmermann@suse.de> <20191015114843.GB4104@sci.fi>
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
Message-ID: <a1e6a1a8-c6b3-26fb-7d96-480a5a7caf65@suse.de>
Date: Tue, 15 Oct 2019 14:46:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191015114843.GB4104@sci.fi>
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
Content-Type: multipart/mixed; boundary="===============1351266982=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1351266982==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DxI2wuFLtAZwXF1Npl9I8uthO5WLEGxjr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DxI2wuFLtAZwXF1Npl9I8uthO5WLEGxjr
Content-Type: multipart/mixed; boundary="or6SuiZEUMjCLZSYl83jywjClSUgfMvcX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sean@poorly.run, b.zolnierkie@samsung.com,
 ajax@redhat.com, ville.syrjala@linux.intel.com, malat@debian.org,
 michel@daenzer.net, corbet@lwn.net, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <a1e6a1a8-c6b3-26fb-7d96-480a5a7caf65@suse.de>
Subject: Re: [PATCH v2 14/15] staging/mgakms: Import matroxfb driver source
 code
References: <20191014140416.28517-1-tzimmermann@suse.de>
 <20191014140416.28517-15-tzimmermann@suse.de> <20191015114843.GB4104@sci.fi>
In-Reply-To: <20191015114843.GB4104@sci.fi>

--or6SuiZEUMjCLZSYl83jywjClSUgfMvcX
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.10.19 um 13:48 schrieb Ville Syrj=C3=A4l=C3=A4:
> On Mon, Oct 14, 2019 at 04:04:15PM +0200, Thomas Zimmermann wrote:
>> Only code is being copied, no functional changes are made.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/staging/mgakms/g450_pll.c         |  539 +++++a
>=20
> ...
>=20
> Personally I would start from scratch. In fact some years (*cough*
> decade) ago I did just that and started writing a new driver for
> matrox stuff. Unfortunately I ran out of steam after figuring out
> most of the interesting hardware quirks and whatnot, so I never
> finished it. The end result is that it still runs in userspace
> but kinda looks like a kernel driver if you squint a bit.
>=20
> Anyways, I just slapped a MIT license on it  dumped the whole
> thing here:
> https://gitlab.com/syrjala/mga
> The development history was, shall we say, not really useful
> so I just squashed it.
>=20
> You, or someone else, might find it interesting. I think in
> terms of hardware support it's a superset of any other driver,
> apart from the blob.
>=20

Just to make this clear: I do not intend to port every single fbdev
driver to DRM. :)

I did, however, began to convert that Matrox driver. First, to see if
the approach does work in general; and because matroxfb is one of the
more complex drivers. If it can be converted, any other driver should be
convertible as well. I split up the driver code by HW generation and can
now refactor each generation on its own. I expect to end up with several
duplicated functions, which can be re-merged.

Maybe our repo can be helpful. Thanks for the link.

Best regards
Thomas

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--or6SuiZEUMjCLZSYl83jywjClSUgfMvcX--

--DxI2wuFLtAZwXF1Npl9I8uthO5WLEGxjr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl2lv7AACgkQaA3BHVML
eiPwZwf+IMs4lQgb5EFMtlul00cQVEgRs/BG6p8f07qlJYu3E2SZsdIGQhXVPd9O
9x93JT+l1oh00VhSlRy50+7NJnGVLz7D+H1iO33I+N/qW/4tZaJxe9MpTR0EGTl/
mEJUmOg8HAeOa1DEMAgHzVB342Wi/A06kBdHmfFORhCvTA2/fkXmGrJDik7oieb9
Ck7q0nDpF65NkPedVLasvT/uM9hrV3wvEPSAy9Cvyr8zLpUFA7iOcZ4sI73Hyomk
4pLY/6s5cEwii81xuFLYm7Z06ZohPpEoFkxVcYR8ViegOpbVFWFw6MlnIpjM1Hft
/vmm4OpfYO/r/7H3XyJULqIlpA5iAw==
=UdgA
-----END PGP SIGNATURE-----

--DxI2wuFLtAZwXF1Npl9I8uthO5WLEGxjr--

--===============1351266982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1351266982==--
