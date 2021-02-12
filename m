Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE8E319C2C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 10:57:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE23893B8;
	Fri, 12 Feb 2021 09:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D195989129
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 09:56:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 632DFB7CA;
 Fri, 12 Feb 2021 09:56:53 +0000 (UTC)
Subject: Re: [PATCH] drm/tiny: add driver for newhaven,1.8-128160EF
To: Daniel Mack <daniel@zonque.org>, airlied@linux.ie, daniel@ffwll.ch
References: <20210211095058.473776-1-daniel@zonque.org>
 <00f588fe-3820-7754-4e24-5789795e21e4@suse.de>
 <0faf3979-f2c2-a654-df72-2824c761fa16@zonque.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <5fd71903-3767-2a9c-2381-f7bdda88e9c9@suse.de>
Date: Fri, 12 Feb 2021 10:56:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <0faf3979-f2c2-a654-df72-2824c761fa16@zonque.org>
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
Cc: robh+dt@kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1226408253=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1226408253==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="zgusBKcQfKyj3IY6kfVzUlfQ3PYyGH4mr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zgusBKcQfKyj3IY6kfVzUlfQ3PYyGH4mr
Content-Type: multipart/mixed; boundary="ZKWqt2svfdoKMxwzhR7uJ8uiOuHILxULi";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Mack <daniel@zonque.org>, airlied@linux.ie, daniel@ffwll.ch
Cc: robh+dt@kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <5fd71903-3767-2a9c-2381-f7bdda88e9c9@suse.de>
Subject: Re: [PATCH] drm/tiny: add driver for newhaven,1.8-128160EF
References: <20210211095058.473776-1-daniel@zonque.org>
 <00f588fe-3820-7754-4e24-5789795e21e4@suse.de>
 <0faf3979-f2c2-a654-df72-2824c761fa16@zonque.org>
In-Reply-To: <0faf3979-f2c2-a654-df72-2824c761fa16@zonque.org>

--ZKWqt2svfdoKMxwzhR7uJ8uiOuHILxULi
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 12.02.21 um 10:47 schrieb Daniel Mack:
> Hi,
>=20
> Thanks for the review!
>=20
> On 2/12/21 8:13 AM, Thomas Zimmermann wrote:
>> thanks for the driver. I only have some minor comments
>>
>> Am 11.02.21 um 10:50 schrieb Daniel Mack:
>>> +#define ILI9163_MADCTL_BGR=C2=A0=C2=A0=C2=A0 BIT(3)
>>> +#define ILI9163_MADCTL_MV=C2=A0=C2=A0=C2=A0 BIT(5)
>>> +#define ILI9163_MADCTL_MX=C2=A0=C2=A0=C2=A0 BIT(6)
>>> +#define ILI9163_MADCTL_MY=C2=A0=C2=A0=C2=A0 BIT(7)
>>
>> The indention is inconsistent. Or maybe it's just my email client.
>=20
> Yes, the latter :)
>=20
> Addressed the rest of your remarks. Will send a v2.

You should also add yourself to MAINTAINERS for this driver.

Best regards
Thomas

>=20
>=20
> Thanks,
> Daniel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--ZKWqt2svfdoKMxwzhR7uJ8uiOuHILxULi--

--zgusBKcQfKyj3IY6kfVzUlfQ3PYyGH4mr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAmUOQFAwAAAAAACgkQlh/E3EQov+Au
FBAAqQnAq4DSLI/CjUEiGpQWqNM0JbbgRXfkH7q7HitGPU9y8J5SKxWXql4GtnMvKbu4rz+NcbtZ
ZlJ3OALPN2YIZEHq4flmsnasOMQmVsEdJClCDvfk3abqqCa1rxoNKkHyZUDLF8gMT6Zi4hCj8u8+
533y3EAimXr3VLPXneORfoKX0w+MFOtIdUn1kfhNd9n6A/zoo/fyNPR/XT9V8sMmZzgLrL76yHHO
DG69c6N/Y/AGgh7Kvr2HwG4/DRTuFeX2cca8yDFYredKoGkiYGnd32LHhfHu9xe7+bgAgbmUfkBM
M+8AXdnppnBXNFT2B5YP7YAhcyOhU5GRJYIHq9djzcNmNU8rE0LY99b/mvy8MlFQOR5I0eXCSauN
Zwib67VubUKcot+pAKPFiy8Umfv6E0/WK0esw+xQGbQWJBzjSbVhVNkWg3TOeMPA7YPEvjcHQawv
z8a+7UVbCCN+lGZvj5YpbQkdMPp6FwIKPoOMKeBxyk+g4gmuMNNKj694dI/GxOE+7asa8vdV2GQ+
UDtvyGqcsbGgvHkryTSR9Uj8MMefw0MEyKoEdmz8EIOSH45Q0AslJeXfB5ljN1ECrYezcYDDcnve
9bQYXXJlvLS1tCVnErWWLuEaJpjRdpPzqJCUo/5Pha1VUCK38KnG2waAeq3othLZbnIyEO2S1uIR
xDA=
=d40z
-----END PGP SIGNATURE-----

--zgusBKcQfKyj3IY6kfVzUlfQ3PYyGH4mr--

--===============1226408253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1226408253==--
