Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB0FB73FC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 09:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFC56F8BD;
	Thu, 19 Sep 2019 07:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403636F86C;
 Thu, 19 Sep 2019 07:23:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Sep 2019 00:23:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,522,1559545200"; d="scan'208";a="194300854"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Sep 2019 00:23:34 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 19 Sep 2019 00:23:34 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 19 Sep 2019 00:23:34 -0700
Received: from bgsmsx152.gar.corp.intel.com (10.224.48.50) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 19 Sep 2019 00:23:33 -0700
Received: from bgsmsx110.gar.corp.intel.com ([169.254.11.62]) by
 BGSMSX152.gar.corp.intel.com ([169.254.6.192]) with mapi id 14.03.0439.000;
 Thu, 19 Sep 2019 12:53:31 +0530
From: "S, Srinivasan" <srinivasan.s@intel.com>
To: "Navare, Manasi D" <manasi.d.navare@intel.com>,
 =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH] drm/i915/dp: Fix DP MST error after unplugging TypeC cable
Thread-Topic: [PATCH] drm/i915/dp: Fix DP MST error after unplugging TypeC
 cable
Thread-Index: AQHVbcLYoWnzB/UohEOqpJcMyAe3x6cxW3GAgAAF2gCAAAPgAIABMznw
Date: Thu, 19 Sep 2019 07:23:30 +0000
Message-ID: <BFA53C78450B204BBCED0B0A62E9EAE73254C690@BGSMSX110.gar.corp.intel.com>
References: <1568770783-169735-1-git-send-email-srinivasan.s@intel.com>
 <20190918175038.GA31062@intel.com> <20190918181136.GQ1208@intel.com>
 <20190918182528.GB31062@intel.com>
In-Reply-To: <20190918182528.GB31062@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOGQ4N2MxNTMtMzRkNy00MDJmLTljZTItZTJjZDEwZTMwZTkwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiNm5BcHBjSUtyUWozQ0dNV1ZKcktqZHZXTU1BXC9jaGxNbzE2XC9GeWd6YzJVZ0l0VGxRaWFtbUVqSElVbUkwOEFHIn0=
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

