Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA737CE054
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 13:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E2F6E560;
	Mon,  7 Oct 2019 11:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142CF6E55C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 11:26:04 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97BQ1uO078179;
 Mon, 7 Oct 2019 06:26:01 -0500
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97BQ11p037759;
 Mon, 7 Oct 2019 06:26:01 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 06:25:58 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 06:25:58 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97BPxFA003782;
 Mon, 7 Oct 2019 06:26:00 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v3 0/8] drm/omap: OMAP_BO flags
Date: Mon, 7 Oct 2019 13:25:47 +0200
Message-ID: <20191007112555.25278-1-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570447561;
 bh=U18XtkkUegXFhTrfvwYOvgiaC0FtXRWYjtSoLfl0brs=;
 h=From:To:CC:Subject:Date;
 b=pmSt1H3Y+CK68GkYNu1y4JTYGLcNEf2jHJxzsdMkifIe9YxWxOmVLZWBEWz9NkJdA
 pQ4OQ3OOLXGS5uCJScY97utFJzAJgwFQgAusbsD3k+sfRMyyoIBrteXVWlBEqfSZXR
 b5fWnzosrbD/af00aUpR+co0j6YFTUpFJObRzTlM=
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
Z2VkLgoKSkoKCmNoYW5nZXMgaW4gdjM6Ci0gcmViYXNlIG9uIHRvcCBvZiB2NS40LXJjMgotIERv
Y3VtZW50IG9tYXBfZ2VtX25ldygpIGFuZCB0aGUgbmV3IGZsYWdzIHVzaW5nIHRoZSBrZXJuZWwt
ZG9jIGZvcm1hdAoKY2hhbmdlcyBpbiB2MjoKLSBmaXhlZCBidWlsZCBlcnJvciB0aGF0IGNyZXB0
IGluIGR1cmluZyByZWJhc2UgYmVmb3JlIHNlbmRpbmcgKHNvcnJ5CiAgYWJvdXQgdGhhdCkKLSBy
ZXdvcmsgdGhlIHJlZmNvdW50IHBhcnQgYSBiaXQuCgpKZWFuLUphY3F1ZXMgSGlibG90ICgxKToK
ICBkcm0vb21hcDogdXNlIHJlZmNvdW50IEFQSSB0byB0cmFjayB0aGUgbnVtYmVyIG9mIHVzZXJz
IG9mIGRtYV9hZGRyCgpUb21pIFZhbGtlaW5lbiAoNyk6CiAgZHJtL29tYXA6IGFkZCBvbWFwX2dl
bV91bnBpbl9sb2NrZWQoKQogIGRybS9vbWFwOiBhY2NlcHQgTlVMTCBmb3IgZG1hX2FkZHIgaW4g
b21hcF9nZW1fcGluCiAgZHJtL29tYXA6IGNsZWFudXAgT01BUF9CTyBmbGFncwogIGRybS9vbWFw
OiByZW1vdmUgT01BUF9CT19USUxFRCBkZWZpbmUKICBkcm0vb21hcDogY2xlYW51cCBPTUFQX0JP
X1NDQU5PVVQgdXNlCiAgZHJtL29tYXA6IGFkZCBvbWFwX2dlbV92YWxpZGF0ZV9mbGFncygpCiAg
ZHJtL29tYXA6IGFkZCBPTUFQX0JPIGZsYWdzIHRvIGFmZmVjdCBidWZmZXIgYWxsb2NhdGlvbgoK
IGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZG1tX3RpbGVyLmggIHwgICAyICstCiBkcml2
ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2ZiLmMgICAgICAgICB8ICAgNiArLQogZHJpdmVycy9n
cHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYyAgICAgICAgfCAxOTEgKysrKysrKysrKysrKysrKy0t
LS0tLQogZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW1fZG1hYnVmLmMgfCAgIDIgKy0K
IGluY2x1ZGUvdWFwaS9kcm0vb21hcF9kcm0uaCAgICAgICAgICAgICAgIHwgIDI3ICsrLQogNSBm
aWxlcyBjaGFuZ2VkLCAxNjQgaW5zZXJ0aW9ucygrKSwgNjQgZGVsZXRpb25zKC0pCgotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
