Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0837136C7DC
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 16:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617B46E97D;
	Tue, 27 Apr 2021 14:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E7F6E972;
 Tue, 27 Apr 2021 14:39:17 +0000 (UTC)
IronPort-SDR: SP2yOMnIPNhLHQ4EdWLXATBElVLYRAoOWvbQ5p3mZd2tdfqb6uw5bbDx4W0jSmAnX++ZzGBWl7
 n9h1hopZqHWQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9967"; a="217230952"
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; d="scan'208";a="217230952"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 07:39:16 -0700
IronPort-SDR: XyfUX0MJws74MI4TB5WH14ab1r+w15/cbMfJcfFWrUuHL0DO2ypAYIz90adb68J28bHycKFEbE
 VcnGbaRU/wJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; d="scan'208";a="457669224"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2021 07:39:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 27 Apr 2021 07:39:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 27 Apr 2021 07:39:15 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2106.013;
 Tue, 27 Apr 2021 07:39:15 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH] drm/i915/gem: Remove reference to struct drm_device.pdev
Thread-Topic: [PATCH] drm/i915/gem: Remove reference to struct drm_device.pdev
Thread-Index: AQHXO1WVpk1PJwnTDUWet7/NOrlG9arIb1wA
Date: Tue, 27 Apr 2021 14:39:15 +0000
Message-ID: <c4ee56d253784b2081891908423c4389@intel.com>
References: <20210427110747.2065-1-tzimmermann@suse.de>
In-Reply-To: <20210427110747.2065-1-tzimmermann@suse.de>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Gustavo
 A. R. Silva" <gustavoars@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, "Tang, CQ" <cq.tang@intel.com>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Liu, 
 Xinyun" <xinyun.liu@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBkcmktZGV2ZWwgPGRyaS1kZXZl
