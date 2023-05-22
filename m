Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CE470BCED
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 14:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0B910E2F7;
	Mon, 22 May 2023 12:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8CB10E2F7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 12:07:48 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-75-nEeo5WdKNgC3tzWX8ags8w-1; Mon, 22 May 2023 13:07:35 +0100
X-MC-Unique: nEeo5WdKNgC3tzWX8ags8w-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Mon, 22 May
 2023 13:07:23 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Mon, 22 May 2023 13:07:23 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: "'15330273260@189.cn'" <15330273260@189.cn>, Jani Nikula
 <jani.nikula@linux.intel.com>, Li Yi <liyi@loongson.cn>
Subject: RE: [PATCH] drm/drm_vblank.c: avoid unsigned int to signed int cast
Thread-Topic: [PATCH] drm/drm_vblank.c: avoid unsigned int to signed int cast
Thread-Index: AQHZiBwkXHI4wBkIl0yfSK4Xtptrs69eSnTggAfuD9GAAADacA==
Date: Mon, 22 May 2023 12:07:23 +0000
Message-ID: <f25545e96bc1458eb5bffc1505255e68@AcuMS.aculab.com>
References: <20230516173026.2990705-1-15330273260@189.cn>
 <f6bd362145124f34a1af800dd330f8e9@AcuMS.aculab.com>
 <b23c41b1-e177-c81d-5327-fce5511cb97d@189.cn> <871qj8ob7z.fsf@intel.com>
 <7f81c053-ba60-a4d2-23d6-d0f032acbcff@189.cn>
In-Reply-To: <7f81c053-ba60-a4d2-23d6-d0f032acbcff@189.cn>
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
Cc: "loongson-kernel@lists.loongnix.cn" <loongson-kernel@lists.loongnix.cn>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogMTUzMzAyNzMyNjBAMTg5LmNuIDwxNTMzMDI3MzI2MEAxODkuY24+DQo+IFNlbnQ6IDIy
IE1heSAyMDIzIDEyOjU2DQouLi4NCj4gPiBJJ2xsIGJldCBtb3N0IHBlb3BsZSB3aWxsIGJlIHN1
cnByaXNlZCB0byBzZWUgd2hhdCB0aGlzIHByaW50czoNCj4gPg0KPiA+ICNpbmNsdWRlIDxzdGRp
by5oPg0KPiA+ICNpbmNsdWRlIDxzdGRpbnQuaD4NCj4gPg0KPiA+IGludCBtYWluKHZvaWQpDQo+
ID4gew0KPiA+IAl1aW50MTZfdCB4ID0gMHhmZmZmOw0KPiA+IAl1aW50MTZfdCB5ID0gMHhmZmZm
Ow0KPiA+IAl1aW50NjRfdCB6ID0geCAqIHk7DQo+ID4NCj4gPiAJcHJpbnRmKCIweCUwMTZseFxu
Iiwgeik7DQo+ID4gCXByaW50ZigiJWxkXG4iLCB6KTsNCj4gDQo+IEhlcmUsIHBsZWFzZSByZXBs
YWNlIHRoZSAiJWxkXG4iIHdpdGggdGhlICIlbHVcbiIsIHRoZW4geW91IHdpbGwgc2VlIHRoZQ0K
PiBkaWZmZXJlbmNlLg0KPiANCj4geW91IGFyZSBjYXN0aW5nIHRoZSB2YXJpYWJsZSAneicgdG8g
c2lnbmVkIHZhbHVlLMKgICIlZCIgaXMgZm9yIHByaW50aW5nDQo+IHNpZ25lZCB2YWx1ZSwgYW5k
ICIldSIgaXMgZm9yIHByaW50aW5nIHVuc2lnbmVkIHZhbHVlLg0KDQpUaGF0IG1ha2VzIHZlcnkg
bGl0dGxlIGRpZmZlcmVuY2Ugb24gMidzIGNvbXBsaW1lbnQgc3lzdGVtcy4NClRoZXkgYm90aCBk
aXNwbGF5IHRoZSBjb250ZW50cyBvZiB0aGUgdmFyaWFibGUuDQoNCj4gWW91ciBzaW1wbGUgY29k
ZSBleHBsYWluZWQgZXhhY3RseSB3aHkgeW91IGFyZSBzdGlsbCBpbiBjb25mdXNpb24sDQo+IA0K
PiB0aGF0IGlzIHUxNiAqIHUxNsKgIGNhbiB5aWVsZCBhIG5lZ2F0aXZlIHZhbHVlIGlmIHlvdSB1
c2UgdGhlIGludCBhcyB0aGUNCj4gcmV0dXJuIHR5cGUuIEJlY2F1c2UgaXQgb3ZlcmZsb3dlZC4N
Cg0KVGhlcmUgaXMgbm8gJ3JldHVybiB0eXBlJywgdGhlIHR5cGUgb2YgJ3UxNiAqIHUxNicgaXMg
c2lnbmVkIGludC4NCldoZW4gJ3NpZ25lZCBpbnQnIGlzIHByb21vdGVkL2Nhc3QgdG8gdTY0IGl0
IGlzIGZpcnN0IHNpZ24gZXh0ZW5kZWQNCnRvIDY0IGJpdHMuDQoNCllvdSBjYW4gZ2V0IHdoYXQg
eW91IHdhbnQvZXhwZWN0IGJ5IGVpdGhlciBmb3JjaW5nIGFuIHVuc2lnbmVkIG11bHRpcGx5DQpv
ciBieSBleHBsaWNpdGx5IGNhc3RpbmcgdGhlIHJlc3VsdCBvZiB0aGUgbXVsdGlwbHkgdG8gdTMy
Lg0KU28gdGhlIHByb2R1Y3QgaW4gJ3ogPSAoeCArIDB1KSAqIHknIGlzICd1bnNpZ25lZCBpbnQn
IGl0IGdldHMNCnByb21vdGVkIHRvIGludDY0X3QgKGllIGEgc2lnbmVkIHR5cGUpIGFuZCB0aGVu
IGNvbnZlcnRlZCB0bw0KdW5zaWduZWQuDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJl
c3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsx
IDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo=

