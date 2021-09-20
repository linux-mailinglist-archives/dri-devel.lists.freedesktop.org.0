Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11715412777
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 22:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EF06E855;
	Mon, 20 Sep 2021 20:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D176E855;
 Mon, 20 Sep 2021 20:47:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="223266646"
X-IronPort-AV: E=Sophos;i="5.85,309,1624345200"; d="scan'208";a="223266646"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 13:47:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,309,1624345200"; d="scan'208";a="434894689"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 20 Sep 2021 13:47:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 20 Sep 2021 13:47:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 20 Sep 2021 13:47:06 -0700
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.2242.012;
 Mon, 20 Sep 2021 13:47:06 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "Lee, Shawn C" <shawn.c.lee@intel.com>, "lma@semihalf.com"
 <lma@semihalf.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "upstream@semihalf.com" <upstream@semihalf.com>
Subject: Re: [PATCH v1] drm/i915/bdb: Fix version check
Thread-Topic: [PATCH v1] drm/i915/bdb: Fix version check
Thread-Index: AQHXrimO0gfIStxtp0mPj/fNNtEfLKut2+4A
Date: Mon, 20 Sep 2021 20:47:06 +0000
Message-ID: <051f4a37e178d11c6dbcd05b5d6be28731cd7302.camel@intel.com>
References: <20210920141101.194959-1-lma@semihalf.com>
In-Reply-To: <20210920141101.194959-1-lma@semihalf.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D5116FE95D2FFF4A81734BE9D6B4662C@intel.com>
Content-Transfer-Encoding: base64
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIxLTA5LTIwIGF0IDE2OjExICswMjAwLCBMdWthc3ogTWFqY3phayB3cm90ZToN
Cj4gV2l0aCBwYXRjaCAiZHJtL2k5MTUvdmJ0OiBGaXggYmFja2xpZ2h0IHBhcnNpbmcgZm9yIFZC
VCAyMzQrIg0KPiB0aGUgc2l6ZSBvZiBiZGJfbGZwX2JhY2tsaWdodF9kYXRhIHN0cnVjdHVyZSBo
YXMgYmVlbiBpbmNyZWFzZWQsDQo+IGNhdXNpbmcgaWYtc3RhdGVtZW50IGluIHRoZSBwYXJzZV9s
ZnBfYmFja2xpZ2h0IGZ1bmN0aW9uDQo+IHRoYXQgY29tYXByZXMgdGhpcyBzdHJ1Y3R1cmUgc2l6
ZSB0byB0aGUgb25lIHJldHJpZXZlZCBmcm9tIEJEQiwNCj4gYWx3YXlzIHRvIGZhaWwgZm9yIG9s
ZGVyIHJldmlzaW9ucy4NCj4gVGhpcyBwYXRjaCBmaXhlcyBpdCBieSBjb21wYXJpbmcgYSB0b3Rh
bCBzaXplIG9mIGFsbCBmaWxlZHMgZnJvbQ0KPiB0aGUgc3RydWN0dXJlIChwcmVzZW50IGJlZm9y
ZSB0aGUgY2hhbmdlKSB3aXRoIHRoZSB2YWx1ZSBnYXRoZXJlZCBmcm9tIEJEQi4NCj4gVGVzdGVk
IG9uIENocm9tZWJvb2sgUGl4ZWxib29rIChOb2N0dXJuZSkgKHJlcG9ydHMgYmRiLT52ZXJzaW9u
ID0gMjIxKQ0KPiANCj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIDUuNCsNCj4gVGVz
dGVkLWJ5OiBMdWthc3ogTWFqY3phayA8bG1hQHNlbWloYWxmLmNvbT4NCj4gU2lnbmVkLW9mZi1i
eTogTHVrYXN6IE1hamN6YWsgPGxtYUBzZW1paGFsZi5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9iaW9zLmMgICAgIHwgNCArKystDQo+ICBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3ZidF9kZWZzLmggfCA1ICsrKysrDQo+ICAyIGZp
bGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYmlvcy5jIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9iaW9zLmMNCj4gaW5kZXggM2MyNTkyNjA5MmRl
Li4wNTJhMTliNDU1ZDEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfYmlvcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfYmlvcy5jDQo+IEBAIC00NTIsNyArNDUyLDkgQEAgcGFyc2VfbGZwX2JhY2tsaWdodChzdHJ1
Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSwNCj4gIA0KPiAgCWk5MTUtPnZidC5iYWNrbGlnaHQu
dHlwZSA9IElOVEVMX0JBQ0tMSUdIVF9ESVNQTEFZX0RESTsNCj4gIAlpZiAoYmRiLT52ZXJzaW9u
ID49IDE5MSAmJg0KPiAtCSAgICBnZXRfYmxvY2tzaXplKGJhY2tsaWdodF9kYXRhKSA+PSBzaXpl
b2YoKmJhY2tsaWdodF9kYXRhKSkgew0KPiArCSAgICBnZXRfYmxvY2tzaXplKGJhY2tsaWdodF9k
YXRhKSA+PSAoc2l6ZW9mKGJhY2tsaWdodF9kYXRhLT5lbnRyeV9zaXplKSArDQo+ICsJCQkJCSAg
ICAgIHNpemVvZihiYWNrbGlnaHRfZGF0YS0+ZGF0YSkgKw0KPiArCQkJCQkgICAgICBzaXplb2Yo
YmFja2xpZ2h0X2RhdGEtPmxldmVsKSkpIHsNCg0KTWlzc2luZyBzaXplb2YoYmFja2xpZ2h0X2Rh
dGEtPmJhY2tsaWdodF9jb250cm9sKSBidXQgdGhpcyBpcyBnZXR0aW5nIHZlcnkgdmVyYm9zZS4N
CldvdWxkIGJlIGJldHRlciBoYXZlIGEgZXhwZWN0ZWQgc2l6ZSB2YXJpYWJsZSBzZXQgZWFjaCB2
ZXJzaW9uIHNldCBpbiB0aGUgYmVnaW5uaW5nIG9mIHRoaXMgZnVuY3Rpb24uDQoNCnNvbWV0aGlu
ZyBsaWtlOg0Kc3dpdGNoIChiZGItPnZlcnNpb24pIHsNCmNhc2UgMTkxOg0KCWV4cGVjdGVkX3Np
emUgPSB4Ow0KCWJyZWFrOw0KY2FzZSAyMzQ6DQoJZXhwZWN0ZWRfc2l6ZSA9IHg7DQoJYnJlYWs7
DQpjYXNlIDIzNjoNCmRlZmF1bHQ6DQoJZXhwZWN0ZWRfc2l6ZSA9IHg7DQp9DQoJDQoNCj4gIAkJ
Y29uc3Qgc3RydWN0IGxmcF9iYWNrbGlnaHRfY29udHJvbF9tZXRob2QgKm1ldGhvZDsNCj4gIA0K
PiAgCQltZXRob2QgPSAmYmFja2xpZ2h0X2RhdGEtPmJhY2tsaWdodF9jb250cm9sW3BhbmVsX3R5
cGVdOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF92
YnRfZGVmcy5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF92YnRfZGVmcy5o
DQo+IGluZGV4IDMzMDA3N2MyZTU4OC4uZmZmNDU2YmY4NzgzIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3ZidF9kZWZzLmgNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF92YnRfZGVmcy5oDQo+IEBAIC04MTQsNiArODE0
LDExIEBAIHN0cnVjdCBsZnBfYnJpZ2h0bmVzc19sZXZlbCB7DQo+ICAJdTE2IHJlc2VydmVkOw0K
PiAgfSBfX3BhY2tlZDsNCj4gIA0KPiArLyoNCj4gKyAqIENoYW5naW5nIHN0cnVjdCBiZGJfbGZw
X2JhY2tsaWdodF9kYXRhIG1pZ2h0IGFmZmVjdCBpdHMNCj4gKyAqIHNpemUgY29tcGFyYXRpb24g
dG8gdGhlIHZhbHVlIGhvbGQgaW4gQkRCLg0KPiArICogKGUuZy4gaW4gcGFyc2VfbGZwX2JhY2ts
aWdodCgpKQ0KPiArICovDQoNClRoaXMgaXMgdHJ1ZSBmb3IgYWxsIHRoZSBibG9ja3Mgc28gSSBk
b24ndCB0aGluayB3ZSBuZWVkIHRoaXMgY29tbWVudC4NCg0KPiAgc3RydWN0IGJkYl9sZnBfYmFj
a2xpZ2h0X2RhdGEgew0KPiAgCXU4IGVudHJ5X3NpemU7DQo+ICAJc3RydWN0IGxmcF9iYWNrbGln
aHRfZGF0YV9lbnRyeSBkYXRhWzE2XTsNCg0K
