Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B9D1ED809
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 23:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D26B6E029;
	Wed,  3 Jun 2020 21:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4182289FDE;
 Wed,  3 Jun 2020 21:27:06 +0000 (UTC)
IronPort-SDR: Lwc0BuM0mE4VVORW9r9t7WkJqZcKiVGL4V9VwjW2z2JjkJnTadnLqFoDYi8YoF+RkzbWHax3cz
 /jQHd/cNyndQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2020 14:27:05 -0700
IronPort-SDR: BQR0fl+yYqAEp4qiyU4/6n5jf/GehxYwkkDQMFnSLRq5eicxkwemcBQuyqDGzvB559/mvfv1KK
 /T0z/79yz0Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,469,1583222400"; d="scan'208";a="471280239"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga005.fm.intel.com with ESMTP; 03 Jun 2020 14:27:04 -0700
Received: from fmsmsx116.amr.corp.intel.com ([169.254.2.9]) by
 FMSMSX106.amr.corp.intel.com ([10.18.124.204]) with mapi id 14.03.0439.000;
 Wed, 3 Jun 2020 14:27:04 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Deak,
 Imre" <imre.deak@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915/dp_mst: Fix disabling MST on a
 port
Thread-Topic: [Intel-gfx] [PATCH 1/3] drm/i915/dp_mst: Fix disabling MST on
 a port
