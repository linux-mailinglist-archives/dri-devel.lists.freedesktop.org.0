Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D73048504B1
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 15:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB96110F9E3;
	Sat, 10 Feb 2024 14:23:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74CB310F9E3
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 14:23:00 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-285-P2GNB8rOM5-27t9QbLe7Bw-1; Sat, 10 Feb 2024 14:22:57 +0000
X-MC-Unique: P2GNB8rOM5-27t9QbLe7Bw-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sat, 10 Feb
 2024 14:22:36 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sat, 10 Feb 2024 14:22:36 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Lucas De Marchi' <lucas.demarchi@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>
CC: Yury Norov <yury.norov@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, Jani Nikula <jani.nikula@intel.com>
Subject: RE: Re: [PATCH v3 2/3] bits: Introduce fixed-type BIT
Thread-Topic: Re: [PATCH v3 2/3] bits: Introduce fixed-type BIT
Thread-Index: AQHaWtQsWHNiAo+Zx0GwnNabxeNy8rEDowcg
Date: Sat, 10 Feb 2024 14:22:36 +0000
Message-ID: <d42dc197a15649e69d459362849a37f2@AcuMS.aculab.com>
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
 <20240208074521.577076-3-lucas.demarchi@intel.com>
 <ZcUz3V56qNeTVq66@ashyti-mobl2.lan>
 <ilppncjskpt52bijaoxlwcklawjpw5cqrndtx2g5xnwpj6bhbm@kn5yjscaha5e>
In-Reply-To: <ilppncjskpt52bijaoxlwcklawjpw5cqrndtx2g5xnwpj6bhbm@kn5yjscaha5e>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

...
> >> +#define BIT_U8(b)=09=09((u8)(BIT_INPUT_CHECK(u8, b) + BIT(b)))
> >> +#define BIT_U16(b)=09=09((u16)(BIT_INPUT_CHECK(u16, b) + BIT(b)))
> >> +#define BIT_U32(b)=09=09((u32)(BIT_INPUT_CHECK(u32, b) + BIT(b)))
> >> +#define BIT_U64(b)=09=09((u64)(BIT_INPUT_CHECK(u64, b) + BIT(b)))
> >
> >considering that BIT defines are always referred to unsigned
> >types, I would just call them

Except that pretty much as soon as you breath on them
the u8 and u16 types get converted to int.
If you want them to be an unsigned type then you need
to cast them to (unsigned int).

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

