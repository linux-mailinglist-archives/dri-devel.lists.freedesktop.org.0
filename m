Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCAFB64E6
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 15:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500A46F38D;
	Wed, 18 Sep 2019 13:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B67C6F38A;
 Wed, 18 Sep 2019 13:42:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Sep 2019 06:42:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,520,1559545200"; d="scan'208";a="386890923"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
 by fmsmga005.fm.intel.com with ESMTP; 18 Sep 2019 06:42:10 -0700
Received: from irsmsx156.ger.corp.intel.com (10.108.20.68) by
 IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 18 Sep 2019 14:42:10 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.164]) by
 IRSMSX156.ger.corp.intel.com ([169.254.3.246]) with mapi id 14.03.0439.000;
 Wed, 18 Sep 2019 14:42:10 +0100
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 02/19] drm/atomic-helper: Make crtc helper funcs optional
Thread-Topic: [PATCH 02/19] drm/atomic-helper: Make crtc helper funcs optional
Thread-Index: AQHVNYwsacvXes86iUiq9ZU3YM212acx0UCA
Date: Wed, 18 Sep 2019 13:42:09 +0000
Message-ID: <2d3861a00c99bb3aca18897b7cbfadd3930b843a.camel@intel.com>
References: <20190708125325.16576-1-ville.syrjala@linux.intel.com>
 <20190708125325.16576-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20190708125325.16576-3-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.89]
Content-ID: <BAAF57BFDC0BC341B2B38A3F0969E122@intel.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTA3LTA4IGF0IDE1OjUzICswMzAwLCBWaWxsZSBTeXJqYWxhIHdyb3RlOg0K
PiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0K
PiANCj4gQWxsb3cgZHJpdmVycyB0byBjYWxsIGRybV9hdG9taWNfaGVscGVyX2NoZWNrX21vZGVz
ZXQoKSB3aXRob3V0DQo+IGhhdmluZyB0aGUgY3J0YyBoZWxwZXIgZnVuY3Mgc3BlY2lmaWVkLiBp
OTE1IGRvZXNuJ3QgbmVlZCB0aG9zZQ0KPiBhbnltb3JlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
VmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYyB8IDIgKy0NCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpSZXZpZXdlZC1ieTogU3Rh
bmlzbGF2IExpc292c2tpeSA8c3RhbmlzbGF2Lmxpc292c2tpeUBpbnRlbC5jb20+DQoNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYw0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jDQo+IGluZGV4IGFhMTZlYTE3ZmY5Yi4u
ZmIyY2U2OTJhZTViIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19o
ZWxwZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYw0KPiBA
QCAtNDgxLDcgKzQ4MSw3IEBAIG1vZGVfZml4dXAoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0
YXRlKQ0KPiAgCQkJY29udGludWU7DQo+ICANCj4gIAkJZnVuY3MgPSBjcnRjLT5oZWxwZXJfcHJp
dmF0ZTsNCj4gLQkJaWYgKCFmdW5jcy0+bW9kZV9maXh1cCkNCj4gKwkJaWYgKCFmdW5jcyB8fCAh
ZnVuY3MtPm1vZGVfZml4dXApDQo+ICAJCQljb250aW51ZTsNCj4gIA0KPiAgCQlyZXQgPSBmdW5j
cy0+bW9kZV9maXh1cChjcnRjLCAmbmV3X2NydGNfc3RhdGUtPm1vZGUsDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
