Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 422A02C80B8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 10:16:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5286E40A;
	Mon, 30 Nov 2020 09:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01CFA6E409
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 09:16:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79F72AC95;
 Mon, 30 Nov 2020 09:16:38 +0000 (UTC)
Subject: Re: [PATCH v2 09/28] video: fbdev: sis: Fix set but not used warnings
 in init.c
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-10-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <99574e79-6f26-a359-1eea-d31a6bb8cbf6@suse.de>
Date: Mon, 30 Nov 2020 10:16:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201128224114.1033617-10-sam@ravnborg.org>
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
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>, Peter Rosin <peda@axentia.se>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: multipart/mixed; boundary="===============1189486090=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1189486090==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="g36LffHq7VI7aDVmpOY53Japt6Fs47lLs"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--g36LffHq7VI7aDVmpOY53Japt6Fs47lLs
Content-Type: multipart/mixed; boundary="BfHkpoIz6QPxF1uWfEqCXnjYndvYOx0BG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Cc: Aditya Pakki <pakki001@umn.edu>,
 Alexander Klimov <grandmaster@al2klimov.de>,
 Alex Dewar <alex.dewar90@gmail.com>, Antonino Daplas <adaplas@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Evgeny Novikov <novikov@ispras.ru>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 George Kennedy <george.kennedy@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gustavo Silva <gustavoars@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 Jason Yan <yanaijie@huawei.com>, Jingoo Han <jingoohan1@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Joe Perches <joe@perches.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mike Rapoport <rppt@kernel.org>, Nathan Chancellor
 <natechancellor@gmail.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Peter Rosin <peda@axentia.se>, Qilong Zhang <zhangqilong3@huawei.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>, Xiaofei Tan <tanxiaofei@huawei.com>
Message-ID: <99574e79-6f26-a359-1eea-d31a6bb8cbf6@suse.de>
Subject: Re: [PATCH v2 09/28] video: fbdev: sis: Fix set but not used warnings
 in init.c
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-10-sam@ravnborg.org>
In-Reply-To: <20201128224114.1033617-10-sam@ravnborg.org>

--BfHkpoIz6QPxF1uWfEqCXnjYndvYOx0BG
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 28.11.20 um 23:40 schrieb Sam Ravnborg:
> Fix set bit not used warnings by removing the code the assign the

s/bit/but

Actually, I think the correct way of writing this would be with dashes:

Fix set-but-not-used warnings

In the current sentence, you're setting a 'but not used variable.'

> variables and the definition of the variables.
> A register read is kept as it may have unknown side-effects.
>=20
> This removes a lot of unused code - which is always a good thing to do.=

