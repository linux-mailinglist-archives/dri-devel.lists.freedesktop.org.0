Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0871D210091
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 01:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909C26E2BD;
	Tue, 30 Jun 2020 23:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09AD86E045;
 Tue, 30 Jun 2020 23:45:18 +0000 (UTC)
IronPort-SDR: 390LD79qv4LEvnv9hb+piXIeWWJpx36Fi2aIuZqHkfnKbiREkhmUed9cbMV9Ve3XeoRmBVZ/KS
 KkIyUwV5uc3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="147962823"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="147962823"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 16:45:17 -0700
IronPort-SDR: M/lWdvJF6xOT30yiA/ODOvQjvqvhykrNvj5mL4JvbvlrefieBI+8lPgNQ40gb++DMK1mep5JCy
 wPphKsBd+lsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="386842407"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga001.fm.intel.com with ESMTP; 30 Jun 2020 16:44:45 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 30 Jun 2020 16:44:35 -0700
Received: from FMSMSX109.amr.corp.intel.com (10.18.116.9) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 30 Jun 2020 16:44:35 -0700
Received: from fmsmsx116.amr.corp.intel.com ([169.254.2.40]) by
 FMSMSX109.amr.corp.intel.com ([169.254.15.60]) with mapi id 14.03.0439.000;
 Tue, 30 Jun 2020 16:42:37 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/edid: Allow looking for ext blocks
 starting from a specified index
Thread-Topic: [Intel-gfx] [PATCH 1/3] drm/edid: Allow looking for ext blocks
 starting from a specified index
