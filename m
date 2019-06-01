Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FFB31B14
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2019 11:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4006E898BC;
	Sat,  1 Jun 2019 09:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7C989898C6
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2019 09:52:47 +0000 (UTC)
X-UUID: 89a4df0d271742b38f24409b7d29a041-20190601
X-UUID: 89a4df0d271742b38f24409b7d29a041-20190601
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 704681345; Sat, 01 Jun 2019 17:52:40 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sat, 1 Jun 2019 17:52:39 +0800
Received: from mszsdaap41.mediatek.inc (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sat, 1 Jun 2019 17:52:37 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 <linux-pwm@vger.kernel.org>, David Airlie <airlied@linux.ie>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [v4 0/3] Support mipitx for mt8183
Date: Sat, 1 Jun 2019 17:52:32 +0800
Message-ID: <20190601095235.9194-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
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

Q2hhbmdlcyBzaW5jZSB2MzoKIC0gdHVybiBvZmYgUExMIGJlZm9yZSBzZXR0aW5nIFBMTCBwYXJh
bWV0ZXJzLgoKQ2hhbmdlcyBzaW5jZSB2MjoKIC0gdXBkYXRlIEFja2VkLWJ5OiBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPgogLSB1cGRhdGUgbXQ4MTgzIG1heCBiaXQgcmF0ZSBzdXBwb3J0
CgpDaGFuZ2VzIHNpbmNlIHYxOgogLSB1cGRhdGUgZHQtYmluZGluZ3MgZG9jdW1lbnQgZm9yIG10
ODE4MyBtaXBpdHguCiAtIHJlbW92ZSBtdGtfbWlwaXR4X2Nsa19nZXRfb3BzIGFuZCBhc3NpZ24g
Y2xrX29wcyBpbiBwcm9iZS4KIC0gZml4IHRoZSBsaW5jZW5jZQogLSByZW1vdmUgdHhkaXYxIGZy
b20gbXRrX21pcGlfdHhfcGxsX3ByZXBhcmUKCkppdGFvIFNoaSAoMyk6CiAgZHQtYmluZGluZ3M6
IGRpc3BsYXk6IG1lZGlhdGVrOiB1cGRhdGUgZHNpIHN1cHBvcnRlZCBjaGlwcwogIGRybS9tZWRp
YXRlazogc2VwYXJhdGUgbWlwaV90eCB0byBkaWZmZXJlbnQgZmlsZQogIGRybS9tZWRpYXRlazog
YWRkIG1pcGlfdHggZHJpdmVyIGZvciBtdDgxODMKCiAuLi4vYmluZGluZ3MvZGlzcGxheS9tZWRp
YXRlay9tZWRpYXRlayxkc2kudHh0ICAgICB8ICAgMiArLQogZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL01ha2VmaWxlICAgICAgICAgICAgICAgICAgfCAgIDIgKwogZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19taXBpX3R4LmMgICAgICAgICAgICAgfCAzNDUgKystLS0tLS0tLS0tLS0tLS0t
LS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX21pcGlfdHguaCAgICAgICAgICAgICB8
ICA1MCArKysKIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQ4MTczX21pcGlfdHguYyAg
ICAgIHwgMjg5ICsrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X210ODE4M19taXBpX3R4LmMgICAgICB8IDE2MiArKysrKysrKysrCiA2IGZpbGVzIGNoYW5nZWQs
IDUzMCBpbnNlcnRpb25zKCspLCAzMjAgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19taXBpX3R4LmgKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210ODE3M19taXBpX3R4LmMKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210ODE4M19taXBpX3R4LmMK
Ci0tIAoyLjEyLjUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
