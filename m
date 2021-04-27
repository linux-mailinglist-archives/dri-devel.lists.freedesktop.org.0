Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A894136CAAB
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 19:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2790689D60;
	Tue, 27 Apr 2021 17:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D5989D73;
 Tue, 27 Apr 2021 17:52:38 +0000 (UTC)
IronPort-SDR: aNZ47Ro6G9F4vDx//cCbtKx81SCNn96O5ZBvK6dmBkqREs0AXmgTU+Yqzn2Tyd+s2mNBGMPcv/
 0F5+s3t155uQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9967"; a="176042811"
X-IronPort-AV: E=Sophos;i="5.82,255,1613462400"; d="scan'208";a="176042811"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 10:52:37 -0700
IronPort-SDR: m2w124wBHKGikUkK/Vsed2CwAX1tf2e/6aYYSxoMvwu3YMhMvqqcJjTyxlEOKOVeiQYxl1+1Q9
 LvbR0S7RqBCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,255,1613462400"; d="scan'208";a="618999318"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 27 Apr 2021 10:52:37 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 27 Apr 2021 10:52:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 27 Apr 2021 10:52:35 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2106.013;
 Tue, 27 Apr 2021 10:52:35 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH v2] drm/i915/gem: Remove reference to struct
 drm_device.pdev
Thread-Topic: [PATCH v2] drm/i915/gem: Remove reference to struct
 drm_device.pdev
Thread-Index: AQHXO42h6nBiwPJrHU+RREehwR9FJKrIpLpA
Date: Tue, 27 Apr 2021 17:52:35 +0000
Message-ID: <5e1934e6761646f7993801c2e43e5ed8@intel.com>
References: <20210427174857.7862-1-tzimmermann@suse.de>
In-Reply-To: <20210427174857.7862-1-tzimmermann@suse.de>
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
 Tvrtko" <tvrtko.ursulin@intel.com>, "Nikula, 
 Jani" <jani.nikula@intel.com>, Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, "Tang, CQ" <cq.tang@intel.com>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Liu, Xinyun" <xinyun.liu@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj5TZW50OiBUdWVzZGF5LCBBcHJpbCAyNywgMjAyMSAxOjQ5
