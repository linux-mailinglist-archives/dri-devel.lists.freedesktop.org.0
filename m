Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6562B6EC
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 15:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127376E216;
	Mon, 27 May 2019 13:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79AFA6E216
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 13:48:14 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4RDm7S5042862;
 Mon, 27 May 2019 08:48:07 -0500
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4RDm7vL096047
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 May 2019 08:48:07 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 27
 May 2019 08:48:06 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 27 May 2019 08:48:06 -0500
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4RDlviG065947;
 Mon, 27 May 2019 08:48:04 -0500
From: Jyri Sarha <jsarha@ti.com>
To: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 3/6] drm/bridge: sii902x: pixel clock unit is 10kHz instead
 of 1kHz
Date: Mon, 27 May 2019 16:47:54 +0300
Message-ID: <1a2a8eae0b9d6333e7a5841026bf7fd65c9ccd09.1558964241.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1558964241.git.jsarha@ti.com>
References: <cover.1558964241.git.jsarha@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1558964887;
 bh=Nb2UYYSLO8Mx+9pQxzErM264A56wP/rVqxDnQvP/ZL8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=H4rb+forsCbMKsppoPf89JwZzTbzMuk2d3GOK7cLUVymdRWsCnu3mONEE+YG29xz1
 Xmxe+okvTGlQ1O666cOVltUDz4qjSw+L6aDMiYEO31/+I9hK7A32Jznmh/dptJ/8as
 ncC6CPz//4zxEYYpMfIpT4J/OhdaVP2VUtpE9XNc=
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

VGhlIHBpeGVsIGNsb2NrIHVuaXQgaW4gdGhlIGZpcnN0IHR3byByZWdpc3RlcnMgKDB4MDAgYW5k
IDB4MDEpIG9mCnNpaTkwMjIgaXMgMTBrSHosIG5vdCAxa0h6IGFzIGluIHN0cnVjdCBkcm1fZGlz
cGxheV9tb2RlLiBEaXZpc2lvbiBieQoxMCBmaXhlcyB0aGUgaXNzdWUuCgpTaWduZWQtb2ZmLWJ5
OiBKeXJpIFNhcmhhIDxqc2FyaGFAdGkuY29tPgpSZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8
YS5oYWpkYUBzYW1zdW5nLmNvbT4KUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3NpaTkwMnguYyB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYwppbmRleCAxMjhkOGZkYjRiYTYu
LjE5Zjk4MmEwMGRiYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMKQEAgLTI0OSwxMCArMjQ5
LDExIEBAIHN0YXRpYyB2b2lkIHNpaTkwMnhfYnJpZGdlX21vZGVfc2V0KHN0cnVjdCBkcm1fYnJp
ZGdlICpicmlkZ2UsCiAJc3RydWN0IHJlZ21hcCAqcmVnbWFwID0gc2lpOTAyeC0+cmVnbWFwOwog
CXU4IGJ1ZltIRE1JX0lORk9GUkFNRV9TSVpFKEFWSSldOwogCXN0cnVjdCBoZG1pX2F2aV9pbmZv
ZnJhbWUgZnJhbWU7CisJdTE2IHBpeGVsX2Nsb2NrXzEwa0h6ID0gYWRqLT5jbG9jayAvIDEwOwog
CWludCByZXQ7CiAKLQlidWZbMF0gPSBhZGotPmNsb2NrOwotCWJ1ZlsxXSA9IGFkai0+Y2xvY2sg
Pj4gODsKKwlidWZbMF0gPSBwaXhlbF9jbG9ja18xMGtIeiAmIDB4ZmY7CisJYnVmWzFdID0gcGl4
ZWxfY2xvY2tfMTBrSHogPj4gODsKIAlidWZbMl0gPSBhZGotPnZyZWZyZXNoOwogCWJ1ZlszXSA9
IDB4MDA7CiAJYnVmWzRdID0gYWRqLT5oZGlzcGxheTsKLS0gClRleGFzIEluc3RydW1lbnRzIEZp
bmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLiBZLXR1bm51cy9CdXNp
bmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
