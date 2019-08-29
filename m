Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D90A3282
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D15A6E2EA;
	Fri, 30 Aug 2019 08:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8BBA66E14A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 14:51:24 +0000 (UTC)
X-UUID: 80287376ef46478daf67261315a9c37e-20190829
X-UUID: 80287376ef46478daf67261315a9c37e-20190829
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 495048957; Thu, 29 Aug 2019 22:51:21 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 29 Aug 2019 22:51:26 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 29 Aug 2019 22:51:25 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5,
 21/32] drm/mediatek: add background color input select function for
 ovl/ovl_2l
Date: Thu, 29 Aug 2019 22:50:43 +0800
Message-ID: <1567090254-15566-22-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
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
b20+ClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyB8IDIyICsrKysrKysrKysrKysrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX292bC5jCmluZGV4IGJhZWYwNjYuLmViM2JmODUgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMKQEAgLTE5LDYgKzE5LDggQEAKICNkZWZpbmUgRElT
UF9SRUdfT1ZMX0VOCQkJCTB4MDAwYwogI2RlZmluZSBESVNQX1JFR19PVkxfUlNUCQkJMHgwMDE0
CiAjZGVmaW5lIERJU1BfUkVHX09WTF9ST0lfU0laRQkJCTB4MDAyMAorI2RlZmluZSBESVNQX1JF
R19PVkxfREFUQVBBVEhfQ09OCQkweDAwMjQKKyNkZWZpbmUgT1ZMX0JHQ0xSX1NFTF9JTgkJCQlC
SVQoMikKICNkZWZpbmUgRElTUF9SRUdfT1ZMX1JPSV9CR0NMUgkJCTB4MDAyOAogI2RlZmluZSBE
SVNQX1JFR19PVkxfU1JDX0NPTgkJCTB4MDAyYwogI2RlZmluZSBESVNQX1JFR19PVkxfQ09OKG4p
CQkJKDB4MDAzMCArIDB4MjAgKiAobikpCkBAIC0yMzcsNiArMjM5LDI0IEBAIHN0YXRpYyB2b2lk
IG10a19vdmxfbGF5ZXJfY29uZmlnKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAsIHVuc2lnbmVk
IGludCBpZHgsCiAJCW10a19vdmxfbGF5ZXJfb24oY29tcCwgaWR4KTsKIH0KIAorc3RhdGljIHZv
aWQgbXRrX292bF9iZ2Nscl9pbl9vbihzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wKQoreworCXVu
c2lnbmVkIGludCByZWc7CisKKwlyZWcgPSByZWFkbChjb21wLT5yZWdzICsgRElTUF9SRUdfT1ZM
X0RBVEFQQVRIX0NPTik7CisJcmVnID0gcmVnIHwgT1ZMX0JHQ0xSX1NFTF9JTjsKKwl3cml0ZWwo
cmVnLCBjb21wLT5yZWdzICsgRElTUF9SRUdfT1ZMX0RBVEFQQVRIX0NPTik7Cit9CisKK3N0YXRp
YyB2b2lkIG10a19vdmxfYmdjbHJfaW5fb2ZmKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXApCit7
CisJdW5zaWduZWQgaW50IHJlZzsKKworCXJlZyA9IHJlYWRsKGNvbXAtPnJlZ3MgKyBESVNQX1JF
R19PVkxfREFUQVBBVEhfQ09OKTsKKwlyZWcgPSByZWcgJiB+T1ZMX0JHQ0xSX1NFTF9JTjsKKwl3
cml0ZWwocmVnLCBjb21wLT5yZWdzICsgRElTUF9SRUdfT1ZMX0RBVEFQQVRIX0NPTik7Cit9CisK
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RkcF9jb21wX2Z1bmNzIG10a19kaXNwX292bF9mdW5j
cyA9IHsKIAkuY29uZmlnID0gbXRrX292bF9jb25maWcsCiAJLnN0YXJ0ID0gbXRrX292bF9zdGFy
dCwKQEAgLTI0Nyw2ICsyNjcsOCBAQCBzdGF0aWMgdm9pZCBtdGtfb3ZsX2xheWVyX2NvbmZpZyhz
dHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLCB1bnNpZ25lZCBpbnQgaWR4LAogCS5sYXllcl9vbiA9
IG10a19vdmxfbGF5ZXJfb24sCiAJLmxheWVyX29mZiA9IG10a19vdmxfbGF5ZXJfb2ZmLAogCS5s
YXllcl9jb25maWcgPSBtdGtfb3ZsX2xheWVyX2NvbmZpZywKKwkuYmdjbHJfaW5fb24gPSBtdGtf
b3ZsX2JnY2xyX2luX29uLAorCS5iZ2Nscl9pbl9vZmYgPSBtdGtfb3ZsX2JnY2xyX2luX29mZiwK
IH07CiAKIHN0YXRpYyBpbnQgbXRrX2Rpc3Bfb3ZsX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBz
dHJ1Y3QgZGV2aWNlICptYXN0ZXIsCi0tIAoxLjguMS4xLmRpcnR5CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
