Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7A131AD0
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2019 11:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4F189760;
	Sat,  1 Jun 2019 09:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 11569896A3
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2019 09:26:29 +0000 (UTC)
X-UUID: e961f31d0b3c4b55a4de8a894ad30ce3-20190601
X-UUID: e961f31d0b3c4b55a4de8a894ad30ce3-20190601
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 261343506; Sat, 01 Jun 2019 17:26:26 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sat, 1 Jun 2019 17:26:24 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Sat, 1 Jun 2019 17:26:23 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 <linux-pwm@vger.kernel.org>, David Airlie <airlied@linux.ie>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [v4 3/7] drm/mediatek: add dsi reg commit disable control
Date: Sat, 1 Jun 2019 17:26:11 +0800
Message-ID: <20190601092615.67917-4-jitao.shi@mediatek.com>
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

TmV3IERTSSBJUCBoYXMgc2hhZG93IHJlZ2lzdGVyIGFuZCB3b3JraW5nIHJlZy4gVGhlIHJlZ2lz
dGVyCnZhbHVlcyBhcmUgd3JpdGVuIHRvIHNoYWRvdyByZWdpc3Rlci4gQW5kIHRoZW4gdHJpZ2dl
ciB3aXRoCmNvbW1pdCByZWcsIHRoZSByZWdpc3RlciB2YWx1ZXMgd2lsbCBiZSBtb3ZlZCB3b3Jr
aW5nIHJlZ2lzdGVyLgoKVGhpcyBmdWNudGlvbiBpcyBkZWZ1YWx0IG9uLiBCdXQgdGhpcyBkcml2
ZXIgZG9lc24ndCB1c2UgdGhpcwpmdW5jdGlvbi4gU28gYWRkIHRoZSBkaXNhYmxlIGNvbnRyb2wu
CgpTaWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDEwICsrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMK
aW5kZXggYTQ4ZGIwNTZkZjZjLi5lZWE0NzI5NDA3OWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kc2kuYwpAQCAtMTMxLDYgKzEzMSwxMCBAQAogI2RlZmluZSBWTV9DTURfRU4JCQlCSVQoMCkK
ICNkZWZpbmUgVFNfVkZQX0VOCQkJQklUKDUpCiAKKyNkZWZpbmUgRFNJX1NIQURPV19ERUJVRwkw
eDE5MFUKKyNkZWZpbmUgRk9SQ0VfQ09NTUlUCQkJQklUKDApCisjZGVmaW5lIEJZUEFTU19TSEFE
T1cJCQlCSVQoMSkKKwogI2RlZmluZSBDT05GSUcJCQkJKDB4ZmYgPDwgMCkKICNkZWZpbmUgU0hP
UlRfUEFDS0VUCQkJMAogI2RlZmluZSBMT05HX1BBQ0tFVAkJCTIKQEAgLTE1Nyw2ICsxNjEsNyBA
QCBzdHJ1Y3QgcGh5OwogCiBzdHJ1Y3QgbXRrX2RzaV9kcml2ZXJfZGF0YSB7CiAJY29uc3QgdTMy
IHJlZ19jbWRxX29mZjsKKwlib29sIGhhc19zaGFkb3dfY3RsOwogfTsKIAogc3RydWN0IG10a19k
c2kgewpAQCAtNTk0LDYgKzU5OSwxMSBAQCBzdGF0aWMgaW50IG10a19kc2lfcG93ZXJvbihzdHJ1
Y3QgbXRrX2RzaSAqZHNpKQogCX0KIAogCW10a19kc2lfZW5hYmxlKGRzaSk7CisKKwlpZiAoZHNp
LT5kcml2ZXJfZGF0YS0+aGFzX3NoYWRvd19jdGwpCisJCXdyaXRlbChGT1JDRV9DT01NSVQgfCBC
WVBBU1NfU0hBRE9XLAorCQkgICAgICAgZHNpLT5yZWdzICsgRFNJX1NIQURPV19ERUJVRyk7CisK
IAltdGtfZHNpX3Jlc2V0X2VuZ2luZShkc2kpOwogCW10a19kc2lfcGh5X3RpbWNvbmZpZyhkc2kp
OwogCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