V291bGQgdGhlIGZvbGxvd2luZyBiZSBhcHByb3ByaWF0ZSBmaXg/DQoNCiAgICAgICAgaWYgKGNv
bm5lY3RvciB8fCBjb25uZWN0b3ItPmJhc2Uuc3RhdHVzID09IGNvbm5lY3Rvcl9zdGF0dXNfY29u
bmVjdGVkKSB7DQogICAgICAgICAgICAgICAgcmV0ID0gZHJtX2RwX3VwZGF0ZV9wYXlsb2FkX3Bh
cnQxKCZpbnRlbF9kcC0+bXN0X21ncik7DQogICAgICAgICAgICAgICAgaWYgKHJldCkgew0KICAg
ICAgICAgICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJmYWlsZWQgdG8gdXBkYXRlIHBheWxvYWQg
JWRcbiIsIHJldCk7DQogICAgICAgICAgICAgICAgfQ0KICAgICAgICB9DQoNClJlZ2FyZHMsDQot
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwtYm91
bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBNYW5hc2kgTmF2YXJlDQpT
ZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAxOCwgMjAxOSAxMTo1NSBQTQ0KVG86IFZpbGxlIFN5
cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQpDYzogUywgU3Jpbml2YXNh
biA8c3Jpbml2YXNhbi5zQGludGVsLmNvbT47IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiBbUEFUQ0hd
IGRybS9pOTE1L2RwOiBGaXggRFAgTVNUIGVycm9yIGFmdGVyIHVucGx1Z2dpbmcgVHlwZUMgY2Fi
bGUNCg0KT24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMDk6MTE6MzZQTSArMDMwMCwgVmlsbGUgU3ly
asOkbMOkIHdyb3RlOg0KPiBPbiBXZWQsIFNlcCAxOCwgMjAxOSBhdCAxMDo1MDozOUFNIC0wNzAw
LCBNYW5hc2kgTmF2YXJlIHdyb3RlOg0KPiA+IE9uIFdlZCwgU2VwIDE4LCAyMDE5IGF0IDA3OjA5
OjQzQU0gKzA1MzAsIHNyaW5pdmFzYW4uc0BpbnRlbC5jb20gd3JvdGU6DQo+ID4gPiBGcm9tOiBT
cmluaXZhc2FuIFMgPHNyaW5pdmFzYW4uc0BpbnRlbC5jb20+DQo+ID4gPiANCj4gPiA+IFRoaXMg
cGF0Y2ggYXZvaWRzIERQIE1TVCBwYXlsb2FkIGVycm9yIG1lc3NhZ2UgaW4gZG1lc2csIGFzIGl0
IGlzIA0KPiA+ID4gdHJ5aW5nIHRvIHJlYWQgdGhlIHBheWxvYWQgZnJvbSB0aGUgZGlzY29ubmVj
dGVkIERQIE1TVCBkZXZpY2UuIA0KPiA+ID4gQWZ0ZXIgdGhlIHVucGx1ZyB0aGUgY29ubmVjdG9y
IHN0YXR1cyBpcyBkaXNjb25uZWN0ZWQgYW5kIHdlIA0KPiA+ID4gc2hvdWxkIG5vdCBiZSBsb29r
aW5nIGZvciB0aGUgcGF5bG9hZCBhbmQgaGVuY2UgcmVtb3ZlIHRoZSBlcnJvciBhbmQgdGhyb3cg
dGhlIHdhcm5pbmcuDQo+ID4gPiANCj4gPiA+IFRoaXMgZGV0YWlscyBjYW4gYmUgZm91bmQgaW46
DQo+ID4gPiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTE2
MzINCj4gPiANCj4gPiBQbGVhc2UgYWRkIHRoaXMgbGluayBhcyBCdWd6aWxsYTogDQo+ID4gaHR0
cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTExNjMyIGFmdGVyIHRo
ZSBTaWduIA0KPiA+IG9mZiBzdGF0ZW1lbnQNCj4gPiANCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9m
Zi1ieTogU3Jpbml2YXNhbiBTIDxzcmluaXZhc2FuLnNAaW50ZWwuY29tPg0KPiA+ID4gLS0tDQo+
ID4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYyB8IDcgKysr
KysrLQ0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZHBfbXN0LmMgDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZHBfbXN0LmMNCj4gPiA+IGluZGV4IGVlZWIzZjkzM2FhNC4uNWIyMjc4ZmRmNjc1IDEw
MDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9t
c3QuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9t
c3QuYw0KPiA+ID4gQEAgLTIxNSw3ICsyMTUsMTIgQEAgc3RhdGljIHZvaWQgaW50ZWxfbXN0X2Rp
c2FibGVfZHAoc3RydWN0IA0KPiA+ID4gaW50ZWxfZW5jb2RlciAqZW5jb2RlciwNCj4gPiA+ICAN
Cj4gPiA+ICAJcmV0ID0gZHJtX2RwX3VwZGF0ZV9wYXlsb2FkX3BhcnQxKCZpbnRlbF9kcC0+bXN0
X21ncik7DQo+ID4gPiAgCWlmIChyZXQpIHsNCj4gPiA+IC0JCURSTV9FUlJPUigiZmFpbGVkIHRv
IHVwZGF0ZSBwYXlsb2FkICVkXG4iLCByZXQpOw0KPiA+ID4gKwkJaWYgKCFjb25uZWN0b3IgfHwN
Cj4gPiA+ICsJCSAgICBjb25uZWN0b3ItPmJhc2Uuc3RhdHVzICE9IGNvbm5lY3Rvcl9zdGF0dXNf
Y29ubmVjdGVkKSB7DQo+ID4gPiArCQkJRFJNX1dBUk4oIkRQIE1TVCBkaXNjb25uZWN0XG4iKTsN
Cj4gPiANCj4gPiBNYXkgYmUgYWRkaW5nIHRoaXMgY2hlY2sgYmVmb3JlIGNhbGxpbmcgZHJtX2Rw
X3VwZGF0ZV9wYXlsb2FkX3BhcnQxKCkgaXMgYSBiZXR0ZXIgaWRlYT8NCj4gPiBJZiB0aGUgY29u
bmVjdG9yIGlzIGRpc2Nvbm5lY3RlZCwgd2h5IHVwZGF0ZSBwYXlsb2FkPw0KPiA+IA0KPiA+IEph
bmksIFZpbGxlLCB0aG91Z2h0cz8NCj4gDQo+IE9yIGp1c3QgY29udmVydCBpdCB0byBhIGRlYnVn
Pw0KDQpTdXJlIHRoYXQgd2lsbCB3b3JrLCBidXQgZG8gd2UgcmVhbGx5IHdhbnQgdG8gdXBkYXRl
IHRoZSBwYXlsb2FkIGlmIHRoZSBjb25uZWN0b3Igc3RhdHVzIGlzIGRpc2Nvbm5lY3RlZC4NClNv
IHNob3VsZG50IGNoZWNraW5nIHRoYXQgYmVmb3JlIGNhbGxpbmcgdGhlIGZ1bmN0aW9uIGJlIGEg
YmV0dGVyIGZpeD8NCg0KTWFuYXNpDQoNCj4gDQo+ID4gDQo+ID4gUmVnYXJkcw0KPiA+IE1hbmFz
aQ0KPiA+IA0KPiA+ID4gKwkJfSBlbHNlIHsNCj4gPiA+ICsJCQlEUk1fRVJST1IoImZhaWxlZCB0
byB1cGRhdGUgcGF5bG9hZCAlZFxuIiwgcmV0KTsNCj4gPiA+ICsJCX0NCj4gPiA+ICAJfQ0KPiA+
ID4gIAlpZiAob2xkX2NydGNfc3RhdGUtPmhhc19hdWRpbykNCj4gPiA+ICAJCWludGVsX2F1ZGlv
X2NvZGVjX2Rpc2FibGUoZW5jb2RlciwNCj4gPiA+IC0tDQo+ID4gPiAyLjcuNA0KPiA+ID4gDQo+
IA0KPiAtLQ0KPiBWaWxsZSBTeXJqw6Rsw6QNCj4gSW50ZWwNCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdA0K
PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KZHJpLWRldmVsIG1haWxpbmcgbGlzdA0KZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
