Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A2428390A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 17:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78CB6E02E;
	Mon,  5 Oct 2020 15:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515986E02E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 15:08:19 +0000 (UTC)
IronPort-SDR: 4V8UO1nppsrIbJZHNypzgFzY8jQMavsATcUfS4Ds1DLh81i8Q3gyUi+xLQ2GYyyMfAih65myb7
 b6IAiQ7aX8UQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9764"; a="225275103"
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; d="scan'208";a="225275103"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP; 05 Oct 2020 08:01:51 -0700
IronPort-SDR: tIbnQdbx9RzK4xm46uHLyI1tOh4u1qNO29X+b0hqT1faBT+81RbrKL7/12fNQd4a1uPzu466M8
 t76HpsJBA9Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; d="scan'208";a="295775927"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 05 Oct 2020 08:01:51 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 5 Oct 2020 08:01:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 5 Oct 2020 08:01:50 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.1713.004;
 Mon, 5 Oct 2020 08:01:50 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ray.huang@amd.com" <ray.huang@amd.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: RE: [PATCH 3/8] drm/ttm: cleanup ttm_handle_caching_state_failure
Thread-Topic: [PATCH 3/8] drm/ttm: cleanup ttm_handle_caching_state_failure
Thread-Index: AQHWl+X+mruvbKFbUkakq6f+LE2kUamJIPhw
Date: Mon, 5 Oct 2020 15:01:50 +0000
Message-ID: <a9923232e2064cf6b2f14cd93d1d5c1d@intel.com>
References: <20201001112817.20967-1-christian.koenig@amd.com>
 <20201001112817.20967-3-christian.koenig@amd.com>
