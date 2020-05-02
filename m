Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AB01C275D
	for <lists+dri-devel@lfdr.de>; Sat,  2 May 2020 19:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D8086E195;
	Sat,  2 May 2020 17:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB08A6E195
 for <dri-devel@lists.freedesktop.org>; Sat,  2 May 2020 17:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S44YQVBSf+4uM5McTgtiDRdvS1ZBtuWsLXCvE2yH/1Y=; b=bUmAtM3EJWPCZ93Duujk3Fi/So
 TSQ56h/5bYO7tmBJuon0U3TYag1QIxFtGUa6h6Nrg1yI+KdddTVXOfT3ZmbtFmV8Si/EuBOwaTcHw
 wjawSCYs6la65iTTBM2Q/GWOihYDi5uf7HOE6/M7BXOaynQ9XFhwvD7RNTggBXYZYYG1Tq+ibrdLr
 uIdRwDh36pD2Vn0dJIIdcTj2QyqKAtKuGvK4wF3xnxp/6Dtzc8pfySzMwU2uQ4iPj7u93x2n5goq4
 tWTb8w5IXfTvntZbBTFGm0OciOK51cJuv21e3Vuh6wXLfDUOYMQk6pSauhVRxifxPcYCR9yLZkQZn
 m7Tlc3ZA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:50543
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1jUwOs-0005fV-Eu; Sat, 02 May 2020 19:58:06 +0200
Subject: Re: [PATCH 08/10] drm: Add Generic USB Display driver
To: dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org
References: <20200429124830.27475-1-noralf@tronnes.org>
 <20200429124830.27475-9-noralf@tronnes.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <7ebe9c87-55f8-ae1f-5bdf-3413d676f3d7@tronnes.org>
Date: Sat, 2 May 2020 19:58:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429124830.27475-9-noralf@tronnes.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

