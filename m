Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA36A3299
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2E16E313;
	Fri, 30 Aug 2019 08:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8AB476E14C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 14:51:36 +0000 (UTC)
X-UUID: 2861f9f1465841b591b1381ae89ece0e-20190829
X-UUID: 2861f9f1465841b591b1381ae89ece0e-20190829
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1860196321; Thu, 29 Aug 2019 22:51:33 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 29 Aug 2019 22:51:24 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 29 Aug 2019 22:51:23 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5, 19/32] drm/medaitek: add layer_nr for ovl private data
Date: Thu, 29 Aug 2019 22:50:41 +0800
Message-ID: <1567090254-15566-20-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 72B22DD7C2694E4DF380879389789265D1A4F7ADFD02AD9752AFEF2E0657D4B52000:8
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
dGNoIGFkZCBsYXllcl9uciBmb3Igb3ZsIHByaXZhdGUgZGF0YQpvdmxfMmwgYWxtb3N0IHNhbWUg
d2l0aCB3aXRoIG92bCBoYXJkd2FyZSwgZXhjZXB0IHRoZQpsYXllciBudW1iZXIgZm9yIG92bF8y
bCBpcyAyIGFuZCBvdmwgaXMgNC4KdGhpcyBwYXRjaCBpcyBhIHByZXBhcmF0aW9uIGZvciBvdmwt
MmwgYW5kCm92bCBzaGFyZSB0aGUgc2FtZSBkcml2ZXIuCgpTaWduZWQtb2ZmLWJ5OiBZb25ncWlh
bmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KUmV2aWV3ZWQtYnk6IENLIEh1IDxj
ay5odUBtZWRpYXRlay5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNw
X292bC5jIHwgNyArKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNw
X292bC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCmluZGV4IDgy
ZWFlZmQuLmJhZWYwNjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9vdmwuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMK
QEAgLTUyLDYgKzUyLDcgQEAKIHN0cnVjdCBtdGtfZGlzcF9vdmxfZGF0YSB7CiAJdW5zaWduZWQg
aW50IGFkZHI7CiAJdW5zaWduZWQgaW50IGdtY19iaXRzOworCXVuc2lnbmVkIGludCBsYXllcl9u
cjsKIAlib29sIGZtdF9yZ2I1NjVfaXNfMDsKIH07CiAKQEAgLTEyOSw3ICsxMzAsOSBAQCBzdGF0
aWMgdm9pZCBtdGtfb3ZsX2NvbmZpZyhzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLCB1bnNpZ25l
ZCBpbnQgdywKIAogc3RhdGljIHVuc2lnbmVkIGludCBtdGtfb3ZsX2xheWVyX25yKHN0cnVjdCBt
dGtfZGRwX2NvbXAgKmNvbXApCiB7Ci0JcmV0dXJuIDQ7CisJc3RydWN0IG10a19kaXNwX292bCAq
b3ZsID0gY29tcF90b19vdmwoY29tcCk7CisKKwlyZXR1cm4gb3ZsLT5kYXRhLT5sYXllcl9ucjsK
IH0KIAogc3RhdGljIHZvaWQgbXRrX292bF9sYXllcl9vbihzdHJ1Y3QgbXRrX2RkcF9jb21wICpj
b21wLCB1bnNpZ25lZCBpbnQgaWR4KQpAQCAtMzM0LDEyICszMzcsMTQgQEAgc3RhdGljIGludCBt
dGtfZGlzcF9vdmxfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiBzdGF0aWMg
Y29uc3Qgc3RydWN0IG10a19kaXNwX292bF9kYXRhIG10MjcwMV9vdmxfZHJpdmVyX2RhdGEgPSB7
CiAJLmFkZHIgPSBESVNQX1JFR19PVkxfQUREUl9NVDI3MDEsCiAJLmdtY19iaXRzID0gOCwKKwku
bGF5ZXJfbnIgPSA0LAogCS5mbXRfcmdiNTY1X2lzXzAgPSBmYWxzZSwKIH07CiAKIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgbXRrX2Rpc3Bfb3ZsX2RhdGEgbXQ4MTczX292bF9kcml2ZXJfZGF0YSA9IHsK
IAkuYWRkciA9IERJU1BfUkVHX09WTF9BRERSX01UODE3MywKIAkuZ21jX2JpdHMgPSA4LAorCS5s
YXllcl9uciA9IDQsCiAJLmZtdF9yZ2I1NjVfaXNfMCA9IHRydWUsCiB9OwogCi0tIAoxLjguMS4x
LmRpcnR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
