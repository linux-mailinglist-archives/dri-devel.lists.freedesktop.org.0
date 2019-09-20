Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5294B8D6D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 11:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9FC6FBE5;
	Fri, 20 Sep 2019 09:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 382B46FBE5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 09:05:19 +0000 (UTC)
X-UUID: 7958ad489b23431aaa6544b1383f98c3-20190920
X-UUID: 7958ad489b23431aaa6544b1383f98c3-20190920
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 937036866; Fri, 20 Sep 2019 17:05:14 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Fri, 20 Sep 2019 17:05:15 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Fri, 20 Sep 2019 17:05:14 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 4/5] drm/mediatek: add the mipitx driving control in device
 tree
Date: Fri, 20 Sep 2019 17:04:31 +0800
Message-ID: <20190920090432.3308-5-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190920090432.3308-1-jitao.shi@mediatek.com>
References: <20190920090432.3308-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 98D848F71DF5D5DE1E3D0EE6D65DF017A01A93B3ABEDB4F2267DE9CB837B532A2000:8
X-MTK: N
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com,
 stonea168@163.com, cawa.cheng@mediatek.com, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGEgcHJvcGVydHkgaW4gZGV2aWNlIHRyZWUgdG8gY29udHJvbCB0aGUgZHJpdmluZyBieSBk
aWZmZXJlbnQKYm9hcmQuCgpTaWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRp
YXRlay5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19taXBpX3R4LmMgICAg
ICAgIHwgNiArKysrKysKIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbWlwaV90eC5oICAg
ICAgICB8IDEgKwogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19tdDgxODNfbWlwaV90eC5j
IHwgNyArKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX21pcGlfdHguYyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfbWlwaV90eC5jCmluZGV4IGU0ZDM0NDg0ZWNjOC4uZWM4NDA2Yzg2
YmZiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX21pcGlfdHguYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX21pcGlfdHguYwpAQCAtMTI1LDYgKzEy
NSwxMiBAQCBzdGF0aWMgaW50IG10a19taXBpX3R4X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCiAJCXJldHVybiByZXQ7CiAJfQogCisJcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91
MzIoZGV2LT5vZl9ub2RlLCAibWlwaXR4LWN1cnJlbnQtZHJpdmUiLAorCQkJCSAgICZtaXBpX3R4
LT5taXBpdHhfZHJpdmUpOworCS8qIElmIGNhbid0IGdldCB0aGUgIm1pcGlfdHgtPm1pcGl0eF9k
cml2ZSIsIHNldCBpdCBkZWZhdWx0IDB4OCAqLworCWlmIChyZXQgPCAwKQorCQltaXBpX3R4LT5t
aXBpdHhfZHJpdmUgPSAweDg7CisKIAlyZWZfY2xrX25hbWUgPSBfX2Nsa19nZXRfbmFtZShyZWZf
Y2xrKTsKIAogCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfc3RyaW5nKGRldi0+b2Zfbm9kZSwgImNs
b2NrLW91dHB1dC1uYW1lcyIsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX21pcGlfdHguaCBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbWlwaV90eC5oCmlu
ZGV4IDQxM2YzNWQ4NjIxOS4uZWVhNDQzMjdmZTlmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX21pcGlfdHguaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX21pcGlfdHguaApAQCAtMjcsNiArMjcsNyBAQCBzdHJ1Y3QgbXRrX21pcGlfdHggewogCXN0
cnVjdCBkZXZpY2UgKmRldjsKIAl2b2lkIF9faW9tZW0gKnJlZ3M7CiAJdTMyIGRhdGFfcmF0ZTsK
Kwl1MzIgbWlwaXR4X2RyaXZlOwogCWNvbnN0IHN0cnVjdCBtdGtfbWlwaXR4X2RhdGEgKmRyaXZl
cl9kYXRhOwogCXN0cnVjdCBjbGtfaHcgcGxsX2h3OwogCXN0cnVjdCBjbGsgKnBsbDsKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQ4MTgzX21pcGlfdHguYyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQ4MTgzX21pcGlfdHguYwppbmRleCBkYjEzZWJk
YmUyNjIuLjViZGE4MzU1MTQ1ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19tdDgxODNfbWlwaV90eC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
bXQ4MTgzX21pcGlfdHguYwpAQCAtMTcsNiArMTcsOSBAQAogI2RlZmluZSBSR19EU0lfQkdfQ09S
RV9FTgkJQklUKDcpCiAjZGVmaW5lIFJHX0RTSV9QQURfVElFTF9TRUwJCUJJVCg4KQogCisjZGVm
aW5lIE1JUElUWF9WT0xUQUdFX1NFTAkweDAwMTAKKyNkZWZpbmUgUkdfRFNJX0hTVFhfTERPX1JF
Rl9TRUwJCSgweGYgPDwgNikKKwogI2RlZmluZSBNSVBJVFhfUExMX1BXUgkweDAwMjgKICNkZWZp
bmUgTUlQSVRYX1BMTF9DT04wCTB4MDAyYwogI2RlZmluZSBNSVBJVFhfUExMX0NPTjEJMHgwMDMw
CkBAIC0xMjMsNiArMTI2LDEwIEBAIHN0YXRpYyB2b2lkIG10a19taXBpX3R4X3Bvd2VyX29uX3Np
Z25hbChzdHJ1Y3QgcGh5ICpwaHkpCiAJbXRrX21pcGlfdHhfY2xlYXJfYml0cyhtaXBpX3R4LCBN
SVBJVFhfRDNfU1dfQ1RMX0VOLCBEU0lfU1dfQ1RMX0VOKTsKIAltdGtfbWlwaV90eF9jbGVhcl9i
aXRzKG1pcGlfdHgsIE1JUElUWF9DS19TV19DVExfRU4sIERTSV9TV19DVExfRU4pOwogCisJbXRr
X21pcGlfdHhfdXBkYXRlX2JpdHMobWlwaV90eCwgTUlQSVRYX1ZPTFRBR0VfU0VMLAorCQkJCVJH
X0RTSV9IU1RYX0xET19SRUZfU0VMLAorCQkJCW1pcGlfdHgtPm1pcGl0eF9kcml2ZSA8PCA2KTsK
KwogCW10a19taXBpX3R4X3NldF9iaXRzKG1pcGlfdHgsIE1JUElUWF9DS19DS01PREVfRU4sIERT
SV9DS19DS01PREVfRU4pOwogfQogCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
