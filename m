Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F715D288E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 14:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C283C6EB0C;
	Thu, 10 Oct 2019 12:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A542E6EB0C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 12:00:12 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9AC0BqL041446;
 Thu, 10 Oct 2019 07:00:11 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9AC0BDW059156
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Oct 2019 07:00:11 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 07:00:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 07:00:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9AC0AXv108678;
 Thu, 10 Oct 2019 07:00:10 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v5 3/8] drm/omap: accept NULL for dma_addr in omap_gem_pin
Date: Thu, 10 Oct 2019 13:59:55 +0200
Message-ID: <20191010120000.1421-4-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191010120000.1421-1-jjhiblot@ti.com>
References: <20191010120000.1421-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570708811;
 bh=xIiunsjj3AVSyCcVA+1k58+E1fmCTUOfcOOacQw/xYM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=gDP956vsHlORt0uo9oDvNXSKnvvcXWjYU6uiuGlFDoTs3XMQxbIdACuHPI45o7Y56
 EZ3boKbx3XTTCRsfsA4E0LTr9gZbK8xGDKi87hFACjpQdK0VuVm8/zc7sf0ZXrenum
 1tvQAt0eD9ZdrCe3aueDMVqJPGSjEvndpOxslB8w=
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

RnJvbTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KCkFsbG93IE5VTEwg
dG8gYmUgcGFzc2VkIGluICdkbWFfYWRkcicgZm9yIG9tYXBfZ2VtX3BpbigpLCBpbiBjYXNlIHRo
ZQpjYWxsZXIgZG9lcyBub3QgbmVlZCB0aGUgZG1hX2FkZHIuCgpTaWduZWQtb2ZmLWJ5OiBUb21p
IFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgpSZXZpZXdlZC1ieTogSmVhbi1KYWNx
dWVzIEhpYmxvdCA8ampoaWJsb3RAdGkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJt
L29tYXBfZ2VtLmMgfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFw
X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYwppbmRleCA5MjAxYzIx
ZTIwNmYuLmE2NTYyZDIzZDMxNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0v
b21hcF9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jCkBAIC04
MTksOSArODE5LDExIEBAIGludCBvbWFwX2dlbV9waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpv
YmosIGRtYV9hZGRyX3QgKmRtYV9hZGRyKQogCQkJcmVmY291bnRfaW5jKCZvbWFwX29iai0+ZG1h
X2FkZHJfY250KTsKIAkJfQogCi0JCSpkbWFfYWRkciA9IG9tYXBfb2JqLT5kbWFfYWRkcjsKKwkJ
aWYgKGRtYV9hZGRyKQorCQkJKmRtYV9hZGRyID0gb21hcF9vYmotPmRtYV9hZGRyOwogCX0gZWxz
ZSBpZiAob21hcF9nZW1faXNfY29udGlndW91cyhvbWFwX29iaikpIHsKLQkJKmRtYV9hZGRyID0g
b21hcF9vYmotPmRtYV9hZGRyOworCQlpZiAoZG1hX2FkZHIpCisJCQkqZG1hX2FkZHIgPSBvbWFw
X29iai0+ZG1hX2FkZHI7CiAJfSBlbHNlIHsKIAkJcmV0ID0gLUVJTlZBTDsKIAkJZ290byBmYWls
OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
