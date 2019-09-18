Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC568B6B5D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 21:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0216F8C1;
	Wed, 18 Sep 2019 19:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBFE86F8C1;
 Wed, 18 Sep 2019 19:00:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Sep 2019 12:00:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,521,1559545200"; d="scan'208";a="199145182"
Received: from irsmsx154.ger.corp.intel.com ([163.33.192.96])
 by orsmga002.jf.intel.com with ESMTP; 18 Sep 2019 12:00:13 -0700
Received: from irsmsx106.ger.corp.intel.com ([169.254.8.184]) by
 IRSMSX154.ger.corp.intel.com ([169.254.12.160]) with mapi id 14.03.0439.000;
 Wed, 18 Sep 2019 20:00:12 +0100
From: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 04/12] drm/i915: Extract
 intel_hdmi_limited_color_range()
Thread-Topic: [Intel-gfx] [PATCH 04/12] drm/i915: Extract
 intel_hdmi_limited_color_range()
Thread-Index: AQHVPXhOPWMVuNDfEUyhl6nZ5bh1ZacyGt8A
Date: Wed, 18 Sep 2019 19:00:12 +0000
Message-ID: <1db6cb112d79ff14fe2c9b93cab17890fed188a3.camel@intel.com>
References: <20190718145053.25808-1-ville.syrjala@linux.intel.com>
 <20190718145053.25808-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20190718145053.25808-5-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.66.162]
