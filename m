Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 707FFD470A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 19:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7F26E0BA;
	Fri, 11 Oct 2019 17:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC036E0BA;
 Fri, 11 Oct 2019 17:58:17 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Oct 2019 10:58:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,284,1566889200"; d="scan'208";a="206520698"
Received: from ldmartin-desk1.jf.intel.com (HELO ldmartin-desk1)
 ([10.24.11.83])
 by orsmga002.jf.intel.com with ESMTP; 11 Oct 2019 10:58:16 -0700
Date: Fri, 11 Oct 2019 10:58:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 7/7] drm/dp-mst: fix warning on unused var
Message-ID: <20191011175813.li3euayx4byhv72m@ldmartin-desk1>
References: <20191011010907.103309-1-lucas.demarchi@intel.com>
 <20191011010907.103309-8-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011010907.103309-8-lucas.demarchi@intel.com>
User-Agent: NeoMutt/20180716
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

K2RyaSwgK0RhbmllbAoKT24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDY6MDk6MDdQTSAtMDcwMCwg
THVjYXMgRGUgTWFyY2hpIHdyb3RlOgo+Rml4ZXM6IDgzZmE5ODQyYWZlNyAoImRybS9kcC1tc3Q6
IERyb3AgY29ubmVjdGlvbl9tdXRleCBjaGVjayIpCj5TaWduZWQtb2ZmLWJ5OiBMdWNhcyBEZSBN
YXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4KPi0tLQo+IGRyaXZlcnMvZ3B1L2RybS9k
cm1fZHBfbXN0X3RvcG9sb2d5LmMgfCAyIC0tCj4gMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25z
KC0pCj4KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+aW5kZXggOTM2NGU0ZjQy
OTc1Li45Y2NjYzVlNjMzMDkgMTAwNjQ0Cj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5j
Cj5AQCAtNDE4NCw4ICs0MTg0LDYgQEAgRVhQT1JUX1NZTUJPTChkcm1fZHBfbXN0X3RvcG9sb2d5
X3N0YXRlX2Z1bmNzKTsKPiBzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9zdGF0ZSAqZHJtX2F0
b21pY19nZXRfbXN0X3RvcG9sb2d5X3N0YXRlKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0
ZSwKPiAJCQkJCQkJCSAgICBzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1ncikKPiB7
Cj4tCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBtZ3ItPmRldjsKPi0KPiAJcmV0dXJuIHRvX2Rw
X21zdF90b3BvbG9neV9zdGF0ZShkcm1fYXRvbWljX2dldF9wcml2YXRlX29ial9zdGF0ZShzdGF0
ZSwgJm1nci0+YmFzZSkpOwo+IH0KPiBFWFBPUlRfU1lNQk9MKGRybV9hdG9taWNfZ2V0X21zdF90
b3BvbG9neV9zdGF0ZSk7Cj4tLSAKPjIuMjMuMAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
