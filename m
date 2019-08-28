Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6A1A03A5
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 15:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B1289220;
	Wed, 28 Aug 2019 13:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6139889220;
 Wed, 28 Aug 2019 13:47:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2019 06:47:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,441,1559545200"; d="scan'208";a="332165904"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by orsmga004.jf.intel.com with ESMTP; 28 Aug 2019 06:47:42 -0700
Received: from fmsmsx121.amr.corp.intel.com (10.18.125.36) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 28 Aug 2019 06:47:41 -0700
Received: from bgsmsx105.gar.corp.intel.com (10.223.43.197) by
 fmsmsx121.amr.corp.intel.com (10.18.125.36) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 28 Aug 2019 06:47:41 -0700
Received: from bgsmsx101.gar.corp.intel.com ([169.254.1.124]) by
 BGSMSX105.gar.corp.intel.com ([169.254.3.174]) with mapi id 14.03.0439.000;
 Wed, 28 Aug 2019 19:17:37 +0530
From: "Sharma, Shashank" <shashank.sharma@intel.com>
To: "Winkler, Tomas" <tomas.winkler@intel.com>, "C, Ramalingam"
 <ramalingam.c@intel.com>
Subject: RE: [PATCH v11 3/6] drm: Extend I915 mei interface for transcoder info
Thread-Topic: [PATCH v11 3/6] drm: Extend I915 mei interface for transcoder
 info
Thread-Index: AQHVXXJW7l+DVbY5j0Oqa/VYizhKcqcP1Y4AgAAFUoCAAAB7AIAAt+EA
Date: Wed, 28 Aug 2019 13:47:37 +0000
Message-ID: <FF3DDC77922A8A4BB08A3BC48A1EA8CB8DFCCD0E@BGSMSX101.gar.corp.intel.com>
References: <20190828072823.4832-1-ramalingam.c@intel.com>
 <20190828072823.4832-4-ramalingam.c@intel.com>
 <5B8DA87D05A7694D9FA63FD143655C1B9DCA5EAE@hasmsx108.ger.corp.intel.com>
 <20190828081709.GC20745@intel.com>
 <5B8DA87D05A7694D9FA63FD143655C1B9DCA5EEF@hasmsx108.ger.corp.intel.com>
In-Reply-To: <5B8DA87D05A7694D9FA63FD143655C1B9DCA5EEF@hasmsx108.ger.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZjA2NGE5YTYtZTg0OS00NjIwLWJhN2EtZjU0ZWU5YzdkYTA3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiNnFLVTR4RjVhdXVPMTlyQnlnNXdqdkp2VnREWWtUVXQ1ZDQrMDdUZndBeUFPY1VZOEc3c25tUndIUlJLeTFPWiJ9
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
Cc: "Nikula,
 Jani" <jani.nikula@intel.com>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TG9va3MgZ29vZCB0byBtZSwNCkZyb20gZGlzcGxheSBzaWRlLCBQbGVhc2UgZmVlbCBmcmVlIHRv
