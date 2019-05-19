Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 001AB226BA
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 13:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D10891C7;
	Sun, 19 May 2019 11:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id A71B2891C7
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 11:15:21 +0000 (UTC)
X-UUID: 6dc5b46af7e04678b66c7e1e1f9c5949-20190519
X-UUID: 6dc5b46af7e04678b66c7e1e1f9c5949-20190519
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1506106890; Sun, 19 May 2019 19:15:18 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sun, 19 May 2019 19:15:16 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Sun, 19 May 2019 19:15:15 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 <linux-pwm@vger.kernel.org>, David Airlie <airlied@linux.ie>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] drm/mediatek: add dsi module reset driver
Date: Sun, 19 May 2019 19:15:13 +0800
Message-ID: <20190519111513.73919-1-jitao.shi@mediatek.com>
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

UmVzZXQgZHNpIEhXIHRvIGRlZmF1bHQgd2hlbiBwb3dlciBvbi4gUHJldmVudCB0aGUgc2V0dGlu
ZyBkaWZmZXJldApiZXR3ZWVuIGJvb3Rsb2FkZXIgYW5kIGtlcm5lbC4KClNpZ25lZC1vZmYtYnk6
IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RzaS5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rz
aS5jCmluZGV4IGIwMGViMmQyZTA4Ni4uMzljY2IzNGE3YzdmIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHNpLmMKQEAgLTIxLDEwICsyMSwxMiBAQAogI2luY2x1ZGUgPGxpbnV4L2NvbXBvbmVu
dC5oPgogI2luY2x1ZGUgPGxpbnV4L2lvcG9sbC5oPgogI2luY2x1ZGUgPGxpbnV4L2lycS5oPgor
I2luY2x1ZGUgPGxpbnV4L21mZC9zeXNjb24uaD4KICNpbmNsdWRlIDxsaW51eC9vZi5oPgogI2lu
Y2x1ZGUgPGxpbnV4L29mX3BsYXRmb3JtLmg+CiAjaW5jbHVkZSA8bGludXgvcGh5L3BoeS5oPgog
I2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgorI2luY2x1ZGUgPGxpbnV4L3JlZ21h
cC5oPgogI2luY2x1ZGUgPHZpZGVvL21pcGlfZGlzcGxheS5oPgogI2luY2x1ZGUgPHZpZGVvL3Zp
ZGVvbW9kZS5oPgogCkBAIC0xNDYsNiArMTQ4LDggQEAKICNkZWZpbmUgVF9IU19FWElUCTcKICNk
ZWZpbmUgVF9IU19aRVJPCTEwCiAKKyNkZWZpbmUgTU1TWVNfU1dfUlNUX0RTSV9CIEJJVCgyNSkK
KwogI2RlZmluZSBOU19UT19DWUNMRShuLCBjKSAgICAoKG4pIC8gKGMpICsgKCgobikgJSAoYykp
ID8gMSA6IDApKQogCiAjZGVmaW5lIE1US19EU0lfSE9TVF9JU19SRUFEKHR5cGUpIFwKQEAgLTE2
NSw2ICsxNjksOCBAQCBzdHJ1Y3QgbXRrX2RzaSB7CiAJc3RydWN0IGRybV9wYW5lbCAqcGFuZWw7
CiAJc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZTsKIAlzdHJ1Y3QgcGh5ICpwaHk7CisJc3RydWN0
IHJlZ21hcCAqbW1zeXNfc3dfcnN0X2I7CisJdTMyIHN3X3JzdF9iOwogCiAJdm9pZCBfX2lvbWVt
ICpyZWdzOwogCkBAIC0yMzgsNiArMjQ0LDE2IEBAIHN0YXRpYyB2b2lkIG10a19kc2lfZGlzYWJs
ZShzdHJ1Y3QgbXRrX2RzaSAqZHNpKQogCW10a19kc2lfbWFzayhkc2ksIERTSV9DT05fQ1RSTCwg
RFNJX0VOLCAwKTsKIH0KIAorc3RhdGljIHZvaWQgbXRrX2RzaV9yZXNldF9hbGwoc3RydWN0IG10
a19kc2kgKmRzaSkKK3sKKwlyZWdtYXBfdXBkYXRlX2JpdHMoZHNpLT5tbXN5c19zd19yc3RfYiwg
ZHNpLT5zd19yc3RfYiwKKwkJCSAgIE1NU1lTX1NXX1JTVF9EU0lfQiwgfk1NU1lTX1NXX1JTVF9E
U0lfQik7CisJdXNsZWVwX3JhbmdlKDEwMDAsIDExMDApOworCisJcmVnbWFwX3VwZGF0ZV9iaXRz
KGRzaS0+bW1zeXNfc3dfcnN0X2IsIGRzaS0+c3dfcnN0X2IsCisJCQkgICBNTVNZU19TV19SU1Rf
RFNJX0IsIE1NU1lTX1NXX1JTVF9EU0lfQik7Cit9CisKIHN0YXRpYyB2b2lkIG10a19kc2lfcmVz
ZXRfZW5naW5lKHN0cnVjdCBtdGtfZHNpICpkc2kpCiB7CiAJbXRrX2RzaV9tYXNrKGRzaSwgRFNJ
X0NPTl9DVFJMLCBEU0lfUkVTRVQsIERTSV9SRVNFVCk7CkBAIC04MzEsNiArODQ3LDggQEAgc3Rh
dGljIGludCBtdGtfZHNpX2NyZWF0ZV9jb25uX2VuYyhzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCBz
dHJ1Y3QgbXRrX2RzaSAqZHNpKQogCQkJZ290byBlcnJfZW5jb2Rlcl9jbGVhbnVwOwogCX0KIAor
CW10a19kc2lfcmVzZXRfYWxsKGRzaSk7CisKIAlyZXR1cm4gMDsKIAogZXJyX2VuY29kZXJfY2xl
YW51cDoKQEAgLTEwODcsNiArMTEwNSw3IEBAIHN0YXRpYyBpbnQgbXRrX2RzaV9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXN0cnVjdCBtdGtfZHNpICpkc2k7CiAJc3RydWN0
IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKIAlzdHJ1Y3QgcmVzb3VyY2UgKnJlZ3M7CisJc3Ry
dWN0IHJlZ21hcCAqcmVnbWFwOwogCWludCBpcnFfbnVtOwogCWludCBjb21wX2lkOwogCWludCBy
ZXQ7CkBAIC0xMTM5LDYgKzExNTgsMjIgQEAgc3RhdGljIGludCBtdGtfZHNpX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCXJldHVybiByZXQ7CiAJfQogCisJcmVnbWFwID0g
c3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZShkZXYtPm9mX25vZGUsCisJCQkJCQkgIm1l
ZGlhdGVrLHN5c2Nvbi1kc2kiKTsKKwlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMl9pbmRleChk
ZXYtPm9mX25vZGUsICJtZWRpYXRlayxzeXNjb24tZHNpIiwgMSwKKwkJCQkJICZkc2ktPnN3X3Jz
dF9iKTsKKworCWlmIChJU19FUlIocmVnbWFwKSkKKwkJcmV0ID0gUFRSX0VSUihyZWdtYXApOwor
CisJaWYgKHJldCkgeworCQlyZXQgPSBQVFJfRVJSKHJlZ21hcCk7CisJCWRldl9lcnIoZGV2LCAi
RmFpbGVkIHRvIGdldCBtbXN5cyByZWdpc3RlcnM6ICVkXG4iLCByZXQpOworCQlyZXR1cm4gcmV0
OworCX0KKworCWRzaS0+bW1zeXNfc3dfcnN0X2IgPSByZWdtYXA7CisKIAljb21wX2lkID0gbXRr
X2RkcF9jb21wX2dldF9pZChkZXYtPm9mX25vZGUsIE1US19EU0kpOwogCWlmIChjb21wX2lkIDwg
MCkgewogCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBpZGVudGlmeSBieSBhbGlhczogJWRcbiIs
IGNvbXBfaWQpOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
