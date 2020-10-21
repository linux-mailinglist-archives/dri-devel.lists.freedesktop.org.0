Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1D829492D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 10:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE456E9BE;
	Wed, 21 Oct 2020 08:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F686E9BE
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 08:03:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CFEF7AEAC;
 Wed, 21 Oct 2020 08:03:27 +0000 (UTC)
To: Kevin Brace <kevinbrace@gmx.com>, Sam Ravnborg <sam@ravnborg.org>
References: <trinity-7bf82d9f-a022-48f3-bca0-d06eb28ebe35-1603048517864@3c-app-mailcom-bs08>
 <20201018210412.GA515543@ravnborg.org>
 <trinity-a0f09460-7d25-457a-aef8-e70fcf617a83-1603136588694@3c-app-mailcom-bs01>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: It appears drm-next TTM cleanup broke something . . .
Message-ID: <895376c5-9f47-6c37-c530-0fe296346431@suse.de>
Date: Wed, 21 Oct 2020 10:03:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <trinity-a0f09460-7d25-457a-aef8-e70fcf617a83-1603136588694@3c-app-mailcom-bs01>
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
Cc: Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1851082650=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1851082650==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8hNUbDX6CO238SDQfJ8DTPCU1bZdJ7x4d"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8hNUbDX6CO238SDQfJ8DTPCU1bZdJ7x4d
Content-Type: multipart/mixed; boundary="YVM7DrZiPSwT8XgbOHUNwo8B2jgys1QBN";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Kevin Brace <kevinbrace@gmx.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org
Message-ID: <895376c5-9f47-6c37-c530-0fe296346431@suse.de>
Subject: Re: It appears drm-next TTM cleanup broke something . . .
References: <trinity-7bf82d9f-a022-48f3-bca0-d06eb28ebe35-1603048517864@3c-app-mailcom-bs08>
 <20201018210412.GA515543@ravnborg.org>
 <trinity-a0f09460-7d25-457a-aef8-e70fcf617a83-1603136588694@3c-app-mailcom-bs01>
In-Reply-To: <trinity-a0f09460-7d25-457a-aef8-e70fcf617a83-1603136588694@3c-app-mailcom-bs01>

--YVM7DrZiPSwT8XgbOHUNwo8B2jgys1QBN
Content-Type: multipart/mixed;
 boundary="------------AD92DD108DBCCF7722A30A3D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------AD92DD108DBCCF7722A30A3D
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi

On 19.10.20 21:43, Kevin Brace wrote:
> Hi Sam,
>=20
> Thanks for asking the question.
> The current OpenChrome DRM code has these two major issues.
>=20
> 1) It does not support atomic modesetting
>=20
> I do internally have working code to support atomic modesetting, but it=
 is not ready for committing into the upstream OpenChrome DRM repository.=

> In particular, it suffers from a freeze relating to a cursor plane.
> The freeze is a bad kind that kern.log does not really tell me what is =
wrong.
> If I disable hardware cursor, the atomic modesetting based OpenChrome D=
RM appears to work okay.
> In other words, I am getting close to getting atomic modesetting workin=
g, but I am stuck.

This could be related to the memory problems. See below. Otherwise, I
suggest to reduce the driver to the minimum functionality that is
required for modesetting (even without HW cursors) and submit this code
for review and merging.

>=20
>=20
> 2) Double allocation of visible portion of frame buffer
>=20
> This is a big problem left behind from the previous developer who devel=
oped OpenChrome prior to me.
> For some reason, the developer wanted to allocate visible portion of th=
e frame buffer to be the maximum possible size supported by the detected =
monitor when initializing the frame buffer inside OpenChrome DRM code.
> I believe Radeon DRM does something similar to that.
> The problem is, OpenChrome DDX allocates an equal sized frame buffer vi=
sible portion during the DDX's initialization.
> This means that we got two same sized visible portions allocated, but O=
penChrome DDX and OpenChrome DRM combined should really be allocating onl=
y one.
> At this point, OpenChrome is not supporting double buffering.
> This double allocation of a visible portion of the frame buffer contrib=
utes to a X Server crash when the screen is resized and 16 MB or less (i.=
e., 8 MB) shared frame buffer is reserved by the system via BIOS setup.
> I personally think letting OpenChrome DRM allocate the visible portion =
of the frame buffer is the way to go, but if so, how do I get the DDX or =
shadow FB to access the frame buffer visible portion allocated by OpenChr=
ome DRM?
> Any suggestions on what to do about this issue will be greatly apprecia=
ted.
> Perhaps, I should post a question to dri-devel regarding this issue.
> I really do not know what I should do at this point.

The double allocation is expected. Atomic modesetting requires two
framebuffers in video memory during the pageflip. You have to sort out
the modes where 2 framebuffers do not fit into video memory at the same
time.

The mode_valid callback in struct drm_mode_config_funcs [1] is a good
place to do this. Check the mode's pixels with the maximum BPC against
the available memory. Example code is at [2]. You should also plane for
common additional layers, such as HW cursors, to require video memory.
So maybe test the mode against 80% of the video memory.

Best regards
Thomas

[1]
https://cgit.freedesktop.org/openchrome/drm-openchrome/tree/drivers/gpu/d=
rm/openchrome/openchrome_fb.c?h=3Ddrm-next-5.10&id=3D22e0ee2460b4b70cde56=
2b7a3818ae94c2786f46#n102

[2]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/gpu/drm/drm_gem_vram_helper.c?h=3Dv5.9#n1285

