Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F622A8FB7
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 07:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0151C6E088;
	Fri,  6 Nov 2020 06:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4180D6E088
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 06:54:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B7CBDAB8F;
 Fri,  6 Nov 2020 06:54:42 +0000 (UTC)
Subject: Re: [PATCH] drm/ast: Fixed 1920x1080 sync. polarity issue
To: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20201105094729.106059-1-kuohsiang_chou@aspeedtech.com>
 <f9b658a6-8a4d-d512-de90-897af7a6d90d@suse.de>
 <HK2PR06MB330086E2626FA8AD22FCC3CF8CED0@HK2PR06MB3300.apcprd06.prod.outlook.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <8621c03d-ea68-2c35-bc0c-835bb37b7816@suse.de>
Date: Fri, 6 Nov 2020 07:54:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <HK2PR06MB330086E2626FA8AD22FCC3CF8CED0@HK2PR06MB3300.apcprd06.prod.outlook.com>
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
Cc: Jenmin Yuan <jenmin_yuan@aspeedtech.com>, "eich@suse.com" <eich@suse.com>,
 Tommy Huang <tommy_huang@aspeedtech.com>, Arc Sung <arc_sung@aspeedtech.com>,
 "airlied@redhat.com" <airlied@redhat.com>
Content-Type: multipart/mixed; boundary="===============2136707116=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2136707116==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9qiDHi8LtwhHVom6yaHiTQqndRZT1iFiD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9qiDHi8LtwhHVom6yaHiTQqndRZT1iFiD
Content-Type: multipart/mixed; boundary="5iKNz2u38znwEdi8ayNpjwoa2gigezLGa";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: Jenmin Yuan <jenmin_yuan@aspeedtech.com>, "eich@suse.com"
 <eich@suse.com>, Tommy Huang <tommy_huang@aspeedtech.com>,
 Arc Sung <arc_sung@aspeedtech.com>, "airlied@redhat.com" <airlied@redhat.com>
Message-ID: <8621c03d-ea68-2c35-bc0c-835bb37b7816@suse.de>
Subject: Re: [PATCH] drm/ast: Fixed 1920x1080 sync. polarity issue
References: <20201105094729.106059-1-kuohsiang_chou@aspeedtech.com>
 <f9b658a6-8a4d-d512-de90-897af7a6d90d@suse.de>
 <HK2PR06MB330086E2626FA8AD22FCC3CF8CED0@HK2PR06MB3300.apcprd06.prod.outlook.com>
In-Reply-To: <HK2PR06MB330086E2626FA8AD22FCC3CF8CED0@HK2PR06MB3300.apcprd06.prod.outlook.com>

--5iKNz2u38znwEdi8ayNpjwoa2gigezLGa
Content-Type: multipart/mixed;
 boundary="------------4ECF86A86F7858AE88A7A787"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4ECF86A86F7858AE88A7A787
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi

Am 06.11.20 um 01:31 schrieb Kuo-Hsiang Chou:
> To Sir
>=20
> Yes, I ran scripts/checkpatch.pl and cleared 3 errors about tailing spa=
ces.
>=20
> OK, would you please give me the mail-address of Daniel?

It's <daniel.vetter@ffwll.ch>

> And <eich@suse.de> will be removed from CC.=20

Thanks!

> Because I ran get_maintainers.pl and got the result of " The current di=
rectory does not appear to be a linux kernel source tree. "

Strange, that sounds like a problem in your setup. Go to the actual
directory where you checkout out the Linux source code; where the
MAINTAINERS file is located. From there use

  scripts/get_maintainers.pl

That should work.

Best regards
Thomas

