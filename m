Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D10BF850BB
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 18:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022826E733;
	Wed,  7 Aug 2019 16:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4706E733;
 Wed,  7 Aug 2019 16:10:18 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17921015-1500050 for multiple; Wed, 07 Aug 2019 17:10:14 +0100
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20190807135312.1730-1-christian.koenig@amd.com>
 <20190807135312.1730-3-christian.koenig@amd.com>
In-Reply-To: <20190807135312.1730-3-christian.koenig@amd.com>
Message-ID: <156519421205.6198.4392271433578956288@skylake-alporthouse-com>
Subject: Re: [PATCH 3/4] dma-buf: further relax
 reservation_object_add_shared_fence
Date: Wed, 07 Aug 2019 17:10:12 +0100
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

UXVvdGluZyBDaHJpc3RpYW4gS8O2bmlnICgyMDE5LTA4LTA3IDE0OjUzOjExKQo+IE90aGVyIGNv
cmVzIGRvbid0IGJ1c3kgd2FpdCBhbnkgbW9yZSBhbmQgd2UgcmVtb3ZlZCB0aGUgbGFzdCB1c2Vy
IG9mIGNoZWNraW5nCj4gdGhlIHNlcW5vIGZvciBjaGFuZ2VzLiBEcm9wIHVwZGF0aW5nIHRoZSBu
dW1iZXIgZm9yIHNoYXJlZCBmZW5jZXMgYWx0b2dldGhlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClJldmlld2VkLWJ5OiBD
aHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KCj4gLS0tCj4gIGRyaXZlcnMv
ZG1hLWJ1Zi9yZXNlcnZhdGlvbi5jICAgICAgICAgICAgICAgICAgICB8IDYgLS0tLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyB8IDcgKy0tLS0t
LQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMiBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL3Jlc2VydmF0aW9uLmMgYi9kcml2ZXJzL2Rt
YS1idWYvcmVzZXJ2YXRpb24uYwo+IGluZGV4IDhmY2FkZGZmZDVkNC4uOTBiYzZlZjAzNTk4IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9yZXNlcnZhdGlvbi5jCj4gKysrIGIvZHJpdmVy
cy9kbWEtYnVmL3Jlc2VydmF0aW9uLmMKPiBAQCAtMjM3LDkgKzIzNyw2IEBAIHZvaWQgcmVzZXJ2
YXRpb25fb2JqZWN0X2FkZF9zaGFyZWRfZmVuY2Uoc3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAq
b2JqLAo+ICAgICAgICAgZm9iaiA9IHJlc2VydmF0aW9uX29iamVjdF9nZXRfbGlzdChvYmopOwo+
ICAgICAgICAgY291bnQgPSBmb2JqLT5zaGFyZWRfY291bnQ7Cj4gIAo+IC0gICAgICAgcHJlZW1w
dF9kaXNhYmxlKCk7Cj4gLSAgICAgICB3cml0ZV9zZXFjb3VudF9iZWdpbigmb2JqLT5zZXEpOwo+
IC0KPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBjb3VudDsgKytpKSB7Cj4gIAo+ICAgICAgICAg
ICAgICAgICBvbGQgPSByY3VfZGVyZWZlcmVuY2VfcHJvdGVjdGVkKGZvYmotPnNoYXJlZFtpXSwK
PiBAQCAtMjU3LDkgKzI1NCw2IEBAIHZvaWQgcmVzZXJ2YXRpb25fb2JqZWN0X2FkZF9zaGFyZWRf
ZmVuY2Uoc3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqb2JqLAo+ICAgICAgICAgUkNVX0lOSVRf
UE9JTlRFUihmb2JqLT5zaGFyZWRbaV0sIGZlbmNlKTsKPiAgICAgICAgIC8qIHBvaW50ZXIgdXBk
YXRlIG11c3QgYmUgdmlzaWJsZSBiZWZvcmUgd2UgZXh0ZW5kIHRoZSBzaGFyZWRfY291bnQgKi8K
PiAgICAgICAgIHNtcF9zdG9yZV9tYihmb2JqLT5zaGFyZWRfY291bnQsIGNvdW50KTsKPiAtCj4g
LSAgICAgICB3cml0ZV9zZXFjb3VudF9lbmQoJm9iai0+c2VxKTsKPiAtICAgICAgIHByZWVtcHRf
ZW5hYmxlKCk7Cj4gICAgICAgICBkbWFfZmVuY2VfcHV0KG9sZCk7Cj4gIH0KPiAgRVhQT1JUX1NZ
TUJPTChyZXNlcnZhdGlvbl9vYmplY3RfYWRkX3NoYXJlZF9mZW5jZSk7Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYwo+IGluZGV4IGZlMDYy
Yjc2ZWM5MS4uYTQ2NDBkZGMyNGQxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYwo+IEBAIC0yNTEsMTIgKzI1MSw3IEBAIHN0YXRp
YyBpbnQgYW1kZ3B1X2FtZGtmZF9yZW1vdmVfZXZpY3Rpb25fZmVuY2Uoc3RydWN0IGFtZGdwdV9i
byAqYm8sCj4gICAgICAgICBuZXctPnNoYXJlZF9tYXggPSBvbGQtPnNoYXJlZF9tYXg7Cj4gICAg
ICAgICBuZXctPnNoYXJlZF9jb3VudCA9IGs7Cj4gIAo+IC0gICAgICAgLyogSW5zdGFsbCB0aGUg
bmV3IGZlbmNlIGxpc3QsIHNlcWNvdW50IHByb3ZpZGVzIHRoZSBiYXJyaWVycyAqLwo+IC0gICAg
ICAgcHJlZW1wdF9kaXNhYmxlKCk7Cj4gLSAgICAgICB3cml0ZV9zZXFjb3VudF9iZWdpbigmcmVz
di0+c2VxKTsKPiAtICAgICAgIFJDVV9JTklUX1BPSU5URVIocmVzdi0+ZmVuY2UsIG5ldyk7Cj4g
LSAgICAgICB3cml0ZV9zZXFjb3VudF9lbmQoJnJlc3YtPnNlcSk7Cj4gLSAgICAgICBwcmVlbXB0
X2VuYWJsZSgpOwo+ICsgICAgICAgcmN1X2Fzc2lnbl9wb2ludGVyKHJlc3YtPmZlbmNlLCBuZXcp
OwoKYnV0IHlvdSdsbCBwcm9iYWJseSB3YW50IGEgbG9jYWwgYWNrIGZvciBhbWRncHUvCi1DaHJp
cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
