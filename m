Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3D0C349F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 14:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895646E6C3;
	Tue,  1 Oct 2019 12:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E361689FED;
 Tue,  1 Oct 2019 12:45:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Oct 2019 05:45:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; d="scan'208";a="191448264"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga007.fm.intel.com with ESMTP; 01 Oct 2019 05:45:12 -0700
Received: from bgsmsx102.gar.corp.intel.com (10.223.4.172) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 1 Oct 2019 05:45:12 -0700
Received: from bgsmsx110.gar.corp.intel.com ([169.254.11.62]) by
 BGSMSX102.gar.corp.intel.com ([169.254.2.146]) with mapi id 14.03.0439.000;
 Tue, 1 Oct 2019 18:15:08 +0530
From: "S, Srinivasan" <srinivasan.s@intel.com>
To: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 "Navare, Manasi D" <manasi.d.navare@intel.com>, "Kahola, Mika"
 <mika.kahola@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>, "Vudum,
 Lakshminarayana" <lakshminarayana.vudum@intel.com>
Subject: RE: [PATCH] drm/i915/dp: Fix DP MST error after unplugging TypeC cable
Thread-Topic: [PATCH] drm/i915/dp: Fix DP MST error after unplugging TypeC
 cable
Thread-Index: AQHVczn1yp0C8DlVREKm5Ys+2DfEIadFXSMAgABnR6A=
Date: Tue, 1 Oct 2019 12:45:07 +0000
Message-ID: <BFA53C78450B204BBCED0B0A62E9EAE7325573DA@BGSMSX110.gar.corp.intel.com>
References: <1569371742-109402-1-git-send-email-srinivasan.s@intel.com>
 <20191001120102.GF1208@intel.com>
In-Reply-To: <20191001120102.GF1208@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYjFhZWM0NzUtYjNmMC00YTIwLWJlMTctYzFiZDRjMGJiMDZlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiQmM2Q1RRMU4wdVNKbU5Tak04dzNiT0dweXIyeVpVdk1KdG1oUm9oQzhYVFRQOE9VblNNNlk1SzhtVXo0NUJKXC8ifQ==
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIGEgbG90IE1hbmFzaSwgVmlsbGUsIE1pa2EsIEphbmksIExha3NobWksIGZvciBhbGwg
eW91ciB0aW1lIGluIHJldmlld2luZyB0aGlzIHBhdGNoLg0KDQpCZXN0IFJlZ2FyZHMsDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBWaWxsZQ0KPiBTeXJq
w6Rsw6QNCj4gU2VudDogVHVlc2RheSwgT2N0b2JlciAxLCAyMDE5IDU6MzEgUE0NCj4gVG86IFMs
IFNyaW5pdmFzYW4gPHNyaW5pdmFzYW4uc0BpbnRlbC5jb20+DQo+IENjOiBOYXZhcmUsIE1hbmFz
aSBEIDxtYW5hc2kuZC5uYXZhcmVAaW50ZWwuY29tPjsgaW50ZWwtDQo+IGdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFZ1ZHVtLA0KPiBM
YWtzaG1pbmFyYXlhbmEgPGxha3NobWluYXJheWFuYS52dWR1bUBpbnRlbC5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0hdIGRybS9pOTE1L2RwOiBGaXggRFAgTVNUIGVycm9yIGFmdGVyIHVucGx1
Z2dpbmcgVHlwZUMNCj4gY2FibGUNCj4gDQo+IE9uIFdlZCwgU2VwIDI1LCAyMDE5IGF0IDA2OjA1
OjQyQU0gKzA1MzAsIHNyaW5pdmFzYW4uc0BpbnRlbC5jb20gd3JvdGU6DQo+ID4gRnJvbTogU3Jp
bml2YXNhbiBTIDxzcmluaXZhc2FuLnNAaW50ZWwuY29tPg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBh
dm9pZHMgRFAgTVNUIHBheWxvYWQgZXJyb3IgbWVzc2FnZSBpbiBkbWVzZywgYXMgaXQgaXMgdHJ5
aW5nDQo+ID4gdG8gdXBkYXRlIHRoZSBwYXlsb2FkIHRvIHRoZSBkaXNjb25uZWN0ZWQgRFAgTVNU
IGRldmljZS4gQWZ0ZXIgRFAgTVNUDQo+ID4gZGV2aWNlIGlzIGRpc2Nvbm5lY3RlZCB3ZSBzaG91
bGQgbm90IGJlIHVwZGF0aW5nIHRoZSBwYXlsb2FkIGFuZA0KPiA+IGhlbmNlIHJlbW92ZSB0aGUg
ZXJyb3IuDQo+ID4NCj4gPiB2MjogUmVtb3ZlZCB0aGUgY29ubmVjdG9yIHN0YXR1cyBjaGVjayBh
bmQgY29udmVydGVkIGZyb20gZXJyb3IgdG8gZGVidWcuDQo+ID4NCj4gPiBCdWd6aWxsYTogaHR0
cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTExNjMyDQo+ID4gU2ln
bmVkLW9mZi1ieTogU3Jpbml2YXNhbiBTIDxzcmluaXZhc2FuLnNAaW50ZWwuY29tPg0KPiANCj4g
UHVzaGVkIHRvIGRpbnEuIFRoYW5rcyBmb3IgdGhlIHBhdGNoLg0KPiANCj4gUFMuIE5leHQgdGlt
ZSBwbGVhc2UgdXNlIC0taW4tcmVwbHktdG8gd2hlbiBzZW5kaW5nIGFuIHVwZGF0ZWQgcGF0Y2gN
Cj4gc28gdGhhdCBpdCdzIGVhc2llciB0byBrZWVwIHRyYWNrIG9mIHRoZSBkaXNjdXNzaW9uLg0K
PiANCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9t
c3QuYyB8IDIgKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kcF9tc3QuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZHBfbXN0LmMNCj4gPiBpbmRleCBlZWViM2Y5MzNhYTQuLjQ5N2E2YWUwZDJjMCAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jDQo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYw0KPiA+IEBA
IC0yMTUsNyArMjE1LDcgQEAgc3RhdGljIHZvaWQgaW50ZWxfbXN0X2Rpc2FibGVfZHAoc3RydWN0
IGludGVsX2VuY29kZXINCj4gKmVuY29kZXIsDQo+ID4NCj4gPiAgCXJldCA9IGRybV9kcF91cGRh
dGVfcGF5bG9hZF9wYXJ0MSgmaW50ZWxfZHAtPm1zdF9tZ3IpOw0KPiA+ICAJaWYgKHJldCkgew0K
PiA+IC0JCURSTV9FUlJPUigiZmFpbGVkIHRvIHVwZGF0ZSBwYXlsb2FkICVkXG4iLCByZXQpOw0K
PiA+ICsJCURSTV9ERUJVR19LTVMoImZhaWxlZCB0byB1cGRhdGUgcGF5bG9hZCAlZFxuIiwgcmV0
KTsNCj4gPiAgCX0NCj4gPiAgCWlmIChvbGRfY3J0Y19zdGF0ZS0+aGFzX2F1ZGlvKQ0KPiA+ICAJ
CWludGVsX2F1ZGlvX2NvZGVjX2Rpc2FibGUoZW5jb2RlciwNCj4gPiAtLQ0KPiA+IDIuNy40DQo+
IA0KPiAtLQ0KPiBWaWxsZSBTeXJqw6Rsw6QNCj4gSW50ZWwNCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdA0K
PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
