Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB80A36CC2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A1F893A4;
	Thu,  6 Jun 2019 07:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13294898CA
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 11:49:11 +0000 (UTC)
X-UUID: c4b9b2a11e0c4243a921f6d91478fe0e-20190605
X-UUID: c4b9b2a11e0c4243a921f6d91478fe0e-20190605
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1305159411; Wed, 05 Jun 2019 19:43:54 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 5 Jun 2019 19:43:54 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 5 Jun 2019 19:43:53 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3,
 20/27] drm/mediatek: add background color input select function for
 ovl/ovl_2l
Date: Wed, 5 Jun 2019 19:42:59 +0800
Message-ID: <1559734986-7379-21-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Thu, 06 Jun 2019 07:03:45 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+CgpUaGlzIHBh
dGNoIGFkZCBiYWNrZ3JvdW5kIGNvbG9yIGlucHV0IHNlbGVjdCBmdW5jdGlvbiBmb3Igb3ZsL292
bF8ybAoKb3ZsIGluY2x1ZGUgNCBEUkFNIGxheWVyIGFuZCAxIGJhY2tncm91bmQgY29sb3IgbGF5
ZXIKb3ZsXzJsIGluY2x1ZGUgNCBEUkFNIGxheWVyIGFuZCAxIGJhY2tncm91bmQgY29sb3IgbGF5
ZXIKRFJBTSBsYXllciBmcmFtZSBidWZmZXIgZGF0YSBmcm9tIHJlbmRlciBoYXJkd2FyZSwgR1BV
IGZvciBleGFtcGxlLgpiYWNrZ291cm5kIGNvbG9yIGxheWVyIGlzIGVtYmVkIGluIG92bC9vdmxf
MmwsIHdlIGNhbiBvbmx5IHNldAppdCBjb2xvciwgYnV0IG5vdCBzdXBwb3J0IERSQU0gZnJhbWUg
YnVmZmVyLgoKZm9yIG92bDAtPm92bDBfMmwgZGlyZWN0IGxpbmsgdXNlY2FzZSwKd2UgbmVlZCBz
ZXQgb3ZsMF8ybCBiYWNrZ3JvdW5kIGNvbG9yIGludHB1dCBzZWxlY3QgZnJvbSBvdmwwCmlmIHJl
bmRlciBzZW5kIERSQU0gYnVmZmVyIGxheWVyIG51bWJlciA8PTQsIGFsbCB0aGVzZSBsYXllciBy
ZWFkCmJ5IG92bC4KbGF5ZXIwIGlzIGF0IHRoZSBib3R0b20gb2YgYWxsIGxheWVycy4KbGF5ZXIz
IGlzIGF0IHRoZSB0b3Agb2YgYWxsIGxheWVycy4KaWYgcmVuZGVyIHNlbmQgRFJBTSBidWZmZXIg
bGF5ZXIgbnVtYmZlciA+PTQgJiYgPD02Cm92bDAgcmVhZCBsYXllcjB+MwpvdmwwXzJsIHJlYWQg
bGF5ZXI0fjUKbGF5ZXI1IGlzIGF0IHRoZSB0b3Agb3QgYWxsIHRoZXNlIGxheWVycy4KCnRoZSBk
ZWNpc2lvbiBvZiBob3cgdG8gc2V0dGluZyBvdmwwL292bDBfMmwgcmVhZCB0aGVzZSBsYXllciBk
YXRhCmlzIGNvbnRyb2xsZWQgaW4gbXRrIGNydGMsIHdoaWNoIHdpbGwgYmUgYW5vdGhlciBwYXRj
aAoKU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jIHwgMjMgKysr
KysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCmluZGV4IGEwYWI3NjAuLmI1YTk5
MDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMKQEAgLTI3LDYgKzI3
LDggQEAKICNkZWZpbmUgRElTUF9SRUdfT1ZMX0VOCQkJCTB4MDAwYwogI2RlZmluZSBESVNQX1JF
R19PVkxfUlNUCQkJMHgwMDE0CiAjZGVmaW5lIERJU1BfUkVHX09WTF9ST0lfU0laRQkJCTB4MDAy
MAorI2RlZmluZSBESVNQX1JFR19PVkxfREFUQVBBVEhfQ09OCQkweDAwMjQKKyNkZWZpbmUgT1ZM
X0JHQ0xSX1NFTF9JTgkJCQlCSVQoMikKICNkZWZpbmUgRElTUF9SRUdfT1ZMX1JPSV9CR0NMUgkJ
CTB4MDAyOAogI2RlZmluZSBESVNQX1JFR19PVkxfU1JDX0NPTgkJCTB4MDAyYwogI2RlZmluZSBE
SVNQX1JFR19PVkxfQ09OKG4pCQkJKDB4MDAzMCArIDB4MjAgKiAobikpCkBAIC0yNDUsNiArMjQ3
LDI1IEBAIHN0YXRpYyB2b2lkIG10a19vdmxfbGF5ZXJfY29uZmlnKHN0cnVjdCBtdGtfZGRwX2Nv
bXAgKmNvbXAsIHVuc2lnbmVkIGludCBpZHgsCiAJCW10a19vdmxfbGF5ZXJfb24oY29tcCwgaWR4
KTsKIH0KIAorc3RhdGljIHZvaWQgbXRrX292bF9iZ2Nscl9pbl9vbihzdHJ1Y3QgbXRrX2RkcF9j
b21wICpjb21wLAorCQkJCWVudW0gbXRrX2RkcF9jb21wX2lkIHByZXYpCit7CisJdW5zaWduZWQg
aW50IHJlZzsKKworCXJlZyA9IHJlYWRsKGNvbXAtPnJlZ3MgKyBESVNQX1JFR19PVkxfREFUQVBB
VEhfQ09OKTsKKwlyZWcgPSByZWcgfCBPVkxfQkdDTFJfU0VMX0lOOworCXdyaXRlbChyZWcsIGNv
bXAtPnJlZ3MgKyBESVNQX1JFR19PVkxfREFUQVBBVEhfQ09OKTsKK30KKworc3RhdGljIHZvaWQg
bXRrX292bF9iZ2Nscl9pbl9vZmYoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCkKK3sKKwl1bnNp
Z25lZCBpbnQgcmVnOworCisJcmVnID0gcmVhZGwoY29tcC0+cmVncyArIERJU1BfUkVHX09WTF9E
QVRBUEFUSF9DT04pOworCXJlZyA9IHJlZyAmIH5PVkxfQkdDTFJfU0VMX0lOOworCXdyaXRlbChy
ZWcsIGNvbXAtPnJlZ3MgKyBESVNQX1JFR19PVkxfREFUQVBBVEhfQ09OKTsKK30KKwogc3RhdGlj
IGNvbnN0IHN0cnVjdCBtdGtfZGRwX2NvbXBfZnVuY3MgbXRrX2Rpc3Bfb3ZsX2Z1bmNzID0gewog
CS5jb25maWcgPSBtdGtfb3ZsX2NvbmZpZywKIAkuc3RhcnQgPSBtdGtfb3ZsX3N0YXJ0LApAQCAt
MjU1LDYgKzI3Niw4IEBAIHN0YXRpYyB2b2lkIG10a19vdmxfbGF5ZXJfY29uZmlnKHN0cnVjdCBt
dGtfZGRwX2NvbXAgKmNvbXAsIHVuc2lnbmVkIGludCBpZHgsCiAJLmxheWVyX29uID0gbXRrX292
bF9sYXllcl9vbiwKIAkubGF5ZXJfb2ZmID0gbXRrX292bF9sYXllcl9vZmYsCiAJLmxheWVyX2Nv
bmZpZyA9IG10a19vdmxfbGF5ZXJfY29uZmlnLAorCS5iZ2Nscl9pbl9vbiA9IG10a19vdmxfYmdj
bHJfaW5fb24sCisJLmJnY2xyX2luX29mZiA9IG10a19vdmxfYmdjbHJfaW5fb2ZmLAogfTsKIAog
c3RhdGljIGludCBtdGtfZGlzcF9vdmxfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBk
ZXZpY2UgKm1hc3RlciwKLS0gCjEuOC4xLjEuZGlydHkKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