>=20
> Regards,
>=20
> Kevin Brace
> Brace Computer Laboratory blog
> https://bracecomputerlab.com
>=20
>=20
>> Sent: Sunday, October 18, 2020 at 2:04 PM
>> From: "Sam Ravnborg" <sam@ravnborg.org>
>> To: "Kevin Brace" <kevinbrace@gmx.com>
>> Cc: dri-devel@lists.freedesktop.org, "Dave Airlie" <airlied@redhat.com=
>
>> Subject: Re: It appears drm-next TTM cleanup broke something . . .
>>
>> Hi Kevin.
>>
>> On Sun, Oct 18, 2020 at 09:15:17PM +0200, Kevin Brace wrote:
>>> As usual, I pulled in DRM repository code for an out of tree OpenChro=
me DRM repository a few days ago.
>>
>> I know you have been working on and off on the openchrome driver for a=

>> long time now. Any chance we will see the driver submitted for upstrea=
m soon?
>>
>> 	Sam
>>
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

--------------AD92DD108DBCCF7722A30A3D
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
CjCWgPTJyk4t4kMTcNOw5ykD47vU/KW+wsBzBBABCAAdFiEEHl2YIZkIo5VO2MxYqlA7ya4PR=
6cF
Als58bEACgkQqlA7ya4PR6eNnwgAyL7GXAHdODwxXJUZbR69obsurO/mWQOj4GJTG5RAYeGyQ=
PnT
TwU786SexSb/25hzmvqYVslK4xKXxRrjihrlgH84FQBLudnzK1t/5pvjtus9QCiLvIYmf8fTg=
HuA
DO9WTtpWa1df+d2Xc1p0bjuOTRkHKLVPKHlX0/aJAH5qM5ljJiDKu0NCum1fFt6og+V3wzcY6=
9nG
sXP/Vl9W2T1KN59B9tzDWgE6cjs+99lLQ4erClAAdUX8wQXf0RG4xw+/qrsCRgHUUnMg0Z3F9=
bzW
9vsIoctIqQOvV2N25IUeYg7uawPXp7ojHuidSATCNT2YfrzrnwfzOnHdg/UVCyCWicJdBBARA=
gAd
FiEEJ+jjpp87z/+5LY5qLnehMBH108IFAls6HVcACgkQLnehMBH108InbwCg5DgAwx3yNEDV6=
gGX
IOotZDp3QGAAni1xwcKY57ppD0sqGmyIi/oXvK98wsBzBBABCAAdFiEEuyNtt7Ge78bIRx1op=
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
7B25IvfmEbs42oGm8GPzPkaNJu3gcska+l5PSTfurNETGsLAcwQQAQgAHRYhBB5dmCGZCKOVT=
tjM
WKpQO8muD0enBQJbOfGzAAoJEKpQO8muD0enL0wIAM2NTeUDCofBAkbWHGTZopclefbh0xGPY=
QEf
ttNyalp0hn1CrVO7OsX5eTjRqgyOa1C5OAsNghCM4PUmrfv5cZ9+sNn9bRM50uVW9IFRlq8ww=
BY4
+7QejJ5gs7DW/0tZIMZ6iTGKK0WEO7gd2K9hXadPBScTdIqXeWH82meiqElnEQL+K9UeGUBrk=
u+1
EQIOxwziKwTDlTvhyJ+xmEKj0uWRcOcl27xLS9XOWPGXcNQBtlZhF8e/E1kFRt5CPP5UBdUCN=
8qy
dUadseXivSNDiYob9dyJSFt7G0Bq4/acRet5ANtGRWsp8xYJQRossRMWL0w9P8SiIc2IY/JrQ=
rpz
29nCXQQQEQIAHRYhBCfo46afO8//uS2Oai53oTAR9dPCBQJbOh1XAAoJEC53oTAR9dPC05AAo=
Iy0
HQ2DBDYugQ42P4HfyxfZTIvKAJ0fqNBcBFW9StbRDEP9cfpNVOv8YMLAcwQQAQgAHRYhBLsjb=
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
=3Dn+f7
-----END PGP PUBLIC KEY BLOCK-----

--------------AD92DD108DBCCF7722A30A3D--

--YVM7DrZiPSwT8XgbOHUNwo8B2jgys1QBN--

--8hNUbDX6CO238SDQfJ8DTPCU1bZdJ7x4d
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl+P608FAwAAAAAACgkQaA3BHVMLeiNa
VAf+PDKR+Wwc+byamWfIY1lxK8p4IxEyahuXvoKQ29jFL7Y+yXSDV4nKLdA4f/RD8R5N0chpcGPG
x+nbVmk/V4aRahiQ+W58CcjYJ+lOoyUTUtxozLMottyMTm/osScPQeoWYV0kigIDYAO93BLzWiX5
n8OsthmzQu+dW+Jl0pEeW5MIQErygeqcDvtVtvKmdZLwrWGmFQqZYIx1bHaorz+5AFW5dk9xormy
+X8VGzeGEK/9z6ppSkqfrbcI0u3l/Xa6qTx9FkBJYj2ZesI0TaJ/e0oWcTR3nrIHWRL36aQsnFj7
2Rjfn1gPTjCDY3m3kLMYzdQDt7L8TeuNoo4LMh/0rA==
=Zocg
-----END PGP SIGNATURE-----

--8hNUbDX6CO238SDQfJ8DTPCU1bZdJ7x4d--

--===============1851082650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1851082650==--
