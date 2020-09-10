Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA15265CEC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDE86E9A8;
	Fri, 11 Sep 2020 09:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9226E2BD;
 Thu, 10 Sep 2020 07:50:49 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 904FD2B01B300031E483;
 Thu, 10 Sep 2020 15:50:44 +0800 (CST)
Received: from localhost (10.174.179.108) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Thu, 10 Sep 2020
 15:50:38 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Yong.Zhao@amd.com>, <ray.huang@amd.com>
Subject: [PATCH v2 -next] drm/amdkfd: Fix -Wunused-const-variable warning
Date: Thu, 10 Sep 2020 15:50:06 +0800
Message-ID: <20200910075006.41484-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20200910025532.19616-1-yuehaibing@huawei.com>
References: <20200910025532.19616-1-yuehaibing@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.179.108]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 11 Sep 2020 09:49:36 +0000
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
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgS0ZEX1NVUFBPUlRfSU9NTVVfVjIgaXMgbm90IHNldCwgZ2NjIHdhcm5zOgoKZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvLi4vYW1ka2ZkL2tmZF9kZXZpY2UuYzoxMjE6Mzc6IHdhcm5pbmc6
IOKAmHJhdmVuX2RldmljZV9pbmZv4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1j
b25zdC12YXJpYWJsZT1dCiBzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VfaW5mbyByYXZl
bl9kZXZpY2VfaW5mbyA9IHsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+
fn5+fn5+fn5+fn5+fn5+CgpBcyBIdWFuZyBSdWkgc3VnZ2VzdGVkLCBSYXZlbiBhbHJlYWR5IGhh
cyB0aGUgZmFsbGJhY2sgcGF0aCwKc28gaXQgc2hvdWxkIGJlIG91dCBvZiBJT01NVSB2MiBmbGFn
LgoKU3VnZ2VzdGVkLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgpTaWduZWQtb2Zm
LWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rl
dmljZS5jCmluZGV4IDBlNzFhMDU0M2Y5OC4uZTNmYzZlZDdiNzljIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX2RldmljZS5jCkBAIC01MDMsOCArNTAzLDggQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBrZmRfZGV2aWNlX2luZm8gKmtmZF9zdXBwb3J0ZWRfZGV2aWNlc1tdWzJdID0gewog
I2lmZGVmIEtGRF9TVVBQT1JUX0lPTU1VX1YyCiAJW0NISVBfS0FWRVJJXSA9IHsma2F2ZXJpX2Rl
dmljZV9pbmZvLCBOVUxMfSwKIAlbQ0hJUF9DQVJSSVpPXSA9IHsmY2Fycml6b19kZXZpY2VfaW5m
bywgTlVMTH0sCi0JW0NISVBfUkFWRU5dID0geyZyYXZlbl9kZXZpY2VfaW5mbywgTlVMTH0sCiAj
ZW5kaWYKKwlbQ0hJUF9SQVZFTl0gPSB7JnJhdmVuX2RldmljZV9pbmZvLCBOVUxMfSwKIAlbQ0hJ
UF9IQVdBSUldID0geyZoYXdhaWlfZGV2aWNlX2luZm8sIE5VTEx9LAogCVtDSElQX1RPTkdBXSA9
IHsmdG9uZ2FfZGV2aWNlX2luZm8sIE5VTEx9LAogCVtDSElQX0ZJSkldID0geyZmaWppX2Rldmlj
ZV9pbmZvLCAmZmlqaV92Zl9kZXZpY2VfaW5mb30sCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
