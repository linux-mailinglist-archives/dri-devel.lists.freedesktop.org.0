Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD0555F35
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 04:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BEB3893DB;
	Wed, 26 Jun 2019 02:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3419F89148
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 02:54:17 +0000 (UTC)
X-UUID: 2125a70a8691468e9fdfe5d8dcd3e683-20190626
X-UUID: 2125a70a8691468e9fdfe5d8dcd3e683-20190626
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 950348979; Wed, 26 Jun 2019 10:54:10 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 26 Jun 2019 10:54:09 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Wed, 26 Jun 2019 10:54:06 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 <linux-pwm@vger.kernel.org>, David Airlie <airlied@linux.ie>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [v3 1/4] dt-bindngs: display: panel: Add BOE tv101wum-n16 panel
 bindings
Date: Wed, 26 Jun 2019 10:53:57 +0800
Message-ID: <20190626025400.109567-2-jitao.shi@mediatek.com>
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

QWRkIGRvY3VtZW50YXRpb24gZm9yIGJvZSB0djEwMXd1bS1uMTYgcGFuZWwuCgpTaWduZWQtb2Zm
LWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Ci0tLQogLi4uL2Rpc3BsYXkv
cGFuZWwvYm9lLHR2MTAxd3VtLW5sNi50eHQgICAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9ib2UsdHYxMDF3
dW0tbmw2LnR4dAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3BhbmVsL2JvZSx0djEwMXd1bS1ubDYudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYm9lLHR2MTAxd3VtLW5sNi50eHQKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5iZDQ0YWY2MzYzOTAKLS0tIC9kZXYv
bnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5l
bC9ib2UsdHYxMDF3dW0tbmw2LnR4dApAQCAtMCwwICsxLDM0IEBACitCb2UgQ29ycG9yYXRpb24g
MTAuMSIgV1VYR0EgVEZUIExDRCBwYW5lbAorCitSZXF1aXJlZCBwcm9wZXJ0aWVzOgorLSBjb21w
YXRpYmxlOiBzaG91bGQgYmUgImJvZSx0djEwMXd1bS1ubDYiCistIHJlZzogdGhlIHZpcnR1YWwg
Y2hhbm5lbCBudW1iZXIgb2YgYSBEU0kgcGVyaXBoZXJhbAorLSBlbmFibGUtZ3Bpb3M6IGEgR1BJ
TyBzcGVjIGZvciB0aGUgZW5hYmxlIHBpbgorLSBwcDE4MDAtc3VwcGx5OiBjb3JlIHZvbHRhZ2Ug
c3VwcGx5CistIGF2ZGQtc3VwcGx5OiBwaGFuZGxlIG9mIHRoZSByZWd1bGF0b3IgdGhhdCBwcm92
aWRlcyBwb3NpdGl2ZSB2b2x0YWdlCistIGF2ZWUtc3VwcGx5OiBwaGFuZGxlIG9mIHRoZSByZWd1
bGF0b3IgdGhhdCBwcm92aWRlcyBuZWdhdGl2ZSB2b2x0YWdlCistIGJhY2tsaWdodDogcGhhbmRs
ZSBvZiB0aGUgYmFja2xpZ2h0IGRldmljZSBhdHRhY2hlZCB0byB0aGUgcGFuZWwKKworVGhlIGRl
dmljZSBub2RlIGNhbiBjb250YWluIG9uZSAncG9ydCcgY2hpbGQgbm9kZSB3aXRoIG9uZSBjaGls
ZAorJ2VuZHBvaW50JyBub2RlLCBhY2NvcmRpbmcgdG8gdGhlIGJpbmRpbmdzIGRlZmluZWQgaW4K
K21lZGlhL3ZpZGVvLWludGVyZmFjZXMudHh0LiBUaGlzIG5vZGUgc2hvdWxkIGRlc2NyaWJlIHBh
bmVsJ3MgdmlkZW8gYnVzLgorCitFeGFtcGxlOgorJmRzaSB7CisJLi4uCisJcGFuZWxAMCB7CisJ
CWNvbXBhdGlibGUgPSAiYm9lLHR2MTAxd3VtLW5sNiI7CisJCXJlZyA9IDwwPjsKKwkJZW5hYmxl
LWdwaW9zID0gPCZwaW8gNDUgMD47CisJCWF2ZGQtc3VwcGx5ID0gPCZwcHZhcm5fbGNkPjsKKwkJ
YXZlZS1zdXBwbHkgPSA8JnBwdmFycF9sY2Q+OworCQlwcDE4MDAtc3VwcGx5ID0gPCZwcDE4MDBf
bGNkPjsKKwkJYmFja2xpZ2h0ID0gPCZiYWNrbGlnaHRfbGNkMD47CisJCXN0YXR1cyA9ICJva2F5
IjsKKwkJcG9ydCB7CisJCQlwYW5lbF9pbjogZW5kcG9pbnQgeworCQkJCXJlbW90ZS1lbmRwb2lu
dCA9IDwmZHNpX291dD47CisJCQl9OworCQl9OworCX07Cit9OwotLSAKMi4yMS4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
