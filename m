Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6203F41E054
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 19:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778DD6EC3D;
	Thu, 30 Sep 2021 17:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C733B6EC3C;
 Thu, 30 Sep 2021 17:46:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="310794646"
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="310794646"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 10:46:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="480030969"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga007.fm.intel.com with ESMTP; 30 Sep 2021 10:46:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 30 Sep 2021 10:46:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 30 Sep 2021 10:46:42 -0700
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.2242.012;
 Thu, 30 Sep 2021 10:46:42 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "Lee, Shawn C" <shawn.c.lee@intel.com>, "lma@semihalf.com"
 <lma@semihalf.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "upstream@semihalf.com" <upstream@semihalf.com>
Subject: Re: [PATCH v3] drm/i915/bdb: Fix version check
Thread-Topic: [PATCH v3] drm/i915/bdb: Fix version check
Thread-Index: AQHXtgGjDfzAwfZauEeUdhGWmVUDrau9UTUA
Date: Thu, 30 Sep 2021 17:46:42 +0000
Message-ID: <50871c947a53edc1eb7c9e331ae5ce076f789255.camel@intel.com>
References: <20210930134606.227234-1-lma@semihalf.com>
In-Reply-To: <20210930134606.227234-1-lma@semihalf.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="utf-8"
Content-ID: <8659DB52DF298F4BAF50970DF5CB551D@intel.com>
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

