Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D08FA8028
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 12:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3E48926B;
	Wed,  4 Sep 2019 10:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E56789238;
 Wed,  4 Sep 2019 10:14:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Sep 2019 03:14:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,465,1559545200"; d="scan'208";a="334164294"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
 by orsmga004.jf.intel.com with ESMTP; 04 Sep 2019 03:14:47 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.73]) by
 IRSMSX104.ger.corp.intel.com ([169.254.5.21]) with mapi id 14.03.0439.000;
 Wed, 4 Sep 2019 11:14:46 +0100
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [PATCH v3 0/3] Send a hotplug when edid changes
Thread-Topic: [PATCH v3 0/3] Send a hotplug when edid changes
Thread-Index: AQHVTFZ9Xb5ovM3/BU6v/tV6RvEfjacCMIaAgBeWVYCAAAcOAIAAI0uAgABDtYCAARjQgIAADYiAgAAN2AA=
Date: Wed, 4 Sep 2019 10:14:46 +0000
Message-ID: <a55bdb8bd9f43a0896e87afe08e3523c1d765a70.camel@intel.com>
References: <5e7dcb14e618796e9cb8a9503cec9d9985c5fd4d.camel@intel.com>
 <20190807210702.GG7444@phenom.ffwll.local>
 <cab2f3a9f9827a993069e402feecc9a9853560a1.camel@intel.com>
 <56A4AB1F0E1B5D4C83D27F43C50F662E590292A2@IRSMSX107.ger.corp.intel.com>
 <ce9f67ad10a2b1f07ab79bc4ac328ef2bd9a2cf4.camel@intel.com>
 <2d8527f7e982148eec6dc8dd80470d4daf4cfa82.camel@intel.com>
 <20190903094052.GP2112@phenom.ffwll.local>
 <ff5ad889af108e1d78be513e8705c033d16cf994.camel@intel.com>
 <20190903154931.GD2112@phenom.ffwll.local>
 <0a7b64dc5db0e9ef1a10e29b2c14993d26953f8c.camel@intel.com>
 <20190904092301.GG2112@phenom.ffwll.local>
In-Reply-To: <20190904092301.GG2112@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.89]
Content-ID: <F62E164CB035F547BF62349DBB08F49B@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Peres,
 Martin" <martin.peres@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Mun, 
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>, "Ser,
 Simon" <simon.ser@intel.com>, "Saarinen, Jani" <jani.saarinen@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTA5LTA0IGF0IDExOjIzICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0K
