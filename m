Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF332222D5
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2019 11:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C69897E3;
	Sat, 18 May 2019 09:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 51082897D4
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2019 09:56:31 +0000 (UTC)
X-UUID: b857715442c54e68baa81bb136f7831c-20190518
X-UUID: b857715442c54e68baa81bb136f7831c-20190518
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 346400647; Sat, 18 May 2019 17:56:29 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sat, 18 May 2019 17:56:27 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Sat, 18 May 2019 17:56:26 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 Kumar Gala <galak@codeaurora.org>, <linux-pwm@vger.kernel.org>, David Airlie
 <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [v4 4/5] drm/mediatek: control dpi pins dpi or gpio mode in on or off
Date: Sat, 18 May 2019 17:56:17 +0800
Message-ID: <20190518095618.18454-5-jitao.shi@mediatek.com>
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

UHVsbCBkcGkgcGlucyBsb3cgd2hlbiBkcGkgaGFzIG5vdGhpbmcgdG8gZGlzcGxheS4gQW92aWQg
bGVha2FnZQpjdXJyZW50IGZyb20gc29tZSBkcGkgcGlucyAoSHN5bmMgVnN5bmMgREUgLi4uICku
CgpTb21lIGNoaXBzIGhhdmUgZHBpIHBpbnMsIGJ1dCB0aGVyZSBhcmUgc29tZSBjaGlwIGRvbid0
IGhhdmUgcGlucy4KU28gdGhpcyBmdW5jdGlvbiBpcyBjb250cm9sbGVkIGJ5IGNoaXBzIGRyaXZl
ciBkYXRhLgoKU2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgfCAzNSArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKaW5kZXggNzdlNmUwZjk5
MTg4Li4wYzRiYTBhMmJlMjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHBpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwpAQCAtMTcs
MTAgKzE3LDEyIEBACiAjaW5jbHVkZSA8ZHJtL2RybV9vZi5oPgogI2luY2x1ZGUgPGxpbnV4L2tl
cm5lbC5oPgogI2luY2x1ZGUgPGxpbnV4L2NvbXBvbmVudC5oPgotI2luY2x1ZGUgPGxpbnV4L3Bs
YXRmb3JtX2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L29mLmg+CiAjaW5jbHVkZSA8bGludXgv
b2ZfZGV2aWNlLmg+CisjaW5jbHVkZSA8bGludXgvb2ZfZ3Bpby5oPgogI2luY2x1ZGUgPGxpbnV4
L29mX2dyYXBoLmg+CisjaW5jbHVkZSA8bGludXgvcGluY3RybC9jb25zdW1lci5oPgorI2luY2x1
ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5o
PgogI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CiAjaW5jbHVkZSA8bGludXgvY2xrLmg+CkBAIC03
OSw2ICs4MSw5IEBAIHN0cnVjdCBtdGtfZHBpIHsKIAllbnVtIG10a19kcGlfb3V0X3ljX21hcCB5
Y19tYXA7CiAJZW51bSBtdGtfZHBpX291dF9iaXRfbnVtIGJpdF9udW07CiAJZW51bSBtdGtfZHBp
X291dF9jaGFubmVsX3N3YXAgY2hhbm5lbF9zd2FwOworCXN0cnVjdCBwaW5jdHJsICpwaW5jdHJs
OworCXN0cnVjdCBwaW5jdHJsX3N0YXRlICpwaW5zX2RlZmF1bHQ7CisJc3RydWN0IHBpbmN0cmxf
c3RhdGUgKnBpbnNfZHBpOwogCWludCByZWZjb3VudDsKIH07CiAKQEAgLTExOCw2ICsxMjMsNyBA
QCBzdHJ1Y3QgbXRrX2RwaV9jb25mIHsKIAl1MzIgcmVnX2hfZnJlX2NvbjsKIAlib29sIGVkZ2Vf
c2VsX2VuOwogCWJvb2wgZHVhbF9lZGdlOworCWJvb2wgZHBpX3Bpbl9jdHJsOwogfTsKIAogc3Rh
dGljIHZvaWQgbXRrX2RwaV9tYXNrKHN0cnVjdCBtdGtfZHBpICpkcGksIHUzMiBvZmZzZXQsIHUz
MiB2YWwsIHUzMiBtYXNrKQpAQCAtMzkyLDYgKzM5OCw5IEBAIHN0YXRpYyB2b2lkIG10a19kcGlf
cG93ZXJfb2ZmKHN0cnVjdCBtdGtfZHBpICpkcGkpCiAJaWYgKC0tZHBpLT5yZWZjb3VudCAhPSAw
KQogCQlyZXR1cm47CiAKKwlpZiAoZHBpLT5jb25mLT5kcGlfcGluX2N0cmwpCisJCXBpbmN0cmxf
c2VsZWN0X3N0YXRlKGRwaS0+cGluY3RybCwgZHBpLT5waW5zX2RlZmF1bHQpOworCiAJbXRrX2Rw
aV9kaXNhYmxlKGRwaSk7CiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRwaS0+cGl4ZWxfY2xrKTsK
IAljbGtfZGlzYWJsZV91bnByZXBhcmUoZHBpLT5lbmdpbmVfY2xrKTsKQEAgLTQxNiw2ICs0MjUs
OSBAQCBzdGF0aWMgaW50IG10a19kcGlfcG93ZXJfb24oc3RydWN0IG10a19kcGkgKmRwaSkKIAkJ
Z290byBlcnJfcGl4ZWw7CiAJfQogCisJaWYgKGRwaS0+Y29uZi0+ZHBpX3Bpbl9jdHJsKQorCQlw
aW5jdHJsX3NlbGVjdF9zdGF0ZShkcGktPnBpbmN0cmwsIGRwaS0+cGluc19kcGkpOworCiAJbXRr
X2RwaV9lbmFibGUoZHBpKTsKIAlyZXR1cm4gMDsKIApAQCAtNzI0LDYgKzczNiwyNyBAQCBzdGF0
aWMgaW50IG10a19kcGlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlkcGkt
PmRldiA9IGRldjsKIAlkcGktPmNvbmYgPSAoc3RydWN0IG10a19kcGlfY29uZiAqKW9mX2Rldmlj
ZV9nZXRfbWF0Y2hfZGF0YShkZXYpOwogCisJaWYgKGRwaS0+Y29uZi0+ZHBpX3Bpbl9jdHJsKSB7
CisJCWRwaS0+cGluY3RybCA9IGRldm1fcGluY3RybF9nZXQoJnBkZXYtPmRldik7CisJCWlmIChJ
U19FUlIoZHBpLT5waW5jdHJsKSkgeworCQkJZGV2X2VycigmcGRldi0+ZGV2LCAiQ2Fubm90IGZp
bmQgcGluY3RybCFcbiIpOworCQkJcmV0dXJuIFBUUl9FUlIoZHBpLT5waW5jdHJsKTsKKwkJfQor
CisJCWRwaS0+cGluc19kZWZhdWx0ID0gcGluY3RybF9sb29rdXBfc3RhdGUoZHBpLT5waW5jdHJs
LAorCQkJCQkJCSAiZGVmYXVsdCIpOworCQlpZiAoSVNfRVJSKGRwaS0+cGluc19kZWZhdWx0KSkg
eworCQkJZGV2X2VycigmcGRldi0+ZGV2LCAiQ2Fubm90IGZpbmQgcGluY3RybCBkZWZhdWx0IVxu
Iik7CisJCQlyZXR1cm4gUFRSX0VSUihkcGktPnBpbnNfZGVmYXVsdCk7CisJCX0KKworCQlkcGkt
PnBpbnNfZHBpID0gcGluY3RybF9sb29rdXBfc3RhdGUoZHBpLT5waW5jdHJsLCAiZHBpbW9kZSIp
OworCQlpZiAoSVNfRVJSKGRwaS0+cGluc19kcGkpKSB7CisJCQlkZXZfZXJyKCZwZGV2LT5kZXYs
ICJDYW5ub3QgZmluZCBwaW5jdHJsIGRwaW1vZGUhXG4iKTsKKwkJCXJldHVybiBQVFJfRVJSKGRw
aS0+cGluc19kcGkpOworCQl9CisJfQorCiAJbWVtID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBk
ZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsKIAlkcGktPnJlZ3MgPSBkZXZtX2lvcmVtYXBfcmVzb3Vy
Y2UoZGV2LCBtZW0pOwogCWlmIChJU19FUlIoZHBpLT5yZWdzKSkgewotLSAKMi4yMS4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