IHVzZSBSZXZpZXdlZC1ieTogU2hhc2hhbmsgU2hhcm1hIDxzaGFzaGFuay5zaGFybWFAaW50ZWwu
Y29tPg0KDQpSZWdhcmRzDQpTaGFzaGFuaw0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBXaW5rbGVyLCBUb21hcw0KPiBTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAyOCwgMjAx
OSAxOjQ5IFBNDQo+IFRvOiBDLCBSYW1hbGluZ2FtIDxyYW1hbGluZ2FtLmNAaW50ZWwuY29tPg0K
PiBDYzogaW50ZWwtZ2Z4IDxpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgZHJpLWRl
dmVsIDxkcmktDQo+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IFNoYXJtYSwgU2hhc2hh
bmsgPHNoYXNoYW5rLnNoYXJtYUBpbnRlbC5jb20+Ow0KPiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+OyBOaWt1bGEsIEphbmkgPGphbmkubmlrdWxhQGludGVsLmNvbT4NCj4gU3ViamVj
dDogUkU6IFtQQVRDSCB2MTEgMy82XSBkcm06IEV4dGVuZCBJOTE1IG1laSBpbnRlcmZhY2UgZm9y
IHRyYW5zY29kZXIgaW5mbw0KPiANCj4gDQo+IA0KPiA+DQo+ID4gT24gMjAxOS0wOC0yOCBhdCAx
MzoyODowNiArMDUzMCwgV2lua2xlciwgVG9tYXMgd3JvdGU6DQo+ID4gPiA+IEk5MTUgbmVlZHMg
dG8gc2VuZCB0aGUgaW5kZXggb2YgdGhlIHRyYW5zY29kZXIgYXMgcGVyIE1FIEZXLg0KPiA+ID4g
Pg0KPiA+ID4gPiBUbyBzdXBwb3J0IHRoaXMsIGRlZmluZSBlbnVtIG1laV9md190YyBhbmQgYWRk
IGFzIGEgbWVtYmVyIGludG8NCj4gPiA+ID4gdGhlIHN0cnVjdCBoZGNwX3BvcnRfZGF0YS4NCj4g
PiA+ID4NCj4gPiA+ID4gdjI6DQo+ID4gPiA+ICAgVHlwbyBpbiBjb21taXQgbXNnIGlzIGZpeGVk
IFtTaGFzaGFua10NCj4gPiA+ID4gdjM6DQo+ID4gPiA+ICAga2RvYyBpcyBhZGRlZCBmb3IgbWVp
X2Z3X3RjIFtUb21hc10NCj4gPiA+ID4gICBzL01FSV9UQ194L01FSV9UUkFOU0NPREVSX3gNCj4g
PiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogUmFtYWxpbmdhbSBDIDxyYW1hbGluZ2FtLmNA
aW50ZWwuY29tPg0KPiA+ID4gPiBBY2tlZC1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGlu
dGVsLmNvbT4NCj4gPiA+DQo+ID4gPiBMR1RNLCBqdXN0IG5lZWQgdG8gdXBkYXRlZCB0aGUgY29w
eXJpZ2h0IHllYXIuDQo+ID4gVG9tYXMsDQo+ID4NCj4gPiBDb3B5cmlnaHQgeWVhciBmb3IgdGhp
cyBpOTE1X21laV9oZGNwX2ludGVyZmFjZS5oIGlzIHVwZGF0ZWQgaW4gdGhlDQo+ID4gMXN0IHBh
dGNoIGl0c2VsZi4NCj4gDQo+IE9rYXkuDQo+ID4NCj4gPiAtUmFtDQo+ID4gPg0KPiA+ID4gPiAt
LS0NCj4gPiA+ID4gIGluY2x1ZGUvZHJtL2k5MTVfbWVpX2hkY3BfaW50ZXJmYWNlLmggfCAyNA0K
PiA+ICsrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDI0
IGluc2VydGlvbnMoKykNCj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJt
L2k5MTVfbWVpX2hkY3BfaW50ZXJmYWNlLmgNCj4gPiA+ID4gYi9pbmNsdWRlL2RybS9pOTE1X21l
aV9oZGNwX2ludGVyZmFjZS5oDQo+ID4gPiA+IGluZGV4IDA4NjcwYWE2NTBkNC4uNGQ0OGRlODg5
MGNhIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9pbmNsdWRlL2RybS9pOTE1X21laV9oZGNwX2ludGVy
ZmFjZS5oDQo+ID4gPiA+ICsrKyBiL2luY2x1ZGUvZHJtL2k5MTVfbWVpX2hkY3BfaW50ZXJmYWNl
LmgNCj4gPiA+ID4gQEAgLTU0LDkgKzU0LDMyIEBAIGVudW0gbWVpX2Z3X2RkaSB7DQo+ID4gPiA+
ICAJTUVJX0RESV9SQU5HRV9FTkQgPSBNRUlfRERJX0EsDQo+ID4gPiA+ICB9Ow0KPiA+ID4gPg0K
PiA+ID4gPiArLyoqDQo+ID4gPiA+ICsgKiBlbnVtIG1laV9md190YyAtIE1FIEZpcm13YXJlIGRl
ZmluZWQgaW5kZXggZm9yIHRyYW5zY29kZXJzDQo+ID4gPiA+ICsgKiBATUVJX0lOVkFMSURfVFJB
TlNDT0RFUjogSW5kZXggZm9yIEludmFsaWQgdHJhbnNjb2Rlcg0KPiA+ID4gPiArICogQE1FSV9U
UkFOU0NPREVSX0VEUDogSW5kZXggZm9yIEVEUCBUcmFuc2NvZGVyDQo+ID4gPiA+ICsgKiBATUVJ
X1RSQU5TQ09ERVJfRFNJMDogSW5kZXggZm9yIERTSTAgVHJhbnNjb2Rlcg0KPiA+ID4gPiArICog
QE1FSV9UUkFOU0NPREVSX0RTSTE6IEluZGV4IGZvciBEU0kxIFRyYW5zY29kZXINCj4gPiA+ID4g
KyAqIEBNRUlfVFJBTlNDT0RFUl9BOiBJbmRleCBmb3IgVHJhbnNjb2RlciBBDQo+ID4gPiA+ICsg
KiBATUVJX1RSQU5TQ09ERVJfQjogSW5kZXggZm9yIFRyYW5zY29kZXIgQg0KPiA+ID4gPiArICog
QE1FSV9UUkFOU0NPREVSX0M6IEluZGV4IGZvciBUcmFuc2NvZGVyIEMNCj4gPiA+ID4gKyAqIEBN
RUlfVFJBTlNDT0RFUl9EOiBJbmRleCBmb3IgVHJhbnNjb2RlciBEICAqLyBlbnVtIG1laV9md190
YyB7DQo+ID4gPiA+ICsJTUVJX0lOVkFMSURfVFJBTlNDT0RFUiA9IDB4MDAsDQo+ID4gPiA+ICsJ
TUVJX1RSQU5TQ09ERVJfRURQLA0KPiA+ID4gPiArCU1FSV9UUkFOU0NPREVSX0RTSTAsDQo+ID4g
PiA+ICsJTUVJX1RSQU5TQ09ERVJfRFNJMSwNCj4gPiA+ID4gKwlNRUlfVFJBTlNDT0RFUl9BID0g
MHgxMCwNCj4gPiA+ID4gKwlNRUlfVFJBTlNDT0RFUl9CLA0KPiA+ID4gPiArCU1FSV9UUkFOU0NP
REVSX0MsDQo+ID4gPiA+ICsJTUVJX1RSQU5TQ09ERVJfRA0KPiA+ID4gPiArfTsNCj4gPiA+ID4g
Kw0KPiA+ID4gPiAgLyoqDQo+ID4gPiA+ICAgKiBzdHJ1Y3QgaGRjcF9wb3J0X2RhdGEgLSBpbnRl
bCBzcGVjaWZpYyBIRENQIHBvcnQgZGF0YQ0KPiA+ID4gPiAgICogQGZ3X2RkaTogZGRpIGluZGV4
IGFzIHBlciBNRSBGVw0KPiA+ID4gPiArICogQGZ3X3RjOiB0cmFuc2NvZGVyIGluZGV4IGFzIHBl
ciBNRSBGVw0KPiA+ID4gPiAgICogQHBvcnRfdHlwZTogSERDUCBwb3J0IHR5cGUgYXMgcGVyIE1F
IEZXIGNsYXNzaWZpY2F0aW9uDQo+ID4gPiA+ICAgKiBAcHJvdG9jb2w6IEhEQ1AgYWRhcHRhdGlv
biBhcyBwZXIgTUUgRlcNCj4gPiA+ID4gICAqIEBrOiBObyBvZiBzdHJlYW1zIHRyYW5zbWl0dGVk
IG9uIGEgcG9ydC4gT25seSBvbiBEUCBNU1QgdGhpcw0KPiA+ID4gPiBpcyAhPSAxIEBAIC0NCj4g
PiA+ID4gNjksNiArOTIsNyBAQCBlbnVtIG1laV9md19kZGkgew0KPiA+ID4gPiAgICovDQo+ID4g
PiA+ICBzdHJ1Y3QgaGRjcF9wb3J0X2RhdGEgew0KPiA+ID4gPiAgCWVudW0gbWVpX2Z3X2RkaSBm
d19kZGk7DQo+ID4gPiA+ICsJZW51bSBtZWlfZndfdGMgZndfdGM7DQo+ID4gPiA+ICAJdTggcG9y
dF90eXBlOw0KPiA+ID4gPiAgCXU4IHByb3RvY29sOw0KPiA+ID4gPiAgCXUxNiBrOw0KPiA+ID4g
PiAtLQ0KPiA+ID4gPiAyLjIwLjENCj4gPiA+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
