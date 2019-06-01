Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 163D531AD2
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2019 11:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F39C8977A;
	Sat,  1 Jun 2019 09:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9CF078970E
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2019 09:26:31 +0000 (UTC)
X-UUID: 409c71687c9f414ca5a8d44416e91596-20190601
X-UUID: 409c71687c9f414ca5a8d44416e91596-20190601
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 291581790; Sat, 01 Jun 2019 17:26:25 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sat, 1 Jun 2019 17:26:23 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Sat, 1 Jun 2019 17:26:21 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 <linux-pwm@vger.kernel.org>, David Airlie <airlied@linux.ie>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [v4 2/7] drm/mediatek: fixes CMDQ reg address of mt8173 is different
 with mt2701
Date: Sat, 1 Jun 2019 17:26:10 +0800
Message-ID: <20190601092615.67917-3-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190601092615.67917-1-jitao.shi@mediatek.com>
References: <20190601092615.67917-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
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
Cc: stonea168@163.com, dri-devel@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>, Ajay Kumar <ajaykumar.rs@samsung.com>,
 Vincent Palatin <vpalatin@chromium.org>, cawa.cheng@mediatek.com,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org,
 Jitao Shi <jitao.shi@mediatek.com>, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Rahul Sharma <rahul.sharma@samsung.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29uZmlnIHRoZSBkaWZmZXJlbnQgQ01EUSByZWcgYWRkcmVzcyBpbiBkcml2ZXIgZGF0YS4KClNp
