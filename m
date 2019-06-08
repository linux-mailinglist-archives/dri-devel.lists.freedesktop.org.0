Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D3039D31
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 13:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D3C89216;
	Sat,  8 Jun 2019 11:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6FEA689216
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2019 11:23:55 +0000 (UTC)
X-UUID: f5d24a6debba4b7fbe5dfc8fd20563f6-20190608
X-UUID: f5d24a6debba4b7fbe5dfc8fd20563f6-20190608
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 128229433; Sat, 08 Jun 2019 19:23:48 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sat, 8 Jun 2019 19:23:46 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Sat, 8 Jun 2019 19:23:44 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 <linux-pwm@vger.kernel.org>, David Airlie <airlied@linux.ie>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [1/2] dt-bindings: display: panel: add AUO kd101n80-45na panel
 bindings
Date: Sat, 8 Jun 2019 19:23:41 +0800
Message-ID: <20190608112342.64416-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
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

QWRkIGRvY3VtZW50YXRpb24gZm9yIGF1byBrZDEwMW44MC00NW5hIHBhbmVsLgoKU2lnbmVkLW9m
Zi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgotLS0KIC4uLi9kaXNwbGF5
L3BhbmVsL2F1byxrZDEwMW44MC00NW5hLnR4dCAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYXVvLGtkMTAx
bjgwLTQ1bmEudHh0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvYXVvLGtkMTAxbjgwLTQ1bmEudHh0IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYXVvLGtkMTAxbjgwLTQ1bmEudHh0Cm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uNzcxNWNmNzAzNDMxCi0tLSAv
ZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvYXVvLGtkMTAxbjgwLTQ1bmEudHh0CkBAIC0wLDAgKzEsMzQgQEAKK0FVTyBDb3Jwb3Jh
dGlvbiAxMC4xIiBXVVhHQSBURlQgTENEIHBhbmVsCisKK1JlcXVpcmVkIHByb3BlcnRpZXM6Cist
IGNvbXBhdGlibGU6IHNob3VsZCBiZSAiYXVvLGtkMTAxbjgwLTQ1bmEiCistIHJlZzogdGhlIHZp
cnR1YWwgY2hhbm5lbCBudW1iZXIgb2YgYSBEU0kgcGVyaXBoZXJhbAorLSBlbmFibGUtZ3Bpb3M6
IGEgR1BJTyBzcGVjIGZvciB0aGUgZW5hYmxlIHBpbgorLSBwcDE4MDAtc3VwcGx5OiBjb3JlIHZv
bHRhZ2Ugc3VwcGx5CistIGF2ZGQtc3VwcGx5OiAKKy0gYXZlZS1zdXBwbHk6IAorLSBiYWNrbGln
aHQ6IHBoYW5kbGUgb2YgdGhlIGJhY2tsaWdodCBkZXZpY2UgYXR0YWNoZWQgdG8gdGhlIHBhbmVs
CisKK1RoZSBkZXZpY2Ugbm9kZSBjYW4gY29udGFpbiBvbmUgJ3BvcnQnIGNoaWxkIG5vZGUgd2l0
aCBvbmUgY2hpbGQKKydlbmRwb2ludCcgbm9kZSwgYWNjb3JkaW5nIHRvIHRoZSBiaW5kaW5ncyBk
ZWZpbmVkIGluCittZWRpYS92aWRlby1pbnRlcmZhY2VzLnR4dC4gVGhpcyBub2RlIHNob3VsZCBk
ZXNjcmliZSBwYW5lbCdzIHZpZGVvIGJ1cy4KKworRXhhbXBsZToKKyZkc2kgeworCS4uLgorCXBh
bmVsQDAgeworCQljb21wYXRpYmxlID0gImF1byxrZDEwMW44MC00NW5hIjsKKwkJcmVnID0gPDA+
OworCQllbmFibGUtZ3Bpb3MgPSA8JnBpbyA0NSAwPjsKKwkJYXZkZC1zdXBwbHkgPSA8JnBwdmFy
bl9sY2Q+OworCQlhdmVlLXN1cHBseSA9IDwmcHB2YXJwX2xjZD47CisJCXBwMTgwMC1zdXBwbHkg
PSA8JnBwMTgwMF9sY2Q+OworCQliYWNrbGlnaHQgPSA8JmJhY2tsaWdodF9sY2QwPjsKKwkJc3Rh
dHVzID0gIm9rYXkiOworCQlwb3J0IHsKKwkJCXBhbmVsX2luOiBlbmRwb2ludCB7CisJCQkJcmVt
b3RlLWVuZHBvaW50ID0gPCZkc2lfb3V0PjsKKwkJCX07CisJCX07CisJfTsKK307Ci0tIAoyLjIx
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
