Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4467B73A9
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 08:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1DB6F7D2;
	Thu, 19 Sep 2019 06:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id A6ACD6F7D2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 06:59:52 +0000 (UTC)
X-UUID: 954a607ba4274fcf946855fcb868994b-20190919
X-UUID: 954a607ba4274fcf946855fcb868994b-20190919
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 595120307; Thu, 19 Sep 2019 14:59:46 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 19 Sep 2019 14:59:45 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Thu, 19 Sep 2019 14:59:44 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 9/9] drm/mediatek: add dphy reset after setting lanes number
Date: Thu, 19 Sep 2019 14:58:06 +0800
Message-ID: <20190919065806.111016-10-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190919065806.111016-1-jitao.shi@mediatek.com>
References: <20190919065806.111016-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 30A242A51B54F4A40B878ACFE15ED0747C3441D733EA1BFCCE554FB07A3A4DEE2000:8
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com,
 stonea168@163.com, cawa.cheng@mediatek.com, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGRwaHkgcmVzZXQgYWZ0ZXIgc2V0dGluZyBsYW5lcyBudW1iZXIgdG8gYXZvaWQgZHBoeSBm
aWZvIGVmZm9yLgoKU2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCA5ICsrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RzaS5jCmluZGV4IGIwMjM3M2IwNDg0OC4uOGMyNjIwZWExOGQwIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHNpLmMKQEAgLTM3LDYgKzM3LDcgQEAKICNkZWZpbmUgRFNJX0NPTl9DVFJMCQkw
eDEwCiAjZGVmaW5lIERTSV9SRVNFVAkJCUJJVCgwKQogI2RlZmluZSBEU0lfRU4JCQkJQklUKDEp
CisjZGVmaW5lIERQSFlfUkVTRVQJCQlCSVQoMikKIAogI2RlZmluZSBEU0lfTU9ERV9DVFJMCQkw
eDE0CiAjZGVmaW5lIE1PREUJCQkJKDMpCkBAIC0yODAsNiArMjgxLDEyIEBAIHN0YXRpYyB2b2lk
IG10a19kc2lfcmVzZXRfZW5naW5lKHN0cnVjdCBtdGtfZHNpICpkc2kpCiAJbXRrX2RzaV9tYXNr
KGRzaSwgRFNJX0NPTl9DVFJMLCBEU0lfUkVTRVQsIDApOwogfQogCitzdGF0aWMgdm9pZCBtdGtf
ZHNpX3Jlc2V0X2RwaHkoc3RydWN0IG10a19kc2kgKmRzaSkKK3sKKwltdGtfZHNpX21hc2soZHNp
LCBEU0lfQ09OX0NUUkwsIERQSFlfUkVTRVQsIERQSFlfUkVTRVQpOworCW10a19kc2lfbWFzayhk
c2ksIERTSV9DT05fQ1RSTCwgRFBIWV9SRVNFVCwgMCk7Cit9CisKIHN0YXRpYyB2b2lkIG10a19k
c2lfY2xrX3VscF9tb2RlX2VudGVyKHN0cnVjdCBtdGtfZHNpICpkc2kpCiB7CiAJbXRrX2RzaV9t
YXNrKGRzaSwgRFNJX1BIWV9MQ0NPTiwgTENfSFNfVFhfRU4sIDApOwpAQCAtNjUwLDYgKzY1Nyw4
IEBAIHN0YXRpYyBpbnQgbXRrX2RzaV9wb3dlcm9uKHN0cnVjdCBtdGtfZHNpICpkc2kpCiAJbXRr
X2RzaV9waHlfdGltY29uZmlnKGRzaSk7CiAKIAltdGtfZHNpX3J4dHhfY29udHJvbChkc2kpOwor
CXVzbGVlcF9yYW5nZSgzMCwgMTAwKTsKKwltdGtfZHNpX3Jlc2V0X2RwaHkoZHNpKTsKIAltdGtf
ZHNpX3BzX2NvbnRyb2xfdmFjdChkc2kpOwogCW10a19kc2lfc2V0X3ZtX2NtZChkc2kpOwogCW10
a19kc2lfY29uZmlnX3Zkb190aW1pbmcoZHNpKTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
