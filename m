Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F24116F43
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 15:42:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C49789A4B;
	Mon,  9 Dec 2019 14:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F5D6E48C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 14:42:34 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB9EgRD8015017;
 Mon, 9 Dec 2019 08:42:27 -0600
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB9EgRRG099057;
 Mon, 9 Dec 2019 08:42:27 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 9 Dec
 2019 08:42:27 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 9 Dec 2019 08:42:27 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB9EgGvh122297;
 Mon, 9 Dec 2019 08:42:24 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>, <tony@atomide.com>, <sam@ravnborg.org>, 
 <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-omap@vger.kernel.org>
Subject: [PATCH v2 3/3] drm/tilcdc: panel: Add WARN() with a comment to
 tilcdc-panel probe
Date: Mon, 9 Dec 2019 16:42:16 +0200
Message-ID: <54966ffd61ca46528bc55961c532001aa7463c30.1575901747.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1575901747.git.jsarha@ti.com>
References: <cover.1575901747.git.jsarha@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1575902547;
 bh=B9OLsy3glNyhloOu8PeWPNPqAtRcQ04jS9dbdJ3Yb+g=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=zTG6Zyk8kar0i15rq+dZVU0JJrO8rjoBMcVX/0sto2Cf+guoH3DSMcHJqOydV5kfF
 93YaKS+KK+iBUOEOoYfFjRHh5PddshJFZZkaJAODTFR3fEB1iWC0ppEYj2ogFvfvmr
 ZJLNKnRVysveD9PBFDjfL1CVx7fxHqtGxSr2ytF4=
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
Cc: peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIFdBUk4oKSB0byB0aGUgYmVnaW5uaWcgb2YgdGlsY2RjLXBhbmVsIHByb2JlLiBUaGUgb2Jz
b2xldGUKdGlsY2RjLXBhbmVsIGRyaXZlciBzaG91bGQgbm90IGJlIHVzZWQgYW55bW9yZSwgc2lu
Y2UgdGlsY2RjIGlzIGZ1bGx5CmNhcGFibGUgb2YgdXNpbmcgZ2VuZXJpYyBkcm0gcGFuZWxzIGxp
a2UgcGFuZWwtc2ltcGxlIGFuZCBwYW5lbC1jb21tb24KYmluZGluZy4KClNpZ25lZC1vZmYtYnk6
IEp5cmkgU2FyaGEgPGpzYXJoYUB0aS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90
aWxjZGNfcGFuZWwuYyB8IDEwICsrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfcGFuZWwu
YyBiL2RyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX3BhbmVsLmMKaW5kZXggNTU4NGU2NTZi
ODU3Li5jZjhlMjQ2MmE1MjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGls
Y2RjX3BhbmVsLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfcGFuZWwuYwpA
QCAtMzA5LDYgKzMwOSwxNiBAQCBzdGF0aWMgaW50IHBhbmVsX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCiAJc3RydWN0IHBpbmN0cmwgKnBpbmN0cmw7CiAJaW50IHJldDsKIAor
CS8qCisJICogVGhlIG9ic29sZXRlIHRpbGNkYy1wYW5lbCBkcml2ZXIgc2hvdWxkIG5vdCBiZSB1
c2VkCisgICAgICAgICAqIGFueW1vcmUsIHNpbmNlIHRpbGNkYyBpcyBmdWxseSBjYXBhYmxlIG9m
IHVzaW5nIGdlbmVyaWMgZHJtCisgICAgICAgICAqIHBhbmVscyBsaWtlIHBhbmVsLXNpbXBsZSBh
bmQgcGFuZWwtY29tbW9uIGJpbmRpbmcuCisJICovCisKKwlXQVJOKHRydWUsCisJICAgICAidGls
Y2RjLXBhbmVsIGlzIG9ic29sdGUgYW5kIHNob3VsZCBub3QgYmUgdXNlZC4gUGxlYXNlIHVwZGF0
ZSB5b3VyIGNvbmZpZ3VyYXRpb24hXG4iLAorCSAgICAgZGV2X25hbWUoJnBkZXYtPmRldikpOwor
CiAJLyogYmFpbCBvdXQgZWFybHkgaWYgbm8gRFQgZGF0YTogKi8KIAlpZiAoIW5vZGUpIHsKIAkJ
ZGV2X2VycigmcGRldi0+ZGV2LCAiZGV2aWNlLXRyZWUgZGF0YSBpcyBtaXNzaW5nXG4iKTsKLS0g
ClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhl
bHNpbmtpLiBZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWlj
aWxlOiBIZWxzaW5raQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
