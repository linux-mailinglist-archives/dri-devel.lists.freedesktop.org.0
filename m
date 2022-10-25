Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A626660C92E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 12:00:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838B610E034;
	Tue, 25 Oct 2022 10:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A210110E034
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 09:59:56 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-221-ubkgpKyWN-GZuVIw3Ovb-w-1; Tue, 25 Oct 2022 10:59:44 +0100
X-MC-Unique: ubkgpKyWN-GZuVIw3Ovb-w-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 25 Oct
 2022 10:59:16 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.042; Tue, 25 Oct 2022 10:59:16 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: "'Jason A. Donenfeld'" <Jason@zx2c4.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] video: fbdev: sis: use explicitly signed char
Thread-Topic: [PATCH] video: fbdev: sis: use explicitly signed char
Thread-Index: AQHY59GfTKHiiX1cE0qqKUXinyrVOK4e4PPg
Date: Tue, 25 Oct 2022 09:59:16 +0000
Message-ID: <37a4d200e0b74c72854c018c02e18b50@AcuMS.aculab.com>
References: <20221024162901.535972-1-Jason@zx2c4.com>
In-Reply-To: <20221024162901.535972-1-Jason@zx2c4.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jason A. Donenfeld
> Sent: 24 October 2022 17:29
> To: linux-kernel@vger.kernel.org
>=20
> With char becoming unsigned by default, and with `char` alone being
> ambiguous and based on architecture, signed chars need to be marked
> explicitly as such. This fixes warnings like:
>=20
...
> ---
>  drivers/usb/misc/sisusbvga/sisusb_struct.h | 2 +-
>  drivers/video/fbdev/sis/vstruct.h          | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/misc/sisusbvga/sisusb_struct.h b/drivers/usb/mis=
c/sisusbvga/sisusb_struct.h
> index 3df64d2a9d43..a86032a26d36 100644
> --- a/drivers/usb/misc/sisusbvga/sisusb_struct.h
> +++ b/drivers/usb/misc/sisusbvga/sisusb_struct.h
> @@ -91,7 +91,7 @@ struct SiS_Ext {
>  =09unsigned char VB_ExtTVYFilterIndex;
>  =09unsigned char VB_ExtTVYFilterIndexROM661;
>  =09unsigned char REFindex;
> -=09char ROMMODEIDX661;
> +=09signed char ROMMODEIDX661;

Isn't the correct fix to use u8 and s8 ?

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

