Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4D5D288C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 14:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E6B6EB0D;
	Thu, 10 Oct 2019 12:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A842C6EB0D
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 12:00:10 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9AC07sd041423;
 Thu, 10 Oct 2019 07:00:07 -0500
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9AC07VL059051
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Oct 2019 07:00:07 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 07:00:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 07:00:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9AC06Op108555;
 Thu, 10 Oct 2019 07:00:06 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v5 0/8] drm/omap: OMAP_BO flags
Date: Thu, 10 Oct 2019 13:59:52 +0200
Message-ID: <20191010120000.1421-1-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570708807;
 bh=6rfJk44f4zWtQe2VY3mIni444unb0M6ecSkV0GR07F4=;
 h=From:To:CC:Subject:Date;
 b=MhGWpO/K1MW4G6ESk6vorZ3mxDhV7fZG0Qz2mCPzx5neyc4occJDULS+3lWkmTwuh
 9gIHAejt4OkH3dVelebm1COcj1z2wVZbgzLLsaJHe4WYzbj2lNFtdS/klyNYl3fnog
 SVFuHrIzbqxbPdg48vDmkmgz59DBjTZ0rsfJNbMA=
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
Z2VkLgoKSkoKCmNoYW5nZXMgaW4gdjU6Ci0gdXNlIGRtYV9mcmVlX3djKCkgaW5zdGVhZCBvZiBk
bWFfZnJlZV93cml0ZWNvbWJpbmUoKS4gVGhpcyByZXZlcnRzCiAgYW4gdW5pbnRlbmRlZCBjaGFu
Z2UgaW50cm9kdWNlZCBpbiB2NC4KCmNoYW5nZXMgaW4gdjQ6Ci0gZml4ZWQgaW5jcmVtZW50YWwg
YnVpbGQgaXNzdWUgaW50cm9kdWNlZCBieSBwYXRjaCAjMSBhbmQgbGF0ZXIgZml4ZWQgYnkKICBw
YXRjaCAjMi4KLSBBZGRlZCBteSByZXZpZXdlZC1ieSB0byBUb21pcydzIHBhdGNoCgpjaGFuZ2Vz
IGluIHYzOgotIHJlYmFzZSBvbiB0b3Agb2YgdjUuNC1yYzIKLSBEb2N1bWVudCBvbWFwX2dlbV9u
ZXcoKSBhbmQgdGhlIG5ldyBmbGFncyB1c2luZyB0aGUga2VybmVsLWRvYyBmb3JtYXQKCmNoYW5n
ZXMgaW4gdjI6Ci0gZml4ZWQgYnVpbGQgZXJyb3IgdGhhdCBjcmVwdCBpbiBkdXJpbmcgcmViYXNl
IGJlZm9yZSBzZW5kaW5nIChzb3JyeQogIGFib3V0IHRoYXQpCi0gcmV3b3JrIHRoZSByZWZjb3Vu
dCBwYXJ0IGEgYml0LgoKSmVhbi1KYWNxdWVzIEhpYmxvdCAoMSk6CiAgZHJtL29tYXA6IHVzZSBy
ZWZjb3VudCBBUEkgdG8gdHJhY2sgdGhlIG51bWJlciBvZiB1c2VycyBvZiBkbWFfYWRkcgoKVG9t
aSBWYWxrZWluZW4gKDcpOgogIGRybS9vbWFwOiBhZGQgb21hcF9nZW1fdW5waW5fbG9ja2VkKCkK
ICBkcm0vb21hcDogYWNjZXB0IE5VTEwgZm9yIGRtYV9hZGRyIGluIG9tYXBfZ2VtX3BpbgogIGRy
bS9vbWFwOiBjbGVhbnVwIE9NQVBfQk8gZmxhZ3MKICBkcm0vb21hcDogcmVtb3ZlIE9NQVBfQk9f
VElMRUQgZGVmaW5lCiAgZHJtL29tYXA6IGNsZWFudXAgT01BUF9CT19TQ0FOT1VUIHVzZQogIGRy
bS9vbWFwOiBhZGQgb21hcF9nZW1fdmFsaWRhdGVfZmxhZ3MoKQogIGRybS9vbWFwOiBhZGQgT01B
UF9CTyBmbGFncyB0byBhZmZlY3QgYnVmZmVyIGFsbG9jYXRpb24KCiBkcml2ZXJzL2dwdS9kcm0v
b21hcGRybS9vbWFwX2RtbV90aWxlci5oICB8ICAgMiArLQogZHJpdmVycy9ncHUvZHJtL29tYXBk
cm0vb21hcF9mYi5jICAgICAgICAgfCAgIDYgKy0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29t
YXBfZ2VtLmMgICAgICAgIHwgMTkxICsrKysrKysrKysrKysrKystLS0tLS0KIGRyaXZlcnMvZ3B1
L2RybS9vbWFwZHJtL29tYXBfZ2VtX2RtYWJ1Zi5jIHwgICAyICstCiBpbmNsdWRlL3VhcGkvZHJt
L29tYXBfZHJtLmggICAgICAgICAgICAgICB8ICAyNyArKy0KIDUgZmlsZXMgY2hhbmdlZCwgMTY0
IGluc2VydGlvbnMoKyksIDY0IGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
