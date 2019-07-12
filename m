Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C70F66BF8
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 14:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437E76E359;
	Fri, 12 Jul 2019 12:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4F86E358;
 Fri, 12 Jul 2019 12:01:54 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 17246770-1500050 
 for multiple; Fri, 12 Jul 2019 13:01:48 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vgem: Reclassify buffer creation debug message
Date: Fri, 12 Jul 2019 13:01:47 +0100
Message-Id: <20190712120147.29830-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.22.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QSBidWZmZXIgaXMgY3JlYXRlZCBpbiByZXNwb25zZSB0byB0aGUgdXNlciBpb2N0bCwgaXQgc2hv
dWxkIHRoZXJlZm9yZQpiZSBhIHBsYWluIERSTV9ERUJVRygpIG1lc3NhZ2UgdG8gcmVmbGVjdCBp
dCBiZWluZyBhIHVzZXIgaW52b2tlZApyZXNwb25zZSBhbmQgbm90IGEgZHJpdmVyIGNvbnN0cnVj
dC4KClRoaXMgaXMganVzdCB0byBtYWtlIHRoZSBjb21tb25wbGFjZSBkcm0uZGVidWc9WzI2ZV0g
cXVpZXRlciB3aGVuCnJ1bm5pbmcgd2l0aCB2Z2VtLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2ls
c29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92Z2VtL3ZnZW1fZHJ2LmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJt
L3ZnZW0vdmdlbV9kcnYuYwppbmRleCAzODZlZmMzYjU4NDMuLjc2ZDk1YjVlMjg5YyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZnZW0vdmdlbV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vdmdlbS92Z2VtX2Rydi5jCkBAIC0yMTQsNyArMjE0LDcgQEAgc3RhdGljIGludCB2Z2VtX2dl
bV9kdW1iX2NyZWF0ZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUsIHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsCiAJYXJncy0+c2l6ZSA9IGdlbV9vYmplY3QtPnNpemU7CiAJYXJncy0+cGl0Y2ggPSBwaXRj
aDsKIAotCURSTV9ERUJVR19EUklWRVIoIkNyZWF0ZWQgb2JqZWN0IG9mIHNpemUgJWxsZFxuIiwg
c2l6ZSk7CisJRFJNX0RFQlVHKCJDcmVhdGVkIG9iamVjdCBvZiBzaXplICVsbGRcbiIsIHNpemUp
OwogCiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
