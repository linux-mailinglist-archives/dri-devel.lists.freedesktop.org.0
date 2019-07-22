Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFD270280
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 16:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1F189BFE;
	Mon, 22 Jul 2019 14:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1330689BFE
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 14:40:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 07:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,295,1559545200"; d="scan'208";a="196774251"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
 by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2019 07:40:48 -0700
Received: from irsmsx111.ger.corp.intel.com (10.108.20.4) by
 IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 22 Jul 2019 15:40:47 +0100
Received: from irsmsx104.ger.corp.intel.com ([169.254.5.40]) by
 irsmsx111.ger.corp.intel.com ([169.254.2.65]) with mapi id 14.03.0439.000;
 Mon, 22 Jul 2019 15:40:47 +0100
From: "Ser, Simon" <simon.ser@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "contact@emersion.fr" <contact@emersion.fr>
Subject: Re: [PATCH] drm: fix out-of-bounds access with short VSDB blocks
Thread-Topic: [PATCH] drm: fix out-of-bounds access with short VSDB blocks
Thread-Index: AQHVQJsv9VVxU3oBgEGcHehz4qFCI6bWpQ2A
Date: Mon, 22 Jul 2019 14:40:47 +0000
Message-ID: <adeb6c424b5239c3aaf6a0023531ad46b9188ed7.camel@intel.com>
References: <I1AvHeOKt0LxZk5YfvzAd_iDpe5NWuhHNYueQ3Ubp3ilF-69Q8u5Nn_I-mqJt2zPKq1aoy2UsgT5hFUM1KMKVj8qXQHPqlvuVSulRLe1EAI=@emersion.fr>
In-Reply-To: <I1AvHeOKt0LxZk5YfvzAd_iDpe5NWuhHNYueQ3Ubp3ilF-69Q8u5Nn_I-mqJt2zPKq1aoy2UsgT5hFUM1KMKVj8qXQHPqlvuVSulRLe1EAI=@emersion.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.181]
Content-ID: <1B525E4C34CF0044B37ED546C27DCDA6@intel.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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

