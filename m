Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDEA1502B1
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 09:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A6C8972B;
	Mon,  3 Feb 2020 08:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A046E8972B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 08:36:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A308BACA4;
 Mon,  3 Feb 2020 08:36:07 +0000 (UTC)
Subject: Re: [PATCH 2/4] drm/bochs: Implement struct
 drm_mode_config_funcs.mode_valid
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20200201122744.27165-1-tzimmermann@suse.de>
 <20200201122744.27165-3-tzimmermann@suse.de>
 <20200203064757.2v4hqad2trw7jcwk@sirius.home.kraxel.org>
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
Message-ID: <86d3f7c6-0fda-9f2a-017f-5ea5623fac4f@suse.de>
Date: Mon, 3 Feb 2020 09:35:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200203064757.2v4hqad2trw7jcwk@sirius.home.kraxel.org>
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
Cc: airlied@linux.ie, puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
 hdegoede@redhat.com, kong.kongxinwei@hisilicon.com, zourongrong@gmail.com,
 sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============1311361009=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1311361009==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="EAs4OIJO0fTC2mTKcTFTtW8tsYrqCU6X6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EAs4OIJO0fTC2mTKcTFTtW8tsYrqCU6X6
Content-Type: multipart/mixed; boundary="ZHb06XHLqeoBWetIInXJXtcQ5nCNbhi4r";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: airlied@linux.ie, puck.chen@hisilicon.com, hdegoede@redhat.com,
 kong.kongxinwei@hisilicon.com, dri-devel@lists.freedesktop.org,
 zourongrong@gmail.com, sam@ravnborg.org
Message-ID: <86d3f7c6-0fda-9f2a-017f-5ea5623fac4f@suse.de>
Subject: Re: [PATCH 2/4] drm/bochs: Implement struct
 drm_mode_config_funcs.mode_valid
References: <20200201122744.27165-1-tzimmermann@suse.de>
 <20200201122744.27165-3-tzimmermann@suse.de>
 <20200203064757.2v4hqad2trw7jcwk@sirius.home.kraxel.org>
In-Reply-To: <20200203064757.2v4hqad2trw7jcwk@sirius.home.kraxel.org>

--ZHb06XHLqeoBWetIInXJXtcQ5nCNbhi4r
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Gerd

Am 03.02.20 um 07:47 schrieb Gerd Hoffmann:
> On Sat, Feb 01, 2020 at 01:27:42PM +0100, Thomas Zimmermann wrote:
>> The implementation of struct drm_mode_config_funcs.mode_valid verifies=

>> that enough video memory is available for a given display mode.
>=20
> There is bochs_connector_mode_valid() doing the same check,
> you can drop it when hooking up drm_vram_helper_mode_valid.

Oh, didn't see it. That's more duplicated code to remove. :)

There's a helpful comment in bochs_connector_mode_valid(). Where shall I
move it?

Best regard
Thomas

>=20
> cheers,
>   Gerd
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--ZHb06XHLqeoBWetIInXJXtcQ5nCNbhi4r--

--EAs4OIJO0fTC2mTKcTFTtW8tsYrqCU6X6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4322sACgkQaA3BHVML
eiPIhwf/cTj0T9wakbKea8gpUhJbdug2J0ecWJiJ5F1SC1mW0pOxOypfuCq0W+c+
NKm/gFlQXc8uyeW7HoGgIfgSVPTscOZdf817tMspr7oTfxXR3k6JYhkOAhHNAgbx
SXEggeI02GWvMepAIkm29C0FH6O+1J3rQkLAY6q14JJNI+RU0sPRnYUjaG2Y/Khx
IXI6o69hbM/x+GnwNjZAmUsrdfwTnryX/LXrqE2P+ewYGCFmXzhZKPxHe6I+0ynQ
n3CBFQNuCftkrr3NgQpxMmTxrI9zJ8sztyz5aA2Le+9pfbyRGDRVFFuthNHNj317
Rc2YakLbPcFB9wrXoinVC6ng5ltzmw==
=QoSy
-----END PGP SIGNATURE-----

--EAs4OIJO0fTC2mTKcTFTtW8tsYrqCU6X6--

--===============1311361009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1311361009==--
