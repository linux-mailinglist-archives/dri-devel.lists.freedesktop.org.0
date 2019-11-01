Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9616AECBBA
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 23:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C886F899;
	Fri,  1 Nov 2019 22:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127426F7F3
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 13:46:33 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id AE60F80C6B319E22CD0B;
 Fri,  1 Nov 2019 21:46:26 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Fri, 1 Nov 2019
 21:46:18 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <linux-graphics-maintainer@vmware.com>, <thellstrom@vmware.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH -next] drm/vmwgfx: remove set but not used variable 'srf'
Date: Fri, 1 Nov 2019 21:46:11 +0800
Message-ID: <20191101134611.32456-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 01 Nov 2019 22:51:09 +0000
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
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfc3VyZmFjZS5jOjMzOToyMjoKIHdhcm5pbmc6
IHZhcmlhYmxlIHNyZiBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxl
XQoKJ3NyZicgaXMgbmV2ZXIgdXNlZCwgc28gY2FuIGJlIHJlbW92ZWQuCgpTaWduZWQtb2ZmLWJ5
OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L3Ztd2dmeC92bXdnZnhfc3VyZmFjZS5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfc3VyZmFj
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfc3VyZmFjZS5jCmluZGV4IDI5ZDg3
OTQuLmRlMDUzMGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3N1
cmZhY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9zdXJmYWNlLmMKQEAg
LTMzNiw3ICszMzYsNiBAQCBzdGF0aWMgdm9pZCB2bXdfaHdfc3VyZmFjZV9kZXN0cm95KHN0cnVj
dCB2bXdfcmVzb3VyY2UgKnJlcykKIHsKIAogCXN0cnVjdCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYg
PSByZXMtPmRldl9wcml2OwotCXN0cnVjdCB2bXdfc3VyZmFjZSAqc3JmOwogCXZvaWQgKmNtZDsK
IAogCWlmIChyZXMtPmZ1bmMtPmRlc3Ryb3kgPT0gdm13X2diX3N1cmZhY2VfZGVzdHJveSkgewpA
QCAtMzYwLDcgKzM1OSw2IEBAIHN0YXRpYyB2b2lkIHZtd19od19zdXJmYWNlX2Rlc3Ryb3koc3Ry
dWN0IHZtd19yZXNvdXJjZSAqcmVzKQogCQkgKi8KIAogCQltdXRleF9sb2NrKCZkZXZfcHJpdi0+
Y21kYnVmX211dGV4KTsKLQkJc3JmID0gdm13X3Jlc190b19zcmYocmVzKTsKIAkJZGV2X3ByaXYt
PnVzZWRfbWVtb3J5X3NpemUgLT0gcmVzLT5iYWNrdXBfc2l6ZTsKIAkJbXV0ZXhfdW5sb2NrKCZk
ZXZfcHJpdi0+Y21kYnVmX211dGV4KTsKIAl9Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
