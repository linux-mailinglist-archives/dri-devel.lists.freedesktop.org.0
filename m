Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFCA1099FD
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 09:14:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5AC6E225;
	Tue, 26 Nov 2019 08:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E8A8920F;
 Mon, 25 Nov 2019 14:57:46 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id DFB236CF9FA8163C04FF;
 Mon, 25 Nov 2019 22:57:39 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Mon, 25 Nov 2019
 22:57:33 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Bhawanpreet.Lakha@amd.com>, <yuehaibing@huawei.com>
Subject: [PATCH -next] drm/amd/display: remove set but not used variable
 'msg_out'
Date: Mon, 25 Nov 2019 22:54:45 +0800
Message-ID: <20191125145445.21648-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 26 Nov 2019 08:14:07 +0000
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcF9w
c3AuYzogSW4gZnVuY3Rpb24gbW9kX2hkY3BfaGRjcDJfZW5hYmxlX2VuY3J5cHRpb246CmRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3BfcHNwLmM6
NjMzOjc3OiB3YXJuaW5nOiB2YXJpYWJsZSBtc2dfb3V0IHNldCBidXQgbm90IHVzZWQgWy1XdW51
c2VkLWJ1dC1zZXQtdmFyaWFibGVdCmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3Bs
YXkvbW9kdWxlcy9oZGNwL2hkY3BfcHNwLmM6IEluIGZ1bmN0aW9uIG1vZF9oZGNwX2hkY3AyX2Vu
YWJsZV9kcF9zdHJlYW1fZW5jcnlwdGlvbjoKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4v
ZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcF9wc3AuYzo3MTA6Nzc6IHdhcm5pbmc6IHZhcmlhYmxl
IG1zZ19vdXQgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCkl0
IGlzIG5ldmVyIHVzZWQsIHNvIHJlbW92ZSBpdC4KClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxo
dWxrY2lAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0Bo
dWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3Av
aGRjcF9wc3AuYyB8IDQgLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaGRjcC9oZGNwX3Bz
cC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaGRjcC9oZGNwX3BzcC5j
CmluZGV4IDJkZDVmZWUuLjQ2OGY1ZTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcF9wc3AuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3BfcHNwLmMKQEAgLTYzMCwxNCArNjMwLDEyIEBAIGVu
dW0gbW9kX2hkY3Bfc3RhdHVzIG1vZF9oZGNwX2hkY3AyX2VuYWJsZV9lbmNyeXB0aW9uKHN0cnVj
dCBtb2RfaGRjcCAqaGRjcCkKIAlzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCA9IGhkY3AtPmNvbmZp
Zy5wc3AuaGFuZGxlOwogCXN0cnVjdCB0YV9oZGNwX3NoYXJlZF9tZW1vcnkgKmhkY3BfY21kOwog
CXN0cnVjdCB0YV9oZGNwX2NtZF9oZGNwMl9wcm9jZXNzX3ByZXBhcmVfYXV0aGVudGljYXRpb25f
bWVzc2FnZV9pbnB1dF92MiAqbXNnX2luOwotCXN0cnVjdCB0YV9oZGNwX2NtZF9oZGNwMl9wcm9j
ZXNzX3ByZXBhcmVfYXV0aGVudGljYXRpb25fbWVzc2FnZV9vdXRwdXRfdjIgKm1zZ19vdXQ7CiAJ
c3RydWN0IG1vZF9oZGNwX2Rpc3BsYXkgKmRpc3BsYXkgPSBnZXRfZmlyc3RfYWRkZWRfZGlzcGxh
eShoZGNwKTsKIAogCWhkY3BfY21kID0gKHN0cnVjdCB0YV9oZGNwX3NoYXJlZF9tZW1vcnkgKilw
c3AtPmhkY3BfY29udGV4dC5oZGNwX3NoYXJlZF9idWY7CiAJbWVtc2V0KGhkY3BfY21kLCAwLCBz
aXplb2Yoc3RydWN0IHRhX2hkY3Bfc2hhcmVkX21lbW9yeSkpOwogCiAJbXNnX2luID0gJmhkY3Bf
Y21kLT5pbl9tc2cuaGRjcDJfcHJlcGFyZV9wcm9jZXNzX2F1dGhlbnRpY2F0aW9uX21lc3NhZ2Vf
djI7Ci0JbXNnX291dCA9ICZoZGNwX2NtZC0+b3V0X21zZy5oZGNwMl9wcmVwYXJlX3Byb2Nlc3Nf
YXV0aGVudGljYXRpb25fbWVzc2FnZV92MjsKIAogCWhkY3AyX21lc3NhZ2VfaW5pdChoZGNwLCBt
c2dfaW4pOwogCkBAIC03MDcsMTQgKzcwNSwxMiBAQCBlbnVtIG1vZF9oZGNwX3N0YXR1cyBtb2Rf
aGRjcF9oZGNwMl9lbmFibGVfZHBfc3RyZWFtX2VuY3J5cHRpb24oc3RydWN0IG1vZF9oZGNwCiAJ
c3RydWN0IHBzcF9jb250ZXh0ICpwc3AgPSBoZGNwLT5jb25maWcucHNwLmhhbmRsZTsKIAlzdHJ1
Y3QgdGFfaGRjcF9zaGFyZWRfbWVtb3J5ICpoZGNwX2NtZDsKIAlzdHJ1Y3QgdGFfaGRjcF9jbWRf
aGRjcDJfcHJvY2Vzc19wcmVwYXJlX2F1dGhlbnRpY2F0aW9uX21lc3NhZ2VfaW5wdXRfdjIgKm1z
Z19pbjsKLQlzdHJ1Y3QgdGFfaGRjcF9jbWRfaGRjcDJfcHJvY2Vzc19wcmVwYXJlX2F1dGhlbnRp
Y2F0aW9uX21lc3NhZ2Vfb3V0cHV0X3YyICptc2dfb3V0OwogCXVpbnQ4X3QgaTsKIAogCWhkY3Bf
Y21kID0gKHN0cnVjdCB0YV9oZGNwX3NoYXJlZF9tZW1vcnkgKilwc3AtPmhkY3BfY29udGV4dC5o
ZGNwX3NoYXJlZF9idWY7CiAJbWVtc2V0KGhkY3BfY21kLCAwLCBzaXplb2Yoc3RydWN0IHRhX2hk
Y3Bfc2hhcmVkX21lbW9yeSkpOwogCiAJbXNnX2luID0gJmhkY3BfY21kLT5pbl9tc2cuaGRjcDJf
cHJlcGFyZV9wcm9jZXNzX2F1dGhlbnRpY2F0aW9uX21lc3NhZ2VfdjI7Ci0JbXNnX291dCA9ICZo
ZGNwX2NtZC0+b3V0X21zZy5oZGNwMl9wcmVwYXJlX3Byb2Nlc3NfYXV0aGVudGljYXRpb25fbWVz
c2FnZV92MjsKIAogCWhkY3AyX21lc3NhZ2VfaW5pdChoZGNwLCBtc2dfaW4pOwogCi0tIAoyLjcu
NAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
