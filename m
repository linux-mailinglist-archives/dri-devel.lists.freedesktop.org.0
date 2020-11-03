Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB722A4423
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 12:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA016E17E;
	Tue,  3 Nov 2020 11:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTP id A08D36E17E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 11:25:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DF21EAC1D;
 Tue,  3 Nov 2020 11:25:06 +0000 (UTC)
Subject: Re: [PATCH v2] drm: Add the new api to install irq
To: Maxime Ripard <maxime@cerno.tech>, Tian Tao <tiantao6@hisilicon.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1604369441-65254-1-git-send-email-tiantao6@hisilicon.com>
 <20201103095205.ywabphbc2xbop6ae@gilmour.lan>
 <f89640fb-6994-76dc-7862-a3b26b67dc24@suse.de>
 <20201103103832.gwjqf4urrn5y7zk5@gilmour.lan>
 <20201103105508.GD401619@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <2c364588-7636-f6ad-4cc6-0800088c511b@suse.de>
Date: Tue, 3 Nov 2020 12:25:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201103105508.GD401619@phenom.ffwll.local>
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
Content-Type: multipart/mixed; boundary="===============0394695563=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0394695563==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5LSsijeK7KHgvnRkUzZ9NEzitCfgQn3Pw"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5LSsijeK7KHgvnRkUzZ9NEzitCfgQn3Pw
Content-Type: multipart/mixed; boundary="Czdo1FlAG8DIhR8jE7vYvuPmh8aUCxXJc";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Tian Tao <tiantao6@hisilicon.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <2c364588-7636-f6ad-4cc6-0800088c511b@suse.de>
Subject: Re: [PATCH v2] drm: Add the new api to install irq
References: <1604369441-65254-1-git-send-email-tiantao6@hisilicon.com>
 <20201103095205.ywabphbc2xbop6ae@gilmour.lan>
 <f89640fb-6994-76dc-7862-a3b26b67dc24@suse.de>
 <20201103103832.gwjqf4urrn5y7zk5@gilmour.lan>
 <20201103105508.GD401619@phenom.ffwll.local>
In-Reply-To: <20201103105508.GD401619@phenom.ffwll.local>

--Czdo1FlAG8DIhR8jE7vYvuPmh8aUCxXJc
Content-Type: multipart/mixed;
 boundary="------------C4996FC9A130449310220429"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C4996FC9A130449310220429
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi

Am 03.11.20 um 11:55 schrieb Daniel Vetter:
> On Tue, Nov 03, 2020 at 11:38:32AM +0100, Maxime Ripard wrote:
>> On Tue, Nov 03, 2020 at 11:10:27AM +0100, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 03.11.20 um 10:52 schrieb Maxime Ripard:
>>>> On Tue, Nov 03, 2020 at 10:10:41AM +0800, Tian Tao wrote:
>>>>> Add new api devm_drm_irq_install() to register interrupts,
>>>>> no need to call drm_irq_uninstall() when the drm module is removed.=

>>>>>
>>>>> v2:
>>>>> fixed the wrong parameter.
>>>>>
>>>>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>>>>> ---
>>>>>  drivers/gpu/drm/drm_drv.c | 23 +++++++++++++++++++++++
>>>>>  include/drm/drm_drv.h     |  3 ++-
>>>>>  2 files changed, 25 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>>>>> index cd162d4..0fe5243 100644
>>>>> --- a/drivers/gpu/drm/drm_drv.c
>>>>> +++ b/drivers/gpu/drm/drm_drv.c
>>>>> @@ -39,6 +39,7 @@
>>>>>  #include <drm/drm_color_mgmt.h>
>>>>>  #include <drm/drm_drv.h>
>>>>>  #include <drm/drm_file.h>
>>>>> +#include <drm/drm_irq.h>
>>>>>  #include <drm/drm_managed.h>
>>>>>  #include <drm/drm_mode_object.h>
>>>>>  #include <drm/drm_print.h>
>>>>> @@ -678,6 +679,28 @@ static int devm_drm_dev_init(struct device *pa=
rent,
>>>>>  	return ret;
>>>>>  }
>>>>> =20
>>>>> +static void devm_drm_dev_irq_uninstall(void *data)
>>>>> +{
>>>>> +	drm_irq_uninstall(data);
>>>>> +}
>>>>> +
>>>>> +int devm_drm_irq_install(struct device *parent,
>>>>> +			 struct drm_device *dev, int irq)
>>>>> +{
>>>>> +	int ret;
>>>>> +
>>>>> +	ret =3D drm_irq_install(dev, irq);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	ret =3D devm_add_action(parent, devm_drm_dev_irq_uninstall, dev);=

>>>>> +	if (ret)
>>>>> +		devm_drm_dev_irq_uninstall(dev);
>>>>> +
>>>>> +	return ret;
>>>>> +}
>>>>> +EXPORT_SYMBOL(devm_drm_irq_install);
>>>>> +
>>>>
>>>> Shouldn't we tie the IRQ to the drm device (so with drmm_add_action)=

