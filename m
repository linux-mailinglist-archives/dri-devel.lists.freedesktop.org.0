Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F60F98160
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 19:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0436E382;
	Wed, 21 Aug 2019 17:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2006E382
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 17:35:46 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18217793-1500050 for multiple; Wed, 21 Aug 2019 18:35:33 +0100
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org
References: <20190821123147.110736-1-christian.koenig@amd.com>
 <20190821123147.110736-9-christian.koenig@amd.com>
 <156640106246.20466.15153611256655352471@skylake-alporthouse-com>
In-Reply-To: <156640106246.20466.15153611256655352471@skylake-alporthouse-com>
Message-ID: <156640893097.20466.17027932311642169386@skylake-alporthouse-com>
Subject: Re: [PATCH 08/10] dma-buf/resv: replace shared fence with new fences
 container
Date: Wed, 21 Aug 2019 18:35:31 +0100
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

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMDgtMjEgMTY6MjQ6MjIpCj4gUXVvdGluZyBDaHJp
c3RpYW4gS8O2bmlnICgyMDE5LTA4LTIxIDEzOjMxOjQ1KQo+ID4gQEAgLTExNywxNyArMTIwLDEw
IEBAIGk5MTVfZ2VtX2J1c3lfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0
YSwKPiA+ICAgICAgICAgICAgICAgICBidXN5X2NoZWNrX3dyaXRlcihyY3VfZGVyZWZlcmVuY2Uo
b2JqLT5iYXNlLnJlc3YtPmZlbmNlX2V4Y2wpKTsKPiA+ICAKPiA+ICAgICAgICAgLyogVHJhbnNs
YXRlIHNoYXJlZCBmZW5jZXMgdG8gUkVBRCBzZXQgb2YgZW5naW5lcyAqLwo+ID4gLSAgICAgICBs
aXN0ID0gcmN1X2RlcmVmZXJlbmNlKG9iai0+YmFzZS5yZXN2LT5mZW5jZSk7Cj4gPiAtICAgICAg
IGlmIChsaXN0KSB7Cj4gPiAtICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHNoYXJlZF9jb3Vu
dCA9IGxpc3QtPnNoYXJlZF9jb3VudCwgaTsKPiA+IC0KPiA+IC0gICAgICAgICAgICAgICBmb3Ig
KGkgPSAwOyBpIDwgc2hhcmVkX2NvdW50OyArK2kpIHsKPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlID0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcmN1X2RlcmVmZXJlbmNlKGxpc3QtPnNoYXJlZFtpXSk7Cj4gPiAtCj4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICBhcmdzLT5idXN5IHw9IGJ1c3lfY2hlY2tfcmVhZGVyKGZlbmNl
KTsKPiA+IC0gICAgICAgICAgICAgICB9Cj4gPiAtICAgICAgIH0KPiA+ICsgICAgICAgcmVhZGVy
cyA9IGRtYV9yZXN2X2ZlbmNlc19nZXRfcmN1KCZvYmotPmJhc2UucmVzdi0+cmVhZGVycyk7Cj4g
PiArICAgICAgIGRtYV9mZW5jZV9hcnJheV9mb3JfZWFjaChmZW5jZSwgY3Vyc29yLCByZWFkZXJz
KQo+ID4gKyAgICAgICAgICAgICAgIGFyZ3MtPmJ1c3kgfD0gYnVzeV9jaGVja19yZWFkZXIoZmVu
Y2UpOwo+ID4gKyAgICAgICBkbWFfZmVuY2VfcHV0KHJlYWRlcnMpOwo+IAo+IFRoYXQncyB1bmRl
cndoZWxtaW5nLCB0aGUgZnVsbC1tYiBzaG93cyB1cCBpbiBzY2FsaW5nIHRlc3RzIChJJ2xsIHRl
c3QKPiB0aGUgaW1wYWN0IG9mIHRoaXMgc2VyaWVzIGxhdGVyKS4gU29tZXRoaW5nIGxpa2UsCgpU
byBwdXQgc29tZSBudW1iZXJzIHRvIGl0LCBhZGRpbmcgdGhlIGZ1bGwtbWIgYWRkcyA1bnMgdG8g
YSBzaW5nbGUKdGhyZWFkIG9uIEthYnlsYWtlIGFuZCAyMG5zIHVuZGVyIGNvbnRlbnRpb24uCi1D
aHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
