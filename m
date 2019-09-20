Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D43EB8FA4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 14:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A956E030;
	Fri, 20 Sep 2019 12:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283026E02F;
 Fri, 20 Sep 2019 12:20:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Sep 2019 05:20:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,528,1559545200"; d="scan'208";a="189919186"
Received: from irsmsx153.ger.corp.intel.com ([163.33.192.75])
 by orsmga003.jf.intel.com with ESMTP; 20 Sep 2019 05:20:36 -0700
Received: from irsmsx111.ger.corp.intel.com (10.108.20.4) by
 IRSMSX153.ger.corp.intel.com (163.33.192.75) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 20 Sep 2019 13:20:35 +0100
Received: from irsmsx106.ger.corp.intel.com ([169.254.8.184]) by
 irsmsx111.ger.corp.intel.com ([169.254.2.112]) with mapi id 14.03.0439.000;
 Fri, 20 Sep 2019 13:20:35 +0100
From: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 09/12] drm/i915: Add PIPECONF YCbCr 4:4:4
 programming for HSW
Thread-Topic: [Intel-gfx] [PATCH 09/12] drm/i915: Add PIPECONF YCbCr 4:4:4
 programming for HSW
Thread-Index: AQHVPXhROrqsRqkSw0SaMxUfze7FLqcyG9cAgAK0C4A=
Date: Fri, 20 Sep 2019 12:20:35 +0000
Message-ID: <bc3d8c8cd34c4c7c7074224f10876483b3fddc27.camel@intel.com>
References: <20190718145053.25808-1-ville.syrjala@linux.intel.com>
 <20190718145053.25808-10-ville.syrjala@linux.intel.com>
 <190062bdc035cc63008ef79956e8ed41782a6099.camel@intel.com>
