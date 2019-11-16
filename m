Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF2CFF912
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:45:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754646E342;
	Sun, 17 Nov 2019 11:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CBD6E0A5
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2019 10:57:17 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E00CD9334800209F4895;
 Sat, 16 Nov 2019 18:57:12 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Sat, 16 Nov 2019
 18:57:05 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <patrik.r.jakobsson@gmail.com>, <daniel.vetter@ffwll.ch>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/gma500: remove set but not used variable 'channel_eq'
Date: Sat, 16 Nov 2019 19:04:28 +0800
Message-ID: <1573902268-117518-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 17 Nov 2019 11:44:18 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2dtYTUwMC9jZHZfaW50ZWxfZHAuYzogSW4gZnVuY3Rpb24gY2R2X2ludGVsX2RwX2Nv
bXBsZXRlX2xpbmtfdHJhaW46CmRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvY2R2X2ludGVsX2RwLmM6
MTU5Njo3OiB3YXJuaW5nOiB2YXJpYWJsZSBjaGFubmVsX2VxIHNldCBidXQgbm90IHVzZWQgWy1X
dW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpJdCBpcyBuZXZlciB1c2VkLCBzbyByZW1vdmUgaXQu
CgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYt
Ynk6IHpoZW5nYmluIDx6aGVuZ2JpbjEzQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2dtYTUwMC9jZHZfaW50ZWxfZHAuYyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2Nkdl9pbnRlbF9kcC5j
IGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9jZHZfaW50ZWxfZHAuYwppbmRleCA1NzBiNTk1Li41
NzcyYjJkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2Nkdl9pbnRlbF9kcC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvY2R2X2ludGVsX2RwLmMKQEAgLTE1OTQsNyAr
MTU5NCw2IEBAIGNkdl9pbnRlbF9kcF9jb21wbGV0ZV9saW5rX3RyYWluKHN0cnVjdCBnbWFfZW5j
b2RlciAqZW5jb2RlcikKIHsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gZW5jb2Rlci0+YmFz
ZS5kZXY7CiAJc3RydWN0IGNkdl9pbnRlbF9kcCAqaW50ZWxfZHAgPSBlbmNvZGVyLT5kZXZfcHJp
djsKLQlib29sIGNoYW5uZWxfZXEgPSBmYWxzZTsKIAlpbnQgdHJpZXMsIGNyX3RyaWVzOwogCXUz
MiByZWc7CiAJdWludDMyX3QgRFAgPSBpbnRlbF9kcC0+RFA7CkBAIC0xNjAyLDcgKzE2MDEsNiBA
QCBjZHZfaW50ZWxfZHBfY29tcGxldGVfbGlua190cmFpbihzdHJ1Y3QgZ21hX2VuY29kZXIgKmVu
Y29kZXIpCiAJLyogY2hhbm5lbCBlcXVhbGl6YXRpb24gKi8KIAl0cmllcyA9IDA7CiAJY3JfdHJp
ZXMgPSAwOwotCWNoYW5uZWxfZXEgPSBmYWxzZTsKCiAJRFJNX0RFQlVHX0tNUygiXG4iKTsKIAkJ
cmVnID0gRFAgfCBEUF9MSU5LX1RSQUlOX1BBVF8yOwpAQCAtMTY0OCw3ICsxNjQ2LDYgQEAgY2R2
X2ludGVsX2RwX2NvbXBsZXRlX2xpbmtfdHJhaW4oc3RydWN0IGdtYV9lbmNvZGVyICplbmNvZGVy
KQoKIAkJaWYgKGNkdl9pbnRlbF9jaGFubmVsX2VxX29rKGVuY29kZXIpKSB7CiAJCQlEUk1fREVC
VUdfS01TKCJQVDIgdHJhaW4gaXMgZG9uZVxuIik7Ci0JCQljaGFubmVsX2VxID0gdHJ1ZTsKIAkJ
CWJyZWFrOwogCQl9CgotLQoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
