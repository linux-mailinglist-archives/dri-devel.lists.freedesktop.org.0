Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B587006A1
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 13:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A0110E685;
	Fri, 12 May 2023 11:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 315 seconds by postgrey-1.36 at gabe;
 Fri, 12 May 2023 11:22:56 UTC
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8848C10E685
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 11:22:56 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-249-VSjj4jpZOom7AJRUgPGuWQ-1; Fri, 12 May 2023 12:16:32 +0100
X-MC-Unique: VSjj4jpZOom7AJRUgPGuWQ-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 12 May
 2023 12:16:30 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 12 May 2023 12:16:30 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Thomas Zimmermann' <tzimmermann@suse.de>, "deller@gmx.de"
 <deller@gmx.de>, "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "javierm@redhat.com" <javierm@redhat.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "vgupta@kernel.org" <vgupta@kernel.org>,
 "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "kernel@xen0n.name"
 <kernel@xen0n.name>, "davem@davemloft.net" <davem@davemloft.net>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@HansenPartnership.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "sam@ravnborg.org" <sam@ravnborg.org>, "suijingfeng@loongson.cn"
 <suijingfeng@loongson.cn>
Subject: RE: [PATCH v7 1/7] fbdev/hitfb: Cast I/O offset to address
Thread-Topic: [PATCH v7 1/7] fbdev/hitfb: Cast I/O offset to address
Thread-Index: AQHZhLwIoJOHAKlHvkaeoWR92INTOa9We4fw
Date: Fri, 12 May 2023 11:16:30 +0000
Message-ID: <c25758dd7b4a4563b0d33c751da8cf6d@AcuMS.aculab.com>
References: <20230512102444.5438-1-tzimmermann@suse.de>
 <20230512102444.5438-2-tzimmermann@suse.de>
In-Reply-To: <20230512102444.5438-2-tzimmermann@suse.de>
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 kernel test robot <lkp@intel.com>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Artur Rojek <contact@artur-rojek.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Zimmermann
> Sent: 12 May 2023 11:25
>=20
> Cast I/O offsets to pointers to use them with I/O functions. The I/O
> functions expect pointers of type 'volatile void __iomem *', but the
> offsets are plain integers. Build warnings are
>=20
>   ../drivers/video/fbdev/hitfb.c: In function 'hitfb_accel_wait':
>   ../arch/x86/include/asm/hd64461.h:18:33: warning: passing argument 1 of=
 'fb_readw' makes pointer
> from integer without a cast [-Wint-conversion]
>    18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~
...
>    52 | static inline u16 fb_readw(const volatile void __iomem *addr)
>       |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
>=20
> This patch only fixes the build warnings. It's not clear if the I/O
> offsets can legally be passed to the I/O helpers. It was apparently
> broken in 2007 when custom inw()/outw() helpers got removed by
> commit 34a780a0afeb ("sh: hp6xx pata_platform support."). Fixing the
> driver would require setting the I/O base address.

Did you try changing the definition of HD64461_IOBASE to include
a (volatile void __iomem *) cast?
A lot less churn...

I'm guessing that 'sh' deosn't have in/out instructions so this
is something that is always mapped at a fixed kernel virtual address?

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

