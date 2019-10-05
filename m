Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD85BCCB40
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 18:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F5C6E3D8;
	Sat,  5 Oct 2019 16:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345196E1CD;
 Sat,  5 Oct 2019 04:26:47 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id ED81FCDD2C8DCA5D4BFC;
 Sat,  5 Oct 2019 12:26:44 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Sat, 5 Oct 2019
 12:26:39 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <jsanka@codeaurora.org>, <jcrouse@codeaurora.org>,
 <gregkh@linuxfoundation.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: [PATCH 3/6] drm/msm/dpu: Remove set but not used variable 'priv' in
 dpu_core_irq.c
Date: Sat, 5 Oct 2019 12:33:46 +0800
Message-ID: <1570250029-67639-4-git-send-email-zhengbin13@huawei.com>
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
cHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NvcmVfaXJxLmM6IEluIGZ1bmN0aW9uIGRwdV9jb3Jl
X2lycV9wcmVpbnN0YWxsOgpkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY29yZV9p
cnEuYzozNTQ6MjY6IHdhcm5pbmc6IHZhcmlhYmxlIHByaXYgc2V0IGJ1dCBub3QgdXNlZCBbLVd1
bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1
X2NvcmVfaXJxLmM6IEluIGZ1bmN0aW9uIGRwdV9jb3JlX2lycV91bmluc3RhbGw6CmRyaXZlcnMv
Z3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jb3JlX2lycS5jOjM5MDoyNjogd2FybmluZzogdmFy
aWFibGUgcHJpdiBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoK
SXQgaXMgbm90IHVzZWQgc2luY2UgY29tbWl0IDI1ZmRkNTkzM2U0YyAoImRybS9tc206CkFkZCBT
RE04NDUgRFBVIHN1cHBvcnQiKQoKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3
ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiB6aGVuZ2JpbiA8emhlbmdiaW4xM0BodWF3ZWkuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jb3JlX2lycS5jIHwgNCAtLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY29yZV9pcnEuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZGlzcC9kcHUxL2RwdV9jb3JlX2lycS5jCmluZGV4IGNkYmVhMzguLjY1NWUxMjkgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jb3JlX2lycS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jb3JlX2lycS5jCkBAIC0zNDMsNyArMzQz
LDYgQEAgdm9pZCBkcHVfZGVidWdmc19jb3JlX2lycV9pbml0KHN0cnVjdCBkcHVfa21zICpkcHVf
a21zLAoKIHZvaWQgZHB1X2NvcmVfaXJxX3ByZWluc3RhbGwoc3RydWN0IGRwdV9rbXMgKmRwdV9r
bXMpCiB7Ci0Jc3RydWN0IG1zbV9kcm1fcHJpdmF0ZSAqcHJpdjsKIAlpbnQgaTsKCiAJaWYgKCFk
cHVfa21zLT5kZXYpIHsKQEAgLTM1Myw3ICszNTIsNiBAQCB2b2lkIGRwdV9jb3JlX2lycV9wcmVp
bnN0YWxsKHN0cnVjdCBkcHVfa21zICpkcHVfa21zKQogCQlEUFVfRVJST1IoImludmFsaWQgZGV2
aWNlIHByaXZhdGVcbiIpOwogCQlyZXR1cm47CiAJfQotCXByaXYgPSBkcHVfa21zLT5kZXYtPmRl
dl9wcml2YXRlOwoKIAlwbV9ydW50aW1lX2dldF9zeW5jKCZkcHVfa21zLT5wZGV2LT5kZXYpOwog
CWRwdV9jbGVhcl9hbGxfaXJxcyhkcHVfa21zKTsKQEAgLTM3OSw3ICszNzcsNiBAQCB2b2lkIGRw
dV9jb3JlX2lycV9wcmVpbnN0YWxsKHN0cnVjdCBkcHVfa21zICpkcHVfa21zKQoKIHZvaWQgZHB1
X2NvcmVfaXJxX3VuaW5zdGFsbChzdHJ1Y3QgZHB1X2ttcyAqZHB1X2ttcykKIHsKLQlzdHJ1Y3Qg
bXNtX2RybV9wcml2YXRlICpwcml2OwogCWludCBpOwoKIAlpZiAoIWRwdV9rbXMtPmRldikgewpA
QCAtMzg5LDcgKzM4Niw2IEBAIHZvaWQgZHB1X2NvcmVfaXJxX3VuaW5zdGFsbChzdHJ1Y3QgZHB1
X2ttcyAqZHB1X2ttcykKIAkJRFBVX0VSUk9SKCJpbnZhbGlkIGRldmljZSBwcml2YXRlXG4iKTsK
IAkJcmV0dXJuOwogCX0KLQlwcml2ID0gZHB1X2ttcy0+ZGV2LT5kZXZfcHJpdmF0ZTsKCiAJcG1f
cnVudGltZV9nZXRfc3luYygmZHB1X2ttcy0+cGRldi0+ZGV2KTsKIAlmb3IgKGkgPSAwOyBpIDwg
ZHB1X2ttcy0+aXJxX29iai50b3RhbF9pcnFzOyBpKyspCi0tCjIuNy40CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
