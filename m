Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 426B2222D6
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2019 11:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E935897D4;
	Sat, 18 May 2019 09:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1BC91897E3
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2019 09:56:31 +0000 (UTC)
X-UUID: 701dff21825947f598315e9ef2de7a5d-20190518
X-UUID: 701dff21825947f598315e9ef2de7a5d-20190518
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 2056482893; Sat, 18 May 2019 17:56:27 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sat, 18 May 2019 17:56:26 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Sat, 18 May 2019 17:56:24 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 Kumar Gala <galak@codeaurora.org>, <linux-pwm@vger.kernel.org>, David Airlie
 <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [v4 3/5] drm/mediatek: add mt8183 dpi dual edge support
Date: Sat, 18 May 2019 17:56:16 +0800
Message-ID: <20190518095618.18454-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190518095618.18454-1-jitao.shi@mediatek.com>
References: <20190518095618.18454-1-jitao.shi@mediatek.com>
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

QWRkIG10ODE4MyBkdWFsIGVkZ2Ugc3VwcG9ydC4KRFBJIHNhbXBsZSB0aGUgZGF0YSBib3RoIHJp
c2luZyBhbmQgZmFsbGluZyBlZGdlLgpJdCBjYW4gcmVkdWNlIGhhbGYgZGF0YSBpbyBwaW5zLgoK
U2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgfCAxOSArKysrKysrKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RwaS5jCmluZGV4IGNjZWYzYWMxYzU2MC4uNzdlNmUwZjk5MTg4IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHBpLmMKQEAgLTY4Miw2ICs2ODIsMTYgQEAgc3RhdGljIHVuc2lnbmVkIGludCBt
dDI3MDFfY2FsY3VsYXRlX2ZhY3RvcihpbnQgY2xvY2spCiAJCXJldHVybiAyOwogfQogCitzdGF0
aWMgdW5zaWduZWQgaW50IG10ODE4M19jYWxjdWxhdGVfZmFjdG9yKGludCBjbG9jaykKK3sKKwlp
ZiAoY2xvY2sgPD0gMjcwMDApCisJCXJldHVybiA4OworCWVsc2UgaWYgKGNsb2NrIDw9IDE2NzAw
MCkKKwkJcmV0dXJuIDQ7CisJZWxzZQorCQlyZXR1cm4gMjsKK30KKwogc3RhdGljIGNvbnN0IHN0
cnVjdCBtdGtfZHBpX2NvbmYgbXQ4MTczX2NvbmYgPSB7CiAJLmNhbF9mYWN0b3IgPSBtdDgxNzNf
Y2FsY3VsYXRlX2ZhY3RvciwKIAkucmVnX2hfZnJlX2NvbiA9IDB4ZTAsCkBAIC02OTMsNiArNzAz
LDEyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RwaV9jb25mIG10MjcwMV9jb25mID0gewog
CS5lZGdlX3NlbF9lbiA9IHRydWUsCiB9OwogCitzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kcGlf
Y29uZiBtdDgxODNfY29uZiA9IHsKKwkuY2FsX2ZhY3RvciA9IG10ODE4M19jYWxjdWxhdGVfZmFj
dG9yLAorCS5yZWdfaF9mcmVfY29uID0gMHhlMCwKKwkuZHVhbF9lZGdlID0gdHJ1ZSwKK307CisK
IHN0YXRpYyBpbnQgbXRrX2RwaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
ewogCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7CkBAIC03ODgsNiArODA0LDkgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXRrX2RwaV9vZl9pZHNbXSA9IHsKIAl7
IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1kcGkiLAogCSAgLmRhdGEgPSAmbXQ4MTcz
X2NvbmYsCiAJfSwKKwl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My1kcGkiLAorCSAg
LmRhdGEgPSAmbXQ4MTgzX2NvbmYsCisJfSwKIAl7IH0sCiB9OwogCi0tIAoyLjIxLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
