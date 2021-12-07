Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 032EF46B824
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 10:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6976EE8B;
	Tue,  7 Dec 2021 09:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4ECAB4C0;
 Tue,  7 Dec 2021 09:54:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="237351190"
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="237351190"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 01:53:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="479470946"
Received: from irsmsx603.ger.corp.intel.com ([163.33.146.9])
 by orsmga002.jf.intel.com with ESMTP; 07 Dec 2021 01:53:34 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 irsmsx603.ger.corp.intel.com (163.33.146.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 7 Dec 2021 09:53:32 +0000
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.2308.020;
 Tue, 7 Dec 2021 01:53:31 -0800
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "Ursulin, Tvrtko"
 <tvrtko.ursulin@intel.com>
Subject: RE: [v3 0/3] Introduce Raptor Lake S
Thread-Topic: [v3 0/3] Introduce Raptor Lake S
Thread-Index: AQHX6BA7TyaThqfBrUy8DLSZw6jWPawhBdaAgAPddeCAAezv0A==
Date: Tue, 7 Dec 2021 09:53:31 +0000
Message-ID: <26edfa7f3f8c426c8bd030841cf0cbc4@intel.com>
References: <20211203063545.2254380-1-anusha.srivatsa@intel.com>
 <7576de4a-fbd9-ea5c-2d3d-1c5ada9f30e1@linux.intel.com>
 <72998a361a854e59acdbe1ec2c75a0a2@intel.com>
In-Reply-To: <72998a361a854e59acdbe1ec2c75a0a2@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: joonas.lahtinen@linux.intel.com,tvrtko.ursulin@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="utf-8"
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
Cc: "x86@kernel.org" <x86@kernel.org>, "Nikula,
 Jani" <jani.nikula@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3JpdmF0c2EsIEFudXNo
YQ0KPiBTZW50OiBNb25kYXksIERlY2VtYmVyIDYsIDIwMjEgOTo1OSBBTQ0KPiBUbzogJ1R2cnRr
byBVcnN1bGluJyA8dHZydGtvLnVyc3VsaW5AbGludXguaW50ZWwuY29tPjsgaW50ZWwtDQo+IGdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IHg4NkBrZXJuZWwub3JnOyBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBJbmdvIE1vbG5hcg0KPiA8bWluZ29AcmVkaGF0LmNvbT47
IEJvcmlzbGF2IFBldGtvdiA8YnBAYWxpZW44LmRlPjsgRGF2ZSBIYW5zZW4NCj4gPGRhdmUuaGFu
c2VuQGxpbnV4LmludGVsLmNvbT47IEpvb25hcyBMYWh0aW5lbg0KPiA8am9vbmFzLmxhaHRpbmVu
QGxpbnV4LmludGVsLmNvbT47IE5pa3VsYSwgSmFuaSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0K
PiBTdWJqZWN0OiBSRTogW3YzIDAvM10gSW50cm9kdWNlIFJhcHRvciBMYWtlIFMNCj4gDQo+IA0K
PiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IFR2cnRrbyBVcnN1
bGluIDx0dnJ0a28udXJzdWxpbkBsaW51eC5pbnRlbC5jb20+DQo+ID4gU2VudDogRnJpZGF5LCBE
ZWNlbWJlciAzLCAyMDIxIDI6NTcgUE0NCj4gPiBUbzogU3JpdmF0c2EsIEFudXNoYSA8YW51c2hh
LnNyaXZhdHNhQGludGVsLmNvbT47IGludGVsLQ0KPiA+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj4gPiBDYzogeDg2QGtlcm5lbC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IEluZ28gTW9sbmFyDQo+ID4gPG1pbmdvQHJlZGhhdC5jb20+OyBCb3Jpc2xhdiBQZXRrb3Yg
PGJwQGFsaWVuOC5kZT47IERhdmUgSGFuc2VuDQo+ID4gPGRhdmUuaGFuc2VuQGxpbnV4LmludGVs
LmNvbT47IEpvb25hcyBMYWh0aW5lbg0KPiA+IDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwu
Y29tPjsgTmlrdWxhLCBKYW5pDQo+ID4gPGphbmkubmlrdWxhQGludGVsLmNvbT4NCj4gPiBTdWJq
ZWN0OiBSZTogW3YzIDAvM10gSW50cm9kdWNlIFJhcHRvciBMYWtlIFMNCj4gPg0KPiA+DQo+ID4g
T24gMDMvMTIvMjAyMSAwNjozNSwgQW51c2hhIFNyaXZhdHNhIHdyb3RlOg0KPiA+ID4gUmFwdG9y
IExha2UgUyhSUEwtUykgaXMgYSB2ZXJzaW9uIDEyIERpc3BsYXksIE1lZGlhIGFuZCBSZW5kZXIu
IEZvcg0KPiA+ID4gYWxsIGk5MTUgcHVycG9zZXMgaXQgaXMgdGhlIHNhbWUgYXMgQWxkZXIgTGFr
ZSBTIChBREwtUykuDQo+ID4gPg0KPiA+ID4gVGhlIHNlcmllcyBpbnRyb2R1Y2VzIGl0IGFzIGEg
c3VicGxhdGZvcm0gb2YgQURMLVMuIFRoZSBvbmUNCj4gPiA+IGRpZmZlcmVuY2UgaXMgdGhlIEd1
QyBzdWJtaXNzaW9uIHdoaWNoIGlzIGRlZmF1bHQgb24gUlBMLVMgYnV0IHdhcw0KPiA+ID4gbm90
IHRoZSBjYXNlIHdpdGggQURMLVMuDQo+ID4NCj4gPiBBcyBhIHNpZGUgbm90ZSwgbm90IGEgYmxv
Y2tlciBvZiBhbnkga2luZCwgSSBhbSBzbGlnaHRseSBkaXNoZWFydGVuZWQNCj4gPiBidXQgdGhl
IGNvbmZ1c2lvbiBvZiBBRExfUCBhbmQgQURMX1MgYmVpbmcgc2VwYXJhdGUgcGxhdGZvcm1zLCBi
dXQNCj4gPiB0aGVuIFJQTF9TIGlzIHN1YnBsYXRmb3JtIG9mIEFETF9TLiBNYXliZSBpdCBpcyBq
dXN0IG1lIG5vdCBiZWluZyBhYmxlDQo+ID4gdG8ga2VlcCB0cmFjayBvZiB0aGluZ3MuDQo+ID4N
Cj4gPiA+IEFsbCBwYXRjaGVzIGFyZSByZXZpZXdlZC4gSmFuaSBoYXMgYWNrZWQgdGhlIHNlcmll
cy4NCj4gPiA+IExvb2tpbmcgZm9yIG90aGVyIGFja3MgaW4gb3JkZXIgdG8gbWVyZ2UgdGhlc2Ug
dG8gcmVzcGVjdGl2ZSBicmFuY2hlcy4NCj4gPg0KPiA+IFdoaWNoIGJyYW5jaGVzIHdvdWxkIHRo
YXQgYmUgZm9yIHRoaXMgc2VyaWVzPyBGaXJzdCB0d28gdG8NCj4gPiBkcm0taW50ZWwtbmV4dCBh
bmQgbGFzdCBvbmUgdG8gZHJtLWludGVsLWd0LW5leHQ/IElzIHRoYXQgY29tcGxpY2F0aW9uDQo+
ID4gbmVlZGVkIGFuZC9vciB3b3J0aCB0aGUgZWZmb3J0Pw0KPiANCj4gVHZydGtvLA0KPiAgQWxs
IHRocmVlIGhhdmUgdG8gbGFuZCB0byBkcm0taW50ZWwtbmV4dC4gVGhlIGxhc3Qgb25lIGhhcyBk
ZXBlbmRlbmN5IG9uIHRoZQ0KPiBmaXJzdCBwYXRjaCBhbmQgaXMgYSB0cml2aWFsIGNoYW5nZS4N
Cg0KQFVyc3VsaW4sIFR2cnRrbyBASm9vbmFzIExhaHRpbmVuIGNhbiBJIGdldCBhbiBhY2sgdG8g
bWVyZ2UgdGhlc2UgaW50byBkcm0taW50ZWwtbmV4dCBicmFuY2g/DQoNCg0KQW51c2hhDQo+IEFu
dXNoYQ0KPiA+IFJlZ2FyZHMsDQo+ID4NCj4gPiBUdnJ0a28NCj4gPg0KPiA+ID4gQ2M6IHg4NkBr
ZXJuZWwub3JnDQo+ID4gPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+
ID4gQ2M6IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPg0KPiA+ID4gQ2M6IEJvcmlzbGF2
IFBldGtvdiA8YnBAYWxpZW44LmRlPg0KPiA+ID4gQ2M6IERhdmUgSGFuc2VuIDxkYXZlLmhhbnNl
bkBsaW51eC5pbnRlbC5jb20+DQo+ID4gPiBDYzogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFo
dGluZW5AbGludXguaW50ZWwuY29tPg0KPiA+ID4gQ2M6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28u
dXJzdWxpbkBsaW51eC5pbnRlbC5jb20+DQo+ID4gPiBBY2tlZC1ieTogSmFuaSBOaWt1bGEgPGph
bmkubmlrdWxhQGludGVsLmNvbT4NCj4gPiA+DQo+ID4gPiBBbnVzaGEgU3JpdmF0c2EgKDMpOg0K
PiA+ID4gICAgZHJtL2k5MTUvcnBsLXM6IEFkZCBQQ0kgSURTIGZvciBSYXB0b3IgTGFrZSBTDQo+
ID4gPiAgICBkcm0vaTkxNS9ycGwtczogQWRkIFBDSCBTdXBwb3J0IGZvciBSYXB0b3IgTGFrZSBT
DQo+ID4gPiAgICBkcm0vaTkxNS9ycGwtczogRW5hYmxlIGd1YyBzdWJtaXNzaW9uIGJ5IGRlZmF1
bHQNCj4gPiA+DQo+ID4gPiAgIGFyY2gveDg2L2tlcm5lbC9lYXJseS1xdWlya3MuYyAgICAgICAg
ICAgfCAxICsNCj4gPiA+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfdWMuYyAg
ICB8IDIgKy0NCj4gPiA+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaCAgICAgICAg
ICB8IDIgKysNCj4gPiA+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9wY2kuYyAgICAgICAg
ICB8IDEgKw0KPiA+ID4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9kZXZpY2VfaW5mby5j
IHwgNyArKysrKysrDQo+ID4gPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2RldmljZV9p
bmZvLmggfCAzICsrKw0KPiA+ID4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9wY2guYyAg
ICAgICAgIHwgMSArDQo+ID4gPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3BjaC5oICAg
ICAgICAgfCAxICsNCj4gPiA+ICAgaW5jbHVkZS9kcm0vaTkxNV9wY2lpZHMuaCAgICAgICAgICAg
ICAgICB8IDkgKysrKysrKysrDQo+ID4gPiAgIDkgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4NCg==
