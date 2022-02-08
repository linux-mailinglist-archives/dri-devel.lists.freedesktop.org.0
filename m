Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2564B4AD881
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 14:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA1E10E36C;
	Tue,  8 Feb 2022 13:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFB210E32E;
 Tue,  8 Feb 2022 13:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644325582; x=1675861582;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Hz/tDemN33s+rgHjOdOGQDPsW+gdZ6F31mZmG9gY28c=;
 b=Aunc/ObHkOyJw4wqtbUamCh9cBLcLlXpu0mE5RJgstIOjxT+G+2S87C7
 UtQtiQp6GNpSwqpzNzzS62KtsUayEODFQW/FIPpcvqc1WRyCcOKBV+2iv
 cjcIPAP7BSLxztULyKtheidhFjG2NqsciO4S2WkpUzOEbt3XaAh41q03n
 e9RCi8dio2jBlgV/Xg301MXN5ibo3EW9tipC855EBnRqwuoaEvQrLeaAf
 AXh9KNKTvPd3RwGr88WFFFpcRf49msrUKXI+0q0qjAPNEH2XMEqT6Z456
 m8lTCElR765s+cHYT28ZFaNX/mmZD2vwi/p/4UsKyzemPjTS6VYnrb5C+ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="273471220"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="273471220"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 05:06:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="621898449"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Feb 2022 05:06:21 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 8 Feb 2022 05:06:20 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 8 Feb 2022 05:06:20 -0800
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.2308.020;
 Tue, 8 Feb 2022 05:06:20 -0800
From: "Souza, Jose" <jose.souza@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "lyude@redhat.com" <lyude@redhat.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/psr: Disable PSR2 selective fetch for all TGL
 steps
Thread-Topic: [PATCH] drm/i915/psr: Disable PSR2 selective fetch for all TGL
 steps
Thread-Index: AQHYHGs84cCIUJlC2Ume2siiSl6AyKyKJykA
Date: Tue, 8 Feb 2022 13:06:20 +0000
Message-ID: <47eed687da699a6abbfd7726439fd307786c9d93.camel@intel.com>
References: <20220207213923.3605-1-lyude@redhat.com>
In-Reply-To: <20220207213923.3605-1-lyude@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <648DFECD201D5E469AA52B10753BF2F5@intel.com>
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
Cc: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, "Mun, 
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>, "Kahola,
 Mika" <mika.kahola@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Hogander, Jouni" <jouni.hogander@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIyLTAyLTA3IGF0IDE2OjM4IC0wNTAwLCBMeXVkZSBQYXVsIHdyb3RlOg0KPiBB
