Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9577ACE05A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 13:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB8B16E570;
	Mon,  7 Oct 2019 11:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162A26E55C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 11:26:10 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97BQ8GM012430;
 Mon, 7 Oct 2019 06:26:08 -0500
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x97BQ83u124991
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 7 Oct 2019 06:26:08 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 06:26:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 06:26:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97BQ7x8112537;
 Mon, 7 Oct 2019 06:26:07 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v3 6/8] drm/omap: cleanup OMAP_BO_SCANOUT use
Date: Mon, 7 Oct 2019 13:25:53 +0200
Message-ID: <20191007112555.25278-7-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007112555.25278-1-jjhiblot@ti.com>
References: <20191007112555.25278-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570447568;
 bh=CbuNmEnB2erZcSKsNRA3W8NuhRVjnNwkokITxNfB2pE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=uc0+Wdm5t5Pg/vz4t9p6ULRCA5pRQ/TSj0nQePXnS6uiaZL6OKTs+Fl0cVK3q50o8
 Cyjy188eePKKT+cboHEukDwVpaU7LCR7Rb3fW9AlNYiKo1PKRS73JvvFdeTSeoC/hx
 Um68OnyeTVMZlPFwBlPZaCom6ouKQdyRzbCBzePI=
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
aSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
b21hcGRybS9vbWFwX2dlbS5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBk
cm0vb21hcF9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2VtLmMKaW5kZXgg
NGU4ZmNmZGZmM2EwLi4yN2UwYTJmODUwOGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9v
bWFwZHJtL29tYXBfZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0u
YwpAQCAtMTE1NSw3ICsxMTU1LDYgQEAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvbWFwX2dlbV9u
ZXcoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJICogVGlsZWQgYnVmZmVycyBhcmUgYWx3YXlz
IHNobWVtIHBhZ2VkIGJhY2tlZC4gV2hlbiB0aGV5IGFyZQogCQkgKiBzY2FubmVkIG91dCwgdGhl
eSBhcmUgcmVtYXBwZWQgaW50byBETU0vVElMRVIuCiAJCSAqLwotCQlmbGFncyAmPSB+T01BUF9C
T19TQ0FOT1VUOwogCQlmbGFncyB8PSBPTUFQX0JPX01FTV9TSE1FTTsKIAogCQkvKgpAQCAtMTE2
Niw5ICsxMTY1LDggQEAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvbWFwX2dlbV9uZXcoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwKIAkJZmxhZ3MgfD0gdGlsZXJfZ2V0X2NwdV9jYWNoZV9mbGFncygp
OwogCX0gZWxzZSBpZiAoKGZsYWdzICYgT01BUF9CT19TQ0FOT1VUKSAmJiAhcHJpdi0+aGFzX2Rt
bSkgewogCQkvKgotCQkgKiBPTUFQX0JPX1NDQU5PVVQgaGludHMgdGhhdCB0aGUgYnVmZmVyIGRv
ZXNuJ3QgbmVlZCB0byBiZQotCQkgKiB0aWxlZC4gSG93ZXZlciwgdG8gbG93ZXIgdGhlIHByZXNz
dXJlIG9uIG1lbW9yeSBhbGxvY2F0aW9uLAotCQkgKiB1c2UgY29udGlndW91cyBtZW1vcnkgb25s
eSBpZiBubyBUSUxFUiBpcyBhdmFpbGFibGUuCisJCSAqIElmIHdlIGRvbid0IGhhdmUgRE1NLCB3
ZSBtdXN0IGFsbG9jYXRlIHNjYW5vdXQgYnVmZmVycworCQkgKiBmcm9tIGNvbnRpZ3VvdXMgRE1B
IG1lbW9yeS4KIAkJICovCiAJCWZsYWdzIHw9IE9NQVBfQk9fTUVNX0RNQV9BUEk7CiAJfSBlbHNl
IGlmICghKGZsYWdzICYgT01BUF9CT19NRU1fRE1BQlVGKSkgewotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
