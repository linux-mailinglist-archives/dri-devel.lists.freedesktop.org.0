Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D251D36CC5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C0F8944A;
	Thu,  6 Jun 2019 07:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758E6898CA
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 11:49:13 +0000 (UTC)
X-UUID: ad78969ed2654196953df1583beda66e-20190605
X-UUID: ad78969ed2654196953df1583beda66e-20190605
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 25808782; Wed, 05 Jun 2019 19:43:54 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 5 Jun 2019 19:43:52 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 5 Jun 2019 19:43:51 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3, 18/27] drm/medaitek: add layer_nr for ovl private data
Date: Wed, 5 Jun 2019 19:42:57 +0800
Message-ID: <1559734986-7379-19-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2A3801AC1784E8D57E6E94C569921FE9B21E459F7446BFF10B6CA10AC3FA9B252000:8
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
dGNoIGFkZCBsYXllcl9uciBmb3Igb3ZsIHByaXZhdGUgZGF0YQpvdmxfMmwgYWxtb3N0IHNhbWUg
d2l0aCB3aXRoIG92bCBoYXJkd2FyZSwgZXhjZXB0IHRoZQpsYXllciBudW1iZXIgZm9yIG92bF8y
bCBpcyAyIGFuZCBvdmwgaXMgNC4KdGhpcyBwYXRjaCBpcyBhIHByZXBhcmF0aW9uIGZvciBvdmwt
MmwgYW5kCm92bCBzaGFyZSB0aGUgc2FtZSBkcml2ZXIuCgpTaWduZWQtb2ZmLWJ5OiBZb25ncWlh
bmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgfCA3ICsrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rp
c3Bfb3ZsLmMKaW5kZXggYWZiMzEzYy4uYTBhYjc2MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZGlzcF9vdmwuYwpAQCAtNjAsNiArNjAsNyBAQAogc3RydWN0IG10a19kaXNwX292bF9k
YXRhIHsKIAl1bnNpZ25lZCBpbnQgYWRkcjsKIAl1bnNpZ25lZCBpbnQgZ21jX2JpdHM7CisJdW5z
aWduZWQgaW50IGxheWVyX25yOwogCWJvb2wgZm10X3JnYjU2NV9pc18wOwogfTsKIApAQCAtMTM3
LDcgKzEzOCw5IEBAIHN0YXRpYyB2b2lkIG10a19vdmxfY29uZmlnKHN0cnVjdCBtdGtfZGRwX2Nv
bXAgKmNvbXAsIHVuc2lnbmVkIGludCB3LAogCiBzdGF0aWMgdW5zaWduZWQgaW50IG10a19vdmxf
bGF5ZXJfbnIoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCkKIHsKLQlyZXR1cm4gNDsKKwlzdHJ1
Y3QgbXRrX2Rpc3Bfb3ZsICpvdmwgPSBjb21wX3RvX292bChjb21wKTsKKworCXJldHVybiBvdmwt
PmRhdGEtPmxheWVyX25yOwogfQogCiBzdGF0aWMgdm9pZCBtdGtfb3ZsX2xheWVyX29uKHN0cnVj
dCBtdGtfZGRwX2NvbXAgKmNvbXAsIHVuc2lnbmVkIGludCBpZHgpCkBAIC0zNDIsMTIgKzM0NSwx
NCBAQCBzdGF0aWMgaW50IG10a19kaXNwX292bF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2Rpc3Bfb3ZsX2RhdGEgbXQyNzAxX292
bF9kcml2ZXJfZGF0YSA9IHsKIAkuYWRkciA9IERJU1BfUkVHX09WTF9BRERSX01UMjcwMSwKIAku
Z21jX2JpdHMgPSA4LAorCS5sYXllcl9uciA9IDQsCiAJLmZtdF9yZ2I1NjVfaXNfMCA9IGZhbHNl
LAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGlzcF9vdmxfZGF0YSBtdDgxNzNfb3Zs
X2RyaXZlcl9kYXRhID0gewogCS5hZGRyID0gRElTUF9SRUdfT1ZMX0FERFJfTVQ4MTczLAogCS5n
bWNfYml0cyA9IDgsCisJLmxheWVyX25yID0gNCwKIAkuZm10X3JnYjU2NV9pc18wID0gdHJ1ZSwK
IH07CiAKLS0gCjEuOC4xLjEuZGlydHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
