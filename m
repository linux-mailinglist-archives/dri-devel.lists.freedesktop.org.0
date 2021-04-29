Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBD736EDCA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 18:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD126F39B;
	Thu, 29 Apr 2021 16:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F3B6F39F;
 Thu, 29 Apr 2021 16:03:03 +0000 (UTC)
IronPort-SDR: QbKR/5zXhSY8UcBWZPKpLX/s8lmZLlPZU8FxdI6ijWuYW8yL6mLmg1r9a+v/VJ+9DgoRPYZsoc
 4EVnxUIo3bUQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="197085723"
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; d="scan'208";a="197085723"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 09:03:02 -0700
IronPort-SDR: B+DLYC02q3HNjQ20/xqSXvTFNT6ejHFcA5J8hVPu1ImTHJkkXE0j4dQBDsfiXnhfRM5vBo41AH
 bHOv2HRBuEMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; d="scan'208";a="466399252"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 29 Apr 2021 09:03:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 29 Apr 2021 09:03:00 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 29 Apr 2021 09:02:59 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2106.013;
 Thu, 29 Apr 2021 09:02:59 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>
Subject: RE: [Intel-gfx] [PATCH v8 2/5] drm/i915/gt: Remove reference to
 struct drm_device.pdev
Thread-Topic: [Intel-gfx] [PATCH v8 2/5] drm/i915/gt: Remove reference to
 struct drm_device.pdev
Thread-Index: AQHXPOWVuzW6CLp56UmKsLSroIPgy6rLqEhg
Date: Thu, 29 Apr 2021 16:02:59 +0000
Message-ID: <a1435011b71f4be7b59447ef1b634dad@intel.com>
References: <20210429105101.25667-1-tzimmermann@suse.de>
 <20210429105101.25667-3-tzimmermann@suse.de>
In-Reply-To: <20210429105101.25667-3-tzimmermann@suse.de>
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
Cc: "Winiarski, Michal" <michal.winiarski@intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogSW50ZWwtZ2Z4IDxpbnRlbC1nZngt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPlRob21hcyBaaW1t
ZXJtYW5uDQo+U2VudDogVGh1cnNkYXksIEFwcmlsIDI5LCAyMDIxIDY6NTEgQU0NCj5UbzogamFu
aS5uaWt1bGFAbGludXguaW50ZWwuY29tOyBqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29t
OyBWaXZpLCBSb2RyaWdvDQo+PHJvZHJpZ28udml2aUBpbnRlbC5jb20+OyBhaXJsaWVkQGxpbnV4
LmllOyBkYW5pZWxAZmZ3bGwuY2g7IGNocmlzQGNocmlzLQ0KPndpbHNvbi5jby51aw0KPkNjOiBX
aW5pYXJza2ksIE1pY2hhbCA8bWljaGFsLndpbmlhcnNraUBpbnRlbC5jb20+OyBOaWt1bGEsIEph
bmkNCj48amFuaS5uaWt1bGFAaW50ZWwuY29tPjsgRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBmZndsbC5jaD47IGludGVsLQ0KPmdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IERlIE1hcmNo
aSwgTHVjYXMgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT47IGRyaS0NCj5kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7IEF1bGQsIE1hdHRoZXcgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+Ow0K
PlRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPlN1YmplY3Q6IFtJbnRl
bC1nZnhdIFtQQVRDSCB2OCAyLzVdIGRybS9pOTE1L2d0OiBSZW1vdmUgcmVmZXJlbmNlIHRvIHN0
cnVjdA0KPmRybV9kZXZpY2UucGRldg0KPg0KPlJlZmVyZW5jZXMgdG8gc3RydWN0IGRybV9kZXZp
Y2UucGRldiBzaG91bGQgbm90IGJlIHVzZWQgYW55IGxvbmdlciBhcw0KPnRoZSBmaWVsZCB3aWxs
IGJlIG1vdmVkIGludG8gdGhlIHN0cnVjdCdzIGxlZ2FjeSBzZWN0aW9uLiBBZGQgYSBmaXgNCj5m
b3IgdGhlIHJzcCBjb21taXQuDQo+DQo+djg6DQo+CSogZml4IGNvbW1pdCBtZXNzYWdlIChNaWNo
YWVsKQ0KDQpSZXZpZXdlZC1ieTogTWljaGFlbCBKLiBSdWhsIDxtaWNoYWVsLmoucnVobEBpbnRl
bC5jb20+DQoNCm0NCg0KPlNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPg0KPkZpeGVzOiBhNTBjYTM5ZmJkMDEgKCJkcm0vaTkxNTogc2V0dXAgdGhl
IExNRU0gcmVnaW9uIikNCj5DYzogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRl
bC5jb20+DQo+Q2M6IEpvb25hcyBMYWh0aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVs
LmNvbT4NCj5DYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPkNjOiBN
YXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+Q2M6IEphbmkgTmlrdWxhIDxq
YW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+Q2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2ls
c29uLmNvLnVrPg0KPkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPg0K
PkNjOiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPg0KPkNjOiBEYW5p
ZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPg0KPkNj
OiBNaWthIEt1b3BwYWxhIDxtaWthLmt1b3BwYWxhQGxpbnV4LmludGVsLmNvbT4NCj5DYzogTWFh
cnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4NCj5DYzog
VmVua2F0YSBTYW5kZWVwIERoYW5hbGFrb3RhIDx2ZW5rYXRhLnMuZGhhbmFsYWtvdGFAaW50ZWwu
Y29tPg0KPkNjOiAiTWljaGHFgiBXaW5pYXJza2kiIDxtaWNoYWwud2luaWFyc2tpQGludGVsLmNv
bT4NCj4tLS0NCj4gZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfcmVnaW9uX2xtZW0uYyB8
IDIgKy0NCj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+
DQo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX3JlZ2lvbl9sbWVt
LmMNCj5iL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX3JlZ2lvbl9sbWVtLmMNCj5pbmRl
eCBiZTZmMmM4ZjUxODQuLjczZmNlYjBjMjVmYyAxMDA2NDQNCj4tLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndC9pbnRlbF9yZWdpb25fbG1lbS5jDQo+KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3QvaW50ZWxfcmVnaW9uX2xtZW0uYw0KPkBAIC0xNzcsNyArMTc3LDcgQEAgc3RhdGljIHN0
cnVjdCBpbnRlbF9tZW1vcnlfcmVnaW9uDQo+KnNldHVwX2xtZW0oc3RydWN0IGludGVsX2d0ICpn
dCkNCj4gew0KPiAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUgPSBndC0+aTkxNTsNCj4g
CXN0cnVjdCBpbnRlbF91bmNvcmUgKnVuY29yZSA9IGd0LT51bmNvcmU7DQo+LQlzdHJ1Y3QgcGNp
X2RldiAqcGRldiA9IGk5MTUtPmRybS5wZGV2Ow0KPisJc3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0
b19wY2lfZGV2KGk5MTUtPmRybS5kZXYpOw0KPiAJc3RydWN0IGludGVsX21lbW9yeV9yZWdpb24g
Km1lbTsNCj4gCXJlc291cmNlX3NpemVfdCBpb19zdGFydDsNCj4gCXJlc291cmNlX3NpemVfdCBs
bWVtX3NpemU7DQo+LS0NCj4yLjMxLjENCj4NCj5fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXw0KPkludGVsLWdmeCBtYWlsaW5nIGxpc3QNCj5JbnRlbC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pbnRlbC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
