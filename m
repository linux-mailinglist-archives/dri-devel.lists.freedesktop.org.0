Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF784D2892
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 14:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7017F893E8;
	Thu, 10 Oct 2019 12:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4ECD6EB21
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 12:00:18 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9AC0E20043506;
 Thu, 10 Oct 2019 07:00:14 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9AC0Eia029493
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Oct 2019 07:00:14 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 07:00:14 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 07:00:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9AC0DMT121821;
 Thu, 10 Oct 2019 07:00:14 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v5 6/8] drm/omap: cleanup OMAP_BO_SCANOUT use
Date: Thu, 10 Oct 2019 13:59:58 +0200
Message-ID: <20191010120000.1421-7-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191010120000.1421-1-jjhiblot@ti.com>
References: <20191010120000.1421-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570708814;
 bh=WO7S52qVjOi/md3ys9yvPOEVZOSvBlURQm/5m1MTQPg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=duHllezZz41eIOIGAyDjySC+OV8vVcUsgn/glW5Zfyu9V+e0NVSEPO3niXzc9sVYu
 qOjDtCjg0wEuCAamXjbnuDqLbMLTsrCOr4UZ0vNgb7mhgrSLlt3pdBv9QGcpHwn1Do
 KSBRUcvI3cia/pit05hWCSj+JfvnWEL5YhJfJw98=
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
Cc: jjhiblot@ti.com, jsarha@ti.com, dri-devel@lists.freedesktop.org
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
cF9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2VtLmMKaW5kZXggNGU4ZmNm
ZGZmM2EwLi4yN2UwYTJmODUwOGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJt
L29tYXBfZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYwpAQCAt
MTE1NSw3ICsxMTU1LDYgQEAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvbWFwX2dlbV9uZXcoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwKIAkJICogVGlsZWQgYnVmZmVycyBhcmUgYWx3YXlzIHNobWVt
IHBhZ2VkIGJhY2tlZC4gV2hlbiB0aGV5IGFyZQogCQkgKiBzY2FubmVkIG91dCwgdGhleSBhcmUg
cmVtYXBwZWQgaW50byBETU0vVElMRVIuCiAJCSAqLwotCQlmbGFncyAmPSB+T01BUF9CT19TQ0FO
T1VUOwogCQlmbGFncyB8PSBPTUFQX0JPX01FTV9TSE1FTTsKIAogCQkvKgpAQCAtMTE2Niw5ICsx
MTY1LDggQEAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvbWFwX2dlbV9uZXcoc3RydWN0IGRybV9k
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
