Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B1A42A36
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 17:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692D889533;
	Wed, 12 Jun 2019 15:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C6689533
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 15:03:42 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 16878054-1500050 for multiple; Wed, 12 Jun 2019 16:03:32 +0100
MIME-Version: 1.0
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190610170440.28525-1-robh@kernel.org>
References: <20190610170440.28525-1-robh@kernel.org>
Message-ID: <156035181177.27443.16288436516354473350@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [RFC PATCH] drm/panfrost: Add support for mapping BOs on GPU page
 faults
Date: Wed, 12 Jun 2019 16:03:31 +0100
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBSb2IgSGVycmluZyAoMjAxOS0wNi0xMCAxODowNDo0MCkKPiBUaGUgbWlkZ2FyZC9i
aWZyb3N0IEdQVXMgbmVlZCB0byBhbGxvY2F0ZSBHUFUgbWVtb3J5IHdoaWNoIGlzIGFsbG9jYXRl
ZAo+IG9uIEdQVSBwYWdlIGZhdWx0cyBhbmQgbm90IHBpbm5lZCBpbiBtZW1vcnkuIFRoZSB2ZW5k
b3IgZHJpdmVyIGNhbGxzCj4gdGhpcyBmdW5jdGlvbmFsaXR5IEdST1dfT05fR1BGLgo+IAo+IFRo
aXMgaW1wbGVtZW50YXRpb24gYXNzdW1lcyB0aGF0IEJPcyBhbGxvY2F0ZWQgd2l0aCB0aGUKPiBQ
QU5GUk9TVF9CT19OT01BUCBmbGFnIGFyZSBuZXZlciBtbWFwcGVkIG9yIGV4cG9ydGVkLiBCb3Ro
IG9mIHRob3NlIG1heQo+IGFjdHVhbGx5IHdvcmssIGJ1dCBJJ20gdW5zdXJlIGlmIHRoZXJlJ3Mg
c29tZSBpbnRlcmFjdGlvbiB0aGVyZS4gSXQKPiB3b3VsZCBjYXVzZSB0aGUgd2hvbGUgb2JqZWN0
IHRvIGJlIHBpbm5lZCBpbiBtZW1vcnkgd2hpY2ggd291bGQgZGVmZWF0Cj4gdGhlIHBvaW50IG9m
IHRoaXMuCj4gCj4gSXNzdWVzL3F1ZXN0aW9ucy90aG91Z2h0czoKPiAKPiBXaGF0J3MgdGhlIGRp
ZmZlcmVuY2UgYmV0d2VlbiBpX21hcHBpbmcgYW5kIGZfbWFwcGluZz8KPiAKPiBXaGF0IGtpbmQg
b2YgY2xlYW4tdXAgb24gY2xvc2UgaXMgbmVlZGVkPyBCYXNlZCBvbiB2Z2VtIGZhdWx0cywgdGhl
cmUKPiBkb2Vzbid0IHNlZW0gdG8gYmUgYW55IHJlZmNvdW50aW5nLiBBc3N1bWUgdXNlcnNwYWNl
IGlzIHJlc3BvbnNpYmxlIGZvcgo+IG5vdCBmcmVlaW5nIHRoZSBCTyB3aGlsZSBhIHBhZ2UgZmF1
bHQgY2FuIG9jY3VyPwoKU2VlIGRybV9nZW1fdm1fb3BlbiBhbmQgZHJtX2dlbV92bV9jbG9zZS4K
LUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
