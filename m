Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C69850418
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 10:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C533C892C9;
	Mon, 24 Jun 2019 08:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2344A892C9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 08:00:39 +0000 (UTC)
X-UUID: 38754436abf2429f8da264e9d1e305fd-20190624
X-UUID: 38754436abf2429f8da264e9d1e305fd-20190624
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 664715075; Mon, 24 Jun 2019 16:00:32 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 24 Jun 2019 16:00:31 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Mon, 24 Jun 2019 16:00:28 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 <linux-pwm@vger.kernel.org>, David Airlie <airlied@linux.ie>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [v2 2/2] drm/panel: support for auo,
 kd101n80-45na wuxga dsi video mode panel
Date: Mon, 24 Jun 2019 16:00:01 +0800
Message-ID: <20190624080001.67222-3-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190624080001.67222-1-jitao.shi@mediatek.com>
References: <20190624080001.67222-1-jitao.shi@mediatek.com>
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
bDYuYyAgICB8IDQwICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0MCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWJvZS10
djEwMXd1bS1ubDYuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtdHYxMDF3dW0t
bmw2LmMKaW5kZXggNmUwNmM4NTA2NjIzLi5kMWVlNDNjZmNiZTIgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtdHYxMDF3dW0tbmw2LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLWJvZS10djEwMXd1bS1ubDYuYwpAQCAtMzcyLDYgKzM3MiwxNSBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2luaXRfY21kIGJvZV9pbml0X2NtZFtdID0gewog
CXt9LAogfTsKIAorc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9pbml0X2NtZCBhdW9faW5pdF9j
bWRbXSA9IHsKKwlfSU5JVF9ERUxBWV9DTUQoMjQpLAorCV9JTklUX0RDU19DTUQoMHgxMSksCisJ
X0lOSVRfREVMQVlfQ01EKDEyMCksCisJX0lOSVRfRENTX0NNRCgweDI5KSwKKwlfSU5JVF9ERUxB
WV9DTUQoMTIwKSwKKwl7fSwKK307CisKIHN0YXRpYyBpbmxpbmUgc3RydWN0IGJvZV9wYW5lbCAq
dG9fYm9lX3BhbmVsKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQogewogCXJldHVybiBjb250YWlu
ZXJfb2YocGFuZWwsIHN0cnVjdCBib2VfcGFuZWwsIGJhc2UpOwpAQCAtNTcyLDYgKzU4MSwzNCBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgYm9lX3R2MTAxd3VtX25sNl9kZXNjID0g
ewogCS5pbml0X2NtZHMgPSBib2VfaW5pdF9jbWQsCiB9OwogCitzdGF0aWMgY29uc3Qgc3RydWN0
IGRybV9kaXNwbGF5X21vZGUgYXVvX2RlZmF1bHRfbW9kZSA9IHsKKwkuY2xvY2sgPSAxNTcwMDAs
CisJLmhkaXNwbGF5ID0gMTIwMCwKKwkuaHN5bmNfc3RhcnQgPSAxMjAwICsgODAsCisJLmhzeW5j
X2VuZCA9IDEyMDAgKyA4MCArIDI0LAorCS5odG90YWwgPSAxMjAwICsgODAgKyAyNCArIDM2LAor
CS52ZGlzcGxheSA9IDE5MjAsCisJLnZzeW5jX3N0YXJ0ID0gMTkyMCArIDE2LAorCS52c3luY19l
bmQgPSAxOTIwICsgMTYgKyA0LAorCS52dG90YWwgPSAxOTIwICsgMTYgKyA0ICsgMTYsCisJLnZy
ZWZyZXNoID0gNjAsCisJLnR5cGUgPSBEUk1fTU9ERV9UWVBFX0RSSVZFUiB8IERSTV9NT0RFX1RZ
UEVfUFJFRkVSUkVELAorfTsKKworc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIGF1b19r
ZDEwMW44MF80NW5hX2Rlc2MgPSB7CisJLm1vZGVzID0gJmF1b19kZWZhdWx0X21vZGUsCisJLmJw
YyA9IDgsCisJLnNpemUgPSB7CisJCS53aWR0aCA9IDIxNiwKKwkJLmhlaWdodCA9IDEzNSwKKwl9
LAorCS5sYW5lcyA9IDQsCisJLmZvcm1hdCA9IE1JUElfRFNJX0ZNVF9SR0I4ODgsCisJLm1vZGVf
ZmxhZ3MgPSBNSVBJX0RTSV9NT0RFX1ZJREVPIHwgTUlQSV9EU0lfTU9ERV9WSURFT19TWU5DX1BV
TFNFIHwKKwkJICAgICAgTUlQSV9EU0lfTU9ERV9MUE0sCisJLmluaXRfY21kcyA9IGF1b19pbml0
X2NtZCwKK307CisKIHN0YXRpYyBpbnQgYm9lX3BhbmVsX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX3Bh
bmVsICpwYW5lbCkKIHsKIAlzdHJ1Y3QgYm9lX3BhbmVsICpib2UgPSB0b19ib2VfcGFuZWwocGFu
ZWwpOwpAQCAtNjk1LDYgKzczMiw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IGJvZV9vZl9tYXRjaFtdID0gewogCXsgLmNvbXBhdGlibGUgPSAiYm9lLHR2MTAxd3VtLW5sNiIs
CiAJICAuZGF0YSA9ICZib2VfdHYxMDF3dW1fbmw2X2Rlc2MKIAl9LAorCXsgLmNvbXBhdGlibGUg
PSAiYXVvLGtkMTAxbjgwLTQ1bmEiLAorCSAgLmRhdGEgPSAmYXVvX2tkMTAxbjgwXzQ1bmFfZGVz
YworCX0sCiAJeyAvKiBzZW50aW5lbCAqLyB9CiB9OwogTU9EVUxFX0RFVklDRV9UQUJMRShvZiwg
Ym9lX29mX21hdGNoKTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
