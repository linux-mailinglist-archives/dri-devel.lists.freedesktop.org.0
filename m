Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 752466315E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF30F8981B;
	Tue,  9 Jul 2019 07:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F277189AE6
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 22:34:43 +0000 (UTC)
X-UUID: e2f386e0c8fe413390c501b7a60e6df6-20190709
X-UUID: e2f386e0c8fe413390c501b7a60e6df6-20190709
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1873091533; Tue, 09 Jul 2019 06:34:40 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 9 Jul 2019 06:34:38 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 9 Jul 2019 06:34:38 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4,
 21/33] drm/mediatek: add function to background color input select
 for ovl/ovl_2l direct link
Date: Tue, 9 Jul 2019 06:34:01 +0800
Message-ID: <1562625253-29254-22-git-send-email-yongqiang.niu@mediatek.com>
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
dGNoIGFkZCBmdW5jdGlvbiB0byBiYWNrZ3JvdW5kIGNvbG9yIGlucHV0IHNlbGVjdCBmb3Igb3Zs
L292bF8ybCBkaXJlY3QgbGluawpmb3Igb3ZsL292bF8ybCBkaXJlY3QgbGluayB1c2VjYXNlLCB3
ZSBuZWVkIHNldCBiYWNrZ3JvdW5kIGNvbG9yCmlucHV0IHNlbGVjdCBmb3IgdGhlc2UgaGFyZHdh
cmUuCnRoaXMgaXMgcHJlcGFyYXRpb24gcGF0Y2ggZm9yIG92bC9vdmxfMmwgdXNlY2FzZQoKU2ln
bmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaCB8IDE0ICsrKysr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmggYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oCmluZGV4IGEwZWE4YzkuLmVjNmYzMjlh
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmgKQEAgLTky
LDYgKzkyLDggQEAgc3RydWN0IG10a19kZHBfY29tcF9mdW5jcyB7CiAJCQkgICAgIHN0cnVjdCBt
dGtfcGxhbmVfc3RhdGUgKnN0YXRlKTsKIAl2b2lkICgqZ2FtbWFfc2V0KShzdHJ1Y3QgbXRrX2Rk
cF9jb21wICpjb21wLAogCQkJICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKnN0YXRlKTsKKwl2b2lk
ICgqYmdjbHJfaW5fb24pKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXApOworCXZvaWQgKCpiZ2Ns
cl9pbl9vZmYpKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXApOwogfTsKIAogc3RydWN0IG10a19k
ZHBfY29tcCB7CkBAIC0xNzIsNiArMTc0LDE4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBtdGtfZGRw
X2dhbW1hX3NldChzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLAogCQljb21wLT5mdW5jcy0+Z2Ft
bWFfc2V0KGNvbXAsIHN0YXRlKTsKIH0KIAorc3RhdGljIGlubGluZSB2b2lkIG10a19kZHBfY29t
cF9iZ2Nscl9pbl9vbihzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wKQoreworCWlmIChjb21wLT5m
dW5jcyAmJiBjb21wLT5mdW5jcy0+YmdjbHJfaW5fb24pCisJCWNvbXAtPmZ1bmNzLT5iZ2Nscl9p
bl9vbihjb21wKTsKK30KKworc3RhdGljIGlubGluZSB2b2lkIG10a19kZHBfY29tcF9iZ2Nscl9p
bl9vZmYoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCkKK3sKKwlpZiAoY29tcC0+ZnVuY3MgJiYg
Y29tcC0+ZnVuY3MtPmJnY2xyX2luX29mZikKKwkJY29tcC0+ZnVuY3MtPmJnY2xyX2luX29mZihj
b21wKTsKK30KKwogaW50IG10a19kZHBfY29tcF9nZXRfaWQoc3RydWN0IGRldmljZV9ub2RlICpu
b2RlLAogCQkJZW51bSBtdGtfZGRwX2NvbXBfdHlwZSBjb21wX3R5cGUpOwogaW50IG10a19kZHBf
Y29tcF9pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9ub2RlICpjb21wX25v
ZGUsCi0tIAoxLjguMS4xLmRpcnR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
