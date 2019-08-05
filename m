Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FB782145
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 18:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09ACA6E4E1;
	Mon,  5 Aug 2019 16:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 950566E4CB;
 Mon,  5 Aug 2019 16:07:50 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17894862-1500050 for multiple; Mon, 05 Aug 2019 17:07:43 +0100
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
References: <20190805154554.3476-1-christian.koenig@amd.com>
 <20190805154554.3476-5-christian.koenig@amd.com>
In-Reply-To: <20190805154554.3476-5-christian.koenig@amd.com>
Message-ID: <156502126144.28464.11399426968315988701@skylake-alporthouse-com>
Subject: Re: [PATCH 5/5] dma-buf: nuke reservation_object seq number
Date: Mon, 05 Aug 2019 17:07:41 +0100
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

UXVvdGluZyBDaHJpc3RpYW4gS8O2bmlnICgyMDE5LTA4LTA1IDE2OjQ1OjU0KQo+IEBAIC0yMTQs
MTYgKzIxNCwxNiBAQCBzdGF0aWMgX19wb2xsX3QgZG1hX2J1Zl9wb2xsKHN0cnVjdCBmaWxlICpm
aWxlLCBwb2xsX3RhYmxlICpwb2xsKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgCj4g
IHJldHJ5Ogo+IC0gICAgICAgc2VxID0gcmVhZF9zZXFjb3VudF9iZWdpbigmcmVzdi0+c2VxKTsK
PiAgICAgICAgIHJjdV9yZWFkX2xvY2soKTsKPiAgCj4gKyAgICAgICBmZW5jZV9leGNsID0gcmN1
X2RlcmVmZXJlbmNlKHJlc3YtPmZlbmNlX2V4Y2wpOwo+ICAgICAgICAgZm9iaiA9IHJjdV9kZXJl
ZmVyZW5jZShyZXN2LT5mZW5jZSk7Cj4gICAgICAgICBpZiAoZm9iaikKPiAgICAgICAgICAgICAg
ICAgc2hhcmVkX2NvdW50ID0gZm9iai0+c2hhcmVkX2NvdW50Owo+ICAgICAgICAgZWxzZQo+ICAg
ICAgICAgICAgICAgICBzaGFyZWRfY291bnQgPSAwOwo+IC0gICAgICAgZmVuY2VfZXhjbCA9IHJj
dV9kZXJlZmVyZW5jZShyZXN2LT5mZW5jZV9leGNsKTsKPiAtICAgICAgIGlmIChyZWFkX3NlcWNv
dW50X3JldHJ5KCZyZXN2LT5zZXEsIHNlcSkpIHsKPiArCj4gKyAgICAgICBpZiAocmN1X2RlcmVm
ZXJlbmNlKHJlc3YtPmZlbmNlX2V4Y2wpICE9IGZlbmNlX2V4Y2wpIHsKCklmIEkgcmVtZW1iZXIg
bXkgcnVsZXMgY29ycmVjdGx5LCByY3VfZGVyZWZlcmVuY2UgaXMgYQpyZWFkLWRhdGEtZGVwZW5k
cywgd2hpY2ggb25seSBtZWFucyB0aGF0IGEgcmVhZCB0aHJvdWdoIHRoZSBwb2ludGVyCnJldHVy
bmVkIGJ5IHJjdV9kZXJlZmVyZW5jZSgpIGlzIGFmdGVyIHRoZSByZXRyaWV2YWwgb2YgdGhhdCBw
b2ludGVyLgpOb3RoaW5nIG9yZGVycyB0aGUgcmV0cmlldmFsIG9mIGZlbmNlX2V4Y2wgdnMgc2hh
cmVkX2NvdW50IChkaWZmZXJlbnQKcG9pbnRlcnMpLCBzbyBJIHRoaW5rIHRoZSBsYXN0IGxpbmUg
c2hvdWxkIGJlOgoKc21wX3JtYigpOwppZiAocmN1X2FjY2Vzc19wb2ludGVyKHJlc3YtPmZlbmNl
X2V4Y2wpICE9IGZlbmNlX2V4Y2wpCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
