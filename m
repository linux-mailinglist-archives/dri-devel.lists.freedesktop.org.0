Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C87716318B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D20389DCF;
	Tue,  9 Jul 2019 07:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3F989AE6
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 22:34:44 +0000 (UTC)
X-UUID: bd3f856997fe48aab6c83952cb9ab09a-20190709
X-UUID: bd3f856997fe48aab6c83952cb9ab09a-20190709
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2018052162; Tue, 09 Jul 2019 06:34:40 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 9 Jul 2019 06:34:39 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 9 Jul 2019 06:34:39 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4,
 22/33] drm/mediatek: add background color input select function for
 ovl/ovl_2l
Date: Tue, 9 Jul 2019 06:34:02 +0800
Message-ID: <1562625253-29254-23-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
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
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jIHwgMjIgKysr
KysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMKaW5kZXggYTBhYjc2MC4uOGNhNDk2
NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYwpAQCAtMjcsNiArMjcs
OCBAQAogI2RlZmluZSBESVNQX1JFR19PVkxfRU4JCQkJMHgwMDBjCiAjZGVmaW5lIERJU1BfUkVH
X09WTF9SU1QJCQkweDAwMTQKICNkZWZpbmUgRElTUF9SRUdfT1ZMX1JPSV9TSVpFCQkJMHgwMDIw
CisjZGVmaW5lIERJU1BfUkVHX09WTF9EQVRBUEFUSF9DT04JCTB4MDAyNAorI2RlZmluZSBPVkxf
QkdDTFJfU0VMX0lOCQkJCUJJVCgyKQogI2RlZmluZSBESVNQX1JFR19PVkxfUk9JX0JHQ0xSCQkJ
MHgwMDI4CiAjZGVmaW5lIERJU1BfUkVHX09WTF9TUkNfQ09OCQkJMHgwMDJjCiAjZGVmaW5lIERJ
U1BfUkVHX09WTF9DT04obikJCQkoMHgwMDMwICsgMHgyMCAqIChuKSkKQEAgLTI0NSw2ICsyNDcs
MjQgQEAgc3RhdGljIHZvaWQgbXRrX292bF9sYXllcl9jb25maWcoc3RydWN0IG10a19kZHBfY29t
cCAqY29tcCwgdW5zaWduZWQgaW50IGlkeCwKIAkJbXRrX292bF9sYXllcl9vbihjb21wLCBpZHgp
OwogfQogCitzdGF0aWMgdm9pZCBtdGtfb3ZsX2JnY2xyX2luX29uKHN0cnVjdCBtdGtfZGRwX2Nv
bXAgKmNvbXApCit7CisJdW5zaWduZWQgaW50IHJlZzsKKworCXJlZyA9IHJlYWRsKGNvbXAtPnJl
Z3MgKyBESVNQX1JFR19PVkxfREFUQVBBVEhfQ09OKTsKKwlyZWcgPSByZWcgfCBPVkxfQkdDTFJf
U0VMX0lOOworCXdyaXRlbChyZWcsIGNvbXAtPnJlZ3MgKyBESVNQX1JFR19PVkxfREFUQVBBVEhf
Q09OKTsKK30KKworc3RhdGljIHZvaWQgbXRrX292bF9iZ2Nscl9pbl9vZmYoc3RydWN0IG10a19k
ZHBfY29tcCAqY29tcCkKK3sKKwl1bnNpZ25lZCBpbnQgcmVnOworCisJcmVnID0gcmVhZGwoY29t
cC0+cmVncyArIERJU1BfUkVHX09WTF9EQVRBUEFUSF9DT04pOworCXJlZyA9IHJlZyAmIH5PVkxf
QkdDTFJfU0VMX0lOOworCXdyaXRlbChyZWcsIGNvbXAtPnJlZ3MgKyBESVNQX1JFR19PVkxfREFU
QVBBVEhfQ09OKTsKK30KKwogc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGRwX2NvbXBfZnVuY3Mg
bXRrX2Rpc3Bfb3ZsX2Z1bmNzID0gewogCS5jb25maWcgPSBtdGtfb3ZsX2NvbmZpZywKIAkuc3Rh
cnQgPSBtdGtfb3ZsX3N0YXJ0LApAQCAtMjU1LDYgKzI3NSw4IEBAIHN0YXRpYyB2b2lkIG10a19v
dmxfbGF5ZXJfY29uZmlnKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAsIHVuc2lnbmVkIGludCBp
ZHgsCiAJLmxheWVyX29uID0gbXRrX292bF9sYXllcl9vbiwKIAkubGF5ZXJfb2ZmID0gbXRrX292
bF9sYXllcl9vZmYsCiAJLmxheWVyX2NvbmZpZyA9IG10a19vdmxfbGF5ZXJfY29uZmlnLAorCS5i
Z2Nscl9pbl9vbiA9IG10a19vdmxfYmdjbHJfaW5fb24sCisJLmJnY2xyX2luX29mZiA9IG10a19v
dmxfYmdjbHJfaW5fb2ZmLAogfTsKIAogc3RhdGljIGludCBtdGtfZGlzcF9vdmxfYmluZChzdHJ1
Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKLS0gCjEuOC4xLjEuZGlydHkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
