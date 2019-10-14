Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF07D674A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 18:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F996E544;
	Mon, 14 Oct 2019 16:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C41E86E544
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 16:28:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C9BF28;
 Mon, 14 Oct 2019 09:28:29 -0700 (PDT)
Received: from [10.1.194.43] (e112269-lin.cambridge.arm.com [10.1.194.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 391423F718;
 Mon, 14 Oct 2019 09:28:28 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm/panfrost: DMA map all pages shared with the GPU
To: Robin Murphy <robin.murphy@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
References: <20191014151616.14099-1-steven.price@arm.com>
 <99f279c5-e93d-ade6-cd97-56b3078da755@arm.com>
 <8f8bd089-102f-9b8b-335b-6be06687d0ac@arm.com>
Message-ID: <0cfd8582-b4e1-d429-7db8-23814b063403@arm.com>
Date: Mon, 14 Oct 2019 17:28:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8f8bd089-102f-9b8b-335b-6be06687d0ac@arm.com>
Content-Language: en-GB
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTQvMTAvMjAxOSAxNjo1NSwgU3RldmVuIFByaWNlIHdyb3RlOgo+IE9uIDE0LzEwLzIwMTkg
MTY6NDYsIFJvYmluIE11cnBoeSB3cm90ZToKPj4gT24gMTQvMTAvMjAxOSAxNjoxNiwgU3RldmVu
IFByaWNlIHdyb3RlOgo+Pj4gUGFnZXMgc2hhcmVkIHdpdGggdGhlIEdQVSBhcmUgKG9mdGVuKSBu
b3QgY2FjaGUgY29oZXJlbnQgd2l0aCB0aGUgQ1BVIHNvCj4+PiBjYWNoZSBtYWludGVuYW5jZSBp
cyByZXF1aXJlZCB0byBmbHVzaCB0aGUgQ1BVJ3MgY2FjaGVzLiBUaGlzIHdhcwo+Pj4gYWxyZWFk
eSBkb25lIHdoZW4gbWFwcGluZyBwYWdlcyBvbiBmYXVsdCwgYnV0IHdhc24ndCBwcmV2aW91c2x5
IGRvbmUKPj4+IHdoZW4gbWFwcGluZyBhIGZyZXNobHkgYWxsb2NhdGVkIHBhZ2UuCj4+Pgo+Pj4g
Rml4IHRoaXMgYnkgbW92aW5nIHRoZSBjYWxsIHRvIGRtYV9tYXBfc2coKSBpbnRvIG1tdV9tYXBf
c2coKSBlbnN1cmluZwo+Pj4gdGhhdCBpdCBpcyBhbHdheXMgY2FsbGVkIHdoZW4gcGFnZXMgYXJl
IG1hcHBlZCBvbnRvIHRoZSBHUFUuIFNpbmNlCj4+PiBtbXVfbWFwX3NnKCkgY2FuIG5vdyBmYWls
IHRoZSBjb2RlIGFsc28gbm93IGhhcyB0byBoYW5kbGUgYW4gZXJyb3IKPj4+IHJldHVybi4KPj4+
Cj4+PiBOb3QgcGVyZm9ybWluZyB0aGlzIGNhY2hlIG1haW50ZW5hbmNlIGNhbiBjYXVzZSBlcnJv
cnMgaW4gdGhlIEdQVSBvdXRwdXQKPj4+IChDUFUgY2FjaGVzIGFyZSBsYXRlciBmbHVzaGVkIGFu
ZCBvdmVyd3JpdGUgdGhlIEdQVSBvdXRwdXQpLiBJbiB0aGVvcnkKPj4+IGl0IGFsc28gYWxsb3dz
IHRoZSBHUFUgKGFuZCBieSBleHRlbnNpb24gdXNlciBzcGFjZSkgdG8gb2JzZXJ2ZSB0aGUKPj4+
IG1lbW9yeSBjb250ZW50cyBwcmlvciB0byBzYW5pdGl6YXRpb24uCj4+Cj4+IEZvciB0aGUgbm9u
LWhlYXAgY2FzZSwgYXJlbid0IHRoZSBwYWdlcyBhbHJlYWR5IHN1cHBvc2VkIHRvIGJlIG1hcHBl
ZCBieQo+PiBkcm1fZ2VtX3NobWVtX2dldF9wYWdlc19zZ3QoKT8KPiAKPiBIbW0sIHdlbGwgeWVz
IC0gaXQgbG9va3MgbGlrZSBpdCAqc2hvdWxkKiB3b3JrIC0gYnV0IEkgd2FzIGRlZmluaXRlbHkK
PiBzZWVpbmcgY2FjaGUgYXJ0ZWZhY3RzIHVudGlsIEkgZGlkIHRoaXMgY2hhbmdlLi4uIGxldCBt
ZSBkbyBzb21lIG1vcmUKPiB0ZXN0aW5nLiBJdCdzIHBvc3NpYmxlIHRoYXQgdGhpcyBpcyBhY3R1
YWxseSBvbmx5IGFmZmVjdGluZyBidWZmZXJzCj4gaW1wb3J0ZWQgZnJvbSBhbm90aGVyIGRyaXZl
ci4gUGVyaGFwcyBpdCdzCj4gZHJtX2dlbV9zaG1lbV9wcmltZV9pbXBvcnRfc2dfdGFibGUoKSB0
aGF0IG5lZWRzIGZpeGluZy4KClllcyB0aGlzIGRvZXMgYXBwZWFyIHRvIG9ubHkgYWZmZWN0IGlt
cG9ydGVkIGJ1ZmZlcnMgZnJvbSB3aGF0IEkgY2FuCnRlbGwuIExvb2tpbmcgdGhyb3VnaCB0aGUg
Y29kZSB0aGVyZSBpcyBzb21ldGhpbmcgc3VzcGljaW91cyBpbgpkcm1fZ2VtX21hcF9kbWFfYnVm
KCkuIFRoZSBmb2xsb3dpbmcgImZpeGVzIiB0aGUgcHJvYmxlbS4gQnV0IEknbSBub3QKc3VyZSB0
aGUgcmVhc29uaW5nIGJlaGluZCBETUFfQVRUUl9TS0lQX0NQVV9TWU5DIGJlaW5nIHNwZWNpZmll
ZCAtCnByZXN1bWFibHkgc29tZW9uZSB0aG91Z2ggaXQgd2FzIGEgZ29vZCBpZGVhISBJJ20gbm90
IHN1cmUgd2hpY2ggZHJpdmVyJ3MKcmVzcG9uc2liaWxpdHkgaXQgaXMgdG8gZW5zdXJlIHRoZSBj
YWNoZXMgYXJlIGZsdXNoZWQuCgotLS04PC0tLS0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fcHJpbWUuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwppbmRleCAwYTIzMTZl
MGU4MTIuLjFmNzM1M2FiZDI1NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmlt
ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwpAQCAtNjI1LDcgKzYyNSw3IEBA
IHN0cnVjdCBzZ190YWJsZSAqZHJtX2dlbV9tYXBfZG1hX2J1ZihzdHJ1Y3QgZG1hX2J1Zl9hdHRh
Y2htZW50ICphdHRhY2gsCiAJCXNndCA9IG9iai0+ZGV2LT5kcml2ZXItPmdlbV9wcmltZV9nZXRf
c2dfdGFibGUob2JqKTsKIAogCWlmICghZG1hX21hcF9zZ19hdHRycyhhdHRhY2gtPmRldiwgc2d0
LT5zZ2wsIHNndC0+bmVudHMsIGRpciwKLQkJCSAgICAgIERNQV9BVFRSX1NLSVBfQ1BVX1NZTkMp
KSB7CisJCQkgICAgICAwKSkgewogCQlzZ19mcmVlX3RhYmxlKHNndCk7CiAJCWtmcmVlKHNndCk7
CiAJCXNndCA9IEVSUl9QVFIoLUVOT01FTSk7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
