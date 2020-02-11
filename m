Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED110158CF3
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 11:53:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA886EA23;
	Tue, 11 Feb 2020 10:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D3F66EA23;
 Tue, 11 Feb 2020 10:53:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Feb 2020 02:53:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="380399238"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
 by orsmga004.jf.intel.com with ESMTP; 11 Feb 2020 02:53:11 -0800
Received: from irsmsx602.ger.corp.intel.com (163.33.146.8) by
 IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 11 Feb 2020 10:53:10 +0000
Received: from irsmsx604.ger.corp.intel.com (163.33.146.137) by
 irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 11 Feb 2020 10:53:09 +0000
Received: from irsmsx604.ger.corp.intel.com ([163.33.146.137]) by
 IRSMSX604.ger.corp.intel.com ([163.33.146.137]) with mapi id 15.01.1713.004;
 Tue, 11 Feb 2020 10:53:09 +0000
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Souza,
 Jose" <jose.souza@intel.com>
Subject: Re: [PATCH 3/4] drm/i915/display: Remove useless call
 intel_dp_mst_encoder_cleanup()
Thread-Topic: [PATCH 3/4] drm/i915/display: Remove useless call
 intel_dp_mst_encoder_cleanup()
Thread-Index: AQHVzNmxQIxBP7XEvk6NmYUeEofHSqgV+EgA
Date: Tue, 11 Feb 2020 10:53:09 +0000
Message-ID: <a09f01c2c73f05ccd41a27a3a76137e8c1f5c830.camel@intel.com>
References: <20200117015837.402239-1-jose.souza@intel.com>
 <20200117015837.402239-3-jose.souza@intel.com>
In-Reply-To: <20200117015837.402239-3-jose.souza@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.66.163]
Content-ID: <5CD430914CD0274BA18834CE13EF6BEF@intel.com>
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

T24gVGh1LCAyMDIwLTAxLTE2IGF0IDE3OjU4IC0wODAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IHdyb3RlOg0KPiBUaGlzIGlzIGEgZURQIGZ1bmN0aW9uIGFuZCBpdCB3aWxsIGFsd2F5cyByZXR1
cm5zIHRydWUgZm9yIG5vbi1lRFANCj4gcG9ydHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKb3PD
qSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgfCAxIC0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kcC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kcC5jDQo+IGluZGV4IDQwNzRkODNiMWE1Zi4uYTUwYjViNmRkMDA5IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jDQo+IEBAIC03NTM3LDcgKzc1Mzcs
NiBAQCBpbnRlbF9kcF9pbml0X2Nvbm5lY3RvcihzdHJ1Y3QNCj4gaW50ZWxfZGlnaXRhbF9wb3J0
ICppbnRlbF9kaWdfcG9ydCwNCj4gIA0KPiAgCWlmICghaW50ZWxfZWRwX2luaXRfY29ubmVjdG9y
KGludGVsX2RwLCBpbnRlbF9jb25uZWN0b3IpKSB7DQo+ICAJCWludGVsX2RwX2F1eF9maW5pKGlu
dGVsX2RwKTsNCj4gLQkJaW50ZWxfZHBfbXN0X2VuY29kZXJfY2xlYW51cChpbnRlbF9kaWdfcG9y
dCk7DQo+ICAJCWdvdG8gZmFpbDsNCj4gIAl9DQo+ICANCg0KDQpDaGFuZ2UgbG9va3MgZmluZSBm
b3IgbWUoYW55d2F5IGJldHRlciB0aGFuIG5vdykuIA0KDQpCdXQ6DQoNClRoaXMgd2hvbGUgdGhp
bmcgbG9va3Mga2luZCBvZiBjb25mdXNpbmcgdG8gbWUuIFdoeSB3ZSBhcmUgZXZlbiBjYWxsaW5n
DQppbnRlbF9lZHBfaW5pdF9jb25uZWN0b3IgZm9yDQpub24tZURQIHBvcnRzLCBqdXN0IHRvIGlt
bWVkaWF0ZWx5IGdldCB0cnVlIHJldHVybmVkPyBTbyByZXR1cm5pbmcNCnN1Y2Nlc3MgbWVhbnMg
ZWl0aGVyIHN1Y2Nlc3Mgb3IgdGhhdCB0aGlzIGlzIG5vbi1lRFAuLg0KDQpUaGlzIGNvbmZ1c2Vz
IHRoZSBjYWxsZXIsIHRoYXQgd2UgaGF2ZSBhY3R1YWxseSBzdWNjZXNzZnVsbHkNCmluaXRpYWxp
emVkIGVEUCwgd2hpbGUgYWN0dWFsbHkgdGhpcyBhbHNvIG1lYW5zIGhlcmUgdGhhdCBpdCBpcyBu
b3QNCmVEUC4NCg0KV2h5IHdlIGNhbid0IGp1c3QgZG8gaXQgbGlrZToNCg0KaWYgKGludGVsX2Rw
X2lzX2VkcChpbnRlbF9kcCkpIHsNCglpZiAoIWludGVsX2VkcF9pbml0X2Nvbm5lY3RvcihpbnRl
bF9kcCwgaW50ZWxfY29ubmVjdG9yKSkgew0KCQlpbnRlbF9kcF9hdXhfZmluaShpbnRlbF9kcCk7
DQogIAkJZ290byBmYWlsOw0KCX0NCn0NCg0KaXQgbG9va3MgbXVjaCBtb3JlIHVuZGVyc3RhbmRh
YmxlIGFuZCBsZXNzIGNvbmZ1c2luZywgaS5lIGVEUCBmdW5jdGlvbnMNCmFyZSBvbmx5IGNhbGxl
ZCBmb3IgZURQIGFuZCBubyByZXR1cm4gdmFsdWUgaGFja3MgYXJlIG5lZWRlZC4NCg0KUmV2aWV3
ZWQtYnk6IFN0YW5pc2xhdiBMaXNvdnNraXkgPHN0YW5pc2xhdi5saXNvdnNraXlAaW50ZWwuY29t
Pg0KDQpTdGFuDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
