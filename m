Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A352DCCB43
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 18:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185836E3C4;
	Sat,  5 Oct 2019 16:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC46E6E7EF;
 Sat,  5 Oct 2019 04:26:51 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1624C2645E4749C055E1;
 Sat,  5 Oct 2019 12:26:50 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Sat, 5 Oct 2019
 12:26:39 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <jsanka@codeaurora.org>, <jcrouse@codeaurora.org>,
 <gregkh@linuxfoundation.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: [PATCH 6/6] drm/msm/dpu: Remove set but not used variables 'mode',
 'dpu_kms', 'priv'
Date: Sat, 5 Oct 2019 12:33:49 +0800
Message-ID: <1570250029-67639-7-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570250029-67639-1-git-send-email-zhengbin13@huawei.com>
References: <1570250029-67639-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 05 Oct 2019 16:37:30 +0000
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
cHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYzogSW4gZnVuY3Rpb24gZHB1X2VuY29k
ZXJfdmlydF9kaXNhYmxlOgpkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rl
ci5jOjExOTk6Mjc6IHdhcm5pbmc6IHZhcmlhYmxlIG1vZGUgc2V0IGJ1dCBub3QgdXNlZCBbLVd1
bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1
X2VuY29kZXIuYzogSW4gZnVuY3Rpb24gX2RwdV9lbmNvZGVyX2luaXRfZGVidWdmczoKZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYzoxOTYzOjE4OiB3YXJuaW5nOiB2
YXJpYWJsZSBkcHVfa21zIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFi
bGVdCmRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmM6IEluIGZ1bmN0
aW9uIGRwdV9lbmNvZGVyX2ZyYW1lX2RvbmVfdGltZW91dDoKZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL2RwdTEvZHB1X2VuY29kZXIuYzoyMTgzOjI2OiB3YXJuaW5nOiB2YXJpYWJsZSBwcml2IHNl
dCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpUaGV5IGFyZSBub3Qg
dXNlZCBzaW5jZSBjb21taXQgMjVmZGQ1OTMzZTRjICgiZHJtL21zbToKQWRkIFNETTg0NSBEUFUg
c3VwcG9ydCIpCgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNp
Z25lZC1vZmYtYnk6IHpoZW5nYmluIDx6aGVuZ2JpbjEzQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYyB8IDcgLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21z
bS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUx
L2RwdV9lbmNvZGVyLmMKaW5kZXggZDgyZWE5OS4uZTZmZTIwOCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5jCkBAIC0xMTg0LDcgKzExODQsNiBAQCBzdGF0
aWMgdm9pZCBkcHVfZW5jb2Rlcl92aXJ0X2Rpc2FibGUoc3RydWN0IGRybV9lbmNvZGVyICpkcm1f
ZW5jKQogCXN0cnVjdCBkcHVfZW5jb2Rlcl92aXJ0ICpkcHVfZW5jID0gTlVMTDsKIAlzdHJ1Y3Qg
bXNtX2RybV9wcml2YXRlICpwcml2OwogCXN0cnVjdCBkcHVfa21zICpkcHVfa21zOwotCXN0cnVj
dCBkcm1fZGlzcGxheV9tb2RlICptb2RlOwogCWludCBpID0gMDsKCiAJaWYgKCFkcm1fZW5jKSB7
CkBAIC0xMjA0LDggKzEyMDMsNiBAQCBzdGF0aWMgdm9pZCBkcHVfZW5jb2Rlcl92aXJ0X2Rpc2Fi
bGUoc3RydWN0IGRybV9lbmNvZGVyICpkcm1fZW5jKQogCW11dGV4X2xvY2soJmRwdV9lbmMtPmVu
Y19sb2NrKTsKIAlkcHVfZW5jLT5lbmFibGVkID0gZmFsc2U7CgotCW1vZGUgPSAmZHJtX2VuYy0+
Y3J0Yy0+c3RhdGUtPmFkanVzdGVkX21vZGU7Ci0KIAlwcml2ID0gZHJtX2VuYy0+ZGV2LT5kZXZf
cHJpdmF0ZTsKIAlkcHVfa21zID0gdG9fZHB1X2ttcyhwcml2LT5rbXMpOwoKQEAgLTE5MTUsNyAr
MTkxMiw2IEBAIHN0YXRpYyBpbnQgX2RwdV9lbmNvZGVyX2luaXRfZGVidWdmcyhzdHJ1Y3QgZHJt
X2VuY29kZXIgKmRybV9lbmMpCiB7CiAJc3RydWN0IGRwdV9lbmNvZGVyX3ZpcnQgKmRwdV9lbmMg
PSB0b19kcHVfZW5jb2Rlcl92aXJ0KGRybV9lbmMpOwogCXN0cnVjdCBtc21fZHJtX3ByaXZhdGUg
KnByaXY7Ci0Jc3RydWN0IGRwdV9rbXMgKmRwdV9rbXM7CiAJaW50IGk7CgogCXN0YXRpYyBjb25z
dCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGRlYnVnZnNfc3RhdHVzX2ZvcHMgPSB7CkBAIC0xOTMz
LDcgKzE5MjksNiBAQCBzdGF0aWMgaW50IF9kcHVfZW5jb2Rlcl9pbml0X2RlYnVnZnMoc3RydWN0
IGRybV9lbmNvZGVyICpkcm1fZW5jKQogCX0KCiAJcHJpdiA9IGRybV9lbmMtPmRldi0+ZGV2X3By
aXZhdGU7Ci0JZHB1X2ttcyA9IHRvX2RwdV9rbXMocHJpdi0+a21zKTsKCiAJc25wcmludGYobmFt
ZSwgRFBVX05BTUVfU0laRSwgImVuY29kZXIldSIsIGRybV9lbmMtPmJhc2UuaWQpOwoKQEAgLTIx
MzMsMTQgKzIxMjgsMTIgQEAgc3RhdGljIHZvaWQgZHB1X2VuY29kZXJfZnJhbWVfZG9uZV90aW1l
b3V0KHN0cnVjdCB0aW1lcl9saXN0ICp0KQogCXN0cnVjdCBkcHVfZW5jb2Rlcl92aXJ0ICpkcHVf
ZW5jID0gZnJvbV90aW1lcihkcHVfZW5jLCB0LAogCQkJZnJhbWVfZG9uZV90aW1lcik7CiAJc3Ry
dWN0IGRybV9lbmNvZGVyICpkcm1fZW5jID0gJmRwdV9lbmMtPmJhc2U7Ci0Jc3RydWN0IG1zbV9k
cm1fcHJpdmF0ZSAqcHJpdjsKIAl1MzIgZXZlbnQ7CgogCWlmICghZHJtX2VuYy0+ZGV2IHx8ICFk
cm1fZW5jLT5kZXYtPmRldl9wcml2YXRlKSB7CiAJCURQVV9FUlJPUigiaW52YWxpZCBwYXJhbWV0
ZXJzXG4iKTsKIAkJcmV0dXJuOwogCX0KLQlwcml2ID0gZHJtX2VuYy0+ZGV2LT5kZXZfcHJpdmF0
ZTsKCiAJaWYgKCFkcHVfZW5jLT5mcmFtZV9idXN5X21hc2tbMF0gfHwgIWRwdV9lbmMtPmNydGNf
ZnJhbWVfZXZlbnRfY2IpIHsKIAkJRFJNX0RFQlVHX0tNUygiaWQ6JXUgaW52YWxpZCB0aW1lb3V0
IGZyYW1lX2J1c3lfbWFzaz0lbHVcbiIsCi0tCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
