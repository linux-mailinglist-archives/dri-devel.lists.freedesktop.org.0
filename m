Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E52F8BA294
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222EB891AF;
	Sun, 22 Sep 2019 12:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A32E891AF;
 Sun, 22 Sep 2019 12:17:40 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18576281-1500050 for multiple; Sun, 22 Sep 2019 13:17:22 +0100
MIME-Version: 1.0
To: Qiang Yu <yuq825@gmail.com>, dri-devel@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190922074900.853-1-yuq825@gmail.com>
References: <20190922074900.853-1-yuq825@gmail.com>
Message-ID: <156915463935.21369.4938801884938429332@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] dma-buf/resv: fix exclusive fence get
Date: Sun, 22 Sep 2019 13:17:19 +0100
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
Cc: linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Qiang Yu <yuq825@gmail.com>, lima@lists.freedesktop.org,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBRaWFuZyBZdSAoMjAxOS0wOS0yMiAwODo0OTowMCkKPiBUaGlzIGNhdXNlcyBrZXJu
ZWwgY3Jhc2ggd2hlbiB0ZXN0aW5nIGxpbWEgZHJpdmVyLgo+IAo+IENjOiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gRml4ZXM6IGI4YzAzNmRmYzY2ZiAoImRt
YS1idWY6IHNpbXBsaWZ5IHJlc2VydmF0aW9uX29iamVjdF9nZXRfZmVuY2VzX3JjdSBhIGJpdCIp
Cj4gU2lnbmVkLW9mZi1ieTogUWlhbmcgWXUgPHl1cTgyNUBnbWFpbC5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVm
L2RtYS1yZXN2LmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYwo+IGluZGV4IDQyYThmM2Yx
MTY4MS4uNzA5MDAyNTE1NTUwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVz
di5jCj4gKysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMKPiBAQCAtNDcxLDcgKzQ3MSw3
IEBAIGludCBkbWFfcmVzdl9nZXRfZmVuY2VzX3JjdShzdHJ1Y3QgZG1hX3Jlc3YgKm9iaiwKPiAg
ICAgICAgIGlmIChwZmVuY2VfZXhjbCkKPiAgICAgICAgICAgICAgICAgKnBmZW5jZV9leGNsID0g
ZmVuY2VfZXhjbDsKPiAgICAgICAgIGVsc2UgaWYgKGZlbmNlX2V4Y2wpCj4gLSAgICAgICAgICAg
ICAgIHNoYXJlZFsrK3NoYXJlZF9jb3VudF0gPSBmZW5jZV9leGNsOwo+ICsgICAgICAgICAgICAg
ICBzaGFyZWRbc2hhcmVkX2NvdW50KytdID0gZmVuY2VfZXhjbDsKCk9vcHMuCgpSZXZpZXdlZC1i
eTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci1DaHJpcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
