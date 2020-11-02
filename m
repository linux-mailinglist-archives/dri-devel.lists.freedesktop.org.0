Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F05D2A2AD5
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 13:40:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB926E4CD;
	Mon,  2 Nov 2020 12:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTP id F381B6E4CD
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 12:40:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4A447ABAE;
 Mon,  2 Nov 2020 12:40:16 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1604315990-56787-1-git-send-email-tiantao6@hisilicon.com>
 <8a76d144-f8ba-bbbc-9177-53088f6dc73a@suse.de>
Subject: Re: [PATCH] drm/irq: Add irq as false detection
Message-ID: <d0b8c494-0d08-11ae-c0e9-988dbf9ecd35@suse.de>
Date: Mon, 2 Nov 2020 13:40:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <8a76d144-f8ba-bbbc-9177-53088f6dc73a@suse.de>
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
Content-Type: multipart/mixed; boundary="===============2072226780=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2072226780==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bzPCNdb9ypcIHif8YlnoP88e9i0IkA2Fu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bzPCNdb9ypcIHif8YlnoP88e9i0IkA2Fu
Content-Type: multipart/mixed; boundary="wRC55j20zAQaElivTwywDdnwlKJHc0uVL";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <d0b8c494-0d08-11ae-c0e9-988dbf9ecd35@suse.de>
Subject: Re: [PATCH] drm/irq: Add irq as false detection
References: <1604315990-56787-1-git-send-email-tiantao6@hisilicon.com>
 <8a76d144-f8ba-bbbc-9177-53088f6dc73a@suse.de>
In-Reply-To: <8a76d144-f8ba-bbbc-9177-53088f6dc73a@suse.de>

--wRC55j20zAQaElivTwywDdnwlKJHc0uVL
Content-Type: multipart/mixed;
 boundary="------------B3BB7218925AF6EFDA673F7B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------B3BB7218925AF6EFDA673F7B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi

Am 02.11.20 um 13:09 schrieb Thomas Zimmermann:
> Hi
>=20
> Am 02.11.20 um 12:19 schrieb Tian Tao:
>> Add the detection of false for irq, so that the EINVAL is not
>> returned when dev->irq_enabled is false.
>>
>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>> ---
>>  drivers/gpu/drm/drm_irq.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
>> index 09d6e9e..7537a3d 100644
>> --- a/drivers/gpu/drm/drm_irq.c
>> +++ b/drivers/gpu/drm/drm_irq.c
>> @@ -172,6 +172,9 @@ int drm_irq_uninstall(struct drm_device *dev)
>>  	bool irq_enabled;
>>  	int i;
>> =20
>> +	if (!dev->irq_enabled || !dev)
>> +		return 0;
>> +
>=20
> Dereferencing a pointer before NULL-checking it, is Yoda programming. :=
)
> I'd just drop the test for !dev and assume that dev is always valid.
>=20
> I suggest to change the int return value to void and return nothing.
>=20
> Re-reading the actual implementation of this function, this location
> might be too early. Further below there already is a test for
> irq_enabled. Put a drm_WARN_ON around it and it should be fine. This wa=
y
> the vblank handlers will be disabled and erroneous callers will see a
> warning in the kernel's log.

In addition to these changes, you could also add a managed
implementation of drm_irq_install(). The canonical name should be
devm_drm_irq_install(). The function would call drm_irq_install() and
register a cleanup handler via devm_add_action(). Example code is at [1].=


KMS drivers, such as hibmc, would then not have to bother about
uninstalling the DRM irq.

Best regards
Thomas

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/gpu/drm/drm_drv.c#n664


>=20
> Best regards
> Thomas
>=20
>>  	irq_enabled =3D dev->irq_enabled;
>>  	dev->irq_enabled =3D false;
>> =20
>>
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

--------------B3BB7218925AF6EFDA673F7B
Content-Type: application/pgp-keys;
 name="OpenPGP_0x680DC11D530B7A23.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0x680DC11D530B7A23.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdgX=
