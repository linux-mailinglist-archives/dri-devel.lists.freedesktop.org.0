Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5327214E66E
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 01:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1006E938;
	Fri, 31 Jan 2020 00:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F166E0E8;
 Fri, 31 Jan 2020 00:14:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jan 2020 16:14:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,383,1574150400"; d="scan'208";a="428548636"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga005.fm.intel.com with ESMTP; 30 Jan 2020 16:14:28 -0800
Received: from FMSMSX110.amr.corp.intel.com (10.18.116.10) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 30 Jan 2020 16:14:27 -0800
Received: from fmsmsx117.amr.corp.intel.com ([169.254.3.3]) by
 FMSMSX110.amr.corp.intel.com ([169.254.14.114]) with mapi id 14.03.0439.000;
 Thu, 30 Jan 2020 16:14:28 -0800
From: "Souza, Jose" <jose.souza@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915/display: Remove useless call
 intel_dp_mst_encoder_cleanup()
Thread-Topic: [Intel-gfx] [PATCH 3/4] drm/i915/display: Remove useless call
 intel_dp_mst_encoder_cleanup()
Thread-Index: AQHVzNmmwULFl9p5+kCXCcIvpKRTtKgEDksAgAB06QA=
Date: Fri, 31 Jan 2020 00:14:27 +0000
Message-ID: <86fca1dae874489d59b9978061da51c8ff568919.camel@intel.com>
References: <20200117015837.402239-1-jose.souza@intel.com>
 <20200117015837.402239-3-jose.souza@intel.com>
 <20200130171600.GG13686@intel.com>
In-Reply-To: <20200130171600.GG13686@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.12.250]
Content-ID: <9067C25DC768C647B92A9645FED78CBC@intel.com>
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIwLTAxLTMwIGF0IDE5OjE2ICswMjAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIFRodSwgSmFuIDE2LCAyMDIwIGF0IDA1OjU4OjM2UE0gLTA4MDAsIEpvc8OpIFJvYmVy
dG8gZGUgU291emENCj4gd3JvdGU6DQo+ID4gVGhpcyBpcyBhIGVEUCBmdW5jdGlvbiBhbmQgaXQg
d2lsbCBhbHdheXMgcmV0dXJucyB0cnVlIGZvciBub24tZURQDQo+ID4gcG9ydHMuDQo+ID4gDQo+
ID4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRl
bC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZHAuYyB8IDEgLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMNCj4g
PiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYw0KPiA+IGluZGV4IDQw
NzRkODNiMWE1Zi4uYTUwYjViNmRkMDA5IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZHAuYw0KPiA+IEBAIC03NTM3LDcgKzc1MzcsNiBAQCBpbnRlbF9kcF9p
bml0X2Nvbm5lY3RvcihzdHJ1Y3QNCj4gPiBpbnRlbF9kaWdpdGFsX3BvcnQgKmludGVsX2RpZ19w
b3J0LA0KPiA+ICANCj4gPiAgCWlmICghaW50ZWxfZWRwX2luaXRfY29ubmVjdG9yKGludGVsX2Rw
LCBpbnRlbF9jb25uZWN0b3IpKSB7DQo+ID4gIAkJaW50ZWxfZHBfYXV4X2ZpbmkoaW50ZWxfZHAp
Ow0KPiA+IC0JCWludGVsX2RwX21zdF9lbmNvZGVyX2NsZWFudXAoaW50ZWxfZGlnX3BvcnQpOw0K
PiANCj4gVGhpcyBtYWtlcyB0aGUgdW53aW5kIGxvb2sgaW5jb21wbGV0ZSB0byB0aGUgY2F1c3Vh
bCByZWFkZXIuIFRoZQ0KPiBjbGVhbnVwDQo+IGZ1bmN0aW9uIGRvZXMgYm90aCBhbnl3YXkgc28g
Y3Jvc3MgY2hlY2tpbmcgaXMgaGFyZGVyIGlmIHRoZXkncmUgbm90DQo+IGNvbnNpc3RlbnQuIFNv
IG5vdCBzdXJlIEkgbGlrZSBpdC4gSG1tLiBUaGUgb3JkZXJpbmcgb2YgdGhlc2UgdHdvDQo+IGFs
c28NCj4gbG9va3Mgb2ZmIGhlcmUuDQo+IA0KPiBNYXliZSBuaWNlciB0byBqdXN0IG1vdmUgdGhl
IHdob2xlIG9uaW9uIHRvIHRoZSBlbmQgb2YgZnVuY3Rpb24NCj4gKHdlIGFscmVkeSBoYXZlIG9u
ZSBsYXllciB0aGVyZSk/DQoNCklmIEkgbmVlZCB0byByZXdvcmsgdGhlIDQvNCBwYXRjaCBJIHdp
bGwgZG8gdGhhdCwgb3RoZXJ3aXNlIEkgd2lsbCBqdXN0DQppZ25vcmUgdGhpcyBwYXRjaC4NCg0K
UGxlYXNlIGNoZWNrIG15IGFuc3dlciB0byB5b3VyIGNvbW1lbnQuDQoNCj4gDQo+ID4gIAkJZ290
byBmYWlsOw0KPiA+ICAJfQ0KPiA+ICANCj4gPiAtLSANCj4gPiAyLjI1LjANCj4gPiANCj4gPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+IEludGVs
LWdmeCBtYWlsaW5nIGxpc3QNCj4gPiBJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1n
ZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
