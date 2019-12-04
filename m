Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F08ED11311F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 18:53:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B531E6E93C;
	Wed,  4 Dec 2019 17:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE2E6E0C1
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 17:53:22 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB4HrFbd023151;
 Wed, 4 Dec 2019 11:53:15 -0600
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB4HrFju040851
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 4 Dec 2019 11:53:15 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 4 Dec
 2019 11:53:14 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 4 Dec 2019 11:53:14 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB4HrBu9048941;
 Wed, 4 Dec 2019 11:53:12 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>, <tony@atomide.com>, <sam@ravnborg.org>, 
 <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-omap@vger.kernel.org>
Subject: [PATCH 0/2] drm/tilcdc: Remove "ti, tilcdc, tfp410" and mark  "ti,
 tilcdc, panel" obsolete
Date: Wed, 4 Dec 2019 19:53:09 +0200
Message-ID: <cover.1575481630.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1575481995;
 bh=N5idhFfsXlX/1acVzF6uxJVB9ECJXLwI65LF19ADOy4=;
 h=From:To:CC:Subject:Date;
 b=UCrMLvK6Cq/hXBICCNHlvXkIzDniLCMH1MiWJXCbZE7qe2N5YgrPBKHPBrJnKPCKX
 Wcr4oFrBeHu8ZblDlaI6b4MuSbUht3wL2R0hihmkEbLfu/t2oz0Mk9XF05wqvaFfRX
 iQ0fzs8ykpjFd3P1HWh7D6ROKQNSvG6SSweyipQw=
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

Tm9ib2R5IHNob3VsZCBhbnkgbW9yZSB1c2UgdGhlIG9sZCB0aWxjZGMgYnVuZGxlZCBkcml2ZXJz
IGFueW1vcmUuIFRoZQpkcml2ZXIgaXMgZnVsbHkgY2FwYWJsZSBvZiB1c2luZyB0aGUgZ2VuZXJp
YyBkcm0gYnJpZGdlIGFuZCBwYW5lbApkcml2ZXJzLiAgSG93ZXZlciwgdGhlIG9ic29sZXRlICJ0
aSx0aWxjZGMscGFuZWwiIGJpbmRpbmcgaXMgc3RpbGwKd2lkZWx5IHVzZWQgaW4gbWFueSBtYWlu
bGluZSBzdXBwb3J0ZWQgcGxhdGZvcm1zIHRoYXQgSSBkbyBub3QgaGF2ZQphY2Nlc3MgdG8gYW5k
IHdobyBrbm93cyBob3cgbWFueSBjdXN0b20gcGxhdGZvcm1zLiBTbyBJIGFtIGFmcmFpZCB3ZQpo
YXZlIHRvIGtlZXAgdGhlIG9sZCBidW5kbGVkIHRpbGNkYyBwYW5lbCBkcml2ZXIgYXJvdW5kLgoK
SnlyaSBTYXJoYSAoMik6CiAgZHJtL3RpbGNkYzogUmVtb3ZlIG9ic29sZXRlIGJ1bmRsZWQgdGls
Y2RjIHRmcDQxMCBkcml2ZXIKICBkdC1iaW5kaW5nczogZGlzcGxheTogQWRkIG9ic29sZXRlIG5v
dGUgdG8gInRpLHRpbGNkYyxwYW5lbCIgYmluZGluZwoKIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3Rp
bGNkYy9wYW5lbC50eHQgICAgICAgICB8ICAgNiArCiAuLi4vYmluZGluZ3MvZGlzcGxheS90aWxj
ZGMvdGZwNDEwLnR4dCAgICAgICAgfCAgMjEgLQogZHJpdmVycy9ncHUvZHJtL3RpbGNkYy9NYWtl
ZmlsZSAgICAgICAgICAgICAgIHwgICAxIC0KIGRyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2Rj
X2Rydi5jICAgICAgICAgICB8ICAgMyAtCiBkcml2ZXJzL2dwdS9kcm0vdGlsY2RjL3RpbGNkY190
ZnA0MTAuYyAgICAgICAgfCAzNzkgLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0v
dGlsY2RjL3RpbGNkY190ZnA0MTAuaCAgICAgICAgfCAgMTUgLQogNiBmaWxlcyBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDQxOSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS90aWxjZGMvdGZwNDEwLnR4dAog
ZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX3RmcDQxMC5j
CiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfdGZwNDEw
LmgKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAw
MDE4MCBIZWxzaW5raS4gWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtr
YS9Eb21pY2lsZTogSGVsc2lua2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
