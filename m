Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B13F5D267C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 11:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B306EAE1;
	Thu, 10 Oct 2019 09:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FEAD6EADC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 09:35:12 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9A9ZAoq007940;
 Thu, 10 Oct 2019 04:35:10 -0500
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9A9ZATj118475
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Oct 2019 04:35:10 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 04:35:10 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 04:35:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9A9Z91I013241;
 Thu, 10 Oct 2019 04:35:10 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v4 3/8] drm/omap: accept NULL for dma_addr in omap_gem_pin
Date: Thu, 10 Oct 2019 11:34:40 +0200
Message-ID: <20191010093445.11069-4-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191010093445.11069-1-jjhiblot@ti.com>
References: <20191010093445.11069-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570700110;
 bh=BGD4E2M5dmRS1t3Z+6V//s+uSJyTYNPcVeFAaQ+oob8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=F9EIsb8UfCCqMFDoXbDkhfpxv2DvPHV/YJK94FpfcZNiicUuQILBMkpzYz+fdpf10
 ZBwuYwVzubSPfhGetDA0KW63Cf1e3OIi/pWVG9ncgBBW29v2dBC92c3vc9zGoK8rIH
 gl49dB5FFj7X7DE3KEnCBzkZopm5sxiepd8vy6KM=
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
IFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgpSZXZpZXdlZC1ieTogSmVhbi1KYWNx
dWVzIEhpYmxvdCA8ampoaWJsb3RAdGkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJt
L29tYXBfZ2VtLmMgfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFw
X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYwppbmRleCAzMDcxZTgx
NWRhNzMuLjJhYzgzY2RiYjE1YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0v
b21hcF9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jCkBAIC04
MTcsOSArODE3LDExIEBAIGludCBvbWFwX2dlbV9waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpv
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
