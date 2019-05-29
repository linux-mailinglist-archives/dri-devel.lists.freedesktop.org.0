Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA61B2D987
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 11:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E74B89862;
	Wed, 29 May 2019 09:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAFEF896E4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 09:52:56 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 170C4284A2F;
 Wed, 29 May 2019 10:52:55 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v3 2/4] drm/panfrost: Add a module parameter to expose
 unstable ioctls
Date: Wed, 29 May 2019 11:52:31 +0200
Message-Id: <20190529095233.26277-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190529095233.26277-1-boris.brezillon@collabora.com>
References: <20190529095233.26277-1-boris.brezillon@collabora.com>
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
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgcGxhbiB0byBleHBvc2UgcGVyZm9ybWFuY2UgY291bnRlcnMgdGhyb3VnaCAyIGRyaXZlciBz
cGVjaWZpYwppb2N0bHMgdW50aWwgdGhlcmUncyBhIHNvbHV0aW9uIHRvIGV4cG9zZSB0aGVtIGlu
IGEgZ2VuZXJpYyB3YXkuCkluIG9yZGVyIHRvIGJlIGFibGUgdG8gZGVwcmVjYXRlIHRob3NlIGlv
Y3RscyB3aGVuIHRoaXMgbmV3CmluZnJhc3RydWN0dXJlIGlzIGluIHBsYWNlIHdlIGFkZCBhbiB1
bnNhZmUgbW9kdWxlIHBhcmFtZXRlciB0aGF0CndpbGwga2VlcCB0aG9zZSBpb2N0bHMgaGlkZGVu
IHVubGVzcyBpdCdzIHNldCB0byB0cnVlICh3aGljaCBhbHNvCmhhcyB0aGUgZWZmZWN0IG9mIHRh
aW50aW5nIHRoZSBrZXJuZWwpLgoKQWxsIHVuc3RhYmxlIGlvY3RsIGhhbmRsZXJzIHNob3VsZCB1
c2UgcGFuZnJvc3RfdW5zdGFibGVfaW9jdGxfY2hlY2soKQp0byBjaGVjayB3aGV0aGVyIHRoZXkn
cmUgc3VwcG9zZWQgdG8gaGFuZGxlIHRoZSByZXF1ZXN0IG9yIHJlamVjdCBpdAp3aXRoIEVOT1NZ
Uy4KClN1Z2dlc3RlZC1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNv
bT4KU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFi
b3JhLmNvbT4KLS0tCkNobmFnZXMgaW4gdjM6CiogTmV3IHBhdGNoCi0tLQogZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5oIHwgIDIgKysKIGRyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9kcnYuYyAgICB8IDExICsrKysrKysrKysrCiAyIGZpbGVzIGNoYW5n
ZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJv
c3QvcGFuZnJvc3RfZGV2aWNlLmggYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rf
ZGV2aWNlLmgKaW5kZXggODA3NGYyMjEwMzRiLi4wMzExNjhmODNiZDIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaAorKysgYi9kcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmgKQEAgLTExNSw2ICsxMTUsOCBAQCBzdGF0
aWMgaW5saW5lIGJvb2wgcGFuZnJvc3RfbW9kZWxfZXEoc3RydWN0IHBhbmZyb3N0X2RldmljZSAq
cGZkZXYsIHMzMiBpZCkKIAlyZXR1cm4gIXBhbmZyb3N0X21vZGVsX2NtcChwZmRldiwgaWQpOwog
fQogCitpbnQgcGFuZnJvc3RfdW5zdGFibGVfaW9jdGxfY2hlY2sodm9pZCk7CisKIGludCBwYW5m
cm9zdF9kZXZpY2VfaW5pdChzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldik7CiB2b2lkIHBh
bmZyb3N0X2RldmljZV9maW5pKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KTsKIApkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jIGIvZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jCmluZGV4IGQxMWUyMjgxZGRlNi4uNzU0
ODgxZWNlOGQ3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rf
ZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jCkBAIC0y
MCw2ICsyMCw5IEBACiAjaW5jbHVkZSAicGFuZnJvc3Rfam9iLmgiCiAjaW5jbHVkZSAicGFuZnJv
c3RfZ3B1LmgiCiAKK3N0YXRpYyBib29sIHVuc3RhYmxlX2lvY3RsczsKK21vZHVsZV9wYXJhbV91
bnNhZmUodW5zdGFibGVfaW9jdGxzLCBib29sLCAwNjAwKTsKKwogc3RhdGljIGludCBwYW5mcm9z
dF9pb2N0bF9nZXRfcGFyYW0oc3RydWN0IGRybV9kZXZpY2UgKmRkZXYsIHZvaWQgKmRhdGEsIHN0
cnVjdCBkcm1fZmlsZSAqZmlsZSkKIHsKIAlzdHJ1Y3QgZHJtX3BhbmZyb3N0X2dldF9wYXJhbSAq
cGFyYW0gPSBkYXRhOwpAQCAtMjk3LDYgKzMwMCwxNCBAQCBzdGF0aWMgaW50IHBhbmZyb3N0X2lv
Y3RsX2dldF9ib19vZmZzZXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAly
ZXR1cm4gMDsKIH0KIAoraW50IHBhbmZyb3N0X3Vuc3RhYmxlX2lvY3RsX2NoZWNrKHZvaWQpCit7
CisJaWYgKCF1bnN0YWJsZV9pb2N0bHMpCisJCXJldHVybiAtRU5PU1lTOworCisJcmV0dXJuIDA7
Cit9CisKIHN0YXRpYyBpbnQKIHBhbmZyb3N0X29wZW4oc3RydWN0IGRybV9kZXZpY2UgKmRldiwg
c3RydWN0IGRybV9maWxlICpmaWxlKQogewotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
