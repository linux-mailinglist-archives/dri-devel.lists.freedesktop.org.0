Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B80E41CB68
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 20:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543136EAC2;
	Wed, 29 Sep 2021 18:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351D86EAC2;
 Wed, 29 Sep 2021 18:01:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="225076743"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="225076743"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 11:01:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="538941656"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 29 Sep 2021 11:01:38 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 29 Sep 2021 11:01:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 29 Sep 2021 11:01:37 -0700
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.2242.012;
 Wed, 29 Sep 2021 11:01:37 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "Lee, Shawn C" <shawn.c.lee@intel.com>, "lma@semihalf.com"
 <lma@semihalf.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "upstream@semihalf.com" <upstream@semihalf.com>
Subject: Re: [PATCH v2] drm/i915/bdb: Fix version check
Thread-Topic: [PATCH v2] drm/i915/bdb: Fix version check
Thread-Index: AQHXsJslJKGByj7D8U+Chyb8uNmROqu7zdcA
Date: Wed, 29 Sep 2021 18:01:37 +0000
Message-ID: <63d01fefc3068267b9115513020a1cbd9e64a5e2.camel@intel.com>
References: <20210923164927.55896-1-lma@semihalf.com>
In-Reply-To: <20210923164927.55896-1-lma@semihalf.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="utf-8"
Content-ID: <13ECAED0D08ADE43A601A3DD505FC4CD@intel.com>
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

