Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D06515102C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 20:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6436ECB2;
	Mon,  3 Feb 2020 19:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EE26E406;
 Mon,  3 Feb 2020 19:15:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 11:15:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="224037082"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga008.jf.intel.com with ESMTP; 03 Feb 2020 11:15:27 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 11:15:26 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 3 Feb 2020 11:15:26 -0800
Received: from bgsmsx151.gar.corp.intel.com (10.224.48.42) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 3 Feb 2020 11:15:26 -0800
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.36]) by
 BGSMSX151.gar.corp.intel.com ([169.254.3.133]) with mapi id 14.03.0439.000;
 Tue, 4 Feb 2020 00:45:24 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Alex Deucher <alexdeucher@gmail.com>, Ville Syrjala
 <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH 1/8] drm/edid: Check the number of detailed timing
 descriptors in the CEA ext block
Thread-Topic: [PATCH 1/8] drm/edid: Check the number of detailed timing
 descriptors in the CEA ext block
Thread-Index: AQHV0vFXK1sG5qbIKUK8NFpJa5DybKf+wcCAgAskZ3A=
Date: Mon, 3 Feb 2020 19:15:23 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F823A9F5E@BGSMSX104.gar.corp.intel.com>
References: <20200124200231.10517-1-ville.syrjala@linux.intel.com>
 <CADnq5_O_grxxHULror9+HYZM-Cvn5CTeLz10chpNKa_YCexzjA@mail.gmail.com>
