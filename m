Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6C46025E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 10:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF886E435;
	Fri,  5 Jul 2019 08:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 951 seconds by postgrey-1.36 at gabe;
 Thu, 04 Jul 2019 10:01:58 UTC
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CB56E296
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 10:01:58 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 89A0C282A6D9B3730D51;
 Thu,  4 Jul 2019 17:46:03 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.439.0; Thu, 4 Jul 2019 17:45:57 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Bartlomiej Zolnierkiewicz
 <b.zolnierkie@samsung.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam
 <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH -next] video: fbdev: imxfb: fix a typo in imxfb_probe()
Date: Thu, 4 Jul 2019 09:52:25 +0000
Message-ID: <20190704095225.143177-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 05 Jul 2019 08:41:20 +0000
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
Cc: kernel-janitors@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Wei Yongjun <weiyongjun1@huawei.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHRoZSByZXR1cm4gdmFsdWUgY2hlY2sgd2hpY2ggdGVzdGluZyB0aGUgd3JvbmcgdmFyaWFi
bGUKaW4gaW14ZmJfcHJvYmUoKS4KCkZpeGVzOiA3MzlhNjQzOWMyYmYgKCJ2aWRlbzogZmJkZXY6
IGlteGZiOiBmaXggc3BhcnNlIHdhcm5pbmdzIGFib3V0IHVzaW5nIGluY29ycmVjdCB0eXBlcyIp
ClNpZ25lZC1vZmYtYnk6IFdlaSBZb25nanVuIDx3ZWl5b25nanVuMUBodWF3ZWkuY29tPgotLS0K
IGRyaXZlcnMvdmlkZW8vZmJkZXYvaW14ZmIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvaW14ZmIuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvaW14ZmIuYwppbmRleCA4ZDEwNTNlOWVm
OWYuLmIzMjg2ZDFmYTU0MyAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9pbXhmYi5j
CisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvaW14ZmIuYwpAQCAtOTc2LDcgKzk3Niw3IEBAIHN0
YXRpYyBpbnQgaW14ZmJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlmYmkt
Pm1hcF9zaXplID0gUEFHRV9BTElHTihpbmZvLT5maXguc21lbV9sZW4pOwogCWluZm8tPnNjcmVl
bl9idWZmZXIgPSBkbWFfYWxsb2Nfd2MoJnBkZXYtPmRldiwgZmJpLT5tYXBfc2l6ZSwKIAkJCQkJ
ICAgJmZiaS0+bWFwX2RtYSwgR0ZQX0tFUk5FTCk7Ci0JaWYgKCFpbmZvLT5zY3JlZW5fYmFzZSkg
eworCWlmICghaW5mby0+c2NyZWVuX2J1ZmZlcikgewogCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJG
YWlsZWQgdG8gYWxsb2NhdGUgdmlkZW8gUkFNOiAlZFxuIiwgcmV0KTsKIAkJcmV0ID0gLUVOT01F
TTsKIAkJZ290byBmYWlsZWRfbWFwOwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
