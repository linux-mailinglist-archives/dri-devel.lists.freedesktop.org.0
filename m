Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C77AB347650
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 11:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A676E9B5;
	Wed, 24 Mar 2021 10:40:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140E26E200
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 10:40:01 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-129-cK_RaveBM8aprN2x6jOm4g-1; Wed, 24 Mar 2021 10:39:58 +0000
X-MC-Unique: cK_RaveBM8aprN2x6jOm4g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 24 Mar 2021 10:39:57 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.012; Wed, 24 Mar 2021 10:39:57 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: David Laight <David.Laight@ACULAB.COM>, 'Martin Sebor' <msebor@gmail.com>, 
 Ingo Molnar <mingo@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Subject: RE: [PATCH 02/11] x86: tboot: avoid Wstringop-overread-warning
Thread-Topic: [PATCH 02/11] x86: tboot: avoid Wstringop-overread-warning
Thread-Index: AQHXH2fn7jNrPkUb50e9k3rL2a+D9qqS2/oQgAAX0+A=
Date: Wed, 24 Mar 2021 10:39:57 +0000
Message-ID: <7e05de6cbb554b09ac532c073fab7386@AcuMS.aculab.com>
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-3-arnd@kernel.org>
 <20210322202958.GA1955909@gmail.com>
 <b944a853-0e4b-b767-0175-cc2c1edba759@gmail.com>
 <0aa198a1dd904231bcc29454bf19a812@AcuMS.aculab.com>
In-Reply-To: <0aa198a1dd904231bcc29454bf19a812@AcuMS.aculab.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, James Smart <james.smart@broadcom.com>,
 "tboot-devel@lists.sourceforge.net" <tboot-devel@lists.sourceforge.net>,
 Ingo Molnar <mingo@redhat.com>, Kalle Valo <kvalo@codeaurora.org>,
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
 Serge Hallyn <serge@hallyn.com>, Arnd Bergmann <arnd@arndb.de>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Ning Sun <ning.sun@intel.com>,
 Anders Larsen <al@alarsen.net>, Borislav Petkov <bp@alien8.de>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Martin
 Sebor <msebor@gcc.gnu.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>, Tejun Heo <tj@kernel.org>,
 Simon Kelley <simon@thekelleys.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Laight
> Sent: 24 March 2021 09:12
> 
> From: Martin Sebor
> > Sent: 22 March 2021 22:08
> ...
> > In GCC 11, all access warnings expect objects to be either declared
> > or allocated.  Pointers with constant values are taken to point to
> > nothing valid (as Arnd mentioned above, this is to detect invalid
> > accesses to members of structs at address zero).
> >
> > One possible solution to the known address problem is to extend GCC
> > attributes address and io that pin an object to a hardwired address
> > to all targets (at the moment they're supported on just one or two
> > targets).  I'm not sure this can still happen before GCC 11 releases
> > sometime in April or May.
> 
> A different solution is to define a normal C external data item
> and then assign a fixed address with an asm statement or in
> the linker script.

Or stop gcc tracking the value by using:
	struct foo *foo = (void *)xxxxx;
	asm ("", "+r" (foo));

If the address is used more than once forcing it into
a register is also likely to generate better code.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
