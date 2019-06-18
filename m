Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 522B049BDB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 10:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8671A6E11B;
	Tue, 18 Jun 2019 08:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042736E113
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 08:16:54 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 455612852A6;
 Tue, 18 Jun 2019 09:16:52 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v4 2/4] drm/panfrost: Add a module parameter to expose
 unstable ioctls
Date: Tue, 18 Jun 2019 10:16:46 +0200
Message-Id: <20190618081648.17297-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618081648.17297-1-boris.brezillon@collabora.com>
References: <20190618081648.17297-1-boris.brezillon@collabora.com>
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
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, kernel@collabora.com,
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
b3JhLmNvbT4KUmV2aWV3ZWQtYnk6IEFseXNzYSBSb3Nlbnp3ZWlnIDxhbHlzc2FAcm9zZW56d2Vp
Zy5pbz4KLS0tCkNoYW5nZXMgaW4gdjQ6Ci0gQWRkIEFseXNzYSdzIFItYgoKQ2hhbmdlcyBpbiB2
MzoKKiBOZXcgcGF0Y2gKLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2
aWNlLmggfCAgMiArKwogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jICAg
IHwgMTEgKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaAppbmRleCA4MDc0ZjIyMTAz
NGIuLjAzMTE2OGY4M2JkMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3Bh
bmZyb3N0X2RldmljZS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9k
ZXZpY2UuaApAQCAtMTE1LDYgKzExNSw4IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBwYW5mcm9zdF9t
b2RlbF9lcShzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldiwgczMyIGlkKQogCXJldHVybiAh
cGFuZnJvc3RfbW9kZWxfY21wKHBmZGV2LCBpZCk7CiB9CiAKK2ludCBwYW5mcm9zdF91bnN0YWJs
ZV9pb2N0bF9jaGVjayh2b2lkKTsKKwogaW50IHBhbmZyb3N0X2RldmljZV9pbml0KHN0cnVjdCBw
YW5mcm9zdF9kZXZpY2UgKnBmZGV2KTsKIHZvaWQgcGFuZnJvc3RfZGV2aWNlX2Zpbmkoc3RydWN0
IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3RfZHJ2LmMKaW5kZXggZDExZTIyODFkZGU2Li43NTQ4ODFlY2U4ZDcgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKQEAgLTIwLDYgKzIwLDkgQEAKICNpbmNsdWRlICJw
YW5mcm9zdF9qb2IuaCIKICNpbmNsdWRlICJwYW5mcm9zdF9ncHUuaCIKIAorc3RhdGljIGJvb2wg
dW5zdGFibGVfaW9jdGxzOworbW9kdWxlX3BhcmFtX3Vuc2FmZSh1bnN0YWJsZV9pb2N0bHMsIGJv
b2wsIDA2MDApOworCiBzdGF0aWMgaW50IHBhbmZyb3N0X2lvY3RsX2dldF9wYXJhbShzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGRldiwgdm9pZCAqZGF0YSwgc3RydWN0IGRybV9maWxlICpmaWxlKQogewog
CXN0cnVjdCBkcm1fcGFuZnJvc3RfZ2V0X3BhcmFtICpwYXJhbSA9IGRhdGE7CkBAIC0yOTcsNiAr
MzAwLDE0IEBAIHN0YXRpYyBpbnQgcGFuZnJvc3RfaW9jdGxfZ2V0X2JvX29mZnNldChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCXJldHVybiAwOwogfQogCitpbnQgcGFuZnJv
c3RfdW5zdGFibGVfaW9jdGxfY2hlY2sodm9pZCkKK3sKKwlpZiAoIXVuc3RhYmxlX2lvY3RscykK
KwkJcmV0dXJuIC1FTk9TWVM7CisKKwlyZXR1cm4gMDsKK30KKwogc3RhdGljIGludAogcGFuZnJv
c3Rfb3BlbihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUpCiB7
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
