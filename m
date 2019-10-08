Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC206CFD4E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 17:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8E56E828;
	Tue,  8 Oct 2019 15:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 449216E828
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 15:13:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1B971570;
 Tue,  8 Oct 2019 08:13:58 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
 [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1C84F3F68E;
 Tue,  8 Oct 2019 08:13:58 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: robh@kernel.org,
	tomeu.vizoso@collabora.com
Subject: [PATCH] drm/panfrost: Quiet shrinker messages
Date: Tue,  8 Oct 2019 16:13:54 +0100
Message-Id: <02b510a8a0b43b2aa55b0438859fb9fbd0f89f25.1570547447.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.21.0.dirty
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXMgYnJvdWdodCB1cCBvbiBJUkMsIGxvZ2dpbmcgYSB2YWd1ZSBhbmQgdW5hdHRyaWJ1dGVkIG1l
c3NhZ2UgZm9yIGEKbm9ybWFsIGFuZCBleHBlY3RlZCBvcGVyYXRpb24gbG9va3MgYSBiaXQgc3Bh
bW15LiBVc2UgYSBkZXZfKiB2YXJpYW50CnRvIGNsYXJpZnkgaXQgYXMgYSBkcml2ZXIgbWVzc2Fn
ZSwgYW5kIGRvd25ncmFkZSB0aGUgbGV2ZWwgdG8gZGVidWcgdG8KYXZvaWQgY2x1dHRlcmluZyB1
cCBlbmQgdXNlcnMnIGxvZ3MuCgpTaWduZWQtb2ZmLWJ5OiBSb2JpbiBNdXJwaHkgPHJvYmluLm11
cnBoeUBhcm0uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW1f
c2hyaW5rZXIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9n
ZW1fc2hyaW5rZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW1fc2hy
aW5rZXIuYwppbmRleCA0NThmMGZhNjgxMTEuLmQxYzBiZDgxYzlmNyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbV9zaHJpbmtlci5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW1fc2hyaW5rZXIuYwpAQCAtNzQsNyArNzQs
NyBAQCBwYW5mcm9zdF9nZW1fc2hyaW5rZXJfc2NhbihzdHJ1Y3Qgc2hyaW5rZXIgKnNocmlua2Vy
LCBzdHJ1Y3Qgc2hyaW5rX2NvbnRyb2wgKnNjKQogCW11dGV4X3VubG9jaygmcGZkZXYtPnNocmlu
a2VyX2xvY2spOwogCiAJaWYgKGZyZWVkID4gMCkKLQkJcHJfaW5mb19yYXRlbGltaXRlZCgiUHVy
Z2luZyAlbHUgYnl0ZXNcbiIsIGZyZWVkIDw8IFBBR0VfU0hJRlQpOworCQlkZXZfZGJnKHBmZGV2
LT5kZXYsICJQdXJnaW5nICVsdSBieXRlc1xuIiwgZnJlZWQgPDwgUEFHRV9TSElGVCk7CiAKIAly
ZXR1cm4gZnJlZWQ7CiB9Ci0tIAoyLjIxLjAuZGlydHkKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
