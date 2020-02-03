Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EDA15107C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 20:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0906ECD6;
	Mon,  3 Feb 2020 19:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887096ECCC;
 Mon,  3 Feb 2020 19:49:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 11:49:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="403555577"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga005.jf.intel.com with ESMTP; 03 Feb 2020 11:49:10 -0800
Received: from fmsmsx113.amr.corp.intel.com (10.18.116.7) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 11:49:10 -0800
Received: from bgsmsx103.gar.corp.intel.com (10.223.4.130) by
 FMSMSX113.amr.corp.intel.com (10.18.116.7) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 11:49:10 -0800
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.36]) by
 BGSMSX103.gar.corp.intel.com ([169.254.4.106]) with mapi id 14.03.0439.000;
 Tue, 4 Feb 2020 01:19:07 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Alex Deucher <alexdeucher@gmail.com>, Ville Syrjala
 <ville.syrjala@linux.intel.com>
Subject: RE: [Intel-gfx] [PATCH 3/8] drm/edid: Introduce
 is_detailed_timing_descritor()
Thread-Topic: [Intel-gfx] [PATCH 3/8] drm/edid: Introduce
 is_detailed_timing_descritor()
Thread-Index: AQHV0vFNrVyOgZqDw0y41EYsp66Z1qf+wkqAgAstjkA=
Date: Mon, 3 Feb 2020 19:49:06 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F823A9FB7@BGSMSX104.gar.corp.intel.com>
References: <20200124200231.10517-1-ville.syrjala@linux.intel.com>
 <20200124200231.10517-3-ville.syrjala@linux.intel.com>
 <CADnq5_OJs1A7RMq354Dyo5udB2C9U8Ga-4fuU=v2AygR1OR5ZA@mail.gmail.com>
