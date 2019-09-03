Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE80A6B11
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 16:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9B88940F;
	Tue,  3 Sep 2019 14:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA738940F;
 Tue,  3 Sep 2019 14:17:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Sep 2019 07:17:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,463,1559545200"; d="scan'208";a="187264547"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga006.jf.intel.com with ESMTP; 03 Sep 2019 07:17:12 -0700
Received: from fmsmsx101.amr.corp.intel.com (10.18.124.199) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 3 Sep 2019 07:17:12 -0700
Received: from bgsmsx102.gar.corp.intel.com (10.223.4.172) by
 fmsmsx101.amr.corp.intel.com (10.18.124.199) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 3 Sep 2019 07:17:11 -0700
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.178]) by
 BGSMSX102.gar.corp.intel.com ([169.254.2.79]) with mapi id 14.03.0439.000;
 Tue, 3 Sep 2019 19:47:08 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v4 5/7] drm/i915: Add new GMP register size for GEN11
Thread-Topic: [PATCH v4 5/7] drm/i915: Add new GMP register size for GEN11
Thread-Index: AQHVYjfQcxHbYuOmGEm58zJDAtyI9qcZ/3uw
Date: Tue, 3 Sep 2019 14:17:07 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F821D7733@BGSMSX104.gar.corp.intel.com>
References: <20190903091235.32304-1-gwan-gyeong.mun@intel.com>
 <20190903091235.32304-6-gwan-gyeong.mun@intel.com>
