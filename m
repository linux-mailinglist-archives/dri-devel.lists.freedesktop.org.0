Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B98314D0A9E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 23:11:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02ED10E16B;
	Mon,  7 Mar 2022 22:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091D410E16B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 22:11:29 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-213-iFbUxoq8N32Ti0xfCSXC3A-1; Mon, 07 Mar 2022 22:11:23 +0000
X-MC-Unique: iFbUxoq8N32Ti0xfCSXC3A-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Mon, 7 Mar 2022 22:11:19 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Mon, 7 Mar 2022 22:11:19 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christoph Hellwig' <hch@infradead.org>, Jarkko Sakkinen
 <jarkko@kernel.org>
Subject: RE: [PATCH RFC 0/3] MAP_POPULATE for device memory
Thread-Topic: [PATCH RFC 0/3] MAP_POPULATE for device memory
Thread-Index: AQHYMjv2CAL18nxa1UOLUz+3aRpSlay0etRA
Date: Mon, 7 Mar 2022 22:11:19 +0000
Message-ID: <5729d03d6a174da6b66d1534ebdb1127@AcuMS.aculab.com>
References: <20220306053211.135762-1-jarkko@kernel.org>
 <YiSb7tsUEBRGS+HA@casper.infradead.org> <YiW4yurDXSifTYUt@infradead.org>
 <YiYIv9guOgClLKT8@iki.fi> <YiYrRWMp1akXY8Vb@infradead.org>
In-Reply-To: <YiYrRWMp1akXY8Vb@infradead.org>
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
Cc: Michal Hocko <mhocko@suse.com>, zhangyiru <zhangyiru3@huawei.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Alexander
 Mikhalitsyn <alexander.mikhalitsyn@virtuozzo.com>, Florian
 Fainelli <f.fainelli@gmail.com>,
 "linux-unionfs@vger.kernel.org" <linux-unionfs@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 "codalist@coda.cs.cmu.edu" <codalist@coda.cs.cmu.edu>,
 Matthew Auld <matthew.auld@intel.com>, Vasily Averin <vvs@virtuozzo.com>,
 =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "G@iki.fi" <G@iki.fi>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Shakeel Butt <shakeelb@google.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 "linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nathaniel
 McCallum <nathaniel@profian.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Alexey Gladkov <legion@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Christoph Hellwig
> Sent: 07 March 2022 15:57
>=20
> On Mon, Mar 07, 2022 at 03:29:35PM +0200, Jarkko Sakkinen wrote:
> > So what would you suggest to sort out the issue? I'm happy to go with
> > ioctl if nothing else is acceptable.
>=20
> PLenty of drivers treat all mmaps as if MAP_POPULATE was specified,
> typically by using (io_)remap_pfn_range.  If there any reason to only
> optionally have the pre-fault semantics for sgx?  If not this should
> be really simple.  And if we have a real need for it to be optional
> we'll just need to find a sane way to pass that information to ->mmap.

Is there any space in vma->vm_flags ?

That would be better than an extra argument or function.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

