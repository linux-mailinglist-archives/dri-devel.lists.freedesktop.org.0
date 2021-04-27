Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB0936C690
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 14:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0616E17E;
	Tue, 27 Apr 2021 12:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496D96E17E;
 Tue, 27 Apr 2021 12:58:40 +0000 (UTC)
IronPort-SDR: gd6KvAZmfCDdNZTKwm3JOj5eA9xtcTlrMlS9Br8W2uTd8qFe/XwpJvs9JyhIkocg2Z/85QUPfZ
 xQYvWPz0qCJw==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="196055011"
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; d="scan'208";a="196055011"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 05:58:39 -0700
IronPort-SDR: qQ+I530/93YM2X/LXiKVm101EVHco6rRmcBYtMexnrXF4PFY1sCMc/Jo3QDb4GrFkgdEGJ2qYV
 NSCyUuXIUTag==
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; d="scan'208";a="429800902"
Received: from aalbarra-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.41.45])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 05:58:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 matthew.auld@intel.com
Subject: Re: [PATCH] drm/i915/gem: Remove reference to struct drm_device.pdev
In-Reply-To: <20210427110747.2065-1-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210427110747.2065-1-tzimmermann@suse.de>
Date: Tue, 27 Apr 2021 15:58:30 +0300
Message-ID: <87r1iv51ft.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, CQ Tang <cq.tang@intel.com>,
 Thomas =?utf-8?Q?H?= =?utf-8?Q?ellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Xinyun Liu <xinyun.liu@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyNyBBcHIgMjAyMSwgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+IHdyb3RlOgo+IFJlZmVyZW5jZXMgdG8gc3RydWN0IGRybV9kZXZpY2UucGRldiBzaG91bGQg
YmUgdXNlZCBhbnkgbG9uZ2VyIGFzCj4gdGhlIGZpZWxkIHdpbGwgYmUgbW92ZWQgaW50byB0aGUg
c3RydWN0J3MgbGVnYWN5IHNlY3Rpb24uIEFkZCBhIGZpeAo+IGZvciB0aGUgcnNwIGNvbW1pdC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRl
Pgo+IEZpeGVzOiBkNTdkNGExZGFmNWUgKCJkcm0vaTkxNTogQ3JlYXRlIHN0b2xlbiBtZW1vcnkg
cmVnaW9uIGZyb20gbG9jYWwgbWVtb3J5IikKPiBDYzogQ1EgVGFuZyA8Y3EudGFuZ0BpbnRlbC5j
b20+Cj4gQ2M6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4KPiBDYzogVHZy
dGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGxpbnV4LmludGVsLmNvbT4KPiBDYzogWGlueXVu
IExpdSA8eGlueXVuLmxpdUBpbnRlbC5jb20+Cj4gQ2M6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28u
dXJzdWxpbkBpbnRlbC5jb20+Cj4gQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5p
bnRlbC5jb20+Cj4gQ2M6IEpvb25hcyBMYWh0aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4Lmlu
dGVsLmNvbT4KPiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPgo+IENj
OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiBDYzogTWlrYSBLdW9w
cGFsYSA8bWlrYS5rdW9wcGFsYUBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVu
Lmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6ICJUaG9tYXMgSGVsbHN0csO2bSIgPHRo
b21hcy5oZWxsc3Ryb21AaW50ZWwuY29tPgo+IENjOiAiR3VzdGF2byBBLiBSLiBTaWx2YSIgPGd1
c3Rhdm9hcnNAa2VybmVsLm9yZz4KPiBDYzogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBv
cmFjbGUuY29tPgo+IENjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCgpSZXZpZXdl
ZC1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KCj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9zdG9sZW4uYyB8IDIgKy0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3N0b2xlbi5jIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ2VtL2k5MTVfZ2VtX3N0b2xlbi5jCj4gaW5kZXggYzViNjRiMjQwMGU4Li5lMWEzMjY3
MmJiZTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3N0
b2xlbi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3N0b2xlbi5j
Cj4gQEAgLTc3Myw3ICs3NzMsNyBAQCBzdHJ1Y3QgaW50ZWxfbWVtb3J5X3JlZ2lvbiAqCj4gIGk5
MTVfZ2VtX3N0b2xlbl9sbWVtX3NldHVwKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1KQo+
ICB7Cj4gIAlzdHJ1Y3QgaW50ZWxfdW5jb3JlICp1bmNvcmUgPSAmaTkxNS0+dW5jb3JlOwo+IC0J
c3RydWN0IHBjaV9kZXYgKnBkZXYgPSBpOTE1LT5kcm0ucGRldjsKPiArCXN0cnVjdCBwY2lfZGV2
ICpwZGV2ID0gdG9fcGNpX2RldihpOTE1LT5kcm0uZGV2KTsKPiAgCXN0cnVjdCBpbnRlbF9tZW1v
cnlfcmVnaW9uICptZW07Cj4gIAlyZXNvdXJjZV9zaXplX3QgaW9fc3RhcnQ7Cj4gIAlyZXNvdXJj
ZV9zaXplX3QgbG1lbV9zaXplOwoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBH
cmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
