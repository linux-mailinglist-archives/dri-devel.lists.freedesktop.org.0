Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CAD10D6D0
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 15:19:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EDB6E91A;
	Fri, 29 Nov 2019 14:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F38D6E91A
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 14:19:41 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CB4A0292083;
 Fri, 29 Nov 2019 14:19:39 +0000 (GMT)
Date: Fri, 29 Nov 2019 15:19:36 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2] drm/panfrost: Document base field location
 constraint in panfrost_gem_object
Message-ID: <20191129151936.5fb18d2e@collabora.com>
In-Reply-To: <b603bc00-832c-ae0d-8dfa-57a0b791d6f9@arm.com>
References: <20191129135614.2439058-1-boris.brezillon@collabora.com>
 <b603bc00-832c-ae0d-8dfa-57a0b791d6f9@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyOSBOb3YgMjAxOSAxNDoxMzozMyArMDAwMApTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5w
cmljZUBhcm0uY29tPiB3cm90ZToKCj4gT24gMjkvMTEvMjAxOSAxMzo1NiwgQm9yaXMgQnJlemls
bG9uIHdyb3RlOgo+ID4gSSd2ZSBzcGVudCBob3VycyBjaGFzaW5nIGEgbWVtb3J5IGNvcnJ1cHRp
b24gdGhhdCB3YXMgY2F1c2VkIGJ5Cj4gPiBpbnNlcnRpb24gb2YgYW4gZXh0cmEgZmllbGQgZmll
bGQgYmVmb3JlIC0+YmFzZS4gTGV0J3MgZG9jdW1lbnQgdGhlCj4gPiBmYWN0IHRoYXQgYmFzZSBo
YXMgdG8gYmUgdGhlIGZpcnN0IGZpZWxkIGluIHBhbmZyb3N0X2dlbV9vYmplY3QuCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9y
YS5jb20+ICAKPiAKPiBUaGlzIHNlZW1zIHRvIGJlIGEgbGltaXRhdGlvbiBpbXBvc2VkIGJ5IHRo
ZSBnZW1fY3JlYXRlX29iamVjdCgpCj4gY2FsbGJhY2sgLSBlLmcuIGl0J3MgYXNzdW1lZCB0aGF0
IGtmcmVlKCkgY2FuIGJlIGRpcmVjdGx5IGNhbGxlZCBvbiB0aGUKPiByZXN1bHQuIFVzZWZ1bCB0
byBoYXZlIHRoZSBkb2N1bWVudGF0aW9uIHRob3VnaC4KCk9oLCB5b3UncmUgcmlnaHQsIEkgZGlk
bid0IGNhdGNoIHRoYXQgb25lLgoKPiAKPiBSZXZpZXdlZC1ieTogU3RldmVuIFByaWNlIDxzdGV2
ZW4ucHJpY2VAYXJtLmNvbT4KPiAKPiBTdGV2ZQo+IAo+ID4gLS0tCj4gPiBDaGFuZ2VzIGluIHYy
Ogo+ID4gKiBVc2UgdGhlIHByb3BlciBwcmVmaXggaW4gdGhlIHN1YmplY3QgbGluZQo+ID4gLS0t
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5oIHwgNCArKysrCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5oIGIvZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5oCj4gPiBpbmRleCBiMzUxN2ZmOTYzMGMuLmQ0ODAyNjFm
YzE3NyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9n
ZW0uaAo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5oCj4g
PiBAQCAtMTAsNiArMTAsMTAgQEAKPiA+ICBzdHJ1Y3QgcGFuZnJvc3RfbW11Owo+ID4gIAo+ID4g
IHN0cnVjdCBwYW5mcm9zdF9nZW1fb2JqZWN0IHsKPiA+ICsJLyoKPiA+ICsJICogTXVzdCBiZSB0
aGUgZmlyc3QgZWxlbWVudCBiZWNhdXNlIHdlJ3JlIHVzaW5nIHNvbWUgb2YgdGhlCj4gPiArCSAq
IGRybV9nZW1fc2htZW0gaGVscGVycy4KPiA+ICsJICovCj4gPiAgCXN0cnVjdCBkcm1fZ2VtX3No
bWVtX29iamVjdCBiYXNlOwo+ID4gIAlzdHJ1Y3Qgc2dfdGFibGUgKnNndHM7Cj4gPiAgCj4gPiAg
IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