H47
fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0BeB5B=
bqP
5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4YchdHm3bkPj=
z9E
ErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB9GluwvIhSezPg=
nEm
imZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEBAAHNKFRob21hcyBaa=
W1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwI4EEwEIADgCGwMFCwkIBwIGFQoJCAsCB=
BYC
AwECHgECF4AWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCXvxIWAAKCRBoDcEdUwt6I+aZB/9ih=
Onf
G4Lgf1L87cvoXh95/bnaJ6aQhP6/ZeRleuCXflnyDajlm3c9loQr0r2bQUi7JeYwUKbBab2QS=
GJm
DMRGlLMnmzWB8mHmZ6bHAu+2Sth8SraE42p6BB9d8dlYEID+dl/D/xUBeulfkck5rloGtYqDi=
+1Q
DfkEZJaxVSZ6FFkXuQi/G9qcI4iklN2nv02iQ7mZe8WYAysix6s/6vIobhirEBreclSNxXqis=
p8n
91+v855JC11EgRdUXMRK81IAaCKXP8zLx3ixku7mvP9Om61yerHSbeU2HZbIggZYQlFh6llJm=
zF1
CjCWgPTJyk4t4kMTcNOw5ykD47vU/KW+wl0EEBECAB0WIQQn6OOmnzvP/7ktjmoud6EwEfXTw=
gUC
WzodVwAKCRAud6EwEfXTwidvAKDkOADDHfI0QNXqAZcg6i1kOndAYACeLXHBwpjnumkPSyoab=
IiL
+he8r3zCwHMEEAEIAB0WIQQeXZghmQijlU7YzFiqUDvJrg9HpwUCWznxsQAKCRCqUDvJrg9Hp=
42f
CADIvsZcAd04PDFclRltHr2huy6s7+ZZA6PgYlMblEBh4bJA+dNPBTvzpJ7FJv/bmHOa+phWy=
Urj
EpfFGuOKGuWAfzgVAEu52fMrW3/mm+O26z1AKIu8hiZ/x9OAe4AM71ZO2lZrV1/53ZdzWnRuO=
45N
GQcotU8oeVfT9okAfmozmWMmIMq7Q0K6bV8W3qiD5XfDNxjr2caxc/9WX1bZPUo3n0H23MNaA=
Tpy
Oz732UtDh6sKUAB1RfzBBd/REbjHD7+quwJGAdRScyDRncX1vNb2+wihy0ipA69XY3bkhR5iD=
u5r
A9enuiMe6J1IBMI1PZh+vOufB/M6cd2D9RULIJaJwsBzBBABCAAdFiEEuyNtt7Ge78bIRx1op=
/N8
GYw5MYEFAls6MrsACgkQp/N8GYw5MYEnLQf/dwqlDJVQL2q+i8FFaqTMAm0n9jLRV6pN8JxFH=
j0g
voyWUOnQuNdAFgtKd26ZhN8NkLoSMO8E19eBPfLoBIFK5yNNVmRHAZm07MzGbA0uNWINJhmdR=
bZM
RMh0nneXjcEU/IvUmd8TPFTAd24X2mbzHgcaHMLJSVx1ohd4alRJXHIqDobKmiVwekyPnInJn=
zWw
iuZUkIotTkQple1PT/dF3S+KtPXBL6ldQ4NkAeCjsz4wnzSa9+VKOxEhiHM0PMzXSbkCMP+4m=
Xy9
RMplBw9Dm9hN2PSouBPifIrSodiiSWZYXOEkzLiBAB0frCKR63Dnx9kvjCD9Pz5wLd/70rjqI=
c0n
VGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+wsCOBBMBCAA4AhsDBQsJC=
AcC
BhUKCQgLAgQWAgMBAh4BAheAFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl78SF4ACgkQaA3BH=
VML
eiOpGAgAih6C1OnWms/N8eBMC4Q93y/nyywe5vCL22Dr1rwgn6Iw2jOGziJSi7zhY4sEk2NKJ=
5cd
lFrx8mP//b+xO4AGffwBD0Vwpf38Hj2Gt0KjpzRYccqqU+tJPO5c0pjI52ZIV3+kOEFvYGfkN=
PHE
flE+b81T8L2dSXCLtj4WAGUM1rmHn3bCYl+/RwkB+8XnoL5AvrmMcU4Uhb3FJpM4DHExccYkd=
eSL
ojBppOCztBCUpBx3le+8QPVvAvJDuur4wRmjk3sjKClAwzeqoYyUKcN3JDdb3mt3QcJal9rSh=
VEI
7B25IvfmEbs42oGm8GPzPkaNJu3gcska+l5PSTfurNETGsJdBBARAgAdFiEEJ+jjpp87z/+5L=
Y5q
LnehMBH108IFAls6HVcACgkQLnehMBH108LTkACgjLQdDYMENi6BDjY/gd/LF9lMi8oAnR+o0=
FwE
Vb1K1tEMQ/1x+k1U6/xgwsBzBBABCAAdFiEEHl2YIZkIo5VO2MxYqlA7ya4PR6cFAls58bMAC=
gkQ
qlA7ya4PR6cvTAgAzY1N5QMKh8ECRtYcZNmilyV59uHTEY9hAR+203JqWnSGfUKtU7s6xfl5O=
NGq
DI5rULk4Cw2CEIzg9Sat+/lxn36w2f1tEznS5Vb0gVGWrzDAFjj7tB6MnmCzsNb/S1kgxnqJM=
Yor
RYQ7uB3Yr2Fdp08FJxN0ipd5YfzaZ6KoSWcRAv4r1R4ZQGuS77URAg7HDOIrBMOVO+HIn7GYQ=
qPS
5ZFw5yXbvEtL1c5Y8Zdw1AG2VmEXx78TWQVG3kI8/lQF1QI3yrJ1Rp2x5eK9I0OJihv13IlIW=
3sb
QGrj9pxF63kA20ZFaynzFglBGiyxExYvTD0/xKIhzYhj8mtCunPb2cLAcwQQAQgAHRYhBLsjb=
bex
nu/GyEcdaKfzfBmMOTGBBQJbOjLAAAoJEKfzfBmMOTGBBoMIALIW4EtBY28tPwZMOpN/+ARPO=
a2g
Qzpivw7iNtiDTnGIXMCoxly1CybfMdqTHYmuKbEO9AlFAlDOnkgInsn8E65IvgUTVI95Ah+Ob=
iPI
FkYc/9a+AexPl7f5kI9489k77eKtqtMpWFpo/vROmRroSw4JnM7ovwPq1QOSHExfTKbLunzD1=
i3V
4PShSZ6bGsp1LW6Wk0lRMHDuAk3xsyjBWfJwSbrCe3E6OsLG7BuQqEUt2fR6NxdDRSR9tQUp9=
Tri
AYG5LndmUzxeU6FAQjD8Wt1ezOFH5ODcCDXfRyYmE6uCGA4EvO8l9R3o68NPlUjPRAZsCbxJa=
UAg
iazX1nyQGwvOwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHU=
E9e
osYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+q=
bU6
3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWWG=
KdD
egUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lvhFXod=
NFM
AgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsAEQEAAcLAf=
AQY
AQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkDwmcAAAoJEGgNwR1TC3ojp=
fcI
AInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2h9ifw9Nf2TjCZ6AMvC3thAN0r=
FDj
55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxUn+LSiRrOdywn6erjxRi9EYTVLCHcD=
hBE
jKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uIaMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU=
2y3
ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBWHE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/t=
sZv
yEX6zN8CtirPdPWu/VXNRYAl/lat7lSI3H26qrE=3D
=3DmxFq
-----END PGP PUBLIC KEY BLOCK-----

