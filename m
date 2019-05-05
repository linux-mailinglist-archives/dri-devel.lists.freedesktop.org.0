Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2132F13F0B
	for <lists+dri-devel@lfdr.de>; Sun,  5 May 2019 13:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6761E8921D;
	Sun,  5 May 2019 11:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 690188921D
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2019 11:05:30 +0000 (UTC)
X-UUID: 50de33d18ed242f0b4ed2b3803ffa4bc-20190505
X-UUID: 50de33d18ed242f0b4ed2b3803ffa4bc-20190505
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 276273827; Sun, 05 May 2019 19:05:27 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sun, 5 May 2019 19:05:25 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Sun, 5 May 2019 19:05:24 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 Kumar Gala <galak@codeaurora.org>, <linux-pwm@vger.kernel.org>, David Airlie
 <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 1/2] arm64: dts: mt8183: add dsi node
Date: Sun, 5 May 2019 19:05:16 +0800
Message-ID: <20190505110517.965-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190505110517.965-1-jitao.shi@mediatek.com>
References: <20190505110517.965-1-jitao.shi@mediatek.com>
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

QWRkIGRzaSBhbmQgbWlwaXR4IG5vZGVzIHRvIHRoZSBtdDgxODMKClNpZ25lZC1vZmYtYnk6IEpp
dGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KLS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRz
L21lZGlhdGVrL210ODE4My5kdHNpIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVr
L210ODE4My5kdHNpCmluZGV4IGIzNmUzN2ZjZGZlMy4uODRmNDY1ZmE0ZmFjIDEwMDY0NAotLS0g
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My5kdHNpCisrKyBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kKQEAgLTM1Myw2ICszNTMsMTYgQEAKIAkJ
CXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCX07CiAKKwkJbWlwaV90eDA6IG1pcGktZHBoeUAxMWU1
MDAwMCB7CisJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My1taXBpLXR4IjsKKwkJCXJl
ZyA9IDwwIDB4MTFlNTAwMDAgMCAweDEwMDA+OworCQkJY2xvY2tzID0gPCZhcG1peGVkc3lzIENM
S19BUE1JWEVEX01JUElEMF8yNk0+OworCQkJY2xvY2stbmFtZXMgPSAicmVmX2NsayI7CisJCQkj
Y2xvY2stY2VsbHMgPSA8MD47CisJCQkjcGh5LWNlbGxzID0gPDA+OworCQkJY2xvY2stb3V0cHV0
LW5hbWVzID0gIm1pcGlfdHgwX3BsbCI7CisJCX07CisKIAkJbWZnY2ZnOiBzeXNjb25AMTMwMDAw
MDAgewogCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODMtbWZnY2ZnIiwgInN5c2NvbiI7
CiAJCQlyZWcgPSA8MCAweDEzMDAwMDAwIDAgMHgxMDAwPjsKQEAgLTM2NSw2ICszNzUsMjAgQEAK
IAkJCSNjbG9jay1jZWxscyA9IDwxPjsKIAkJfTsKIAorCQlkc2kwOiBkc2lAMTQwMTQwMDAgewor
CQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODMtZHNpIjsKKwkJCXJlZyA9IDwwIDB4MTQw
MTQwMDAgMCAweDEwMDA+OworCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDIzNiBJUlFfVFlQRV9M
RVZFTF9MT1c+OworCQkJcG93ZXItZG9tYWlucyA9IDwmc2Nwc3lzIE1UODE4M19QT1dFUl9ET01B
SU5fRElTUD47CisJCQltZWRpYXRlayxzeXNjb24tZHNpID0gPCZtbXN5cyAweDE0MD47CisJCQlj
bG9ja3MgPSA8Jm1tc3lzIENMS19NTV9EU0kwX01NPiwKKwkJCQk8Jm1tc3lzIENMS19NTV9EU0kw
X0lGPiwKKwkJCQk8Jm1pcGlfdHgwPjsKKwkJCWNsb2NrLW5hbWVzID0gImVuZ2luZSIsICJkaWdp
dGFsIiwgImhzIjsKKwkJCXBoeXMgPSA8Jm1pcGlfdHgwPjsKKwkJCXBoeS1uYW1lcyA9ICJkcGh5
IjsKKwkJfTsKKwogCQlzbWlfY29tbW9uOiBzbWlAMTQwMTkwMDAgewogCQkJY29tcGF0aWJsZSA9
ICJtZWRpYXRlayxtdDgxODMtc21pLWNvbW1vbiIsICJzeXNjb24iOwogCQkJcmVnID0gPDAgMHgx
NDAxOTAwMCAwIDB4MTAwMD47Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