T24gTW9uLCAyMDE5LTA3LTIyIGF0IDE0OjM4ICswMDAwLCBTaW1vbiBTZXIgd3JvdGU6DQo+IEZy
b206IFNpbW9uIFNlciA8c2ltb24uc2VyQGludGVsLmNvbT4NCj4gDQo+IFRoZSBWU0RCIHBhcnNp
bmcgY29kZSBjb250YWlucyBhIGZldyBsZW4gPj0gTiBjaGVja3MsIGFjY2Vzc2luZyBkYltOXSBv
bg0KPiBzdWNjZXNzLiBIb3dldmVyIGlmIGxlbiA9PSBOLCBkYltOXSBpcyBvdXQtb2YtYm91bmRz
Lg0KPiANCj4gVGhpcyBjb21taXQgY2hhbmdlcyB0aGUgY2hlY2tzIHRvIHRlc3QgZm9yIGxlbiA+
IE4uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBTZXIgPGNvbnRhY3RAZW1lcnNpb24uZnI+
DQoNCkJsZWgsIEkgbWVzc2VkIHVwIHRoZSBTLW8tYi4NCg0KU2lnbmVkLW9mZi1ieTogU2ltb24g
U2VyIDxzaW1vbi5zZXJAaW50ZWwuY29tPg0KDQpTb3JyeSBhYm91dCB0aGF0Lg0KDQo+IC0tLQ0K
PiAgZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgfCAyNCArKysrKysrKysrKystLS0tLS0tLS0t
LS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZWRpZC5jDQo+IGluZGV4IDgyYTRjZWVkM2ZjZi4uMTNkNjMyZjE0MTcyIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2VkaWQuYw0KPiBAQCAtMzU2OSw3ICszNTY5LDcgQEAgZG9faGRtaV92c2Ri
X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIGNvbnN0IHU4ICpkYiwgdTgg
bGVuLA0KPiAgCXZpY19sZW4gPSBkYls4ICsgb2Zmc2V0XSA+PiA1Ow0KPiAgCWhkbWlfM2RfbGVu
ID0gZGJbOCArIG9mZnNldF0gJiAweDFmOw0KPiANCj4gLQlmb3IgKGkgPSAwOyBpIDwgdmljX2xl
biAmJiBsZW4gPj0gKDkgKyBvZmZzZXQgKyBpKTsgaSsrKSB7DQo+ICsJZm9yIChpID0gMDsgaSA8
IHZpY19sZW4gJiYgbGVuID4gKDkgKyBvZmZzZXQgKyBpKTsgaSsrKSB7DQo+ICAJCXU4IHZpYzsN
Cj4gDQo+ICAJCXZpYyA9IGRiWzkgKyBvZmZzZXQgKyBpXTsNCj4gQEAgLTM5NzEsMTEgKzM5NzEs
MTEgQEAgZHJtX3BhcnNlX2hkcl9tZXRhZGF0YV9ibG9jayhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAq
Y29ubmVjdG9yLCBjb25zdCB1OCAqZGIpDQo+ICAJY29ubmVjdG9yLT5oZHJfc2lua19tZXRhZGF0
YS5oZG1pX3R5cGUxLm1ldGFkYXRhX3R5cGUgPQ0KPiAgCQkJCQkJaGRyX21ldGFkYXRhX3R5cGUo
ZGIpOw0KPiANCj4gLQlpZiAobGVuID49IDQpDQo+ICsJaWYgKGxlbiA+IDQpDQo+ICAJCWNvbm5l
Y3Rvci0+aGRyX3NpbmtfbWV0YWRhdGEuaGRtaV90eXBlMS5tYXhfY2xsID0gZGJbNF07DQo+IC0J
aWYgKGxlbiA+PSA1KQ0KPiArCWlmIChsZW4gPiA1KQ0KPiAgCQljb25uZWN0b3ItPmhkcl9zaW5r
X21ldGFkYXRhLmhkbWlfdHlwZTEubWF4X2ZhbGwgPSBkYls1XTsNCj4gLQlpZiAobGVuID49IDYp
DQo+ICsJaWYgKGxlbiA+IDYpDQo+ICAJCWNvbm5lY3Rvci0+aGRyX3NpbmtfbWV0YWRhdGEuaGRt
aV90eXBlMS5taW5fY2xsID0gZGJbNl07DQo+ICB9DQo+IA0KPiBAQCAtMzk4NCwxOSArMzk4NCwx
OSBAQCBkcm1fcGFyc2VfaGRtaV92c2RiX2F1ZGlvKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3IsIGNvbnN0IHU4ICpkYikNCj4gIHsNCj4gIAl1OCBsZW4gPSBjZWFfZGJfcGF5bG9hZF9s
ZW4oZGIpOw0KPiANCj4gLQlpZiAobGVuID49IDYgJiYgKGRiWzZdICYgKDEgPDwgNykpKQ0KPiAr
CWlmIChsZW4gPiA2ICYmIChkYls2XSAmICgxIDw8IDcpKSkNCj4gIAkJY29ubmVjdG9yLT5lbGRb
RFJNX0VMRF9TQURfQ09VTlRfQ09OTl9UWVBFXSB8PSBEUk1fRUxEX1NVUFBPUlRTX0FJOw0KPiAt
CWlmIChsZW4gPj0gOCkgew0KPiArCWlmIChsZW4gPiA4KSB7DQo+ICAJCWNvbm5lY3Rvci0+bGF0
ZW5jeV9wcmVzZW50WzBdID0gZGJbOF0gPj4gNzsNCj4gIAkJY29ubmVjdG9yLT5sYXRlbmN5X3By
ZXNlbnRbMV0gPSAoZGJbOF0gPj4gNikgJiAxOw0KPiAgCX0NCj4gLQlpZiAobGVuID49IDkpDQo+
ICsJaWYgKGxlbiA+IDkpDQo+ICAJCWNvbm5lY3Rvci0+dmlkZW9fbGF0ZW5jeVswXSA9IGRiWzld
Ow0KPiAtCWlmIChsZW4gPj0gMTApDQo+ICsJaWYgKGxlbiA+IDEwKQ0KPiAgCQljb25uZWN0b3It
PmF1ZGlvX2xhdGVuY3lbMF0gPSBkYlsxMF07DQo+IC0JaWYgKGxlbiA+PSAxMSkNCj4gKwlpZiAo
bGVuID4gMTEpDQo+ICAJCWNvbm5lY3Rvci0+dmlkZW9fbGF0ZW5jeVsxXSA9IGRiWzExXTsNCj4g
LQlpZiAobGVuID49IDEyKQ0KPiArCWlmIChsZW4gPiAxMikNCj4gIAkJY29ubmVjdG9yLT5hdWRp
b19sYXRlbmN5WzFdID0gZGJbMTJdOw0KPiANCj4gIAlEUk1fREVCVUdfS01TKCJIRE1JOiBsYXRl
bmN5IHByZXNlbnQgJWQgJWQsICINCj4gQEAgLTQ1NTksOSArNDU1OSw5IEBAIGRybV9wYXJzZV9o
ZG1pX3ZzZGJfdmlkZW8oc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwgY29uc3QgdTgg
KmRiKQ0KPiAgCXN0cnVjdCBkcm1fZGlzcGxheV9pbmZvICppbmZvID0gJmNvbm5lY3Rvci0+ZGlz
cGxheV9pbmZvOw0KPiAgCXU4IGxlbiA9IGNlYV9kYl9wYXlsb2FkX2xlbihkYik7DQo+IA0KPiAt
CWlmIChsZW4gPj0gNikNCj4gKwlpZiAobGVuID4gNikNCj4gIAkJaW5mby0+ZHZpX2R1YWwgPSBk
Yls2XSAmIDE7DQo+IC0JaWYgKGxlbiA+PSA3KQ0KPiArCWlmIChsZW4gPiA3KQ0KPiAgCQlpbmZv
LT5tYXhfdG1kc19jbG9jayA9IGRiWzddICogNTAwMDsNCj4gDQo+ICAJRFJNX0RFQlVHX0tNUygi
SERNSTogRFZJIGR1YWwgJWQsICINCj4gLS0NCj4gMi4yMi4wDQo+IA0KPiANCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
