Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D04136BA1D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 21:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBCE6E872;
	Mon, 26 Apr 2021 19:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2B36E872
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 19:36:29 +0000 (UTC)
IronPort-SDR: sdN+qVg/QUXiSZeTepWsnFVng/AR+q3efyZublpgO8r59po64nWzsv0Av105u7EvoHpyXO1ljP
 ieKn/T18eDrQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="194277620"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="194277620"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 12:36:28 -0700
IronPort-SDR: XQTrgscm5tNW5gFxDMKD1GvKX7blSFnkgGy7vexmvA2IxfKminafIalM8DgG28eRK4PZ6SNfp6
 RIQVr4w5pKjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="429514217"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga008.jf.intel.com with ESMTP; 26 Apr 2021 12:36:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 26 Apr 2021 12:36:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 26 Apr 2021 12:36:27 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2106.013;
 Mon, 26 Apr 2021 12:36:27 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/ttm: cleanup ttm_agp_backend
Thread-Topic: [PATCH] drm/ttm: cleanup ttm_agp_backend
Thread-Index: AQHXOsXOgcFCnWUHB0Wz2or/npJj+arHL4BQ
Date: Mon, 26 Apr 2021 19:36:27 +0000
Message-ID: <f245337776cb4949b2f36e1bb2d24c51@intel.com>
References: <20210426175824.122557-1-christian.koenig@amd.com>
In-Reply-To: <20210426175824.122557-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.0.76
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
Cc: "bskeggs@redhat.com" <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPkNocmlzdGlhbiBL
w7ZuaWcNCj5TZW50OiBNb25kYXksIEFwcmlsIDI2LCAyMDIxIDE6NTggUE0NCj5UbzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPkNjOiBic2tlZ2dzQHJlZGhhdC5jb20NCj5TdWJq
ZWN0OiBbUEFUQ0hdIGRybS90dG06IGNsZWFudXAgdHRtX2FncF9iYWNrZW5kDQo+DQo+QXVkaXQg
dGhlIGluY2x1ZGVzIGFuZCBzdG9wIGFjY2Vzc2luZyB0aGUgaW50ZXJuYWwgZHJtX21tX25vZGUu
DQo+DQo+VGhlIHR0bV9yZXNvdXJjZTo6c3RhcnQgc2hvdWxkIGJlIHRoZSBzYW1lIHZhbHVlIGFz
IHRoZQ0KPmRybV9tbV9ub2RlOjpzdGFydC4NCg0KInNob3VsZCBiZSI/DQoNCkFyZSB5b3Ugc3Vy
ZT8gIPCfmIoNCg0KSWYgaXQgaXNuJ3QsIGlzIHRoZXJlIGFuIGlzc3VlPw0KDQpJZiB0aGV5IGFy
ZSB0aGUgc2FtZSAoc2V0IGluIHR0bV9yYW5nZV9tYW5fYWxsb2M/KSwgbWF5YmU6DQoNClRoZSB0
dG1fcmVzb3VyY2U6OnN0YXJ0IGlzIHRoZSBzYW1lIHZhbHVlIGFzIHRoZSBkcm1fbW1fbm9kZTo6
c3RhcnQuDQoNCldpdGggdGhhdCBjaGFuZ2U6DQoNClJldmlld2VkLWJ5OiBNaWNoYWVsIEouIFJ1
aGwgPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT4NCg0KTQ0KDQo+U2lnbmVkLW9mZi1ieTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPi0tLQ0KPiBkcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9hZ3BfYmFja2VuZC5jIHwgOCArKysrLS0tLQ0KPiAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPg0KPmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9hZ3BfYmFja2VuZC5jDQo+Yi9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9hZ3BfYmFja2VuZC5jDQo+aW5kZXggMDIyNmFlNjlkM2FiLi42ZGRjMTZmMGZlMmIg
MTAwNjQ0DQo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYWdwX2JhY2tlbmQuYw0KPisr
KyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2FncF9iYWNrZW5kLmMNCj5AQCAtMzIsOCArMzIs
OSBAQA0KPg0KPiAjZGVmaW5lIHByX2ZtdChmbXQpICJbVFRNXSAiIGZtdA0KPg0KPi0jaW5jbHVk
ZSA8ZHJtL3R0bS90dG1fYm9fZHJpdmVyLmg+DQo+LSNpbmNsdWRlIDxkcm0vdHRtL3R0bV9wbGFj
ZW1lbnQuaD4NCj4rI2luY2x1ZGUgPGRybS90dG0vdHRtX2RldmljZS5oPg0KPisjaW5jbHVkZSA8
ZHJtL3R0bS90dG1fdHQuaD4NCj4rI2luY2x1ZGUgPGRybS90dG0vdHRtX3Jlc291cmNlLmg+DQo+
ICNpbmNsdWRlIDxsaW51eC9hZ3BfYmFja2VuZC5oPg0KPiAjaW5jbHVkZSA8bGludXgvbW9kdWxl
Lmg+DQo+ICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+QEAgLTUwLDcgKzUxLDYgQEAgaW50IHR0
bV9hZ3BfYmluZChzdHJ1Y3QgdHRtX3R0ICp0dG0sIHN0cnVjdA0KPnR0bV9yZXNvdXJjZSAqYm9f
bWVtKQ0KPiB7DQo+IAlzdHJ1Y3QgdHRtX2FncF9iYWNrZW5kICphZ3BfYmUgPSBjb250YWluZXJf
b2YodHRtLCBzdHJ1Y3QNCj50dG1fYWdwX2JhY2tlbmQsIHR0bSk7DQo+IAlzdHJ1Y3QgcGFnZSAq
ZHVtbXlfcmVhZF9wYWdlID0gdHRtX2dsb2IuZHVtbXlfcmVhZF9wYWdlOw0KPi0Jc3RydWN0IGRy
bV9tbV9ub2RlICpub2RlID0gYm9fbWVtLT5tbV9ub2RlOw0KPiAJc3RydWN0IGFncF9tZW1vcnkg
Km1lbTsNCj4gCWludCByZXQsIGNhY2hlZCA9IHR0bS0+Y2FjaGluZyA9PSB0dG1fY2FjaGVkOw0K
PiAJdW5zaWduZWQgaTsNCj5AQCAtNzYsNyArNzYsNyBAQCBpbnQgdHRtX2FncF9iaW5kKHN0cnVj
dCB0dG1fdHQgKnR0bSwgc3RydWN0DQo+dHRtX3Jlc291cmNlICpib19tZW0pDQo+IAltZW0tPmlz
X2ZsdXNoZWQgPSAxOw0KPiAJbWVtLT50eXBlID0gKGNhY2hlZCkgPyBBR1BfVVNFUl9DQUNIRURf
TUVNT1JZIDoNCj5BR1BfVVNFUl9NRU1PUlk7DQo+DQo+LQlyZXQgPSBhZ3BfYmluZF9tZW1vcnko
bWVtLCBub2RlLT5zdGFydCk7DQo+KwlyZXQgPSBhZ3BfYmluZF9tZW1vcnkobWVtLCBib19tZW0t
PnN0YXJ0KTsNCj4gCWlmIChyZXQpDQo+IAkJcHJfZXJyKCJBR1AgQmluZCBtZW1vcnkgZmFpbGVk
XG4iKTsNCj4NCj4tLQ0KPjIuMjUuMQ0KPg0KPl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQo+ZHJpLWRldmVsIG1haWxpbmcgbGlzdA0KPmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj5odHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
