Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 736FB31ACA
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2019 11:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213E8892D6;
	Sat,  1 Jun 2019 09:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0DFFE892D6
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2019 09:26:25 +0000 (UTC)
X-UUID: 27c8530086f9486db697b69fb0584e58-20190601
X-UUID: 27c8530086f9486db697b69fb0584e58-20190601
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1148342631; Sat, 01 Jun 2019 17:26:21 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sat, 1 Jun 2019 17:26:19 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Sat, 1 Jun 2019 17:26:18 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 <linux-pwm@vger.kernel.org>, David Airlie <airlied@linux.ie>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [v4 0/7] Support dsi for mt8183
Date: Sat, 1 Jun 2019 17:26:08 +0800
Message-ID: <20190601092615.67917-1-jitao.shi@mediatek.com>
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

Y2hhbmdlcyBzaW5jZSB2MwogLSBhZGQgb25lIG1vcmUgJ3RhYicgZm9yIGJpdHdpc2UgZGVmaW5l
LgogLSBhZGQgVGVzdGVkLWJ5OiBSeWFuIENhc2UgPHJ5YW5kY2FzZUBjaHJvbWl1bS5vcmc+Cglh
bmQgUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+LgogLSByZW1vdmUgY29t
cGFyZSBkYV9oc196ZXJvIHRvIGRhX2hzX3ByZXBhcmUuCgpDaGFuZ2VzIHNpbmNlIHYyOgogLSBj
aGFuZ2UgdGhlIHZpZGVvIHRpbWluZyBjYWxjIG1ldGhvZAogLSBmaW5lIHRoZSBkc2kgYW5kIG1p
cGl0eCBpbml0IHNlcXVlbmNlCiAtIGZpbmUgdHVuZSBjb21taXQgbXNnCgpDaGFuZ2VzIHNpbmNl
IHYxOgogLSBzZXBhcmF0ZSBmcmFtZSBzaXplIGFuZCByZWcgY29tbWl0IGNvbnRyb2wgaW5kZXBl
bmRlbnQgcGF0Y2hlcy4KIC0gZml4IHNvbWUgcmV0dXJuIHZhbHVlcyBpbiBwcm9iZQogLSByZW1v
dmUgRFNJX0NNRFcwIGluICJDTURRIHJlZyBhZGRyZXNzIG9mIG10ODE3MyBpcyBkaWZmZXJlbnQg
d2l0aCBtdDI3MDEiIAoKSml0YW8gU2hpICg3KToKICBkcm0vbWVkaWF0ZWs6IG1vdmUgbWlwaV9k
c2lfaG9zdF9yZWdpc3RlciB0byBwcm9iZQogIGRybS9tZWRpYXRlazogZml4ZXMgQ01EUSByZWcg
YWRkcmVzcyBvZiBtdDgxNzMgaXMgZGlmZmVyZW50IHdpdGgKICAgIG10MjcwMQogIGRybS9tZWRp
YXRlazogYWRkIGRzaSByZWcgY29tbWl0IGRpc2FibGUgY29udHJvbAogIGRybS9tZWRpYXRlazog
YWRkIGZyYW1lIHNpemUgY29udHJvbAogIGRybS9tZWRpYXRlazogYWRkIG10ODE4MyBkc2kgZHJp
dmVyIHN1cHBvcnQKICBkcm0vbWVkaWF0ZWs6IGNoYW5nZSB0aGUgZHNpIHBoeXRpbWluZyBjYWxj
dWxhdGUgbWV0aG9kCiAgZHJtOiBtZWRpYXRlazogYWRqdXN0IGRzaSBhbmQgbWlwaV90eCBwcm9i
ZSBzZXF1ZW5jZQoKIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIHwgICAy
ICstCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jICAgICB8IDIyMiArKysrKysr
KysrKysrKysrKystLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDE2MCBpbnNlcnRpb25zKCspLCA2
NCBkZWxldGlvbnMoLSkKCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
