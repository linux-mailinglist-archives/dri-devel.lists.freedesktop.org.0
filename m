Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36411890E1
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 11:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D536E30B;
	Sun, 11 Aug 2019 09:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0A8F46E303
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 09:10:17 +0000 (UTC)
X-UUID: 05ffea0b1da64af4b9ab527241d52319-20190811
X-UUID: 05ffea0b1da64af4b9ab527241d52319-20190811
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 313713411; Sun, 11 Aug 2019 17:10:12 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sun, 11 Aug 2019 17:10:06 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Sun, 11 Aug 2019 17:10:04 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 <linux-pwm@vger.kernel.org>, David Airlie <airlied@linux.ie>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 0/4] Add drivers for auo, kd101n80-45na and boe,
 tv101wum-nl6 panels
Date: Sun, 11 Aug 2019 17:09:57 +0800
Message-ID: <20190811091001.49555-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 13D0A12DC02939C6C15BF9FF5D1853EE5ED675A5B964FD3864D887C10CD6F7A02000:8
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

Q2hhbmdlcyBzaW5jZSB2MzoKIC0gcmVtb3ZlIGNoZWNrIGVuYWJsZV9ncGlvLgogLSBmaW5lIHR1
bmUgdGhlIGF1byxrZDEwMW44MC00NW5hIHBhbmVsJ3MgcG93ZXIgb24gdGltaW5nLgoKQ2hhbmdl
cyBzaW5jZSB2MjoKIC0gY29ycmVjdCB0aGUgcGFuZWwgc2l6ZQogLSByZW1vdmUgYmxhbmsgbGlu
ZSBpbiBLY29uZmlnCiAtIG1vdmUgYXVvLGtkMTAxbjgwLTQ1bmEgcGFuZWwgZHJpdmVyIGluIHRo
aXMgc2VyaWVzLgoKQ2hhbmdlcyBzaW5jZSB2MToKCiAtIHVwZGF0ZSB0eXBvIG5sNiAtPiBuMTYu
CiAtIHVwZGF0ZSBuZXcgcGFuZWwgY29uZmlnIGFuZCBtYWtlZmlsZSBhcmUgYWRkZWQgaW4gYWxw
aGFiZXRpY2FsbHkgb3JkZXIuCiAtIGFkZCB0aGUgcGFuZWwgbW9kZSBhbmQgcGFuZWwgaW5mbyBp
biBkcml2ZXIgZGF0YS4KIC0gbWVyZ2UgYXVvLGtkMTAxbjgwLTQ1YSBhbmQgYm9lLHR2MTAxd3Vt
LW5sNiBpbiBvbmUgZHJpdmVyCgpKaXRhbyBTaGkgKDQpOgogIGR0LWJpbmRpbmdzOiBkaXNwbGF5
OiBwYW5lbDogQWRkIEJPRSB0djEwMXd1bS1uMTYgcGFuZWwgYmluZGluZ3MKICBkcm0vcGFuZWw6
IHN1cHBvcnQgZm9yIEJPRSB0djEwMXd1bS1ubDYgd3V4Z2EgZHNpIHZpZGVvIG1vZGUgcGFuZWwK
ICBkdC1iaW5kaW5nczogZGlzcGxheTogcGFuZWw6IGFkZCBhdW8ga2QxMDFuODAtNDVuYSBwYW5l
bCBiaW5kaW5ncwogIGRybS9wYW5lbDogc3VwcG9ydCBmb3IgYXVvLGtkMTAxbjgwLTQ1bmEgd3V4
Z2EgZHNpIHZpZGVvIG1vZGUgcGFuZWwKCiAuLi4vZGlzcGxheS9wYW5lbC9hdW8sa2QxMDFuODAt
NDVuYS50eHQgICAgICAgfCAgMzQgKwogLi4uL2Rpc3BsYXkvcGFuZWwvYm9lLHR2MTAxd3VtLW5s
Ni50eHQgICAgICAgIHwgIDM0ICsKIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9LY29uZmlnICAgICAg
ICAgICAgICAgICB8ICAgOSArCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvTWFrZWZpbGUgICAgICAg
ICAgICAgICAgfCAgIDEgKwogLi4uL2dwdS9kcm0vcGFuZWwvcGFuZWwtYm9lLXR2MTAxd3VtLW5s
Ni5jICAgIHwgNzYxICsrKysrKysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA4MzkgaW5z
ZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3BhbmVsL2F1byxrZDEwMW44MC00NW5hLnR4dAogY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2Jv
ZSx0djEwMXd1bS1ubDYudHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3Bh
bmVsL3BhbmVsLWJvZS10djEwMXd1bS1ubDYuYwoKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
