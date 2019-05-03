Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D855513134
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 17:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBF56E7F9;
	Fri,  3 May 2019 15:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 235486E7F9
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 15:32:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 080B2165C;
 Fri,  3 May 2019 08:32:04 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
 [10.1.196.75])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BBB323F557;
 Fri,  3 May 2019 08:32:02 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: robh@kernel.org,
	tomeu.vizoso@collabora.com
Subject: [PATCH 4/4] drm/panfrost: Show stored feature registers
Date: Fri,  3 May 2019 16:31:45 +0100
Message-Id: <ce5e414adb008baeed9e2ceb9c88f28d5c74ea42.1556195258.git.robin.murphy@arm.com>
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

UmUtcmVhZGluZyB0aGUgZmVhdHVyZSByZWdpc3RlcnMgZm9yIHRoZSBzYWtlIG9mIGRpc3BsYXlp
bmcgdGhlIHJhdwp2YWx1ZXMgc2VlbXMgcG9pbnRsZXNzLCBhbmQgaW4gZmFjdCBzaG93aW5nIHRo
ZSBjb3BpZXMgdGhhdCB3ZSd2ZQphbHJlYWR5IHJlYWQgYW5kIHN0b3JlZCBpcyBhcmd1YWJseSBt
b3JlIHVzZWZ1bCBpbiB0ZXJtcyBvZiBnaXZpbmcKZXhwb3N1cmUgdG8gYW55IHBvdGVudGlhbCBi
dWdzIGluIHRoYXQgcGFydCBvZiB0aGUgcHJvY2Vzcy4KClNpZ25lZC1vZmYtYnk6IFJvYmluIE11
cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0
L3BhbmZyb3N0X2dwdS5jIHwgMTQgKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2dwdS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X2dwdS5jCmluZGV4IDQyNTExZmMxZmVhMC4uNThlZjI1NTczY2RhIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ3B1LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dwdS5jCkBAIC0yNzgsMTMgKzI3OCwxMyBAQCBzdGF0aWMg
dm9pZCBwYW5mcm9zdF9ncHVfaW5pdF9mZWF0dXJlcyhzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpw
ZmRldikKIAkJIHBmZGV2LT5mZWF0dXJlcy5od19pc3N1ZXMpOwogCiAJZGV2X2luZm8ocGZkZXYt
PmRldiwgIkZlYXR1cmVzOiBMMjoweCUwOHggU2hhZGVyOjB4JTA4eCBUaWxlcjoweCUwOHggTWVt
OjB4JTB4IE1NVToweCUwOHggQVM6MHgleCBKUzoweCV4IiwKLQkJIGdwdV9yZWFkKHBmZGV2LCBH
UFVfTDJfRkVBVFVSRVMpLAotCQkgZ3B1X3JlYWQocGZkZXYsIEdQVV9DT1JFX0ZFQVRVUkVTKSwK
LQkJIGdwdV9yZWFkKHBmZGV2LCBHUFVfVElMRVJfRkVBVFVSRVMpLAotCQkgZ3B1X3JlYWQocGZk
ZXYsIEdQVV9NRU1fRkVBVFVSRVMpLAotCQkgZ3B1X3JlYWQocGZkZXYsIEdQVV9NTVVfRkVBVFVS
RVMpLAotCQkgZ3B1X3JlYWQocGZkZXYsIEdQVV9BU19QUkVTRU5UKSwKLQkJIGdwdV9yZWFkKHBm
ZGV2LCBHUFVfSlNfUFJFU0VOVCkpOworCQkgcGZkZXYtPmZlYXR1cmVzLmwyX2ZlYXR1cmVzLAor
CQkgcGZkZXYtPmZlYXR1cmVzLmNvcmVfZmVhdHVyZXMsCisJCSBwZmRldi0+ZmVhdHVyZXMudGls
ZXJfZmVhdHVyZXMsCisJCSBwZmRldi0+ZmVhdHVyZXMubWVtX2ZlYXR1cmVzLAorCQkgcGZkZXYt
PmZlYXR1cmVzLm1tdV9mZWF0dXJlcywKKwkJIHBmZGV2LT5mZWF0dXJlcy5hc19wcmVzZW50LAor
CQkgcGZkZXYtPmZlYXR1cmVzLmpzX3ByZXNlbnQpOwogCiAJZGV2X2luZm8ocGZkZXYtPmRldiwg
InNoYWRlcl9wcmVzZW50PTB4JTBsbHggbDJfcHJlc2VudD0weCUwbGx4IiwKIAkJIHBmZGV2LT5m
ZWF0dXJlcy5zaGFkZXJfcHJlc2VudCwgcGZkZXYtPmZlYXR1cmVzLmwyX3ByZXNlbnQpOwotLSAK
Mi4yMS4wLmRpcnR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