T24gVGh1LCAyMDIxLTA5LTIzIGF0IDE4OjQ5ICswMjAwLCBMdWthc3ogTWFqY3phayB3cm90ZToN
Cj4gV2l0aCBwYXRjaCAiZHJtL2k5MTUvdmJ0OiBGaXggYmFja2xpZ2h0IHBhcnNpbmcgZm9yIFZC
VCAyMzQrIg0KPiB0aGUgc2l6ZSBvZiBiZGJfbGZwX2JhY2tsaWdodF9kYXRhIHN0cnVjdHVyZSBo
YXMgYmVlbiBpbmNyZWFzZWQsDQo+IGNhdXNpbmcgaWYtc3RhdGVtZW50IGluIHRoZSBwYXJzZV9s
ZnBfYmFja2xpZ2h0IGZ1bmN0aW9uDQo+IHRoYXQgY29tYXByZXMgdGhpcyBzdHJ1Y3R1cmUgc2l6
ZSB0byB0aGUgb25lIHJldHJpZXZlZCBmcm9tIEJEQiwNCj4gYWx3YXlzIHRvIGZhaWwgZm9yIG9s
ZGVyIHJldmlzaW9ucy4NCj4gVGhpcyBwYXRjaCBjYWxjdWxhdGVzIGV4cGVjdGVkIHNpemUgb2Yg
dGhlIHN0cnVjdHVyZSBmb3IgYSBnaXZlbg0KPiBCREIgdmVyc2lvbiBhbmQgY29tcGFyZXMgaXQg
d2l0aCB0aGUgdmFsdWUgZ2F0aGVyZWQgZnJvbSBCREIuDQo+IFRlc3RlZCBvbiBDaHJvbWVib29r
IFBpeGVsYm9vayAoTm9jdHVybmUpIChyZXBvcnRzIGJkYi0+dmVyc2lvbiA9IDIyMSkNCg0KRml4
ZXM6IGQzODFiYWFkMjliNCAoImRybS9pOTE1L3ZidDogRml4IGJhY2tsaWdodCBwYXJzaW5nIGZv
ciBWQlQgMjM0KyIpDQoNCj4gDQo+IFRlc3RlZC1ieTogTHVrYXN6IE1hamN6YWsgPGxtYUBzZW1p
aGFsZi5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEx1a2FzeiBNYWpjemFrIDxsbWFAc2VtaWhhbGYu
Y29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYmlvcy5j
ICAgICB8IDExICsrKysrKysrKy0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX3ZidF9kZWZzLmggfCAgNSArKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfYmlvcy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9iaW9zLmMNCj4gaW5kZXggM2MyNTkyNjA5MmRlLi45MGVhZTZkYTEyZTAgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYmlvcy5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYmlvcy5jDQo+IEBAIC00Mjgs
NiArNDI4LDcgQEAgcGFyc2VfbGZwX2JhY2tsaWdodChzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAq
aTkxNSwNCj4gIAljb25zdCBzdHJ1Y3QgbGZwX2JhY2tsaWdodF9kYXRhX2VudHJ5ICplbnRyeTsN
Cj4gIAlpbnQgcGFuZWxfdHlwZSA9IGk5MTUtPnZidC5wYW5lbF90eXBlOw0KPiAgCXUxNiBsZXZl
bDsNCj4gKwlzaXplX3QgZXhwX3NpemU7DQo+ICANCj4gIAliYWNrbGlnaHRfZGF0YSA9IGZpbmRf
c2VjdGlvbihiZGIsIEJEQl9MVkRTX0JBQ0tMSUdIVCk7DQo+ICAJaWYgKCFiYWNrbGlnaHRfZGF0
YSkNCj4gQEAgLTQ1MCw5ICs0NTEsMTUgQEAgcGFyc2VfbGZwX2JhY2tsaWdodChzdHJ1Y3QgZHJt
X2k5MTVfcHJpdmF0ZSAqaTkxNSwNCj4gIAkJcmV0dXJuOw0KPiAgCX0NCj4gIA0KPiArCWlmIChi
ZGItPnZlcnNpb24gPD0gMjM0KQ0KPiArCQlleHBfc2l6ZSA9IEVYUF9CREJfTEZQX0JMX0RBVEFf
U0laRV9SRVZfMjM0Ow0KPiArCWVsc2UgaWYgKGJkYi0+dmVyc2lvbiA+IDIzNCAmJiBiZGItPnZl
cnNpb24gPD0gMjM2KQ0KPiArCQlleHBfc2l6ZSA9IEVYUF9CREJfTEZQX0JMX0RBVEFfU0laRV9S
RVZfMjM2Ow0KPiArCWVsc2UNCj4gKwkJZXhwX3NpemUgPSBzaXplb2Yoc3RydWN0IGJkYl9sZnBf
YmFja2xpZ2h0X2RhdGEpOw0KDQpVc3VhbGx5IHdlIGdvIGJ5IHRoZSBuZXdlc3QoSVAgdmVyc2lv
biwgcGxhdGZvcm0uLi4pIHRvIHRoZSBvbGRlc3Q6DQoNCg0KaWYgKGJkYi0+dmVyc2lvbiA+PSAy
MzYpDQoJZXhwX3NpemUgPSBzaXplb2Yoc3RydWN0IGJkYl9sZnBfYmFja2xpZ2h0X2RhdGEpOw0K
ZWxzZSBpZiAoYmRiLT52ZXJzaW9uID49IDIzNCkNCglleHBfc2l6ZSA9IG9mZnNldG9mKHN0cnVj
dCBiZGJfbGZwX2JhY2tsaWdodF9kYXRhLCBicmlnaHRuZXNzX3ByZWNpc2lvbl9iaXRzKTsNCmVs
c2UNCglleHBfc2l6ZSA9IG9mZnNldG9mKHN0cnVjdCBiZGJfbGZwX2JhY2tsaWdodF9kYXRhLCBi
cmlnaHRuZXNzX2xldmVsKTsNCg0KDQpiYWNrbGlnaHRfY29udHJvbCB3YXMgYWRkZWQgaW4gdmVy
c2lvbiAxOTEgc28gbm8gbmVlZCB0byBzZXQgZXhwX3NpemUgZm9yIG9sZGVyIHZlcnNpb25zLg0K
DQo+ICsNCj4gIAlpOTE1LT52YnQuYmFja2xpZ2h0LnR5cGUgPSBJTlRFTF9CQUNLTElHSFRfRElT
UExBWV9EREk7DQo+IC0JaWYgKGJkYi0+dmVyc2lvbiA+PSAxOTEgJiYNCj4gLQkgICAgZ2V0X2Js
b2Nrc2l6ZShiYWNrbGlnaHRfZGF0YSkgPj0gc2l6ZW9mKCpiYWNrbGlnaHRfZGF0YSkpIHsNCj4g
KwlpZiAoYmRiLT52ZXJzaW9uID49IDE5MSAgJiYgZ2V0X2Jsb2Nrc2l6ZShiYWNrbGlnaHRfZGF0
YSkgPj0gZXhwX3NpemUpIHsNCj4gIAkJY29uc3Qgc3RydWN0IGxmcF9iYWNrbGlnaHRfY29udHJv
bF9tZXRob2QgKm1ldGhvZDsNCj4gIA0KPiAgCQltZXRob2QgPSAmYmFja2xpZ2h0X2RhdGEtPmJh
Y2tsaWdodF9jb250cm9sW3BhbmVsX3R5cGVdOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF92YnRfZGVmcy5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF92YnRfZGVmcy5oDQo+IGluZGV4IDMzMDA3N2MyZTU4OC4uYmE5OTkwZTU5
ODNjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Zi
dF9kZWZzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF92YnRf
ZGVmcy5oDQo+IEBAIC04MTQsNiArODE0LDExIEBAIHN0cnVjdCBsZnBfYnJpZ2h0bmVzc19sZXZl
bCB7DQo+ICAJdTE2IHJlc2VydmVkOw0KPiAgfSBfX3BhY2tlZDsNCj4gIA0KPiArI2RlZmluZSBF
WFBfQkRCX0xGUF9CTF9EQVRBX1NJWkVfUkVWXzIzNCBcDQo+ICsJb2Zmc2V0b2Yoc3RydWN0IGJk
Yl9sZnBfYmFja2xpZ2h0X2RhdGEsIGJyaWdodG5lc3NfbGV2ZWwpDQoNCnZlcnNpb24gMjM0IHN0
YXJ0cyBhdCBicmlnaHRuZXNzX2xldmVsIGJ1dCB0aGUgc2l6ZSBvZiAyMzQgZGF0YSBtdXN0IGJl
IGluY2x1ZGVkIHRvIHRoZSBzaXplLCBzbyBpdCBzaG91bGQgYmU6DQpvZmZzZXRvZihzdHJ1Y3Qg
YmRiX2xmcF9iYWNrbGlnaHRfZGF0YSwgYnJpZ2h0bmVzc19wcmVjaXNpb25fYml0cykuDQoNCj4g
KyNkZWZpbmUgRVhQX0JEQl9MRlBfQkxfREFUQV9TSVpFX1JFVl8yMzYgXA0KPiArCW9mZnNldG9m
KHN0cnVjdCBiZGJfbGZwX2JhY2tsaWdodF9kYXRhLCBicmlnaHRuZXNzX3ByZWNpc2lvbl9iaXRz
KQ0KDQo+ICsNCj4gIHN0cnVjdCBiZGJfbGZwX2JhY2tsaWdodF9kYXRhIHsNCj4gIAl1OCBlbnRy
eV9zaXplOw0KPiAgCXN0cnVjdCBsZnBfYmFja2xpZ2h0X2RhdGFfZW50cnkgZGF0YVsxNl07DQoN
Cg==
