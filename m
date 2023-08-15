Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D66A77CD6A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 15:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1030610E185;
	Tue, 15 Aug 2023 13:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9916810E182
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 13:40:04 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-14-jtYcrbScOx2nz_MMUvypow-1; Tue, 15 Aug 2023 14:38:26 +0100
X-MC-Unique: jtYcrbScOx2nz_MMUvypow-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Tue, 15 Aug
 2023 14:38:23 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Tue, 15 Aug 2023 14:38:23 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Mina Almasry' <almasrymina@google.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [RFC PATCH v2 00/11] Device Memory TCP
Thread-Topic: [RFC PATCH v2 00/11] Device Memory TCP
Thread-Index: AQHZyy4cCyylGqKvQkCWO9kOPAhLv6/rVx7w
Date: Tue, 15 Aug 2023 13:38:23 +0000
Message-ID: <58a93e4e8b8b4ca79c2678a3ae8281cd@AcuMS.aculab.com>
References: <20230810015751.3297321-1-almasrymina@google.com>
In-Reply-To: <20230810015751.3297321-1-almasrymina@google.com>
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
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 David Ahern <dsahern@kernel.org>, Ilias
 Apalodimas <ilias.apalodimas@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "stephen@networkplumber.org" <stephen@networkplumber.org>, Jason
 Gunthorpe <jgg@ziepe.ca>, Eric Dumazet <edumazet@google.com>,
 "sdf@google.com" <sdf@google.com>, Andy Lutomirski <luto@kernel.org>,
 Hari Ramakrishnan <rharix@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWluYSBBbG1hc3J5DQo+IFNlbnQ6IDEwIEF1Z3VzdCAyMDIzIDAyOjU4DQouLi4NCj4g
KiBUTDtEUjoNCj4gDQo+IERldmljZSBtZW1vcnkgVENQIChkZXZtZW0gVENQKSBpcyBhIHByb3Bv
c2FsIGZvciB0cmFuc2ZlcnJpbmcgZGF0YSB0byBhbmQvb3INCj4gZnJvbSBkZXZpY2UgbWVtb3J5
IGVmZmljaWVudGx5LCB3aXRob3V0IGJvdW5jaW5nIHRoZSBkYXRhIHRvIGEgaG9zdCBtZW1vcnkN
Cj4gYnVmZmVyLg0KDQpEb2Vzbid0IHRoYXQgcmVhbGx5IHJlcXVpcmUgcGVlci10by1wZWVyIFBD
SWUgdHJhbnNmZXJzPw0KSUlSQyB0aGVzZSBhcmVuJ3Qgc3VwcG9ydGVkIGJ5IG1hbnkgcm9vdCBo
dWJzIGFuZCBoYXZlDQpmdW5kYW1lbnRhbCBmbG93IGNvbnRyb2wgYW5kL29yIFRMUCBjcmVkaXQg
cHJvYmxlbXMuDQoNCkknZCBndWVzcyB0aGV5IGFyZSBhbHNvIHByZXR0eSBpbmNvbXBhdGlibGUg
d2l0aCBJT01NVT8NCg0KSSBjYW4gc2VlIGhvdyB5b3UgbWlnaHQgbWFuYWdlIHRvIHRyYW5zbWl0
IGZyYW1lcyBmcm9tDQpzb21lIGV4dGVybmFsIG1lbW9yeSAoZWcgYWZ0ZXIgZW5jcnlwdGlvbikg
YnV0IHN1cmVseQ0KcHJvY2Vzc2luZyByZWNlaXZlIGRhdGEgdGhhdCB3YXkgbmVlZHMgdGhlIHBh
Y2tldHMNCmJlIGZpbHRlcmVkIGJ5IGJvdGggSVAgYWRkcmVzc2VzIGFuZCBwb3J0IG51bWJlcnMg
YmVmb3JlDQpiZWluZyByZWRpcmVjdGVkIHRvIHRoZSAocHJlc3VtYWJseSBsaW1pdGVkKSBleHRl
cm5hbA0KbWVtb3J5Lg0KDQpPVE9IIGlzbid0IHRoZSBrZXJuZWwgZ29pbmcgdG8gbmVlZCB0byBy
dW4gY29kZSBiZWZvcmUNCnRoZSBwYWNrZXQgaXMgYWN0dWFsbHkgc2VudCBhbmQganVzdCBhZnRl
ciBpdCBpcyByZWNlaXZlZD8NClNvIGFsbCB5b3UgbWlnaHQgZ2FpbiBpcyBhIGJpdCBvZiBsYXRl
bmN5Pw0KQW5kIGEgYml0IGxlc3MgdXRpbGlzYXRpb24gb2YgaG9zdCBtZW1vcnk/Pw0KQnV0IGlm
IHlvdXIgc3lzdGVtIGlzIHJlYWxseSBsaW1pdGVkIGJ5IGNwdS1tZW1vcnkgYmFuZHdpZHRoDQp5
b3UgbmVlZCBtb3JlIGNhY2hlIDotKQ0KDQpTbyBob3cgbXVjaCBiZW5lZml0IGlzIHRoZXJlIG92
ZXIgZWZmaWNpZW50IHVzZSBvZiBob3N0DQptZW1vcnkgYm91bmNlIGJ1ZmZlcnM/Pw0KDQoJRGF2
aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50
IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTcz
ODYgKFdhbGVzKQ0K

