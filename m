Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DEAB739A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 08:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BE26F76E;
	Thu, 19 Sep 2019 06:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id A277B6F76E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 06:58:33 +0000 (UTC)
X-UUID: 51969a753a8048b5be65919e563adba8-20190919
X-UUID: 51969a753a8048b5be65919e563adba8-20190919
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1464290792; Thu, 19 Sep 2019 14:58:28 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 19 Sep 2019 14:58:27 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Thu, 19 Sep 2019 14:58:26 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 2/9] drm/mediatek: fixes CMDQ reg address of mt8173 is
 different with mt2701
Date: Thu, 19 Sep 2019 14:57:59 +0800
Message-ID: <20190919065806.111016-3-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190919065806.111016-1-jitao.shi@mediatek.com>
References: <20190919065806.111016-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1684-8.5.1010-24920.005
X-TM-AS-Result: No-7.650700-8.000000-10
X-TMASE-MatchedRID: QtNN9W95DWv0gpEqM7fvYUOLK43kW8U2S1zwNuiBtITfUZT83lbkEDtx
 n3LVDUz3mE9rrt2FS007C4OchexbKmiqvF73selK/NOUkr6ADzf54F/2i/DwjR6njTSt2k4LQmZ
 9+1UBYL2O9zp52KxB5/CUhGX/S6sVcsoJIwqzxXdHg88w74mNDhhH6ApagZfOmyiLZetSf8mfop
 0ytGwvXiq2rl3dzGQ17On12/VEXT79fPLpR7PjPY/h9OMMzYztLOgxgvEP22GJe9765PFY5MC+k
 sT6a9fy
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.650700-8.000000
X-TMASE-Version: SMEX-12.5.0.1684-8.5.1010-24920.005
X-TM-SNTS-SMTP: 292F1C6275C832023DFA06146F532A340F3DA9532514912C65DA1CABE8341F082000:8
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

