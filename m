Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33768EC888
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 19:33:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216396F851;
	Fri,  1 Nov 2019 18:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DDCC6F851
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 18:33:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Nov 2019 11:33:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,256,1569308400"; d="scan'208";a="352026410"
Received: from cepartan-mobl3.ger.corp.intel.com (HELO [10.249.40.248])
 ([10.249.40.248])
 by orsmga004.jf.intel.com with ESMTP; 01 Nov 2019 11:33:12 -0700
Subject: Re: [PATCH 2/2] drm/atomic: clear new_state pointers at hw_done
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20191101180713.5470-1-robdclark@gmail.com>
 <20191101180713.5470-2-robdclark@gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <ec3c1d7b-231a-862f-ce12-8ac4c9616ca5@linux.intel.com>
Date: Fri, 1 Nov 2019 19:33:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191101180713.5470-2-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3AgMDEtMTEtMjAxOSBvbSAxOTowNyBzY2hyZWVmIFJvYiBDbGFyazoKPiBGcm9tOiBSb2IgQ2xh
cmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4KPiBUaGUgbmV3IHN0YXRlIHNob3VsZCBub3Qg
YmUgYWNjZXNzZWQgYWZ0ZXIgdGhpcyBwb2ludC4gIENsZWFyIHRoZQo+IHBvaW50ZXJzIHRvIG1h
a2UgdGhhdCBleHBsaWNpdC4KPgo+IFRoaXMgbWFrZXMgdGhlIGVycm9yIGNvcnJlY3RlZCBpbiB0
aGUgcHJldmlvdXMgcGF0Y2ggbW9yZSBvYnZpb3VzLgo+Cj4gU2lnbmVkLW9mZi1ieTogUm9iIENs
YXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKV291bGQgYmUgbmljZSBpZiB5b3UgY291bGQg
Y2MgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyBuZXh0IHRpbWUsIHNvIEkga25vdyBv
dXIgQ0kgaW5mcmFzdHJ1Y3R1cmUgaXMgaGFwcHk7CgpJdCB3b3VsZG4ndCBzdXJwcmlzZSBtZSBp
ZiBpdCBjYXRjaGVzIDEgb3IgMiBhYnVzZXMgaW4gaTkxNS4KCk90aGVyd2lzZSBSZXZpZXdlZC1i
eTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4K
ClBlcmhhcHMgeW91IGNvdWxkIG1haWwgdGhpcyB0byB2ZXJzaW9uIHRvIGludGVsLWdmeC10cnli
b3RAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIHVzaW5nIGdpdC1zZW5kLWVtYWlsIHNvIHdlIGF0IGxl
YXN0IGdldCBpOTE1IHJlc3VsdHM/Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21p
Y19oZWxwZXIuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV9hdG9taWNfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIu
Ywo+IGluZGV4IDczMmJkMGNlOTI0MS4uMTc2ODMxZGY4MTYzIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9hdG9taWNfaGVscGVyLmMKPiBAQCAtMjIzNCwxMyArMjIzNCw0MiBAQCBFWFBPUlRfU1lNQk9M
KGRybV9hdG9taWNfaGVscGVyX2Zha2VfdmJsYW5rKTsKPiAgICovCj4gIHZvaWQgZHJtX2F0b21p
Y19oZWxwZXJfY29tbWl0X2h3X2RvbmUoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKm9sZF9zdGF0
ZSkKPiAgewo+ICsJc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcjsKPiArCXN0cnVjdCBk
cm1fY29ubmVjdG9yX3N0YXRlICpvbGRfY29ubl9zdGF0ZSwgKm5ld19jb25uX3N0YXRlOwo+ICAJ
c3RydWN0IGRybV9jcnRjICpjcnRjOwo+ICAJc3RydWN0IGRybV9jcnRjX3N0YXRlICpvbGRfY3J0
Y19zdGF0ZSwgKm5ld19jcnRjX3N0YXRlOwo+ICsJc3RydWN0IGRybV9wbGFuZSAqcGxhbmU7Cj4g
KwlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpvbGRfcGxhbmVfc3RhdGUsICpuZXdfcGxhbmVfc3Rh
dGU7Cj4gIAlzdHJ1Y3QgZHJtX2NydGNfY29tbWl0ICpjb21taXQ7Cj4gKwlzdHJ1Y3QgZHJtX3By
aXZhdGVfb2JqICpvYmo7Cj4gKwlzdHJ1Y3QgZHJtX3ByaXZhdGVfc3RhdGUgKm9sZF9vYmpfc3Rh
dGUsICpuZXdfb2JqX3N0YXRlOwo+ICAJaW50IGk7Cj4gIAo+ICsJLyoKPiArCSAqIEFmdGVyIHRo
aXMgcG9pbnQsIGRyaXZlcnMgc2hvdWxkIG5vdCBhY2Nlc3MgdGhlIHBlcm1hbmVudCBtb2Rlc2V0
Cj4gKwkgKiBzdGF0ZSwgc28gd2UgYWxzbyBjbGVhciB0aGUgbmV3X3N0YXRlIHBvaW50ZXJzIHRv
IG1ha2UgdGhpcwo+ICsJICogcmVzdHJpY3Rpb24gZXhwbGljaXQuCj4gKwkgKgo+ICsJICogRm9y
IHRoZSBDUlRDIHN0YXRlLCB3ZSBkbyB0aGlzIGluIHRoZSBzYW1lIGxvb3Agd2hlcmUgd2Ugc2ln
bmFsCj4gKwkgKiBod19kb25lLCBzaW5jZSB3ZSBzdGlsbCBuZWVkIHRvIG5ld19jcnRjX3N0YXRl
IHRvIGZpc2ggb3V0IHRoZQo+ICsJICogY29tbWl0Lgo+ICsJICovCj4gKwo+ICsJZm9yX2VhY2hf
b2xkbmV3X2Nvbm5lY3Rvcl9pbl9zdGF0ZShvbGRfc3RhdGUsIGNvbm5lY3Rvciwgb2xkX2Nvbm5f
c3RhdGUsIG5ld19jb25uX3N0YXRlLCBpKSB7Cj4gKwkJb2xkX3N0YXRlLT5jb25uZWN0b3JzW2ld
Lm5ld19zdGF0ZSA9IE5VTEw7Cj4gKwl9Cj4gKwo+ICsJZm9yX2VhY2hfb2xkbmV3X3BsYW5lX2lu
X3N0YXRlKG9sZF9zdGF0ZSwgcGxhbmUsIG9sZF9wbGFuZV9zdGF0ZSwgbmV3X3BsYW5lX3N0YXRl
LCBpKSB7Cj4gKwkJb2xkX3N0YXRlLT5wbGFuZXNbaV0ubmV3X3N0YXRlID0gTlVMTDsKPiArCX0K
PiArCj4gKwlmb3JfZWFjaF9vbGRuZXdfcHJpdmF0ZV9vYmpfaW5fc3RhdGUob2xkX3N0YXRlLCBv
YmosIG9sZF9vYmpfc3RhdGUsIG5ld19vYmpfc3RhdGUsIGkpIHsKPiArCQlvbGRfc3RhdGUtPnBy
aXZhdGVfb2Jqc1tpXS5uZXdfc3RhdGUgPSBOVUxMOwo+ICsJfQo+ICsKPiAgCWZvcl9lYWNoX29s
ZG5ld19jcnRjX2luX3N0YXRlKG9sZF9zdGF0ZSwgY3J0Yywgb2xkX2NydGNfc3RhdGUsIG5ld19j
cnRjX3N0YXRlLCBpKSB7Cj4gIAkJb2xkX3N0YXRlLT5jcnRjc1tpXS5uZXdfc2VsZl9yZWZyZXNo
X2FjdGl2ZSA9IG5ld19jcnRjX3N0YXRlLT5zZWxmX3JlZnJlc2hfYWN0aXZlOwo+ICsJCW9sZF9z
dGF0ZS0+Y3J0Y3NbaV0ubmV3X3N0YXRlID0gTlVMTDsKPiAgCj4gIAkJY29tbWl0ID0gbmV3X2Ny
dGNfc3RhdGUtPmNvbW1pdDsKPiAgCQlpZiAoIWNvbW1pdCkKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
