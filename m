Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2A361D32
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 12:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC2D89C63;
	Mon,  8 Jul 2019 10:45:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB7B893A7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 10:45:29 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x68AjR4B050856;
 Mon, 8 Jul 2019 05:45:27 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x68AjRk9089582
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 8 Jul 2019 05:45:27 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 8 Jul
 2019 05:45:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 8 Jul 2019 05:45:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x68AjQGk094753;
 Mon, 8 Jul 2019 05:45:26 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 0/8] drm/omap: OMAP_BO flags
Date: Mon, 8 Jul 2019 12:45:12 +0200
Message-ID: <20190708104520.24217-1-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562582727;
 bh=DiC/XfhuuSqxqM1gkCSmMrWYGm0YGOMJqkBzjTlG5YM=;
 h=From:To:CC:Subject:Date;
 b=qSUDQ/Ll4U4OO8iB1DK87xuIhmbODP9OfknHGUWKNUTEIp+oNnSzyWMr2uioxTAYb
 u75Yf+7vE3YAtIxWOT35X1NDl+HKMSgWtZSK1LsOpddprEa/o4651pjGt6h/4NTfrx
 sMoRj5TNVBsiqBQwSLuiGPd4TLs7opWhcebBvXBE=
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
Cc: Jean-Jacques Hiblot <jjhiblot@ti.com>, jsarha@ti.com
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
Z2VkLgoKSkoKCmNoYW5nZXMgaW4gdjI6Ci0gZml4ZWQgYnVpbGQgZXJyb3IgdGhhdCBjcmVwdCBp
biBkdXJpbmcgcmViYXNlIGJlZm9yZSBzZW5kaW5nIChzb3JyeQogIGFib3V0IHRoYXQpCi0gcmV3
b3JrIHRoZSByZWZjb3VudCBwYXJ0IGEgYml0LgoKSmVhbi1KYWNxdWVzIEhpYmxvdCAoMSk6CiAg
ZHJtL29tYXA6IHVzZSByZWZjb3VudCBBUEkgdG8gdHJhY2sgdGhlIG51bWJlciBvZiB1c2VycyBv
ZiBkbWFfYWRkcgoKVG9taSBWYWxrZWluZW4gKDcpOgogIGRybS9vbWFwOiBhZGQgb21hcF9nZW1f
dW5waW5fbG9ja2VkKCkKICBkcm0vb21hcDogYWNjZXB0IE5VTEwgZm9yIGRtYV9hZGRyIGluIG9t
YXBfZ2VtX3BpbgogIGRybS9vbWFwOiBjbGVhbnVwIE9NQVBfQk8gZmxhZ3MKICBkcm0vb21hcDog
cmVtb3ZlIE9NQVBfQk9fVElMRUQgZGVmaW5lCiAgZHJtL29tYXA6IGNsZWFudXAgT01BUF9CT19T
Q0FOT1VUIHVzZQogIGRybS9vbWFwOiBhZGQgb21hcF9nZW1fdmFsaWRhdGVfZmxhZ3MoKQogIGRy
bS9vbWFwOiBhZGQgT01BUF9CTyBmbGFncyB0byBhZmZlY3QgYnVmZmVyIGFsbG9jYXRpb24KCiBk
cml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2RtbV90aWxlci5oICB8ICAgMiArLQogZHJpdmVy
cy9ncHUvZHJtL29tYXBkcm0vb21hcF9mYi5jICAgICAgICAgfCAgIDYgKy0KIGRyaXZlcnMvZ3B1
L2RybS9vbWFwZHJtL29tYXBfZ2VtLmMgICAgICAgIHwgMTYyICsrKysrKysrKysrKysrKy0tLS0t
LS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2VtX2RtYWJ1Zi5jIHwgICAyICstCiBp
bmNsdWRlL3VhcGkvZHJtL29tYXBfZHJtLmggICAgICAgICAgICAgICB8ICAyNyArKy0tCiA1IGZp
bGVzIGNoYW5nZWQsIDEzNiBpbnNlcnRpb25zKCspLCA2MyBkZWxldGlvbnMoLSkKCi0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
