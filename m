Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B295FCD2A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 23:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1716A10E09A;
	Wed, 12 Oct 2022 21:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294FE10E09A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 21:29:07 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-269-WPghBqosPyeNkdeVSYELTw-1; Wed, 12 Oct 2022 22:29:04 +0100
X-MC-Unique: WPghBqosPyeNkdeVSYELTw-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Wed, 12 Oct
 2022 22:29:02 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.040; Wed, 12 Oct 2022 22:29:02 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Joe Perches' <joe@perches.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 3/5] treewide: use get_random_u32() when possible
Thread-Topic: [PATCH v1 3/5] treewide: use get_random_u32() when possible
Thread-Index: AQHY3m9QJDmwhr5XuUa4Hi/RfD23ja4LRXVg
Date: Wed, 12 Oct 2022 21:29:02 +0000
Message-ID: <d45bd258e033453b85a137112e7694e1@AcuMS.aculab.com>
References: <20221005214844.2699-1-Jason@zx2c4.com>
 <20221005214844.2699-4-Jason@zx2c4.com>
 <f8ad3ba44d28dec1a5f7626b82c5e9c2aeefa729.camel@perches.com>
In-Reply-To: <f8ad3ba44d28dec1a5f7626b82c5e9c2aeefa729.camel@perches.com>
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
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-sctp@vger.kernel.org" <linux-sctp@vger.kernel.org>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 "dev@openvswitch.org" <dev@openvswitch.org>,
 "rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "dccp@vger.kernel.org" <dccp@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
 "lvs-devel@vger.kernel.org" <lvs-devel@vger.kernel.org>,
 "SHA-cyfmac-dev-list@infineon.com" <SHA-cyfmac-dev-list@infineon.com>,
 "coreteam@netfilter.org" <coreteam@netfilter.org>,
 "netfilter-devel@vger.kernel.org" <netfilter-devel@vger.kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-actions@lists.infradead.org" <linux-actions@lists.infradead.org>,
 "brcm80211-dev-list.pdl@broadcom.com" <brcm80211-dev-list.pdl@broadcom.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "cake@lists.bufferbloat.net" <cake@lists.bufferbloat.net>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "tipc-discussion@lists.sourceforge.net"
 <tipc-discussion@lists.sourceforge.net>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joe Perches
> Sent: 12 October 2022 20:17
>=20
> On Wed, 2022-10-05 at 23:48 +0200, Jason A. Donenfeld wrote:
> > The prandom_u32() function has been a deprecated inline wrapper around
> > get_random_u32() for several releases now, and compiles down to the
> > exact same code. Replace the deprecated wrapper with a direct call to
> > the real function.
> []
> > diff --git a/drivers/infiniband/hw/cxgb4/cm.c b/drivers/infiniband/hw/c=
xgb4/cm.c
> []
> > @@ -734,7 +734,7 @@ static int send_connect(struct c4iw_ep *ep)
> >  =09=09=09=09   &ep->com.remote_addr;
> >  =09int ret;
> >  =09enum chip_type adapter_type =3D ep->com.dev->rdev.lldi.adapter_type=
;
> > -=09u32 isn =3D (prandom_u32() & ~7UL) - 1;
> > +=09u32 isn =3D (get_random_u32() & ~7UL) - 1;
>=20
> trivia:
>=20
> There are somewhat odd size mismatches here.
>=20
> I had to think a tiny bit if random() returned a value from 0 to 7
> and was promoted to a 64 bit value then truncated to 32 bit.
>=20
> Perhaps these would be clearer as ~7U and not ~7UL

That makes no difference - the compiler will generate the same code.

The real question is WTF is the code doing?
The '& ~7u' clears the bottom 3 bits.
The '- 1' then sets the bottom 3 bits and decrements the
(random) high bits.

So is the same as get_random_u32() | 7.
But I bet the coder had something else in mind.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

