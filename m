Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BECDCCB42
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 18:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991146E3B5;
	Sat,  5 Oct 2019 16:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A23B6E794;
 Sat,  5 Oct 2019 04:26:51 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 045CB6B20099FF753DC8;
 Sat,  5 Oct 2019 12:26:50 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Sat, 5 Oct 2019
 12:26:39 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <jsanka@codeaurora.org>, <jcrouse@codeaurora.org>,
 <gregkh@linuxfoundation.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: [PATCH 4/6] drm/msm/dpu: Remove set but not used variables
 'dpu_cstate', 'priv'
Date: Sat, 5 Oct 2019 12:33:47 +0800
Message-ID: <1570250029-67639-5-git-send-email-zhengbin13@huawei.com>
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
cHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NvcmVfcGVyZi5jOiBJbiBmdW5jdGlvbiBkcHVfY29y
ZV9wZXJmX2NydGNfcmVsZWFzZV9idzoKZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1
X2NvcmVfcGVyZi5jOjI0ODoyNTogd2FybmluZzogdmFyaWFibGUgZHB1X2NzdGF0ZSBzZXQgYnV0
IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQpkcml2ZXJzL2dwdS9kcm0vbXNt
L2Rpc3AvZHB1MS9kcHVfY29yZV9wZXJmLmM6IEluIGZ1bmN0aW9uIGRwdV9jb3JlX3BlcmZfY3J0
Y191cGRhdGU6CmRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jb3JlX3BlcmYuYzoz
Mzc6MjY6IHdhcm5pbmc6IHZhcmlhYmxlIHByaXYgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQt
YnV0LXNldC12YXJpYWJsZV0KClRoZXkgYXJlIG5vdCB1c2VkIHNpbmNlIGNvbW1pdCAyNWZkZDU5
MzNlNGMgKCJkcm0vbXNtOgpBZGQgU0RNODQ1IERQVSBzdXBwb3J0IikKClJlcG9ydGVkLWJ5OiBI
dWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogemhlbmdiaW4gPHpo
ZW5nYmluMTNAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9k
cHVfY29yZV9wZXJmLmMgfCA0IC0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jb3JlX3BlcmYu
YyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jb3JlX3BlcmYuYwppbmRleCAw
OWE0OWI1Li42NTE3N2M4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1
MS9kcHVfY29yZV9wZXJmLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1
X2NvcmVfcGVyZi5jCkBAIC0yMTUsNyArMjE1LDYgQEAgc3RhdGljIGludCBfZHB1X2NvcmVfcGVy
Zl9jcnRjX3VwZGF0ZV9idXMoc3RydWN0IGRwdV9rbXMgKmttcywKIHZvaWQgZHB1X2NvcmVfcGVy
Zl9jcnRjX3JlbGVhc2VfYncoc3RydWN0IGRybV9jcnRjICpjcnRjKQogewogCXN0cnVjdCBkcHVf
Y3J0YyAqZHB1X2NydGM7Ci0Jc3RydWN0IGRwdV9jcnRjX3N0YXRlICpkcHVfY3N0YXRlOwogCXN0
cnVjdCBkcHVfa21zICprbXM7CgogCWlmICghY3J0YykgewpAQCAtMjMwLDcgKzIyOSw2IEBAIHZv
aWQgZHB1X2NvcmVfcGVyZl9jcnRjX3JlbGVhc2VfYncoc3RydWN0IGRybV9jcnRjICpjcnRjKQog
CX0KCiAJZHB1X2NydGMgPSB0b19kcHVfY3J0YyhjcnRjKTsKLQlkcHVfY3N0YXRlID0gdG9fZHB1
X2NydGNfc3RhdGUoY3J0Yy0+c3RhdGUpOwoKIAlpZiAoYXRvbWljX2RlY19yZXR1cm4oJmttcy0+
YmFuZHdpZHRoX3JlZikgPiAwKQogCQlyZXR1cm47CkBAIC0yODcsNyArMjg1LDYgQEAgaW50IGRw
dV9jb3JlX3BlcmZfY3J0Y191cGRhdGUoc3RydWN0IGRybV9jcnRjICpjcnRjLAogCXU2NCBjbGtf
cmF0ZSA9IDA7CiAJc3RydWN0IGRwdV9jcnRjICpkcHVfY3J0YzsKIAlzdHJ1Y3QgZHB1X2NydGNf
c3RhdGUgKmRwdV9jc3RhdGU7Ci0Jc3RydWN0IG1zbV9kcm1fcHJpdmF0ZSAqcHJpdjsKIAlzdHJ1
Y3QgZHB1X2ttcyAqa21zOwogCWludCByZXQ7CgpAQCAtMzAxLDcgKzI5OCw2IEBAIGludCBkcHVf
Y29yZV9wZXJmX2NydGNfdXBkYXRlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAkJRFBVX0VSUk9S
KCJpbnZhbGlkIGttc1xuIik7CiAJCXJldHVybiAtRUlOVkFMOwogCX0KLQlwcml2ID0ga21zLT5k
ZXYtPmRldl9wcml2YXRlOwoKIAlkcHVfY3J0YyA9IHRvX2RwdV9jcnRjKGNydGMpOwogCWRwdV9j
c3RhdGUgPSB0b19kcHVfY3J0Y19zdGF0ZShjcnRjLT5zdGF0ZSk7Ci0tCjIuNy40CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
