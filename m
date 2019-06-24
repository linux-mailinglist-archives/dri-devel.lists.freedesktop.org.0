Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B62501CC
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 08:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3044B898ED;
	Mon, 24 Jun 2019 06:04:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id E3684898F0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 06:04:04 +0000 (UTC)
X-UUID: 37faa3dfd3304485aeab87bd66a4552f-20190624
X-UUID: 37faa3dfd3304485aeab87bd66a4552f-20190624
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1250748807; Mon, 24 Jun 2019 14:04:00 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 24 Jun 2019 14:03:51 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Mon, 24 Jun 2019 14:03:49 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, "Mark
 Rutland" <mark.rutland@arm.com>, Ian Campbell
 <ijc+devicetree@hellion.org.uk>, <linux-pwm@vger.kernel.org>, David Airlie
 <airlied@linux.ie>, "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [v2 0/2] Add BOE tv101wum-nl6 panel driver
Date: Mon, 24 Jun 2019 14:03:41 +0800
Message-ID: <20190624060343.62451-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1684-8.5.1010-24708.005
X-TM-AS-Result: No-3.897700-8.000000-10
X-TMASE-MatchedRID: dOSp9Mvb4gYsO+kVEfVuQuw8wbnnSw8b/qWl+m17jWGRoQLwUmtov4B5
 w6KBECW1+AJGIBv8BrccPMPBmVk68KKgpS1QMZdlQ4srjeRbxTY/pOSL72dTf+C8kJH0fC7Go8W
 MkQWv6iUoTQl7wNH8Pg1fA1QHegDv3QfwsVk0UbvqwGfCk7KUs1dJSLY83D7tT5zdiUMG61EtX1
 Ku9S0y2cJJw7Bu+2A7wBJhFox5jCMeK/2EmSeazhjzxtagfc5ZCL7s8Gn7821S9V8uD0rKaXWzn
 loeB3HaPQzwIbfiR5AMD9LTK+5Nny0c7FwZxiheftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.897700-8.000000
X-TMASE-Version: SMEX-12.5.0.1684-8.5.1010-24708.005
X-TM-SNTS-SMTP: E64738CD7F700C8353EFED01D393DEE921552EFA3212ABD26258D2E10059537E2000:8
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

Q2hhbmdlcyBzaW5jZSB2MToKCiAtIHVwZGF0ZSB0eXBvIG5sNiAtPiBuMTYuCiAtIHVwZGF0ZSBu
ZXcgcGFuZWwgY29uZmlnIGFuZCBtYWtlZmlsZSBhcmUgYWRkZWQgaW4gYWxwaGFiZXRpY2FsbHkg
b3JkZXIuCiAtIGFkZCB0aGUgcGFuZWwgbW9kZSBhbmQgcGFuZWwgaW5mbyBpbiBkcml2ZXIgZGF0
YS4KCkppdGFvIFNoaSAoMik6CiAgZHQtYmluZG5nczogZGlzcGxheTogcGFuZWw6IEFkZCBCT0Ug
dHYxMDF3dW0tbjE2IHBhbmVsIGJpbmRpbmdzCiAgZHJtL3BhbmVsOiBzdXBwb3J0IGZvciBCT0Ug
dHYxMDF3dW0tbmw2IHd1eGdhIGRzaSB2aWRlbyBtb2RlIHBhbmVsCgogLi4uL2Rpc3BsYXkvcGFu
ZWwvYm9lLHR2MTAxd3VtLW5sNi50eHQgICAgICAgIHwgIDM0ICsKIGRyaXZlcnMvZ3B1L2RybS9w
YW5lbC9LY29uZmlnICAgICAgICAgICAgICAgICB8ICAxMCArCiBkcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvTWFrZWZpbGUgICAgICAgICAgICAgICAgfCAgIDEgKwogLi4uL2dwdS9kcm0vcGFuZWwvcGFu
ZWwtYm9lLXR2MTAxd3VtLW5sNi5jICAgIHwgNzE1ICsrKysrKysrKysrKysrKysrKwogNCBmaWxl
cyBjaGFuZ2VkLCA3NjAgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2JvZSx0djEwMXd1bS1ubDYu
dHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWJvZS10
djEwMXd1bS1ubDYuYwoKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