T24gVGh1LCAyMDIxLTA5LTMwIGF0IDE1OjQ2ICswMjAwLCBMdWthc3ogTWFqY3phayB3cm90ZToN
Cj4gV2l0aCBwYXRjaCAiZHJtL2k5MTUvdmJ0OiBGaXggYmFja2xpZ2h0IHBhcnNpbmcgZm9yIFZC
VCAyMzQrIg0KPiB0aGUgc2l6ZSBvZiBiZGJfbGZwX2JhY2tsaWdodF9kYXRhIHN0cnVjdHVyZSBo
YXMgYmVlbiBpbmNyZWFzZWQsDQo+IGNhdXNpbmcgaWYtc3RhdGVtZW50IGluIHRoZSBwYXJzZV9s
ZnBfYmFja2xpZ2h0IGZ1bmN0aW9uDQo+IHRoYXQgY29tYXByZXMgdGhpcyBzdHJ1Y3R1cmUgc2l6
ZSB0byB0aGUgb25lIHJldHJpZXZlZCBmcm9tIEJEQiwNCj4gYWx3YXlzIHRvIGZhaWwgZm9yIG9s
ZGVyIHJldmlzaW9ucy4NCj4gVGhpcyBwYXRjaCBjYWxjdWxhdGVzIGV4cGVjdGVkIHNpemUgb2Yg
dGhlIHN0cnVjdHVyZSBmb3IgYSBnaXZlbg0KPiBCREIgdmVyc2lvbiBhbmQgY29tcGFyZXMgaXQg
d2l0aCB0aGUgdmFsdWUgZ2F0aGVyZWQgZnJvbSBCREIuDQo+IFRlc3RlZCBvbiBDaHJvbWVib29r
IFBpeGVsYm9vayAoTm9jdHVybmUpIChyZXBvcnRzIGJkYi0+dmVyc2lvbiA9IDIyMSkNCg0KUmV2
aWV3ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0K
DQo+IA0KPiBUZXN0ZWQtYnk6IEx1a2FzeiBNYWpjemFrIDxsbWFAc2VtaWhhbGYuY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBMdWthc3ogTWFqY3phayA8bG1hQHNlbWloYWxmLmNvbT4NCj4gLS0tDQo+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Jpb3MuYyAgICAgfCAyMiArKysr
KysrKysrKysrKy0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Zi
dF9kZWZzLmggfCAgNSArKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfYmlvcy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9iaW9zLmMNCj4gaW5kZXggM2MyNTkyNjA5MmRlLi5mOTc3NmNhODVkZTMgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYmlvcy5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYmlvcy5jDQo+IEBAIC00NTEsMTMgKzQ1
MSwyMyBAQCBwYXJzZV9sZnBfYmFja2xpZ2h0KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1
LA0KPiAgCX0NCj4gIA0KPiAgCWk5MTUtPnZidC5iYWNrbGlnaHQudHlwZSA9IElOVEVMX0JBQ0tM
SUdIVF9ESVNQTEFZX0RESTsNCj4gLQlpZiAoYmRiLT52ZXJzaW9uID49IDE5MSAmJg0KPiAtCSAg
ICBnZXRfYmxvY2tzaXplKGJhY2tsaWdodF9kYXRhKSA+PSBzaXplb2YoKmJhY2tsaWdodF9kYXRh
KSkgew0KPiAtCQljb25zdCBzdHJ1Y3QgbGZwX2JhY2tsaWdodF9jb250cm9sX21ldGhvZCAqbWV0
aG9kOw0KPiArCWlmIChiZGItPnZlcnNpb24gPj0gMTkxKSB7DQo+ICsJCXNpemVfdCBleHBfc2l6
ZTsNCj4gIA0KPiAtCQltZXRob2QgPSAmYmFja2xpZ2h0X2RhdGEtPmJhY2tsaWdodF9jb250cm9s
W3BhbmVsX3R5cGVdOw0KPiAtCQlpOTE1LT52YnQuYmFja2xpZ2h0LnR5cGUgPSBtZXRob2QtPnR5
cGU7DQo+IC0JCWk5MTUtPnZidC5iYWNrbGlnaHQuY29udHJvbGxlciA9IG1ldGhvZC0+Y29udHJv
bGxlcjsNCj4gKwkJaWYgKGJkYi0+dmVyc2lvbiA+PSAyMzYpDQo+ICsJCQlleHBfc2l6ZSA9IHNp
emVvZihzdHJ1Y3QgYmRiX2xmcF9iYWNrbGlnaHRfZGF0YSk7DQo+ICsJCWVsc2UgaWYgKGJkYi0+
dmVyc2lvbiA+PSAyMzQpDQo+ICsJCQlleHBfc2l6ZSA9IEVYUF9CREJfTEZQX0JMX0RBVEFfU0la
RV9SRVZfMjM0Ow0KPiArCQllbHNlDQo+ICsJCQlleHBfc2l6ZSA9IEVYUF9CREJfTEZQX0JMX0RB
VEFfU0laRV9SRVZfMTkxOw0KPiArDQo+ICsJCWlmIChnZXRfYmxvY2tzaXplKGJhY2tsaWdodF9k
YXRhKSA+PSBleHBfc2l6ZSkgew0KPiArCQkJY29uc3Qgc3RydWN0IGxmcF9iYWNrbGlnaHRfY29u
dHJvbF9tZXRob2QgKm1ldGhvZDsNCj4gKw0KPiArCQkJbWV0aG9kID0gJmJhY2tsaWdodF9kYXRh
LT5iYWNrbGlnaHRfY29udHJvbFtwYW5lbF90eXBlXTsNCj4gKwkJCWk5MTUtPnZidC5iYWNrbGln
aHQudHlwZSA9IG1ldGhvZC0+dHlwZTsNCj4gKwkJCWk5MTUtPnZidC5iYWNrbGlnaHQuY29udHJv
bGxlciA9IG1ldGhvZC0+Y29udHJvbGxlcjsNCj4gKwkJfQ0KPiAgCX0NCj4gIA0KPiAgCWk5MTUt
PnZidC5iYWNrbGlnaHQucHdtX2ZyZXFfaHogPSBlbnRyeS0+cHdtX2ZyZXFfaHo7DQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3ZidF9kZWZzLmggYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3ZidF9kZWZzLmgNCj4gaW5kZXggMzMw
MDc3YzJlNTg4Li5hMjEwOGE4ZjU0NGQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfdmJ0X2RlZnMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX3ZidF9kZWZzLmgNCj4gQEAgLTgxNCw2ICs4MTQsMTEgQEAgc3RydWN0
IGxmcF9icmlnaHRuZXNzX2xldmVsIHsNCj4gIAl1MTYgcmVzZXJ2ZWQ7DQo+ICB9IF9fcGFja2Vk
Ow0KPiAgDQo+ICsjZGVmaW5lIEVYUF9CREJfTEZQX0JMX0RBVEFfU0laRV9SRVZfMTkxIFwNCj4g
KwlvZmZzZXRvZihzdHJ1Y3QgYmRiX2xmcF9iYWNrbGlnaHRfZGF0YSwgYnJpZ2h0bmVzc19sZXZl
bCkNCj4gKyNkZWZpbmUgRVhQX0JEQl9MRlBfQkxfREFUQV9TSVpFX1JFVl8yMzQgXA0KPiArCW9m
ZnNldG9mKHN0cnVjdCBiZGJfbGZwX2JhY2tsaWdodF9kYXRhLCBicmlnaHRuZXNzX3ByZWNpc2lv
bl9iaXRzKQ0KPiArDQo+ICBzdHJ1Y3QgYmRiX2xmcF9iYWNrbGlnaHRfZGF0YSB7DQo+ICAJdTgg
ZW50cnlfc2l6ZTsNCj4gIAlzdHJ1Y3QgbGZwX2JhY2tsaWdodF9kYXRhX2VudHJ5IGRhdGFbMTZd
Ow0KDQo=
