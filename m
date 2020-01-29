Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D61714C6CC
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 08:20:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFD66F461;
	Wed, 29 Jan 2020 07:20:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DB86F461
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 07:20:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2DD8BADDD;
 Wed, 29 Jan 2020 07:20:43 +0000 (UTC)
Subject: Re: [PATCH] matroxfb: add Matrox MGA-G200eW board support
To: Rich Felker <dalias@libc.org>
References: <20200125195506.GA16638@brightrain.aerifal.cx>
 <1466259e-efe7-df52-c05b-80042628d577@suse.de>
 <20200128185819.GG30412@brightrain.aerifal.cx>
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
Message-ID: <b667c38a-381e-3b32-3050-f35fcfe2dfcb@suse.de>
Date: Wed, 29 Jan 2020 08:20:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200128185819.GG30412@brightrain.aerifal.cx>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: multipart/mixed; boundary="===============0535118713=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0535118713==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3gezrqnn607yPBbay9tsQHGpVxxVVhmKm"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3gezrqnn607yPBbay9tsQHGpVxxVVhmKm
Content-Type: multipart/mixed; boundary="jiHI8bmAKGzPRvPZHeFhvF89VkNz8nEUl";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rich Felker <dalias@libc.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>
Message-ID: <b667c38a-381e-3b32-3050-f35fcfe2dfcb@suse.de>
Subject: Re: [PATCH] matroxfb: add Matrox MGA-G200eW board support
References: <20200125195506.GA16638@brightrain.aerifal.cx>
 <1466259e-efe7-df52-c05b-80042628d577@suse.de>
 <20200128185819.GG30412@brightrain.aerifal.cx>
In-Reply-To: <20200128185819.GG30412@brightrain.aerifal.cx>

--jiHI8bmAKGzPRvPZHeFhvF89VkNz8nEUl
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 28.01.20 um 19:58 schrieb Rich Felker:
> On Mon, Jan 27, 2020 at 08:36:07AM +0100, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 25.01.20 um 20:55 schrieb Rich Felker:
>>> Signed-off-by: Rich Felker <dalias@libc.org>
>>> --
>>> I've had this lying around a while and figure I should send it
>>> upsteam; it's needed to support the onboard video on my Spectre-free
>>> Atom S1260 server board.
>>
>> This HW is supported by mgag200, which is maintained. Can't you use th=
at?
>=20
> Perhaps; I wasn't aware it existed. I'll give it a try. It still might
> be nice to apply my patch though since the matroxfb driver works with
> it and only fails to support it because of not knowing the device id.

Well, I have no say about applying your patch. You can ping me however,
if mgag200 doesn't work for you.

Best regards
Thomas

>=20
> Rich
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--jiHI8bmAKGzPRvPZHeFhvF89VkNz8nEUl--

--3gezrqnn607yPBbay9tsQHGpVxxVVhmKm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4xMkoACgkQaA3BHVML
eiO5kggAvRGcA7e/xtccGdTsgQhlq4Wf9Ms0D/DgpOjK0at6Q4iK+nwAeui3fb4A
Jo8iqTqzm6LOoH+kTknTIXMlFnkf06t7canfBOv0jqkM82L1AEdp28NlXMM9AuTk
/TngvH4q7N/XRhjNhbav1maqKVaQR5/UhwbQGbJsaX1MCOLmyfvjIRMXsczdoxBh
UAPLVgjdhvXZPj/lYTqPRTJSaOTK0EY44Qv3Ywr0oaUdOaRiqK3PLbwU9tXuQ4PS
Uhfcu3DQQ1cmGuZPUG9ben0HMeHZU1oqYMvA/tPMjP4SX6nulSsyYNkyrXf8e3xT
g55Uij0uK8FVRlq3x12ftXLXDsnRNA==
=vbNs
-----END PGP SIGNATURE-----

--3gezrqnn607yPBbay9tsQHGpVxxVVhmKm--

--===============0535118713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0535118713==--
