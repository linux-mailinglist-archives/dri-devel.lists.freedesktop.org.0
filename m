Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 414C04B5FB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 12:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFC66E352;
	Wed, 19 Jun 2019 10:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6548C6E352;
 Wed, 19 Jun 2019 10:11:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 261ED344;
 Wed, 19 Jun 2019 03:11:39 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 509BE3F738;
 Wed, 19 Jun 2019 03:13:25 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id C4F75682189; Wed, 19 Jun 2019 11:11:37 +0100 (BST)
Date: Wed, 19 Jun 2019 11:11:37 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 11/59] drm/arm: Drop drm_gem_prime_export/import
Message-ID: <20190619101137.GB17204@e110455-lin.cambridge.arm.com>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-12-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614203615.12639-12-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMTA6MzU6MjdQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBUaGV5J3JlIHRoZSBkZWZhdWx0Lgo+IAo+IEFzaWRlOiBXb3VsZCBiZSByZWFsbHkg
bmljZSB0byBzd2l0Y2ggdGhlIG90aGVycyBvdmVyIHRvCj4gZHJtX2dlbV9vYmplY3RfZnVuY3Mu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5j
b20+Cj4gQ2M6ICJKYW1lcyAoUWlhbikgV2FuZyIgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgo+
IENjOiBMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KPiBDYzogQnJpYW4gU3Rhcmtl
eSA8YnJpYW4uc3RhcmtleUBhcm0uY29tPgoKQWNrZWQtYnk6IExpdml1IER1ZGF1IDxsaXZpdS5k
dWRhdUBhcm0uY29tPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfa21zLmMgfCAyIC0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vaGRsY2RfZHJ2LmMg
ICAgICAgICAgICAgICAgIHwgMiAtLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYu
YyAgICAgICAgICAgICAgICB8IDIgLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA2IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2tt
cy5jCj4gaW5kZXggYjlkNjk5Y2M3YmJmLi40NWYwNWJjOTQ0ODcgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYwo+IEBAIC02Myw4ICs2
Myw2IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBrb21lZGFfa21zX2RyaXZlciA9IHsKPiAg
CS5kdW1iX2NyZWF0ZQkJCT0ga29tZWRhX2dlbV9jbWFfZHVtYl9jcmVhdGUsCj4gIAkucHJpbWVf
aGFuZGxlX3RvX2ZkCQk9IGRybV9nZW1fcHJpbWVfaGFuZGxlX3RvX2ZkLAo+ICAJLnByaW1lX2Zk
X3RvX2hhbmRsZQkJPSBkcm1fZ2VtX3ByaW1lX2ZkX3RvX2hhbmRsZSwKPiAtCS5nZW1fcHJpbWVf
ZXhwb3J0CQk9IGRybV9nZW1fcHJpbWVfZXhwb3J0LAo+IC0JLmdlbV9wcmltZV9pbXBvcnQJCT0g
ZHJtX2dlbV9wcmltZV9pbXBvcnQsCj4gIAkuZ2VtX3ByaW1lX2dldF9zZ190YWJsZQkJPSBkcm1f
Z2VtX2NtYV9wcmltZV9nZXRfc2dfdGFibGUsCj4gIAkuZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJs
ZQk9IGRybV9nZW1fY21hX3ByaW1lX2ltcG9ydF9zZ190YWJsZSwKPiAgCS5nZW1fcHJpbWVfdm1h
cAkJCT0gZHJtX2dlbV9jbWFfcHJpbWVfdm1hcCwKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FybS9oZGxjZF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vaGRsY2RfZHJ2LmMKPiBp
bmRleCBiMTI2NTU1ODk1ZDguLjI3YzQ2YTI4MzhjNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2hkbGNkX2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9oZGxjZF9k
cnYuYwo+IEBAIC0yNDAsOCArMjQwLDYgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGhkbGNk
X2RyaXZlciA9IHsKPiAgCS5kdW1iX2NyZWF0ZSA9IGRybV9nZW1fY21hX2R1bWJfY3JlYXRlLAo+
ICAJLnByaW1lX2hhbmRsZV90b19mZCA9IGRybV9nZW1fcHJpbWVfaGFuZGxlX3RvX2ZkLAo+ICAJ
LnByaW1lX2ZkX3RvX2hhbmRsZSA9IGRybV9nZW1fcHJpbWVfZmRfdG9faGFuZGxlLAo+IC0JLmdl
bV9wcmltZV9leHBvcnQgPSBkcm1fZ2VtX3ByaW1lX2V4cG9ydCwKPiAtCS5nZW1fcHJpbWVfaW1w
b3J0ID0gZHJtX2dlbV9wcmltZV9pbXBvcnQsCj4gIAkuZ2VtX3ByaW1lX2dldF9zZ190YWJsZSA9
IGRybV9nZW1fY21hX3ByaW1lX2dldF9zZ190YWJsZSwKPiAgCS5nZW1fcHJpbWVfaW1wb3J0X3Nn
X3RhYmxlID0gZHJtX2dlbV9jbWFfcHJpbWVfaW1wb3J0X3NnX3RhYmxlLAo+ICAJLmdlbV9wcmlt
ZV92bWFwID0gZHJtX2dlbV9jbWFfcHJpbWVfdm1hcCwKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYu
Ywo+IGluZGV4IDVkY2NjNzEzMDczOS4uM2VjZGYxMzExMzM1IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9t
YWxpZHBfZHJ2LmMKPiBAQCAtNTc0LDggKzU3NCw2IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZl
ciBtYWxpZHBfZHJpdmVyID0gewo+ICAJLmR1bWJfY3JlYXRlID0gbWFsaWRwX2R1bWJfY3JlYXRl
LAo+ICAJLnByaW1lX2hhbmRsZV90b19mZCA9IGRybV9nZW1fcHJpbWVfaGFuZGxlX3RvX2ZkLAo+
ICAJLnByaW1lX2ZkX3RvX2hhbmRsZSA9IGRybV9nZW1fcHJpbWVfZmRfdG9faGFuZGxlLAo+IC0J
LmdlbV9wcmltZV9leHBvcnQgPSBkcm1fZ2VtX3ByaW1lX2V4cG9ydCwKPiAtCS5nZW1fcHJpbWVf
aW1wb3J0ID0gZHJtX2dlbV9wcmltZV9pbXBvcnQsCj4gIAkuZ2VtX3ByaW1lX2dldF9zZ190YWJs
ZSA9IGRybV9nZW1fY21hX3ByaW1lX2dldF9zZ190YWJsZSwKPiAgCS5nZW1fcHJpbWVfaW1wb3J0
X3NnX3RhYmxlID0gZHJtX2dlbV9jbWFfcHJpbWVfaW1wb3J0X3NnX3RhYmxlLAo+ICAJLmdlbV9w
cmltZV92bWFwID0gZHJtX2dlbV9jbWFfcHJpbWVfdm1hcCwKPiAtLSAKPiAyLjIwLjEKPiAKCi0t
IAo9PT09PT09PT09PT09PT09PT09PQp8IEkgd291bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3Js
ZCwgIHwKfCBidXQgdGhleSdyZSBub3QgfAp8IGdpdmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBj
b2RlISAgLwogIC0tLS0tLS0tLS0tLS0tLQogICAgwq9cXyjjg4QpXy/CrwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