In-Reply-To: <20201001112817.20967-3-christian.koenig@amd.com>
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

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IGRyaS1kZXZlbCA8ZHJpLWRl
dmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj5DaHJpc3Rp
YW4gS8O2bmlnDQo+U2VudDogVGh1cnNkYXksIE9jdG9iZXIgMSwgMjAyMCA3OjI4IEFNDQo+VG86
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IHJheS5odWFuZ0BhbWQuY29tOw0KPmFp
cmxpZWRAZ21haWwuY29tOyBkYW5pZWxAZmZ3bGwuY2gNCj5TdWJqZWN0OiBbUEFUQ0ggMy84XSBk
cm0vdHRtOiBjbGVhbnVwIHR0bV9oYW5kbGVfY2FjaGluZ19zdGF0ZV9mYWlsdXJlDQo+DQo+UmVt
b3ZlIHVudXNlZCBwYXJhbWV0ZXJzLCBzaG9ydGVuIHRoZSBmdW5jdGlvbiBuYW1lLg0KDQpMb29r
cyBnb29kIHRvIG1lLg0KDQpSZXZpZXdlZC1ieTogTWljaGFlbCBKLiBSdWhsIDxtaWNoYWVsLmou
cnVobEBpbnRlbC5jb20+DQoNCk0NCg0KPlNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4tLS0NCj4gZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fcGFnZV9hbGxvYy5jIHwgMjAgKysrKysrKystLS0tLS0tLS0tLS0NCj4gMSBmaWxlIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+DQo+ZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2MuYw0KPmIvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fcGFnZV9hbGxvYy5jDQo+aW5kZXggOTEyYzMwZGNjOWRiLi4xMTEwMzFjYmI2ZGYgMTAw
NjQ0DQo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcGFnZV9hbGxvYy5jDQo+KysrIGIv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcGFnZV9hbGxvYy5jDQo+QEAgLTQ2NywxMSArNDY3LDEx
IEBAIHN0YXRpYyBpbnQgdHRtX3NldF9wYWdlc19jYWNoaW5nKHN0cnVjdCBwYWdlDQo+KipwYWdl
cywNCj4gICogYW55IHBhZ2VzIHRoYXQgaGF2ZSBjaGFuZ2VkIHRoZWlyIGNhY2hpbmcgc3RhdGUg
YWxyZWFkeSBwdXQgdGhlbSB0byB0aGUNCj4gICogcG9vbC4NCj4gICovDQo+LXN0YXRpYyB2b2lk
IHR0bV9oYW5kbGVfY2FjaGluZ19zdGF0ZV9mYWlsdXJlKHN0cnVjdCBsaXN0X2hlYWQgKnBhZ2Vz
LA0KPi0JCWludCB0dG1fZmxhZ3MsIGVudW0gdHRtX2NhY2hpbmdfc3RhdGUgY3N0YXRlLA0KPi0J
CXN0cnVjdCBwYWdlICoqZmFpbGVkX3BhZ2VzLCB1bnNpZ25lZCBjcGFnZXMpDQo+K3N0YXRpYyB2
b2lkIHR0bV9oYW5kbGVfY2FjaGluZ19mYWlsdXJlKHN0cnVjdCBwYWdlICoqZmFpbGVkX3BhZ2Vz
LA0KPisJCQkJICAgICAgIHVuc2lnbmVkIGNwYWdlcykNCj4gew0KPiAJdW5zaWduZWQgaTsNCj4r
DQo+IAkvKiBGYWlsZWQgcGFnZXMgaGF2ZSB0byBiZSBmcmVlZCAqLw0KPiAJZm9yIChpID0gMDsg
aSA8IGNwYWdlczsgKytpKSB7DQo+IAkJbGlzdF9kZWwoJmZhaWxlZF9wYWdlc1tpXS0+bHJ1KTsN
Cj5AQCAtNTE3LDkgKzUxNyw4IEBAIHN0YXRpYyBpbnQgdHRtX2FsbG9jX25ld19wYWdlcyhzdHJ1
Y3QgbGlzdF9oZWFkDQo+KnBhZ2VzLCBnZnBfdCBnZnBfZmxhZ3MsDQo+IAkJCQlyID0gdHRtX3Nl
dF9wYWdlc19jYWNoaW5nKGNhY2hpbmdfYXJyYXksDQo+IAkJCQkJCQkgIGNzdGF0ZSwgY3BhZ2Vz
KTsNCj4gCQkJCWlmIChyKQ0KPi0NCj4JdHRtX2hhbmRsZV9jYWNoaW5nX3N0YXRlX2ZhaWx1cmUo
cGFnZXMsDQo+LQkJCQkJCXR0bV9mbGFncywgY3N0YXRlLA0KPi0JCQkJCQljYWNoaW5nX2FycmF5
LCBjcGFnZXMpOw0KPisNCj4JdHRtX2hhbmRsZV9jYWNoaW5nX2ZhaWx1cmUoY2FjaGluZ19hcnJh
eSwNCj4rCQkJCQkJCQkgICBjcGFnZXMpOw0KPiAJCQl9DQo+IAkJCXIgPSAtRU5PTUVNOw0KPiAJ
CQlnb3RvIG91dDsNCj5AQCAtNTQyLDkgKzU0MSw4IEBAIHN0YXRpYyBpbnQgdHRtX2FsbG9jX25l
d19wYWdlcyhzdHJ1Y3QgbGlzdF9oZWFkDQo+KnBhZ2VzLCBnZnBfdCBnZnBfZmxhZ3MsDQo+IAkJ
CQlyID0gdHRtX3NldF9wYWdlc19jYWNoaW5nKGNhY2hpbmdfYXJyYXksDQo+IAkJCQkJCWNzdGF0
ZSwgY3BhZ2VzKTsNCj4gCQkJCWlmIChyKSB7DQo+LQ0KPgl0dG1faGFuZGxlX2NhY2hpbmdfc3Rh
dGVfZmFpbHVyZShwYWdlcywNCj4tCQkJCQkJdHRtX2ZsYWdzLCBjc3RhdGUsDQo+LQkJCQkJCWNh
Y2hpbmdfYXJyYXksIGNwYWdlcyk7DQo+Kw0KPgl0dG1faGFuZGxlX2NhY2hpbmdfZmFpbHVyZShj
YWNoaW5nX2FycmF5LA0KPisJCQkJCQkJCSAgIGNwYWdlcyk7DQo+IAkJCQkJZ290byBvdXQ7DQo+
IAkJCQl9DQo+IAkJCQljcGFnZXMgPSAwOw0KPkBAIC01NTUsOSArNTUzLDcgQEAgc3RhdGljIGlu
dCB0dG1fYWxsb2NfbmV3X3BhZ2VzKHN0cnVjdCBsaXN0X2hlYWQNCj4qcGFnZXMsIGdmcF90IGdm
cF9mbGFncywNCj4gCWlmIChjcGFnZXMpIHsNCj4gCQlyID0gdHRtX3NldF9wYWdlc19jYWNoaW5n
KGNhY2hpbmdfYXJyYXksIGNzdGF0ZSwgY3BhZ2VzKTsNCj4gCQlpZiAocikNCj4tCQkJdHRtX2hh
bmRsZV9jYWNoaW5nX3N0YXRlX2ZhaWx1cmUocGFnZXMsDQo+LQkJCQkJdHRtX2ZsYWdzLCBjc3Rh
dGUsDQo+LQkJCQkJY2FjaGluZ19hcnJheSwgY3BhZ2VzKTsNCj4rCQkJdHRtX2hhbmRsZV9jYWNo
aW5nX2ZhaWx1cmUoY2FjaGluZ19hcnJheSwgY3BhZ2VzKTsNCj4gCX0NCj4gb3V0Og0KPiAJa2Zy
ZWUoY2FjaGluZ19hcnJheSk7DQo+LS0NCj4yLjE3LjENCj4NCj5fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QNCj5k
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+aHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
