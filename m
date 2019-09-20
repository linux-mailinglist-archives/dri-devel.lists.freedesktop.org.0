Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EF2B8F9D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 14:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB896FCF5;
	Fri, 20 Sep 2019 12:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F89E6FCEC;
 Fri, 20 Sep 2019 12:19:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Sep 2019 05:19:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,528,1559545200"; d="scan'208";a="362834572"
Received: from irsmsx154.ger.corp.intel.com ([163.33.192.96])
 by orsmga005.jf.intel.com with ESMTP; 20 Sep 2019 05:19:08 -0700
Received: from irsmsx112.ger.corp.intel.com (10.108.20.5) by
 IRSMSX154.ger.corp.intel.com (163.33.192.96) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 20 Sep 2019 13:19:07 +0100
Received: from irsmsx106.ger.corp.intel.com ([169.254.8.184]) by
 irsmsx112.ger.corp.intel.com ([169.254.1.33]) with mapi id 14.03.0439.000;
 Fri, 20 Sep 2019 13:19:07 +0100
From: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 11/12] drm/i915: Set up ILK/SNB csc unit
 properly for YCbCr output
Thread-Topic: [Intel-gfx] [PATCH 11/12] drm/i915: Set up ILK/SNB csc unit
 properly for YCbCr output
Thread-Index: AQHVPXhXYY5nXmW2vkeo+KHv4BzWl6c0z3mA
Date: Fri, 20 Sep 2019 12:19:06 +0000
Message-ID: <a9382d337ff88bd6375cc1989e649431a6d713c1.camel@intel.com>
References: <20190718145053.25808-1-ville.syrjala@linux.intel.com>
 <20190718145053.25808-12-ville.syrjala@linux.intel.com>
