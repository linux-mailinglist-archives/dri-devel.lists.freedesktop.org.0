Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59378B6B57
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 20:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2656F8B3;
	Wed, 18 Sep 2019 18:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0ECD6F89F;
 Wed, 18 Sep 2019 18:59:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Sep 2019 11:59:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,521,1559545200"; d="scan'208";a="211964063"
Received: from irsmsx151.ger.corp.intel.com ([163.33.192.59])
 by fmsmga004.fm.intel.com with ESMTP; 18 Sep 2019 11:59:14 -0700
Received: from irsmsx106.ger.corp.intel.com ([169.254.8.184]) by
 IRSMSX151.ger.corp.intel.com ([169.254.4.234]) with mapi id 14.03.0439.000;
 Wed, 18 Sep 2019 19:59:14 +0100
From: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 02/12] drm/i915: Fix HSW+ DP MSA YCbCr
 colorspace indication
Thread-Topic: [Intel-gfx] [PATCH 02/12] drm/i915: Fix HSW+ DP MSA YCbCr
 colorspace indication
Thread-Index: AQHVPXhNskxmlqUNiEuWmngRDtuXxacyGpmA
Date: Wed, 18 Sep 2019 18:59:13 +0000
Message-ID: <4ec2dea534f326ea4db0d7ce73b73bcc2c921b87.camel@intel.com>
References: <20190718145053.25808-1-ville.syrjala@linux.intel.com>
 <20190718145053.25808-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20190718145053.25808-3-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.66.162]
Content-ID: <952EB99D4CBDCF45B8AA96DB1FF45F2B@intel.com>
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
PiANCj4gTG9va3MgbGlrZSB3ZSdyZSBjdXJyZW50bHkgc2V0dGluZyB0aGUgTVNBIHRvIHh2WUND
IEJULjcwOSBpbnN0ZWFkDQo+IG9mIHRoZSBZQ2JDciBCVC42MDEgY2xhaW1lZCBieSB0aGUgY29t
bWVudC4gQnV0IGV2ZW4gdGhhdCBjb21tZW50DQo+IGlzIHdyb25nIHNpbmNlIHdlIGNvbmZpZ3Vy
ZSB0aGUgQ1NDIG1hdHJpeCB0byBCVC43MDkuDQo+IA0KPiBMZXQncyByZW1vdmUgdGhlIGJvZ3Vz
IHN0YXRlbWVudCBmcm9tIHRoZSBjb21tZW50IGFuZCBmaXggdGhlDQo+IE1TQSB0byBpbmRpY2F0
ZSBZQ2JDciBCVC43MDkgc28gdGhhdCBpdCBtYXRjaGVzIHRoZSBhY3R1YWwNCj4gcGl4ZWwgZGF0
YSB3ZSdyZSB0cmFuc21pdHRpbmcuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rs
w6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMgfCA2ICsrKystLQ0KPiAgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV9yZWcuaCAgICAgICAgICB8IDMgKystDQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jDQo+IGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYw0KPiBpbmRleCAxOGJjMGYyNjkwYzkuLjE1N2M1ODUx
YTY4OCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
ZGkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jDQo+
IEBAIC0xNzMwLDEwICsxNzMwLDEyIEBAIHZvaWQgaW50ZWxfZGRpX3NldF9waXBlX3NldHRpbmdz
KGNvbnN0IHN0cnVjdA0KPiBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlKQ0KPiAgCS8qDQo+
ICAJICogQXMgcGVyIERQIDEuMiBzcGVjIHNlY3Rpb24gMi4zLjQuMyB3aGlsZSBzZW5kaW5nDQo+
ICAJICogWUNCQ1IgNDQ0IHNpZ25hbHMgd2Ugc2hvdWxkIHByb2dyYW0gTVNBIE1JU0MxLzAgZmll
bGRzIHdpdGgNCj4gLQkgKiBjb2xvcnNwYWNlIGluZm9ybWF0aW9uLiBUaGUgb3V0cHV0IGNvbG9y
c3BhY2UgZW5jb2RpbmcgaXMNCj4gQlQ2MDEuDQo+ICsJICogY29sb3JzcGFjZSBpbmZvcm1hdGlv
bi4NCj4gIAkgKi8NCj4gIAlpZiAoY3J0Y19zdGF0ZS0+b3V0cHV0X2Zvcm1hdCA9PSBJTlRFTF9P
VVRQVVRfRk9STUFUX1lDQkNSNDQ0KQ0KPiAtCQl0ZW1wIHw9IFRSQU5TX01TQV9TQU1QTElOR180
NDQgfCBUUkFOU19NU0FfQ0xSU1BfWUNCQ1I7DQo+ICsJCXRlbXAgfD0gVFJBTlNfTVNBX1NBTVBM
SU5HXzQ0NCB8IFRSQU5TX01TQV9DTFJTUF9ZQ0JDUg0KPiB8DQo+ICsJCQlUUkFOU19NU0FfWUNC
Q1JfQlQ3MDk7DQo+ICsNCj4gIAkvKg0KPiAgCSAqIEFzIHBlciBEUCAxLjRhIHNwZWMgc2VjdGlv
biAyLjIuNC4zIFtNU0EgRmllbGQgZm9yDQo+IEluZGljYXRpb24NCj4gIAkgKiBvZiBDb2xvciBF
bmNvZGluZyBGb3JtYXQgYW5kIENvbnRlbnQgQ29sb3IgR2FtdXRdIHdoaWxlDQo+IHNlbmRpbmcN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmgNCj4gYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oDQo+IGluZGV4IGZkZDliYzAxZTY5NC4uMzUxMzNi
MmVmNmM5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmgNCj4gQEAgLTk2MDUsNyArOTYw
NSw4IEBAIGVudW0gc2tsX3Bvd2VyX2dhdGUgew0KPiAgDQo+ICAjZGVmaW5lICBUUkFOU19NU0Ff
U1lOQ19DTEsJCSgxIDw8IDApDQo+ICAjZGVmaW5lICBUUkFOU19NU0FfU0FNUExJTkdfNDQ0CQko
MiA8PCAxKQ0KPiAtI2RlZmluZSAgVFJBTlNfTVNBX0NMUlNQX1lDQkNSCQkoMiA8PCAzKQ0KPiAr
I2RlZmluZSAgVFJBTlNfTVNBX0NMUlNQX1lDQkNSCQkoMSA8PCAzKQ0KPiArI2RlZmluZSAgVFJB
TlNfTVNBX1lDQkNSX0JUNzA5CQkoMSA8PCA0KQ0KPiAgI2RlZmluZSAgVFJBTlNfTVNBXzZfQlBD
CQkoMCA8PCA1KQ0KPiAgI2RlZmluZSAgVFJBTlNfTVNBXzhfQlBDCQkoMSA8PCA1KQ0KPiAgI2Rl
ZmluZSAgVFJBTlNfTVNBXzEwX0JQQwkJKDIgPDwgNSkNClRoZSBjaGFuZ2VzIGxvb2sgZ29vZCB0
byBtZS4NClJldmlld2VkLWJ5OiBHd2FuLWd5ZW9uZyBNdW4gPGd3YW4tZ3llb25nLm11bkBpbnRl
bC5jb20+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
