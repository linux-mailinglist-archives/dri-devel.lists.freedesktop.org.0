Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C307584446
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 08:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694486E613;
	Wed,  7 Aug 2019 06:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id EB0946E60E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 06:08:15 +0000 (UTC)
X-UUID: e0a996c9a3a44907ba62ee4ddd8ead28-20190807
X-UUID: e0a996c9a3a44907ba62ee4ddd8ead28-20190807
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1543499440; Wed, 07 Aug 2019 14:03:06 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 7 Aug 2019 14:03:02 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Wed, 7 Aug 2019 14:03:01 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 <linux-pwm@vger.kernel.org>, David Airlie <airlied@linux.ie>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5 0/4] add mt8183 dpi driver
Date: Wed, 7 Aug 2019 14:02:53 +0800
Message-ID: <20190807060257.57007-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: DCB0DFC6858284B6DFB1DC1FB7C2F36A5001F83DF042B729EFA399187E50DB232000:8
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

Q2hhbmdlcyBzaW5jZSB2NDoKIC0gbW92ZSBwaW4gbW9kZSBjb250cm9sIGFuZCBkdWFsIGVkZ2Ug
Y29udHJvbCB0byBkZXZlaWNlIHRyZWUuCiAtIHVwZGF0ZSBkdC1iaW5kaW5ncyBkb2N1bWVudCBm
b3IgcGluIG1vZGUgc3dhcCBhbmQgZHVhbCBlZGdlIGNvbnRyb2wuCgpDaGFuZ2VzIHNpbmNlIHYz
OgogLSBhZGQgZHBpIHBpbiBtb2RlIGNvbnRyb2wgd2hlbiBkcGkgb24gb3Igb2ZmLgogLSB1cGRh
dGUgZHBpIGR1YWwgZWRnZSBjb21tZW50LgoKQ2hhbmdlcyBzaW5jZSB2MjoKIC0gdXBkYXRlIGR0
LWJpbmRpbmdzIGRvY3VtZW50IGZvciBtdDgxODMgZHBpLgogLSBzZXBhcmF0ZSBkdWFsIGVkZ2Ug
bW9kZmljYXRpb24gYXMgaW5kZXBlbmRlbnQgcGF0Y2guCgpKaXRhbyBTaGkgKDQpOgogIGR0LWJp
bmRpbmdzOiBkaXNwbGF5OiBtZWRpYXRlazogdXBkYXRlIGRwaSAgc3VwcG9ydGVkIGNoaXBzCiAg
ZHJtL21lZGlhdGVrOiBkcGkgZHVhbCBlZGdlIHN1cHBvcnQKICBkcm0vbWVkaWF0ZWs6IGFkZCBt
dDgxODMgZHBpIGNsb2NrIGZhY3RvcgogIGRybS9tZWRpYXRlazogY29udHJvbCBkcGkgcGlucyBk
cGkgb3IgZ3BpbyBtb2RlIGluIG9uIG9yIG9mZgoKIC4uLi9kaXNwbGF5L21lZGlhdGVrL21lZGlh
dGVrLGRwaS50eHQgICAgICAgICB8IDExICsrKwogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcGkuYyAgICAgICAgICAgIHwgNzEgKysrKysrKysrKysrKysrKysrLQogMiBmaWxlcyBjaGFu
Z2VkLCA4MCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKLS0gCjIuMjEuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
