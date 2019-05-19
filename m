Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 569D222662
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 11:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548BA89135;
	Sun, 19 May 2019 09:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0D1BC89135
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 09:25:47 +0000 (UTC)
X-UUID: 79015d0926754553bd5b11c329f6a395-20190519
X-UUID: 79015d0926754553bd5b11c329f6a395-20190519
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1773354298; Sun, 19 May 2019 17:25:46 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sun, 19 May 2019 17:25:44 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Sun, 19 May 2019 17:25:43 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 Kumar Gala <galak@codeaurora.org>, <linux-pwm@vger.kernel.org>, David Airlie
 <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [v3 3/7] drm/mediatek: add dsi reg commit disable control
Date: Sun, 19 May 2019 17:25:33 +0800
Message-ID: <20190519092537.69053-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190519092537.69053-1-jitao.shi@mediatek.com>
References: <20190519092537.69053-1-jitao.shi@mediatek.com>
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

TmV3IERTSSBJUCBoYXMgc2hhZG93IHJlZ2lzdGVyIGFuZCB3b3JraW5nIHJlZy4gVGhlIHJlZ2lz
dGVyCnZhbHVlcyBhcmUgd3JpdGVuIHRvIHNoYWRvdyByZWdpc3Rlci4gQW5kIHRoZW4gdHJpZ2dl
ciB3aXRoCmNvbW1pdCByZWcsIHRoZSByZWdpc3RlciB2YWx1ZXMgd2lsbCBiZSBtb3ZlZCB3b3Jr
aW5nIHJlZ2lzdGVyLgoKVGhpcyBmdWNudGlvbiBpcyBkZWZ1YWx0IG9uLiBCdXQgdGhpcyBkcml2
ZXIgZG9lc24ndCB1c2UgdGhpcwpmdW5jdGlvbi4gU28gYWRkIHRoZSBkaXNhYmxlIGNvbnRyb2wu
CgpTaWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDEwICsrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMK
aW5kZXggYTQ4ZGIwNTZkZjZjLi5mZDM2Nzk4NWM3ZmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kc2kuYwpAQCAtMTMxLDYgKzEzMSwxMCBAQAogI2RlZmluZSBWTV9DTURfRU4JCQlCSVQoMCkK
ICNkZWZpbmUgVFNfVkZQX0VOCQkJQklUKDUpCiAKKyNkZWZpbmUgRFNJX1NIQURPV19ERUJVRwkw
eDE5MFUKKyNkZWZpbmUgRk9SQ0VfQ09NTUlUCQlCSVQoMCkKKyNkZWZpbmUgQllQQVNTX1NIQURP
VwkJQklUKDEpCisKICNkZWZpbmUgQ09ORklHCQkJCSgweGZmIDw8IDApCiAjZGVmaW5lIFNIT1JU
X1BBQ0tFVAkJCTAKICNkZWZpbmUgTE9OR19QQUNLRVQJCQkyCkBAIC0xNTcsNiArMTYxLDcgQEAg
c3RydWN0IHBoeTsKIAogc3RydWN0IG10a19kc2lfZHJpdmVyX2RhdGEgewogCWNvbnN0IHUzMiBy
ZWdfY21kcV9vZmY7CisJYm9vbCBoYXNfc2hhZG93X2N0bDsKIH07CiAKIHN0cnVjdCBtdGtfZHNp
IHsKQEAgLTU5NCw2ICs1OTksMTEgQEAgc3RhdGljIGludCBtdGtfZHNpX3Bvd2Vyb24oc3RydWN0
IG10a19kc2kgKmRzaSkKIAl9CiAKIAltdGtfZHNpX2VuYWJsZShkc2kpOworCisJaWYgKGRzaS0+
ZHJpdmVyX2RhdGEtPmhhc19zaGFkb3dfY3RsKQorCQl3cml0ZWwoRk9SQ0VfQ09NTUlUIHwgQllQ
QVNTX1NIQURPVywKKwkJICAgICAgIGRzaS0+cmVncyArIERTSV9TSEFET1dfREVCVUcpOworCiAJ
bXRrX2RzaV9yZXNldF9lbmdpbmUoZHNpKTsKIAltdGtfZHNpX3BoeV90aW1jb25maWcoZHNpKTsK
IAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
