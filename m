Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8531A3276
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:31:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C0D6E2BC;
	Fri, 30 Aug 2019 08:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8C3056E14A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 14:51:23 +0000 (UTC)
X-UUID: 9ee07644bd19488295ffed4a6fa85c82-20190829
X-UUID: 9ee07644bd19488295ffed4a6fa85c82-20190829
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 225393793; Thu, 29 Aug 2019 22:51:21 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 29 Aug 2019 22:51:25 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 29 Aug 2019 22:51:24 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5,
 20/32] drm/mediatek: add function to background color input select
 for ovl/ovl_2l direct link
Date: Thu, 29 Aug 2019 22:50:42 +0800
Message-ID: <1567090254-15566-21-git-send-email-yongqiang.niu@mediatek.com>
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
dGNoIGFkZCBmdW5jdGlvbiB0byBiYWNrZ3JvdW5kIGNvbG9yIGlucHV0IHNlbGVjdCBmb3Igb3Zs
L292bF8ybCBkaXJlY3QgbGluawpmb3Igb3ZsL292bF8ybCBkaXJlY3QgbGluayB1c2VjYXNlLCB3
ZSBuZWVkIHNldCBiYWNrZ3JvdW5kIGNvbG9yCmlucHV0IHNlbGVjdCBmb3IgdGhlc2UgaGFyZHdh
cmUuCnRoaXMgaXMgcHJlcGFyYXRpb24gcGF0Y2ggZm9yIG92bC9vdmxfMmwgdXNlY2FzZQoKU2ln
bmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+ClJl
dmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmggfCAxNCArKysrKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZGRwX2NvbXAuaAppbmRleCA4NWUwOTZhLi4yNjhkNDE2IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmgKQEAgLTg0LDYgKzg0LDggQEAgc3RydWN0
IG10a19kZHBfY29tcF9mdW5jcyB7CiAJCQkgICAgIHN0cnVjdCBtdGtfcGxhbmVfc3RhdGUgKnN0
YXRlKTsKIAl2b2lkICgqZ2FtbWFfc2V0KShzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLAogCQkJ
ICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKnN0YXRlKTsKKwl2b2lkICgqYmdjbHJfaW5fb24pKHN0
cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXApOworCXZvaWQgKCpiZ2Nscl9pbl9vZmYpKHN0cnVjdCBt
dGtfZGRwX2NvbXAgKmNvbXApOwogfTsKIAogc3RydWN0IG10a19kZHBfY29tcCB7CkBAIC0xNjQs
NiArMTY2LDE4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBtdGtfZGRwX2dhbW1hX3NldChzdHJ1Y3Qg
bXRrX2RkcF9jb21wICpjb21wLAogCQljb21wLT5mdW5jcy0+Z2FtbWFfc2V0KGNvbXAsIHN0YXRl
KTsKIH0KIAorc3RhdGljIGlubGluZSB2b2lkIG10a19kZHBfY29tcF9iZ2Nscl9pbl9vbihzdHJ1
Y3QgbXRrX2RkcF9jb21wICpjb21wKQoreworCWlmIChjb21wLT5mdW5jcyAmJiBjb21wLT5mdW5j
cy0+YmdjbHJfaW5fb24pCisJCWNvbXAtPmZ1bmNzLT5iZ2Nscl9pbl9vbihjb21wKTsKK30KKwor
c3RhdGljIGlubGluZSB2b2lkIG10a19kZHBfY29tcF9iZ2Nscl9pbl9vZmYoc3RydWN0IG10a19k
ZHBfY29tcCAqY29tcCkKK3sKKwlpZiAoY29tcC0+ZnVuY3MgJiYgY29tcC0+ZnVuY3MtPmJnY2xy
X2luX29mZikKKwkJY29tcC0+ZnVuY3MtPmJnY2xyX2luX29mZihjb21wKTsKK30KKwogaW50IG10
a19kZHBfY29tcF9nZXRfaWQoc3RydWN0IGRldmljZV9ub2RlICpub2RlLAogCQkJZW51bSBtdGtf
ZGRwX2NvbXBfdHlwZSBjb21wX3R5cGUpOwogaW50IG10a19kZHBfY29tcF9pbml0KHN0cnVjdCBk
ZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9ub2RlICpjb21wX25vZGUsCi0tIAoxLjguMS4xLmRp
cnR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
