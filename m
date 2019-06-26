Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0602255F42
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 04:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7036E258;
	Wed, 26 Jun 2019 02:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 275CC6E258
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 02:54:29 +0000 (UTC)
X-UUID: 64bf0259d5f24b26ae3ab6955a9b80fb-20190626
X-UUID: 64bf0259d5f24b26ae3ab6955a9b80fb-20190626
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 2013699147; Wed, 26 Jun 2019 10:54:19 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 26 Jun 2019 10:54:18 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Wed, 26 Jun 2019 10:54:15 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 <linux-pwm@vger.kernel.org>, David Airlie <airlied@linux.ie>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [v3 4/4] drm/panel: support for auo,
 kd101n80-45na wuxga dsi video mode panel
Date: Wed, 26 Jun 2019 10:54:00 +0800
Message-ID: <20190626025400.109567-5-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190626025400.109567-1-jitao.shi@mediatek.com>
References: <20190626025400.109567-1-jitao.shi@mediatek.com>
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

QXVvLGtkMTAxbjgwLTQ1bmEncyBjb25uZWN0b3IgaXMgc2FtZSBhcyBib2UsdHYxMDF3dW0tbmw2
LgpUaGUgbW9zdCBjb2RlcyBjYW4gYmUgcmV1c2UuClNvIGF1byxrZDEwMW44MC00NW5hIGFuZCBi
b2UsdHYxMDF3dW0tbmw2IHVzZSBvbmUgZHJpdmVyIGZpbGUuCkFkZCB0aGUgZGlmZmVyZW50IHBh
cnRzIGluIGRyaXZlciBkYXRhLgoKU2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlA
bWVkaWF0ZWsuY29tPgotLS0KIC4uLi9ncHUvZHJtL3BhbmVsL3BhbmVsLWJvZS10djEwMXd1bS1u
bDYuYyAgICB8IDM5ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzOSBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWJvZS10
djEwMXd1bS1ubDYuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtdHYxMDF3dW0t
bmw2LmMKaW5kZXggMzBkMWY1M2RjYmFmLi42ZmY0OWY5MDBjZDIgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtdHYxMDF3dW0tbmw2LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLWJvZS10djEwMXd1bS1ubDYuYwpAQCAtMzcyLDYgKzM3MiwxNSBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2luaXRfY21kIGJvZV9pbml0X2NtZFtdID0gewog
CXt9LAogfTsKIAorc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9pbml0X2NtZCBhdW9faW5pdF9j
bWRbXSA9IHsKKwlfSU5JVF9ERUxBWV9DTUQoMjQpLAorCV9JTklUX0RDU19DTUQoMHgxMSksCisJ
X0lOSVRfREVMQVlfQ01EKDEyMCksCisJX0lOSVRfRENTX0NNRCgweDI5KSwKKwlfSU5JVF9ERUxB
WV9DTUQoMTIwKSwKKwl7fSwKK307CisKIHN0YXRpYyBpbmxpbmUgc3RydWN0IGJvZV9wYW5lbCAq
dG9fYm9lX3BhbmVsKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQogewogCXJldHVybiBjb250YWlu
ZXJfb2YocGFuZWwsIHN0cnVjdCBib2VfcGFuZWwsIGJhc2UpOwpAQCAtNTcxLDYgKzU4MCwzMyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgYm9lX3R2MTAxd3VtX25sNl9kZXNjID0g
ewogCS5pbml0X2NtZHMgPSBib2VfaW5pdF9jbWQsCiB9OwogCitzdGF0aWMgY29uc3Qgc3RydWN0
IGRybV9kaXNwbGF5X21vZGUgYXVvX2RlZmF1bHRfbW9kZSA9IHsKKwkuY2xvY2sgPSAxNTcwMDAs
CisJLmhkaXNwbGF5ID0gMTIwMCwKKwkuaHN5bmNfc3RhcnQgPSAxMjAwICsgODAsCisJLmhzeW5j
X2VuZCA9IDEyMDAgKyA4MCArIDI0LAorCS5odG90YWwgPSAxMjAwICsgODAgKyAyNCArIDM2LAor
CS52ZGlzcGxheSA9IDE5MjAsCisJLnZzeW5jX3N0YXJ0ID0gMTkyMCArIDE2LAorCS52c3luY19l
bmQgPSAxOTIwICsgMTYgKyA0LAorCS52dG90YWwgPSAxOTIwICsgMTYgKyA0ICsgMTYsCisJLnZy
ZWZyZXNoID0gNjAsCit9OworCitzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgYXVvX2tk
MTAxbjgwXzQ1bmFfZGVzYyA9IHsKKwkubW9kZXMgPSAmYXVvX2RlZmF1bHRfbW9kZSwKKwkuYnBj
ID0gOCwKKwkuc2l6ZSA9IHsKKwkJLndpZHRoID0gMTM1LAorCQkuaGVpZ2h0ID0gMjE2LAorCX0s
CisJLmxhbmVzID0gNCwKKwkuZm9ybWF0ID0gTUlQSV9EU0lfRk1UX1JHQjg4OCwKKwkubW9kZV9m
bGFncyA9IE1JUElfRFNJX01PREVfVklERU8gfCBNSVBJX0RTSV9NT0RFX1ZJREVPX1NZTkNfUFVM
U0UgfAorCQkgICAgICBNSVBJX0RTSV9NT0RFX0xQTSwKKwkuaW5pdF9jbWRzID0gYXVvX2luaXRf
Y21kLAorfTsKKwogc3RhdGljIGludCBib2VfcGFuZWxfZ2V0X21vZGVzKHN0cnVjdCBkcm1fcGFu
ZWwgKnBhbmVsKQogewogCXN0cnVjdCBib2VfcGFuZWwgKmJvZSA9IHRvX2JvZV9wYW5lbChwYW5l
bCk7CkBAIC02OTQsNiArNzMwLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQg
Ym9lX29mX21hdGNoW10gPSB7CiAJeyAuY29tcGF0aWJsZSA9ICJib2UsdHYxMDF3dW0tbmw2IiwK
IAkgIC5kYXRhID0gJmJvZV90djEwMXd1bV9ubDZfZGVzYwogCX0sCisJeyAuY29tcGF0aWJsZSA9
ICJhdW8sa2QxMDFuODAtNDVuYSIsCisJICAuZGF0YSA9ICZhdW9fa2QxMDFuODBfNDVuYV9kZXNj
CisJfSwKIAl7IC8qIHNlbnRpbmVsICovIH0KIH07CiBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBi
b2Vfb2ZfbWF0Y2gpOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
