Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E321CE057
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 13:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA68D6E55C;
	Mon,  7 Oct 2019 11:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455A06E560
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 11:26:06 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97BQ4pT078200;
 Mon, 7 Oct 2019 06:26:04 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x97BQ4YW122236
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 7 Oct 2019 06:26:04 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 06:26:04 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 06:26:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97BQ3R4024262;
 Mon, 7 Oct 2019 06:26:04 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v3 3/8] drm/omap: accept NULL for dma_addr in omap_gem_pin
Date: Mon, 7 Oct 2019 13:25:50 +0200
Message-ID: <20191007112555.25278-4-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007112555.25278-1-jjhiblot@ti.com>
References: <20191007112555.25278-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570447564;
 bh=swFCLcggc3PLeThFKmM/gz3kCxyaq2iegVqXvgg6+yE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Ze4KsWBfRiDa4UzJgAaoPSYBZpdzJ5ywP2091bCcdEV7lG0WaHUMJ3xI2GsNzQdPS
 xwMMG7m3ziQ77puZLiNHTPsfpcr6Yu7lc2aKKmi66AIawm/sYIIIRxuIuj7AGjaC6r
 cBLkH0Xd+7Gi25bVsXe9zZyb9dtdP9/6Mo0Kx3Xk=
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

RnJvbTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KCkFsbG93IE5VTEwg
dG8gYmUgcGFzc2VkIGluICdkbWFfYWRkcicgZm9yIG9tYXBfZ2VtX3BpbigpLCBpbiBjYXNlIHRo
ZQpjYWxsZXIgZG9lcyBub3QgbmVlZCB0aGUgZG1hX2FkZHIuCgpTaWduZWQtb2ZmLWJ5OiBUb21p
IFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9v
bWFwZHJtL29tYXBfZ2VtLmMgfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRy
bS9vbWFwX2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYwppbmRleCA5
MjAxYzIxZTIwNmYuLmE2NTYyZDIzZDMxNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL29t
YXBkcm0vb21hcF9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5j
CkBAIC04MTksOSArODE5LDExIEBAIGludCBvbWFwX2dlbV9waW4oc3RydWN0IGRybV9nZW1fb2Jq
ZWN0ICpvYmosIGRtYV9hZGRyX3QgKmRtYV9hZGRyKQogCQkJcmVmY291bnRfaW5jKCZvbWFwX29i
ai0+ZG1hX2FkZHJfY250KTsKIAkJfQogCi0JCSpkbWFfYWRkciA9IG9tYXBfb2JqLT5kbWFfYWRk
cjsKKwkJaWYgKGRtYV9hZGRyKQorCQkJKmRtYV9hZGRyID0gb21hcF9vYmotPmRtYV9hZGRyOwog
CX0gZWxzZSBpZiAob21hcF9nZW1faXNfY29udGlndW91cyhvbWFwX29iaikpIHsKLQkJKmRtYV9h
ZGRyID0gb21hcF9vYmotPmRtYV9hZGRyOworCQlpZiAoZG1hX2FkZHIpCisJCQkqZG1hX2FkZHIg
PSBvbWFwX29iai0+ZG1hX2FkZHI7CiAJfSBlbHNlIHsKIAkJcmV0ID0gLUVJTlZBTDsKIAkJZ290
byBmYWlsOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