CgpEZW4gMjkuMDQuMjAyMCAxNC40OCwgc2tyZXYgTm9yYWxmIFRyw7hubmVzOgo+IFRoaXMgYWRk
cyBhIGdlbmVyaWMgVVNCIGRpc3BsYXkgZHJpdmVyIHdpdGggdGhlIGludGVudGlvbiB0aGF0IGl0
IGNhbiBiZQo+IHVzZWQgd2l0aCBmdXR1cmUgVVNCIGludGVyZmFjZWQgbG93IGVuZCBkaXNwbGF5
cy9hZGFwdGVycy4gVGhlIExpbnV4Cj4gZ2FkZ2V0IGRldmljZSBkcml2ZXIgd2lsbCBzZXJ2ZSBh
cyB0aGUgY2Fub25pY2FsIGRldmljZSBpbXBsZW1lbnRhdGlvbi4KPiAKPiBUaGUgZm9sbG93aW5n
IERSTSBwcm9wZXJ0aWVzIGFyZSBzdXBwb3J0ZWQ6Cj4gLSBQbGFuZSByb3RhdGlvbgo+IC0gQ29u
bmVjdG9yIFRWIHByb3BlcnRpZXMKPiAKPiBUaGVyZSBpcyBhbHNvIHN1cHBvcnQgZm9yIGJhY2ts
aWdodCBicmlnaHRuZXNzIGV4cG9zZWQgYXMgYSBiYWNrbGlnaHQKPiBkZXZpY2UuCj4gCj4gRGlz
cGxheSBtb2RlcyBjYW4gYmUgbWFkZSBhdmFpbGFibGUgdG8gdGhlIGhvc3QgZHJpdmVyIGVpdGhl
ciBhcyBEUk0KPiBkaXNwbGF5IG1vZGVzIG9yIHRocm91Z2ggRURJRC4gSWYgYm90aCBhcmUgcHJl
c2VudCwgRURJRCBpcyBqdXN0IHBhc3NlZAo+IG9uIHRvIHVzZXJzcGFjZS4KPiAKPiBQZXJmb3Jt
YW5jZSBpcyBwcmVmZXJyZWQgb3ZlciBjb2xvciBkZXB0aCwgc28gaWYgdGhlIGRldmljZSBzdXBw
b3J0cwo+IFJHQjU2NSwgRFJNX0NBUF9EVU1CX1BSRUZFUlJFRF9ERVBUSCB3aWxsIHJldHVybiAx
Ni4KPiAKPiBJZiB0aGUgZGV2aWNlIHRyYW5zZmVyIGJ1ZmZlciBjYW4ndCBmaXQgYW4gdW5jb21w
cmVzc2VkIGZyYW1lYnVmZmVyCj4gdXBkYXRlLCB0aGUgdXBkYXRlIGlzIHNwbGl0IHVwIGludG8g
cGFydHMgdGhhdCBkbyBmaXQuCj4gCj4gT3B0aW1hbCB1c2VyIGV4cGVyaWVuY2UgaXMgYWNoaWV2
ZWQgYnkgcHJvdmlkaW5nIGRhbWFnZSByZXBvcnRzIGVpdGhlciBieQo+IHNldHRpbmcgRkJfREFN
QUdFX0NMSVBTIG9uIHBhZ2VmbGlwcyBvciBjYWxsaW5nIERSTV9JT0NUTF9NT0RFX0RJUlRZRkIu
Cj4gCj4gTFo0IGNvbXByZXNzaW9uIGlzIHVzZWQgaWYgdGhlIGRldmljZSBzdXBwb3J0cyBpdC4K
PiAKPiBUaGUgZHJpdmVyIHN1cHBvcnRzIGEgb25lIGJpdCBtb25vY2hyb21lIHRyYW5zZmVyIGZv
cm1hdDogUjEuIFRoaXMgaXMgbm90Cj4gaW1wbGVtZW50ZWQgaW4gdGhlIGdhZGdldCBkcml2ZXIu
IEl0IGlzIGFkZGVkIGluIHByZXBhcmF0aW9uIGZvciBmdXR1cmUKPiBtb25vY2hyb21lIGUtaW5r
IGRpc3BsYXlzLgo+IAo+IFRoZSBkcml2ZXIgaXMgTUlUIGxpY2Vuc2VkIHRvIHNtb290aCB0aGUg
cGF0aCBmb3IgYW55IEJTRCBwb3J0IG9mIHRoZQo+IGRyaXZlci4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPiAtLS0KCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9n
dWQvZ3VkX2RybV9kcnYuYwoKPiArc3RhdGljIGludCBndWRfZHJtX3Byb2JlKHN0cnVjdCB1c2Jf
aW50ZXJmYWNlICppbnRlcmZhY2UsCj4gKwkJCSBjb25zdCBzdHJ1Y3QgdXNiX2RldmljZV9pZCAq
aWQpCj4gK3sKCjxzbmlwPgoKPiArCWdkcm0gPSBremFsbG9jKHNpemVvZigqZ2RybSksIEdGUF9L
RVJORUwpOwo+ICsJaWYgKCFnZHJtKQo+ICsJCXJldHVybiAtRU5PTUVNOwo+ICsKPiArCWdkcm0t
PnVzYiA9IHVzYjsKPiArCWdkcm0tPmlmbnVtID0gaW50ZXJmYWNlLT5jdXJfYWx0c2V0dGluZy0+
ZGVzYy5iSW50ZXJmYWNlTnVtYmVyOwo+ICsJZ2RybS0+Y29tcHJlc3Npb24gPSBkZXNjLmJDb21w
cmVzc2lvbiAmIEdVRF9EUk1fQ09NUFJFU1NJT05fTFo0Owo+ICsKPiArCWRybSA9ICZnZHJtLT5k
cm07Cj4gKwlyZXQgPSBkZXZtX2RybV9kZXZfaW5pdChkZXYsIGRybSwgJmd1ZF9kcm1fZHJpdmVy
KTsKPiArCWlmIChyZXQpIHsKPiArCQlrZnJlZShnZHJtKTsKPiArCQlyZXR1cm4gcmV0Owo+ICsJ
fQoKSSBzZWUgdGhhdCBEYW5pZWwncyBzZXJpZXMgaGFzIGxhbmRlZCBub3csIHNvIEkgd2lsbCB1
c2UKZGV2bV9kcm1fZGV2X2FsbG9jKCkgYW5kIGRybW1fbW9kZV9jb25maWdfaW5pdCgpIGluIHRo
ZSBuZXh0IHZlcnNpb24uCgo8c25pcD4KCj4gKwlkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cChkcm0s
IDE2KTsKClRoaXMgc2hvdWxkIGJlOgoKCWRybV9mYmRldl9nZW5lcmljX3NldHVwKGRybSwgMCk7
CgpOb3JhbGYuCgo+ICsKPiArCXJldHVybiAwOwo+ICt9Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
