Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5A614D947
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 11:51:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C6D6E7DA;
	Thu, 30 Jan 2020 10:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317706E7D7;
 Thu, 30 Jan 2020 10:51:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jan 2020 02:51:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,381,1574150400"; d="scan'208";a="262134881"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
 by fmsmga002.fm.intel.com with ESMTP; 30 Jan 2020 02:51:18 -0800
Received: from irsmsx603.ger.corp.intel.com (163.33.146.9) by
 IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 30 Jan 2020 10:49:37 +0000
Received: from irsmsx604.ger.corp.intel.com (163.33.146.137) by
 irsmsx603.ger.corp.intel.com (163.33.146.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 30 Jan 2020 10:49:37 +0000
Received: from irsmsx604.ger.corp.intel.com ([163.33.146.137]) by
 IRSMSX604.ger.corp.intel.com ([163.33.146.137]) with mapi id 15.01.1713.004;
 Thu, 30 Jan 2020 10:49:37 +0000
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Souza, Jose" <jose.souza@intel.com>
Subject: Re: [PATCH] drm/mst: Fix possible NULL pointer dereference in
 drm_dp_mst_process_up_req()
Thread-Topic: [PATCH] drm/mst: Fix possible NULL pointer dereference in
 drm_dp_mst_process_up_req()
Thread-Index: AQHV1vtbtGxua2oDhEuUfjgVFWdfBKgDBv2A
Date: Thu, 30 Jan 2020 10:49:37 +0000
Message-ID: <fa91fb504dacb40f922077ee7181ec5f4caded08.camel@intel.com>
References: <20200129232448.84704-1-jose.souza@intel.com>
In-Reply-To: <20200129232448.84704-1-jose.souza@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.89]
Content-ID: <20B7F5468D69244DA402D1E0694E3B87@intel.com>
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
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIwLTAxLTI5IGF0IDE1OjI0IC0wODAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IHdyb3RlOg0KPiBBY2NvcmRpbmcgdG8gRFAgc3BlY2lmaWNhdGlvbiwgRFBfU0lOS19FVkVOVF9O
T1RJRlkgaXMgYWxzbyBhDQo+IGJyb2FkY2FzdCBtZXNzYWdlIGJ1dCBhcyB0aGlzIGZ1bmN0aW9u
IG9ubHkgaGFuZGxlcw0KPiBEUF9DT05ORUNUSU9OX1NUQVRVU19OT1RJRlkgSSB3aWxsIG9ubHkg
bWFrZSB0aGUgc3RhdGljDQo+IGFuYWx5emVyIHRoYXQgY2F1Z2h0IHRoaXMgaXNzdWUgaGFwcHkg
Ynkgbm90IGNhbGxpbmcNCj4gZHJtX2RwX2dldF9tc3RfYnJhbmNoX2RldmljZV9ieV9ndWlkKCkg
d2l0aCBhIE5VTEwgZ3VpZCwgY2F1c2luZw0KPiBkcm1fZHBfbXN0X3Byb2Nlc3NfdXBfcmVxKCkg
dG8gcmV0dXJuIGluIHRoZSAiaWYgKCFtc3RiKSIgcmlnaHQNCj4gYmVsbG93Lg0KPiANCj4gRml4
ZXM6IDk0MDhjYzk0ZWIwNCAoImRybS9kcF9tc3Q6IEhhbmRsZSBVUCByZXF1ZXN0cyBhc3luY2hy
b25vdXNseSIpDQo+IENjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPg0KPiBDYzogU2Vh
biBQYXVsIDxzZWFuQHBvb3JseS5ydW4+DQo+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8g
ZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCAzICsrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jDQo+IGluZGV4IDIzY2Y0NmJmZWY3NC4uYTgxMTI0N2NlY2ZlIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMNCj4gQEAgLTM4MjksNyArMzgyOSw4
IEBAIGRybV9kcF9tc3RfcHJvY2Vzc191cF9yZXEoc3RydWN0DQo+IGRybV9kcF9tc3RfdG9wb2xv
Z3lfbWdyICptZ3IsDQo+ICAJCWVsc2UgaWYgKG1zZy0+cmVxX3R5cGUgPT0gRFBfUkVTT1VSQ0Vf
U1RBVFVTX05PVElGWSkNCj4gIAkJCWd1aWQgPSBtc2ctPnUucmVzb3VyY2Vfc3RhdC5ndWlkOw0K
PiAgDQo+IC0JCW1zdGIgPSBkcm1fZHBfZ2V0X21zdF9icmFuY2hfZGV2aWNlX2J5X2d1aWQobWdy
LCBndWlkKTsNCj4gKwkJaWYgKGd1aWQpDQo+ICsJCQltc3RiID0NCj4gZHJtX2RwX2dldF9tc3Rf
YnJhbmNoX2RldmljZV9ieV9ndWlkKG1nciwgZ3VpZCk7DQo+ICAJfSBlbHNlIHsNCj4gIAkJbXN0
YiA9IGRybV9kcF9nZXRfbXN0X2JyYW5jaF9kZXZpY2UobWdyLCBoZHItPmxjdCwgaGRyLQ0KPiA+
cmFkKTsNCj4gIAl9DQoNCkJlZW4gZml4aW5nIHNvbWV0aGluZyBzaW1pbGFyIGluIGRwIG1zdCB0
b3BvbG9neSBhIHdoaWxlIGFnbywgd2FzIGFsc28NCnNpbWlsYXIgTlVMTCBwb2ludGVyIGRlcmVm
ZXJlbmNlLiBGaXggc2VlbXMgdG8gYmUgY29ycmVjdCwgaG93ZXZlciBJDQp3b3VsZCBzdGlsbCBo
YXZlIGEgbG9vayBhdCBsZWFzdCwgaG93IGl0IGFmZmVjdHMgb3ZlcmFsbCBsb2dpYyB0aGVuLg0K
SSBtZWFuIG5vdyB3ZSBkb24ndCBjYWxsIGRybV9kcF9nZXRfbXN0X2JyYW5jaF9kZXZpY2VfYnlf
Z3VpZCBpZiBndWlkDQppcyBOVUxMIC0gdGhhdCdzIG9rLCBob3dldmVyIGl0IG1lYW5zIHRoYXQg
bXN0YiB3aWxsIG5vdCBnZXQNCmluaXRpYWxpemVkIGFuZCBob3cgdGhpcyBpcyBnb2luZyB0byBh
ZmZlY3QgdGhlIGNvZGUgZmxvdyB0aGVuPw0KDQpTSG91bGQgd2UgbWF5IGJlIHN0aWxsIHRyeSB0
byBpbml0aWFsaXplIG1zdGIgc29tZWhvdyBhbmQgY2hlY2sNCmd1aWQgYWN0dWFsbHkgaW5zaWRl
IG9mIHRoaXMgZHJtX2RwX2dldF9tc3RfYnJhbmNoX2RldmljZV9ieV9ndWlkDQpmdW5jdGlvbj8g
T3IgY2FsbCBkcm1fZHBfZ2V0X21zdF9icmFuY2hfZGV2aWNlPw0KDQpJJ20gbm90IHN0YXRpbmcg
YW55dGhpbmcgaGVyZSwganVzdCBhc2tpbmcgcXVlc3Rpb24gdG8gDQptYWtlIHRoZSBvdmVyYWxs
IHBpY3R1cmUgYml0IG1vcmUgY2xlYXIuDQoNCkFueXdheXMsIGV2ZW4gd3JvbmcgbG9naWMgdG8g
bWUgaXMgYmV0dGVyIHRoYW4gY3Jhc2hpbmcgc28sDQoNClJldmlld2VkLWJ5OiBTdGFuaXNsYXYg
TGlzb3Zza2l5IDxzdGFuaXNsYXYubGlzb3Zza2l5QGludGVsLmNvbT4NCg0KDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
