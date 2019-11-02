Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 404C5EDA2C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 08:54:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6D96E155;
	Mon,  4 Nov 2019 07:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E0D6E0FB
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2019 07:57:59 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 95F7F4DBF1AD9079E1F1;
 Sat,  2 Nov 2019 15:57:55 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Sat, 2 Nov 2019
 15:57:48 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <thierry.reding@gmail.com>
Subject: [PATCH -next] gpu: host1x: Remove dev_err() on platform_get_irq()
 failure
Date: Sat, 2 Nov 2019 15:57:44 +0800
Message-ID: <20191102075744.6864-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 04 Nov 2019 07:54:21 +0000
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
Cc: linux-tegra@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cGxhdGZvcm1fZ2V0X2lycSgpIHdpbGwgY2FsbCBkZXZfZXJyKCkgaXRzZWxmIG9uIGZhaWx1cmUs
CnNvIHRoZXJlIGlzIG5vIG5lZWQgZm9yIHRoZSBkcml2ZXIgdG8gYWxzbyBkbyB0aGlzLgpUaGlz
IGlzIGRldGVjdGVkIGJ5IGNvY2NpbmVsbGUuCgpTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5
dWVoYWliaW5nQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvaG9zdDF4L2Rldi5jIHwgNCAr
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvaG9zdDF4L2Rldi5jIGIvZHJpdmVycy9ncHUvaG9zdDF4L2Rl
di5jCmluZGV4IGE3MzhlYTUuLjM4OGJjYzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2hvc3Qx
eC9kZXYuYworKysgYi9kcml2ZXJzL2dwdS9ob3N0MXgvZGV2LmMKQEAgLTMzOSwxMCArMzM5LDgg
QEAgc3RhdGljIGludCBob3N0MXhfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
IAl9CiAKIAlzeW5jcHRfaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKLQlpZiAoc3lu
Y3B0X2lycSA8IDApIHsKLQkJZGV2X2VycigmcGRldi0+ZGV2LCAiZmFpbGVkIHRvIGdldCBJUlE6
ICVkXG4iLCBzeW5jcHRfaXJxKTsKKwlpZiAoc3luY3B0X2lycSA8IDApCiAJCXJldHVybiBzeW5j
cHRfaXJxOwotCX0KIAogCW11dGV4X2luaXQoJmhvc3QtPmRldmljZXNfbG9jayk7CiAJSU5JVF9M
SVNUX0hFQUQoJmhvc3QtPmRldmljZXMpOwotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