In-Reply-To: <20190718145053.25808-12-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.66.135]
Content-ID: <072D7E8EF11D404199865F7F963F5E50@intel.com>
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
PiANCj4gUHJlcGFyZSB0aGUgcGlwZSBjc2MgZm9yIFlDYkNyIG91dHB1dCBvbiBpbGsvc25iLiBU
aGUgbWFpbiBkaWZmZXJlbmNlDQo+IHRvIElWQisgaXMgdGhlIGxhY2sgb2YgZXhwbGljaXQgcG9z
dCBvZmZzZXRzLCBhbmQgaW5zdGVhZCB3ZSBtdXN0DQo+IGNvbmZpZ3VyZSB0aGUgQ1NDIGluZm8g
UkdCLT5ZVVYgbW9kZSAod2hpY2ggdGFrZXMgY2FyZSBvZiBvZmZzZXR0aW5nDQo+IENiL0NyIHBy
b3Blcmx5KSBhbmQgZW5hYmxlIHRoZSAiYmxhY2sgc2NyZWVuIG9mZnNldCIgYml0IHRvIGFkZCB0
aGUNCj4gcmVxdWlyZWQgb2Zmc2V0IHRvIFkuDQo+IA0KPiBBbmQgd2hpbGUgYXQgaXQgdGhyb3cg
c29tZSBjb21tZW50cyBhcm91bmQgdGhlIGJpdCBkZWZpbmVzIHRvDQo+IGRvY3VtZW50IHdoaWNo
IHBsYXRmb3JtcyBoYXZlIHdoaWNoIGJpdHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBT
eXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29sb3IuYyB8IDI1ICsrKysrKysrKysrKysr
KysrLS0tDQo+IC0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oICAgICAgICAg
ICAgfCAxMCArKysrLS0tLS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwg
MTAgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9jb2xvci5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9jb2xvci5jDQo+IGluZGV4IDczNmM0MjcyMGRhZi4uYTkwMmY3ODA5ODQwIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xvci5jDQo+IEBAIC0xMjEz
LDYgKzEyMTMsMjEgQEAgc3RhdGljIHUzMiBpbGtfZ2FtbWFfbW9kZShjb25zdCBzdHJ1Y3QNCj4g
aW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSkNCj4gIAkJcmV0dXJuIEdBTU1BX01PREVfTU9E
RV8xMEJJVDsNCj4gIH0NCj4gIA0KPiArc3RhdGljIHUzMiBpbGtfY3NjX21vZGUoY29uc3Qgc3Ry
dWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpDQo+ICt7DQo+ICsJLyoNCj4gKwkgKiBD
U0MgY29tZXMgYWZ0ZXIgdGhlIExVVCBpbiBSR0ItPllDYkNyIG1vZGUuDQo+ICsJICogUkdCLT5Z
Q2JDciBuZWVkcyB0aGUgbGltaXRlZCByYW5nZSBvZmZzZXRzIGFkZGVkIHRvDQo+ICsJICogdGhl
IG91dHB1dC4gUkdCIGxpbWl0ZWQgcmFuZ2Ugb3V0cHV0IGlzIGhhbmRsZWQgYnkNCj4gKwkgKiB0
aGUgaHcgYXV0b21hZ2ljYWxseSBlbHNld2hlcmUuDQo+ICsJICovDQo+ICsJaWYgKGNydGNfc3Rh
dGUtPm91dHB1dF9mb3JtYXQgIT0gSU5URUxfT1VUUFVUX0ZPUk1BVF9SR0IpDQo+ICsJCXJldHVy
biBDU0NfQkxBQ0tfU0NSRUVOX09GRlNFVDsNCj4gKw0KPiArCXJldHVybiBDU0NfTU9ERV9ZVVZf
VE9fUkdCIHwNCj4gKwkJQ1NDX1BPU0lUSU9OX0JFRk9SRV9HQU1NQTsNCj4gK30NCj4gKw0KPiAg
c3RhdGljIGludCBpbGtfY29sb3JfY2hlY2soc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNf
c3RhdGUpDQo+ICB7DQo+ICAJaW50IHJldDsNCj4gQEAgLTEyMjYsMTUgKzEyNDEsMTUgQEAgc3Rh
dGljIGludCBpbGtfY29sb3JfY2hlY2soc3RydWN0DQo+IGludGVsX2NydGNfc3RhdGUgKmNydGNf
c3RhdGUpDQo+ICAJCSFjcnRjX3N0YXRlLT5jOF9wbGFuZXM7DQo+ICANCj4gIAkvKg0KPiAtCSAq
IFdlIGRvbid0IGV4cG9zZSB0aGUgY3RtIG9uIGlsay9zbmIgY3VycmVudGx5LA0KPiAtCSAqIG5v
ciBkbyB3ZSBlbmFibGUgWUNiQ3Igb3V0cHV0LiBBbHNvIFJHQiBsaW1pdGVkDQo+IC0JICogcmFu
Z2Ugb3V0cHV0IGlzIGhhbmRsZWQgYnkgdGhlIGh3IGF1dG9tYWdpY2FsbHkuDQo+ICsJICogV2Ug
ZG9uJ3QgZXhwb3NlIHRoZSBjdG0gb24gaWxrL3NuYiBjdXJyZW50bHksIGFsc28gUkdCDQo+ICsJ
ICogbGltaXRlZCByYW5nZSBvdXRwdXQgaXMgaGFuZGxlZCBieSB0aGUgaHcgYXV0b21hZ2ljYWxs
eS4NCj4gIAkgKi8NCj4gLQljcnRjX3N0YXRlLT5jc2NfZW5hYmxlID0gZmFsc2U7DQo+ICsJY3J0
Y19zdGF0ZS0+Y3NjX2VuYWJsZSA9DQo+ICsJCWNydGNfc3RhdGUtPm91dHB1dF9mb3JtYXQgIT0g
SU5URUxfT1VUUFVUX0ZPUk1BVF9SR0I7DQo+ICANCj4gIAljcnRjX3N0YXRlLT5nYW1tYV9tb2Rl
ID0gaWxrX2dhbW1hX21vZGUoY3J0Y19zdGF0ZSk7DQo+ICANCj4gLQljcnRjX3N0YXRlLT5jc2Nf
bW9kZSA9IDA7DQo+ICsJY3J0Y19zdGF0ZS0+Y3NjX21vZGUgPSBpbGtfY3NjX21vZGUoY3J0Y19z
dGF0ZSk7DQo+ICANCj4gIAlyZXQgPSBpbnRlbF9jb2xvcl9hZGRfYWZmZWN0ZWRfcGxhbmVzKGNy
dGNfc3RhdGUpOw0KPiAgCWlmIChyZXQpDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9pOTE1X3JlZy5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaA0KPiBp
bmRleCA1ODQ3MTMxMmI4YjIuLjMzZDUzNWFlMDk0NCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvaTkxNV9yZWcuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1
X3JlZy5oDQo+IEBAIC0xMDEwNiwxMSArMTAxMDYsMTEgQEAgZW51bSBza2xfcG93ZXJfZ2F0ZSB7
DQo+ICAjZGVmaW5lIF9QSVBFX0FfQ1NDX0NPRUZGX0JWCTB4NDkwMjQNCj4gIA0KPiAgI2RlZmlu
ZSBfUElQRV9BX0NTQ19NT0RFCTB4NDkwMjgNCj4gLSNkZWZpbmUgIElDTF9DU0NfRU5BQkxFCQkJ
KDEgPDwgMzEpDQo+IC0jZGVmaW5lICBJQ0xfT1VUUFVUX0NTQ19FTkFCTEUJCSgxIDw8IDMwKQ0K
PiAtI2RlZmluZSAgQ1NDX0JMQUNLX1NDUkVFTl9PRkZTRVQJKDEgPDwgMikNCj4gLSNkZWZpbmUg
IENTQ19QT1NJVElPTl9CRUZPUkVfR0FNTUEJKDEgPDwgMSkNCj4gLSNkZWZpbmUgIENTQ19NT0RF
X1lVVl9UT19SR0IJCSgxIDw8IDApDQo+ICsjZGVmaW5lICBJQ0xfQ1NDX0VOQUJMRQkJCSgxIDw8
IDMxKSAvKiBpY2wrICovDQo+ICsjZGVmaW5lICBJQ0xfT1VUUFVUX0NTQ19FTkFCTEUJCSgxIDw8
IDMwKSAvKiBpY2wrICovDQo+ICsjZGVmaW5lICBDU0NfQkxBQ0tfU0NSRUVOX09GRlNFVAkoMSA8
PCAyKSAvKiBpbGsvc25iICovDQo+ICsjZGVmaW5lICBDU0NfUE9TSVRJT05fQkVGT1JFX0dBTU1B
CSgxIDw8IDEpIC8qIHByZS1nbGsgKi8NCj4gKyNkZWZpbmUgIENTQ19NT0RFX1lVVl9UT19SR0IJ
CSgxIDw8IDApIC8qIGlsay9zbmIgKi8NCj4gIA0KPiAgI2RlZmluZSBfUElQRV9BX0NTQ19QUkVP
RkZfSEkJMHg0OTAzMA0KPiAgI2RlZmluZSBfUElQRV9BX0NTQ19QUkVPRkZfTUUJMHg0OTAzNA0K
DQpUaGUgY2hhbmdlcyBsb29rIGdvb2QgdG8gbWUuDQpSZXZpZXdlZC1ieTogR3dhbi1neWVvbmcg
TXVuIDxnd2FuLWd5ZW9uZy5tdW5AaW50ZWwuY29tPg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