PiANCj4gPiBTdXJlIHRoaXMgd2lsbCB3b3JrLCBidXQgc3RpbGwgd2UgbmVlZCBzb21laG93IHRv
IGJlIGFibGUgdG8NCj4gPiBkZXRlcm1pbmUNCj4gPiB0aGlzICJpZiBpdCdzIGRpZmZlcmVudCIg
c3RhdGUuIEluIHlvdXIgc29sdXRpb24gd2UganVzdCBtb3ZlIHRoYXQNCj4gPiBjb21wYXJpc29u
IHRvIGRybV9jb25uZWN0b3JfdXBkYXRlX2VkaWRfcHJvcGVydHksIHdoaWNoIGlzIHF1aXRlDQo+
ID4gZmluZQ0KPiA+IGZvciBtZS4NCj4gDQo+IFllcyB3ZSBuZWVkIHRvIGNvbXBhcmUgZWRpZCBz
b21ld2hlcmUsIHRoYXQgbXVjaCBpcyBjbGVhci4gSSdtIG5vdA0KPiBkaXNwdXRpbmcgdGhhdC4g
SSBqdXN0IHdhbnQgc29tZXRoaW5nIHdoZXJlIHdlIGRvbid0IGhhdmUgdG8gcm9sbA0KPiB0aGlz
IG91dA0KPiBvdmVyIGFsbCB0aGUgZHJpdmVycywgYmVjYXVzZSB0aGF0J3MgYSBob3BlbGVzcyBl
bmRlYXZvdXIuDQo+IA0KPiA+IEkgd291bGQgc2F5IHRoYXQgeWVzLCB0aGlzIGlkZWEgbWF5IGJl
IGlzIGV2ZW4gYmV0dGVyIGJlY2F1c2UgDQo+ID4gZHJpdmVycyB3b24ndCBuZWVkIHRvIGltcGxl
bWVudCB0aGlzIGNvbXBhcmlzb24gaW4gZW5jb2Rlci0+aG90cGx1ZyANCj4gPiBpbg0KPiA+IGVh
Y2ggZHJpdmVyLg0KPiA+IEhvd2V2ZXI6IA0KPiA+IHdlIHN0aWxsIG5lZWQgYSBjb21wYXJpc29u
IGluDQo+ID4gZHJtX2Nvbm5lY3Rvcl91cGRhdGVfZWRpZF9wcm9wZXJ0eShkcm1fZWRpZF9lcXVh
bCkgYW5kIGFsc28gSSdtIG5vdA0KPiA+IHN1cmUgd2UgY2FuIHNlbmQgYSBob3RwbHVnIGV2ZW50
IGJhc2VkIG9uIHRoYXQgYXMNCj4gPiBkcm1fY29ubmVjdG9yX3VwZGF0ZV9lZGlkX3Byb3BlcnR5
IHNlZW1zDQo+ID4gdG8gZ2V0IGNhbGxlZCBvbmx5IGR1cmluZyBjb25uZWN0b3IgaW5pdCBvciBk
dXJpbmcgcmVwcm9iZSBmcm9tDQo+ID4gdXNlcnNwYWNlIGZyb20gY29ubmVjdG9yLT5nZXRfbW9k
ZXMgaG9vay4NCj4gPiBBbHNvIGl0IGlzIGNhbGxlZCBmcm9tIGRybV9rbXNfaGVscGVyX2hvdHBs
dWdfZXZlbnQgZnJvbSwgYnV0IHRoaXMNCj4gPiBvbmUNCj4gPiBpcyBjYWxsZWQgZnJvbSBpOTE1
IG9ubHkgaWYgY29ubmVjdGlvbiBzdGF0dXMgaGFkIGNoYW5nZWQuDQo+IA0KPiBTbyBkaXRjaCB0
aGUgb3B0aW1pemF0aW9uIHRvIG9ubHkgY2FsbCAtPmdldF9tb2RlcyB3aGVuIGNhbGxlZCBmcm9t
DQo+IHVzZXJzcGFjZT8gV2UndmUgYmVlbiB0YWxraW5nIGFib3V0IHRoaXMgb25lIHRvbyBpbiB0
aGUgcGFzdCAuLi4NCj4gDQo+IEknZCByZWFsbHkgbGlrZSBhIHNvbHV0aW9uIHdoZXJlIGl0IHdp
bGwgd29yayBmb3IgbW9zdCBkcml2ZXJzIG91dCBvZg0KPiB0aGUNCj4gYm94Lg0KDQpTbyBJIGd1
ZXNzIHRoZSBjb25jbHVzaW9uIHdvdWxkIGJlIHRvIHRyeSB0byB1c2UNCmRybV9jb25uZWN0b3Jf
dXBkYXRlX2VkaWRfcHJvcGVydHkgdGhhdCB3YXkgd2Ugd2lsbCBhdm9pZCBkdXBsaWNhdGluZw0K
ZHJtX2VkaWRfZXF1YWwgY29kZSBpbiBhbGwgZHJpdmVycy4gSG93ZXZlciB0aGlzIG1pZ2h0DQpy
ZXF1aXJlIGVuc3VyaW5nIHRoYXQgZHJtX2Nvbm5lY3Rvcl91cGRhdGVfZWRpZF9wcm9wZXJ0eSBp
cyBhbHdheXMNCmNhbGxlZCB3aGVuIHdlIGdldCBhIGhvdHBsdWcsIHNvIHRoZXJlIHdlIGNhbiBj
aGVjayBpZiBlZGlkIGhhZCBjaGFuZ2VkDQphbmQgc2VuZCB1ZXZlbnQsIGlmIG5lZWRlZC4NCg0K
LSBTdGFuaXNsYXYNCg0KDQo+IC1EYW5pZWwNCj4gDQo+ID4gDQo+ID4gLSBTdGFuaXNsYXYNCj4g
PiANCj4gPiANCj4gPiA+IC1EYW5pZWwNCj4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gQ2hlZXJz
LA0KPiA+ID4gPiANCj4gPiA+ID4gU3RhbmlzbGF2DQo+ID4gPiA+IA0KPiA+ID4gPiANCj4gPiA+
ID4gPiAtRGFuaWVsDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiAN
Cj4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gLSBTdGFuaXNsYXYNCj4gPiA+
ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gLVN0YW5pc2xh
dg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gPiBDaGVlcnMsIERhbmllbA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4g
PiANCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gLVN0YW5pc2xhdg0KPiA+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gLURhbmllbA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBT
dGFuaXNsYXYgTGlzb3Zza2l5ICgzKToNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICAg
ZHJtOiBBZGQgaGVscGVyIHRvIGNvbXBhcmUgZWRpZHMuDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gPiAgIGRybTogSW50cm9kdWNlIGNoYW5nZSBjb3VudGVyIHRvDQo+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gPiBkcm1fY29ubmVjdG9yDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gPiAgIGRybS9pOTE1OiBTZW5kIGhvdHBsdWcgZXZlbnQgaWYgZWRpZA0KPiA+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gaGFkDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBjaGFu
Z2VkLg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyAgICAgICAgIA0KPiA+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gICAgIA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gIHwgIA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gMSArDQo+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgICAgICAgICAg
ICAgIA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gICAgIA0KPiA+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gIHwNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IDMzDQo+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiArKysrKysrKysrKysrKysrKysrKw0KPiA+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJvYmVfaGVscGVyLmMg
ICAgICANCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICANCj4gPiA+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ICB8DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiAyOQ0KPiA+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKysrKysrKysrKysrKysrLQ0KPiA+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gLQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyANCj4gPiA+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gPiA+ICAgICANCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICB8DQo+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiAxNg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4g
KysrKysrKysrLQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+
IGMgICANCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICB8DQo+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gPiAxNg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKysrKysrKyst
LQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfaG90cGwNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IHVnLmMNCj4g
PiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IDIxDQo+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gPiArKysrKysrKysrDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiAt
LS0NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICBpbmNsdWRlL2RybS9kcm1fY29ubmVj
dG9yLmggICAgICAgICAgICAgDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgDQo+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiAgfCAgDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gPiAzICsrDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiAgaW5jbHVkZS9kcm0v
ZHJtX2VkaWQuaCAgICAgICAgICAgICAgICAgIA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gICAgIA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gIHwgIA0KPiA+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gOQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKysrKysr
DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiAgOCBmaWxlcyBjaGFuZ2VkLCAxMTcgaW5z
ZXJ0aW9ucygrKSwgMTENCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IGRlbGV0aW9ucygt
KQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gPiAtLQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gMi4xNy4xDQo+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiANCj4g
PiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4g
PiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+IA0KPiA+
ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gPiA+ID4gPiA+ID4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdA0KPiA+ID4gPiA+ID4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+ID4gPiA+ID4gPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gDQo+ID4gPiANCj4g
PiA+IA0KPiANCj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