IFBNDQo+VG86IGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbTsgam9vbmFzLmxhaHRpbmVuQGxp
bnV4LmludGVsLmNvbTsgVml2aSwgUm9kcmlnbw0KPjxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPjsg
YWlybGllZEBsaW51eC5pZTsgZGFuaWVsQGZmd2xsLmNoOyBBdWxkLCBNYXR0aGV3DQo+PG1hdHRo
ZXcuYXVsZEBpbnRlbC5jb20+OyBSdWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGludGVs
LmNvbT4NCj5DYzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzsgVGhvbWFzDQo+WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT47IE5pa3VsYSwgSmFuaQ0KPjxqYW5pLm5pa3VsYUBpbnRlbC5jb20+OyBUYW5nLCBDUSA8
Y3EudGFuZ0BpbnRlbC5jb20+OyBUdnJ0a28gVXJzdWxpbg0KPjx0dnJ0a28udXJzdWxpbkBsaW51
eC5pbnRlbC5jb20+OyBMaXUsIFhpbnl1biA8eGlueXVuLmxpdUBpbnRlbC5jb20+OyBVcnN1bGlu
LA0KPlR2cnRrbyA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPjsgQ2hyaXMgV2lsc29uIDxjaHJp
c0BjaHJpcy13aWxzb24uY28udWs+Ow0KPk1pa2EgS3VvcHBhbGEgPG1pa2Eua3VvcHBhbGFAbGlu
dXguaW50ZWwuY29tPjsgRGFuaWVsIFZldHRlcg0KPjxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPjsg
TWFhcnRlbiBMYW5raG9yc3QNCj48bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPjsg
SGVsbHN0cm9tLCBUaG9tYXMNCj48dGhvbWFzLmhlbGxzdHJvbUBpbnRlbC5jb20+OyBHdXN0YXZv
IEEuIFIuIFNpbHZhDQo+PGd1c3Rhdm9hcnNAa2VybmVsLm9yZz47IERhbiBDYXJwZW50ZXIgPGRh
bi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4NCj5TdWJqZWN0OiBbUEFUQ0ggdjJdIGRybS9pOTE1L2dl
bTogUmVtb3ZlIHJlZmVyZW5jZSB0byBzdHJ1Y3QNCj5kcm1fZGV2aWNlLnBkZXYNCj4NCj5SZWZl
cmVuY2VzIHRvIHN0cnVjdCBkcm1fZGV2aWNlLnBkZXYgc2hvdWxkIG5vdCBiZSB1c2VkIGFueSBs
b25nZXIgYXMNCj50aGUgZmllbGQgd2lsbCBiZSBtb3ZlZCBpbnRvIHRoZSBzdHJ1Y3QncyBsZWdh
Y3kgc2VjdGlvbi4gQWRkIGEgZml4DQo+Zm9yIHRoZSByc3AgY29tbWl0Lg0KDQpDb21taXQgbWVz
c2FnZSBtYXRjaCB0aGUgcGF0Y2guDQoNClJldmlld2VkLWJ5OiBNaWNoYWVsIEouIFJ1aGwgPG1p
Y2hhZWwuai5ydWhsQGludGVsLmNvbQ0KDQpNDQoNCj52MjoNCj4JKiBmaXggYW4gZXJyb3IgaW4g
dGhlIGNvbW1pdCBkZXNjcmlwdGlvbiAoTWljaGFlbCkNCj4NCj5TaWduZWQtb2ZmLWJ5OiBUaG9t
YXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj5SZXZpZXdlZC1ieTogSmFuaSBO
aWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4NCj5GaXhlczogZDU3ZDRhMWRhZjVlICgiZHJt
L2k5MTU6IENyZWF0ZSBzdG9sZW4gbWVtb3J5IHJlZ2lvbiBmcm9tIGxvY2FsDQo+bWVtb3J5IikN
Cj5DYzogQ1EgVGFuZyA8Y3EudGFuZ0BpbnRlbC5jb20+DQo+Q2M6IE1hdHRoZXcgQXVsZCA8bWF0
dGhldy5hdWxkQGludGVsLmNvbT4NCj5DYzogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGlu
QGxpbnV4LmludGVsLmNvbT4NCj5DYzogWGlueXVuIExpdSA8eGlueXVuLmxpdUBpbnRlbC5jb20+
DQo+Q2M6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+DQo+Q2M6IEph
bmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+DQo+Q2M6IEpvb25hcyBMYWh0
aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT4NCj5DYzogUm9kcmlnbyBWaXZp
IDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlz
LXdpbHNvbi5jby51az4NCj5DYzogTWlrYSBLdW9wcGFsYSA8bWlrYS5rdW9wcGFsYUBsaW51eC5p
bnRlbC5jb20+DQo+Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+DQo+
Q2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+
DQo+Q2M6ICJUaG9tYXMgSGVsbHN0csO2bSIgPHRob21hcy5oZWxsc3Ryb21AaW50ZWwuY29tPg0K
PkNjOiAiR3VzdGF2byBBLiBSLiBTaWx2YSIgPGd1c3Rhdm9hcnNAa2VybmVsLm9yZz4NCj5DYzog
RGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPg0KPkNjOiBpbnRlbC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+LS0tDQo+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9p
OTE1X2dlbV9zdG9sZW4uYyB8IDIgKy0NCj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pDQo+DQo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dl
bS9pOTE1X2dlbV9zdG9sZW4uYw0KPmIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2Vt
X3N0b2xlbi5jDQo+aW5kZXggYzViNjRiMjQwMGU4Li5lMWEzMjY3MmJiZTggMTAwNjQ0DQo+LS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3N0b2xlbi5jDQo+KysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3N0b2xlbi5jDQo+QEAgLTc3Myw3ICs3NzMs
NyBAQCBzdHJ1Y3QgaW50ZWxfbWVtb3J5X3JlZ2lvbiAqDQo+IGk5MTVfZ2VtX3N0b2xlbl9sbWVt
X3NldHVwKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1KQ0KPiB7DQo+IAlzdHJ1Y3QgaW50
ZWxfdW5jb3JlICp1bmNvcmUgPSAmaTkxNS0+dW5jb3JlOw0KPi0Jc3RydWN0IHBjaV9kZXYgKnBk
ZXYgPSBpOTE1LT5kcm0ucGRldjsNCj4rCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2Rl
dihpOTE1LT5kcm0uZGV2KTsNCj4gCXN0cnVjdCBpbnRlbF9tZW1vcnlfcmVnaW9uICptZW07DQo+
IAlyZXNvdXJjZV9zaXplX3QgaW9fc3RhcnQ7DQo+IAlyZXNvdXJjZV9zaXplX3QgbG1lbV9zaXpl
Ow0KPi0tDQo+Mi4zMS4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
