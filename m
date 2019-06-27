Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E50D7579C1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 04:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEC089395;
	Thu, 27 Jun 2019 02:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8896D89395
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 02:59:11 +0000 (UTC)
X-UUID: ffb4565af9e24d95817df2acd956c6be-20190627
X-UUID: ffb4565af9e24d95817df2acd956c6be-20190627
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 275571923; Thu, 27 Jun 2019 10:59:05 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 27 Jun 2019 10:59:04 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Thu, 27 Jun 2019 10:59:02 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 <linux-pwm@vger.kernel.org>, David Airlie <airlied@linux.ie>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [v5 0/3] Support mipitx for mt8183
Date: Thu, 27 Jun 2019 10:58:58 +0800
Message-ID: <20190627025901.28418-1-jitao.shi@mediatek.com>
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

Q2hhbmdlIHNpbmNlIHY0OgogLSBmaW5lIHR1bmUgdGhlIG1pcGlfdHgtPnJlZl9jbGsgYW5kIG1p
cGlfdHgtPnBsbCBzZXF1ZW5jZQogICAxLiBQcmVwYXJlIG1pcGlfdHgtPnJlZl9jbGsKICAgMi4g
UHJlcGFyZSBtaXBpX3R4LT5wbGwKICAgMy4gRW5hYmxlIG1pcGlfdHgtPnJlZl9jbGsKICAgNC4g
RW5hYmxlIG1pcGlfdHgtPnBsbAoKQ2hhbmdlcyBzaW5jZSB2MzoKIC0gdHVybiBvZmYgUExMIGJl
Zm9yZSBzZXR0aW5nIFBMTCBwYXJhbWV0ZXJzLgoKQ2hhbmdlcyBzaW5jZSB2MjoKIC0gdXBkYXRl
IEFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgogLSB1cGRhdGUgbXQ4MTgz
IG1heCBiaXQgcmF0ZSBzdXBwb3J0CgpDaGFuZ2VzIHNpbmNlIHYxOgogLSB1cGRhdGUgZHQtYmlu
ZGluZ3MgZG9jdW1lbnQgZm9yIG10ODE4MyBtaXBpdHguCiAtIHJlbW92ZSBtdGtfbWlwaXR4X2Ns
a19nZXRfb3BzIGFuZCBhc3NpZ24gY2xrX29wcyBpbiBwcm9iZS4KIC0gZml4IHRoZSBsaW5jZW5j
ZQogLSByZW1vdmUgdHhkaXYxIGZyb20gbXRrX21pcGlfdHhfcGxsX3ByZXBhcmUKCkppdGFvIFNo
aSAoMyk6CiAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IG1lZGlhdGVrOiB1cGRhdGUgZHNpIHN1cHBv
cnRlZCBjaGlwcwogIGRybS9tZWRpYXRlazogc2VwYXJhdGUgbWlwaV90eCB0byBkaWZmZXJlbnQg
ZmlsZQogIGRybS9tZWRpYXRlazogYWRkIG1pcGlfdHggZHJpdmVyIGZvciBtdDgxODMKCiAuLi4v
ZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2kudHh0ICAgICAgICAgfCAgIDQgKy0KIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9NYWtlZmlsZSAgICAgICAgICAgICB8ICAgMiArCiBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX21pcGlfdHguYyAgICAgICAgfCAzNDUgKystLS0tLS0tLS0t
LS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX21pcGlfdHguaCAgICAgICAgfCAg
NTAgKysrCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210ODE3M19taXBpX3R4LmMgfCAy
ODkgKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210ODE4M19t
aXBpX3R4LmMgfCAxODEgKysrKysrKysrCiA2IGZpbGVzIGNoYW5nZWQsIDU1MCBpbnNlcnRpb25z
KCspLCAzMjEgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19taXBpX3R4LmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX210ODE3M19taXBpX3R4LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210ODE4M19taXBpX3R4LmMKCi0tIAoyLjIxLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
