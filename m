Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 226D810D6C0
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 15:13:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3876E913;
	Fri, 29 Nov 2019 14:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D4F966E919
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 14:13:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B6A01FB;
 Fri, 29 Nov 2019 06:13:35 -0800 (PST)
Received: from [10.1.194.43] (e112269-lin.cambridge.arm.com [10.1.194.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBC633F52E;
 Fri, 29 Nov 2019 06:13:34 -0800 (PST)
Subject: Re: [PATCH v2] drm/panfrost: Document base field location constraint
 in panfrost_gem_object
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <20191129135614.2439058-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <b603bc00-832c-ae0d-8dfa-57a0b791d6f9@arm.com>
Date: Fri, 29 Nov 2019 14:13:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191129135614.2439058-1-boris.brezillon@collabora.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjkvMTEvMjAxOSAxMzo1NiwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IEkndmUgc3BlbnQg
aG91cnMgY2hhc2luZyBhIG1lbW9yeSBjb3JydXB0aW9uIHRoYXQgd2FzIGNhdXNlZCBieQo+IGlu
c2VydGlvbiBvZiBhbiBleHRyYSBmaWVsZCBmaWVsZCBiZWZvcmUgLT5iYXNlLiBMZXQncyBkb2N1
bWVudCB0aGUKPiBmYWN0IHRoYXQgYmFzZSBoYXMgdG8gYmUgdGhlIGZpcnN0IGZpZWxkIGluIHBh
bmZyb3N0X2dlbV9vYmplY3QuCj4gCj4gU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxi
b3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KClRoaXMgc2VlbXMgdG8gYmUgYSBsaW1pdGF0
aW9uIGltcG9zZWQgYnkgdGhlIGdlbV9jcmVhdGVfb2JqZWN0KCkKY2FsbGJhY2sgLSBlLmcuIGl0
J3MgYXNzdW1lZCB0aGF0IGtmcmVlKCkgY2FuIGJlIGRpcmVjdGx5IGNhbGxlZCBvbiB0aGUKcmVz
dWx0LiBVc2VmdWwgdG8gaGF2ZSB0aGUgZG9jdW1lbnRhdGlvbiB0aG91Z2guCgpSZXZpZXdlZC1i
eTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KClN0ZXZlCgo+IC0tLQo+IENo
YW5nZXMgaW4gdjI6Cj4gKiBVc2UgdGhlIHByb3BlciBwcmVmaXggaW4gdGhlIHN1YmplY3QgbGlu
ZQo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmggfCA0ICsr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmggYi9kcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmgKPiBpbmRleCBiMzUxN2ZmOTYzMGMuLmQ0ODAyNjFmYzE3
NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmgK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmgKPiBAQCAtMTAs
NiArMTAsMTAgQEAKPiAgc3RydWN0IHBhbmZyb3N0X21tdTsKPiAgCj4gIHN0cnVjdCBwYW5mcm9z
dF9nZW1fb2JqZWN0IHsKPiArCS8qCj4gKwkgKiBNdXN0IGJlIHRoZSBmaXJzdCBlbGVtZW50IGJl
Y2F1c2Ugd2UncmUgdXNpbmcgc29tZSBvZiB0aGUKPiArCSAqIGRybV9nZW1fc2htZW0gaGVscGVy
cy4KPiArCSAqLwo+ICAJc3RydWN0IGRybV9nZW1fc2htZW1fb2JqZWN0IGJhc2U7Cj4gIAlzdHJ1
Y3Qgc2dfdGFibGUgKnNndHM7Cj4gIAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
