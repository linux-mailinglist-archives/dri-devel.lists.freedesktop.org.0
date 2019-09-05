Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B3BA9ABF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 08:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559B989D00;
	Thu,  5 Sep 2019 06:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CD689D00;
 Thu,  5 Sep 2019 06:38:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Sep 2019 23:38:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,469,1559545200"; d="scan'208";a="334461909"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
 by orsmga004.jf.intel.com with ESMTP; 04 Sep 2019 23:38:32 -0700
Received: from irsmsx106.ger.corp.intel.com ([169.254.8.187]) by
 IRSMSX102.ger.corp.intel.com ([169.254.2.160]) with mapi id 14.03.0439.000;
 Thu, 5 Sep 2019 07:38:31 +0100
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 02/19] drm/atomic-helper: Make crtc helper funcs optional
Thread-Topic: [PATCH 02/19] drm/atomic-helper: Make crtc helper funcs optional
Thread-Index: AQHVNYwsacvXes86iUiq9ZU3YM212acc7JgA
Date: Thu, 5 Sep 2019 06:38:30 +0000
Message-ID: <c6a71b0cc71d4be43e2e650a95ec2e7259e7e61c.camel@intel.com>
References: <20190708125325.16576-1-ville.syrjala@linux.intel.com>
 <20190708125325.16576-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20190708125325.16576-3-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.89]
Content-ID: <F1585C1BC38F114CA4A602D3DA33C55E@intel.com>
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
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jDQo+IGIvZHJpdmVycy9ncHUvZHJt
L2RybV9hdG9taWNfaGVscGVyLmMNCj4gaW5kZXggYWExNmVhMTdmZjliLi5mYjJjZTY5MmFlNWIg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jDQo+IEBAIC00ODEsNyArNDgx
LDcgQEAgbW9kZV9maXh1cChzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpDQo+ICAJCQlj
b250aW51ZTsNCj4gIA0KPiAgCQlmdW5jcyA9IGNydGMtPmhlbHBlcl9wcml2YXRlOw0KPiAtCQlp
ZiAoIWZ1bmNzLT5tb2RlX2ZpeHVwKQ0KPiArCQlpZiAoIWZ1bmNzIHx8ICFmdW5jcy0+bW9kZV9m
aXh1cCkNCj4gIAkJCWNvbnRpbnVlOw0KPiAgDQo+ICAJCXJldCA9IGZ1bmNzLT5tb2RlX2ZpeHVw
KGNydGMsICZuZXdfY3J0Y19zdGF0ZS0+bW9kZSwNCg0KQnV0IGl0IHN0aWxsIHdvbid0IGFsbG93
IHRvIGNhbGwgYW55dGhpbmcgZnJvbSBoZXJlLCBpZiBubyBmdW5jcyBvciBubw0KbW9kZV9maXh1
cCBpcyBzcGVjaWZpZWQuIEFueXdheSBzZWVtcyB0byBiZSBhIGdvb2QgaWRlYSB0byBjaGVjayBi
b3RoDQpmdW5jcyBvciBmdW5jcy0+bW9kZV9maXh1cCBiZWluZyBOVUxMLCBqdXN0IGRvbid0IGdl
dCB0aGUgY29tbWl0DQptZXNzYWdlIGEgYml0IDopDQoNCg0KLSBTdGFuaXNsYXYNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
