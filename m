Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 776DF10D6D1
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 15:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285286E91B;
	Fri, 29 Nov 2019 14:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 555AF6E91B
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 14:19:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C23EE1FB;
 Fri, 29 Nov 2019 06:19:51 -0800 (PST)
Received: from [10.1.194.43] (e112269-lin.cambridge.arm.com [10.1.194.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 027963F52E;
 Fri, 29 Nov 2019 06:19:50 -0800 (PST)
Subject: Re: [PATCH 1/8] drm/panfrost: Make panfrost_job_run() return an
 ERR_PTR() instead of NULL
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <20191129135908.2439529-1-boris.brezillon@collabora.com>
 <20191129135908.2439529-2-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <7444054c-52b4-32d1-70c2-52bf9c5f2871@arm.com>
Date: Fri, 29 Nov 2019 14:19:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191129135908.2439529-2-boris.brezillon@collabora.com>
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjkvMTEvMjAxOSAxMzo1OSwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IElmIHdlIGRvbid0
IGRvIHRoYXQsIGRtYV9mZW5jZV9zZXRfZXJyb3IoKSBjb21wbGFpbnMgKGNhbGxlZCBmcm9tCj4g
ZHJtX3NjaGVkX21haW4oKSkuCj4gCj4gRml4ZXM6IGYzYmE5MTIyOGU4ZSAoImRybS9wYW5mcm9z
dDogQWRkIGluaXRpYWwgcGFuZnJvc3QgZHJpdmVyIikKPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5l
bC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25A
Y29sbGFib3JhLmNvbT4KClRoaXMgbWlnaHQgYmUgd29ydGggZG9pbmcsIGJ1dCBhY3R1YWxseSBp
dCdzIG5vdCBQYW5mcm9zdCB0aGF0IGlzIGJyb2tlbgppdCdzIHRoZSBjYWxsZXJzLCBzZWUgWzFd
IGFuZCBbMl0uIFNvIEkgZG9uJ3QgdGhpbmsgd2Ugd2FudCB0aGUKRml4ZXMvc3RhYmxlIHRhZy4K
ClsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMjE4Mzk5LwpbMl0gaHR0
cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTI2NzA3My8KCj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMgYi9kcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMKPiBpbmRleCAyMWYzNGQ0NGFhYzIuLmNkZDk0NDhmYmJk
ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMKPiBAQCAtMzI4
LDEzICszMjgsMTMgQEAgc3RhdGljIHN0cnVjdCBkbWFfZmVuY2UgKnBhbmZyb3N0X2pvYl9ydW4o
c3RydWN0IGRybV9zY2hlZF9qb2IgKnNjaGVkX2pvYikKPiAgCXN0cnVjdCBkbWFfZmVuY2UgKmZl
bmNlID0gTlVMTDsKPiAgCj4gIAlpZiAodW5saWtlbHkoam9iLT5iYXNlLnNfZmVuY2UtPmZpbmlz
aGVkLmVycm9yKSkKPiAtCQlyZXR1cm4gTlVMTDsKPiArCQlyZXR1cm4gRVJSX1BUUihqb2ItPmJh
c2Uuc19mZW5jZS0+ZmluaXNoZWQuZXJyb3IpOwo+ICAKPiAgCXBmZGV2LT5qb2JzW3Nsb3RdID0g
am9iOwo+ICAKPiAgCWZlbmNlID0gcGFuZnJvc3RfZmVuY2VfY3JlYXRlKHBmZGV2LCBzbG90KTsK
PiAgCWlmIChJU19FUlIoZmVuY2UpKQo+IC0JCXJldHVybiBOVUxMOwo+ICsJCXJldHVybiBFUlJf
UFRSKC1FTk9NRU0pOwoKV2h5IG92ZXJyaWRlIHRoZSBlcnJvciBmcm9tIHBhbmZyb3N0X2ZlbmNl
X2NyZWF0ZT8gSW4gdGhpcyBjYXNlIHdlIGNhbiBqdXN0OgoKCXJldHVybiBmZW5jZTsKClN0ZXZl
Cgo+ICAKPiAgCWlmIChqb2ItPmRvbmVfZmVuY2UpCj4gIAkJZG1hX2ZlbmNlX3B1dChqb2ItPmRv
bmVfZmVuY2UpOwo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
