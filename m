Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63894A92B4
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 21:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1243A89C5E;
	Wed,  4 Sep 2019 19:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA9B89C5E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 19:58:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Sep 2019 12:58:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,468,1559545200"; d="scan'208";a="190273238"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Sep 2019 12:58:28 -0700
Received: from fmsmsx155.amr.corp.intel.com (10.18.116.71) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 4 Sep 2019 12:58:08 -0700
Received: from fmsmsx117.amr.corp.intel.com ([169.254.3.91]) by
 FMSMSX155.amr.corp.intel.com ([169.254.5.161]) with mapi id 14.03.0439.000;
 Wed, 4 Sep 2019 12:58:08 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm: Use EOPNOTSUPP, not ENOTSUPP
Thread-Topic: [PATCH] drm: Use EOPNOTSUPP, not ENOTSUPP
Thread-Index: AQHVYy6fiQhtkrMPJki7zFFxvC34pqccZR+A
Date: Wed, 4 Sep 2019 19:58:08 +0000
Message-ID: <9713c3f86aac16d7f75a1a9a76de4c4dfd03a6c4.camel@intel.com>
References: <20190904143942.31756-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20190904143942.31756-1-daniel.vetter@ffwll.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.9.135]
Content-ID: <54F3FB245B1CEF4EA770B5C0375925CB@intel.com>
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
Cc: "mripard@kernel.org" <mripard@kernel.org>,
 "andresx7@gmail.com" <andresx7@gmail.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTA5LTA0IGF0IDE2OjM5ICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0K
