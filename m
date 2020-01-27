Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 400EF149F43
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 08:36:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95A36E49A;
	Mon, 27 Jan 2020 07:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5766E49A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 07:36:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DD987AC46;
 Mon, 27 Jan 2020 07:36:12 +0000 (UTC)
Subject: Re: [PATCH] matroxfb: add Matrox MGA-G200eW board support
To: Rich Felker <dalias@libc.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <20200125195506.GA16638@brightrain.aerifal.cx>
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
Message-ID: <1466259e-efe7-df52-c05b-80042628d577@suse.de>
Date: Mon, 27 Jan 2020 08:36:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200125195506.GA16638@brightrain.aerifal.cx>
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
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2018530282=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2018530282==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JXtJqsfGpCLX37g1U82XR0axYY5SX2ng4"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JXtJqsfGpCLX37g1U82XR0axYY5SX2ng4
Content-Type: multipart/mixed; boundary="kXJKU2muNsUH08rB4dLf3tn0abYMGCebb";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rich Felker <dalias@libc.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>
Message-ID: <1466259e-efe7-df52-c05b-80042628d577@suse.de>
Subject: Re: [PATCH] matroxfb: add Matrox MGA-G200eW board support
References: <20200125195506.GA16638@brightrain.aerifal.cx>
In-Reply-To: <20200125195506.GA16638@brightrain.aerifal.cx>

--kXJKU2muNsUH08rB4dLf3tn0abYMGCebb
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 25.01.20 um 20:55 schrieb Rich Felker:
> Signed-off-by: Rich Felker <dalias@libc.org>
> --
> I've had this lying around a while and figure I should send it
> upsteam; it's needed to support the onboard video on my Spectre-free
> Atom S1260 server board.

This HW is supported by mgag200, which is maintained. Can't you use that?=


Best regards
Thomas

>=20
> ---
>  drivers/video/fbdev/matrox/matroxfb_base.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/drivers/video/fbdev/matrox/matroxfb_base.c b/drivers/video=
/fbdev/matrox/matroxfb_base.c
> index 1a555f70923a..ff344313860c 100644
> --- a/drivers/video/fbdev/matrox/matroxfb_base.c
> +++ b/drivers/video/fbdev/matrox/matroxfb_base.c
> @@ -1376,6 +1376,12 @@ static struct video_board vbG200 =3D {
>  	.accelID =3D FB_ACCEL_MATROX_MGAG200,
>  	.lowlevel =3D &matrox_G100
>  };
> +static struct video_board vbG200eW =3D {
> +	.maxvram =3D 0x800000,
> +	.maxdisplayable =3D 0x800000,
> +	.accelID =3D FB_ACCEL_MATROX_MGAG200,
> +	.lowlevel =3D &matrox_G100
> +};
>  /* from doc it looks like that accelerator can draw only to low 16MB :=
-( Direct accesses & displaying are OK for
>     whole 32MB */
>  static struct video_board vbG400 =3D {
> @@ -1494,6 +1500,13 @@ static struct board {
>  		MGA_G200,
>  		&vbG200,
>  		"MGA-G200 (PCI)"},
> +	{PCI_VENDOR_ID_MATROX,	0x0532,	0xFF,
> +		0,			0,
> +		DEVF_G200,
> +		250000,
> +		MGA_G200,
> +		&vbG200eW,
> +		"MGA-G200eW (PCI)"},
>  	{PCI_VENDOR_ID_MATROX,	PCI_DEVICE_ID_MATROX_G200_AGP,	0xFF,
>  		PCI_SS_VENDOR_ID_MATROX,	PCI_SS_ID_MATROX_GENERIC,
>  		DEVF_G200,
> @@ -2136,6 +2149,8 @@ static const struct pci_device_id matroxfb_device=
s[] =3D {
>  		PCI_ANY_ID,	PCI_ANY_ID,	0, 0, 0},
>  	{PCI_VENDOR_ID_MATROX,	PCI_DEVICE_ID_MATROX_G200_PCI,
>  		PCI_ANY_ID,	PCI_ANY_ID,	0, 0, 0},
> +	{PCI_VENDOR_ID_MATROX,	0x0532,
> +		PCI_ANY_ID,	PCI_ANY_ID,	0, 0, 0},
>  	{PCI_VENDOR_ID_MATROX,	PCI_DEVICE_ID_MATROX_G200_AGP,
>  		PCI_ANY_ID,	PCI_ANY_ID,	0, 0, 0},
>  	{PCI_VENDOR_ID_MATROX,	PCI_DEVICE_ID_MATROX_G400,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--kXJKU2muNsUH08rB4dLf3tn0abYMGCebb--

--JXtJqsfGpCLX37g1U82XR0axYY5SX2ng4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4ukusACgkQaA3BHVML
eiND4AgAtd2QdgBKcSGDT6qgNFNiQlF3Zuo2G4F6F8TFMSOfEPGr9AFjyBwtwcHV
7FM9xf28m1W2QYYZNnjF6Rulqj+ixi55KWKSmIrRmaphsbN/Pyd3Qo+2OcX0yiHq
tgVshfKjM/BP9uJepxE57BIFdaLNxX+A8ImO4ggvJxG/W7GTmyl4l+VOpcXVSAwM
KsVbgLOcMFpMlFBtnDOAQLVjdMoWeBUgaazV7YLa9ilQhD3QYcj+GRCzBRhih0In
XrKWoV+brXQqTQb8kO2wH2V+y+4NhX0hc3/vGte3avpA4YtVMq890xb2KkHJJfa6
G2YJMDlPER9x7SHUFUTCgfC0pULVEw==
=GbzM
-----END PGP SIGNATURE-----

--JXtJqsfGpCLX37g1U82XR0axYY5SX2ng4--

--===============2018530282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2018530282==--
