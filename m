Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF9614E3AA
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 21:07:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12BB16E8F8;
	Thu, 30 Jan 2020 20:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FFB6E8F8;
 Thu, 30 Jan 2020 20:07:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jan 2020 12:07:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,382,1574150400"; d="scan'208";a="218391616"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga007.jf.intel.com with ESMTP; 30 Jan 2020 12:07:09 -0800
Received: from fmsmsx122.amr.corp.intel.com (10.18.125.37) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 30 Jan 2020 12:07:08 -0800
Received: from fmsmsx117.amr.corp.intel.com ([169.254.3.3]) by
 fmsmsx122.amr.corp.intel.com ([169.254.5.232]) with mapi id 14.03.0439.000;
 Thu, 30 Jan 2020 12:07:08 -0800
From: "Souza, Jose" <jose.souza@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 4/4] drm/i915/display: Set TRANS_DDI_MODE_SELECT to
 default value when disabling TRANS_DDI
Thread-Topic: [PATCH 4/4] drm/i915/display: Set TRANS_DDI_MODE_SELECT to
 default value when disabling TRANS_DDI
Thread-Index: AQHVzNmm2x0yzyk6CEWhvTCt/1Z32agEENEAgAAtSYA=
Date: Thu, 30 Jan 2020 20:07:07 +0000
Message-ID: <2c578720445cfb0a036502b7dba94f1ebd2e8ca0.camel@intel.com>
References: <20200117015837.402239-1-jose.souza@intel.com>
 <20200117015837.402239-4-jose.souza@intel.com>
 <20200130172502.GH13686@intel.com>
In-Reply-To: <20200130172502.GH13686@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.12.250]
Content-ID: <18FCD5377E8A7E4AA8245EB58F68FE24@intel.com>
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

