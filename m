Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C070A22660
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 11:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307E789119;
	Sun, 19 May 2019 09:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1895189135
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 09:25:46 +0000 (UTC)
X-UUID: 3d6355b41ca74673bcbdeb2bcc2e9501-20190519
X-UUID: 3d6355b41ca74673bcbdeb2bcc2e9501-20190519
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 832463031; Sun, 19 May 2019 17:25:41 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sun, 19 May 2019 17:25:39 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Sun, 19 May 2019 17:25:38 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 Kumar Gala <galak@codeaurora.org>, <linux-pwm@vger.kernel.org>, David Airlie
 <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [v3 0/7] Support dsi for mt8183
Date: Sun, 19 May 2019 17:25:30 +0800
Message-ID: <20190519092537.69053-1-jitao.shi@mediatek.com>
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

Q2hhbmdlcyBzaW5jZSB2MjoKIC0gY2hhbmdlIHRoZSB2aWRlbyB0aW1pbmcgY2FsYyBtZXRob2QK
IC0gZmluZSB0aGUgZHNpIGFuZCBtaXBpdHggaW5pdCBzZXF1ZW5jZQogLSBmaW5lIHR1bmUgY29t
bWl0IG1zZwoKQ2hhbmdlcyBzaW5jZSB2MToKIC0gc2VwYXJhdGUgZnJhbWUgc2l6ZSBhbmQgcmVn
IGNvbW1pdCBjb250cm9sIGluZGVwZW5kZW50IHBhdGNoZXMuCiAtIGZpeCBzb21lIHJldHVybiB2
YWx1ZXMgaW4gcHJvYmUKIC0gcmVtb3ZlIERTSV9DTURXMCBpbiAiQ01EUSByZWcgYWRkcmVzcyBv
ZiBtdDgxNzMgaXMgZGlmZmVyZW50IHdpdGggbXQyNzAxIgoKSml0YW8gU2hpICg3KToKICBkcm0v
bWVkaWF0ZWs6IG1vdmUgbWlwaV9kc2lfaG9zdF9yZWdpc3RlciB0byBwcm9iZQogIGRybS9tZWRp
YXRlazogZml4ZXMgQ01EUSByZWcgYWRkcmVzcyBvZiBtdDgxNzMgaXMgZGlmZmVyZW50IHdpdGgK
ICAgIG10MjcwMQogIGRybS9tZWRpYXRlazogYWRkIGRzaSByZWcgY29tbWl0IGRpc2FibGUgY29u
dHJvbAogIGRybS9tZWRpYXRlazogYWRkIGZyYW1lIHNpemUgY29udHJvbAogIGRybS9tZWRpYXRl
azogYWRkIG10ODE4MyBkc2kgZHJpdmVyIHN1cHBvcnQKICBkcm0vbWVkaWF0ZWs6IGNoYW5nZSB0
aGUgZHNpIHBoeXRpbWluZyBjYWxjdWxhdGUgbWV0aG9kCiAgZHJtOiBtZWRpYXRlazogYWRqdXN0
IGRzaSBhbmQgbWlwaV90eCBwcm9iZSBzZXF1ZW5jZQoKIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2Rydi5jIHwgICAyICstCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rz
aS5jICAgICB8IDIxOSArKysrKysrKysrKysrKysrKystLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQs
IDE2MyBpbnNlcnRpb25zKCspLCA1OCBkZWxldGlvbnMoLSkKCi0tIAoyLjIxLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