Content-ID: <8A6A1ACA4826DB4DAD9181FEF5CE4A4D@intel.com>
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
PiANCj4gUHVsbCB0aGUgY29kZSBmb3IgY29tcHV0aW5nIHRoZSBsaW1pdGVkIGNvbG9yIHJhbmdl
DQo+IHNldHRpbmcgaW50byBhIHNtYWxsIGhlbHBlci4gV2UnbGwgYWRkIGEgYml0IG1vcmUgdG8g
aXQNCj4gbGF0ZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfaGRtaS5jIHwgMzAgKysrKysrKysrKysrKysrLS0tLQ0KPiAtLS0tDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMN
Cj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYw0KPiBpbmRleCBi
ODEwMGNmMjFkZDAuLmNhMzc3YmEzYTE1ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9oZG1pLmMNCj4gQEAgLTIyOTcsNiArMjI5NywyNCBAQCBpbnRlbF9oZG1p
X3ljYmNyNDIwX2NvbmZpZyhzdHJ1Y3QNCj4gZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLA0KPiAg
CXJldHVybiB0cnVlOw0KPiAgfQ0KPiAgDQo+ICtzdGF0aWMgYm9vbCBpbnRlbF9oZG1pX2xpbWl0
ZWRfY29sb3JfcmFuZ2UoY29uc3Qgc3RydWN0DQo+IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3Rh
dGUsDQo+ICsJCQkJCSAgIGNvbnN0IHN0cnVjdA0KPiBkcm1fY29ubmVjdG9yX3N0YXRlICpjb25u
X3N0YXRlKQ0KPiArew0KPiArCWNvbnN0IHN0cnVjdCBpbnRlbF9kaWdpdGFsX2Nvbm5lY3Rvcl9z
dGF0ZSAqaW50ZWxfY29ubl9zdGF0ZSA9DQo+ICsJCXRvX2ludGVsX2RpZ2l0YWxfY29ubmVjdG9y
X3N0YXRlKGNvbm5fc3RhdGUpOw0KPiArCWNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICph
ZGp1c3RlZF9tb2RlID0NCj4gKwkJJmNydGNfc3RhdGUtPmJhc2UuYWRqdXN0ZWRfbW9kZTsNCj4g
Kw0KPiArCWlmIChpbnRlbF9jb25uX3N0YXRlLT5icm9hZGNhc3RfcmdiID09DQo+IElOVEVMX0JS
T0FEQ0FTVF9SR0JfQVVUTykgew0KPiArCQkvKiBTZWUgQ0VBLTg2MS1FIC0gNS4xIERlZmF1bHQg
RW5jb2RpbmcgUGFyYW1ldGVycyAqLw0KPiArCQlyZXR1cm4gY3J0Y19zdGF0ZS0+aGFzX2hkbWlf
c2luayAmJg0KPiArCQkJZHJtX2RlZmF1bHRfcmdiX3F1YW50X3JhbmdlKGFkanVzdGVkX21vZGUp
ID09DQo+ICsJCQlIRE1JX1FVQU5USVpBVElPTl9SQU5HRV9MSU1JVEVEOw0KPiArCX0gZWxzZSB7
DQo+ICsJCXJldHVybiBpbnRlbF9jb25uX3N0YXRlLT5icm9hZGNhc3RfcmdiID09DQo+IElOVEVM
X0JST0FEQ0FTVF9SR0JfTElNSVRFRDsNCj4gKwl9DQo+ICt9DQo+ICsNCj4gIGludCBpbnRlbF9o
ZG1pX2NvbXB1dGVfY29uZmlnKHN0cnVjdCBpbnRlbF9lbmNvZGVyICplbmNvZGVyLA0KPiAgCQkJ
ICAgICAgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKnBpcGVfY29uZmlnLA0KPiAgCQkJICAgICAg
c3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5fc3RhdGUpDQo+IEBAIC0yMzIzLDE2ICsy
MzQxLDggQEAgaW50IGludGVsX2hkbWlfY29tcHV0ZV9jb25maWcoc3RydWN0DQo+IGludGVsX2Vu
Y29kZXIgKmVuY29kZXIsDQo+ICAJaWYgKHBpcGVfY29uZmlnLT5oYXNfaGRtaV9zaW5rKQ0KPiAg
CQlwaXBlX2NvbmZpZy0+aGFzX2luZm9mcmFtZSA9IHRydWU7DQo+ICANCj4gLQlpZiAoaW50ZWxf
Y29ubl9zdGF0ZS0+YnJvYWRjYXN0X3JnYiA9PQ0KPiBJTlRFTF9CUk9BRENBU1RfUkdCX0FVVE8p
IHsNCj4gLQkJLyogU2VlIENFQS04NjEtRSAtIDUuMSBEZWZhdWx0IEVuY29kaW5nIFBhcmFtZXRl
cnMgKi8NCj4gLQkJcGlwZV9jb25maWctPmxpbWl0ZWRfY29sb3JfcmFuZ2UgPQ0KPiAtCQkJcGlw
ZV9jb25maWctPmhhc19oZG1pX3NpbmsgJiYNCj4gLQkJCWRybV9kZWZhdWx0X3JnYl9xdWFudF9y
YW5nZShhZGp1c3RlZF9tb2RlKSA9PQ0KPiAtCQkJSERNSV9RVUFOVElaQVRJT05fUkFOR0VfTElN
SVRFRDsNCj4gLQl9IGVsc2Ugew0KPiAtCQlwaXBlX2NvbmZpZy0+bGltaXRlZF9jb2xvcl9yYW5n
ZSA9DQo+IC0JCQlpbnRlbF9jb25uX3N0YXRlLT5icm9hZGNhc3RfcmdiID09DQo+IElOVEVMX0JS
T0FEQ0FTVF9SR0JfTElNSVRFRDsNCj4gLQl9DQo+ICsJcGlwZV9jb25maWctPmxpbWl0ZWRfY29s
b3JfcmFuZ2UgPQ0KPiArCQlpbnRlbF9oZG1pX2xpbWl0ZWRfY29sb3JfcmFuZ2UocGlwZV9jb25m
aWcsDQo+IGNvbm5fc3RhdGUpOw0KPiAgDQo+ICAJaWYgKGFkanVzdGVkX21vZGUtPmZsYWdzICYg
RFJNX01PREVfRkxBR19EQkxDTEspIHsNCj4gIAkJcGlwZV9jb25maWctPnBpeGVsX211bHRpcGxp
ZXIgPSAyOw0KVGhlIGNoYW5nZXMgbG9vayBnb29kIHRvIG1lLg0KUmV2aWV3ZWQtYnk6IEd3YW4t
Z3llb25nIE11biA8Z3dhbi1neWVvbmcubXVuQGludGVsLmNvbT4NCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
