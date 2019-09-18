Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ED6B6BA7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 21:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15286F93C;
	Wed, 18 Sep 2019 19:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F10E6F92A;
 Wed, 18 Sep 2019 19:05:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Sep 2019 12:05:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,521,1559545200"; d="scan'208";a="202121023"
Received: from irsmsx153.ger.corp.intel.com ([163.33.192.75])
 by fmsmga001.fm.intel.com with ESMTP; 18 Sep 2019 12:05:38 -0700
Received: from irsmsx111.ger.corp.intel.com (10.108.20.4) by
 IRSMSX153.ger.corp.intel.com (163.33.192.75) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 18 Sep 2019 20:05:37 +0100
Received: from irsmsx106.ger.corp.intel.com ([169.254.8.184]) by
 irsmsx111.ger.corp.intel.com ([169.254.2.112]) with mapi id 14.03.0439.000;
 Wed, 18 Sep 2019 20:05:37 +0100
From: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 12/12] drm/i915: Add PIPECONF YCbCr 4:4:4
 programming for ILK-IVB
Thread-Topic: [Intel-gfx] [PATCH 12/12] drm/i915: Add PIPECONF YCbCr 4:4:4
 programming for ILK-IVB
Thread-Index: AQHVPXhY1ngulIwSZk2aKGW8u03yZqcyHGOA
Date: Wed, 18 Sep 2019 19:05:37 +0000
Message-ID: <3b76305b6005c84ff497f32577ebe24c50790b81.camel@intel.com>
References: <20190718145053.25808-1-ville.syrjala@linux.intel.com>
 <20190718145053.25808-13-ville.syrjala@linux.intel.com>
In-Reply-To: <20190718145053.25808-13-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.66.162]
Content-ID: <82F3BD11F4826A4FA89A6CFA3CF02656@intel.com>
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

