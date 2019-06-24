Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DC050410
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 10:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCFE892D6;
	Mon, 24 Jun 2019 08:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id B5359892D6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 08:00:26 +0000 (UTC)
X-UUID: 4df9ad2db7f34262b2caaf3c9ba8a30a-20190624
X-UUID: 4df9ad2db7f34262b2caaf3c9ba8a30a-20190624
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 260803277; Mon, 24 Jun 2019 16:00:23 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 24 Jun 2019 16:00:21 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Mon, 24 Jun 2019 16:00:20 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 <linux-pwm@vger.kernel.org>, David Airlie <airlied@linux.ie>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [v2 0/2] add auo,kd101n80-45a panel driver
Date: Mon, 24 Jun 2019 15:59:59 +0800
Message-ID: <20190624080001.67222-1-jitao.shi@mediatek.com>
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

Q2hhbmdlcyBzaW5jZSB2MToKIC0gbWVyZ2UgYXVvLGtkMTAxbjgwLTQ1YSBhbmQgYm9lLHR2MTAx
d3VtLW5sNiBpbiBvbmUgZHJpdmVyCgpUaGlzIHBhdGNoIGlzIGJhc2VkIG9uIHY1LjItcmMxIGFu
ZCB0aGVzZSBwYXRjaGVzOgpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL2NvdmVyLzExMDEy
MzU1LwpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMDEyMzQ1LwpodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMDEyMzQ5LwoKSml0YW8gU2hpICgyKToKICBk
dC1iaW5kaW5nczogZGlzcGxheTogcGFuZWw6IGFkZCBhdW8ga2QxMDFuODAtNDVuYSBwYW5lbCBi
aW5kaW5ncwogIGRybS9wYW5lbDogc3VwcG9ydCBmb3IgYXVvLGtkMTAxbjgwLTQ1bmEgd3V4Z2Eg
ZHNpIHZpZGVvIG1vZGUgcGFuZWwKCiAuLi4vZGlzcGxheS9wYW5lbC9hdW8sa2QxMDFuODAtNDVu
YS50eHQgICAgICAgfCAzNCArKysrKysrKysrKysrKysrCiAuLi4vZ3B1L2RybS9wYW5lbC9wYW5l
bC1ib2UtdHYxMDF3dW0tbmw2LmMgICAgfCA0MCArKysrKysrKysrKysrKysrKysrCiAyIGZpbGVz
IGNoYW5nZWQsIDc0IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hdW8sa2QxMDFuODAtNDVuYS50
eHQKCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