> So, I got the information from MAINTAINERS by keyword of "/drm/ast", li=
kes as:
> DRM DRIVER FOR AST SERVER GRAPHICS CHIPS
> M:	Dave Airlie <airlied@redhat.com>
> R:	Thomas Zimmermann <tzimmermann@suse.de>
> L:	dri-devel@lists.freedesktop.org
> S:	Supported
> T:	git git://anongit.freedesktop.org/drm/drm-misc
> F:	drivers/gpu/drm/ast/
>=20
> Thanks and Have a good day,
> 	Kuo-Hsiang Chou
>=20
> -----Original Message-----
> From: Thomas Zimmermann [mailto:tzimmermann@suse.de]=20
> Sent: Thursday, November 05, 2020 8:09 PM
> To: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>; dri-devel@lists.fr=
eedesktop.org
> Cc: eich@suse.com; Tommy Huang <tommy_huang@aspeedtech.com>; Jenmin Yua=
n <jenmin_yuan@aspeedtech.com>; airlied@redhat.com; Arc Sung <arc_sung@as=
peedtech.com>
> Subject: Re: [PATCH] drm/ast: Fixed 1920x1080 sync. polarity issue
>=20
> Hi,
>=20
> please follow the advise we're giving you. Had you run scripts/checkpat=
ch.pl on the patch file it would have told you
>=20
> <<<
> ERROR: patch seems to be corrupt (line wrapped?)
> #102: FILE: drivers/gpu/drm/ast/ast_tables.h:294:
>=20
>=20
> ERROR: DOS line endings
> #106: FILE: drivers/gpu/drm/ast/ast_tables.h:297:
> +^I (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo=
=20
> +|^M$
>=20
> ERROR: DOS line endings
> #110: FILE: drivers/gpu/drm/ast/ast_tables.h:300:
> +^I (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo=
=20
> +|^M$
>=20
> total: 3 errors, 0 warnings, 19 lines checked
>>>>
>=20
> As said before, the mail eich@suse.de is still not relevant any longer.=

> But you did not add Daniel into CC. Did you run scripts/get_maintainers=
=2Epl?
>=20
> Best regards
> Thomas
>=20
> Am 05.11.20 um 10:47 schrieb KuoHsiang Chou:
>> [Bug] Change the vertical synchroous polary of 1920x1080 @60Hz
>>       from  Negtive to Positive
>>
>> Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
>> ---
>>  drivers/gpu/drm/ast/ast_tables.h | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_tables.h=20
>> b/drivers/gpu/drm/ast/ast_tables.h
>> index 8414e543f260..51efc5b4a55c 100644
>> --- a/drivers/gpu/drm/ast/ast_tables.h
>> +++ b/drivers/gpu/drm/ast/ast_tables.h
>> @@ -295,10 +295,10 @@ static const struct ast_vbios_enhtable=20
>> res_1600x900[] =3D {
>>
>>  static const struct ast_vbios_enhtable res_1920x1080[] =3D {
>>  	{2200, 1920, 88, 44, 1125, 1080, 4, 5, VCLK148_5,	/* 60Hz */
>> -	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo=
 |
>> +	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo=
=20
>> +|
>>  	  AST2500PreCatchCRT), 60, 1, 0x38 },
>>  	{2200, 1920, 88, 44, 1125, 1080, 4, 5, VCLK148_5,	/* 60Hz */
>> -	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo=
 |
>> +	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo=
=20
>> +|
>>  	  AST2500PreCatchCRT), 0xFF, 1, 0x38 },  };
>>
>> --
>> 2.18.4
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>=20
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
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

--------------4ECF86A86F7858AE88A7A787
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

--------------4ECF86A86F7858AE88A7A787--

--5iKNz2u38znwEdi8ayNpjwoa2gigezLGa--

--9qiDHi8LtwhHVom6yaHiTQqndRZT1iFiD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl+k8zEFAwAAAAAACgkQaA3BHVMLeiNV
mQgAotSUvY2B5j2F6t3tMnHRTAeT2CDUKQz+BA7Rmj3WQKij+JBVZ7M4rT3GTbVjqUbenE+nErJH
GFxBTeJFllkHx3kAcM4IO48a7L3wUjvMjt3rrUin++coLG44fxfOQM6pBxmmsri9t2Rdh0pq1CVx
BpiD/VST4Iv8YVBzC4X6braq7QmQWLYflf16lXyzskfLBHNJNCVQoIE77Sx52SWscOE544r46Ydq
dPAjjegqif+NuRcxjyjKSpJfwJo3+ViTL8AvYBtQ1waH1o/uwbanZMke60OBrxKLyosJ//KAOd6m
dQHVZTnPRxh3IYH3QIsLGy+pzyZZX+M4NMTaVQ4HNA==
=j/Fw
-----END PGP SIGNATURE-----

--9qiDHi8LtwhHVom6yaHiTQqndRZT1iFiD--

--===============2136707116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2136707116==--
