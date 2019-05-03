Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A95601312E
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 17:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231346E7F4;
	Fri,  3 May 2019 15:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id EB0976E7F4
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 15:31:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB976374;
 Fri,  3 May 2019 08:31:57 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
 [10.1.196.75])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 80C323F557;
 Fri,  3 May 2019 08:31:56 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: robh@kernel.org,
	tomeu.vizoso@collabora.com
Subject: [PATCH 0/4] drm/panfrost: Misc. fixes and cleanups
Date: Fri,  3 May 2019 16:31:41 +0100
Message-Id: <cover.1556195258.git.robin.murphy@arm.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpUaGVzZSBhcmUgYSBmZXcgdHJpdmlhbCBmaXhlcyBhbmQgY2xlYW51cHMgZnJvbSBwbGF5
aW5nIHdpdGggdGhlCnBhbmZyb3N0IGtlcm5lbCBkcml2ZXIgb24gYW4gQXJtIEp1bm8gYm9hcmQu
IE5vdCB0aGF0IGFueW9uZSBoYXMgZXZlcgpjYXJlZCBtdWNoIGFib3V0IHRoZSBidWlsdC1pbiBH
UFUgb24gSnVubywgYnV0IGl0J3MgYXQgbGVhc3QgYSBzb21ld2hhdAppbnRlcmVzdGluZyBwbGF0
Zm9ybSBmcm9tIHRoZSBrZXJuZWwgZHJpdmVyIHBlcnNwZWN0aXZlIGZvciBoYXZpbmcKSS9PIGNv
aGVyZW5jeSwgUkFNIGFib3ZlIDRHQiwgYW5kIERWRlMgYWJzdHJhY3RlZCBiZWhpbmQgYSBmaXJt
d2FyZQppbnRlcmZhY2UuCgpSb2Jpbi4KCgpSb2JpbiBNdXJwaHkgKDQpOgogIGRybS9wYW5mcm9z
dDogU2V0IERNQSBtYXNrcyBlYXJsaWVyCiAgZHJtL3BhbmZyb3N0OiBEaXNhYmxlIFBNIG9uIHBy
b2JlIGZhaWx1cmUKICBkcm0vcGFuZnJvc3Q6IERvbid0IHNjcmVhbSBhYm91dCBkZWZlcnJlZCBw
cm9iZQogIGRybS9wYW5mcm9zdDogU2hvdyBzdG9yZWQgZmVhdHVyZSByZWdpc3RlcnMKCiBkcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgfCAxMiArKysrKy0tLS0tLS0KIGRy
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9ncHUuYyB8IDE5ICsrKysrKysrKysrKy0t
LS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0p
CgotLSAKMi4yMS4wLmRpcnR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