In-Reply-To: <190062bdc035cc63008ef79956e8ed41782a6099.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.66.135]
Content-ID: <0DBFF8E546735541BBDE102E675A05C6@intel.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RXhjZXB0IHR5cG8sIHRoZSBjaGFuZ2VzIGxvb2sgZ29vZCB0byBtZS4NClJldmlld2VkLWJ5OiBH
d2FuLWd5ZW9uZyBNdW4gPGd3YW4tZ3llb25nLm11bkBpbnRlbC5jb20+DQpPbiBXZWQsIDIwMTkt
MDktMTggYXQgMTk6MDMgKzAwMDAsIE11biwgR3dhbi1neWVvbmcgd3JvdGU6DQo+IE9uIFRodSwg
MjAxOS0wNy0xOCBhdCAxNzo1MCArMDMwMCwgVmlsbGUgU3lyamFsYSB3cm90ZToNCj4gPiBGcm9t
OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiA+IA0K
PiA+IE9uIEhTVyB0aGUgcGlwZSBjb2xvcnNwYWNlIGlzIGNvbmZpZ3VyZWQgdmlhIFBJUEVDT05G
DQo+ID4gKGFzIG9wcG9zZWQgdG8gUElQRU1JU0MgaW4gQkRXKykuIExldCdzIGNvbmZpZ3VyZSty
ZWFkb3V0DQo+ID4gdGhhdCBzdHVmZiBjb3JyZWN0bHkuDQo+ID4gDQo+ID4gRW5hYmxsaW5nIFlD
YkNyIDQ6NDo0IG91dHB1dCB3aWxsIG5vdyBiZSBhIHNpbXBsZSBtYXR0ZXIgb2YNCj4gVHlwbzog
RW5hYmxsaW5nIC0+IEVuYWJsaW5nDQo+ID4gc2V0dGluZyBjcnRjX3N0YXRlLT5vdXRwdXRfZm9y
bWF0IGFwcHJvcHJpYXRlbHkgaW4gdGhlIGVuY29kZXINCj4gPiAuY29tcHV0ZV9jb25maWcoKS4N
Cj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFA
bGludXguaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2Rpc3BsYXkuYyB8IDEzICsrKysrKysrKysrKy0NCj4gPiAgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV9yZWcuaCAgICAgICAgICAgICAgfCAgMSArDQo+ID4gIDIgZmlsZXMgY2hh
bmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYw0KPiA+IGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMNCj4gPiBpbmRleCAx
ZGQxYWEyOWE2NDkuLmJkM2ZmOTZjMTYxOCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jDQo+ID4gQEAgLTk0MzAsNiArOTQzMCwxMCBA
QCBzdGF0aWMgdm9pZCBoYXN3ZWxsX3NldF9waXBlY29uZihjb25zdA0KPiA+IHN0cnVjdA0KPiA+
IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpDQo+ID4gIAllbHNlDQo+ID4gIAkJdmFsIHw9
IFBJUEVDT05GX1BST0dSRVNTSVZFOw0KPiA+ICANCj4gPiArCWlmIChJU19IQVNXRUxMKGRldl9w
cml2KSAmJg0KPiA+ICsJICAgIGNydGNfc3RhdGUtPm91dHB1dF9mb3JtYXQgIT0gSU5URUxfT1VU
UFVUX0ZPUk1BVF9SR0IpDQo+ID4gKwkJdmFsIHw9IFBJUEVDT05GX09VVFBVVF9DT0xPUlNQQUNF
X1lVVl9IU1c7DQo+ID4gKw0KPiA+ICAJSTkxNV9XUklURShQSVBFQ09ORihjcHVfdHJhbnNjb2Rl
ciksIHZhbCk7DQo+ID4gIAlQT1NUSU5HX1JFQUQoUElQRUNPTkYoY3B1X3RyYW5zY29kZXIpKTsN
Cj4gPiAgfQ0KPiA+IEBAIC0xMDQyMyw3ICsxMDQyNywxNCBAQCBzdGF0aWMgYm9vbCBoYXN3ZWxs
X2dldF9waXBlX2NvbmZpZyhzdHJ1Y3QNCj4gPiBpbnRlbF9jcnRjICpjcnRjLA0KPiA+ICANCj4g
PiAgCWludGVsX2dldF9waXBlX3NyY19zaXplKGNydGMsIHBpcGVfY29uZmlnKTsNCj4gPiAgDQo+
ID4gLQlpZiAoSU5URUxfR0VOKGRldl9wcml2KSA+PSA5IHx8IElTX0JST0FEV0VMTChkZXZfcHJp
dikpIHsNCj4gPiArCWlmIChJU19IQVNXRUxMKGRldl9wcml2KSkgew0KPiA+ICsJCXUzMiB0bXAg
PSBJOTE1X1JFQUQoUElQRUNPTkYocGlwZV9jb25maWctDQo+ID4gPiBjcHVfdHJhbnNjb2Rlcikp
Ow0KPiA+ICsNCj4gPiArCQlpZiAodG1wICYgUElQRUNPTkZfT1VUUFVUX0NPTE9SU1BBQ0VfWVVW
X0hTVykNCj4gPiArCQkJcGlwZV9jb25maWctPm91dHB1dF9mb3JtYXQgPQ0KPiA+IElOVEVMX09V
VFBVVF9GT1JNQVRfWUNCQ1I0NDQ7DQo+ID4gKwkJZWxzZQ0KPiA+ICsJCQlwaXBlX2NvbmZpZy0+
b3V0cHV0X2Zvcm1hdCA9DQo+ID4gSU5URUxfT1VUUFVUX0ZPUk1BVF9SR0I7DQo+ID4gKwl9IGVs
c2Ugew0KPiA+ICAJCXBpcGVfY29uZmlnLT5vdXRwdXRfZm9ybWF0ID0NCj4gPiAgCQkJYmR3X2dl
dF9waXBlbWlzY19vdXRwdXRfZm9ybWF0KGNydGMpOw0KPiA+ICANCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvaTkxNV9yZWcuaA0KPiA+IGluZGV4IDY2ZjdmNDE3MjMxZi4uNTg0NzEzMTJiOGIyIDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmgNCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oDQo+ID4gQEAgLTU3MTIsNiArNTcxMiw3IEBA
IGVudW0gew0KPiA+ICAjZGVmaW5lICAgUElQRUNPTkZfQ1hTUl9ET1dOQ0xPQ0sJKDEgPDwgMTYp
DQo+ID4gICNkZWZpbmUgICBQSVBFQ09ORl9FRFBfUlJfTU9ERV9TV0lUQ0hfVkxWCSgxIDw8IDE0
KQ0KPiA+ICAjZGVmaW5lICAgUElQRUNPTkZfQ09MT1JfUkFOR0VfU0VMRUNUCSgxIDw8IDEzKQ0K
PiA+ICsjZGVmaW5lICAgUElQRUNPTkZfT1VUUFVUX0NPTE9SU1BBQ0VfWVVWX0hTVwkoMSA8PCAx
MSkgLyoNCj4gPiBoc3cgb25seQ0KPiA+ICovDQo+ID4gICNkZWZpbmUgICBQSVBFQ09ORl9CUENf
TUFTSwkoMHg3IDw8IDUpDQo+ID4gICNkZWZpbmUgICBQSVBFQ09ORl84QlBDCQkoMCA8PCA1KQ0K
PiA+ICAjZGVmaW5lICAgUElQRUNPTkZfMTBCUEMJKDEgPDwgNSkNCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gSW50ZWwtZ2Z4IG1haWxpbmcgbGlz
dA0KPiBJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4DQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
