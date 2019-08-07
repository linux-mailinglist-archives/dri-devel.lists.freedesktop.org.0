Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A680C84447
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 08:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE8F6E60C;
	Wed,  7 Aug 2019 06:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id F2F426E60C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 06:08:17 +0000 (UTC)
X-UUID: 66379fd288374440afeac1fca168d612-20190807
X-UUID: 66379fd288374440afeac1fca168d612-20190807
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 564144345; Wed, 07 Aug 2019 14:03:11 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 7 Aug 2019 14:03:09 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Wed, 7 Aug 2019 14:03:07 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 <linux-pwm@vger.kernel.org>, David Airlie <airlied@linux.ie>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5 4/4] drm/mediatek: control dpi pins dpi or gpio mode in on
 or off
Date: Wed, 7 Aug 2019 14:02:57 +0800
Message-ID: <20190807060257.57007-5-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190807060257.57007-1-jitao.shi@mediatek.com>
References: <20190807060257.57007-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1B2CA2D23DF96E5EB5B80F2CCDC9DF7A23B524F7C9EECA1DDDD30165E22A6FB52000:8
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
IGhhdmUgcGlucy4KU28gdGhpcyBmdW5jdGlvbiBpcyBjb250cm9sbGVkIGJ5IGRldmljZSB0cmVl
LgoKU2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgfCAzOSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKaW5kZXggNGYyNzAwY2JmZGI3Li44
M2ZiMGQ3NTNmNzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBp
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwpAQCAtOSwxMCArOSwx
MiBAQAogI2luY2x1ZGUgPGRybS9kcm1fb2YuaD4KICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4K
ICNpbmNsdWRlIDxsaW51eC9jb21wb25lbnQuaD4KLSNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9k
ZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9vZi5oPgogI2luY2x1ZGUgPGxpbnV4L29mX2Rldmlj
ZS5oPgorI2luY2x1ZGUgPGxpbnV4L29mX2dwaW8uaD4KICNpbmNsdWRlIDxsaW51eC9vZl9ncmFw
aC5oPgorI2luY2x1ZGUgPGxpbnV4L3BpbmN0cmwvY29uc3VtZXIuaD4KKyNpbmNsdWRlIDxsaW51
eC9wbGF0Zm9ybV9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4KICNpbmNs
dWRlIDxsaW51eC90eXBlcy5oPgogI2luY2x1ZGUgPGxpbnV4L2Nsay5oPgpAQCAtNzEsOCArNzMs
MTIgQEAgc3RydWN0IG10a19kcGkgewogCWVudW0gbXRrX2RwaV9vdXRfeWNfbWFwIHljX21hcDsK
IAllbnVtIG10a19kcGlfb3V0X2JpdF9udW0gYml0X251bTsKIAllbnVtIG10a19kcGlfb3V0X2No
YW5uZWxfc3dhcCBjaGFubmVsX3N3YXA7CisJc3RydWN0IHBpbmN0cmwgKnBpbmN0cmw7CisJc3Ry
dWN0IHBpbmN0cmxfc3RhdGUgKnBpbnNfZ3BpbzsKKwlzdHJ1Y3QgcGluY3RybF9zdGF0ZSAqcGlu
c19kcGk7CiAJaW50IHJlZmNvdW50OwogCWJvb2wgZHVhbF9lZGdlOworCWJvb2wgZHBpX3Bpbl9j
dHJsOwogfTsKIAogc3RhdGljIGlubGluZSBzdHJ1Y3QgbXRrX2RwaSAqbXRrX2RwaV9mcm9tX2Vu
Y29kZXIoc3RydWN0IGRybV9lbmNvZGVyICplKQpAQCAtMzg0LDYgKzM5MCw5IEBAIHN0YXRpYyB2
b2lkIG10a19kcGlfcG93ZXJfb2ZmKHN0cnVjdCBtdGtfZHBpICpkcGkpCiAJaWYgKC0tZHBpLT5y
ZWZjb3VudCAhPSAwKQogCQlyZXR1cm47CiAKKwlpZiAoZHBpLT5kcGlfcGluX2N0cmwpCisJCXBp
bmN0cmxfc2VsZWN0X3N0YXRlKGRwaS0+cGluY3RybCwgZHBpLT5waW5zX2dwaW8pOworCiAJbXRr
X2RwaV9kaXNhYmxlKGRwaSk7CiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRwaS0+cGl4ZWxfY2xr
KTsKIAljbGtfZGlzYWJsZV91bnByZXBhcmUoZHBpLT5lbmdpbmVfY2xrKTsKQEAgLTQwOCw2ICs0
MTcsOSBAQCBzdGF0aWMgaW50IG10a19kcGlfcG93ZXJfb24oc3RydWN0IG10a19kcGkgKmRwaSkK
IAkJZ290byBlcnJfcGl4ZWw7CiAJfQogCisJaWYgKGRwaS0+ZHBpX3Bpbl9jdHJsKQorCQlwaW5j
dHJsX3NlbGVjdF9zdGF0ZShkcGktPnBpbmN0cmwsIGRwaS0+cGluc19kcGkpOworCiAJbXRrX2Rw
aV9lbmFibGUoZHBpKTsKIAlyZXR1cm4gMDsKIApAQCAtNzEzLDYgKzcyNSwzMSBAQCBzdGF0aWMg
aW50IG10a19kcGlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlkcGktPmRl
diA9IGRldjsKIAlkcGktPmNvbmYgPSAoc3RydWN0IG10a19kcGlfY29uZiAqKW9mX2RldmljZV9n
ZXRfbWF0Y2hfZGF0YShkZXYpOwogCWRwaS0+ZHVhbF9lZGdlID0gb2ZfcHJvcGVydHlfcmVhZF9i
b29sKGRldi0+b2Zfbm9kZSwgImRwaV9kdWFsX2VkZ2UiKTsKKwlkcGktPmRwaV9waW5fY3RybCA9
IG9mX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYtPm9mX25vZGUsCisJCQkJCQkgICJkcGlfcGluX21v
ZGVfc3dhcCIpOworCisJaWYgKGRwaS0+ZHBpX3Bpbl9jdHJsKSB7CisJCWRwaS0+cGluY3RybCA9
IGRldm1fcGluY3RybF9nZXQoJnBkZXYtPmRldik7CisJCWlmIChJU19FUlIoZHBpLT5waW5jdHJs
KSkgeworCQkJZGV2X2VycigmcGRldi0+ZGV2LCAiQ2Fubm90IGZpbmQgcGluY3RybCFcbiIpOwor
CQkJcmV0dXJuIFBUUl9FUlIoZHBpLT5waW5jdHJsKTsKKwkJfQorCisJCWRwaS0+cGluc19ncGlv
ID0gcGluY3RybF9sb29rdXBfc3RhdGUoZHBpLT5waW5jdHJsLAorCQkJCQkJICAgICAgImdwaW9t
b2RlIik7CisJCWlmIChJU19FUlIoZHBpLT5waW5zX2dwaW8pKSB7CisJCQlkZXZfZXJyKCZwZGV2
LT5kZXYsICJDYW5ub3QgZmluZCBwaW5jdHJsIGdwaW9tb2RlIVxuIik7CisJCQlyZXR1cm4gUFRS
X0VSUihkcGktPnBpbnNfZ3Bpbyk7CisJCX0KKworCQlwaW5jdHJsX3NlbGVjdF9zdGF0ZShkcGkt
PnBpbmN0cmwsIGRwaS0+cGluc19ncGlvKTsKKworCQlkcGktPnBpbnNfZHBpID0gcGluY3RybF9s
b29rdXBfc3RhdGUoZHBpLT5waW5jdHJsLCAiZHBpbW9kZSIpOworCQlpZiAoSVNfRVJSKGRwaS0+
cGluc19kcGkpKSB7CisJCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJDYW5ub3QgZmluZCBwaW5jdHJs
IGRwaW1vZGUhXG4iKTsKKwkJCXJldHVybiBQVFJfRVJSKGRwaS0+cGluc19kcGkpOworCQl9CisJ
fQogCiAJbWVtID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAw
KTsKIAlkcGktPnJlZ3MgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoZGV2LCBtZW0pOwotLSAKMi4y
MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
