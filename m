Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC662B8D72
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:33:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0A06E588;
	Thu, 19 Nov 2020 08:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from spam2.hygon.cn (unknown [110.188.70.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AC589CB9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 07:36:58 +0000 (UTC)
Received: from MK-DB.hygon.cn ([172.23.18.60])
 by spam2.hygon.cn with ESMTP id 0AJ7YaMl093233;
 Thu, 19 Nov 2020 15:34:36 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from cncheex02.Hygon.cn ([172.23.18.12])
 by MK-DB.hygon.cn with ESMTP id 0AJ7YYnW035706;
 Thu, 19 Nov 2020 15:34:35 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from cncheex01.Hygon.cn (172.23.18.10) by cncheex02.Hygon.cn
 (172.23.18.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Thu, 19 Nov
 2020 15:34:28 +0800
Received: from cncheex01.Hygon.cn ([172.23.18.10]) by cncheex01.Hygon.cn
 ([172.23.18.10]) with mapi id 15.01.1466.003; Thu, 19 Nov 2020 15:34:28 +0800
From: Wen Pu <puwen@hygon.cn>
To: Dave Airlie <airlied@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/vram: fix incorrect flag variable usage.
Thread-Topic: [PATCH] drm/vram: fix incorrect flag variable usage.
Thread-Index: AQHWvjHDIcSa6OWCfUemg0Cn3evu+6nOilGA
Date: Thu, 19 Nov 2020 07:34:28 +0000
Message-ID: <e8302679-6cdc-87c3-10fe-174fbb6e1778@hygon.cn>
References: <202011190506.0AJ56dO2078292@spam1.hygon.cn>
In-Reply-To: <202011190506.0AJ56dO2078292@spam1.hygon.cn>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.23.18.44]
Content-ID: <90832771EFF0BE4B80E8F0A1EAF08804@Hygon.cn>
MIME-Version: 1.0
X-MAIL: spam2.hygon.cn 0AJ7YaMl093233
X-DNSRBL: 
X-Mailman-Approved-At: Thu, 19 Nov 2020 08:31:38 +0000
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
Cc: Dave Airlie <airlied@redhat.com>, David Laight <David.Laight@aculab.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC8xMS8xOSA5OjE0LCBEYXZlIEFpcmxpZSB3cm90ZToNCj4gRnJvbTogRGF2ZSBBaXJs
aWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4NCj4gDQo+IEluIDcwNTNlMGVhYjQ3MzExOTUwM2Y2NTY1
YjRlMzk4ZjlhNzMxMjI0ODENCj4gZHJtL3ZyYW0taGVscGVyOiBzdG9wIHVzaW5nIFRUTSBwbGFj
ZW1lbnQgZmxhZ3MNCj4gDQo+IGl0IGFwcGVhcnMgdGhlIGZsYWdzIGdvdCBtaXhlZCB1cC4NCj4g
DQo+IFRoaXMgc2hvdWxkIGZpeCBhIHJlZ3Jlc3Npb24gb24gYXN0DQo+IFsgICA2NC43ODIzNDBd
IFdBUk5JTkc6IENQVTogNTEgUElEOiAxOTY0IGF0IGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3Zy
YW1faGVscGVyLmM6Mjg0IGRybV9nZW1fdnJhbV9vZmZzZXQrMHgzNS8weDQwIFtkcm1fdnJhbV9o
ZWxwZXJdDQouLi4uLi4NCj4gDQoNCkl0IG1heSBuZWVkIHRoaXMgbGluZToNCkZpeGVzOiA3MDUz
ZTBlYWI0NzMgKCJkcm0vdnJhbS1oZWxwZXI6IHN0b3AgdXNpbmcgVFRNIHBsYWNlbWVudCBmbGFn
cyIpDQoNCklmIHBvc3NpYmxlLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWdzIGFzIGFwcHJvcHJp
YXRlOg0KUmVwb3J0ZWQtYnk6IFB1IFdlbiA8cHV3ZW5AaHlnb24uY24+DQpUZXN0ZWQtYnk6IFB1
IFdlbiA8cHV3ZW5AaHlnb24uY24+DQoNCj4gU2lnbmVkLW9mZi1ieTogRGF2ZSBBaXJsaWUgPGFp
cmxpZWRAcmVkaGF0LmNvbT4+IENjOiBXZW4gUHUgPHB1d2VuQGh5Z29uLmNuPg0KPiBDYzogRGF2
aWQgTGFpZ2h0IDxEYXZpZC5MYWlnaHRAYWN1bGFiLmNvbT4NCj4gQ2M6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbV92cmFtX2hlbHBlci5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV9nZW1fdnJhbV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVs
cGVyLmMNCj4gaW5kZXggNTBjYWQwZTRhOTJlLi4yODk2YTA1N2I3NzEgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYw0KPiBAQCAtMTQwLDcgKzE0MCw3IEBAIHN0YXRp
YyB2b2lkIGRybV9nZW1fdnJhbV9wbGFjZW1lbnQoc3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3Qg
KmdibywNCj4gIAl1bnNpZ25lZCBpbnQgYyA9IDA7DQo+ICANCj4gIAlpZiAocGxfZmxhZyAmIERS
TV9HRU1fVlJBTV9QTF9GTEFHX1RPUERPV04pDQo+IC0JCXBsX2ZsYWcgPSBUVE1fUExfRkxBR19U
T1BET1dOOw0KPiArCQlpbnZhcmlhbnRfZmxhZyA9IFRUTV9QTF9GTEFHX1RPUERPV047DQoNCmlu
dmFyaWFudF9mbGFnIHNob3VsZCBiZSBpbnZhcmlhbnRfZmxhZ3MgOikNCg0KVGhpcyBjaGFuZ2Ug
Zml4IHRoZSByZWdyZXNzaW9uIG9uIGFzdCBkcml2ZXIuDQoNClRoeC4NCg0KPiAgDQo+ICAJZ2Jv
LT5wbGFjZW1lbnQucGxhY2VtZW50ID0gZ2JvLT5wbGFjZW1lbnRzOw0KPiAgCWdiby0+cGxhY2Vt
ZW50LmJ1c3lfcGxhY2VtZW50ID0gZ2JvLT5wbGFjZW1lbnRzOw0KPiANCg0KLS0gDQpSZWdhcmRz
LA0KUHUgV2VuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