Thread-Index: AQHWNCc3IN3v06eUAkirs4qIFB7AY6jyfcIA
Date: Tue, 30 Jun 2020 23:42:36 +0000
Message-ID: <8f1e0c7ad218ddf20167ae90d623fb7eec9422c9.camel@intel.com>
References: <20200527130310.27099-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200527130310.27099-1-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.76.92]
Content-ID: <D1E87B82C350F04BAF52255B671AEEB6@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIwLTA1LTI3IGF0IDE2OjAzICswMzAwLCBWaWxsZSBTeXJqYWxhIHdyb3RlOg0K
PiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0K
PiANCj4gQXBwYXJlbnRseSBFRElEcyB3aXRoIG11bHRpcGxlIERpc3BJRCBleHQgYmxvY2tzIGlz
IGEgdGhpbmcsIHNvIHByZXBhcmUNCj4gZm9yIGl0ZXJhdGluZyB0aHJvdWdoIG11bHRpcGxlIGV4
dCBibG9ja3Mgb2YgdGhlIHNhbWUgdHlwZSBieQ0KPiBwYXNzaW5nIHRoZSBzdGFydGluZyBleHQg
YmxvY2sgaW5kZXggdG8gZHJtX2ZpbmRfZWRpZF9leHRlbnNpb24oKS4gV2VsbA0KPiBhbHNvIGhh
dmUgZHJtX2ZpbmRfZWRpZF9leHRlbnNpb24oKSB1cGRhdGUgdGhlIGluZGV4IHRvIHBvaW50IHRv
IHRoZQ0KPiBuZXh0IGV4dCBibG9jayBvbiBzdWNjZXNzLiBUaHVzIHdlIHNob3VsZCBiZSBhYmxl
IHRvIGNhbGwNCj4gZHJtX2ZpbmRfZWRpZF9leHRlbnNpb24oKSBpbiBsb29wLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNv
bT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyB8IDMwICsrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyks
IDkgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9l
ZGlkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYw0KPiBpbmRleCBkODM3MmQ2Mzg1MWIu
LmYyNTMxZDUxZGZhMiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMNCj4gQEAgLTMxODgsNyArMzE4OCw4
IEBAIGFkZF9kZXRhaWxlZF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLCBz
dHJ1Y3QgZWRpZCAqZWRpZCwNCj4gIC8qDQo+ICAgKiBTZWFyY2ggRURJRCBmb3IgQ0VBIGV4dGVu
c2lvbiBibG9jay4NCj4gICAqLw0KPiAtc3RhdGljIHU4ICpkcm1fZmluZF9lZGlkX2V4dGVuc2lv
bihjb25zdCBzdHJ1Y3QgZWRpZCAqZWRpZCwgaW50IGV4dF9pZCkNCj4gK3N0YXRpYyB1OCAqZHJt
X2ZpbmRfZWRpZF9leHRlbnNpb24oY29uc3Qgc3RydWN0IGVkaWQgKmVkaWQsDQo+ICsJCQkJICAg
aW50IGV4dF9pZCwgaW50ICpleHRfaW5kZXgpDQo+ICB7DQo+ICAJdTggKmVkaWRfZXh0ID0gTlVM
TDsNCj4gIAlpbnQgaTsNCj4gQEAgLTMxOTgsMjMgKzMxOTksMjYgQEAgc3RhdGljIHU4ICpkcm1f
ZmluZF9lZGlkX2V4dGVuc2lvbihjb25zdCBzdHJ1Y3QgZWRpZCAqZWRpZCwgaW50IGV4dF9pZCkN
Cj4gIAkJcmV0dXJuIE5VTEw7DQo+ICANCj4gIAkvKiBGaW5kIENFQSBleHRlbnNpb24gKi8NCj4g
LQlmb3IgKGkgPSAwOyBpIDwgZWRpZC0+ZXh0ZW5zaW9uczsgaSsrKSB7DQo+ICsJZm9yIChpID0g
KmV4dF9pbmRleDsgaSA8IGVkaWQtPmV4dGVuc2lvbnM7IGkrKykgew0KPiAgCQllZGlkX2V4dCA9
ICh1OCAqKWVkaWQgKyBFRElEX0xFTkdUSCAqIChpICsgMSk7DQo+ICAJCWlmIChlZGlkX2V4dFsw
XSA9PSBleHRfaWQpDQo+ICAJCQlicmVhazsNCj4gIAl9DQo+ICANCj4gLQlpZiAoaSA9PSBlZGlk
LT5leHRlbnNpb25zKQ0KPiArCWlmIChpID49IGVkaWQtPmV4dGVuc2lvbnMpDQo+ICAJCXJldHVy
biBOVUxMOw0KPiAgDQo+ICsJKmV4dF9pbmRleCA9IGkgKyAxOw0KPiArDQo+ICAJcmV0dXJuIGVk
aWRfZXh0Ow0KPiAgfQ0KPiAgDQoNCkkgd291bGQgYWRkIHNvbWV0aGluZyBsaWtlIGRybV9maW5k
X2VkaWRfbl9leHRlbnNpb24oKSB3aXRoIHRoZSBpbXBsZW1lbnRhdGlvbiBhYm92ZSBhbmQgdGhl
biBpbXBsZW1lbnQgZHJtX2ZpbmRfZWRpZF9leHRlbnNpb24oKSBjYWxsaW5nDQpkcm1fZmluZF9l
ZGlkX25fZXh0ZW5zaW9uKCkgYnV0IGl0IGlzIGp1c3Qgb25lIGNhbGxlciB0aGF0IGlzIG5vdCB1
c2luZyBleHRfaW5kZXggc28gTEdUTS4NCg0KPiAgDQo+ICBzdGF0aWMgdTggKmRybV9maW5kX2Rp
c3BsYXlpZF9leHRlbnNpb24oY29uc3Qgc3RydWN0IGVkaWQgKmVkaWQsDQo+IC0JCQkJCWludCAq
bGVuZ3RoLCBpbnQgKmlkeCkNCj4gKwkJCQkJaW50ICpsZW5ndGgsIGludCAqaWR4LA0KPiArCQkJ
CQlpbnQgKmV4dF9pbmRleCkNCj4gIHsNCj4gLQl1OCAqZGlzcGxheWlkID0gZHJtX2ZpbmRfZWRp
ZF9leHRlbnNpb24oZWRpZCwgRElTUExBWUlEX0VYVCk7DQo+ICsJdTggKmRpc3BsYXlpZCA9IGRy
bV9maW5kX2VkaWRfZXh0ZW5zaW9uKGVkaWQsIERJU1BMQVlJRF9FWFQsIGV4dF9pbmRleCk7DQo+
ICAJc3RydWN0IGRpc3BsYXlpZF9oZHIgKmJhc2U7DQo+ICAJaW50IHJldDsNCj4gIA0KPiBAQCAt
MzI0MSwxNCArMzI0NSwxOCBAQCBzdGF0aWMgdTggKmRybV9maW5kX2NlYV9leHRlbnNpb24oY29u
c3Qgc3RydWN0IGVkaWQgKmVkaWQpDQo+ICAJc3RydWN0IGRpc3BsYXlpZF9ibG9jayAqYmxvY2s7
DQo+ICAJdTggKmNlYTsNCj4gIAl1OCAqZGlzcGxheWlkOw0KPiArCWludCBleHRfaW5kZXg7DQo+
ICANCj4gIAkvKiBMb29rIGZvciBhIHRvcCBsZXZlbCBDRUEgZXh0ZW5zaW9uIGJsb2NrICovDQo+
IC0JY2VhID0gZHJtX2ZpbmRfZWRpZF9leHRlbnNpb24oZWRpZCwgQ0VBX0VYVCk7DQo+ICsJZXh0
X2luZGV4ID0gMDsNCg0KSW4gMiBwbGFjZXMgZXh0X2luZGV4IGlzIGluaXRpYWxpemVkIGluIHRo
ZSB2YXJpYWJsZSBkZWNsYXJhdGlvbiBhbmQgaW4gMiBvdGhlciBwbGFjZXMgaXMgbm90LCBhbGwg
b2YgaXQgY291bGQgYmUgZG9uZSBpbiB0aGUgZGVjbGFyYXRpb24gb3IgaWYgeW91DQpyZWFsbHkg
d2FudCB0byBsZWF2ZSB0aGUgY29udGV4dCBjbG9zZSB0byB0aGUgdXNlcnMsIGluaXRpYWxpemUg
aXQgaW4gdGhlICJmb3IgKDs7KSIgaW4gdGhlIG5leHQgcGF0Y2guDQoNCldpdGggdGhlIGNoYW5n
ZSBhYm92ZToNCg0KUmV2aWV3ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291
emFAaW50ZWwuY29tPg0KDQo+ICsJY2VhID0gZHJtX2ZpbmRfZWRpZF9leHRlbnNpb24oZWRpZCwg
Q0VBX0VYVCwgJmV4dF9pbmRleCk7DQo+ICAJaWYgKGNlYSkNCj4gIAkJcmV0dXJuIGNlYTsNCj4g
IA0KPiAgCS8qIENFQSBibG9ja3MgY2FuIGFsc28gYmUgZm91bmQgZW1iZWRkZWQgaW4gYSBEaXNw
bGF5SUQgYmxvY2sgKi8NCj4gLQlkaXNwbGF5aWQgPSBkcm1fZmluZF9kaXNwbGF5aWRfZXh0ZW5z
aW9uKGVkaWQsICZsZW5ndGgsICZpZHgpOw0KPiArCWV4dF9pbmRleCA9IDA7DQo+ICsJZGlzcGxh
eWlkID0gZHJtX2ZpbmRfZGlzcGxheWlkX2V4dGVuc2lvbihlZGlkLCAmbGVuZ3RoLCAmaWR4LA0K
PiArCQkJCQkJICZleHRfaW5kZXgpOw0KPiAgCWlmICghZGlzcGxheWlkKQ0KPiAgCQlyZXR1cm4g
TlVMTDsNCj4gIA0KPiBAQCAtNTE5NSw4ICs1MjAzLDEwIEBAIHN0YXRpYyBpbnQgYWRkX2Rpc3Bs
YXlpZF9kZXRhaWxlZF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLA0KPiAg
CWludCBsZW5ndGgsIGlkeDsNCj4gIAlzdHJ1Y3QgZGlzcGxheWlkX2Jsb2NrICpibG9jazsNCj4g
IAlpbnQgbnVtX21vZGVzID0gMDsNCj4gKwlpbnQgZXh0X2luZGV4ID0gMDsNCj4gIA0KPiAtCWRp
c3BsYXlpZCA9IGRybV9maW5kX2Rpc3BsYXlpZF9leHRlbnNpb24oZWRpZCwgJmxlbmd0aCwgJmlk
eCk7DQo+ICsJZGlzcGxheWlkID0gZHJtX2ZpbmRfZGlzcGxheWlkX2V4dGVuc2lvbihlZGlkLCAm
bGVuZ3RoLCAmaWR4LA0KPiArCQkJCQkJICZleHRfaW5kZXgpOw0KPiAgCWlmICghZGlzcGxheWlk
KQ0KPiAgCQlyZXR1cm4gMDsNCj4gIA0KPiBAQCAtNTg3MCwxMSArNTg4MCwxMyBAQCB2b2lkIGRy
bV91cGRhdGVfdGlsZV9pbmZvKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsDQo+ICAJ
CQkgIGNvbnN0IHN0cnVjdCBlZGlkICplZGlkKQ0KPiAgew0KPiAgCWNvbnN0IHZvaWQgKmRpc3Bs
YXlpZCA9IE5VTEw7DQo+ICsJaW50IGV4dF9pbmRleCA9IDA7DQo+ICAJaW50IGxlbmd0aCwgaWR4
Ow0KPiAgCWludCByZXQ7DQo+ICANCj4gIAljb25uZWN0b3ItPmhhc190aWxlID0gZmFsc2U7DQo+
IC0JZGlzcGxheWlkID0gZHJtX2ZpbmRfZGlzcGxheWlkX2V4dGVuc2lvbihlZGlkLCAmbGVuZ3Ro
LCAmaWR4KTsNCj4gKwlkaXNwbGF5aWQgPSBkcm1fZmluZF9kaXNwbGF5aWRfZXh0ZW5zaW9uKGVk
aWQsICZsZW5ndGgsICZpZHgsDQo+ICsJCQkJCQkgJmV4dF9pbmRleCk7DQo+ICAJaWYgKCFkaXNw
bGF5aWQpIHsNCj4gIAkJLyogZHJvcCByZWZlcmVuY2UgdG8gYW55IHRpbGUgZ3JvdXAgd2UgaGFk
ICovDQo+ICAJCWdvdG8gb3V0X2Ryb3BfcmVmOw0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
