Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1091AEB2B
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D466E188;
	Sat, 18 Apr 2020 09:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 375EA6E3D8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 08:57:10 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 94EE9152C75F57358E36;
 Fri, 17 Apr 2020 16:57:02 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Apr 2020
 16:56:52 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <paulus@samba.org>, <b.zolnierkie@samsung.com>, <daniel.vetter@ffwll.ch>, 
 <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] video: fbdev: aty128fb: remove unused 'sdr_64'
Date: Fri, 17 Apr 2020 17:23:18 +0800
Message-ID: <20200417092318.13978-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 18 Apr 2020 09:26:15 +0000
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
Cc: Hulk Robot <hulkci@huawei.com>, Jason Yan <yanaijie@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHRoZSBmb2xsb3dpbmcgZ2NjIHdhcm5pbmc6Cgpkcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9h
dHkxMjhmYi5jOjMzNzozNjogd2FybmluZzog4oCYc2RyXzY04oCZIGRlZmluZWQgYnV0Cm5vdCB1
c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCiBzdGF0aWMgY29uc3Qgc3RydWN0IGF0eTEy
OF9tZW1pbmZvIHNkcl82NCA9IHsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Xn5+fn5+CgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25l
ZC1vZmYtYnk6IEphc29uIFlhbiA8eWFuYWlqaWVAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2F0eS9hdHkxMjhmYi5jIHwgMTQgLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0
eS9hdHkxMjhmYi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9hdHkvYXR5MTI4ZmIuYwppbmRleCBk
N2U0MWM4ZGQ1MzMuLmQwNWQ0MTk1YWNhZCAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRl
di9hdHkvYXR5MTI4ZmIuYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9hdHkxMjhmYi5j
CkBAIC0zMzQsMjAgKzMzNCw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXR5MTI4X21lbWluZm8g
c2RyXzEyOCA9IHsKIAkubmFtZSA9ICIxMjgtYml0IFNEUiBTR1JBTSAoMToxKSIsCiB9OwogCi1z
dGF0aWMgY29uc3Qgc3RydWN0IGF0eTEyOF9tZW1pbmZvIHNkcl82NCA9IHsKLQkuTUwgPSA0LAot
CS5NQiA9IDgsCi0JLlRyY2QgPSAzLAotCS5UcnAgPSAzLAotCS5Ud3IgPSAxLAotCS5DTCA9IDMs
Ci0JLlRyMncgPSAxLAotCS5Mb29wTGF0ZW5jeSA9IDE3LAotCS5Ec3BPbiA9IDQ2LAotCS5SbG9v
cCA9IDE3LAotCS5uYW1lID0gIjY0LWJpdCBTRFIgU0dSQU0gKDE6MSkiLAotfTsKLQogc3RhdGlj
IGNvbnN0IHN0cnVjdCBhdHkxMjhfbWVtaW5mbyBzZHJfc2dyYW0gPSB7CiAJLk1MID0gNCwKIAku
TUIgPSA0LAotLSAKMi4yMS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
