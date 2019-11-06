Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE2CF1873
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 15:24:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623246ED7E;
	Wed,  6 Nov 2019 14:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C376ED74;
 Wed,  6 Nov 2019 14:24:39 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 19103026-1500050 
 for multiple; Wed, 06 Nov 2019 14:24:34 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/5] drm: Move EXPORT_SYMBOL_FOR_TESTS_ONLY under a
 separate Kconfig
Date: Wed,  6 Nov 2019 14:24:28 +0000
Message-Id: <20191106142432.14022-2-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191106142432.14022-1-chris@chris-wilson.co.uk>
References: <20191106142432.14022-1-chris@chris-wilson.co.uk>
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

Q3VycmVudGx5LCB3ZSBvbmx5IGV4cG9ydCBzeW1ib2xzIGZvciBkcm0tc2VsZnRlc3RzIHdoaWNo
IGFyZSBlaXRoZXIKY29tcGlsZWQgYXMgbW9kdWxlcyBvciBpbnRvIHRoZSBtYWluIGRybSBidWls
dGluLiBIb3dldmVyLCBpZiB3ZSB3YW50IHRvCmV4cG9ydCBzeW1ib2xzIGZyb20gZHJtLmtvIGZv
ciB0aGUgZHJpdmVycycgc2VsZnRlc3RzLCB3ZSByZXF1aXJlIGEKbWVhbnMgb2YgY29udHJvbGxp
bmcgdGhhdCBleHBvcnQgc2VwYXJhdGVseS4gU28gd2UgYWRkIGEgbmV3IEtjb25maWcgdG8KZGV0
ZXJtaW5lIHdoZXRoZXIgb3Igbm90IHRoZSBFWFBPUlRfU1lNQk9MX0ZPUl9URVNUU19PTkxZKCkg
dGFrZXMKZWZmZWN0LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13
aWxzb24uY28udWs+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9LY29uZmlnIHwgNCArKysrCiBpbmNsdWRlL2RybS9kcm1fdXRp
bC5oICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWcgYi9kcml2ZXJzL2dwdS9k
cm0vS2NvbmZpZwppbmRleCA2MTdkOWMzYTg2YzMuLmQzNTYwYWZlMzRkMyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL0tjb25maWcKKysrIGIvZHJpdmVycy9ncHUvZHJtL0tjb25maWcKQEAg
LTU0LDYgKzU0LDkgQEAgY29uZmlnIERSTV9ERUJVR19NTQogCiAJICBJZiBpbiBkb3VidCwgc2F5
ICJOIi4KIAorY29uZmlnIERSTV9FWFBPUlRfRk9SX1RFU1RTCisJYm9vbAorCiBjb25maWcgRFJN
X0RFQlVHX1NFTEZURVNUCiAJdHJpc3RhdGUgImtzZWxmdGVzdHMgZm9yIERSTSIKIAlkZXBlbmRz
IG9uIERSTQpAQCAtNjEsNiArNjQsNyBAQCBjb25maWcgRFJNX0RFQlVHX1NFTEZURVNUCiAJc2Vs
ZWN0IFBSSU1FX05VTUJFUlMKIAlzZWxlY3QgRFJNX0xJQl9SQU5ET00KIAlzZWxlY3QgRFJNX0tN
U19IRUxQRVIKKwlzZWxlY3QgRFJNX0VYUE9SVF9GT1JfVEVTVFMgaWYgbQogCWRlZmF1bHQgbgog
CWhlbHAKIAkgIFRoaXMgb3B0aW9uIHByb3ZpZGVzIGtlcm5lbCBtb2R1bGVzIHRoYXQgY2FuIGJl
IHVzZWQgdG8gcnVuCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fdXRpbC5oIGIvaW5jbHVk
ZS9kcm0vZHJtX3V0aWwuaAppbmRleCAwN2I4ZTlmMDQ1OTkuLjc5OTUyZDhjNGJiYSAxMDA2NDQK
LS0tIGEvaW5jbHVkZS9kcm0vZHJtX3V0aWwuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fdXRpbC5o
CkBAIC00MSw3ICs0MSw3IEBACiAgKiBVc2UgRVhQT1JUX1NZTUJPTF9GT1JfVEVTVFNfT05MWSgp
IGZvciBmdW5jdGlvbnMgdGhhdCBzaGFsbAogICogb25seSBiZSB2aXNpYmxlIGZvciBkcm1zZWxm
dGVzdHMuCiAgKi8KLSNpZiBkZWZpbmVkKENPTkZJR19EUk1fREVCVUdfU0VMRlRFU1RfTU9EVUxF
KQorI2lmIGRlZmluZWQoQ09ORklHX0RSTV9FWFBPUlRfRk9SX1RFU1RTKQogI2RlZmluZSBFWFBP
UlRfU1lNQk9MX0ZPUl9URVNUU19PTkxZKHgpIEVYUE9SVF9TWU1CT0woeCkKICNlbHNlCiAjZGVm
aW5lIEVYUE9SVF9TWU1CT0xfRk9SX1RFU1RTX09OTFkoeCkKLS0gCjIuMjQuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
