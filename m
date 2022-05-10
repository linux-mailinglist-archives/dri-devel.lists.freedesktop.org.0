Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A711522460
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 20:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECAA10ECF2;
	Tue, 10 May 2022 18:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A59A10ECF2;
 Tue, 10 May 2022 18:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652208737; x=1683744737;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=AGj9iSK1MmMQbvrcb0CN+a9bj2Ag6d2t021Zost7m9k=;
 b=V4yLx08UtRMPWq2zeEWnnDHOlHk6GpPiK8oeHGojV8SylX/VZt9KvTwU
 spKzr+9Xhlw2m6BO6g0v5OKXlx98/HYjX+3CLQgF/r7rxIfwZ9p+3HuoX
 mYahuAx5jhjpBObh1xiiNhENcCOMZRnAX3u0Z7IEcCeCBoXktm2ztK8Kt
 BazVVsvT/Fl+l3Enthov9RQvVSbsuuN+tStbU8VNKdfD9Ru2LA4EqDhrb
 7au8VUUu4qP4HxFIZN4b7d+yfMlTk9n0EKfBWFWpECgD6d0612Q4ZuUxT
 gtugX7aUc7pvHOxy/S5rRg7VTDSp3P1YYer2xNDVyCs3PEqOpPOCRDc8K w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="355900518"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="355900518"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 11:52:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="541930676"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga006.jf.intel.com with ESMTP; 10 May 2022 11:52:16 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 11:52:15 -0700
Received: from fmsmsx612.amr.corp.intel.com ([10.18.126.92]) by
 fmsmsx612.amr.corp.intel.com ([10.18.126.92]) with mapi id 15.01.2308.027;
 Tue, 10 May 2022 11:52:15 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>
Subject: Re: [PATCH v3 2/3] drm/i915/psr: Use full update In case of area
 calculation fails
Thread-Topic: [PATCH v3 2/3] drm/i915/psr: Use full update In case of area
 calculation fails
Thread-Index: AQHYZJx2sPFF5WymVkOKY2tm1VmNS60Y6kAA
Date: Tue, 10 May 2022 18:52:15 +0000
Message-ID: <379e0ac62228f2fd3d314bf84c0ed5bf0609d6d9.camel@intel.com>
References: <20220510183313.1046628-1-jouni.hogander@intel.com>
 <20220510183313.1046628-3-jouni.hogander@intel.com>
In-Reply-To: <20220510183313.1046628-3-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <FCD9821B67C5D045816CBC52C4AE0318@intel.com>
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
Cc: "markpearson@lenovo.com" <markpearson@lenovo.com>, "Kahola,
 Mika" <mika.kahola@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIyLTA1LTEwIGF0IDIxOjMzICswMzAwLCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6
