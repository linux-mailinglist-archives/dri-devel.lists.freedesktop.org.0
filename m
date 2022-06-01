Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7411D53AA55
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 17:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391D410EDC7;
	Wed,  1 Jun 2022 15:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D2910EDC7
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 15:40:36 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-142-DSHN-KKLM6GbHo2KcEfAdg-1; Wed, 01 Jun 2022 16:40:34 +0100
X-MC-Unique: DSHN-KKLM6GbHo2KcEfAdg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.36; Wed, 1 Jun 2022 16:40:31 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.036; Wed, 1 Jun 2022 16:40:31 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Kalesh Singh' <kaleshsingh@google.com>, Stephen Brennan
 <stephen.s.brennan@oracle.com>
Subject: RE: [PATCH 2/2] procfs: Add 'path' to /proc/<pid>/fdinfo/
Thread-Topic: [PATCH 2/2] procfs: Add 'path' to /proc/<pid>/fdinfo/
Thread-Index: AQHYdT4SWIJvIUraZkitA/0m2+WPZq06r6HA
Date: Wed, 1 Jun 2022 15:40:31 +0000
Message-ID: <959b0495a90e45b9816bb9f25d76a8f9@AcuMS.aculab.com>
References: <20220531212521.1231133-1-kaleshsingh@google.com>
 <20220531212521.1231133-3-kaleshsingh@google.com>
 <14f85d24-a9de-9706-32f0-30be4999c71c@oracle.com>
 <CAC_TJveDzDaYQKmuLSkGWpnuCW+gvrqdVJqq=wbzoTRjw4OoFw@mail.gmail.com>
In-Reply-To: <CAC_TJveDzDaYQKmuLSkGWpnuCW+gvrqdVJqq=wbzoTRjw4OoFw@mail.gmail.com>
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
Content-Transfer-Encoding: base64
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>,
 "Cc: Android Kernel" <kernel-team@android.com>, David
 Hildenbrand <david@redhat.com>, Ioannis Ilkos <ilkos@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Colin Cross <ccross@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, "moderated list:DMA BUFFER SHARING
 FRAMEWORK" <linaro-mm-sig@lists.linaro.org>, Paul
 Gortmaker <paul.gortmaker@windriver.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 Suren Baghdasaryan <surenb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Mike Rapoport <rppt@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogS2FsZXNoIFNpbmdoDQo+IFNlbnQ6IDMxIE1heSAyMDIyIDIzOjMwDQouLi4NCj4gPiBG
aWxlIHBhdGhzIGNhbiBjb250YWluIGZ1biBjaGFyYWN0ZXJzIGxpa2UgbmV3bGluZXMgb3IgY29s
b25zLCB3aGljaA0KPiA+IGNvdWxkIG1ha2UgcGFyc2luZyBvdXQgZmlsZW5hbWVzIGluIHRoaXMg
dGV4dCBmaWxlLi4uIGZ1bi4gSG93IHdvdWxkIHlvdXINCj4gPiB1c2Vyc3BhY2UgcGFyc2luZyBs
b2dpYyBoYW5kbGUgIi9ob21lL3N0ZXBoZW4vZmlsZW5hbWVcbnNpemU6XHQ0MDk2Ij8gVGhlDQo+
ID4gcmVhZGxpbmsoMikgQVBJIG1ha2VzIHRoYXQgZWFzeSBhbHJlYWR5Lg0KPiANCj4gSSB0aGlu
ayBzaW5jZSB3ZSBoYXZlIGVzY2FwZWQgdGhlICJcbiIgKHNlcV9maWxlX3BhdGgobSwgZmlsZSwg
IlxuIikpLA0KPiB0aGVuIHVzZXIgc3BhY2UgbWlnaHQgcGFyc2UgdGhpcyBsaW5lIGxpa2U6DQo+
IA0KPiBpZiAoc3RybmNtcChsaW5lLCAicGF0aDpcdCIsIDYpID09IDApDQo+ICAgICAgICAgY2hh
ciogcGF0aCA9IGxpbmUgKyA2Ow0KDQpUaGUgcmVhbCBhbm5veWFuY2UgaXMgb3RoZXIgdGhpbmdz
IGRvaW5nIHNjYW5zIG9mIHRoZSBmaWxlc3lzdGVtDQp0aGF0IGFjY2lkZW50YWxseSAnYnVtcCBp
bnRvJyBzdHJhbmdlIG5hbWVzLg0KDQpXaGlsZSBhbnl0aGluZyBzZXJpb3VzIHByb2JhYmx5IGdl
dHMgaXQgcmlnaHQgaG93IG1hbnkgdGltZXMNCkRvIHlvdSBydW4gJ2ZpbmQnIHRvIHF1aWNrbHkg
c2VhcmNoIGZvciBzb21ldGhpbmc/DQoNClNwYWNlcyBpbiBmaWxlbmFtZXMgKHBvcHVsYXJpc2Vk
IGJ5IHNvbWUgb3RoZXIgb3MpIGFyZSBhIFBJVEEuDQpOb3QgdG8gbWVudGlvbiBsZWFkaW5nIGFu
ZCB0cmFpbGluZyBzcGFjZXMhDQpBbnlvbmUgdXNpbmcgZmlsZW5hbWVzIHRoYXQgb25seSBjb250
YWluIHNwYWNlcyBkb2VzIG5lZWQgc2hvb3RpbmcuDQoNCkRlbGliZXJhdGVseSBhZGRpbmcgbm9u
LXByaW50YWJsZXMgaXNuJ3QgcmVhbGx5IGEgZ29vZCBpZGVhLg0KDQoJRGF2aWQNCg0KLQ0KUmVn
aXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRv
biBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

