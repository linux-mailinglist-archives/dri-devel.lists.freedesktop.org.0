Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 256F6819B84
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 10:41:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA5410E168;
	Wed, 20 Dec 2023 09:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 397 seconds by postgrey-1.36 at gabe;
 Wed, 20 Dec 2023 09:41:04 UTC
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C540610E168
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 09:41:04 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-101-Y1C4lIceNx-saF_MBkMcPQ-1; Wed, 20 Dec 2023 09:34:24 +0000
X-MC-Unique: Y1C4lIceNx-saF_MBkMcPQ-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Wed, 20 Dec
 2023 09:34:09 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Wed, 20 Dec 2023 09:34:09 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnd Bergmann' <arnd@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, "David
 S . Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>
Subject: RE: [PATCH 00/27] sparc32: sunset sun4m and sun4d
Thread-Topic: [PATCH 00/27] sparc32: sunset sun4m and sun4d
Thread-Index: AQHaMx+ySWwYagj4Uk6uFCxcDCifEbCx5d1w
Date: Wed, 20 Dec 2023 09:34:09 +0000
Message-ID: <9c4479a3d194450593d541ae02ad288a@AcuMS.aculab.com>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
 <01ea8c41-88cd-4123-95c7-391640845fc3@app.fastmail.com>
In-Reply-To: <01ea8c41-88cd-4123-95c7-391640845fc3@app.fastmail.com>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jaroslav Kysela <perex@perex.cz>, Alan Stern <stern@rowland.harvard.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann
> Sent: 20 December 2023 08:37
>=20
> On Tue, Dec 19, 2023, at 22:03, Sam Ravnborg via B4 Relay wrote:
> > TODO before this can be applied:
> > - Ack from davem - as he is the principal sparc maintainer
> > - Tested-by: preferably on a target or QEMU (see above)
> >   I expect bugs as there are some involved changes!
> >
> > Ideas for the future
> > - Apply the most relevant downstream Gaisler patches
> >   - The ones introducing CAS should have preference as we then
> >     can drop the cmpxchg emulation
>=20
> One note about the CAS -- as far as I can tell, the absence
> of the futex() syscall on sparc32 kernels means that no glibc
> from the past decade can work correctly as it now requires futex
> for its internal locking, though it does work on sparc64 kernels
> in compat32 mode as well as the LEON3 kernel that adds futex
> support.

Does the glibc mutex 'fast path' also require a CAS instruction?

Presumably having CAS also removes the 'really horrid (tm)' code
required to make all the bitmap operations atomic?

Seems a shame to lose old sparc32 support when (I think) the sun3
in my cupboard would still work - if only it had a working psu.
(The 110/220V switch wasn't connected and the FET wasn't rated
for 450V. UK mains can be 240+10% if you are near a substation.)

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