DQo+IEN1cnJlbnRseSB3ZSBoYXZlIHNvbWUgY29ybmVyIGNhc2VzIHdoZXJlIGFyZWEgY2FsY3Vs
YXRpb24gZmFpbHMuICBGb3INCj4gdGhlc2Ugc2VsIGZldGNoIGFyZWEgY2FsY3VsYXRpb24gZW5k
cyB1cCBoYXZpbmcgdXBkYXRlIGFyZWEgYXMgeTEgPSAwLA0KPiB5MiA9IDQuIEluc3RlYWQgb2Yg
dGhlc2UgdmFsdWVzIHNhZmVyIG9wdGlvbiBpcyBmdWxsIHVwZGF0ZS4NCj4gDQo+IE9uZSBvZiBz
dWNoIGZvciBleGFtcGxlIGlzIGJpZyBmYiB3aXRoIG9mZnNldC4gV2UgZG9uJ3QgaGF2ZSB1c2Fi
bGUNCj4gb2Zmc2V0IGluIHBzcjJfc2VsX2ZldGNoX3VwZGF0ZS4gQ3VycmVudGx5IGl0J3Mgb3Bl
biB3aGF0IGlzIHRoZQ0KPiBwcm9wZXIgd2F5IHRvIGZpeCB0aGlzIGNvcm5lciBjYXNlLiBVc2Ug
ZnVsbCB1cGRhdGUgZm9yIG5vdy4NCj4gDQo+IHYyOiBDb21taXQgbWVzc2FnZSBtb2RpZmllZA0K
PiB2MzogUHJpbnQgb3V0IGRlYnVnIGluZm8gb25jZSB3aGVuIGFyZWEgY2FsY3VsYXRpb24gZmFp
bHMNCj4gDQo+IENjOiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNv
bT4NCj4gQ2M6IE1pa2EgS2Fob2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+DQo+IENjOiBNYXJr
IFBlYXJzb24gPG1hcmtwZWFyc29uQGxlbm92by5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEpvdW5p
IEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMgfCAxMiArKysrKysrKysrKysNCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gaW5kZXggMDZkYjQwN2UyNzQ5Li4zNTYxYzIxOGNmYjEg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiBAQCAt
MTY4NSw2ICsxNjg1LDcgQEAgc3RhdGljIGJvb2wgcHNyMl9zZWxfZmV0Y2hfcGlwZV9zdGF0ZV9z
dXBwb3J0ZWQoY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmMNCj4gIGludCBpbnRlbF9w
c3IyX3NlbF9mZXRjaF91cGRhdGUoc3RydWN0IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+
ICAJCQkJc3RydWN0IGludGVsX2NydGMgKmNydGMpDQo+ICB7DQo+ICsJc3RydWN0IGRybV9pOTE1
X3ByaXZhdGUgKmRldl9wcml2ID0gdG9faTkxNShzdGF0ZS0+YmFzZS5kZXYpOw0KPiAgCXN0cnVj
dCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlID0gaW50ZWxfYXRvbWljX2dldF9uZXdfY3J0
Y19zdGF0ZShzdGF0ZSwgY3J0Yyk7DQo+ICAJc3RydWN0IGRybV9yZWN0IHBpcGVfY2xpcCA9IHsg
LngxID0gMCwgLnkxID0gLTEsIC54MiA9IElOVF9NQVgsIC55MiA9IC0xIH07DQo+ICAJc3RydWN0
IGludGVsX3BsYW5lX3N0YXRlICpuZXdfcGxhbmVfc3RhdGUsICpvbGRfcGxhbmVfc3RhdGU7DQo+
IEBAIC0xNzcwLDYgKzE3NzEsMTcgQEAgaW50IGludGVsX3BzcjJfc2VsX2ZldGNoX3VwZGF0ZShz
dHJ1Y3QgaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0ZSwNCj4gIAkJY2xpcF9hcmVhX3VwZGF0ZSgm
cGlwZV9jbGlwLCAmZGFtYWdlZF9hcmVhKTsNCj4gIAl9DQo+ICANCj4gKwkvKg0KPiArCSAqIFRP
RE86IEZvciBub3cgd2UgYXJlIGp1c3QgdXNpbmcgZnVsbCB1cGRhdGUgaW4gY2FzZQ0KPiArCSAq
IHNlbGVjdGl2ZSBmZXRjaCBhcmVhIGNhbGN1bGF0aW9uIGZhaWxzLiBUbyBvcHRpbWl6ZSB0aGlz
IHdlDQo+ICsJICogc2hvdWxkIGlkZW50aWZ5IGNhc2VzIHdoZXJlIHRoaXMgaGFwcGVucyBhbmQg
Zml4IHRoZSBhcmVhDQo+ICsJICogY2FsY3VsYXRpb24gZm9yIHRob3NlLg0KPiArCSAqLw0KPiAr
CWlmIChwaXBlX2NsaXAueTEgPT0gLTEpIHsNCj4gKwkJZHJtX2RiZ19vbmNlX2ttcygmZGV2X3By
aXYtPmRybSwgIk5vIHNlbGVjdGl2ZSBmZXRjaCBhcmVhLCB1c2luZyBmdWxsIHVwZGF0ZSIpOw0K
DQpUaGUgZGVidWcgbWVzc2FnZSBpcyBtaXNsZWFkaW5nLCBhIGJldHRlciBtZXNzYWdlIHdvdWxk
IGJlOiBTZWxlY3RpdmUgZmV0Y2ggYXJlYSBjYWxjdWxhdGlvbiBmYWlsZWQgaW4gcGlwZUEuDQoN
CndpdGggdGhhdDoNClJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNv
dXphQGludGVsLmNvbT4NCg0KPiArCQlmdWxsX3VwZGF0ZSA9IHRydWU7DQo+ICsJfQ0KPiArDQo+
ICAJaWYgKGZ1bGxfdXBkYXRlKQ0KPiAgCQlnb3RvIHNraXBfc2VsX2ZldGNoX3NldF9sb29wOw0K
PiAgDQoNCg==
