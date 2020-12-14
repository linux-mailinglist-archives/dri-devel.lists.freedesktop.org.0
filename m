Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 871C72D9532
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 10:27:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB68B6E041;
	Mon, 14 Dec 2020 09:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34F26E041;
 Mon, 14 Dec 2020 09:27:34 +0000 (UTC)
IronPort-SDR: i5GVjcJeaK5nbxfkYi9LFtNlbTcWul33K8QEChwUJMKoY3PfKR9iJ6h3HYLZTEsjsvSG5XnaOk
 lh8LKG03WJ6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="236265621"
X-IronPort-AV: E=Sophos;i="5.78,418,1599548400"; d="scan'208";a="236265621"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 01:27:33 -0800
IronPort-SDR: FhTEd8K75NAU0AsJAimdHTX0atzXhyOSgSeUp2r1JynWkjp67x0G0hbeIRh0OR0N/TYQJEPmNk
 PTZm4L7oPgmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,418,1599548400"; d="scan'208";a="340885260"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 14 Dec 2020 01:27:33 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 14 Dec 2020 01:27:32 -0800
Received: from irsmsx605.ger.corp.intel.com (163.33.146.138) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 14 Dec 2020 01:27:31 -0800
Received: from irsmsx605.ger.corp.intel.com ([163.33.146.138]) by
 IRSMSX605.ger.corp.intel.com ([163.33.146.138]) with mapi id 15.01.1713.004;
 Mon, 14 Dec 2020 09:27:30 +0000
From: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
To: "contact@emersion.fr" <contact@emersion.fr>, "Souza, Jose"
 <jose.souza@intel.com>
Subject: Re: [PATCH v5 1/6] drm/damage_helper: Check if damage clips has valid
 values
Thread-Topic: [PATCH v5 1/6] drm/damage_helper: Check if damage clips has
 valid values
Thread-Index: AQHW0X9Gr/cR7evlbk+HOyw3iTFWrqn2SsSAgAAI0wA=
Date: Mon, 14 Dec 2020 09:27:30 +0000
Message-ID: <636492279d31fc14d8dc7dd336bb1afe2a894eaa.camel@intel.com>
References: <20201213183930.349592-1-jose.souza@intel.com>
 <Mc9Acjxtl9hCv_yd6qeDG8VXAC5-I18UkQYV4xPBAIv-K1QJt_gwTg1WJQjKdD5f3Yfoq6kElbFxFx8HNnHJ3vqX9ztgdL7o_9aGtwAYLZk=@emersion.fr>
In-Reply-To: <Mc9Acjxtl9hCv_yd6qeDG8VXAC5-I18UkQYV4xPBAIv-K1QJt_gwTg1WJQjKdD5f3Yfoq6kElbFxFx8HNnHJ3vqX9ztgdL7o_9aGtwAYLZk=@emersion.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.253.164]
Content-ID: <7D6F3634CFF8B04DA8A3455B45EAE747@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "drawat@vmware.com" <drawat@vmware.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIwLTEyLTE0IGF0IDA4OjU1ICswMDAwLCBTaW1vbiBTZXIgd3JvdGU6DQo+ID4g
VXNlcnNwYWNlIGNhbiBzZXQgYSBkYW1hZ2UgY2xpcCB3aXRoIGEgbmVnYXRpdmUgY29vcmRpbmF0
ZSwNCj4gPiBuZWdhdGl2ZQ0KPiA+IHdpZHRoIG9yIGhlaWdodCBvciBsYXJnZXIgdGhhbiB0aGUg
cGxhbmUuDQo+ID4gVGhpcyBpbnZhbGlkIHZhbHVlcyBjb3VsZCBjYXVzZSBpc3N1ZXMgaW4gc29t
ZSBIVyBvciBldmVuIHdvcnN0DQo+ID4gZW5hYmxlDQo+ID4gc2VjdXJpdHkgZmxhd3MuDQo+ID4g
DQo+ID4gdjI6DQo+ID4gLSBhZGQgZGVidWcgbWVzc2FnZXMgdG8gbGV0IHVzZXJzcGFjZSBrbm93
IHdoeSBhdG9taWMgY29tbWl0IGZhaWxlZA0KPiA+IGR1ZSBpbnZhbGlkIGRhbWFnZSBjbGlwcw0K
PiA+IA0KPiA+IENjOiBTaW1vbiBTZXIgPGNvbnRhY3RAZW1lcnNpb24uZnI+DQo+ID4gQ2M6IEd3
YW4tZ3llb25nIE11biA8Z3dhbi1neWVvbmcubXVuQGludGVsLmNvbT4NCj4gPiBDYzogU2VhbiBQ
YXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+DQo+ID4gQ2M6IEZhYmlvIEVzdGV2YW0gPGZlc3Rl
dmFtQGdtYWlsLmNvbT4NCj4gPiBDYzogRGVlcGFrIFJhd2F0IDxkcmF3YXRAdm13YXJlLmNvbT4N
Cj4gPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiANCj4g
QWZ0ZXIgbG9va2luZyBhdCB0aGUga2VybmVsIGNvZGUsIGl0IHNlZW1zIGxpa2UgdGhlIGtlcm5l
bCBhbHJlYWR5DQo+IGNoZWNrcyBmb3INCj4gYWxsIG9mIHRoYXQgaW4gZHJtX2F0b21pY19wbGFu
ZV9jaGVjay4gQXJlIHlvdSBhd2FyZSBvZiB0aGlzPw0KPiANCj4gPiArCXcgPSBkcm1fcmVjdF93
aWR0aCgmcGxhbmVfc3RhdGUtPnNyYykgPj4gMTY7DQo+ID4gKwloID0gZHJtX3JlY3RfaGVpZ2h0
KCZwbGFuZV9zdGF0ZS0+c3JjKSA+PiAxNjsNCj4gDQo+IFRoZSBkb2NzIHNheSB0aGlzIHNob3Vs
ZCBiZSBpbiBGQiBjb29yZGluYXRlcywgbm90IGluIFNSQ18qDQo+IGNvb3JkaW5hdGVzLiBTbyB3
ZQ0KPiBzaG91bGRuJ3QgbmVlZCB0byBjaGVjayBhbnkgU1JDXyogcHJvcCBoZXJlLg0KPiANCkkg
YWdyZWUgdGhlIFNpbW9uJ3Mgb3Bpbmlvbi4gaXQgZG9lcyBjaGVjayBiZXR3ZWVuIHBsYW5lJ3Mg
ZnJhbWUgYnVmZmVyDQpzcmMgZ2VvbWV0cnkgYW5kIGRhbWFnZSBjbGlwcy4gKFBsYW5lJ3MgZGFt
YWdlIGNsaXAgbWlnaHQgZXhpc3Qgb3V0c2lkZQ0Kb2YgZmIgc3JjIGdlb21ldHJ5LikNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