In-Reply-To: <CADnq5_OJs1A7RMq354Dyo5udB2C9U8Ga-4fuU=v2AygR1OR5ZA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTMxZGIwOGYtMTExZi00YmZkLWEwNTgtMTNkNTBmYzFhMTk3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibVVJdjJERFhYWUU1K2FDdWRDTWlFXC9KSzlIbDhiVTMyWloxWnBHRWdjMVdVVzd1a1NxYW9sRDZzbmJDVmxXcUkifQ==
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
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
Cc: Allen Chen <allen.chen@ite.com.tw>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwtZ2Z4IDxpbnRl
bC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBBbGV4DQo+
IERldWNoZXINCj4gU2VudDogVHVlc2RheSwgSmFudWFyeSAyOCwgMjAyMCA0OjA2IEFNDQo+IFRv
OiBWaWxsZSBTeXJqYWxhIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IEFs
bGVuIENoZW4gPGFsbGVuLmNoZW5AaXRlLmNvbS50dz47IEludGVsIEdyYXBoaWNzIERldmVsb3Bt
ZW50IDxpbnRlbC0NCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IE1hbGluZyBsaXN0IC0g
RFJJIGRldmVsb3BlcnMgPGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPg0KPiBT
dWJqZWN0OiBSZTogW0ludGVsLWdmeF0gW1BBVENIIDMvOF0gZHJtL2VkaWQ6IEludHJvZHVjZQ0K
PiBpc19kZXRhaWxlZF90aW1pbmdfZGVzY3JpdG9yKCkNCj4gDQo+IE9uIEZyaSwgSmFuIDI0LCAy
MDIwIGF0IDM6MDIgUE0gVmlsbGUgU3lyamFsYSA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5j
b20+IHdyb3RlOg0KPiA+DQo+ID4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxh
QGxpbnV4LmludGVsLmNvbT4NCj4gPg0KPiA+IExldCdzIGludHJvZHVjZSBpc19kZXRhaWxlZF90
aW1pbmdfZGVzY3JpdG9yKCkgYXMgdGhlIG9wcG9zaXRlDQo+ID4gY291bnRlcnBhcnQgb2YgaXNf
ZGlzcGxheV9kZXNjcmlwdG9yKCkuDQo+ID4NCj4gPiBDYzogQWxsZW4gQ2hlbiA8YWxsZW4uY2hl
bkBpdGUuY29tLnR3Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUu
c3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+IA0KPiBBY2tlZC1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KDQpMb29rcyBnb29kLg0KUmV2aWV3ZWQtYnk6IFVt
YSBTaGFua2FyIDx1bWEuc2hhbmthckBpbnRlbC5jb20+DQoNCj4gPiAtLS0NCj4gPiAgZHJpdmVy
cy9ncHUvZHJtL2RybV9lZGlkLmMgfCA0Mg0KPiA+ICsrKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAxOCBk
ZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Vk
aWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jDQo+ID4gaW5kZXggOTZhZTFmZGU0Y2Uy
Li5kNmJjZTU4YjI3YWMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlk
LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYw0KPiA+IEBAIC0yMjAyLDYg
KzIyMDIsMTEgQEAgc3RhdGljIGJvb2wgaXNfZGlzcGxheV9kZXNjcmlwdG9yKGNvbnN0IHU4IGRb
MThdLCB1OA0KPiB0YWcpDQo+ID4gICAgICAgICAgICAgICAgIGRbMl0gPT0gMHgwMCAmJiBkWzNd
ID09IHRhZzsgIH0NCj4gPg0KPiA+ICtzdGF0aWMgYm9vbCBpc19kZXRhaWxlZF90aW1pbmdfZGVz
Y3JpcHRvcihjb25zdCB1OCBkWzE4XSkgew0KPiA+ICsgICAgICAgcmV0dXJuIGRbMF0gIT0gMHgw
MCB8fCBkWzFdICE9IDB4MDA7IH0NCj4gPiArDQo+ID4gIHR5cGVkZWYgdm9pZCBkZXRhaWxlZF9j
YihzdHJ1Y3QgZGV0YWlsZWRfdGltaW5nICp0aW1pbmcsIHZvaWQNCj4gPiAqY2xvc3VyZSk7DQo+
ID4NCj4gPiAgc3RhdGljIHZvaWQNCj4gPiBAQCAtMzEwMSwyNyArMzEwNiwyOCBAQCBkb19kZXRh
aWxlZF9tb2RlKHN0cnVjdCBkZXRhaWxlZF90aW1pbmcgKnRpbWluZywNCj4gdm9pZCAqYykNCj4g
PiAgICAgICAgIHN0cnVjdCBkZXRhaWxlZF9tb2RlX2Nsb3N1cmUgKmNsb3N1cmUgPSBjOw0KPiA+
ICAgICAgICAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm5ld21vZGU7DQo+ID4NCj4gPiAtICAg
ICAgIGlmICh0aW1pbmctPnBpeGVsX2Nsb2NrKSB7DQo+ID4gLSAgICAgICAgICAgICAgIG5ld21v
ZGUgPSBkcm1fbW9kZV9kZXRhaWxlZChjbG9zdXJlLT5jb25uZWN0b3ItPmRldiwNCj4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNsb3N1cmUtPmVkaWQsIHRp
bWluZywNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNs
b3N1cmUtPnF1aXJrcyk7DQo+ID4gLSAgICAgICAgICAgICAgIGlmICghbmV3bW9kZSkNCj4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47DQo+ID4gKyAgICAgICBpZiAoIWlzX2RldGFp
bGVkX3RpbWluZ19kZXNjcmlwdG9yKChjb25zdCB1OCAqKXRpbWluZykpDQo+ID4gKyAgICAgICAg
ICAgICAgIHJldHVybjsNCj4gPiArDQo+ID4gKyAgICAgICBuZXdtb2RlID0gZHJtX21vZGVfZGV0
YWlsZWQoY2xvc3VyZS0+Y29ubmVjdG9yLT5kZXYsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY2xvc3VyZS0+ZWRpZCwgdGltaW5nLA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNsb3N1cmUtPnF1aXJrcyk7DQo+ID4gKyAgICAgICBpZiAo
IW5ld21vZGUpDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybjsNCj4gPg0KPiA+IC0gICAgICAg
ICAgICAgICBpZiAoY2xvc3VyZS0+cHJlZmVycmVkKQ0KPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgIG5ld21vZGUtPnR5cGUgfD0gRFJNX01PREVfVFlQRV9QUkVGRVJSRUQ7DQo+ID4gKyAgICAg
ICBpZiAoY2xvc3VyZS0+cHJlZmVycmVkKQ0KPiA+ICsgICAgICAgICAgICAgICBuZXdtb2RlLT50
eXBlIHw9IERSTV9NT0RFX1RZUEVfUFJFRkVSUkVEOw0KPiA+DQo+ID4gLSAgICAgICAgICAgICAg
IC8qDQo+ID4gLSAgICAgICAgICAgICAgICAqIERldGFpbGVkIG1vZGVzIGFyZSBsaW1pdGVkIHRv
IDEwa0h6IHBpeGVsIGNsb2NrIHJlc29sdXRpb24sDQo+ID4gLSAgICAgICAgICAgICAgICAqIHNv
IGZpeCB1cCBhbnl0aGluZyB0aGF0IGxvb2tzIGxpa2UgQ0VBL0hETUkgbW9kZSwgYnV0IHRoZSBj
bG9jaw0KPiA+IC0gICAgICAgICAgICAgICAgKiBpcyBqdXN0IHNsaWdodGx5IG9mZi4NCj4gPiAt
ICAgICAgICAgICAgICAgICovDQo+ID4gLSAgICAgICAgICAgICAgIGZpeHVwX2RldGFpbGVkX2Nl
YV9tb2RlX2Nsb2NrKG5ld21vZGUpOw0KPiA+ICsgICAgICAgLyoNCj4gPiArICAgICAgICAqIERl
dGFpbGVkIG1vZGVzIGFyZSBsaW1pdGVkIHRvIDEwa0h6IHBpeGVsIGNsb2NrIHJlc29sdXRpb24s
DQo+ID4gKyAgICAgICAgKiBzbyBmaXggdXAgYW55dGhpbmcgdGhhdCBsb29rcyBsaWtlIENFQS9I
RE1JIG1vZGUsIGJ1dCB0aGUgY2xvY2sNCj4gPiArICAgICAgICAqIGlzIGp1c3Qgc2xpZ2h0bHkg
b2ZmLg0KPiA+ICsgICAgICAgICovDQo+ID4gKyAgICAgICBmaXh1cF9kZXRhaWxlZF9jZWFfbW9k
ZV9jbG9jayhuZXdtb2RlKTsNCj4gPg0KPiA+IC0gICAgICAgICAgICAgICBkcm1fbW9kZV9wcm9i
ZWRfYWRkKGNsb3N1cmUtPmNvbm5lY3RvciwgbmV3bW9kZSk7DQo+ID4gLSAgICAgICAgICAgICAg
IGNsb3N1cmUtPm1vZGVzKys7DQo+ID4gLSAgICAgICAgICAgICAgIGNsb3N1cmUtPnByZWZlcnJl
ZCA9IGZhbHNlOw0KPiA+IC0gICAgICAgfQ0KPiA+ICsgICAgICAgZHJtX21vZGVfcHJvYmVkX2Fk
ZChjbG9zdXJlLT5jb25uZWN0b3IsIG5ld21vZGUpOw0KPiA+ICsgICAgICAgY2xvc3VyZS0+bW9k
ZXMrKzsNCj4gPiArICAgICAgIGNsb3N1cmUtPnByZWZlcnJlZCA9IGZhbHNlOw0KPiA+ICB9DQo+
ID4NCj4gPiAgLyoNCj4gPiAtLQ0KPiA+IDIuMjQuMQ0KPiA+DQo+ID4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gPiBkcmktZGV2ZWwgbWFpbGluZyBs
aXN0DQo+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsDQo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IEludGVsLWdmeCBtYWls
aW5nIGxpc3QNCj4gSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeA0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
