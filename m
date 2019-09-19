Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DDBB73A0
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 08:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896436F820;
	Thu, 19 Sep 2019 06:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8CA4B6F7F8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 06:59:02 +0000 (UTC)
X-UUID: f092e54a8a1f438b8efefa4241ba82e4-20190919
X-UUID: f092e54a8a1f438b8efefa4241ba82e4-20190919
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 422631270; Thu, 19 Sep 2019 14:58:52 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 19 Sep 2019 14:58:48 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Thu, 19 Sep 2019 14:58:47 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 4/9] drm/mediatek: add dsi reg commit disable control
Date: Thu, 19 Sep 2019 14:58:01 +0800
Message-ID: <20190919065806.111016-5-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190919065806.111016-1-jitao.shi@mediatek.com>
References: <20190919065806.111016-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 385516D509B585D40308C5E4779C403A26E56BB96F717A801520CF961F1B2F8A2000:8
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

TmV3IERTSSBJUCBoYXMgc2hhZG93IHJlZ2lzdGVyIGFuZCB3b3JraW5nIHJlZy4gVGhlIHJlZ2lz
dGVyCnZhbHVlcyBhcmUgd3JpdGVuIHRvIHNoYWRvdyByZWdpc3Rlci4gQW5kIHRoZW4gdHJpZ2dl
ciB3aXRoCmNvbW1pdCByZWcsIHRoZSByZWdpc3RlciB2YWx1ZXMgd2lsbCBiZSBtb3ZlZCB3b3Jr
aW5nIHJlZ2lzdGVyLgoKVGhpcyBmdWNudGlvbiBpcyBkZWZ1YWx0IG9uLiBCdXQgdGhpcyBkcml2
ZXIgZG9lc24ndCB1c2UgdGhpcwpmdW5jdGlvbi4gU28gYWRkIHRoZSBkaXNhYmxlIGNvbnRyb2wu
CgpTaWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+ClJldmll
d2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHNpLmMgfCAxMCArKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNp
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCmluZGV4IGFjOGU4MGUzNzlm
Ny4uMzE0YmZiMWM4MjdiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKQEAgLTEyMyw2
ICsxMjMsMTAgQEAKICNkZWZpbmUgVk1fQ01EX0VOCQkJQklUKDApCiAjZGVmaW5lIFRTX1ZGUF9F
TgkJCUJJVCg1KQogCisjZGVmaW5lIERTSV9TSEFET1dfREVCVUcJMHgxOTBVCisjZGVmaW5lIEZP
UkNFX0NPTU1JVAkJCUJJVCgwKQorI2RlZmluZSBCWVBBU1NfU0hBRE9XCQkJQklUKDEpCisKICNk
ZWZpbmUgQ09ORklHCQkJCSgweGZmIDw8IDApCiAjZGVmaW5lIFNIT1JUX1BBQ0tFVAkJCTAKICNk
ZWZpbmUgTE9OR19QQUNLRVQJCQkyCkBAIC0xNDksNiArMTUzLDcgQEAgc3RydWN0IHBoeTsKIAog
c3RydWN0IG10a19kc2lfZHJpdmVyX2RhdGEgewogCWNvbnN0IHUzMiByZWdfY21kcV9vZmY7CisJ
Ym9vbCBoYXNfc2hhZG93X2N0bDsKIH07CiAKIHN0cnVjdCBtdGtfZHNpIHsKQEAgLTU4Niw2ICs1
OTEsMTEgQEAgc3RhdGljIGludCBtdGtfZHNpX3Bvd2Vyb24oc3RydWN0IG10a19kc2kgKmRzaSkK
IAl9CiAKIAltdGtfZHNpX2VuYWJsZShkc2kpOworCisJaWYgKGRzaS0+ZHJpdmVyX2RhdGEtPmhh
c19zaGFkb3dfY3RsKQorCQl3cml0ZWwoRk9SQ0VfQ09NTUlUIHwgQllQQVNTX1NIQURPVywKKwkJ
ICAgICAgIGRzaS0+cmVncyArIERTSV9TSEFET1dfREVCVUcpOworCiAJbXRrX2RzaV9yZXNldF9l
bmdpbmUoZHNpKTsKIAltdGtfZHNpX3BoeV90aW1jb25maWcoZHNpKTsKIAotLSAKMi4yMS4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
