Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F32283908
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 17:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876C089D67;
	Mon,  5 Oct 2020 15:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E55F89D67
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 15:08:17 +0000 (UTC)
IronPort-SDR: GuYMIXi2GSXIt/fpvSRIPhfIIVcfIOZ+Q77ro4Z/a34FVphQz3VCc+Q7dv3tjus+0s43Ljg4Il
 siM0VqGHE25g==
X-IronPort-AV: E=McAfee;i="6000,8403,9764"; a="163760808"
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; d="scan'208";a="163760808"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP; 05 Oct 2020 08:01:30 -0700
IronPort-SDR: BlsRAXJmi0zTae52KFksi+r90gsTXR064GMf9s+nBWwnFgM2NNlNnaHzpmXz+hiXOQP1OyFVwg
 XcTec9BUAJag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; d="scan'208";a="342858284"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 05 Oct 2020 08:01:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 5 Oct 2020 08:01:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 5 Oct 2020 08:01:10 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.1713.004;
 Mon, 5 Oct 2020 08:01:10 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ray.huang@amd.com" <ray.huang@amd.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: RE: [PATCH 2/8] drm/ttm: move ttm_set_memory.h out of include
Thread-Topic: [PATCH 2/8] drm/ttm: move ttm_set_memory.h out of include
Thread-Index: AQHWl+X9S1sboxMX5EusD6vmOwKPeamJIHHw
Date: Mon, 5 Oct 2020 15:01:10 +0000
Message-ID: <43090043dbd54c13ab48abd81baea49e@intel.com>
References: <20201001112817.20967-1-christian.koenig@amd.com>
 <20201001112817.20967-2-christian.koenig@amd.com>
In-Reply-To: <20201001112817.20967-2-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.1.200.100]
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPkNocmlzdGlhbiBL
w7ZuaWcNCj5TZW50OiBUaHVyc2RheSwgT2N0b2JlciAxLCAyMDIwIDc6MjggQU0NCj5UbzogZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgcmF5Lmh1YW5nQGFtZC5jb207DQo+YWlybGll
ZEBnbWFpbC5jb207IGRhbmllbEBmZndsbC5jaA0KPlN1YmplY3Q6IFtQQVRDSCAyLzhdIGRybS90
dG06IG1vdmUgdHRtX3NldF9tZW1vcnkuaCBvdXQgb2YgaW5jbHVkZQ0KPg0KPlRoaXMgaXMgbm90
IHNvbWV0aGluZyBkcml2ZXJzIHNob3VsZCB1c2UuDQoNCkl0J3Mgbm90Pw0KDQpJIGFtIG5vdCBy
ZWFsbHkgc3VyZSB3aGF0IHlvdSBhcmUgZG9pbmcgaGVyZS4NCg0KTQ0KDQoNCj5TaWduZWQtb2Zm
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+LS0tDQo+
IGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2MuYyAgICAgICAgICAgICAgfCAzICsr
LQ0KPiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jX2RtYS5jICAgICAgICAgIHwg
MyArKy0NCj4ge2luY2x1ZGUgPT4gZHJpdmVycy9ncHV9L2RybS90dG0vdHRtX3NldF9tZW1vcnku
aCB8IDANCj4gMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
DQo+IHJlbmFtZSB7aW5jbHVkZSA9PiBkcml2ZXJzL2dwdX0vZHJtL3R0bS90dG1fc2V0X21lbW9y
eS5oICgxMDAlKQ0KPg0KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdl
X2FsbG9jLmMNCj5iL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2MuYw0KPmluZGV4
IDE0NjYwZjcyM2Y3MS4uOTEyYzMwZGNjOWRiIDEwMDY0NA0KPi0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX3BhZ2VfYWxsb2MuYw0KPisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bh
Z2VfYWxsb2MuYw0KPkBAIC00Nyw3ICs0Nyw4IEBADQo+DQo+ICNpbmNsdWRlIDxkcm0vdHRtL3R0
bV9ib19kcml2ZXIuaD4NCj4gI2luY2x1ZGUgPGRybS90dG0vdHRtX3BhZ2VfYWxsb2MuaD4NCj4t
I2luY2x1ZGUgPGRybS90dG0vdHRtX3NldF9tZW1vcnkuaD4NCj4rDQo+KyNpbmNsdWRlICJ0dG1f
c2V0X21lbW9yeS5oIg0KPg0KPiAjZGVmaW5lIE5VTV9QQUdFU19UT19BTExPQwkJKFBBR0VfU0la
RS9zaXplb2Yoc3RydWN0IHBhZ2UNCj4qKSkNCj4gI2RlZmluZSBTTUFMTF9BTExPQ0FUSU9OCQkx
Ng0KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jX2RtYS5j
DQo+Yi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jX2RtYS5jDQo+aW5kZXggNWUy
ZGYxMTY4NWU3Li4xMDQ1YTVjMjZlZTMgMTAwNjQ0DQo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fcGFnZV9hbGxvY19kbWEuYw0KPisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bh
Z2VfYWxsb2NfZG1hLmMNCj5AQCAtNDksNyArNDksOCBAQA0KPiAjaW5jbHVkZSA8bGludXgva3Ro
cmVhZC5oPg0KPiAjaW5jbHVkZSA8ZHJtL3R0bS90dG1fYm9fZHJpdmVyLmg+DQo+ICNpbmNsdWRl
IDxkcm0vdHRtL3R0bV9wYWdlX2FsbG9jLmg+DQo+LSNpbmNsdWRlIDxkcm0vdHRtL3R0bV9zZXRf
bWVtb3J5Lmg+DQo+Kw0KPisjaW5jbHVkZSAidHRtX3NldF9tZW1vcnkuaCINCj4NCj4gI2RlZmlu
ZSBOVU1fUEFHRVNfVE9fQUxMT0MJCShQQUdFX1NJWkUvc2l6ZW9mKHN0cnVjdCBwYWdlDQo+Kikp
DQo+ICNkZWZpbmUgU01BTExfQUxMT0NBVElPTgkJNA0KPmRpZmYgLS1naXQgYS9pbmNsdWRlL2Ry
bS90dG0vdHRtX3NldF9tZW1vcnkuaA0KPmIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fc2V0X21l
bW9yeS5oDQo+c2ltaWxhcml0eSBpbmRleCAxMDAlDQo+cmVuYW1lIGZyb20gaW5jbHVkZS9kcm0v
dHRtL3R0bV9zZXRfbWVtb3J5LmgNCj5yZW5hbWUgdG8gZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
c2V0X21lbW9yeS5oDQo+LS0NCj4yLjE3LjENCj4NCj5fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXw0KPmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QNCj5kcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
