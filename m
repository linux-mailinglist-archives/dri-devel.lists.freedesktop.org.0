Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B99811AEB2E
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EACE6E192;
	Sat, 18 Apr 2020 09:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BBF6E3D8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 08:56:43 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id E6BB1BA9E54F3CB3E3A9;
 Fri, 17 Apr 2020 16:56:39 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Apr 2020
 16:56:31 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <lee.jones@linaro.org>, <daniel.thompson@linaro.org>,
 <jingoohan1@gmail.com>, <b.zolnierkie@samsung.com>, <yanaijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] backlight: lms501kf03: remove unused 'seq_sleep_in' and
 'seq_up_dn'
Date: Fri, 17 Apr 2020 17:22:57 +0800
Message-ID: <20200417092257.13694-1-yanaijie@huawei.com>
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
Cc: Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHRoZSBmb2xsb3dpbmcgZ2NjIHdhcm5pbmc6Cgpkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9s
bXM1MDFrZjAzLmM6OTY6Mjg6IHdhcm5pbmc6IOKAmHNlcV9zbGVlcF9pbuKAmQpkZWZpbmVkIGJ1
dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQogc3RhdGljIGNvbnN0IHVuc2ln
bmVkIGNoYXIgc2VxX3NsZWVwX2luW10gPSB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
fn5+fn5+fn5+fn4KZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG1zNTAxa2YwMy5jOjkyOjI4OiB3
YXJuaW5nOiDigJhzZXFfdXBfZG7igJkgZGVmaW5lZApidXQgbm90IHVzZWQgWy1XdW51c2VkLWNv
bnN0LXZhcmlhYmxlPV0KIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBjaGFyIHNlcV91cF9kbltdID0g
ewogICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+CgpSZXBvcnRlZC1ieTogSHVs
ayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IEphc29uIFlhbiA8eWFu
YWlqaWVAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbXM1MDFrZjAz
LmMgfCA4IC0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbXM1MDFrZjAzLmMgYi9kcml2ZXJzL3ZpZGVv
L2JhY2tsaWdodC9sbXM1MDFrZjAzLmMKaW5kZXggOGFlMzJlMzU3M2MxLi5jMWJkMDJiYjhiMmUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xtczUwMWtmMDMuYworKysgYi9k
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbXM1MDFrZjAzLmMKQEAgLTg5LDE0ICs4OSw2IEBAIHN0
YXRpYyBjb25zdCB1bnNpZ25lZCBjaGFyIHNlcV9yZ2JfZ2FtbWFbXSA9IHsKIAkweDAwLCAweDAw
LCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLAogfTsKIAotc3RhdGljIGNvbnN0
IHVuc2lnbmVkIGNoYXIgc2VxX3VwX2RuW10gPSB7Ci0JMHgzNiwgMHgxMCwKLX07Ci0KLXN0YXRp
YyBjb25zdCB1bnNpZ25lZCBjaGFyIHNlcV9zbGVlcF9pbltdID0gewotCTB4MTAsCi19OwotCiBz
dGF0aWMgY29uc3QgdW5zaWduZWQgY2hhciBzZXFfc2xlZXBfb3V0W10gPSB7CiAJMHgxMSwKIH07
Ci0tIAoyLjIxLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
