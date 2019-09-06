Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3422AB202
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 07:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B0B6E13C;
	Fri,  6 Sep 2019 05:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A246E13C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 05:18:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F100F18C891C;
 Fri,  6 Sep 2019 05:18:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14E1D60872;
 Fri,  6 Sep 2019 05:18:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 42172753F; Fri,  6 Sep 2019 07:18:47 +0200 (CEST)
Date: Fri, 6 Sep 2019 07:18:47 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: David Riley <davidriley@chromium.org>
Subject: Re: [PATCH v2] drm/virtio: Use vmalloc for command buffer allocations.
Message-ID: <20190906051847.75mj4772nqwdper6@sirius.home.kraxel.org>
References: <20190829212417.257397-1-davidriley@chromium.org>
 <20190905220008.75488-1-davidriley@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190905220008.75488-1-davidriley@chromium.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Fri, 06 Sep 2019 05:18:50 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiArLyogSG93IG1hbnkgYnl0ZXMgbGVmdCBpbiB0aGlzIHBhZ2UuICovCj4gK3N0YXRpYyB1bnNp
Z25lZCBpbnQgcmVzdF9vZl9wYWdlKHZvaWQgKmRhdGEpCj4gK3sKPiArCXJldHVybiBQQUdFX1NJ
WkUgLSBvZmZzZXRfaW5fcGFnZShkYXRhKTsKPiArfQoKTm90IG5lZWRlZC4KCj4gKy8qIENyZWF0
ZSBzZ190YWJsZSBmcm9tIGEgdm1hbGxvYydkIGJ1ZmZlci4gKi8KPiArc3RhdGljIHN0cnVjdCBz
Z190YWJsZSAqdm1hbGxvY190b19zZ3QoY2hhciAqZGF0YSwgdWludDMyX3Qgc2l6ZSwgaW50ICpz
Z19lbnRzKQo+ICt7Cj4gKwlpbnQgbmVudHMsIHJldCwgcywgaTsKPiArCXN0cnVjdCBzZ190YWJs
ZSAqc2d0Owo+ICsJc3RydWN0IHNjYXR0ZXJsaXN0ICpzZzsKPiArCXN0cnVjdCBwYWdlICpwZzsK
PiArCj4gKwkqc2dfZW50cyA9IDA7Cj4gKwo+ICsJc2d0ID0ga21hbGxvYyhzaXplb2YoKnNndCks
IEdGUF9LRVJORUwpOwo+ICsJaWYgKCFzZ3QpCj4gKwkJcmV0dXJuIE5VTEw7Cj4gKwo+ICsJbmVu
dHMgPSBESVZfUk9VTkRfVVAoc2l6ZSwgUEFHRV9TSVpFKSArIDE7CgpXaHkgKzE/Cgo+ICsJcmV0
ID0gc2dfYWxsb2NfdGFibGUoc2d0LCBuZW50cywgR0ZQX0tFUk5FTCk7Cj4gKwlpZiAocmV0KSB7
Cj4gKwkJa2ZyZWUoc2d0KTsKPiArCQlyZXR1cm4gTlVMTDsKPiArCX0KPiArCj4gKwlmb3JfZWFj
aF9zZyhzZ3QtPnNnbCwgc2csIG5lbnRzLCBpKSB7Cj4gKwkJcGcgPSB2bWFsbG9jX3RvX3BhZ2Uo
ZGF0YSk7Cj4gKwkJaWYgKCFwZykgewo+ICsJCQlzZ19mcmVlX3RhYmxlKHNndCk7Cj4gKwkJCWtm
cmVlKHNndCk7Cj4gKwkJCXJldHVybiBOVUxMOwo+ICsJCX0KPiArCj4gKwkJcyA9IHJlc3Rfb2Zf
cGFnZShkYXRhKTsKPiArCQlpZiAocyA+IHNpemUpCj4gKwkJCXMgPSBzaXplOwoKdm1hbGxvYyBt
ZW1vcnkgaXMgcGFnZSBhbGlnbmVkLCBzbzoKCgkJcyA9IG1pbihQQUdFX1NJWkUsIHNpemUpOwoK
PiArCQlzZ19zZXRfcGFnZShzZywgcGcsIHMsIG9mZnNldF9pbl9wYWdlKGRhdGEpKTsKCk9mZnNl
dCBpcyBhbHdheXMgemVyby4KCj4gKwo+ICsJCXNpemUgLT0gczsKPiArCQlkYXRhICs9IHM7Cj4g
KwkJKnNnX2VudHMgKz0gMTsKCnNnX2VudHMgaXNuJ3QgdXNlZCBhbnl3aGVyZS4KCj4gKwo+ICsJ
CWlmIChzaXplKSB7Cj4gKwkJCXNnX3VubWFya19lbmQoc2cpOwo+ICsJCX0gZWxzZSB7Cj4gKwkJ
CXNnX21hcmtfZW5kKHNnKTsKPiArCQkJYnJlYWs7Cj4gKwkJfQoKVGhhdCBsb29rcyBhIGJpdCBz
dHJhbmdlLiAgSSBndWVzcyB5b3UgbmVlZCBvbmx5IG9uZSBvZiB0aGUgdHdvIGJlY2F1c2UKdGhl
IG90aGVyIGlzIHRoZSBkZWZhdWx0PwoKPiAgc3RhdGljIGludCB2aXJ0aW9fZ3B1X3F1ZXVlX2Zl
bmNlZF9jdHJsX2J1ZmZlcihzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnZnZGV2LAo+ICAJCQkJ
CSAgICAgICBzdHJ1Y3QgdmlydGlvX2dwdV92YnVmZmVyICp2YnVmLAo+ICAJCQkJCSAgICAgICBz
dHJ1Y3QgdmlydGlvX2dwdV9jdHJsX2hkciAqaGRyLAo+ICAJCQkJCSAgICAgICBzdHJ1Y3Qgdmly
dGlvX2dwdV9mZW5jZSAqZmVuY2UpCj4gIHsKPiAgCXN0cnVjdCB2aXJ0cXVldWUgKnZxID0gdmdk
ZXYtPmN0cmxxLnZxOwo+ICsJc3RydWN0IHNjYXR0ZXJsaXN0ICp2b3V0ID0gTlVMTCwgc2c7Cj4g
KwlzdHJ1Y3Qgc2dfdGFibGUgKnNndCA9IE5VTEw7Cj4gIAlpbnQgcmM7Cj4gKwlpbnQgb3V0Y250
ID0gMDsKPiArCj4gKwlpZiAodmJ1Zi0+ZGF0YV9zaXplKSB7Cj4gKwkJaWYgKGlzX3ZtYWxsb2Nf
YWRkcih2YnVmLT5kYXRhX2J1ZikpIHsKPiArCQkJc2d0ID0gdm1hbGxvY190b19zZ3QodmJ1Zi0+
ZGF0YV9idWYsIHZidWYtPmRhdGFfc2l6ZSwKPiArCQkJCQkgICAgICZvdXRjbnQpOwo+ICsJCQlp
ZiAoIXNndCkKPiArCQkJCXJldHVybiAtRU5PTUVNOwo+ICsJCQl2b3V0ID0gc2d0LT5zZ2w7Cj4g
KwkJfSBlbHNlIHsKPiArCQkJc2dfaW5pdF9vbmUoJnNnLCB2YnVmLT5kYXRhX2J1ZiwgdmJ1Zi0+
ZGF0YV9zaXplKTsKPiArCQkJdm91dCA9ICZzZzsKPiArCQkJb3V0Y250ID0gMTsKCm91dGNudCBt
dXN0IGJlIHNldCBpbiBib3RoIGNhc2VzLgoKPiArc3RhdGljIGludCB2aXJ0aW9fZ3B1X3F1ZXVl
X2N0cmxfYnVmZmVyKHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYsCj4gKwkJCQkJc3Ry
dWN0IHZpcnRpb19ncHVfdmJ1ZmZlciAqdmJ1ZikKPiArewo+ICsJcmV0dXJuIHZpcnRpb19ncHVf
cXVldWVfZmVuY2VkX2N0cmxfYnVmZmVyKHZnZGV2LCB2YnVmLCBOVUxMLCBOVUxMKTsKPiArfQoK
Q2hhbmdpbmcgdmlydGlvX2dwdV9xdWV1ZV9jdHJsX2J1ZmZlciB0byBjYWxsCnZpcnRpb19ncHVf
cXVldWVfZmVuY2VkX2N0cmxfYnVmZmVyIHNob3VsZCBiZSBkb25lIGluIGEgc2VwYXJhdGUgcGF0
Y2guCgpjaGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
