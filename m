Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B937289155
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 12:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EDF6E32D;
	Sun, 11 Aug 2019 10:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id A0DF36E32E
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 10:40:52 +0000 (UTC)
X-UUID: 01ce1aa9166a4c46b2583896824e64f2-20190811
X-UUID: 01ce1aa9166a4c46b2583896824e64f2-20190811
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 2070566583; Sun, 11 Aug 2019 18:40:49 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sun, 11 Aug 2019 18:40:42 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Sun, 11 Aug 2019 18:40:40 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, "Mark
 Rutland" <mark.rutland@arm.com>, Ian Campbell
 <ijc+devicetree@hellion.org.uk>, <linux-pwm@vger.kernel.org>, David Airlie
 <airlied@linux.ie>, "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [PATCH v6 3/7] drm/mediatek: add dsi reg commit disable control
Date: Sun, 11 Aug 2019 18:40:04 +0800
Message-ID: <20190811104008.53372-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190811104008.53372-1-jitao.shi@mediatek.com>
References: <20190811104008.53372-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1684-8.5.1010-24840.000
X-TM-AS-Result: No-2.463500-8.000000-10
X-TMASE-MatchedRID: oPR0E2xDvMj83RazFYjhB26yfYFZzrGdZ9PKbshf5c4da1Vk3RqxONeu
 l29/x8ODkREoYNKTmnm1bKejN6nC5P1PYuSZ5yXpqJSK+HSPY++eEP0DdJrulgdkFovAReUovqn
 FtM6Nq/JrfJNHzOv42smzFW0zy93H2e1cwoB4RlggCPGiZqtI8LtubiieweWumyiLZetSf8mfop
 0ytGwvXiq2rl3dzGQ1F16aXoi8Z1nsRNjyF6mdIvibNsxjIyOzZ1+mV30ImeB7xZt7nWevYp7T7
 ZmkgQ/6rQnglSC76Hi7PnY3br2onAjrF1fOOaVbU6d6SdlHFEb4hUcAI3yp/uK9rB3JzW5/EdpX
 6vXt2EbHJ1PhMfPBow==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.463500-8.000000
X-TMASE-Version: SMEX-12.5.0.1684-8.5.1010-24840.000
X-TM-SNTS-SMTP: EDBE0AC4A9314A126DA0109F93C21AC6DABF309848B6EC1F8A5625B92627F2452000:8
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
