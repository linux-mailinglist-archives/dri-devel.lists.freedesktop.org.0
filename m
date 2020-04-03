Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE00F19D086
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 08:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324CD6EAFF;
	Fri,  3 Apr 2020 06:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4F56E41D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 02:27:32 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 64E5E7DD1FE74094EAC8;
 Fri,  3 Apr 2020 10:27:27 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Fri, 3 Apr 2020
 10:27:16 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <b.zolnierkie@samsung.com>, <gregkh@linuxfoundation.org>,
 <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
Subject: [PATCH] video: fbdev: mb862xx: remove set but not used variable 'mdr'
Date: Fri, 3 Apr 2020 10:25:53 +0800
Message-ID: <20200403022553.33320-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 03 Apr 2020 06:54:15 +0000
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
Cc: Jason Yan <yanaijie@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHRoZSBmb2xsb3dpbmcgZ2NjIHdhcm5pbmc6Cgpkcml2ZXJzL3ZpZGVvL2ZiZGV2L21iODYy
eHgvbWI4NjJ4eGZiX2FjY2VsLmM6MTg3OjY6IHdhcm5pbmc6IHZhcmlhYmxlCuKAmG1kcuKAmSBz
ZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQogIGludCBtZHI7CiAg
ICAgIF5+fgoKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBKYXNvbiBZYW4gPHlhbmFpamllQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy92
aWRlby9mYmRldi9tYjg2Mnh4L21iODYyeHhmYl9hY2NlbC5jIHwgMiAtLQogMSBmaWxlIGNoYW5n
ZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9tYjg2
Mnh4L21iODYyeHhmYl9hY2NlbC5jIGIvZHJpdmVycy92aWRlby9mYmRldi9tYjg2Mnh4L21iODYy
eHhmYl9hY2NlbC5jCmluZGV4IDQyNTY5MjY0ODAxZi4uZDQwYjgwNjQ2MWNhIDEwMDY0NAotLS0g
YS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L21iODYyeHgvbWI4NjJ4eGZiX2FjY2VsLmMKKysrIGIvZHJp
dmVycy92aWRlby9mYmRldi9tYjg2Mnh4L21iODYyeHhmYl9hY2NlbC5jCkBAIC0xODQsNyArMTg0
LDYgQEAgc3RhdGljIHZvaWQgbWI4NjI5MGZiX2ltYWdlYmxpdDE2KHUzMiAqY21kLCB1MTYgc3Rl
cCwgdTE2IGR4LCB1MTYgZHksCiBzdGF0aWMgdm9pZCBtYjg2MjkwZmJfaW1hZ2VibGl0KHN0cnVj
dCBmYl9pbmZvICppbmZvLAogCQkJCWNvbnN0IHN0cnVjdCBmYl9pbWFnZSAqaW1hZ2UpCiB7Ci0J
aW50IG1kcjsKIAl1MzIgKmNtZCA9IE5VTEw7CiAJdm9pZCAoKmNtZGZuKSAodTMyICosIHUxNiwg
dTE2LCB1MTYsIHUxNiwgdTE2LCB1MzIsIHUzMiwKIAkJICAgICAgIGNvbnN0IHN0cnVjdCBmYl9p
bWFnZSAqLCBzdHJ1Y3QgZmJfaW5mbyAqKSA9IE5VTEw7CkBAIC0xOTYsNyArMTk1LDYgQEAgc3Rh
dGljIHZvaWQgbWI4NjI5MGZiX2ltYWdlYmxpdChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywKIAl1MTYg
ZHggPSBpbWFnZS0+ZHgsIGR5ID0gaW1hZ2UtPmR5OwogCWludCB4MiwgeTIsIHZ4cmVzLCB2eXJl
czsKIAotCW1kciA9IChHRENfUk9QX0NPUFkgPDwgOSk7CiAJeDIgPSBpbWFnZS0+ZHggKyBpbWFn
ZS0+d2lkdGg7CiAJeTIgPSBpbWFnZS0+ZHkgKyBpbWFnZS0+aGVpZ2h0OwogCXZ4cmVzID0gaW5m
by0+dmFyLnhyZXNfdmlydHVhbDsKLS0gCjIuMTcuMgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
