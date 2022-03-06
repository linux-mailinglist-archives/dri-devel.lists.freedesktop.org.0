Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 300224CEA0C
	for <lists+dri-devel@lfdr.de>; Sun,  6 Mar 2022 09:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383DA10FF75;
	Sun,  6 Mar 2022 08:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D4810FF72
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Mar 2022 08:30:21 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-108-tUwZomUWMYSiN451TxRaKw-1; Sun, 06 Mar 2022 08:30:17 +0000
X-MC-Unique: tUwZomUWMYSiN451TxRaKw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Sun, 6 Mar 2022 08:30:15 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Sun, 6 Mar 2022 08:30:14 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Jarkko Sakkinen' <jarkko@kernel.org>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>
Subject: RE: [PATCH RFC 0/3] MAP_POPULATE for device memory
Thread-Topic: [PATCH RFC 0/3] MAP_POPULATE for device memory
Thread-Index: AQHYMRun9YUfQRgF3USRgOtqAakL96yyAc1Q
Date: Sun, 6 Mar 2022 08:30:14 +0000
Message-ID: <7f46ef3c80734f478501d21cef0182c5@AcuMS.aculab.com>
References: <20220306053211.135762-1-jarkko@kernel.org>
In-Reply-To: <20220306053211.135762-1-jarkko@kernel.org>
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
 Chris Wilson <chris@chris-wilson.co.uk>, Jason Ekstrand <jason@jlekstrand.net>,
 Alexander Mikhalitsyn <alexander.mikhalitsyn@virtuozzo.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "linux-unionfs@vger.kernel.org" <linux-unionfs@vger.kernel.org>,
 "codalist@coda.cs.cmu.edu" <codalist@coda.cs.cmu.edu>,
 Matthew Auld <matthew.auld@intel.com>, Vasily Averin <vvs@virtuozzo.com>,
 =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Shakeel Butt <shakeelb@google.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 "linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nathaniel McCallum <nathaniel@profian.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, Alexey Gladkov <legion@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jarkko Sakkinen
> Sent: 06 March 2022 05:32
>=20
> For device memory (aka VM_IO | VM_PFNMAP) MAP_POPULATE does nothing. Allo=
w
> to use that for initializing the device memory by providing a new callbac=
k
> f_ops->populate() for the purpose.
>=20
> SGX patches are provided to show the callback in context.
>=20
> An obvious alternative is a ioctl but it is less elegant and requires
> two syscalls (mmap + ioctl) per memory range, instead of just one
> (mmap).

Is this all about trying to stop the vm_operations_struct.fault()
function being called?

It is pretty easy to ensure the mappings are setup in the driver's
mmap() function.
Then the fault() function can just return -VM_FAULT_SIGBUS;

If it is actually device memory you just need to call vm_iomap_memory()
That quite nicely mmap()s PCIe memory space into a user process.

Mapping driver memory is slightly more difficult.
For buffers allocated with dma_alloc_coherent() you can
probably use dma_mmap_coherent().
But I have a loop calling remap_pfn_range() because the
buffer area is made of multiple 16kB kernel buffers that
need to be mapped to contiguous user pages.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