bC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+VGhvbWFzIFpp
bW1lcm1hbm4NCj5TZW50OiBUdWVzZGF5LCBBcHJpbCAyNywgMjAyMSA3OjA4IEFNDQo+VG86IGph
bmkubmlrdWxhQGxpbnV4LmludGVsLmNvbTsgam9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNv
bTsgVml2aSwgUm9kcmlnbw0KPjxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPjsgYWlybGllZEBsaW51
eC5pZTsgZGFuaWVsQGZmd2xsLmNoOyBBdWxkLCBNYXR0aGV3DQo+PG1hdHRoZXcuYXVsZEBpbnRl
bC5jb20+DQo+Q2M6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBsaW51eC5pbnRlbC5j
b20+OyBVcnN1bGluLCBUdnJ0a28NCj48dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPjsgTWlrYSBL
dW9wcGFsYQ0KPjxtaWthLmt1b3BwYWxhQGxpbnV4LmludGVsLmNvbT47IGludGVsLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc7IEd1c3Rhdm8NCj5BLiBSLiBTaWx2YSA8Z3VzdGF2b2Fyc0BrZXJu
ZWwub3JnPjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgQ2hyaXMNCj5XaWxzb24g
PGNocmlzQGNocmlzLXdpbHNvbi5jby51az47IFRhbmcsIENRIDxjcS50YW5nQGludGVsLmNvbT47
IEhlbGxzdHJvbSwNCj5UaG9tYXMgPHRob21hcy5oZWxsc3Ryb21AaW50ZWwuY29tPjsgVGhvbWFz
IFppbW1lcm1hbm4NCj48dHppbW1lcm1hbm5Ac3VzZS5kZT47IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAZmZ3bGwuY2g+OyBMaXUsDQo+WGlueXVuIDx4aW55dW4ubGl1QGludGVsLmNvbT47
IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4NCj5TdWJqZWN0OiBbUEFU
Q0hdIGRybS9pOTE1L2dlbTogUmVtb3ZlIHJlZmVyZW5jZSB0byBzdHJ1Y3QNCj5kcm1fZGV2aWNl
LnBkZXYNCj4NCj5SZWZlcmVuY2VzIHRvIHN0cnVjdCBkcm1fZGV2aWNlLnBkZXYgc2hvdWxkIGJl
IHVzZWQgYW55IGxvbmdlciBhcw0KDQpzaG91bGQgbm90IGJlIHVzZWQNCiAgICAgICAgICAgICBe
Xl4NCj8NCg0KbQ0KDQo+dGhlIGZpZWxkIHdpbGwgYmUgbW92ZWQgaW50byB0aGUgc3RydWN0J3Mg
bGVnYWN5IHNlY3Rpb24uIEFkZCBhIGZpeA0KPmZvciB0aGUgcnNwIGNvbW1pdC4NCj4NCj5TaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj5GaXhl
czogZDU3ZDRhMWRhZjVlICgiZHJtL2k5MTU6IENyZWF0ZSBzdG9sZW4gbWVtb3J5IHJlZ2lvbiBm
cm9tIGxvY2FsDQo+bWVtb3J5IikNCj5DYzogQ1EgVGFuZyA8Y3EudGFuZ0BpbnRlbC5jb20+DQo+
Q2M6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj5DYzogVHZydGtvIFVy
c3VsaW4gPHR2cnRrby51cnN1bGluQGxpbnV4LmludGVsLmNvbT4NCj5DYzogWGlueXVuIExpdSA8
eGlueXVuLmxpdUBpbnRlbC5jb20+DQo+Q2M6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxp
bkBpbnRlbC5jb20+DQo+Q2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5j
b20+DQo+Q2M6IEpvb25hcyBMYWh0aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNv
bT4NCj5DYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPkNjOiBDaHJp
cyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4NCj5DYzogTWlrYSBLdW9wcGFsYSA8
bWlrYS5rdW9wcGFsYUBsaW51eC5pbnRlbC5jb20+DQo+Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAZmZ3bGwuY2g+DQo+Q2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmto
b3JzdEBsaW51eC5pbnRlbC5jb20+DQo+Q2M6ICJUaG9tYXMgSGVsbHN0csO2bSIgPHRob21hcy5o
ZWxsc3Ryb21AaW50ZWwuY29tPg0KPkNjOiAiR3VzdGF2byBBLiBSLiBTaWx2YSIgPGd1c3Rhdm9h
cnNAa2VybmVsLm9yZz4NCj5DYzogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUu
Y29tPg0KPkNjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+LS0tDQo+IGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9zdG9sZW4uYyB8IDIgKy0NCj4gMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+ZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9zdG9sZW4uYw0KPmIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3N0b2xlbi5jDQo+aW5kZXggYzViNjRiMjQwMGU4Li5lMWEz
MjY3MmJiZTggMTAwNjQ0DQo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2Vt
X3N0b2xlbi5jDQo+KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3N0b2xl
bi5jDQo+QEAgLTc3Myw3ICs3NzMsNyBAQCBzdHJ1Y3QgaW50ZWxfbWVtb3J5X3JlZ2lvbiAqDQo+
IGk5MTVfZ2VtX3N0b2xlbl9sbWVtX3NldHVwKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1
KQ0KPiB7DQo+IAlzdHJ1Y3QgaW50ZWxfdW5jb3JlICp1bmNvcmUgPSAmaTkxNS0+dW5jb3JlOw0K
Pi0Jc3RydWN0IHBjaV9kZXYgKnBkZXYgPSBpOTE1LT5kcm0ucGRldjsNCj4rCXN0cnVjdCBwY2lf
ZGV2ICpwZGV2ID0gdG9fcGNpX2RldihpOTE1LT5kcm0uZGV2KTsNCj4gCXN0cnVjdCBpbnRlbF9t
ZW1vcnlfcmVnaW9uICptZW07DQo+IAlyZXNvdXJjZV9zaXplX3QgaW9fc3RhcnQ7DQo+IAlyZXNv
dXJjZV9zaXplX3QgbG1lbV9zaXplOw0KPi0tDQo+Mi4zMS4xDQo+DQo+X19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj5kcmktZGV2ZWwgbWFpbGluZyBsaXN0
DQo+ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