PiAtIGl0J3Mgd2hhdCB3ZSByZWNvbW1lbmQgaW4gb3VyIGRvY3M6DQo+IA0KPiBodHRwczovL2Ry
aS5mcmVlZGVza3RvcC5vcmcvZG9jcy9kcm0vZ3B1L2RybS11YXBpLmh0bWwjcmVjb21tZW5kZWQt
aW9jdGwtcmV0dXJuLXZhbHVlcw0KPiANCj4gLSBpdCdzIHRoZSBvdmVyd2hlbG1pbmdseSB1c2Vk
IGVycm9yIGNvZGUgZm9yICJvcGVyYXRpb24gbm90DQo+ICAgc3VwcG9ydGVkIiwgYXQgbGVhc3Qg
aW4gZHJtIGNvcmUgKHNsaWdodGx5IGxlc3Mgc28gaW4gZHJpdmVycyk6DQo+IA0KPiAkIGdpdCBn
cmVwIEVPUE5PVFNVUCAtLSBkcml2ZXJzL2dwdS9kcm0vKmMgfCB3YyAtbA0KPiA4Mw0KPiAkIGdp
dCBncmVwIEVOT1RTVVAgLS0gZHJpdmVycy9ncHUvZHJtLypjIHwgd2MgLWwNCj4gNQ0KPiANCj4g
LSBpbmNsdWRlL2xpbnV4L2Vycm5vLmggbWFrZXMgaXQgZmFpcmx5IGNsZWFyIHRoYXQgdGhlc2Ug
YXJlIGZvcg0KPiBuZnN2Mw0KPiAgIChwbHVzIHRoZXkgYWxzbyBoYXZlIGVycm9yIGNvZGVzIGFi
b3ZlIDUxMiwgd2hpY2ggaXMgdGhlIGJsb2NrIHdpdGgNCj4gICBzb21lIHNwZWNpYWwgYmVoYXZp
b3VyIC4uLikNCj4gDQo+IC8qIERlZmluZWQgZm9yIHRoZSBORlN2MyBwcm90b2NvbCAqLw0KPiAN
Cj4gSWYgdGhlIGFib3ZlIGlzbid0IHJlZmxlY3RpbmcgY3VycmVudCBwcmFjdGljZSwgdGhlbiBJ
IGd1ZXNzIHdlDQo+IHNob3VsZA0KPiBhdCBsZWFzdCB1cGRhdGUgdGhlIGRvY3MuDQoNCkhvcGVm
dWxseSB0aGlzIHdpbGwgbm90IGJyZWFrIGFueSB1c2Vyc3BhY2UgDQoNClJldmlld2VkLWJ5OiBK
b3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCg0KPiANCj4gQ2M6
IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiBDYzogTWFh
cnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6
IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4NCj4gQ2M6IFNlYW4gUGF1bCA8c2Vh
bkBwb29ybHkucnVuPg0KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPg0KPiBDYzogQW5kcmVzIFJvZHJpZ3VleiA8YW5kcmVzeDdAZ21haWwuY29tPg0KPiBDYzog
Tm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IERh
bmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMv
Z3B1L2RybS9kcm1fZWRpZC5jICAgICB8IDYgKysrLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJt
X21pcGlfZGJpLmMgfCAyICstDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Vk
aWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jDQo+IGluZGV4IDgyYTRjZWVkM2ZjZi4u
MTJjNzgzZjRkOTU2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYw0KPiBAQCAtMzcxOSw3ICszNzE5LDcg
QEAgY2VhX2RiX29mZnNldHMoY29uc3QgdTggKmNlYSwgaW50ICpzdGFydCwgaW50DQo+ICplbmQp
DQo+ICAJCWlmICgqZW5kIDwgNCB8fCAqZW5kID4gMTI3KQ0KPiAgCQkJcmV0dXJuIC1FUkFOR0U7
DQo+ICAJfSBlbHNlIHsNCj4gLQkJcmV0dXJuIC1FTk9UU1VQUDsNCj4gKwkJcmV0dXJuIC1FT1BO
T1RTVVBQOw0KPiAgCX0NCj4gIA0KPiAgCXJldHVybiAwOw0KPiBAQCAtNDE4OCw3ICs0MTg4LDcg
QEAgaW50IGRybV9lZGlkX3RvX3NhZChzdHJ1Y3QgZWRpZCAqZWRpZCwgc3RydWN0DQo+IGNlYV9z
YWQgKipzYWRzKQ0KPiAgDQo+ICAJaWYgKGNlYV9yZXZpc2lvbihjZWEpIDwgMykgew0KPiAgCQlE
Uk1fREVCVUdfS01TKCJTQUQ6IHdyb25nIENFQSByZXZpc2lvblxuIik7DQo+IC0JCXJldHVybiAt
RU5PVFNVUFA7DQo+ICsJCXJldHVybiAtRU9QTk9UU1VQUDsNCj4gIAl9DQo+ICANCj4gIAlpZiAo
Y2VhX2RiX29mZnNldHMoY2VhLCAmc3RhcnQsICZlbmQpKSB7DQo+IEBAIC00MjQ5LDcgKzQyNDks
NyBAQCBpbnQgZHJtX2VkaWRfdG9fc3BlYWtlcl9hbGxvY2F0aW9uKHN0cnVjdCBlZGlkDQo+ICpl
ZGlkLCB1OCAqKnNhZGIpDQo+ICANCj4gIAlpZiAoY2VhX3JldmlzaW9uKGNlYSkgPCAzKSB7DQo+
ICAJCURSTV9ERUJVR19LTVMoIlNBRDogd3JvbmcgQ0VBIHJldmlzaW9uXG4iKTsNCj4gLQkJcmV0
dXJuIC1FTk9UU1VQUDsNCj4gKwkJcmV0dXJuIC1FT1BOT1RTVVBQOw0KPiAgCX0NCj4gIA0KPiAg
CWlmIChjZWFfZGJfb2Zmc2V0cyhjZWEsICZzdGFydCwgJmVuZCkpIHsNCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kYmkuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
bWlwaV9kYmkuYw0KPiBpbmRleCBjNGVlMjcwOWE2ZjMuLmY4MTU0MzE2YTNiMCAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RiaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fbWlwaV9kYmkuYw0KPiBAQCAtOTU1LDcgKzk1NSw3IEBAIHN0YXRpYyBpbnQgbWlw
aV9kYmlfdHlwZWMxX2NvbW1hbmQoc3RydWN0DQo+IG1pcGlfZGJpICpkYmksIHU4ICpjbWQsDQo+
ICAJaW50IHJldDsNCj4gIA0KPiAgCWlmIChtaXBpX2RiaV9jb21tYW5kX2lzX3JlYWQoZGJpLCAq
Y21kKSkNCj4gLQkJcmV0dXJuIC1FTk9UU1VQUDsNCj4gKwkJcmV0dXJuIC1FT1BOT1RTVVBQOw0K
PiAgDQo+ICAJTUlQSV9EQklfREVCVUdfQ09NTUFORCgqY21kLCBwYXJhbWV0ZXJzLCBudW0pOw0K
PiAgDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