T24gVGh1LCAyMDE5LTA3LTE4IGF0IDE3OjUwICswMzAwLCBWaWxsZSBTeXJqYWxhIHdyb3RlOg0K
PiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0K
PiANCj4gT24gSUxLLUlWQiB0aGUgcGlwZSBjb2xvcnNwYWNlIGlzIGNvbmZpZ3VyZWQgdmlhIFBJ
UEVDT05GDQo+IChhcyBvcHBvc2VkIHRvIFBJUEVNSVNDIGluIEJEVyspLiBMZXQncyBjb25maWd1
cmUrcmVhZG91dA0KPiB0aGF0IHN0dWZmIGNvcnJlY3RseS4NCj4gDQo+IEVuYWJsbGluZyBZQ2JD
ciA0OjQ6NCBvdXRwdXQgd2lsbCBub3cgYmUgYSBzaW1wbGUgbWF0dGVyIG9mDQpUeXBvOiBFbmFi
bGxpbmcgLT4gRW5hYmxpbmcNCj4gc2V0dGluZyBjcnRjX3N0YXRlLT5vdXRwdXRfZm9ybWF0IGFw
cHJvcHJpYXRlbHkgaW4gdGhlIGVuY29kZXINCj4gLmNvbXB1dGVfY29uZmlnKCkuIEhvd2V2ZXIs
IHdoZW4gd2UgZG8gdGhhdCB3ZSBtdXN0IGJlDQo+IGF3YXJlIG9mIHRoZSBmYWN0IHRoYXQgWUNi
Q3IgRFAgb3V0cHV0IGRvZXNuJ3Qgc2VlbSB0byB3b3JrDQo+IG9uIElMSyAocmVzdWx0aW5nIGlt
YWdlIGlzIHRvdGFsbHkgZ2FyYmxlZCksIGJ1dCBvbiBTTkIrDQo+IGl0IHdvcmtzIGZpbmUuIEhv
d2V2ZXIgSERNSSBZQ2JDciBvdXRwdXQgZG9lcyB3b3JrIGNvcnJlY3RseQ0KPiBldmVuIG9uIElM
Sy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBs
aW51eC5pbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kaXNwbGF5LmMgfCAyMQ0KPiArKysrKysrKysrKysrKysrKysrLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL2k5MTUvaTkxNV9yZWcuaCAgICAgICAgICAgICAgfCAgNCArKysrDQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYw0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jDQo+IGluZGV4IGJkM2Zm
OTZjMTYxOC4uOGU5ODcxNWNkNjNiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2Rpc3BsYXkuYw0KPiBAQCAtOTQwNiw5ICs5NDA2LDE5IEBAIHN0YXRpYyB2
b2lkIGlyb25sYWtlX3NldF9waXBlY29uZihjb25zdCBzdHJ1Y3QNCj4gaW50ZWxfY3J0Y19zdGF0
ZSAqY3J0Y19zdGF0ZSkNCj4gIAllbHNlDQo+ICAJCXZhbCB8PSBQSVBFQ09ORl9QUk9HUkVTU0lW
RTsNCj4gIA0KPiArCS8qDQo+ICsJICogVGhpcyB3b3VsZCBlbmQgdXAgd2l0aCBhbiBvZGQgcHVy
cGxlIGh1ZSBvdmVyDQo+ICsJICogdGhlIGVudGlyZSBkaXNwbGF5LiBNYWtlIHN1cmUgd2UgZG9u
J3QgZG8gaXQuDQo+ICsJICovDQo+ICsJV0FSTl9PTihjcnRjX3N0YXRlLT5saW1pdGVkX2NvbG9y
X3JhbmdlICYmDQo+ICsJCWNydGNfc3RhdGUtPm91dHB1dF9mb3JtYXQgIT0gSU5URUxfT1VUUFVU
X0ZPUk1BVF9SR0IpOw0KPiArDQo+ICAJaWYgKGNydGNfc3RhdGUtPmxpbWl0ZWRfY29sb3JfcmFu
Z2UpDQo+ICAJCXZhbCB8PSBQSVBFQ09ORl9DT0xPUl9SQU5HRV9TRUxFQ1Q7DQo+ICANCj4gKwlp
ZiAoY3J0Y19zdGF0ZS0+b3V0cHV0X2Zvcm1hdCAhPSBJTlRFTF9PVVRQVVRfRk9STUFUX1JHQikN
Cj4gKwkJdmFsIHw9IFBJUEVDT05GX09VVFBVVF9DT0xPUlNQQUNFX1lVVjcwOTsNCj4gKw0KPiAg
CXZhbCB8PSBQSVBFQ09ORl9HQU1NQV9NT0RFKGNydGNfc3RhdGUtPmdhbW1hX21vZGUpOw0KPiAg
DQo+ICAJSTkxNV9XUklURShQSVBFQ09ORihwaXBlKSwgdmFsKTsNCj4gQEAgLTk5NDUsNyArOTk1
NSw2IEBAIHN0YXRpYyBib29sIGlyb25sYWtlX2dldF9waXBlX2NvbmZpZyhzdHJ1Y3QNCj4gaW50
ZWxfY3J0YyAqY3J0YywNCj4gIAlpZiAoIXdha2VyZWYpDQo+ICAJCXJldHVybiBmYWxzZTsNCj4g
IA0KPiAtCXBpcGVfY29uZmlnLT5vdXRwdXRfZm9ybWF0ID0gSU5URUxfT1VUUFVUX0ZPUk1BVF9S
R0I7DQo+ICAJcGlwZV9jb25maWctPmNwdV90cmFuc2NvZGVyID0gKGVudW0gdHJhbnNjb2Rlcikg
Y3J0Yy0+cGlwZTsNCj4gIAlwaXBlX2NvbmZpZy0+c2hhcmVkX2RwbGwgPSBOVUxMOw0KPiAgDQo+
IEBAIC05OTc0LDYgKzk5ODMsMTYgQEAgc3RhdGljIGJvb2wgaXJvbmxha2VfZ2V0X3BpcGVfY29u
ZmlnKHN0cnVjdA0KPiBpbnRlbF9jcnRjICpjcnRjLA0KPiAgCWlmICh0bXAgJiBQSVBFQ09ORl9D
T0xPUl9SQU5HRV9TRUxFQ1QpDQo+ICAJCXBpcGVfY29uZmlnLT5saW1pdGVkX2NvbG9yX3Jhbmdl
ID0gdHJ1ZTsNCj4gIA0KPiArCXN3aXRjaCAodG1wICYgUElQRUNPTkZfT1VUUFVUX0NPTE9SU1BB
Q0VfTUFTSykgew0KPiArCWNhc2UgUElQRUNPTkZfT1VUUFVUX0NPTE9SU1BBQ0VfWVVWNjAxOg0K
PiArCWNhc2UgUElQRUNPTkZfT1VUUFVUX0NPTE9SU1BBQ0VfWVVWNzA5Og0KPiArCQlwaXBlX2Nv
bmZpZy0+b3V0cHV0X2Zvcm1hdCA9DQo+IElOVEVMX09VVFBVVF9GT1JNQVRfWUNCQ1I0NDQ7DQo+
ICsJCWJyZWFrOw0KPiArCWRlZmF1bHQ6DQo+ICsJCXBpcGVfY29uZmlnLT5vdXRwdXRfZm9ybWF0
ID0gSU5URUxfT1VUUFVUX0ZPUk1BVF9SR0I7DQo+ICsJCWJyZWFrOw0KPiArCX0NCj4gKw0KPiAg
CXBpcGVfY29uZmlnLT5nYW1tYV9tb2RlID0gKHRtcCAmIFBJUEVDT05GX0dBTU1BX01PREVfTUFT
S19JTEspDQo+ID4+DQo+ICAJCVBJUEVDT05GX0dBTU1BX01PREVfU0hJRlQ7DQo+ICANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmgNCj4gYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X3JlZy5oDQo+IGluZGV4IDMzZDUzNWFlMDk0NC4uM2QzM2ExZTAzYTQ1
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmgNCj4gQEAgLTU3MTIsNiArNTcxMiwxMCBA
QCBlbnVtIHsNCj4gICNkZWZpbmUgICBQSVBFQ09ORl9DWFNSX0RPV05DTE9DSwkoMSA8PCAxNikN
Cj4gICNkZWZpbmUgICBQSVBFQ09ORl9FRFBfUlJfTU9ERV9TV0lUQ0hfVkxWCSgxIDw8IDE0KQ0K
PiAgI2RlZmluZSAgIFBJUEVDT05GX0NPTE9SX1JBTkdFX1NFTEVDVAkoMSA8PCAxMykNCj4gKyNk
ZWZpbmUgICBQSVBFQ09ORl9PVVRQVVRfQ09MT1JTUEFDRV9NQVNLCSgzIDw8IDExKSAvKiBpbGst
aXZiICovDQo+ICsjZGVmaW5lICAgUElQRUNPTkZfT1VUUFVUX0NPTE9SU1BBQ0VfUkdCCSgwIDw8
IDExKSAvKiBpbGstaXZiICovDQo+ICsjZGVmaW5lICAgUElQRUNPTkZfT1VUUFVUX0NPTE9SU1BB
Q0VfWVVWNjAxCSgxIDw8IDExKSAvKiBpbGstaXZiICovDQo+ICsjZGVmaW5lICAgUElQRUNPTkZf
T1VUUFVUX0NPTE9SU1BBQ0VfWVVWNzA5CSgyIDw8IDExKSAvKiBpbGstaXZiICovDQo+ICAjZGVm
aW5lICAgUElQRUNPTkZfT1VUUFVUX0NPTE9SU1BBQ0VfWVVWX0hTVwkoMSA8PCAxMSkgLyogaHN3
IG9ubHkNCj4gKi8NCj4gICNkZWZpbmUgICBQSVBFQ09ORl9CUENfTUFTSwkoMHg3IDw8IDUpDQo+
ICAjZGVmaW5lICAgUElQRUNPTkZfOEJQQwkJKDAgPDwgNSkNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
