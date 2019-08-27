Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF9B9E6F5
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 13:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C4489951;
	Tue, 27 Aug 2019 11:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A74B89951
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 11:44:41 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18276809-1500050 for multiple; Tue, 27 Aug 2019 12:44:29 +0100
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org
References: <20190826145731.1725-1-christian.koenig@amd.com>
 <20190826145731.1725-2-christian.koenig@amd.com>
In-Reply-To: <20190826145731.1725-2-christian.koenig@amd.com>
Message-ID: <156690626744.15406.4672497135424922383@skylake-alporthouse-com>
Subject: Re: [PATCH 1/9] dma-buf: fix dma_fence_array_signaled
Date: Tue, 27 Aug 2019 12:44:27 +0100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBDaHJpc3RpYW4gS8O2bmlnICgyMDE5LTA4LTI2IDE1OjU3OjIzKQo+IFRoZSBmdW5j
dGlvbiBpcyBzdXBwb3NlZCB0byBnaXZlIGEgaGludCBldmVuIGlmIHNpZ25hbGluZyBpcyBub3Qg
ZW5hYmxlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtYXJyYXku
YyB8IDEyICsrKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNl
LWFycmF5LmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWFycmF5LmMKPiBpbmRleCBkM2Zi
ZDk1MGJlOTQuLjUyMDY4ZWU1ZWIzNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1h
LWZlbmNlLWFycmF5LmMKPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWFycmF5LmMK
PiBAQCAtMTAzLDggKzEwMywxOCBAQCBzdGF0aWMgYm9vbCBkbWFfZmVuY2VfYXJyYXlfZW5hYmxl
X3NpZ25hbGluZyhzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSkKPiAgc3RhdGljIGJvb2wgZG1hX2Zl
bmNlX2FycmF5X3NpZ25hbGVkKHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlKQo+ICB7Cj4gICAgICAg
ICBzdHJ1Y3QgZG1hX2ZlbmNlX2FycmF5ICphcnJheSA9IHRvX2RtYV9mZW5jZV9hcnJheShmZW5j
ZSk7Cj4gKyAgICAgICBpbnQgaSwgbnVtX3BlbmRpbmc7Cj4gIAo+IC0gICAgICAgcmV0dXJuIGF0
b21pY19yZWFkKCZhcnJheS0+bnVtX3BlbmRpbmcpIDw9IDA7Cj4gKyAgICAgICBudW1fcGVuZGlu
ZyA9IGF0b21pY19yZWFkKCZhcnJheS0+bnVtX3BlbmRpbmcpOwo+ICsgICAgICAgaWYgKHRlc3Rf
Yml0KERNQV9GRU5DRV9GTEFHX0VOQUJMRV9TSUdOQUxfQklULCAmZmVuY2UtPmZsYWdzKSkKPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIG51bV9wZW5kaW5nIDw9IDA7Cj4gKwo+ICsgICAgICAgZm9y
IChpID0gMDsgaSA8IGFycmF5LT5udW1fZmVuY2VzOyArK2kpCj4gKyAgICAgICAgICAgICAgIGlm
IChkbWFfZmVuY2VfaXNfc2lnbmFsZWQoYXJyYXktPmZlbmNlc1tpXSkgJiYKPiArICAgICAgICAg
ICAgICAgICAgIC0tbnVtX3BlbmRpbmcgPT0gMCkKPiArICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gdHJ1ZTsKCm51bV9mZW5jZXMgbWF5IGJlIDAgKGl0J3Mgbm90IHJlamVjdGVkIGluIGNv
bnN0cnVjdGlvbiBhbmQgd29ya3MKY3VycmVudGx5IGFzIGEgc2ltcGxlIGFsd2F5cy1zaWduYWxl
ZCBzdHViKS4KCglpZiAoIXRlc3RfYml0KERNQV9GRU5DRV9GTEFHX0VOQUJMRV9TSUdOQUxfQklU
LCAmZmVuY2UtPmZsYWdzKSkgewoJCWZvciAoaSA9IDA7IGkgPCBhcnJheS0+bnVtX2ZlbmNlczsg
KytpKQoJCQlpZiAoZG1hX2ZlbmNlX2lzX3NpZ25hbGVkKGFycmF5LT5mZW5jZXNbaV0pICYmCgkJ
CSAgICAtLW51bV9wZW5kaW5nID09IDApCgkJCQlicmVhazsKCX0KCglyZXR1cm4gbnVtX3BlbmRp
bmcgPD0gMDsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