>=20
> v2:
>    - Updated subject (Lee)
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Winischhofer <thomas@winischhofer.net>
> Cc: Lee Jones <lee.jones@linaro.org>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/video/fbdev/sis/init.c | 34 ++++++---------------------------=
-
>   1 file changed, 6 insertions(+), 28 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/sis/init.c b/drivers/video/fbdev/sis/i=
nit.c
> index fde27feae5d0..b77ea1a8825a 100644
> --- a/drivers/video/fbdev/sis/init.c
> +++ b/drivers/video/fbdev/sis/init.c
> @@ -2648,7 +2648,7 @@ static void
>   SiS_SetCRT1ModeRegs(struct SiS_Private *SiS_Pr, unsigned short ModeNo=
,
>   		unsigned short ModeIdIndex, unsigned short RRTI)
>   {
> -   unsigned short data, infoflag =3D 0, modeflag, resindex;
> +   unsigned short data, infoflag =3D 0, modeflag;
>   #ifdef CONFIG_FB_SIS_315
>      unsigned char  *ROMAddr  =3D SiS_Pr->VirtualRomBase;
>      unsigned short data2, data3;
> @@ -2659,7 +2659,7 @@ SiS_SetCRT1ModeRegs(struct SiS_Private *SiS_Pr, u=
nsigned short ModeNo,
>      if(SiS_Pr->UseCustomMode) {
>         infoflag =3D SiS_Pr->CInfoFlag;
>      } else {
> -      resindex =3D SiS_GetResInfo(SiS_Pr, ModeNo, ModeIdIndex);
> +      SiS_GetResInfo(SiS_Pr, ModeNo, ModeIdIndex);
>         if(ModeNo > 0x13) {
>   	 infoflag =3D SiS_Pr->SiS_RefIndex[RRTI].Ext_InfoFlag;
>         }
> @@ -3538,17 +3538,13 @@ SiS_Generic_ConvertCRData(struct SiS_Private *S=
iS_Pr, unsigned char *crdata,
>   			struct fb_var_screeninfo *var, bool writeres
>   )
>   {
> -   unsigned short HRE, HBE, HRS, HBS, HDE, HT;
> -   unsigned short VRE, VBE, VRS, VBS, VDE, VT;
> -   unsigned char  sr_data, cr_data, cr_data2;
> -   int            A, B, C, D, E, F, temp;
> +   unsigned short HRE, HBE, HRS, HDE;
> +   unsigned short VRE, VBE, VRS, VDE;
> +   unsigned char  sr_data, cr_data;
> +   int            B, C, D, E, F, temp;
>  =20
>      sr_data =3D crdata[14];
>  =20
> -   /* Horizontal total */
> -   HT =3D  crdata[0] | ((unsigned short)(sr_data & 0x03) << 8);
> -   A =3D HT + 5;
> -
>      /* Horizontal display enable end */
>      HDE =3D crdata[1] | ((unsigned short)(sr_data & 0x0C) << 6);
>      E =3D HDE + 1;
> @@ -3557,9 +3553,6 @@ SiS_Generic_ConvertCRData(struct SiS_Private *SiS=
_Pr, unsigned char *crdata,
>      HRS =3D crdata[4] | ((unsigned short)(sr_data & 0xC0) << 2);
>      F =3D HRS - E - 3;
>  =20
> -   /* Horizontal blank start */
> -   HBS =3D crdata[2] | ((unsigned short)(sr_data & 0x30) << 4);
> -
>      sr_data =3D crdata[15];
>      cr_data =3D crdata[5];
>  =20
> @@ -3588,13 +3581,6 @@ SiS_Generic_ConvertCRData(struct SiS_Private *Si=
S_Pr, unsigned char *crdata,
>      sr_data =3D crdata[13];
>      cr_data =3D crdata[7];
>  =20
> -   /* Vertical total */
> -   VT  =3D crdata[6] |
> -	 ((unsigned short)(cr_data & 0x01) << 8) |
> -	 ((unsigned short)(cr_data & 0x20) << 4) |
> -	 ((unsigned short)(sr_data & 0x01) << 10);
> -   A =3D VT + 2;
> -
>      /* Vertical display enable end */
>      VDE =3D crdata[10] |
>   	 ((unsigned short)(cr_data & 0x02) << 7) |
> @@ -3609,14 +3595,6 @@ SiS_Generic_ConvertCRData(struct SiS_Private *Si=
S_Pr, unsigned char *crdata,
>   	 ((unsigned short)(sr_data & 0x08) << 7);
>      F =3D VRS + 1 - E;
>  =20
> -   cr_data2 =3D (crdata[16] & 0x01) << 5;
> -
> -   /* Vertical blank start */
> -   VBS =3D crdata[11] |
> -	 ((unsigned short)(cr_data  & 0x08) << 5) |
> -	 ((unsigned short)(cr_data2 & 0x20) << 4) |
> -	 ((unsigned short)(sr_data  & 0x04) << 8);
> -
>      /* Vertical blank end */
>      VBE =3D crdata[12] | ((unsigned short)(sr_data & 0x10) << 4);
>      temp =3D VBE - ((E - 1) & 511);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--BfHkpoIz6QPxF1uWfEqCXnjYndvYOx0BG--

--g36LffHq7VI7aDVmpOY53Japt6Fs47lLs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/EuHMFAwAAAAAACgkQlh/E3EQov+B9
yhAAs0OgexJLf9bMYCcMzY5giJnxPxxF/x4LMucZLPj4VyNo9Cn184yQNPob4DdsbgzjSFdxWcrh
phpFNnggI9gS1dEr7npJSQeS1//axzKekKAvS67g0Iocxux0u60ywEbY2+wwVyTfHAku1JtqHW0X
f9XgyaULc4bAi74NVWgHiAoy9BHSaYlZvuNTuiUCVpaKnUl16Fczk42T9mqQSq98Qg8E38C6uxTt
kMPIJhFxitv6cydDTeCX80JGYUu9IFays6tbB56xfznaNtgh8XmW1QAgv3Ka6QSaEFthFvKN4Van
zhhDFfQ1kd/3zTHXhGdxQhjp5uIu1vdkGte244dF3qmFv3CV00cMVcihggEmvUczIELMNto59wh1
bU9KXaGkChLSX3ZVsa0iIlskauAR3tCmb2KVsvk1Te4jVsNUN3nl96+h0XF4SM+08Mx7siOdO+Y1
r3dh34Yz5xWSeXkYpXbUMyUPO+e5w/SUsrJ69d3M0UP938nvlWxtFxoVN9QWNlRKaByjF13fRP+G
3xHcNzJYozFwl1RIBNR0UjoInuLPdxDplv0ujTQcntmXN64r+n5G6zest3lhH33AJ7JBPkHGKQte
BsCqd+CVrFkk883lxZRooT1mRN5txdKLTARwvPgyX+4E0SopLcRtKCERhfSt5IBoAR38g3aN3g8V
N1E=
=ll8N
-----END PGP SIGNATURE-----

--g36LffHq7VI7aDVmpOY53Japt6Fs47lLs--

--===============1189486090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1189486090==--
