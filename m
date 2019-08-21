Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C73B497DB6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 16:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D726E953;
	Wed, 21 Aug 2019 14:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CA06E953
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 14:55:19 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18215646-1500050 for multiple; Wed, 21 Aug 2019 15:55:10 +0100
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org
References: <20190821123147.110736-1-christian.koenig@amd.com>
 <20190821123147.110736-6-christian.koenig@amd.com>
In-Reply-To: <20190821123147.110736-6-christian.koenig@amd.com>
Message-ID: <156639930822.1374.18129686805314896871@skylake-alporthouse-com>
Subject: Re: [PATCH 05/10] dma-buf/resv: add dma_resv_prune_fences
Date: Wed, 21 Aug 2019 15:55:08 +0100
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

UXVvdGluZyBDaHJpc3RpYW4gS8O2bmlnICgyMDE5LTA4LTIxIDEzOjMxOjQyKQo+IEFkZCBhIG5l
dyBkbWFfcmVzdl9wcnVuZV9mZW5jZXMoKSBmdW5jdGlvbiB0byBpbXByb3ZlIG1lbW9yeSBtYW5h
Z2VtZW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMgICAgICAg
ICAgICAgICAgIHwgMzcgKysrKysrKysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9nZW0vaTkxNV9nZW1fd2FpdC5jICAgfCAgMyArLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9pOTE1X2dlbV9iYXRjaF9wb29sLmMgfCAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X3ZtYS5jICAgICAgICAgICAgfCAgMyArLQo+ICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9i
by5jICAgICAgICAgICAgICAgfCAgMiArLQo+ICBpbmNsdWRlL2xpbnV4L2RtYS1yZXN2LmggICAg
ICAgICAgICAgICAgICAgfCAgMSArCj4gIDYgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1y
ZXN2LmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYwo+IGluZGV4IDQyYThmM2YxMTY4MS4u
MjRhZGMzMmQzNmQ0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jCj4g
KysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMKPiBAQCAtMzAxLDYgKzMwMSw0MyBAQCB2
b2lkIGRtYV9yZXN2X2FkZF9leGNsX2ZlbmNlKHN0cnVjdCBkbWFfcmVzdiAqb2JqLCBzdHJ1Y3Qg
ZG1hX2ZlbmNlICpmZW5jZSkKPiAgfQo+ICBFWFBPUlRfU1lNQk9MKGRtYV9yZXN2X2FkZF9leGNs
X2ZlbmNlKTsKPiAgCj4gKy8qKgo+ICsgKiBkbWFfcmVzdl9wcnVuZV9mZW5jZXMgLSBwcnVuZSBz
aWduYWxlZCBmZW5jZXMgZnJvbSB0aGUgcmVzdiBvYmplY3QKPiArICogQG9iajogdGhlIHJlc2Vy
dmF0aW9uIG9iamVjdCB0byBwcnVuZQo+ICsgKgo+ICsgKiBQcnVuZSBhbGwgc2lnbmFsZWQgZmVu
Y2VzIGZyb20gdGhlIHJlc2VydmF0aW9uIG9iamVjdC4KPiArICovCj4gK3ZvaWQgZG1hX3Jlc3Zf
cHJ1bmVfZmVuY2VzKHN0cnVjdCBkbWFfcmVzdiAqb2JqKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3Qg
ZG1hX3Jlc3ZfbGlzdCAqbGlzdDsKPiArICAgICAgIHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlOwo+
ICsgICAgICAgdW5zaWduZWQgaW50IGk7Cj4gKwo+ICsgICAgICAgZG1hX3Jlc3ZfYXNzZXJ0X2hl
bGQob2JqKTsKPiArCj4gKyAgICAgICBmZW5jZSA9IGRtYV9yZXN2X2dldF9leGNsKG9iaik7Cj4g
KyAgICAgICBpZiAoZG1hX2ZlbmNlX2lzX3NpZ25hbGVkKGZlbmNlKSkgewo+ICsgICAgICAgICAg
ICAgICBSQ1VfSU5JVF9QT0lOVEVSKG9iai0+ZmVuY2VfZXhjbCwgTlVMTCk7Cj4gKyAgICAgICAg
ICAgICAgIGRtYV9mZW5jZV9wdXQoZmVuY2UpOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIGxp
c3QgPSBkbWFfcmVzdl9nZXRfbGlzdChvYmopOwo+ICsgICAgICAgaWYgKCFsaXN0KQo+ICsgICAg
ICAgICAgICAgICByZXR1cm47Cj4gKwo+ICsgICAgICAgZm9yIChpID0gMDsgaSA8IGxpc3QtPnNo
YXJlZF9jb3VudDsgKytpKSB7Cj4gKyAgICAgICAgICAgICAgIGZlbmNlID0gcmN1X2RlcmVmZXJl
bmNlX3Byb3RlY3RlZChsaXN0LT5zaGFyZWRbaV0sCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBkbWFfcmVzdl9oZWxkKG9iaikpOwo+ICsKPiArICAg
ICAgICAgICAgICAgaWYgKCFkbWFfZmVuY2VfaXNfc2lnbmFsZWQoZmVuY2UpKQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICsKPiArICAgICAgICAgICAgICAgUkNVX0lOSVRf
UE9JTlRFUihsaXN0LT5zaGFyZWRbaV0sIGRtYV9mZW5jZV9nZXRfc3R1YigpKTsKPiArICAgICAg
ICAgICAgICAgZG1hX2ZlbmNlX3B1dChmZW5jZSk7CgpOb3Qgd29ydGggcmV1c2luZyB0aGUgY29t
cGFjdGlvbiBsb2dpYyBmcm9tIGFkZF9zaGFyZWRfZmVuY2U/Ci1DaHJpcwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
