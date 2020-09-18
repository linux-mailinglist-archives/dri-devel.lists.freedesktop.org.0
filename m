Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F31D3270BEE
	for <lists+dri-devel@lfdr.de>; Sat, 19 Sep 2020 10:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0766E197;
	Sat, 19 Sep 2020 08:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A976E123
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 09:26:28 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 8483CA90DB7D34974FE6;
 Fri, 18 Sep 2020 17:26:26 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Fri, 18 Sep 2020 17:26:16 +0800
From: Zheng Yongjun <zhengyongjun3@huawei.com>
To: <patrik.r.jakobsson@gmail.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] gpu: gma500: Remove set but not used variable
Date: Fri, 18 Sep 2020 17:27:08 +0800
Message-ID: <20200918092708.21570-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 19 Sep 2020 08:46:17 +0000
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
Cc: Zheng Yongjun <zhengyongjun3@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2dtYTUwMC9tbXUuYzogSW4gZnVuY3Rpb24gcHNiX21tdV9pbnNlcnRfcGZuX3NlcXVl
bmNlOgpkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL21tdS5jOjY2MDo2OiB3YXJuaW5nOiB2YXJpYWJs
ZSDigJhyZXTigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0K
CmRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvb2FrdHJhaWxfbHZkc19pMmMuYzogSW4gZnVuY3Rpb24g
Z2V0X2Nsb2NrOgpkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL29ha3RyYWlsX2x2ZHNfaTJjLmM6Njk6
MTE6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHRtcOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNl
ZC1idXQtc2V0LXZhcmlhYmxlXQoKZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9vYWt0cmFpbF9sdmRz
X2kyYy5jOiBJbiBmdW5jdGlvbiBnZXRfZGF0YToKZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9vYWt0
cmFpbF9sdmRzX2kyYy5jOjgzOjExOiB3YXJuaW5nOiB2YXJpYWJsZSDigJh0bXDigJkgc2V0IGJ1
dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCnRoZXNlIHZhcmlhYmxlIGlz
IG5ldmVyIHVzZWQsIHNvIHJlbW92ZSBpdCBvciBjaGVjayBpdCdzIHJldHVybiB2YWx1ZS4KClNp
Z25lZC1vZmYtYnk6IFpoZW5nIFlvbmdqdW4gPHpoZW5neW9uZ2p1bjNAaHVhd2VpLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL21tdS5jICAgICAgICAgICAgICAgfCAyICstCiBkcml2
ZXJzL2dwdS9kcm0vZ21hNTAwL29ha3RyYWlsX2x2ZHNfaTJjLmMgfCA4ICsrKystLS0tCiAyIGZp
bGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL21tdS5jIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9t
bXUuYwppbmRleCA1MDUwNDRjOWE2NzMuLjZjZTg0MmQwNWE0NCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2dtYTUwMC9tbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL21tdS5j
CkBAIC02OTAsNyArNjkwLDcgQEAgaW50IHBzYl9tbXVfaW5zZXJ0X3Bmbl9zZXF1ZW5jZShzdHJ1
Y3QgcHNiX21tdV9wZCAqcGQsIHVpbnQzMl90IHN0YXJ0X3BmbiwKIAlpZiAocGQtPmh3X2NvbnRl
eHQgIT0gLTEpCiAJCXBzYl9tbXVfZmx1c2gocGQtPmRyaXZlcik7CiAKLQlyZXR1cm4gMDsKKwly
ZXR1cm4gcmV0OwogfQogCiBpbnQgcHNiX21tdV9pbnNlcnRfcGFnZXMoc3RydWN0IHBzYl9tbXVf
cGQgKnBkLCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2dtYTUwMC9vYWt0cmFpbF9sdmRzX2kyYy5jIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9vYWt0
cmFpbF9sdmRzX2kyYy5jCmluZGV4IGJhYWY4MjEyZTAxZC4uNGQ2NjA4NjhkNzZmIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL29ha3RyYWlsX2x2ZHNfaTJjLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2dtYTUwMC9vYWt0cmFpbF9sdmRzX2kyYy5jCkBAIC02NiwxMiArNjYsMTIg
QEAKIHN0YXRpYyBpbnQgZ2V0X2Nsb2NrKHZvaWQgKmRhdGEpCiB7CiAJc3RydWN0IHBzYl9pbnRl
bF9pMmNfY2hhbiAqY2hhbiA9IGRhdGE7Ci0JdTMyIHZhbCwgdG1wOworCXUzMiB2YWw7CiAKIAl2
YWwgPSBMUENfUkVBRF9SRUcoY2hhbiwgUkdJTyk7CiAJdmFsIHw9IEdQSU9fQ0xPQ0s7CiAJTFBD
X1dSSVRFX1JFRyhjaGFuLCBSR0lPLCB2YWwpOwotCXRtcCA9IExQQ19SRUFEX1JFRyhjaGFuLCBS
R0xWTCk7CisJTFBDX1JFQURfUkVHKGNoYW4sIFJHTFZMKTsKIAl2YWwgPSAoTFBDX1JFQURfUkVH
KGNoYW4sIFJHTFZMKSAmIEdQSU9fQ0xPQ0spID8gMSA6IDA7CiAKIAlyZXR1cm4gdmFsOwpAQCAt
ODAsMTIgKzgwLDEyIEBAIHN0YXRpYyBpbnQgZ2V0X2Nsb2NrKHZvaWQgKmRhdGEpCiBzdGF0aWMg
aW50IGdldF9kYXRhKHZvaWQgKmRhdGEpCiB7CiAJc3RydWN0IHBzYl9pbnRlbF9pMmNfY2hhbiAq
Y2hhbiA9IGRhdGE7Ci0JdTMyIHZhbCwgdG1wOworCXUzMiB2YWw7CiAKIAl2YWwgPSBMUENfUkVB
RF9SRUcoY2hhbiwgUkdJTyk7CiAJdmFsIHw9IEdQSU9fREFUQTsKIAlMUENfV1JJVEVfUkVHKGNo
YW4sIFJHSU8sIHZhbCk7Ci0JdG1wID0gTFBDX1JFQURfUkVHKGNoYW4sIFJHTFZMKTsKKwlMUENf
UkVBRF9SRUcoY2hhbiwgUkdMVkwpOwogCXZhbCA9IChMUENfUkVBRF9SRUcoY2hhbiwgUkdMVkwp
ICYgR1BJT19EQVRBKSA/IDEgOiAwOwogCiAJcmV0dXJuIHZhbDsKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
