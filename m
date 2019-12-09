Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E75E1170CC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 16:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE536E4B1;
	Mon,  9 Dec 2019 15:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100456E4B1
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 15:45:12 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB9FjCCf069533;
 Mon, 9 Dec 2019 09:45:12 -0600
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB9FjBAw106349
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 9 Dec 2019 09:45:12 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 9 Dec
 2019 09:45:11 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 9 Dec 2019 09:45:10 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB9Fj9ln064950;
 Mon, 9 Dec 2019 09:45:10 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 0/2] drm/panel: simple: Rocktech RK101II01D-CT + binding
Date: Mon, 9 Dec 2019 17:45:09 +0200
Message-ID: <cover.1575903975.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1575906312;
 bh=ys8HDcA0nY290lN2fUWrcnHKxVorUO3rMhxCED+QdN8=;
 h=From:To:CC:Subject:Date;
 b=hbhTwACTSUiLr9oiM0D6T6RRJpQzJE2LX5qXRKY8Bra0+nCEWoFGG1oF4G7pgp8YN
 QJuwY1hj076kpPqXgZDEnjBOrZHTCZE8fHCRp0DeG09zG+SQUHHUmHfTPC/Lrib2SW
 Ld1zBlw1NPQgwQxBcyadQYXVtHh4K+idnpe8FxRQ=
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
Cc: tomi.valkeinen@ti.com, thierry.reding@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2luY2UgdjE6Ci0gQWRkICJSZXZpZXdlZC1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2Vp
bmVuQHRpLmNvbT4iIHRvCiAgImRybS9wYW5lbDogc2ltcGxlOiBBZGQgUm9ja3RlY2ggUksxMDFJ
STAxRC1DVCBwYW5lbCIKLSBGaXggImR0LWJpbmRpbmdzOiBkaXNwbGF5OiBEVCBzY2hlbWEgZm9y
IHJvY2t0ZWNoLHJrMTAxaWkwMWQtY3QgcGFuZWwiCiAgRml4IGEgY29weS1wYXN0ZSBlcnJvciBv
biBsaW5lIDQgKCIkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzLi4uIikKCkFkZCBz
dXBwb3J0IGZvciBSb2NrdGVjaCBSSzEwMUlJMDFELUNUIHBhbmVsIHRvIHBhbmVsLXNpbXBsZSBh
bmQgYWRkCnlhbWwgYmluZGluZyBmb3IgaXQuCgpKeXJpIFNhcmhhICgyKToKICBkdC1iaW5kaW5n
czogZGlzcGxheTogRFQgc2NoZW1hIGZvciByb2NrdGVjaCxyazEwMWlpMDFkLWN0IHBhbmVsCiAg
ZHJtL3BhbmVsOiBzaW1wbGU6IEFkZCBSb2NrdGVjaCBSSzEwMUlJMDFELUNUIHBhbmVsCgogLi4u
L2Rpc3BsYXkvcGFuZWwvcm9ja3RlY2gscmsxMDFpaTAxZC1jdC55YW1sIHwgNDggKysrKysrKysr
KysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jICAgICAgICAg
IHwgMzIgKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA4MCBpbnNlcnRpb25zKCspCiBj
cmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcGFuZWwvcm9ja3RlY2gscmsxMDFpaTAxZC1jdC55YW1sCgotLSAKVGV4YXMgSW5zdHJ1bWVu
dHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuIFktdHVubnVz
L0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