cyB3ZSd2ZSB1bmZvcnR1bmF0ZWx5IHN0YXJ0ZWQgdG8gY29tZSB0byBleHBlY3QgZnJvbSBQU1Ig
b24gSW50ZWwNCj4gcGxhdGZvcm1zLCBQU1IyIHNlbGVjdGl2ZSBmZXRjaCBpcyBub3QgYXQgYWxs
IHJlYWR5IHRvIGJlIGVuYWJsZWQgb24NCj4gVGlnZXJsYWtlIGFzIGl0IHJlc3VsdHMgaW4gc2V2
ZXJlIGZsaWNrZXJpbmcgaXNzdWVzIC0gYXQgbGVhc3Qgb24gdGhpcw0KPiBUaGlua1BhZCBYMSBD
YXJib24gOXRoIGdlbmVyYXRpb24uIFRoZSBlYXNpZXN0IHdheSBJJ3ZlIGZvdW5kIG9mDQo+IHJl
cHJvZHVjaW5nIHRoZXNlIGlzc3VlcyBpcyB0byBqdXN0IG1vdmUgdGhlIGN1cnNvciBhcm91bmQg
dGhlIGxlZnQgYm9yZGVyDQo+IG9mIHRoZSBzY3JlZW4gKHN1c3BpY2lvdXPigKYpLg0KDQpXaGVy
ZSBpcyB0aGUgYnVnIGZvciB0aGF0PyBXaGVyZSBpcyB0aGUgbG9ncz8NCldlIGNhbid0IGdvIGZy
b20gZW5hYmxlZCB0byBkaXNhYmxlZCB3aXRob3V0IGFueSBkZWJ1ZyBhbmQgYmVjYXVzZSBvZiBh
IHNpbmdsZSBkZXZpY2UuDQpJbiB0aGUgbWVhbiB0aW1lIHlvdSBoYXZlIHRoZSBvcHRpb24gdG8g
c2V0IHRoZSBpOTE1IHBhcmFtZXRlciB0byBkaXNhYmxlIGl0Lg0KDQo+IA0KPiBTbywgZml4IHBl
b3BsZSdzIGRpc3BsYXlzIGFnYWluIGFuZCB0dXJuIFBTUjIgc2VsZWN0aXZlIGZldGNoIG9mZiBm
b3IgYWxsDQo+IHN0ZXBwaW5ncyBvZiBUaWdlcmxha2UuIFRoaXMgY2FuIGJlIHJlLWVuYWJsZWQg
YWdhaW4gaWYgc29tZW9uZSBmcm9tIEludGVsDQo+IGZpbmRzIHRoZSB0aW1lIHRvIGZpeCB0aGlz
IGZ1bmN0aW9uYWxpdHkgb24gT0VNIG1hY2hpbmVzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTHl1
ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4NCj4gRml4ZXM6IDdmNjAwMmU1ODAyNSAoImRybS9p
OTE1L2Rpc3BsYXk6IEVuYWJsZSBQU1IyIHNlbGVjdGl2ZSBmZXRjaCBieSBkZWZhdWx0IikNCj4g
Q2M6IEd3YW4tZ3llb25nIE11biA8Z3dhbi1neWVvbmcubXVuQGludGVsLmNvbT4NCj4gQ2M6IFZp
bGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBKb3PD
qSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4gQ2M6IEphbmkgTmlr
dWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBSb2RyaWdvIFZpdmkgPHJv
ZHJpZ28udml2aUBpbnRlbC5jb20+DQo+IENjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyB2NS4xNisNCj4gLS0tDQo+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jIHwgMTAgKysrKysrKy0tLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiBpbmRleCBhMWE2NjNm
MzYyZTcuLjI1YzE2YWJjZDljZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9wc3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX3Bzci5jDQo+IEBAIC03MzcsMTAgKzczNywxNCBAQCBzdGF0aWMgYm9vbCBpbnRlbF9w
c3IyX3NlbF9mZXRjaF9jb25maWdfdmFsaWQoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCwNCj4g
IAkJcmV0dXJuIGZhbHNlOw0KPiAgCX0NCj4gIA0KPiAtCS8qIFdhXzE0MDEwMjU0MTg1IFdhXzE0
MDEwMTAzNzkyICovDQo+IC0JaWYgKElTX1RHTF9ESVNQTEFZX1NURVAoZGV2X3ByaXYsIFNURVBf
QTAsIFNURVBfQzApKSB7DQo+ICsJLyoNCj4gKwkgKiBUaGVyZSdzIHR3byB0aGluZ3Mgc3RvcHBp
bmcgdGhpcyBmcm9tIGJlaW5nIGVuYWJsZWQgb24gVEdMOg0KPiArCSAqIEZvciBzdGVwcyBBMC1D
MDogd29ya2Fyb3VuZHMgV2FfMTQwMTAyNTQxODUgV2FfMTQwMTAxMDM3OTIgYXJlIG1pc3NpbmcN
Cj4gKwkgKiBGb3IgYWxsIHN0ZXBzOiBQU1IyIHNlbGVjdGl2ZSBmZXRjaCBjYXVzZXMgc2NyZWVu
IGZsaWNrZXJpbmcNCj4gKwkgKi8NCj4gKwlpZiAoSVNfVElHRVJMQUtFKGRldl9wcml2KSkgew0K
PiAgCQlkcm1fZGJnX2ttcygmZGV2X3ByaXYtPmRybSwNCj4gLQkJCSAgICAiUFNSMiBzZWwgZmV0
Y2ggbm90IGVuYWJsZWQsIG1pc3NpbmcgdGhlIGltcGxlbWVudGF0aW9uIG9mIFdBc1xuIik7DQo+
ICsJCQkgICAgIlBTUjIgc2VsIGZldGNoIG5vdCBlbmFibGVkLCBjdXJyZW50bHkgYnJva2VuIG9u
IFRHTFxuIik7DQo+ICAJCXJldHVybiBmYWxzZTsNCj4gIAl9DQo+ICANCg0K