In-Reply-To: <20190903091235.32304-6-gwan-gyeong.mun@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNzQyYmEyYTEtYmQ1Ny00MWY0LWJhOWUtZjg3MzU1NTk5NWY5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoieTk5SXhEMUNaVEM3NEd1dFNxYXArSHBEUitoZWlLNnN0Rk1SdWJXbUtwMUhNMWFpeWh3dERtNWZYY2VCeFpLNiJ9
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IGRyaS1kZXZlbCA8ZHJpLWRl
dmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgR3dhbi0NCj5n
eWVvbmcgTXVuDQo+U2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDMsIDIwMTkgMjo0MyBQTQ0KPlRv
OiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Q2M6IFNoYW5rYXIsIFVtYSA8dW1h
LnNoYW5rYXJAaW50ZWwuY29tPjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPlN1
YmplY3Q6IFtQQVRDSCB2NCA1LzddIGRybS9pOTE1OiBBZGQgbmV3IEdNUCByZWdpc3RlciBzaXpl
IGZvciBHRU4xMQ0KPg0KPkFjY29yZGluZyB0byBCc3BlYywgR0VOMTEgYW5kIHByaW9yIEdFTjEx
IGhhdmUgZGlmZmVyZW50IHJlZ2lzdGVyIHNpemUgZm9yIEhEUg0KPk1ldGFkYXRhIEluZm9mcmFt
ZSBTRFAgcGFja2V0LiBJdCBhZGRzIG5ldyBWSURFT19ESVBfR01QX0RBVEFfU0laRSBmb3INCj5H
RU4xMS4gQW5kIGl0IG1ha2VzIGhhbmRsZSBkaWZmZXJlbnQgcmVnaXN0ZXIgc2l6ZSBmb3INCj5I
RE1JX1BBQ0tFVF9UWVBFX0dBTVVUX01FVEFEQVRBIG9uIGhzd19kaXBfZGF0YV9zaXplKCkgZm9y
IGVhY2ggR0VODQo+cGxhdGZvcm1zLiBJdCBhZGRyZXNzZXMgVW1hJ3MgcmV2aWV3IGNvbW1lbnRz
Lg0KDQpMb29rcyBnb29kIHRvIG1lLg0KUmV2aWV3ZWQtYnk6IFVtYSBTaGFua2FyIDx1bWEuc2hh
bmthckBpbnRlbC5jb20+DQoNCj5TaWduZWQtb2ZmLWJ5OiBHd2FuLWd5ZW9uZyBNdW4gPGd3YW4t
Z3llb25nLm11bkBpbnRlbC5jb20+DQo+LS0tDQo+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfaGRtaS5jIHwgMTAgKysrKysrKystLQ0KPiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X3JlZy5oICAgICAgICAgICB8ICAxICsNCj4gMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pDQo+DQo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jDQo+Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2hkbWkuYw0KPmluZGV4IGM1MDBmYzkxNTRjOC4uMjg3OTk5YjMxMjE3IDEwMDY0NA0K
Pi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jDQo+KysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMNCj5AQCAtMTg5LDEzICsx
ODksMTkgQEAgaHN3X2RpcF9kYXRhX3JlZyhzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3By
aXYsDQo+IAl9DQo+IH0NCj4NCj4tc3RhdGljIGludCBoc3dfZGlwX2RhdGFfc2l6ZSh1bnNpZ25l
ZCBpbnQgdHlwZSkNCj4rc3RhdGljIGludCBoc3dfZGlwX2RhdGFfc2l6ZShzdHJ1Y3QgZHJtX2k5
MTVfcHJpdmF0ZSAqZGV2X3ByaXYsDQo+KwkJCSAgICAgdW5zaWduZWQgaW50IHR5cGUpDQo+IHsN
Cj4gCXN3aXRjaCAodHlwZSkgew0KPiAJY2FzZSBEUF9TRFBfVlNDOg0KPiAJCXJldHVybiBWSURF
T19ESVBfVlNDX0RBVEFfU0laRTsNCj4gCWNhc2UgRFBfU0RQX1BQUzoNCj4gCQlyZXR1cm4gVklE
RU9fRElQX1BQU19EQVRBX1NJWkU7DQo+KwljYXNlIEhETUlfUEFDS0VUX1RZUEVfR0FNVVRfTUVU
QURBVEE6DQo+KwkJaWYgKElOVEVMX0dFTihkZXZfcHJpdikgPj0gMTEpDQo+KwkJCXJldHVybiBW
SURFT19ESVBfR01QX0RBVEFfU0laRTsNCj4rCQllbHNlDQo+KwkJCXJldHVybiBWSURFT19ESVBf
REFUQV9TSVpFOw0KPiAJZGVmYXVsdDoNCj4gCQlyZXR1cm4gVklERU9fRElQX0RBVEFfU0laRTsN
Cj4gCX0NCj5AQCAtNTE0LDcgKzUyMCw3IEBAIHN0YXRpYyB2b2lkIGhzd193cml0ZV9pbmZvZnJh
bWUoc3RydWN0IGludGVsX2VuY29kZXINCj4qZW5jb2RlciwNCj4gCWludCBpOw0KPiAJdTMyIHZh
bCA9IEk5MTVfUkVBRChjdGxfcmVnKTsNCj4NCj4tCWRhdGFfc2l6ZSA9IGhzd19kaXBfZGF0YV9z
aXplKHR5cGUpOw0KPisJZGF0YV9zaXplID0gaHN3X2RpcF9kYXRhX3NpemUoZGV2X3ByaXYsIHR5
cGUpOw0KPg0KPiAJdmFsICY9IH5oc3dfaW5mb2ZyYW1lX2VuYWJsZSh0eXBlKTsNCj4gCUk5MTVf
V1JJVEUoY3RsX3JlZywgdmFsKTsNCj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
aTkxNV9yZWcuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmggaW5kZXgNCj42YzQz
YjhjNTgzYmIuLjhiMzFhZDc0MjZkNiAxMDA2NDQNCj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9pOTE1X3JlZy5oDQo+KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaA0KPkBA
IC00NjY3LDYgKzQ2NjcsNyBAQCBlbnVtIHsNCj4gICogKEhhc3dlbGwgYW5kIG5ld2VyKSB0byBz
ZWUgd2hpY2ggVklERU9fRElQX0RBVEEgYnl0ZSBjb3JyZXNwb25kcyB0byBlYWNoIGJ5dGUNCj4g
ICogb2YgdGhlIGluZm9mcmFtZSBzdHJ1Y3R1cmUgc3BlY2lmaWVkIGJ5IENFQS04NjEuICovDQo+
ICNkZWZpbmUgICBWSURFT19ESVBfREFUQV9TSVpFCTMyDQo+KyNkZWZpbmUgICBWSURFT19ESVBf
R01QX0RBVEFfU0laRQkzNg0KPiAjZGVmaW5lICAgVklERU9fRElQX1ZTQ19EQVRBX1NJWkUJMzYN
Cj4gI2RlZmluZSAgIFZJREVPX0RJUF9QUFNfREFUQV9TSVpFCTEzMg0KPiAjZGVmaW5lIFZJREVP
X0RJUF9DVEwJCV9NTUlPKDB4NjExNzApDQo+LS0NCj4yLjIzLjANCj4NCj5fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QNCj5kcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+aHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