T24gVGh1LCAyMDIwLTAxLTMwIGF0IDE5OjI1ICswMjAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIFRodSwgSmFuIDE2LCAyMDIwIGF0IDA1OjU4OjM3UE0gLTA4MDAsIEpvc8OpIFJvYmVy
dG8gZGUgU291emENCj4gd3JvdGU6DQo+ID4gVEdMIHRpbWVvdXRzIHdoZW4gZGlzYWJsaW5nIE1T
VCB0cmFuc2NvZGVyIGFuZCBmaWZvIHVuZGVycnVucyBvdmVyDQo+ID4gTVNUDQo+ID4gdHJhbnNj
b2RlcnMgYXJlIGZpeGVkIHdoZW4gc2V0dGluZyBUUkFOU19ERElfTU9ERV9TRUxFQ1QgdG8gMChI
RE1JDQo+ID4gbW9kZSkgZHVyaW5nIHRoZSBkaXNhYmxlIHNlcXVlbmNlLg0KPiA+IA0KPiA+IEFs
dGhvdWdoIEJTcGVjIGRpc2FibGUgc2VxdWVuY2UgZG9uJ3QgcmVxdWlyZSB0aGlzIHN0ZXAgaXQg
aXMgYQ0KPiA+IGhhcm1sZXNzIGNoYW5nZSBhbmQgaXQgaXMgYWxzbyBkb25lIGJ5IFdpbmRvd3Mg
ZHJpdmVyLg0KPiA+IEFueWhvdyBIVyB0ZWFtIHdhcyBub3RpZmllZCBhYm91dCB0aGF0IGJ1dCBp
dCBjYW4gdGFrZSBzb21lIHRpbWUgdG8NCj4gPiBkb2N1bWVudGF0aW9uIHRvIGJlIHVwZGF0ZWQu
DQo+ID4gDQo+ID4gQSBjYXNlIHRoYXQgYWx3YXlzIGxlYWQgdG8gdGhvc2UgaXNzdWVzIGlzOg0K
PiA+IC0gZG8gYSBtb2Rlc2V0IGVuYWJsaW5nIHBpcGUgQSBhbmQgcGlwZSBCIGluIHRoZSBzYW1l
IE1TVCBzdHJlYW0NCj4gPiBsZWF2aW5nIEEgYXMgbWFzdGVyDQo+ID4gLSBkaXNhYmxlIHBpcGUg
QSwgcHJvbW90ZSBCIGFzIG1hc3RlciBkb2luZyBhIGZ1bGwgbW9kZXNldCBpbiBBDQo+ID4gLSBl
bmFibGUgcGlwZSBBLCBjaGFuZ2luZyB0aGUgbWFzdGVyIHRyYW5zY29kZXIgYmFjayB0byBBKGRv
aW5nIGENCj4gPiBmdWxsIG1vZGVzZXQgaW4gQikNCj4gPiAtIFBvdzogdW5kZXJydW5zIGFuZCB0
aW1lb3V0cw0KPiA+IA0KPiA+IFRoZSB0cmFuc2NvZGVycyBpbnZvbHZlZCB3aWxsIG9ubHkgd29y
ayBhZ2FpbiB3aGVuIGNvbXBsZXRlDQo+ID4gZGlzYWJsZWQNCj4gPiBhbmQgdGhlaXIgcG93ZXIg
d2VsbHMgdHVybmVkIG9mZiBjYXVzaW5nIGEgcmVzZXQgaW4gdGhlaXINCj4gPiByZWdpc3RlcnMu
DQo+ID4gDQo+ID4gQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRl
bC5jb20+DQo+ID4gQ2M6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+
ID4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRl
bC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZGRpLmMgfCAxICsNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4gDQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMN
Cj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMNCj4gPiBpbmRl
eCAzMmVhM2M3ZThiNjIuLjgyZTkwZjI3MTk3NCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYw0KPiA+IEBAIC0xOTk3LDYgKzE5OTcsNyBAQCB2b2lk
IGludGVsX2RkaV9kaXNhYmxlX3RyYW5zY29kZXJfZnVuYyhjb25zdA0KPiA+IHN0cnVjdCBpbnRl
bF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlDQo+ID4gIA0KPiA+ICAJdmFsID0gSTkxNV9SRUFEKFRS
QU5TX0RESV9GVU5DX0NUTChjcHVfdHJhbnNjb2RlcikpOw0KPiA+ICAJdmFsICY9IH5UUkFOU19E
RElfRlVOQ19FTkFCTEU7DQo+ID4gKwl2YWwgJj0gflRSQU5TX0RESV9NT0RFX1NFTEVDVF9NQVNL
Ow0KPiANCj4gRmVlbHMgYSBiaXQgZWFybHkgc2luY2UgSUlSQyB3ZSBzdGlsbCBsZWF2ZSBhIGJ1
bmNoIG9mIG90aGVyIHN0dWZmDQo+IGVuYWJsZWQvc2VsZWN0ZWQgaGVyZS4gSW4gZmFjdCB3ZSBk
b24ndCBzZWVtIHRvIGJlIGNsZWFyaW5nIHRoZSBEREkNCj4gc2VsZWN0DQo+IGFueXdoZXJlIGF0
IGFsbD8gVGhhdCBvbmUgSSB3b3VsZCBiZSBtb3JlIHN1c3BpY2lvdXMgb2YgdGhhbiB0aGUNCj4g
bW9kZS4NCj4gQnV0IG1heWJlIHdlIHNob3VsZCBqdXN0IGNsZWFyIGJvdGggc29tZXdoZXJlPyBJ
IHdvdWxkIHN1Z2dlc3QgaXQNCj4gc2hvdWxkDQo+IGJlIHdoZW4gd2UgY2xlYXIgdGhlIHBvcnQg
c2VsZWN0IGZpbmFsbHkuDQoNCldlIGFyZSBjbGVhcmluZyBEREkgc2VsZWN0LCBpbiBvdXIgY29k
ZSBpdCBpcyBuYW1lZCBhcw0KVEdMX1RSQU5TX0RESV9QT1JUX01BU0svVFJBTlNfRERJX1BPUlRf
TUFTSy4NCg0KRm9yIFRHTCBpbiBNU1QgbW9kZSB3ZSBjbGVhciBEREkgc2VsZWN0IGluIHRoZSBi
bG9jayBiZWxvdyBmb3IgTVNUDQpzbGF2ZXMgYW5kIHRoZW4gaW4gaW50ZWxfZGRpX3Bvc3RfZGlz
YWJsZV9kcCgpIGZvciBNU1QgbWFzdGVyIGFzDQppbnN0cnVjdGVkIGJ5IERpc3BsYXkgcG9ydCBz
ZXF1ZW5jZXMuDQoNCj4gDQo+ID4gIA0KPiA+ICAJaWYgKElOVEVMX0dFTihkZXZfcHJpdikgPj0g
MTIpIHsNCj4gPiAgCQlpZiAoIWludGVsX2RwX21zdF9pc19tYXN0ZXJfdHJhbnMoY3J0Y19zdGF0
ZSkpDQo+ID4gLS0gDQo+ID4gMi4yNS4wDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
