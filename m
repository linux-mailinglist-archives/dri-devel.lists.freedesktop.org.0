Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E801CA67
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 16:30:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0390E892EF;
	Tue, 14 May 2019 14:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0AB892E7;
 Tue, 14 May 2019 14:29:57 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:49211
 helo=[192.168.10.178])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hQYRH-0004V2-Ug; Tue, 14 May 2019 16:29:55 +0200
Subject: Re: [PATCH v5 00/11] drm/fb-helper: Move modesetting code to
 drm_client
To: dri-devel@lists.freedesktop.org
References: <20190506180139.6913-1-noralf@tronnes.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <fb656ffe-ae1e-104a-4e25-40e9832dcd70@tronnes.org>
Date: Tue, 14 May 2019 16:29:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190506180139.6913-1-noralf@tronnes.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=GL3gixPcpOnHpbEpYgk0UvoJk0m9J8JW3tc0GTpHOrw=; 
 b=dOh69QAQhrP2Ck5J4AnwOmpnSjEUJUHJvLWnMpra6MOc3p6OxRiibQAXQ18fXblXFSVPVu6+DlMTzENyfDPgn+1sdDr5gsgRAHrm5zB2+eKm8XFv0OLnyQOPZcLKMMIh5pmrjjNDr/SthrVV2cUSDjL5gAcEYPXYM/enk2G0bqQFe+mV56jkWLK4PZ19cSg9rtiF3LjxiJd11Q/nPGb6s5SlcgeXdU219IXtBd1HYRBK5gAov7dgjU22pfz2eGERXAgtc5WZJfSfSimm7Yz471MIDupbc3w0PY1XzxiBUvFiXgs2wsDw8A5DFEYFeVd3I1m75Sar6MVlso1mWTVYag==;
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMDYuMDUuMjAxOSAyMC4wMSwgc2tyZXYgTm9yYWxmIFRyw7hubmVzOgo+IFRoaXMgbW92
ZXMgdGhlIG1vZGVzZXR0aW5nIGNvZGUgZnJvbSBkcm1fZmJfaGVscGVyIHRvIGRybV9jbGllbnQg
c28gaXQKPiBjYW4gYmUgc2hhcmVkIGJ5IGFsbCBpbnRlcm5hbCBjbGllbnRzLgo+IAo+IENoYW5n
ZXMgdGhpcyB0aW1lOgo+IC0gVXNlIHJlc3RvcmVfZmJkZXZfbW9kZV9mb3JjZSgpIGluIAo+ICAg
ZHJtX2ZiX2hlbHBlcl9yZXN0b3JlX2ZiZGV2X21vZGVfdW5sb2NrZWQoKSB0byBwbGVhc2UgaWd0
IHRlc3RzLiBJJ20gbm90Cj4gICBjdXJyZW50bHkgbW90aXZhdGVkIHRvIGxlYXJuIGlndCBzbyBJ
IGhhdmUgYWRkZWQgYSB0b2RvIGVudHJ5IGZvciB0aGlzLgo+IC0gUmViYXNlIG9uIGRybS1uZXh0
IChkcm1fZmJfaGVscGVyIGFuZCBkcm1fbGVnYWN5IHBhdGNoZXMpCj4gCj4gTm9yYWxmLgo+IAo+
IE5vcmFsZiBUcsO4bm5lcyAoMTEpOgo+ICAgZHJtL2F0b21pYzogTW92ZSBfX2RybV9hdG9taWNf
aGVscGVyX2Rpc2FibGVfcGxhbmUvc2V0X2NvbmZpZygpCgo+ICAgZHJtL2ZiLWhlbHBlcjogQXZv
aWQgcmFjZSB3aXRoIERSTSB1c2Vyc3BhY2UKPiAgIGRybS9mYi1oZWxwZXI6IE5vIG5lZWQgdG8g
Y2FjaGUgcm90YXRpb24gYW5kIHN3X3JvdGF0aW9ucwo+ICAgZHJtL2ZiLWhlbHBlcjogUmVtb3Zl
IGRybV9mYl9oZWxwZXJfY3J0Yy0+e3gseSxkZXNpcmVkX21vZGV9CgpQYXRjaGVzIDItNCBhcHBs
aWVkLCB0aGFua3MgZm9yIHJldmlld2luZy4KCj4gICBkcm0vZmItaGVscGVyOiBSZW1vdmUgZHJt
X2ZiX2hlbHBlcl9jcnRjCj4gICBkcm0vZmItaGVscGVyOiBQcmVwYXJlIHRvIG1vdmUgb3V0IGNv
bW1pdCBjb2RlCj4gICBkcm0vZmItaGVscGVyOiBNb3ZlIG91dCBjb21taXQgY29kZQo+ICAgZHJt
L2ZiLWhlbHBlcjogUmVtb3ZlIGRybV9mYl9oZWxwZXJfY29ubmVjdG9yCgpQYXRjaGVzIDUtOCBh
cmUgc3RpbGwgaW4gbmVlZCBvZiByZXZpZXcuLi4KCk5vcmFsZi4KCj4gICBkcm0vZmItaGVscGVy
OiBQcmVwYXJlIHRvIG1vdmUgb3V0IG1vZGVzZXQgY29uZmlnIGNvZGUKPiAgIGRybS9mYi1oZWxw
ZXI6IE1vdmUgb3V0IG1vZGVzZXQgY29uZmlnIGNvZGUKPiAgIGRybS9jbGllbnQ6IEhhY2s6IEFk
ZCBib290c3BsYXNoIGV4YW1wbGUKPiAKPiAgRG9jdW1lbnRhdGlvbi9ncHUvZHJtLWNsaWVudC5y
c3QgICAgIHwgICAgMyArCj4gIERvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0ICAgICAgICAgICB8
ICAgMTUgKwo+ICBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyAgICAgICAgICAgICAgfCAgICA1ICsK
PiAgZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlICAgICAgICAgICAgIHwgICAgMyArLQo+ICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2F0b21pYy5jICAgICAgICAgfCAgMTY4ICsrKysKPiAgZHJpdmVycy9n
cHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMgIHwgIDE2NCAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L2RybV9hdXRoLmMgICAgICAgICAgIHwgICAyMCArCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fYm9v
dHNwbGFzaC5jICAgICB8ICAzNTggKysrKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVu
dC5jICAgICAgICAgfCAgIDE3ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVz
ZXQuYyB8IDEwODYgKysrKysrKysrKysrKysrKysrKysKPiAgZHJpdmVycy9ncHUvZHJtL2RybV9j
cnRjX2ludGVybmFsLmggIHwgICAgNSArCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMgICAg
ICAgICAgICB8ICAgIDQgKwo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jICAgICAg
fCAxMzkyICsrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1f
aW50ZXJuYWwuaCAgICAgICB8ICAgIDIgKwo+ICBpbmNsdWRlL2RybS9kcm1fYXRvbWljX2hlbHBl
ci5oICAgICAgfCAgICA0IC0KPiAgaW5jbHVkZS9kcm0vZHJtX2NsaWVudC5oICAgICAgICAgICAg
IHwgICA0OSArCj4gIGluY2x1ZGUvZHJtL2RybV9mYl9oZWxwZXIuaCAgICAgICAgICB8ICAxMDIg
Ky0KPiAgMTcgZmlsZXMgY2hhbmdlZCwgMTg3NiBpbnNlcnRpb25zKCspLCAxNTIxIGRlbGV0aW9u
cygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2RybV9ib290c3BsYXNo
LmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVz
ZXQuYwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
