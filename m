Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DB0333867
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 10:10:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C223D6E9DD;
	Wed, 10 Mar 2021 09:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CECB6E9DD
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 09:10:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9C66AE27;
 Wed, 10 Mar 2021 09:10:36 +0000 (UTC)
Subject: Re: [PATCH v5 0/7] drm: add simpledrm driver
To: nerdopolis <bluescreen_avenger@verizon.net>,
 dri-devel@lists.freedesktop.org
References: <20160902082245.7119-1-dh.herrmann@gmail.com>
 <1819978.CKrAbXhGjX@nerdopolis>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <c5db27fd-40dc-8800-965e-84be2f562d65@suse.de>
Date: Wed, 10 Mar 2021 10:10:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1819978.CKrAbXhGjX@nerdopolis>
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
Content-Type: multipart/mixed; boundary="===============1221737588=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1221737588==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3FgFreM7hIxyHW2sPsTuUr2SpDJflmtiw"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3FgFreM7hIxyHW2sPsTuUr2SpDJflmtiw
Content-Type: multipart/mixed; boundary="8vr9jyHIxGHTbyiuXaKxJp6zZRaYQ0FCY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: nerdopolis <bluescreen_avenger@verizon.net>,
 dri-devel@lists.freedesktop.org
Message-ID: <c5db27fd-40dc-8800-965e-84be2f562d65@suse.de>
Subject: Re: [PATCH v5 0/7] drm: add simpledrm driver
References: <20160902082245.7119-1-dh.herrmann@gmail.com>
 <1819978.CKrAbXhGjX@nerdopolis>
In-Reply-To: <1819978.CKrAbXhGjX@nerdopolis>

--8vr9jyHIxGHTbyiuXaKxJp6zZRaYQ0FCY
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 10.03.21 um 03:50 schrieb nerdopolis:
> On Friday, September 2, 2016 4:22:38 AM EST David Herrmann wrote:
>> Hey
>>
>> On request of Noralf, I picked up the patches and prepared v5. Works f=
ine with
>> Xorg, if configured according to:
>>      https://lists.freedesktop.org/archives/dri-devel/2014-January/052=
777.html
>> If anyone knows how to make Xorg pick it up dynamically without such a=
 static
>> configuration, please let me know.
>>
>>
>>
> Hi
>=20
> I am kind of curious as I do have interest in seeing this merged as wel=
l.

Please take a look at [1]. It's not the same driver, but something to=20
the same effect. I know it's been almost a year, but I do work on this=20
and intend to come back with a new version during 2021.

I currently work on fastboot support for the new driver. But it's a=20
complicated matter and takes time. If there's interest, we could talk=20
about merging what's already there.

Best regards
Thomas

[1]=20
https://lore.kernel.org/dri-devel/20200625120011.16168-1-tzimmermann@suse=
=2Ede/

>=20
> There is an email in this thread from 2018, but when I tried to import =
an mbox
> file from the whole month for August 2018, for some reason, kmail doesn=
't see
> the sender and mailing list recipient in that one, so I will reply to t=
his one,
> because I was able to import this into my mail client.
> https://www.spinics.net/lists/dri-devel/msg185519.html
>=20
> I was able to get this to build against Linux 4.8, but not against a ne=
wer
> version, some headers seem to have been split, and some things are off =
by 8
> and other things. I could NOT find a git repo, but I was able to find t=
he
> newest patches I could find, and import those with git am against 4.8 w=
ith
> some tweaks. If that is needed, I can link it, but only if you want.
>=20
> However in QEMU I wasn't able to figure out how to make it create a
> /dev/dri/card0 device, even after blacklisting the other modules for qx=
l,
> cirrus, etc, and then modprobe-ing simpledrm
>=20
> In my view something like this is would be useful. There still could be=

> hardware devices that don't have modesetting support (like vmvga in
> qemu/virt-manager as an example). And most wayland servers need a
> /dev/dri/card0 device as well as a potential user-mode TTY replacement =
would
> also need /dev/dri/card0
>=20
> I will admit I unfortunately failed to get it to build against master. =
I
> couldn't figure out some of the changes, where some new structs were of=
f by
> a factor of 8.
>=20
>=20
> Thanks
>=20
>=20
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


--8vr9jyHIxGHTbyiuXaKxJp6zZRaYQ0FCY--

--3FgFreM7hIxyHW2sPsTuUr2SpDJflmtiw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBIjQsFAwAAAAAACgkQlh/E3EQov+AG
kg/+MQSRFsQGGwxx16fsrkNTBmoMIzJal7w6N8f0dh4RE00jAD/gjO0jw7R/KZomT+22JLeapm50
W4BYdTH8wMchaJL4IYLtTEU9Brs0C/puSG7k8GKzbHxfP/NL3tdNSjskVBvLOEKcCWOn9nG4fZ7J
5x5EbRAQXegkjNDfP0NK/WF+BAHEstayphz7EtG4nlIpwY723sngdUEV/d8uxhoSPhtA911Pl5FM
45EWtp6YZVD56fekNEwxGUkrYW9U4Id0kac47KP+/bGXW/Kj6M6dIjRlKdVK44uiXA19TFfouKT0
WNGGQ08JhIhf03kSdT3TQuaCoURs9Gol6l19lzMs7RCGtprUF/GuHzwoF+XQ5rrVJMxJOkD3hlcq
m+MZf2Oy+cBHguYFDYfKnJpOIILs3evwapTNXyFRud0YH8QG37u/ENuzJmP/XOf928nBcGLioZ3X
7iBNsWnT23GH646p9p3GWRyT2z1S+de1KVVrXiSpXgaw8E5t1kkB2r9EAPyj4XyD3PzIq1WmrHN+
3Uim/lvUcAWNF9qxnLpHgje3Xty+ZI/k7uNa0uE2/SxTJ9owlxMdtqUbFZ5UKm+6fmD7cqvx6LSr
N3pWrk/g3Xq/DP29GxVhj3GTrCjIdeEY4TOWYNa7TJArdGx/GuHJSdYmpzyDXSLoiuBFVggQRJm6
U/Q=
=Df5k
-----END PGP SIGNATURE-----

--3FgFreM7hIxyHW2sPsTuUr2SpDJflmtiw--

--===============1221737588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1221737588==--
