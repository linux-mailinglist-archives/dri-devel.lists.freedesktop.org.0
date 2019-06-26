Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B10856F8B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 19:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116BB6E4B0;
	Wed, 26 Jun 2019 17:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C536E4AE;
 Wed, 26 Jun 2019 17:33:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 10:33:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,420,1557212400"; d="scan'208";a="313496368"
Received: from dceraolo-linux.fm.intel.com (HELO [10.1.27.145]) ([10.1.27.145])
 by orsmga004.jf.intel.com with ESMTP; 26 Jun 2019 10:32:59 -0700
Subject: Re: [PATCH] drm: Allow range of 0 for drm_mm_insert_node_in_range()
To: Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org
References: <20190626094330.3556-1-chris@chris-wilson.co.uk>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <698093fd-063d-2de5-9608-47bec6da5b1e@intel.com>
Date: Wed, 26 Jun 2019 10:32:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190626094330.3556-1-chris@chris-wilson.co.uk>
Content-Language: en-US
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA2LzI2LzE5IDI6NDMgQU0sIENocmlzIFdpbHNvbiB3cm90ZToKPiBXZSBncmFjZWZ1bGx5
IGhhbmRsZSB0aGUgY2FsbGVyIHNwZWNpZnlpbmcgYSB6ZXJvIHJhbmdlLCBzbyBkb24ndCBmb3Jj
ZQo+IHRoZW0gdG8gc3BlY2lhbCBjYXNlIHRoYXQgY29uZGl0aW9uIGlmIGl0IG5hdHVyYWxseSBm
YWxscyBvdXQgb2YgdGhlaXIKPiBzZXR1cC4gV2hhdCB3ZSBkb24ndCBjaGVjayBpcyBpZiB0aGUg
ZW5kIDwgc3RhcnQsIHNvIGtlZXAgdGhhdCBhcyBhbgo+IGFzc2VydCBmb3IgYW4gaWxsZWdhbCBj
YWxsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29u
LmNvLnVrPgo+IENjOiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRl
bC5jb20+Cj4gQ2M6IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8gPGRhbmllbGUuY2VyYW9sb3NwdXJp
b0BpbnRlbC5jb20+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+
Cj4gLS0tCgpSZXZpZXdlZC1ieTogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJh
b2xvc3B1cmlvQGludGVsLmNvbT4KCkRhbmllbGUKCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX21t
LmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tbS5jIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9tbS5jCj4gaW5kZXggOWE1OTg2NWNlNTc0Li40NTgxYzUzODczNzIgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9tbS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9tbS5jCj4gQEAgLTQ3Miw3ICs0NzIsNyBAQCBpbnQgZHJtX21tX2luc2VydF9ub2RlX2lu
X3JhbmdlKHN0cnVjdCBkcm1fbW0gKiBjb25zdCBtbSwKPiAgIAl1NjQgcmVtYWluZGVyX21hc2s7
Cj4gICAJYm9vbCBvbmNlOwo+ICAgCj4gLQlEUk1fTU1fQlVHX09OKHJhbmdlX3N0YXJ0ID49IHJh
bmdlX2VuZCk7Cj4gKwlEUk1fTU1fQlVHX09OKHJhbmdlX3N0YXJ0ID4gcmFuZ2VfZW5kKTsKPiAg
IAo+ICAgCWlmICh1bmxpa2VseShzaXplID09IDAgfHwgcmFuZ2VfZW5kIC0gcmFuZ2Vfc3RhcnQg
PCBzaXplKSkKPiAgIAkJcmV0dXJuIC1FTk9TUEM7Cj4gCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
