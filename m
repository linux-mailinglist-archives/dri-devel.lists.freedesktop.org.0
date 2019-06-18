Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2924A1DB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 15:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4BC6E172;
	Tue, 18 Jun 2019 13:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6AC6E167;
 Tue, 18 Jun 2019 13:16:40 +0000 (UTC)
Received: from dragon (li1322-146.members.linode.com [45.79.223.146])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8690C2070B;
 Tue, 18 Jun 2019 13:16:37 +0000 (UTC)
Date: Tue, 18 Jun 2019 21:15:46 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 39/59] drm/zte: Drop drm_gem_prime_export/import
Message-ID: <20190618131544.GD1959@dragon>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-40-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614203615.12639-40-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560863800;
 bh=GS9O2zc8BEOFIPAajrGcCEKc+zG8V3VSzXcJXMeCVSc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zmor9D96DESyemkWHBecUWcmIAoVPErv1VaBNXRNYKpgwfFtMnpJJWrzYedkTbOQd
 UfoBuLyM6MtiEs5737xLEtTajyxJIGvqaA9VDrNlDZbFB4mKOXL8cBUlUc0HV+EuDr
 b/JSXMsqAKBCZpYYXo39d7pVi0mmZBWvbqfOeKiI=
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
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMTA6MzU6NTVQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBUaGV5J3JlIHRoZSBkZWZhdWx0Lgo+IAo+IEFzaWRlOiBXb3VsZCBiZSByZWFsbHkg
bmljZSB0byBzd2l0Y2ggdGhlIG90aGVycyBvdmVyIHRvCj4gZHJtX2dlbV9vYmplY3RfZnVuY3Mu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5j
b20+Cj4gQ2M6IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz4KCkFja2VkLWJ5OiBTaGF3
biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0venRl
L3p4X2RybV9kcnYuYyB8IDIgLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS96dGUvenhfZHJtX2Rydi5jIGIvZHJpdmVy
cy9ncHUvZHJtL3p0ZS96eF9kcm1fZHJ2LmMKPiBpbmRleCAwNjBhZDUyNjZiYzcuLmVmMDE5Y2Fk
N2U4MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0venRlL3p4X2RybV9kcnYuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS96dGUvenhfZHJtX2Rydi5jCj4gQEAgLTQ0LDggKzQ0LDYgQEAg
c3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIHp4X2RybV9kcml2ZXIgPSB7Cj4gIAkuZHVtYl9jcmVh
dGUgPSBkcm1fZ2VtX2NtYV9kdW1iX2NyZWF0ZSwKPiAgCS5wcmltZV9oYW5kbGVfdG9fZmQgPSBk
cm1fZ2VtX3ByaW1lX2hhbmRsZV90b19mZCwKPiAgCS5wcmltZV9mZF90b19oYW5kbGUgPSBkcm1f
Z2VtX3ByaW1lX2ZkX3RvX2hhbmRsZSwKPiAtCS5nZW1fcHJpbWVfZXhwb3J0ID0gZHJtX2dlbV9w
cmltZV9leHBvcnQsCj4gLQkuZ2VtX3ByaW1lX2ltcG9ydCA9IGRybV9nZW1fcHJpbWVfaW1wb3J0
LAo+ICAJLmdlbV9wcmltZV9nZXRfc2dfdGFibGUgPSBkcm1fZ2VtX2NtYV9wcmltZV9nZXRfc2df
dGFibGUsCj4gIAkuZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZSA9IGRybV9nZW1fY21hX3ByaW1l
X2ltcG9ydF9zZ190YWJsZSwKPiAgCS5nZW1fcHJpbWVfdm1hcCA9IGRybV9nZW1fY21hX3ByaW1l
X3ZtYXAsCj4gLS0gCj4gMi4yMC4xCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