--------------B3BB7218925AF6EFDA673F7B--

--wRC55j20zAQaElivTwywDdnwlKJHc0uVL--

--bzPCNdb9ypcIHif8YlnoP88e9i0IkA2Fu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl+f/i8FAwAAAAAACgkQaA3BHVMLeiOr
VggAkzwA/y/vttIRmXgILsNaiCwC3yCDGvPB3P3BiUftK6nvRDYbb4d956+2UQ45kzzQDMuhQ/Wb
rTWrFiVpBFhLI5A7V/mCljRL7wHwTRWEdLlnWU+k1Tum4rkYio0vkUpZiBbNCAsojuFNV5fRRJHV
bf1T3kRcymou1Swt5q8pHjvJ2RGbU4mLy4sQ1ZBAJqZyjfenZlZqcHk9Vm6yxQRZYVJHzEHIEjHr
ionF/dK8uYAJuqUP95DyQqXCJEXYTvQmD3F40XFwmaMqKtK9HPKkzFKvEMTlZnN2h43x/J7GSpBZ
1OeCEjlhA7VDYe44hFVJyqA2cFmy6BUbwZxpRITElA==
=QRCN
-----END PGP SIGNATURE-----

--bzPCNdb9ypcIHif8YlnoP88e9i0IkA2Fu--

--===============2072226780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2072226780==--
