Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F16D267F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 11:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBE06EAE6;
	Thu, 10 Oct 2019 09:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FC16EAE1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 09:35:16 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9A9ZEgg120192;
 Thu, 10 Oct 2019 04:35:14 -0500
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9A9ZEnO078376;
 Thu, 10 Oct 2019 04:35:14 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 04:35:14 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 04:35:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9A9ZD9Q101119;
 Thu, 10 Oct 2019 04:35:13 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v4 6/8] drm/omap: cleanup OMAP_BO_SCANOUT use
Date: Thu, 10 Oct 2019 11:34:43 +0200
Message-ID: <20191010093445.11069-7-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191010093445.11069-1-jjhiblot@ti.com>
References: <20191010093445.11069-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570700114;
 bh=rT7lgp+iPdYWoFNcHP+SFY8dLqrQJTrJ5/YLc1B0CJ4=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=dS632yV1TMb1G2dlEWwbMwn21ZUHbUNf9OsuLk8Aoe4hTm+3q1d4OpSlZLru87DrQ
 u9DJSICgE+/tFuZ+nh+whmarXxgqGNWU2Ek6TjJ/7JQX5KEph731m9CEHqnJpO7Ddx
 KpU3NeeHRJDz/rt8hw1dgZX063ORvGklznqC4RIY=
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
Cc: jsarha@ti.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KCm9tYXBfZ2VtX25l
dygpIGhhcyBhIGNvbW1lbnQgYWJvdXQgT01BUF9CT19TQ0FOT1VUIHdoaWNoIGRvZXMgbm90IG1h
a2UKc2Vuc2UuIEFsc28sIGZvciB0aGUgVElMRVIgY2FzZSwgd2UgZHJvcCBPTUFQX0JPX1NDQU5P
VVQgZmxhZyBmb3Igc29tZQpyZWFzb24uCgpJdCdzIG5vdCBjbGVhciB3aGF0IHRoZSBvcmlnaW5h
bCBwdXJwb3NlIG9mIE9NQVBfQk9fU0NBTk9VVCBpcywgYnV0CnByZXN1bWluZyBpdCBtZWFucyAi
c2Nhbm91dCBidWZmZXIsIHNvbWV0aGluZyB0aGF0IGNhbiBiZSBjb25zdW1lZCBieQpEU1MiLCB0
aGlzIHBhdGNoIGNsZWFucyB1cCB0aGUgYWJvdmUgaXNzdWVzLgoKU2lnbmVkLW9mZi1ieTogVG9t
aSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KUmV2aWV3ZWQtYnk6IEplYW4tSmFj
cXVlcyBIaWJsb3QgPGpqaGlibG90QHRpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRy
bS9vbWFwX2dlbS5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21h
cF9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2VtLmMKaW5kZXggMDdkYmEz
MDBlYzA3Li41YzRjZGY2MTgzNDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJt
L29tYXBfZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYwpAQCAt
MTE1Myw3ICsxMTUzLDYgQEAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvbWFwX2dlbV9uZXcoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwKIAkJICogVGlsZWQgYnVmZmVycyBhcmUgYWx3YXlzIHNobWVt
IHBhZ2VkIGJhY2tlZC4gV2hlbiB0aGV5IGFyZQogCQkgKiBzY2FubmVkIG91dCwgdGhleSBhcmUg
cmVtYXBwZWQgaW50byBETU0vVElMRVIuCiAJCSAqLwotCQlmbGFncyAmPSB+T01BUF9CT19TQ0FO
T1VUOwogCQlmbGFncyB8PSBPTUFQX0JPX01FTV9TSE1FTTsKIAogCQkvKgpAQCAtMTE2NCw5ICsx
MTYzLDggQEAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvbWFwX2dlbV9uZXcoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwKIAkJZmxhZ3MgfD0gdGlsZXJfZ2V0X2NwdV9jYWNoZV9mbGFncygpOwogCX0g
ZWxzZSBpZiAoKGZsYWdzICYgT01BUF9CT19TQ0FOT1VUKSAmJiAhcHJpdi0+aGFzX2RtbSkgewog
CQkvKgotCQkgKiBPTUFQX0JPX1NDQU5PVVQgaGludHMgdGhhdCB0aGUgYnVmZmVyIGRvZXNuJ3Qg
bmVlZCB0byBiZQotCQkgKiB0aWxlZC4gSG93ZXZlciwgdG8gbG93ZXIgdGhlIHByZXNzdXJlIG9u
IG1lbW9yeSBhbGxvY2F0aW9uLAotCQkgKiB1c2UgY29udGlndW91cyBtZW1vcnkgb25seSBpZiBu
byBUSUxFUiBpcyBhdmFpbGFibGUuCisJCSAqIElmIHdlIGRvbid0IGhhdmUgRE1NLCB3ZSBtdXN0
IGFsbG9jYXRlIHNjYW5vdXQgYnVmZmVycworCQkgKiBmcm9tIGNvbnRpZ3VvdXMgRE1BIG1lbW9y
eS4KIAkJICovCiAJCWZsYWdzIHw9IE9NQVBfQk9fTUVNX0RNQV9BUEk7CiAJfSBlbHNlIGlmICgh
KGZsYWdzICYgT01BUF9CT19NRU1fRE1BQlVGKSkgewotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
