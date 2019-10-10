Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F5CD267A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 11:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640956EADE;
	Thu, 10 Oct 2019 09:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E595B6EACB
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 09:35:09 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9A9Z7wZ013270;
 Thu, 10 Oct 2019 04:35:07 -0500
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9A9Z7QK010949
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Oct 2019 04:35:07 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 04:35:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 04:35:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9A9Z5r9126393;
 Thu, 10 Oct 2019 04:35:06 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v4 0/8] drm/omap: OMAP_BO flags
Date: Thu, 10 Oct 2019 11:34:37 +0200
Message-ID: <20191010093445.11069-1-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570700107;
 bh=5XXbYI00WWlznELN0O6qsM7Z9bRL4YNi7N1tsQ2ZodU=;
 h=From:To:CC:Subject:Date;
 b=Cr2DIHShRiborrQsJ3GBG1dSDhStN+mI86MXRJdltDuxJgtT39VUpLasVEAG5/dji
 x1VL8y3NLXeYrN1XJSt+zursVi+e2+1zKRPHdD3GbSTZegvDLrc5BDMlwXCep5gHYz
 SFhsMfZN7/GnJP+YEElfE4Gv/fVtv1J2ILFk6IQs=
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
Cc: Jean-Jacques Hiblot <jjhiblot@ti.com>, jsarha@ti.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QSBmaXJzdCB2ZXJzaW9uIG9mIHRoaXMgd29yayBoYWQgYmVlbiBzZW50IGJ5IFRvbWkgVmFsa2Vp
bmVuIGluIG1heSAyMDE3IAooaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvZHJpLWRldmVs
L21zZzE0MDY2My5odG1sKS4KClRoaXMgc2VyaWVzIGFkZHMgYSBmZXcgbmV3IE9NQVBfQk8gZmxh
Z3MgdG8gaGVscCB0aGUgdXNlcnNwYWNlIG1hbmFnZQpzaXR1YXRpb25zIHdoZXJlIGl0IG5lZWRz
IHRvIHVzZSBsb3RzIG9mIGJ1ZmZlcnMsIGFuZCB3b3VsZCBjdXJyZW50bHkgcnVuCm91dCBvZiBU
SUxFUiBzcGFjZS4gVGhlIFRJTEVSIHNwYWNlIGlzIGxpbWl0ZWQgdG8gbWFwcGluZyAxMjhNQiBh
dCBhbnkgZ2l2ZW4KdGltZSBhbmQgc29tZSBhcHBsaWNhdGlvbnMgbWlnaHQgbmVlZCBtb3JlLgoK
VGhpcyBzZXJlcyBpcyBhbHNvIHRoZSBvcHBvcnR1bml0eSB0byBkbyBzb21lIGNsZWFudXAgaW4g
dGhlIGZsYWdzIGFuZAppbXByb3ZlIHRoZSBjb21tZW50cyBkZXNjcmliaW5nIHRoZW0uCgpUaGUg
dXNlci1zcGFjZSBwYXRjaGVzIGZvciBsaWJkcm0sIGFsdGhvdWdoIHJlYWR5LCBoYXZlbid0IGJl
ZW4gcG9zdGVkIHlldC4KSXQgd2lsbCBiZSBiZSBkb25lIHdoZW4gdGhpcyBzZXJpZXMgaGF2ZSBi
ZWVuIGRpc2N1c3NlZCBhbmQgaG9wZWZ1bGx5IGluCnRoZSBwcm9jZXNzIG9mIGdldHRpbmcgbWVy
Z2VkLgoKSkoKCmNoYW5nZXMgaW4gdjQ6Ci0gZml4ZWQgaW5jcmVtZW50YWwgYnVpbGQgaXNzdWUg
aW50cm9kdWNlZCBieSBwYXRjaCAjMSBhbmQgbGF0ZXIgZml4ZWQgYnkKICBwYXRjaCAjMi4KLSBB
ZGRlZCBteSByZXZpZXdlZC1ieSB0byBUb21pcydzIHBhdGNoCgpjaGFuZ2VzIGluIHYzOgotIHJl
YmFzZSBvbiB0b3Agb2YgdjUuNC1yYzIKLSBEb2N1bWVudCBvbWFwX2dlbV9uZXcoKSBhbmQgdGhl
IG5ldyBmbGFncyB1c2luZyB0aGUga2VybmVsLWRvYyBmb3JtYXQKCmNoYW5nZXMgaW4gdjI6Ci0g
Zml4ZWQgYnVpbGQgZXJyb3IgdGhhdCBjcmVwdCBpbiBkdXJpbmcgcmViYXNlIGJlZm9yZSBzZW5k
aW5nIChzb3JyeQogIGFib3V0IHRoYXQpCi0gcmV3b3JrIHRoZSByZWZjb3VudCBwYXJ0IGEgYml0
LgoKSmVhbi1KYWNxdWVzIEhpYmxvdCAoMSk6CiAgZHJtL29tYXA6IHVzZSByZWZjb3VudCBBUEkg
dG8gdHJhY2sgdGhlIG51bWJlciBvZiB1c2VycyBvZiBkbWFfYWRkcgoKVG9taSBWYWxrZWluZW4g
KDcpOgogIGRybS9vbWFwOiBhZGQgb21hcF9nZW1fdW5waW5fbG9ja2VkKCkKICBkcm0vb21hcDog
YWNjZXB0IE5VTEwgZm9yIGRtYV9hZGRyIGluIG9tYXBfZ2VtX3BpbgogIGRybS9vbWFwOiBjbGVh
bnVwIE9NQVBfQk8gZmxhZ3MKICBkcm0vb21hcDogcmVtb3ZlIE9NQVBfQk9fVElMRUQgZGVmaW5l
CiAgZHJtL29tYXA6IGNsZWFudXAgT01BUF9CT19TQ0FOT1VUIHVzZQogIGRybS9vbWFwOiBhZGQg
b21hcF9nZW1fdmFsaWRhdGVfZmxhZ3MoKQogIGRybS9vbWFwOiBhZGQgT01BUF9CTyBmbGFncyB0
byBhZmZlY3QgYnVmZmVyIGFsbG9jYXRpb24KCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFw
X2RtbV90aWxlci5oICB8ICAgMiArLQogZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9mYi5j
ICAgICAgICAgfCAgIDYgKy0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2VtLmMgICAg
ICAgIHwgMTkxICsrKysrKysrKysrKysrKystLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJt
L29tYXBfZ2VtX2RtYWJ1Zi5jIHwgICAyICstCiBpbmNsdWRlL3VhcGkvZHJtL29tYXBfZHJtLmgg
ICAgICAgICAgICAgICB8ICAyNyArKy0KIDUgZmlsZXMgY2hhbmdlZCwgMTY0IGluc2VydGlvbnMo
KyksIDY0IGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
