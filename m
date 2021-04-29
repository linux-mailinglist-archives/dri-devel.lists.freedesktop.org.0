Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7044336E807
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 11:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F4F6EDC5;
	Thu, 29 Apr 2021 09:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15EB96EDC5;
 Thu, 29 Apr 2021 09:32:48 +0000 (UTC)
IronPort-SDR: FV+hQBex7bTjGkVbW8gdN3GTsr5QRKPMVCkRVs2dazo1yhATVHR+Ip6W/pfbciuVOvJHPlA2HY
 X8ort/QggGLw==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="282305234"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="282305234"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 02:32:47 -0700
IronPort-SDR: hRVi9EXSQJIuRNPiu7Oy1q78+Drbr+tEdeFRAM/EkQ0ORFY1ZJMh/QvmcqfWmE7uYYYDfLA6tC
 Nibv9hmFgEUQ==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="430757820"
Received: from auchter-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.38.190])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 02:32:40 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Ruhl\, Michael J" <michael.j.ruhl@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "joonas.lahtinen\@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Vivi\,
 Rodrigo" <rodrigo.vivi@intel.com>, "airlied\@linux.ie" <airlied@linux.ie>,
 "daniel\@ffwll.ch" <daniel@ffwll.ch>, "Auld\,
 Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH v2] drm/i915/gem: Remove reference to struct
 drm_device.pdev
In-Reply-To: <5e1934e6761646f7993801c2e43e5ed8@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210427174857.7862-1-tzimmermann@suse.de>
 <5e1934e6761646f7993801c2e43e5ed8@intel.com>
Date: Thu, 29 Apr 2021 12:32:37 +0300
Message-ID: <87k0ol307e.fsf@intel.com>
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

