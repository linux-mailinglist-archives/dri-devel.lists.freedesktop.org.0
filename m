Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BD51AB8ED
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 08:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7A76EADC;
	Thu, 16 Apr 2020 06:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910BF6E9DC
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 13:24:13 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 19845F6C67779E3BA95F;
 Wed, 15 Apr 2020 21:24:10 +0800 (CST)
Received: from localhost (10.173.223.234) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Wed, 15 Apr 2020
 21:24:00 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <b.zolnierkie@samsung.com>, <allison@lohutok.net>
Subject: [PATCH -next] omapfb/dss: remove unused varible
 'venc_config_pal_bdghi'
Date: Wed, 15 Apr 2020 21:23:50 +0800
Message-ID: <20200415132350.33088-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.173.223.234]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 16 Apr 2020 06:59:07 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJpdmVycy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZHNzL3ZlbmMuYzoyMTI6MzM6CiB3YXJu
aW5nOiDigJh2ZW5jX2NvbmZpZ19wYWxfYmRnaGnigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1X
dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdmVuY19jb25maWcg
dmVuY19jb25maWdfcGFsX2JkZ2hpID0gewogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBefn5+fn5+fn5+fn5+fn5+fn5+fn4KClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lA
aHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWku
Y29tPgotLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rzcy92ZW5jLmMgfCA0
MyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0MyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kc3MvdmVuYy5j
IGIvZHJpdmVycy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZHNzL3ZlbmMuYwppbmRleCBmODFl
MmE0NjM2NmQuLmQ1NDA0ZDU2YzkyMiAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9v
bWFwMi9vbWFwZmIvZHNzL3ZlbmMuYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29t
YXBmYi9kc3MvdmVuYy5jCkBAIC0yMDksNDkgKzIwOSw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
dmVuY19jb25maWcgdmVuY19jb25maWdfbnRzY190cm0gPSB7CiAJLmdlbl9jdHJsCQkJCT0gMHgw
MEY5MDAwMCwKIH07CiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3QgdmVuY19jb25maWcgdmVuY19jb25m
aWdfcGFsX2JkZ2hpID0gewotCS5mX2NvbnRyb2wJCQkJPSAwLAotCS52aWRvdXRfY3RybAkJCQk9
IDAsCi0JLnN5bmNfY3RybAkJCQk9IDAsCi0JLmhmbHRyX2N0cmwJCQkJPSAwLAotCS54X2NvbG9y
CQkJCT0gMCwKLQkubGluZTIxCQkJCQk9IDAsCi0JLmxuX3NlbAkJCQkJPSAyMSwKLQkuaHRyaWdn
ZXJfdnRyaWdnZXIJCQk9IDAsCi0JLnR2ZGV0Z3BfaW50X3N0YXJ0X3N0b3BfeAkJPSAweDAwMTQw
MDAxLAotCS50dmRldGdwX2ludF9zdGFydF9zdG9wX3kJCT0gMHgwMDAxMDAwMSwKLQkuZ2VuX2N0
cmwJCQkJPSAweDAwRkIwMDAwLAotCi0JLmxsZW4JCQkJCT0gODY0LTEsCi0JLmZsZW5zCQkJCQk9
IDYyNS0xLAotCS5jY19jYXJyX3dzc19jYXJyCQkJPSAweDJGNzYyNUVELAotCS5jX3BoYXNlCQkJ
CT0gMHhERiwKLQkuZ2Fpbl91CQkJCQk9IDB4MTExLAotCS5nYWluX3YJCQkJCT0gMHgxODEsCi0J
LmdhaW5feQkJCQkJPSAweDE0MCwKLQkuYmxhY2tfbGV2ZWwJCQkJPSAweDNlLAotCS5ibGFua19s
ZXZlbAkJCQk9IDB4M2UsCi0JLm1fY29udHJvbAkJCQk9IDA8PDIgfCAxPDwxLAotCS5ic3RhbXBf
d3NzX2RhdGEJCQk9IDB4NDIsCi0JLnNfY2FycgkJCQkJPSAweDJhMDk4YWNiLAotCS5sMjFfX3dj
X2N0bAkJCQk9IDA8PDEzIHwgMHgxNjw8OCB8IDA8PDAsCi0JLnNhdmlkX19lYXZpZAkJCQk9IDB4
MDZBNzAxMDgsCi0JLmZsZW5fX2ZhbAkJCQk9IDIzPDwxNiB8IDYyNDw8MCwKLQkubGFsX19waGFz
ZV9yZXNldAkJCT0gMjw8MTcgfCAzMTA8PDAsCi0JLmhzX2ludF9zdGFydF9zdG9wX3gJCQk9IDB4
MDA5MjAzNTgsCi0JLmhzX2V4dF9zdGFydF9zdG9wX3gJCQk9IDB4MDAwRjAzNUYsCi0JLnZzX2lu
dF9zdGFydF94CQkJCT0gMHgxYTc8PDE2LAotCS52c19pbnRfc3RvcF94X192c19pbnRfc3RhcnRf
eQkJPSAweDAwMDYwMUE3LAotCS52c19pbnRfc3RvcF95X192c19leHRfc3RhcnRfeAkJPSAweDAx
QUYwMDM2LAotCS52c19leHRfc3RvcF94X192c19leHRfc3RhcnRfeQkJPSAweDI3MTAxYWYsCi0J
LnZzX2V4dF9zdG9wX3kJCQkJPSAweDA1LAotCS5hdmlkX3N0YXJ0X3N0b3BfeAkJCT0gMHgwMzUz
MDA4MiwKLQkuYXZpZF9zdGFydF9zdG9wX3kJCQk9IDB4MDI3MDAwMkUsCi0JLmZpZF9pbnRfc3Rh
cnRfeF9fZmlkX2ludF9zdGFydF95CT0gMHgwMDA1MDA4QSwKLQkuZmlkX2ludF9vZmZzZXRfeV9f
ZmlkX2V4dF9zdGFydF94CT0gMHgwMDJFMDEzOCwKLQkuZmlkX2V4dF9zdGFydF95X19maWRfZXh0
X29mZnNldF95CT0gMHgwMTM4MDAwNSwKLX07Ci0KIGNvbnN0IHN0cnVjdCBvbWFwX3ZpZGVvX3Rp
bWluZ3Mgb21hcF9kc3NfcGFsX3RpbWluZ3MgPSB7CiAJLnhfcmVzCQk9IDcyMCwKIAkueV9yZXMJ
CT0gNTc0LAotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
