Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2632BBEB2
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 12:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3F26E9AD;
	Sat, 21 Nov 2020 11:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81446E8D9
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 15:39:22 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-48-2DVZji6aPsmuGTvzOENjVg-1; Fri, 20 Nov 2020 15:39:17 +0000
X-MC-Unique: 2DVZji6aPsmuGTvzOENjVg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Fri, 20 Nov 2020 15:39:16 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Fri, 20 Nov 2020 15:39:16 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Thomas Zimmermann' <tzimmermann@suse.de>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: RE: Linux 5.10-rc4; graphics alignment
Thread-Topic: Linux 5.10-rc4; graphics alignment
Thread-Index: Ada/IUdqcU2WLz13TDyBa91ssXd9zQABIUYAAAEibgAAAW3SAAAAkehgAAGiZoAAAIjkIAAB97YAAANWzKA=
Date: Fri, 20 Nov 2020 15:39:16 +0000
Message-ID: <fd7e7817781a43eb857fceb971502511@AcuMS.aculab.com>
References: <2c474745ae884de3b4ecb8abe2152bfd@AcuMS.aculab.com>
 <fa5c887e-82d8-5347-ff18-85e3628dadbe@suse.de>
 <c01d2d95f1e64be984cff71e7bdf1c84@AcuMS.aculab.com>
 <c9bae016-413f-0db9-c9ee-d6f39d24a6ab@suse.de>
 <fa6346190d0b4936934d1f1359e5b71f@AcuMS.aculab.com>
 <fd66bfcc-072a-ddfb-0d12-af4a5207820d@suse.de>
 <ec3130c3d22a4d4dafe020d30fd224cd@AcuMS.aculab.com>
 <7d42ee6b-d72b-9f4d-21fe-4f5981eb425e@suse.de>
In-Reply-To: <7d42ee6b-d72b-9f4d-21fe-4f5981eb425e@suse.de>
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
X-Mailman-Approved-At: Sat, 21 Nov 2020 11:34:30 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Huang, Ray" <ray.huang@amd.com>,
 Dave Airlie <airlied@redhat.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Zimmermann
> Sent: 20 November 2020 13:42
...
> I did a diff from v5.10-rc4 to drm-tip to look for suspicious changes.
> Some candidates are
> 
>    8e3784dfef8a ("drm/ast: Reload gamma LUT after changing primary
> plane's color format")

Ok, that one fixes the screen colours (etc).
So 8e3784dfef8a was good and then HEAD^ was bad.

I might try to bisect the breakage.

The stack splat is entirely different.
I'll try to bisect that on Linus's tree.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
