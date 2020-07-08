Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F9E218A1F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 16:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EC36E8E1;
	Wed,  8 Jul 2020 14:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5F96E8DD
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 14:25:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6A910AC82;
 Wed,  8 Jul 2020 14:25:45 +0000 (UTC)
Subject: Re: drm/ast something ate high-res modes (5.3->5.6 regression)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@cs.helsinki.fi>
References: <alpine.DEB.2.20.2007081246050.12041@whs-18.cs.helsinki.fi>
 <f2b36a2e-baf7-ea23-fdb5-bfb7c54c0f4f@suse.de>
 <alpine.DEB.2.20.2007081638020.12041@whs-18.cs.helsinki.fi>
 <930a059f-ce19-f479-3345-0bc8c3d27518@suse.de>
Message-ID: <26e69cca-10e3-7ca2-db1c-89bcb7e88b93@suse.de>
Date: Wed, 8 Jul 2020 16:25:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <930a059f-ce19-f479-3345-0bc8c3d27518@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1193799403=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1193799403==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="w96LUmgjgv9ApOPGzPCG1bOJXVFlSpqEI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--w96LUmgjgv9ApOPGzPCG1bOJXVFlSpqEI
Content-Type: multipart/mixed; boundary="vL3R4wCIT4Zf5kEuUnYV6fCcAPKaK1BGA";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@cs.helsinki.fi>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <26e69cca-10e3-7ca2-db1c-89bcb7e88b93@suse.de>
Subject: Re: drm/ast something ate high-res modes (5.3->5.6 regression)
References: <alpine.DEB.2.20.2007081246050.12041@whs-18.cs.helsinki.fi>
 <f2b36a2e-baf7-ea23-fdb5-bfb7c54c0f4f@suse.de>
 <alpine.DEB.2.20.2007081638020.12041@whs-18.cs.helsinki.fi>
 <930a059f-ce19-f479-3345-0bc8c3d27518@suse.de>
In-Reply-To: <930a059f-ce19-f479-3345-0bc8c3d27518@suse.de>

--vL3R4wCIT4Zf5kEuUnYV6fCcAPKaK1BGA
Content-Type: text/plain; charset=iso-8859-15
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.07.20 um 16:22 schrieb Thomas Zimmermann:
> Hi
>=20
> Am 08.07.20 um 15:46 schrieb Ilpo J=E4rvinen:
>> On Wed, 8 Jul 2020, Thomas Zimmermann wrote:
>>
>>> Hi
>>>
>>> Am 08.07.20 um 12:05 schrieb Ilpo J=E4rvinen:
>>>> Hi,
>>>>
>>>> After upgrading kernel from 5.3 series to 5.6.16 something seems to =

>>>> prevent me from achieving high resolutions with the ast driver.
>>>
>>> Thanks for reporting. It's not a bug, but a side effect of atomic
>>> modesetting.
>>>
>>> During pageflips, the old code used to kick out the currently display=
ed
>>> framebuffer and then load in the new one. If that failed, the display=

>>> went garbage.
>>>
>>> In v5.6-rc1, we merged atomic modesetting for ast. This means that
>>> screen updates are more reliable, but we have to over-commit resource=
s.
>>> Specifically, we have to reserve space for two buffers in video memor=
y
>>> while a pageflip happens. 1920x1200@32 are ~9MiB of framebuffer memor=
y.
>>> If your device has 16 MiB of VRAM, there's no space left for the seco=
nd
>>> framebuffer. Hence, the resolution is no longer supported.
>>>
>>> On the positive side, you can now use Wayland compositors with ast.
>>> Atomic modesetting adds the necessary interfaces.
>>
>> Ok, thanks for the info although it's quite disappointing (not the fir=
st=20
>> time to lose features with kms, migrating to it made me to lose dpms) =
;-).
>>
>> As it's quite annoying to lose a high resolution mode (or be stuck in =

>> some old kernel), would it be technically feasible to make the framebu=
ffer=20
>> allocation asymmetrical? That is, the switch to high-res mode would ge=
t
>> rejected when it would be into the smaller of the two buffers but not =
when=20
>> the arrangement is the other way around?
>=20
> I'm not sure what you mean here, but generally, there's no way of fixin=
g
> this without performance penalty.

I actually considered this, but didn't think it was worth it. The
high-res modes would be sluggish. But then again, they already were, so
it might not make much of a difference...

Best regards
Thomas

>=20
> The screen resolution is only programmed once. Later updates only
> require pageflips. For each pageflip, atomic modesetting requires the
> new and the old framebuffer in video memory at the same time. These two=

> framebuffers are typically allocated once by Gnome/KDE/etc compositors,=

> and compositors go back and forth between them. It's basically double
> buffering.
>=20
> Best regards
> Thomas
>=20
>>
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--vL3R4wCIT4Zf5kEuUnYV6fCcAPKaK1BGA--

--w96LUmgjgv9ApOPGzPCG1bOJXVFlSpqEI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8F12gUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiP9+AgAl6K07M7MizPdTw5yhpQAqCSlTmE/
vEMn2djwpE1EXGV2AN1KCI46HqpQoOTqpcYnSKHWA2LiXsbhdKVVVftWCLmUcibc
Alb2qznXnz20cfvOvXS8q+uZto0MaudTHEGjxExyfRI5Rrc+RIqUdMQzMWgmnDDR
XXlkUZ6l82LdBO9TaSrXTykz2W6N1SaUUoVbKxhQCLK0nOVhCOc62DOPXeGQ4HA2
lqniaI0KKDGAArpil+1E+Hh4w/VQbhgsP6jKn/KzXyMCBQjS5QE4sYXxV3BA9pix
Pwp9ZQBfsa+rvxAuy7susjjNE6zKb/V+5n+a3J3/Mk/prrj0o0qqApqDLQ==
=BAz+
-----END PGP SIGNATURE-----

--w96LUmgjgv9ApOPGzPCG1bOJXVFlSpqEI--

--===============1193799403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1193799403==--