Thread-Index: AQHWOet4jUL+jsGcPEa9lNVjXQ73tKjH3VQA
Date: Wed, 3 Jun 2020 21:27:03 +0000
Message-ID: <dc4e459534b6815b932c16ec38a1e2714d94ec07.camel@intel.com>
References: <20200603211040.8190-1-imre.deak@intel.com>
In-Reply-To: <20200603211040.8190-1-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.254.182.158]
Content-ID: <E3187F1A507F784DA9D9DCD715090548@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIwLTA2LTA0IGF0IDAwOjEwICswMzAwLCBJbXJlIERlYWsgd3JvdGU6DQo+IEN1
cnJlbnRseSBNU1Qgb24gYSBwb3J0IGNhbiBnZXQgZW5hYmxlZC9kaXNhYmxlZCBmcm9tIHRoZSBo
b3RwbHVnIHdvcmsNCj4gYW5kIGdldCBkaXNhYmxlZCBmcm9tIHRoZSBzaG9ydCBwdWxzZSB3b3Jr
IGluIGEgcmFjeSB3YXkuIEZpeCB0aGlzIGJ5DQo+IHJlbHlpbmcgb24gdGhlIE1TVCBzdGF0ZSBj
aGVja2luZyBpbiB0aGUgaG90cGx1ZyB3b3JrIGFuZCBqdXN0IHNjaGVkdWxlDQo+IGEgaG90cGx1
ZyB3b3JrIGZyb20gdGhlIHNob3J0IHB1bHNlIGhhbmRsZXIgaWYgc29tZSBwcm9ibGVtIGhhcHBl
bmVkDQo+IGR1cmluZyB0aGUgTVNUIGludGVycnVwdCBoYW5kbGluZy4NCg0KTmljZQ0KDQo+IA0K
PiBUaGlzIHJlbW92ZXMgdGhlIGV4cGxpY2l0IE1TVCBkaXNhYmxpbmcgaW4gY2FzZSBvZiBhbiBB
VVggZmFpbHVyZSwgYnV0DQo+IGlmIEFVWCBmYWlscywgdGhlbiBwcm9iYWJseSB0aGUgZGV0ZWN0
aW9uIHdpbGwgYWxzbyBmYWlsIGR1cmluZyB0aGUNCj4gc2NoZWR1bGVkIGhvdHBsdWcgd29yayBh
bmQgaXQncyBub3QgZ3VhcmFudGVlZCB0aGF0IHdlJ2xsIHNlZQ0KPiBpbnRlcm1pdHRlbnQgZXJy
b3JzIGFueXdheS4NCj4gDQo+IFdoaWxlIGF0IGl0IGFsc28gc2ltcGxpZnkgdGhlIGVycm9yIGNo
ZWNraW5nIG9mIHRoZSBNU1QgaW50ZXJydXB0DQo+IGhhbmRsZXIuDQo+IA0KDQpSZXZpZXdlZC1i
eTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQoNCj4gU2ln
bmVkLW9mZi1ieTogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyB8IDMzICsrKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDI5IGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYw0KPiBp
bmRleCA1NWZkYTA3NGMwYWQuLmJlZmJjYWNkZGFhMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZHAuYw0KPiBAQCAtNTYwNCw3ICs1NjA0LDcgQEAgaW50ZWxfZHBf
Y2hlY2tfbXN0X3N0YXR1cyhzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKQ0KPiAgCQl9DQo+ICAJ
fQ0KPiAgDQo+IC0JcmV0dXJuIG5lZWRfcmV0cmFpbjsNCj4gKwlyZXR1cm4gbmVlZF9yZXRyYWlu
ID8gLUVJTlZBTCA6IDA7DQo+ICB9DQo+ICANCj4gIHN0YXRpYyBib29sDQo+IEBAIC03MjU1LDM1
ICs3MjU1LDEwIEBAIGludGVsX2RwX2hwZF9wdWxzZShzdHJ1Y3QgaW50ZWxfZGlnaXRhbF9wb3J0
ICppbnRlbF9kaWdfcG9ydCwgYm9vbCBsb25nX2hwZCkNCj4gIAl9DQo+ICANCj4gIAlpZiAoaW50
ZWxfZHAtPmlzX21zdCkgew0KPiAtCQlzd2l0Y2ggKGludGVsX2RwX2NoZWNrX21zdF9zdGF0dXMo
aW50ZWxfZHApKSB7DQo+IC0JCWNhc2UgLUVJTlZBTDoNCj4gLQkJCS8qDQo+IC0JCQkgKiBJZiB3
ZSB3ZXJlIGluIE1TVCBtb2RlLCBhbmQgZGV2aWNlIGlzIG5vdA0KPiAtCQkJICogdGhlcmUsIGdl
dCBvdXQgb2YgTVNUIG1vZGUNCj4gLQkJCSAqLw0KPiAtCQkJZHJtX2RiZ19rbXMoJmk5MTUtPmRy
bSwNCj4gLQkJCQkgICAgIk1TVCBkZXZpY2UgbWF5IGhhdmUgZGlzYXBwZWFyZWQgJWQgdnMgJWRc
biIsDQo+IC0JCQkJICAgIGludGVsX2RwLT5pc19tc3QsDQo+IC0JCQkJICAgIGludGVsX2RwLT5t
c3RfbWdyLm1zdF9zdGF0ZSk7DQo+IC0JCQlpbnRlbF9kcC0+aXNfbXN0ID0gZmFsc2U7DQo+IC0J
CQlkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9zZXRfbXN0KCZpbnRlbF9kcC0+bXN0X21nciwNCj4g
LQkJCQkJCQlpbnRlbF9kcC0+aXNfbXN0KTsNCj4gLQ0KPiAtCQkJcmV0dXJuIElSUV9OT05FOw0K
PiAtCQljYXNlIDE6DQo+IC0JCQlyZXR1cm4gSVJRX05PTkU7DQo+IC0JCWRlZmF1bHQ6DQo+IC0J
CQlicmVhazsNCj4gLQkJfQ0KPiAtCX0NCj4gLQ0KPiAtCWlmICghaW50ZWxfZHAtPmlzX21zdCkg
ew0KPiAtCQlib29sIGhhbmRsZWQ7DQo+IC0NCj4gLQkJaGFuZGxlZCA9IGludGVsX2RwX3Nob3J0
X3B1bHNlKGludGVsX2RwKTsNCj4gLQ0KPiAtCQlpZiAoIWhhbmRsZWQpDQo+ICsJCWlmIChpbnRl
bF9kcF9jaGVja19tc3Rfc3RhdHVzKGludGVsX2RwKSA8IDApDQo+ICAJCQlyZXR1cm4gSVJRX05P
TkU7DQo+ICsJfSBlbHNlIGlmICghaW50ZWxfZHBfc2hvcnRfcHVsc2UoaW50ZWxfZHApKSB7DQo+
ICsJCXJldHVybiBJUlFfTk9ORTsNCj4gIAl9DQo+ICANCj4gIAlyZXR1cm4gSVJRX0hBTkRMRUQ7
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
