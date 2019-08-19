Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FD794B84
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 19:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856DF6E252;
	Mon, 19 Aug 2019 17:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BB26E252;
 Mon, 19 Aug 2019 17:19:12 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 18192631-1500050 
 for multiple; Mon, 19 Aug 2019 18:19:02 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Select DMABUF_SELFTESTS for the default i915.ko
 debug build
Date: Mon, 19 Aug 2019 18:19:00 +0100
Message-Id: <20190819171900.4501-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.23.0.rc1
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
Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5jbHVkZSB0aGUgRE1BQlVGX1NFTEZURVNUUyBhcyBwYXJ0IG9mIHRoZSBzdGFuZGFyZCBidWls
ZCBmb3IgSUdULCBzbwp0aGF0IHRoZXkgY2FuIGJlIHJ1biBieSBpZ3QvZG1hYnVmCgpUZXN0Y2Fz
ZTogaWd0L2RtYWJ1ZgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdp
bHNvbi5jby51az4KQ2M6IFRvbWkgU2FydmVsYSA8dG9taS5wLnNhcnZlbGFAaW50ZWwuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L0tjb25maWcuZGVidWcgfCAxICsKIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L0tj
b25maWcuZGVidWcgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9LY29uZmlnLmRlYnVnCmluZGV4IDg3
YTM4YzZhYWE0MS4uMDA3ODZhMTQyZmYwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9LY29uZmlnLmRlYnVnCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L0tjb25maWcuZGVidWcK
QEAgLTMwLDYgKzMwLDcgQEAgY29uZmlnIERSTV9JOTE1X0RFQlVHCiAgICAgICAgIHNlbGVjdCBE
Uk1fVkdFTSAjIHVzZWQgYnkgaWd0L3ByaW1lX3ZnZW0gKGRtYWJ1ZiBpbnRlcm9wIGNoZWNrcykK
ICAgICAgICAgc2VsZWN0IERSTV9ERUJVR19NTSBpZiBEUk09eQogCXNlbGVjdCBEUk1fREVCVUdf
U0VMRlRFU1QKKwlzZWxlY3QgRE1BQlVGX1NFTEZURVNUUwogCXNlbGVjdCBTV19TWU5DICMgc2ln
bmFsaW5nIHZhbGlkYXRpb24gZnJhbWV3b3JrIChpZ3Qvc3luY29iaiopCiAJc2VsZWN0IERSTV9J
OTE1X1NXX0ZFTkNFX0RFQlVHX09CSkVDVFMKIAlzZWxlY3QgRFJNX0k5MTVfU0VMRlRFU1QKLS0g
CjIuMjMuMC5yYzEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
