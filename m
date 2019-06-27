Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5648857DA0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 10:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53BA6E82F;
	Thu, 27 Jun 2019 08:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 301296E834
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 08:01:21 +0000 (UTC)
X-UUID: a61b840fda2c490888e41684eee737f0-20190627
X-UUID: a61b840fda2c490888e41684eee737f0-20190627
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1028844314; Thu, 27 Jun 2019 16:01:20 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 27 Jun 2019 16:01:19 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Thu, 27 Jun 2019 16:01:17 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 <linux-pwm@vger.kernel.org>, David Airlie <airlied@linux.ie>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [v5 0/7] Support dsi for mt8183
Date: Thu, 27 Jun 2019 16:01:08 +0800
Message-ID: <20190627080116.40264-1-jitao.shi@mediatek.com>
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

Q2hhbmdlIHNpbmNlIHY0OgogLSBtb3ZlIG1pcGlfZHNpX2hvc3RfdW5yZWdpdGVyKCkgdG8gLnJl
bW92ZSgpCiAtIGZpbmUgdHVuZSBhZGQgZnJhbWUgc2l6ZSBjb250cm9sIGNvZGluZyBzdHlsZQog
LSBjaGFuZ2UgdGhlIGRhdGEgdHlwZSBvZiBkYXRhX3JhdGUgYXMgdTMyLCBhbmQgYWRkIERJVl9S
T1VORF9VUF9VTEwKIC0gdXNlIGRpdl91NjQgd2hlbiA4MDAwMDAwMDAwVUxMIC8gZHNpLT5kYXRh
X3JhdGUuCgpDaGFuZ2VzIHNpbmNlIHYzCiAtIGFkZCBvbmUgbW9yZSAndGFiJyBmb3IgYml0d2lz
ZSBkZWZpbmUuCiAtIGFkZCBUZXN0ZWQtYnk6IFJ5YW4gQ2FzZSA8cnlhbmRjYXNlQGNocm9taXVt
Lm9yZz4KCWFuZCBSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4uCiAtIHJl
bW92ZSBjb21wYXJlIGRhX2hzX3plcm8gdG8gZGFfaHNfcHJlcGFyZS4KCkNoYW5nZXMgc2luY2Ug
djI6CiAtIGNoYW5nZSB0aGUgdmlkZW8gdGltaW5nIGNhbGMgbWV0aG9kCiAtIGZpbmUgdGhlIGRz
aSBhbmQgbWlwaXR4IGluaXQgc2VxdWVuY2UKIC0gZmluZSB0dW5lIGNvbW1pdCBtc2cKCkNoYW5n
ZXMgc2luY2UgdjE6CiAtIHNlcGFyYXRlIGZyYW1lIHNpemUgYW5kIHJlZyBjb21taXQgY29udHJv
bCBpbmRlcGVuZGVudCBwYXRjaGVzLgogLSBmaXggc29tZSByZXR1cm4gdmFsdWVzIGluIHByb2Jl
CiAtIHJlbW92ZSBEU0lfQ01EVzAgaW4gIkNNRFEgcmVnIGFkZHJlc3Mgb2YgbXQ4MTczIGlzIGRp
ZmZlcmVudCB3aXRoIG10MjcwMSIgCgpKaXRhbyBTaGkgKDcpOgogIGRybS9tZWRpYXRlazogbW92
ZSBtaXBpX2RzaV9ob3N0X3JlZ2lzdGVyIHRvIHByb2JlCiAgZHJtL21lZGlhdGVrOiBmaXhlcyBD
TURRIHJlZyBhZGRyZXNzIG9mIG10ODE3MyBpcyBkaWZmZXJlbnQgd2l0aAogICAgbXQyNzAxCiAg
ZHJtL21lZGlhdGVrOiBhZGQgZHNpIHJlZyBjb21taXQgZGlzYWJsZSBjb250cm9sCiAgZHJtL21l
ZGlhdGVrOiBhZGQgZnJhbWUgc2l6ZSBjb250cm9sCiAgZHJtL21lZGlhdGVrOiBhZGQgbXQ4MTgz
IGRzaSBkcml2ZXIgc3VwcG9ydAogIGRybS9tZWRpYXRlazogY2hhbmdlIHRoZSBkc2kgcGh5dGlt
aW5nIGNhbGN1bGF0ZSBtZXRob2QKICBkcm06IG1lZGlhdGVrOiBhZGp1c3QgZHNpIGFuZCBtaXBp
X3R4IHByb2JlIHNlcXVlbmNlCgogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2
LmMgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgICAgIHwgMjIz
ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTYwIGluc2VydGlv
bnMoKyksIDY1IGRlbGV0aW9ucygtKQoKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