T24gVHVlLCAyNyBBcHIgMjAyMSwgIlJ1aGwsIE1pY2hhZWwgSiIgPG1pY2hhZWwuai5ydWhsQGlu
dGVsLmNvbT4gd3JvdGU6Cj4+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj5Gcm9tOiBUaG9t
YXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPj5TZW50OiBUdWVzZGF5LCBBcHJp
bCAyNywgMjAyMSAxOjQ5IFBNCj4+VG86IGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbTsgam9v
bmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbTsgVml2aSwgUm9kcmlnbwo+Pjxyb2RyaWdvLnZp
dmlAaW50ZWwuY29tPjsgYWlybGllZEBsaW51eC5pZTsgZGFuaWVsQGZmd2xsLmNoOyBBdWxkLCBN
YXR0aGV3Cj4+PG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+OyBSdWhsLCBNaWNoYWVsIEogPG1pY2hh
ZWwuai5ydWhsQGludGVsLmNvbT4KPj5DYzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgVGhvbWFzCj4+WmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT47IE5pa3VsYSwgSmFuaQo+PjxqYW5pLm5pa3VsYUBpbnRlbC5j
b20+OyBUYW5nLCBDUSA8Y3EudGFuZ0BpbnRlbC5jb20+OyBUdnJ0a28gVXJzdWxpbgo+Pjx0dnJ0
a28udXJzdWxpbkBsaW51eC5pbnRlbC5jb20+OyBMaXUsIFhpbnl1biA8eGlueXVuLmxpdUBpbnRl
bC5jb20+OyBVcnN1bGluLAo+PlR2cnRrbyA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPjsgQ2hy
aXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Owo+Pk1pa2EgS3VvcHBhbGEgPG1p
a2Eua3VvcHBhbGFAbGludXguaW50ZWwuY29tPjsgRGFuaWVsIFZldHRlcgo+PjxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPjsgTWFhcnRlbiBMYW5raG9yc3QKPj48bWFhcnRlbi5sYW5raG9yc3RAbGlu
dXguaW50ZWwuY29tPjsgSGVsbHN0cm9tLCBUaG9tYXMKPj48dGhvbWFzLmhlbGxzdHJvbUBpbnRl
bC5jb20+OyBHdXN0YXZvIEEuIFIuIFNpbHZhCj4+PGd1c3Rhdm9hcnNAa2VybmVsLm9yZz47IERh
biBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KPj5TdWJqZWN0OiBbUEFUQ0gg
djJdIGRybS9pOTE1L2dlbTogUmVtb3ZlIHJlZmVyZW5jZSB0byBzdHJ1Y3QKPj5kcm1fZGV2aWNl
LnBkZXYKPj4KPj5SZWZlcmVuY2VzIHRvIHN0cnVjdCBkcm1fZGV2aWNlLnBkZXYgc2hvdWxkIG5v
dCBiZSB1c2VkIGFueSBsb25nZXIgYXMKPj50aGUgZmllbGQgd2lsbCBiZSBtb3ZlZCBpbnRvIHRo
ZSBzdHJ1Y3QncyBsZWdhY3kgc2VjdGlvbi4gQWRkIGEgZml4Cj4+Zm9yIHRoZSByc3AgY29tbWl0
Lgo+Cj4gQ29tbWl0IG1lc3NhZ2UgbWF0Y2ggdGhlIHBhdGNoLgo+Cj4gUmV2aWV3ZWQtYnk6IE1p
Y2hhZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tCgpUaGFua3MgZm9yIHRoZSBw
YXRjaCBhbmQgcmV2aWV3LCBwdXNoZWQgdG8gZHJtLWludGVsLWd0LW5leHQuCgpCUiwKSmFuaS4K
Cj4KPiBNCj4KPj52MjoKPj4JKiBmaXggYW4gZXJyb3IgaW4gdGhlIGNvbW1pdCBkZXNjcmlwdGlv
biAoTWljaGFlbCkKPj4KPj5TaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4KPj5SZXZpZXdlZC1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGlu
dGVsLmNvbT4KPj5GaXhlczogZDU3ZDRhMWRhZjVlICgiZHJtL2k5MTU6IENyZWF0ZSBzdG9sZW4g
bWVtb3J5IHJlZ2lvbiBmcm9tIGxvY2FsCj4+bWVtb3J5IikKPj5DYzogQ1EgVGFuZyA8Y3EudGFu
Z0BpbnRlbC5jb20+Cj4+Q2M6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4K
Pj5DYzogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGxpbnV4LmludGVsLmNvbT4KPj5D
YzogWGlueXVuIExpdSA8eGlueXVuLmxpdUBpbnRlbC5jb20+Cj4+Q2M6IFR2cnRrbyBVcnN1bGlu
IDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Cj4+Q2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3Vs
YUBsaW51eC5pbnRlbC5jb20+Cj4+Q2M6IEpvb25hcyBMYWh0aW5lbiA8am9vbmFzLmxhaHRpbmVu
QGxpbnV4LmludGVsLmNvbT4KPj5DYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwu
Y29tPgo+PkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPj5DYzog
TWlrYSBLdW9wcGFsYSA8bWlrYS5rdW9wcGFsYUBsaW51eC5pbnRlbC5jb20+Cj4+Q2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4+Q2M6IE1hYXJ0ZW4gTGFua2hvcnN0
IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4+Q2M6ICJUaG9tYXMgSGVsbHN0
csO2bSIgPHRob21hcy5oZWxsc3Ryb21AaW50ZWwuY29tPgo+PkNjOiAiR3VzdGF2byBBLiBSLiBT
aWx2YSIgPGd1c3Rhdm9hcnNAa2VybmVsLm9yZz4KPj5DYzogRGFuIENhcnBlbnRlciA8ZGFuLmNh
cnBlbnRlckBvcmFjbGUuY29tPgo+PkNjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4+LS0tCj4+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9zdG9sZW4uYyB8IDIg
Ky0KPj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9zdG9sZW4uYwo+
PmIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3N0b2xlbi5jCj4+aW5kZXggYzVi
NjRiMjQwMGU4Li5lMWEzMjY3MmJiZTggMTAwNjQ0Cj4+LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ2VtL2k5MTVfZ2VtX3N0b2xlbi5jCj4+KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2Vt
L2k5MTVfZ2VtX3N0b2xlbi5jCj4+QEAgLTc3Myw3ICs3NzMsNyBAQCBzdHJ1Y3QgaW50ZWxfbWVt
b3J5X3JlZ2lvbiAqCj4+IGk5MTVfZ2VtX3N0b2xlbl9sbWVtX3NldHVwKHN0cnVjdCBkcm1faTkx
NV9wcml2YXRlICppOTE1KQo+PiB7Cj4+IAlzdHJ1Y3QgaW50ZWxfdW5jb3JlICp1bmNvcmUgPSAm
aTkxNS0+dW5jb3JlOwo+Pi0Jc3RydWN0IHBjaV9kZXYgKnBkZXYgPSBpOTE1LT5kcm0ucGRldjsK
Pj4rCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihpOTE1LT5kcm0uZGV2KTsKPj4g
CXN0cnVjdCBpbnRlbF9tZW1vcnlfcmVnaW9uICptZW07Cj4+IAlyZXNvdXJjZV9zaXplX3QgaW9f
c3RhcnQ7Cj4+IAlyZXNvdXJjZV9zaXplX3QgbG1lbV9zaXplOwo+Pi0tCj4+Mi4zMS4xCj4KCi0t
IApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
