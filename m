Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5394B9BDF2
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2019 15:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA4D6E0C0;
	Sat, 24 Aug 2019 13:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433466E0C0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2019 13:22:41 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18250784-1500050 for multiple; Sat, 24 Aug 2019 14:22:28 +0100
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org
References: <20190821123147.110736-1-christian.koenig@amd.com>
 <20190821123147.110736-9-christian.koenig@amd.com>
In-Reply-To: <20190821123147.110736-9-christian.koenig@amd.com>
Message-ID: <156665294650.4019.8311918110818842888@skylake-alporthouse-com>
Subject: Re: [PATCH 08/10] dma-buf/resv: replace shared fence with new fences
 container
Date: Sat, 24 Aug 2019 14:22:26 +0100
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

UXVvdGluZyBDaHJpc3RpYW4gS8O2bmlnICgyMDE5LTA4LTIxIDEzOjMxOjQ1KQo+IEBAIC01Mjgs
MjAgKzM1Miw5IEBAIHZvaWQgZG1hX3Jlc3ZfcHJ1bmVfZmVuY2VzKHN0cnVjdCBkbWFfcmVzdiAq
b2JqKQo+ICAgICAgICAgICAgICAgICBkbWFfZmVuY2VfcHV0KGZlbmNlKTsKPiAgICAgICAgIH0K
PiAgCj4gLSAgICAgICBsaXN0ID0gZG1hX3Jlc3ZfZ2V0X2xpc3Qob2JqKTsKPiAtICAgICAgIGlm
ICghbGlzdCkKPiAtICAgICAgICAgICAgICAgcmV0dXJuOwo+IC0KPiAtICAgICAgIGZvciAoaSA9
IDA7IGkgPCBsaXN0LT5zaGFyZWRfY291bnQ7ICsraSkgewo+IC0gICAgICAgICAgICAgICBmZW5j
ZSA9IHJjdV9kZXJlZmVyZW5jZV9wcm90ZWN0ZWQobGlzdC0+c2hhcmVkW2ldLAo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZG1hX3Jlc3ZfaGVsZChv
YmopKTsKPiAtCj4gLSAgICAgICAgICAgICAgIGlmICghZG1hX2ZlbmNlX2lzX3NpZ25hbGVkKGZl
bmNlKSkKPiAtICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiAtCj4gLSAgICAgICAg
ICAgICAgIFJDVV9JTklUX1BPSU5URVIobGlzdC0+c2hhcmVkW2ldLCBkbWFfZmVuY2VfZ2V0X3N0
dWIoKSk7Cj4gLSAgICAgICAgICAgICAgIGRtYV9mZW5jZV9wdXQoZmVuY2UpOwo+IC0gICAgICAg
fQo+ICsgICAgICAgZmVuY2UgPSBkbWFfcmVzdl9mZW5jZXNfZGVyZWYob2JqLCAmb2JqLT5yZWFk
ZXJzKTsKPiArICAgICAgIGlmIChkbWFfZmVuY2VfaXNfc2lnbmFsZWQoZmVuY2UpKQo+ICsgICAg
ICAgICAgICAgICBkbWFfcmVzdl9mZW5jZXNfc2V0KG9iaiwgJm9iai0+cmVhZGVycywgTlVMTCk7
CgpTb21ldGhpbmcgdG8gbm90ZSBpcyB0aGF0IGEgZG1hLWZlbmNlLWFycmF5IGlzIG5vdCBhdXRv
bWF0aWNhbGx5CnNpZ25hbGVkIGFuZCBkbWFfZmVuY2VfaXNfc2lnbmFsZWQoKSBkb2VzIG5vdCBj
aGVjayB0aGUgYXJyYXkuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
