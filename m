Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B4731BC36
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 16:23:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206D56E8CC;
	Mon, 15 Feb 2021 15:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9023489F5B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 14:43:03 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mtapsc-1-3w3CI_4oMWS3JDUYMjvGuQ-1; Mon, 15 Feb 2021 14:41:54 +0000
X-MC-Unique: 3w3CI_4oMWS3JDUYMjvGuQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 15 Feb 2021 14:41:52 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Mon, 15 Feb 2021 14:41:52 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: =?utf-8?B?J0NocmlzdGlhbiBLw7ZuaWcn?= <christian.koenig@amd.com>, "Lucas
 Stach" <l.stach@pengutronix.de>, Simon Ser <contact@emersion.fr>
Subject: RE: DMA-buf and uncached system memory
Thread-Topic: DMA-buf and uncached system memory
Thread-Index: AQHXA5L/eppUoUE81k6k7v7UJlaBDapZRehQ
Date: Mon, 15 Feb 2021 14:41:52 +0000
Message-ID: <fa3f6eefc0a940b38448b0efd4b3f4e3@AcuMS.aculab.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <GUuZYSQk2hxgykDhSxfB2GWo47lQlVrKBtWMwQUG7Ar2GAag5WQDxBI0zq6nDTooPBzTktyRpnu25Ju1UKE3FYD9yHbkNMAHcmSI96hoJhA=@emersion.fr>
 <da9edfa0-8a18-44a2-fa79-83b4177afd8e@amd.com>
 <8d23f1ca6fe76d8971365bf54ca71ba71698980d.camel@pengutronix.de>
 <7ecf008d-a1f5-ddff-c8ac-8e7bfaf9c680@amd.com>
In-Reply-To: <7ecf008d-a1f5-ddff-c8ac-8e7bfaf9c680@amd.com>
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
X-Mailman-Approved-At: Mon, 15 Feb 2021 15:23:51 +0000
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
Cc: "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 linux-media <linux-media@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Sharma,
 Shashank" <Shashank.Sharma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZw0KPiBTZW50OiAxNSBGZWJydWFyeSAyMDIxIDEyOjA1DQou
Li4NCj4gU25vb3BpbmcgdGhlIENQVSBjYWNoZXMgaW50cm9kdWNlcyBzb21lIGV4dHJhIGxhdGVu
Y3ksIHNvIHdoYXQgY2FuDQo+IGhhcHBlbiBpcyB0aGF0IHRoZSByZXNwb25zZSB0byB0aGUgUENJ
ZSByZWFkIGNvbWVzIHRvIGxhdGUgZm9yIHRoZQ0KPiBzY2Fub3V0LiBUaGUgcmVzdWx0IGlzIGFu
IHVuZGVyZmxvdyBhbmQgZmxpY2tlcmluZyB3aGVuZXZlciBzb21ldGhpbmcgaXMNCj4gaW4gdGhl
IGNhY2hlIHdoaWNoIG5lZWRzIHRvIGJlIGZsdXNoZWQgZmlyc3QuDQoNCkFyZW4ndCB5b3UgZ29p
bmcgdG8gZ2V0IHRoZSBzYW1lIHByb2JsZW0gaWYgYW55IG90aGVyIGVuZHBvaW50cyBhcmUNCmRv
aW5nIG1lbW9yeSByZWFkcz8NClBvc3NpYmx5IGV2ZW4gb25lcyB0aGF0IGRvbid0IHJlcXVpcmUg
YSBjYWNoZSBzbm9vcCBhbmQgZmx1c2guDQoNCldoYXQgYWJvdXQganVzdCB0aGUgY3B1IGRvaW5n
IGEgcmVhbCBtZW1vcnkgdHJhbnNmZXI/DQoNCk9yIGEgY29tYmluYXRpb24gb2YgdGhlIHR3byBh
Ym92ZSBoYXBwZW5pbmcganVzdCBiZWZvcmUgeW91ciByZXF1ZXN0Lg0KDQpJZiB5b3UgZG9uJ3Qg
aGF2ZSBhIGJpZyBlbm91Z2ggZmlmbyB5b3UnbGwgbG9zZS4NCg0KSSBkaWQgJ2ZpeCcgYSBzaW1p
bGFyKGlzaCkgaXNzdWUgd2l0aCB2aWRlbyBETUEgbGF0ZW5jeSBvbiBhbiBlbWJlZGRlZA0Kc3lz
dGVtIGJhc2VkIHRoZSBvbiBTQTExMDAvU0ExMTAxIGJ5IHNpZ25pZmljYW50bHkgcmVkdWNpbmcg
dGhlIGNsb2NrDQp0byB0aGUgVkdBIHBhbmVsIHdoZW5ldmVyIHRoZSBjcHUgd2FzIGRvaW5nICdz
bG93IGlvJy4NCihJbnRlcmxlYXZpbmcgYW4gdW5jYWNoZWQgY3B1IERSQU0gd3JpdGUgYmV0d2Vl
biB0aGUgc2xvdyBpbyBjeWNsZXMNCmFsc28gZml4ZWQgaXQuKQ0KQnV0IHRoZSB2aWRlbyB3YXMg
dGhlIG9ubHkgRE1BIGRldmljZSBhbmQgdGhhdCB3YXMgYW4gZW1iZWRkZWQgc3lzdGVtLg0KR2l2
ZW4gdGhlIGFwcGxpY2F0aW9uIG5vdGUgYWJvdXQgdmlkZW8gbGF0ZW5jeSBkaWRuJ3QgbWVudGlv
biB3aGF0IHdhcw0KYWN0dWFsbHkgaGFwcGVuaW5nLCBJJ20gbm90IHN1cmUgaG93IG1hbnkgcGVv
cGxlIGFjdHVhbGx5IGdvdCBpdCB3b3JraW5nIQ0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBB
ZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMs
IE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
