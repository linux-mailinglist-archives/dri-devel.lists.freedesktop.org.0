Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B04831AD1
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2019 11:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03147896A3;
	Sat,  1 Jun 2019 09:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3AA11896A3
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2019 09:26:31 +0000 (UTC)
X-UUID: 3e00882d8a9e47c7a0460bc89af5e646-20190601
X-UUID: 3e00882d8a9e47c7a0460bc89af5e646-20190601
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 996128453; Sat, 01 Jun 2019 17:26:27 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sat, 1 Jun 2019 17:26:26 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Sat, 1 Jun 2019 17:26:24 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 <linux-pwm@vger.kernel.org>, David Airlie <airlied@linux.ie>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [v4 4/7] drm/mediatek: add frame size control
Date: Sat, 1 Jun 2019 17:26:12 +0800
Message-ID: <20190601092615.67917-5-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190601092615.67917-1-jitao.shi@mediatek.com>
References: <20190601092615.67917-1-jitao.shi@mediatek.com>
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

T3VyIG5ldyBEU0kgY2hpcCBoYXMgZnJhbWUgc2l6ZSBjb250cm9sLgpTbyBhZGQgdGhlIGRyaXZl
ciBkYXRhIHRvIGNvbnRyb2wgZm9yIGRpZmZlcmVudCBjaGlwcy4KClNpZ25lZC1vZmYtYnk6IEpp
dGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5o
dUBtZWRpYXRlay5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8
IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kc2kuYwppbmRleCBlZWE0NzI5NDA3OWUuLjE4YTE5MjY1NmE4OSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RzaS5jCkBAIC03OCw2ICs3OCw3IEBACiAjZGVmaW5lIERTSV9WQlBf
TkwJCTB4MjQKICNkZWZpbmUgRFNJX1ZGUF9OTAkJMHgyOAogI2RlZmluZSBEU0lfVkFDVF9OTAkJ
MHgyQworI2RlZmluZSBEU0lfU0laRV9DT04JCTB4MzgKICNkZWZpbmUgRFNJX0hTQV9XQwkJMHg1
MAogI2RlZmluZSBEU0lfSEJQX1dDCQkweDU0CiAjZGVmaW5lIERTSV9IRlBfV0MJCTB4NTgKQEAg
LTE2Miw2ICsxNjMsNyBAQCBzdHJ1Y3QgcGh5Owogc3RydWN0IG10a19kc2lfZHJpdmVyX2RhdGEg
ewogCWNvbnN0IHUzMiByZWdfY21kcV9vZmY7CiAJYm9vbCBoYXNfc2hhZG93X2N0bDsKKwlib29s
IGhhc19zaXplX2N0bDsKIH07CiAKIHN0cnVjdCBtdGtfZHNpIHsKQEAgLTQzMCw2ICs0MzIsOSBA
QCBzdGF0aWMgdm9pZCBtdGtfZHNpX2NvbmZpZ192ZG9fdGltaW5nKHN0cnVjdCBtdGtfZHNpICpk
c2kpCiAJd3JpdGVsKHZtLT52ZnJvbnRfcG9yY2gsIGRzaS0+cmVncyArIERTSV9WRlBfTkwpOwog
CXdyaXRlbCh2bS0+dmFjdGl2ZSwgZHNpLT5yZWdzICsgRFNJX1ZBQ1RfTkwpOwogCisJaWYgKGRz
aS0+ZHJpdmVyX2RhdGEtPmhhc19zaXplX2N0bCkKKwkJd3JpdGVsKHZtLT52YWN0aXZlIDw8IDE2
IHwgdm0tPmhhY3RpdmUsIGRzaS0+cmVncyArIERTSV9TSVpFX0NPTik7CisKIAlob3Jpem9udGFs
X3N5bmNfYWN0aXZlX2J5dGUgPSAodm0tPmhzeW5jX2xlbiAqIGRzaV90bXBfYnVmX2JwcCAtIDEw
KTsKIAogCWlmIChkc2ktPm1vZGVfZmxhZ3MgJiBNSVBJX0RTSV9NT0RFX1ZJREVPX1NZTkNfUFVM
U0UpCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