Z25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgMjkgKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCmluZGV4IDZjNGFjMzdmOTgzZC4uYTQ4ZGIw
NTZkZjZjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKQEAgLTEzMSw3ICsxMzEsNiBA
QAogI2RlZmluZSBWTV9DTURfRU4JCQlCSVQoMCkKICNkZWZpbmUgVFNfVkZQX0VOCQkJQklUKDUp
CiAKLSNkZWZpbmUgRFNJX0NNRFEwCQkweDE4MAogI2RlZmluZSBDT05GSUcJCQkJKDB4ZmYgPDwg
MCkKICNkZWZpbmUgU0hPUlRfUEFDS0VUCQkJMAogI2RlZmluZSBMT05HX1BBQ0tFVAkJCTIKQEAg
LTE1Niw2ICsxNTUsMTAgQEAKIAogc3RydWN0IHBoeTsKIAorc3RydWN0IG10a19kc2lfZHJpdmVy
X2RhdGEgeworCWNvbnN0IHUzMiByZWdfY21kcV9vZmY7Cit9OworCiBzdHJ1Y3QgbXRrX2RzaSB7
CiAJc3RydWN0IG10a19kZHBfY29tcCBkZHBfY29tcDsKIAlzdHJ1Y3QgZGV2aWNlICpkZXY7CkBA
IC0xODIsNiArMTg1LDcgQEAgc3RydWN0IG10a19kc2kgewogCWJvb2wgZW5hYmxlZDsKIAl1MzIg
aXJxX2RhdGE7CiAJd2FpdF9xdWV1ZV9oZWFkX3QgaXJxX3dhaXRfcXVldWU7CisJY29uc3Qgc3Ry
dWN0IG10a19kc2lfZHJpdmVyX2RhdGEgKmRyaXZlcl9kYXRhOwogfTsKIAogc3RhdGljIGlubGlu
ZSBzdHJ1Y3QgbXRrX2RzaSAqZW5jb2Rlcl90b19kc2koc3RydWN0IGRybV9lbmNvZGVyICplKQpA
QCAtOTM0LDYgKzkzOCw3IEBAIHN0YXRpYyB2b2lkIG10a19kc2lfY21kcShzdHJ1Y3QgbXRrX2Rz
aSAqZHNpLCBjb25zdCBzdHJ1Y3QgbWlwaV9kc2lfbXNnICptc2cpCiAJY29uc3QgY2hhciAqdHhf
YnVmID0gbXNnLT50eF9idWY7CiAJdTggY29uZmlnLCBjbWRxX3NpemUsIGNtZHFfb2ZmLCB0eXBl
ID0gbXNnLT50eXBlOwogCXUzMiByZWdfdmFsLCBjbWRxX21hc2ssIGk7CisJdTMyIHJlZ19jbWRx
X29mZiA9IGRzaS0+ZHJpdmVyX2RhdGEtPnJlZ19jbWRxX29mZjsKIAogCWlmIChNVEtfRFNJX0hP
U1RfSVNfUkVBRCh0eXBlKSkKIAkJY29uZmlnID0gQlRBOwpAQCAtOTUzLDkgKzk1OCwxMSBAQCBz
dGF0aWMgdm9pZCBtdGtfZHNpX2NtZHEoc3RydWN0IG10a19kc2kgKmRzaSwgY29uc3Qgc3RydWN0
IG1pcGlfZHNpX21zZyAqbXNnKQogCX0KIAogCWZvciAoaSA9IDA7IGkgPCBtc2ctPnR4X2xlbjsg
aSsrKQotCQl3cml0ZWIodHhfYnVmW2ldLCBkc2ktPnJlZ3MgKyBEU0lfQ01EUTAgKyBjbWRxX29m
ZiArIGkpOworCQltdGtfZHNpX21hc2soZHNpLCAocmVnX2NtZHFfb2ZmICsgY21kcV9vZmYgKyBp
KSAmICh+MHgzVSksCisJCQkgICAgICgweGZmVUwgPDwgKCgoaSArIGNtZHFfb2ZmKSAmIDNVKSAq
IDhVKSksCisJCQkgICAgIHR4X2J1ZltpXSA8PCAoKChpICsgY21kcV9vZmYpICYgM1UpICogOFUp
KTsKIAotCW10a19kc2lfbWFzayhkc2ksIERTSV9DTURRMCwgY21kcV9tYXNrLCByZWdfdmFsKTsK
KwltdGtfZHNpX21hc2soZHNpLCByZWdfY21kcV9vZmYsIGNtZHFfbWFzaywgcmVnX3ZhbCk7CiAJ
bXRrX2RzaV9tYXNrKGRzaSwgRFNJX0NNRFFfU0laRSwgQ01EUV9TSVpFLCBjbWRxX3NpemUpOwog
fQogCkBAIC0xMTAxLDYgKzExMDgsOCBAQCBzdGF0aWMgaW50IG10a19kc2lfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAocmV0KQogCQlnb3RvIGVycl91bnJlZ2lzdGVy
X2hvc3Q7CiAKKwlkc2ktPmRyaXZlcl9kYXRhID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRl
dik7CisKIAlkc2ktPmVuZ2luZV9jbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCAiZW5naW5lIik7CiAJ
aWYgKElTX0VSUihkc2ktPmVuZ2luZV9jbGspKSB7CiAJCXJldCA9IFBUUl9FUlIoZHNpLT5lbmdp
bmVfY2xrKTsKQEAgLTExOTMsOSArMTIwMiwxOSBAQCBzdGF0aWMgaW50IG10a19kc2lfcmVtb3Zl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgbXRrX2RzaV9kcml2ZXJfZGF0YSBtdDgxNzNfZHNpX2RyaXZlcl9kYXRhID0g
eworCS5yZWdfY21kcV9vZmYgPSAweDIwMCwKK307CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRr
X2RzaV9kcml2ZXJfZGF0YSBtdDI3MDFfZHNpX2RyaXZlcl9kYXRhID0geworCS5yZWdfY21kcV9v
ZmYgPSAweDE4MCwKK307CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19k
c2lfb2ZfbWF0Y2hbXSA9IHsKLQl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1kc2ki
IH0sCi0JeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZHNpIiB9LAorCXsgLmNvbXBh
dGlibGUgPSAibWVkaWF0ZWssbXQyNzAxLWRzaSIsCisJICAuZGF0YSA9ICZtdDI3MDFfZHNpX2Ry
aXZlcl9kYXRhIH0sCisJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZHNpIiwKKwkg
IC5kYXRhID0gJm10ODE3M19kc2lfZHJpdmVyX2RhdGEgfSwKIAl7IH0sCiB9OwogCi0tIAoyLjIx
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