>>>> instead of tying it to the underlying device?
>>>
>>> If the HW device goes away, there won't be any more interrupts. So it=
's
>>> similar to devm_ functions for I/O memory. Why would you use the drmm=
_
>>> interface?
>>
>> drm_irq_install/uninstall do more that just calling request_irq and
>> free_irq though, they will also run (among other things) the irq-relat=
ed
>> hooks in the drm driver (irq_preinstall, irq_postinstall irq_uninstall=
)
>> and wake anything waiting for a vblank to occur, so we need the DRM
>> device and driver to still be around when we run drm_irq_uninstall.
>> That's why (I assume) you have to pass the drm_device as an argument a=
nd
>> not simply the device.
>=20
> drm_device is guaranteed to outlive devm_, plus the hooks are meant to
> shut down hw. hw isn't around anymore when we do drmm_ cleanup, at leas=
t
> not in full generality.
>=20
>> This probably works in most case since you would allocate the drm_devi=
ce
>> with devm_drm_dev_alloc, and then run drm_irq_install, so in the undoi=
ng
>> phase you would have first drm_irq_uninstall to run, and everything is=

>> fine.
>>
>> However, if one doesn't use devm_drm_dev_alloc but would use
>> devm_drm_irq_install, you would have first remove being called that
>> would free the drm device, and then drm_irq_uninstall which will use a=

>> free'd pointer.
>=20
> Don't do that, it's broken :-)

Umm, I just saw that hibmc doesn't use devm_drm_dev_alloc. So maybe we
have to convert it first before using the managed irq function. OTOH
converting it is a good idea in any case, so why not. :)

Best regards
Thomas

>=20
>> So yeah, even though the interrupt line itself is tied to the device,
>> all the logic we have around the interrupt that is dealt with in
>> drm_irq_install is really tied to the drm_device. And since we tie the=

>> life of drm_device to its underlying device already (either implicitly=

>> through devm_drm_dev_alloc, or explictly through manual allocation in
>> probe and free in remove) we can't end up in a situation where the
>> drm_device outlives its device.
>=20
> Most drivers get their drm_device lifetime completely wrong. That's why=
 I
> typed drmm_ stuff. So this isn't a surprise at all, but it might motive=
ate
> a bunch more people to fix this up correctly.
>=20
> Also, these drm_irq functions are 100% optional helpers (should maybe
> rename them to make this clearer) for modern drivers. They're only buil=
t
> in for DRIVER_LEGACY, because hysterical raisins.
> -Daniel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

--------------C4996FC9A130449310220429
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

--------------C4996FC9A130449310220429--

--Czdo1FlAG8DIhR8jE7vYvuPmh8aUCxXJc--

--5LSsijeK7KHgvnRkUzZ9NEzitCfgQn3Pw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl+hPhIFAwAAAAAACgkQaA3BHVMLeiN1
fwgAjrgfVwmeFrDXgucCDcgTvsby9165ldAlkbbvMWfSOPZJoiHyiACOc5L54vBS423XkPq/Dxc3
o5OJI1EEQM39dJe7GvliD0iX1fIChtvGL8zMIhFx/3fKrScxwMnlsfFsk/X77jCwQyyS8wXFPCx5
VxXkBCELrcOUdO+sp/8wWkp5jUJ3DH7S/VjeClm4PkQjiFNSYqdM79WPbi0SHJ9B+wQErUl6CcqY
j9GCnB4JtRoUDgGM+swFuWNl87UrgM5FmZtnHBBjVyRGwPleTEPpBlGjVcbwRQujZPy/MMOPuf/a
E8egl/1PJMwXA5FApBPUCnQCxOhnF4xHWUJC0GA9OA==
=ntRd
-----END PGP SIGNATURE-----

--5LSsijeK7KHgvnRkUzZ9NEzitCfgQn3Pw--

--===============0394695563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0394695563==--