Q29uZmlnIHRoZSBkaWZmZXJlbnQgQ01EUSByZWcgYWRkcmVzcyBpbiBkcml2ZXIgZGF0YS4KClNp
Z25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwppbmRleCA1MmI0OWRhZWVkOWYuLjdlMjRkMDNj
ZGNjYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCkBAIC0xMjMsNyArMTIzLDYgQEAK
ICNkZWZpbmUgVk1fQ01EX0VOCQkJQklUKDApCiAjZGVmaW5lIFRTX1ZGUF9FTgkJCUJJVCg1KQog
Ci0jZGVmaW5lIERTSV9DTURRMAkJMHgxODAKICNkZWZpbmUgQ09ORklHCQkJCSgweGZmIDw8IDAp
CiAjZGVmaW5lIFNIT1JUX1BBQ0tFVAkJCTAKICNkZWZpbmUgTE9OR19QQUNLRVQJCQkyCkBAIC0x
NDgsNiArMTQ3LDEwIEBACiAKIHN0cnVjdCBwaHk7CiAKK3N0cnVjdCBtdGtfZHNpX2RyaXZlcl9k
YXRhIHsKKwljb25zdCB1MzIgcmVnX2NtZHFfb2ZmOworfTsKKwogc3RydWN0IG10a19kc2kgewog
CXN0cnVjdCBtdGtfZGRwX2NvbXAgZGRwX2NvbXA7CiAJc3RydWN0IGRldmljZSAqZGV2OwpAQCAt
MTc0LDYgKzE3Nyw3IEBAIHN0cnVjdCBtdGtfZHNpIHsKIAlib29sIGVuYWJsZWQ7CiAJdTMyIGly
cV9kYXRhOwogCXdhaXRfcXVldWVfaGVhZF90IGlycV93YWl0X3F1ZXVlOworCWNvbnN0IHN0cnVj
dCBtdGtfZHNpX2RyaXZlcl9kYXRhICpkcml2ZXJfZGF0YTsKIH07CiAKIHN0YXRpYyBpbmxpbmUg
c3RydWN0IG10a19kc2kgKmVuY29kZXJfdG9fZHNpKHN0cnVjdCBkcm1fZW5jb2RlciAqZSkKQEAg
LTkzNiw2ICs5NDAsNyBAQCBzdGF0aWMgdm9pZCBtdGtfZHNpX2NtZHEoc3RydWN0IG10a19kc2kg
KmRzaSwgY29uc3Qgc3RydWN0IG1pcGlfZHNpX21zZyAqbXNnKQogCWNvbnN0IGNoYXIgKnR4X2J1
ZiA9IG1zZy0+dHhfYnVmOwogCXU4IGNvbmZpZywgY21kcV9zaXplLCBjbWRxX29mZiwgdHlwZSA9
IG1zZy0+dHlwZTsKIAl1MzIgcmVnX3ZhbCwgY21kcV9tYXNrLCBpOworCXUzMiByZWdfY21kcV9v
ZmYgPSBkc2ktPmRyaXZlcl9kYXRhLT5yZWdfY21kcV9vZmY7CiAKIAlpZiAoTVRLX0RTSV9IT1NU
X0lTX1JFQUQodHlwZSkpCiAJCWNvbmZpZyA9IEJUQTsKQEAgLTk1NSw5ICs5NjAsOSBAQCBzdGF0
aWMgdm9pZCBtdGtfZHNpX2NtZHEoc3RydWN0IG10a19kc2kgKmRzaSwgY29uc3Qgc3RydWN0IG1p
cGlfZHNpX21zZyAqbXNnKQogCX0KIAogCWZvciAoaSA9IDA7IGkgPCBtc2ctPnR4X2xlbjsgaSsr
KQotCQl3cml0ZWIodHhfYnVmW2ldLCBkc2ktPnJlZ3MgKyBEU0lfQ01EUTAgKyBjbWRxX29mZiAr
IGkpOworCQl3cml0ZWIodHhfYnVmW2ldLCBkc2ktPnJlZ3MgKyByZWdfY21kcV9vZmYgKyBjbWRx
X29mZiArIGkpOwogCi0JbXRrX2RzaV9tYXNrKGRzaSwgRFNJX0NNRFEwLCBjbWRxX21hc2ssIHJl
Z192YWwpOworCW10a19kc2lfbWFzayhkc2ksIHJlZ19jbWRxX29mZiwgY21kcV9tYXNrLCByZWdf
dmFsKTsKIAltdGtfZHNpX21hc2soZHNpLCBEU0lfQ01EUV9TSVpFLCBDTURRX1NJWkUsIGNtZHFf
c2l6ZSk7CiB9CiAKQEAgLTExMDEsNiArMTEwNiw4IEBAIHN0YXRpYyBpbnQgbXRrX2RzaV9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWlmIChyZXQpCiAJCWdvdG8gZXJyX3Vu
cmVnaXN0ZXJfaG9zdDsKIAorCWRzaS0+ZHJpdmVyX2RhdGEgPSBvZl9kZXZpY2VfZ2V0X21hdGNo
X2RhdGEoZGV2KTsKKwogCWRzaS0+ZW5naW5lX2NsayA9IGRldm1fY2xrX2dldChkZXYsICJlbmdp
bmUiKTsKIAlpZiAoSVNfRVJSKGRzaS0+ZW5naW5lX2NsaykpIHsKIAkJcmV0ID0gUFRSX0VSUihk
c2ktPmVuZ2luZV9jbGspOwpAQCAtMTE5NCw5ICsxMjAxLDE5IEBAIHN0YXRpYyBpbnQgbXRrX2Rz
aV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gMDsKIH0KIAor
c3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHNpX2RyaXZlcl9kYXRhIG10ODE3M19kc2lfZHJpdmVy
X2RhdGEgPSB7CisJLnJlZ19jbWRxX29mZiA9IDB4MjAwLAorfTsKKworc3RhdGljIGNvbnN0IHN0
cnVjdCBtdGtfZHNpX2RyaXZlcl9kYXRhIG10MjcwMV9kc2lfZHJpdmVyX2RhdGEgPSB7CisJLnJl
Z19jbWRxX29mZiA9IDB4MTgwLAorfTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgbXRrX2RzaV9vZl9tYXRjaFtdID0gewotCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQy
NzAxLWRzaSIgfSwKLQl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1kc2kiIH0sCisJ
eyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MDEtZHNpIiwKKwkgIC5kYXRhID0gJm10Mjcw
MV9kc2lfZHJpdmVyX2RhdGEgfSwKKwl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1k
c2kiLAorCSAgLmRhdGEgPSAmbXQ4MTczX2RzaV9kcml2ZXJfZGF0YSB9LAogCXsgfSwKIH07CiAK
LS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
