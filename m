Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5653EBA2B7
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16AEE6E176;
	Sun, 22 Sep 2019 12:50:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A146E146;
 Sun, 22 Sep 2019 12:50:30 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18576431-1500050 for multiple; Sun, 22 Sep 2019 13:50:19 +0100
MIME-Version: 1.0
To: Qiang Yu <yuq825@gmail.com>, dri-devel@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <156915463935.21369.4938801884938429332@skylake-alporthouse-com>
References: <20190922074900.853-1-yuq825@gmail.com>
 <156915463935.21369.4938801884938429332@skylake-alporthouse-com>
Message-ID: <156915661567.21369.17366014102480171128@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] dma-buf/resv: fix exclusive fence get
Date: Sun, 22 Sep 2019 13:50:15 +0100
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

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMDktMjIgMTM6MTc6MTkpCj4gUXVvdGluZyBRaWFu
ZyBZdSAoMjAxOS0wOS0yMiAwODo0OTowMCkKPiA+IFRoaXMgY2F1c2VzIGtlcm5lbCBjcmFzaCB3
aGVuIHRlc3RpbmcgbGltYSBkcml2ZXIuCj4gPiAKPiA+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gPiBGaXhlczogYjhjMDM2ZGZjNjZmICgiZG1hLWJ1
Zjogc2ltcGxpZnkgcmVzZXJ2YXRpb25fb2JqZWN0X2dldF9mZW5jZXNfcmN1IGEgYml0IikKPiA+
IFNpZ25lZC1vZmYtYnk6IFFpYW5nIFl1IDx5dXE4MjVAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAg
ZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2RtYS1idWYvZG1hLXJlc3YuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jCj4gPiBpbmRl
eCA0MmE4ZjNmMTE2ODEuLjcwOTAwMjUxNTU1MCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZG1h
LWJ1Zi9kbWEtcmVzdi5jCj4gPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYwo+ID4g
QEAgLTQ3MSw3ICs0NzEsNyBAQCBpbnQgZG1hX3Jlc3ZfZ2V0X2ZlbmNlc19yY3Uoc3RydWN0IGRt
YV9yZXN2ICpvYmosCj4gPiAgICAgICAgIGlmIChwZmVuY2VfZXhjbCkKPiA+ICAgICAgICAgICAg
ICAgICAqcGZlbmNlX2V4Y2wgPSBmZW5jZV9leGNsOwo+ID4gICAgICAgICBlbHNlIGlmIChmZW5j
ZV9leGNsKQo+ID4gLSAgICAgICAgICAgICAgIHNoYXJlZFsrK3NoYXJlZF9jb3VudF0gPSBmZW5j
ZV9leGNsOwo+ID4gKyAgICAgICAgICAgICAgIHNoYXJlZFtzaGFyZWRfY291bnQrK10gPSBmZW5j
ZV9leGNsOwo+IAo+IE9vcHMuCj4gCj4gUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNA
Y2hyaXMtd2lsc29uLmNvLnVrPgoKQXBwbGllZCwgdGhhbmtzIGZvciB0aGUgZml4LgotQ2hyaXMK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
