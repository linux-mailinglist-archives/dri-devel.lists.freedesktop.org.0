Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC26988B9F
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 15:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D09E6E3F3;
	Sat, 10 Aug 2019 13:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 54C536ED6F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 10:11:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9304515A2;
 Fri,  9 Aug 2019 03:11:25 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 719223F575;
 Fri,  9 Aug 2019 03:11:24 -0700 (PDT)
Subject: Re: [PATCH v4 3/9] drm/panfrost: Restructure the GEM object creation
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org
References: <20190808222200.13176-1-robh@kernel.org>
 <20190808222200.13176-4-robh@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <f85d0936-5b44-8faf-5f24-01f966407e09@arm.com>
Date: Fri, 9 Aug 2019 11:11:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808222200.13176-4-robh@kernel.org>
Content-Language: en-GB
X-Mailman-Approved-At: Sat, 10 Aug 2019 13:55:11 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDgvMDgvMjAxOSAyMzoyMSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gU2V0dGluZyB0aGUgR1BV
IFZBIHdoZW4gY3JlYXRpbmcgdGhlIEdFTSBvYmplY3QgZG9lc24ndCBhbGxvdyBmb3IgYW55Cj4g
Y29uZGl0aW9uYWwgYWRqdXN0bWVudHMgdG8gdGhlIG1hcHBpbmcuIEluIHByZXBhcmF0aW9uIHRv
IHN1cHBvcnQKPiBhZGp1c3RpbmcgdGhlIG1hcHBpbmcgYW5kIHBlciBGRCBhZGRyZXNzIHNwYWNl
cywgcmVzdHJ1Y3R1cmUgdGhlIEdFTQo+IG9iamVjdCBjcmVhdGlvbiB0byBtYXAgYW5kIHVubWFw
IHRoZSBHRU0gb2JqZWN0IGluIHRoZSBHRU0gb2JqZWN0IC5vcGVuKCkKPiBhbmQgLmNsb3NlKCkg
aG9va3MuCj4gCj4gV2hpbGUgcGFuZnJvc3RfZ2VtX2ZyZWVfb2JqZWN0KCkgYW5kIHBhbmZyb3N0
X2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUoKQo+IGFyZSBub3QgcmVhbGx5IG5lZWRlZCBhZnRl
ciB0aGlzIGNvbW1pdCwga2VlcCB0aGVtIGFzIHdlJ2xsIG5lZWQgdGhlbSBpbgo+IHN1YnNlcXVl
bnQgY29tbWl0cy4KPiAKPiBDYzogVG9tZXUgVml6b3NvIDx0b21ldS52aXpvc29AY29sbGFib3Jh
LmNvbT4KPiBDYzogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNv
bT4KPiBDYzogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KPiBSZXZpZXdlZC1i
eTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KPiBBY2tlZC1ieTogQWx5c3Nh
IFJvc2VuendlaWcgPGFseXNzYS5yb3Nlbnp3ZWlnQGNvbGxhYm9yYS5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiAtLS0KPiBTdGV2ZW4sIEFseXNz
YSwgSSBrZXB0IHlvdXIgdGFncywgYnV0IHBsZWFzZSB0YWtlIGFub3RoZXIgbG9vayBhcyB0aGlu
Z3MKPiBtb3ZlZCBhcm91bmQgYSBiaXQgaGVyZS4KClNhZGx5IHRoaXMgZG9lc24ndCBjb21waWxl
IChiaXNlY3Rpb24gaXMgYnJva2VuKSwgc2VlIGJlbG93OgoKPiAgZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2Rydi5jIHwgIDkgLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJv
c3QvcGFuZnJvc3RfZ2VtLmMgfCA2NyArKysrKysrKysrKysrKy0tLS0tLS0tLS0tCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgMzkgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYyBiL2RyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYwo+IGluZGV4IDkyNmQwMjFlZTIwMi4uMjg5
NGNmYmJjZTJiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYwo+
IEBAIC03OCw3ICs3OCw2IEBAIHN0YXRpYyBpbnQgcGFuZnJvc3RfaW9jdGxfZ2V0X3BhcmFtKHN0
cnVjdCBkcm1fZGV2aWNlICpkZGV2LCB2b2lkICpkYXRhLCBzdHJ1Y3QKPiAgc3RhdGljIGludCBw
YW5mcm9zdF9pb2N0bF9jcmVhdGVfYm8oc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0
YSwKPiAgCQlzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUpCj4gIHsKPiAtCWludCByZXQ7Cj4gIAlzdHJ1
Y3QgZHJtX2dlbV9zaG1lbV9vYmplY3QgKnNobWVtOwo+ICAJc3RydWN0IGRybV9wYW5mcm9zdF9j
cmVhdGVfYm8gKmFyZ3MgPSBkYXRhOwo+IAo+IEBAIC05MCwxNyArODksOSBAQCBzdGF0aWMgaW50
IHBhbmZyb3N0X2lvY3RsX2NyZWF0ZV9ibyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpk
YXRhLAo+ICAJaWYgKElTX0VSUihzaG1lbSkpCj4gIAkJcmV0dXJuIFBUUl9FUlIoc2htZW0pOwo+
IAo+IC0JcmV0ID0gcGFuZnJvc3RfbW11X21hcCh0b19wYW5mcm9zdF9ibygmc2htZW0tPmJhc2Up
KTsKPiAtCWlmIChyZXQpCj4gLQkJZ290byBlcnJfZnJlZTsKPiAtCj4gIAlhcmdzLT5vZmZzZXQg
PSB0b19wYW5mcm9zdF9ibygmc2htZW0tPmJhc2UpLT5ub2RlLnN0YXJ0IDw8IFBBR0VfU0hJRlQ7
Cj4gCj4gIAlyZXR1cm4gMDsKPiAtCj4gLWVycl9mcmVlOgo+IC0JZHJtX2dlbV9oYW5kbGVfZGVs
ZXRlKGZpbGUsIGFyZ3MtPmhhbmRsZSk7Cj4gLQlyZXR1cm4gcmV0Owo+ICB9Cj4gCj4gIC8qKgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmMgYi9k
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmMKPiBpbmRleCA2N2QzNzQxODQz
NDAuLjM5MzNmODNiYTZiMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3RfZ2VtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rf
Z2VtLmMKPiBAQCAtMTUsNiArMTUsMzkgQEAKPiAgICogQk8uCj4gICAqLwo+ICBzdGF0aWMgdm9p
ZCBwYW5mcm9zdF9nZW1fZnJlZV9vYmplY3Qoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCj4g
K3sKPiArCW11dGV4X2xvY2soJnBmZGV2LT5zaHJpbmtlcl9sb2NrKTsKPiArCWlmICghbGlzdF9l
bXB0eSgmYm8tPmJhc2UubWFkdl9saXN0KSkKPiArCQlsaXN0X2RlbCgmYm8tPmJhc2UubWFkdl9s
aXN0KTsKPiArCW11dGV4X3VubG9jaygmcGZkZXYtPnNocmlua2VyX2xvY2spOwo+ICsKPiArCWRy
bV9nZW1fc2htZW1fZnJlZV9vYmplY3Qob2JqKTsKPiArfQoKJ3BmZGV2JyBhbmQgJ2JvJyBoYXZl
J3QgYmVlbiBkZWZpbmVkIHlldC4KClN0ZXZlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
