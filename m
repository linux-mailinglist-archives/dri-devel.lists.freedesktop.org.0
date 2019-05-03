Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D8A13133
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 17:32:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9C96E7FB;
	Fri,  3 May 2019 15:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 97E306E7F9
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 15:32:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B31F15AD;
 Fri,  3 May 2019 08:32:02 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
 [10.1.196.75])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 307D93F557;
 Fri,  3 May 2019 08:32:01 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: robh@kernel.org,
	tomeu.vizoso@collabora.com
Subject: [PATCH 3/4] drm/panfrost: Don't scream about deferred probe
Date: Fri,  3 May 2019 16:31:44 +0100
Message-Id: <b6ff1f18ac0612f29fd2e3336d6663b7e02db572.1556195258.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.21.0.dirty
In-Reply-To: <cover.1556195258.git.robin.murphy@arm.com>
References: <cover.1556195258.git.robin.murphy@arm.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UHJvYmUgZGVmZXJyYWwgaXMgZmFyIGZyb20gImZhdGFsIi4KClNpZ25lZC1vZmYtYnk6IFJvYmlu
IE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmZy
b3N0L3BhbmZyb3N0X2Rydi5jIHwgNiArKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZy
b3N0L3BhbmZyb3N0X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Ry
di5jCmluZGV4IGE4ODFlMjM0NmI1NS4uNGEzZmQ5NDJkZGM2IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2Rydi5jCkBAIC0zODIsMTMgKzM4MiwxNSBAQCBzdGF0aWMgaW50IHBh
bmZyb3N0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAllcnIgPSBwYW5m
cm9zdF9kZXZpY2VfaW5pdChwZmRldik7CiAJaWYgKGVycikgewotCQlkZXZfZXJyKCZwZGV2LT5k
ZXYsICJGYXRhbCBlcnJvciBkdXJpbmcgR1BVIGluaXRcbiIpOworCQlpZiAoZXJyICE9IC1FUFJP
QkVfREVGRVIpCisJCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJGYXRhbCBlcnJvciBkdXJpbmcgR1BV
IGluaXRcbiIpOwogCQlnb3RvIGVycl9vdXQwOwogCX0KIAogCWVyciA9IHBhbmZyb3N0X2RldmZy
ZXFfaW5pdChwZmRldik7CiAJaWYgKGVycikgewotCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJGYXRh
bCBlcnJvciBkdXJpbmcgZGV2ZnJlcSBpbml0XG4iKTsKKwkJaWYgKGVyciAhPSAtRVBST0JFX0RF
RkVSKQorCQkJZGV2X2VycigmcGRldi0+ZGV2LCAiRmF0YWwgZXJyb3IgZHVyaW5nIGRldmZyZXEg
aW5pdFxuIik7CiAJCWdvdG8gZXJyX291dDE7CiAJfQogCi0tIAoyLjIxLjAuZGlydHkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