In-Reply-To: <CADnq5_O_grxxHULror9+HYZM-Cvn5CTeLz10chpNKa_YCexzjA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNGQxOWVkOTUtOTIyOS00NmJiLTg4YTgtNzVkZjdlNWE1Yjc2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiNHZuN2tpTW5heENFV2dwem5rSDJtZmFDS0xGT0JldzBRK0lNcFwvQVRoczNwUnhOMnNvd3E0QmFkNGJPNFlvZ2EifQ==
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZHJpLWRldmVsIDxkcmkt
ZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBBbGV4DQo+
IERldWNoZXINCj4gU2VudDogVHVlc2RheSwgSmFudWFyeSAyOCwgMjAyMCA0OjA0IEFNDQo+IFRv
OiBWaWxsZSBTeXJqYWxhIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IEFs
bGVuIENoZW4gPGFsbGVuLmNoZW5AaXRlLmNvbS50dz47IEludGVsIEdyYXBoaWNzIERldmVsb3Bt
ZW50IDxpbnRlbC0NCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IE1hbGluZyBsaXN0IC0g
RFJJIGRldmVsb3BlcnMgPGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIDEvOF0gZHJtL2VkaWQ6IENoZWNrIHRoZSBudW1iZXIgb2YgZGV0
YWlsZWQgdGltaW5nIGRlc2NyaXB0b3JzDQo+IGluIHRoZSBDRUEgZXh0IGJsb2NrDQo+IA0KPiBP
biBGcmksIEphbiAyNCwgMjAyMCBhdCAzOjAzIFBNIFZpbGxlIFN5cmphbGEgPHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tPiB3cm90ZToNCj4gPg0KPiA+IEZyb206IFZpbGxlIFN5cmrDpGzD
pCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+ID4NCj4gPiBDRUEtODYxIHNheXMg
Og0KPiA+ICJkID0gb2Zmc2V0IGZvciB0aGUgYnl0ZSBmb2xsb3dpbmcgdGhlIHJlc2VydmVkIGRh
dGEgYmxvY2suDQo+ID4gIElmIG5vIGRhdGEgaXMgcHJvdmlkZWQgaW4gdGhlIHJlc2VydmVkIGRh
dGEgYmxvY2ssIHRoZW4gZD00Lg0KPiA+ICBJZiBubyBEVERzIGFyZSBwcm92aWRlZCwgdGhlbiBk
PTAuIg0KPiA+DQo+ID4gU28gbGV0J3Mgbm90IGxvb2sgZm9yIERURHMgd2hlbiBkPT0wLiBJbiBm
YWN0IGxldCdzIGp1c3QgbWFrZSB0aGF0DQo+ID4gPDQgc2luY2UgdGhvc2UgdmFsdWVzIHdvdWxk
IGp1c3QgbWVhbiB0aGF0IGhlIERURHMgb3ZlcmxhcCB0aGUgYmxvY2sNCj4gPiBoZWFkZXIuIEFu
ZCBsZXQncyBhbHNvIGNoZWNrIHRoYXQgZCBpc24ndCBzbyBiaWcgYXMgdG8gZGVjbGFyZSB0aGUN
Cj4gPiBkZXNjcmlwdG9ycyB0byBsaXZlIHBhc3QgdGhlIGJsb2NrIGVuZCwgYWx0aG91Z2ggdGhl
IGNvZGUgZG9lcyBhbHJlYWR5DQo+ID4gc3Vydml2ZSB0aGF0IGNhc2UgYXMgd2UnZCBqdXN0IGVu
ZCB1cCB3aXRoIGEgbmVnYXRpdmUgbnVtYmVyIG9mDQo+ID4gZGVzY3JpcHRvcnMgYW5kIHRoZSBs
b29wIHdvdWxkIG5vdCBkbyBhbnl0aGluZy4NCj4gPg0KPiA+IENjOiBBbGxlbiBDaGVuIDxhbGxl
bi5jaGVuQGl0ZS5jb20udHc+DQo+ID4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gDQo+IEFja2VkLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQoNCkxvb2tzIGdvb2QgdG8gbWUgYXMgd2Vs
bC4NClJldmlld2VkLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPg0KDQo+
ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIHwgNSArKysrLQ0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2VkaWQuYw0KPiA+IGluZGV4IDk5NzY5ZDZjOWY4NC4uMWI2ZTU0NGNmNWM3IDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jDQo+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9lZGlkLmMNCj4gPiBAQCAtMjIwMSwxMCArMjIwMSwxMyBAQCB0eXBlZGVmIHZv
aWQgZGV0YWlsZWRfY2Ioc3RydWN0DQo+ID4gZGV0YWlsZWRfdGltaW5nICp0aW1pbmcsIHZvaWQg
KmNsb3N1cmUpOyAgc3RhdGljIHZvaWQNCj4gPiAgY2VhX2Zvcl9lYWNoX2RldGFpbGVkX2Jsb2Nr
KHU4ICpleHQsIGRldGFpbGVkX2NiICpjYiwgdm9pZCAqY2xvc3VyZSkNCj4gPiB7DQo+ID4gLSAg
ICAgICBpbnQgaSwgbiA9IDA7DQo+ID4gKyAgICAgICBpbnQgaSwgbjsNCj4gPiAgICAgICAgIHU4
IGQgPSBleHRbMHgwMl07DQo+ID4gICAgICAgICB1OCAqZGV0X2Jhc2UgPSBleHQgKyBkOw0KPiA+
DQo+ID4gKyAgICAgICBpZiAoZCA8IDQgfHwgZCA+IDEyNykNCj4gPiArICAgICAgICAgICAgICAg
cmV0dXJuOw0KPiA+ICsNCj4gPiAgICAgICAgIG4gPSAoMTI3IC0gZCkgLyAxODsNCj4gPiAgICAg
ICAgIGZvciAoaSA9IDA7IGkgPCBuOyBpKyspDQo+ID4gICAgICAgICAgICAgICAgIGNiKChzdHJ1
Y3QgZGV0YWlsZWRfdGltaW5nICopKGRldF9iYXNlICsgMTggKiBpKSwNCj4gPiBjbG9zdXJlKTsN
Cj4gPiAtLQ0KPiA+IDIuMjQuMQ0KPiA+DQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCj4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0DQo+ID4gZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsDQo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QNCj4g
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
