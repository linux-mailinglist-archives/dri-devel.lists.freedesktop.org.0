Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C60BCCB45
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 18:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE95C6E3E7;
	Sat,  5 Oct 2019 16:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDF26E113
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2019 04:26:46 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 231B1337245409C4E4D8;
 Sat,  5 Oct 2019 12:26:45 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Sat, 5 Oct 2019
 12:26:38 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <jsanka@codeaurora.org>, <jcrouse@codeaurora.org>,
 <gregkh@linuxfoundation.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: [PATCH 1/6] drm/msm/dpu: Remove set but not used variable 'priv' in
 dpu_kms.c
Date: Sat, 5 Oct 2019 12:33:44 +0800
Message-ID: <1570250029-67639-2-git-send-email-zhengbin13@huawei.com>
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
cHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jOiBJbiBmdW5jdGlvbiBfZHB1X2Rhbmdlcl9z
aWduYWxfc3RhdHVzOgpkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmM6ODA6
MjY6IHdhcm5pbmc6IHZhcmlhYmxlIHByaXYgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0
LXNldC12YXJpYWJsZV0KZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jOiBJ
biBmdW5jdGlvbiBkcHVfa21zX3ByZXBhcmVfY29tbWl0Ogpkcml2ZXJzL2dwdS9kcm0vbXNtL2Rp
c3AvZHB1MS9kcHVfa21zLmM6MjcxOjI2OiB3YXJuaW5nOiB2YXJpYWJsZSBwcml2IHNldCBidXQg
bm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpJdCBpcyBub3QgdXNlZCBzaW5j
ZSBjb21taXQgMjVmZGQ1OTMzZTRjICgiZHJtL21zbToKQWRkIFNETTg0NSBEUFUgc3VwcG9ydCIp
CgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYt
Ynk6IHpoZW5nYmluIDx6aGVuZ2JpbjEzQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jIHwgNCAtLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVf
a21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMKaW5kZXggNThi
MDQ4NS4uNDcxMWFjNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEv
ZHB1X2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYwpA
QCAtNjgsNyArNjgsNiBAQCBzdGF0aWMgaW50IF9kcHVfZGFuZ2VyX3NpZ25hbF9zdGF0dXMoc3Ry
dWN0IHNlcV9maWxlICpzLAogCQlib29sIGRhbmdlcl9zdGF0dXMpCiB7CiAJc3RydWN0IGRwdV9r
bXMgKmttcyA9IChzdHJ1Y3QgZHB1X2ttcyAqKXMtPnByaXZhdGU7Ci0Jc3RydWN0IG1zbV9kcm1f
cHJpdmF0ZSAqcHJpdjsKIAlzdHJ1Y3QgZHB1X2Rhbmdlcl9zYWZlX3N0YXR1cyBzdGF0dXM7CiAJ
aW50IGk7CgpAQCAtNzcsNyArNzYsNiBAQCBzdGF0aWMgaW50IF9kcHVfZGFuZ2VyX3NpZ25hbF9z
dGF0dXMoc3RydWN0IHNlcV9maWxlICpzLAogCQlyZXR1cm4gMDsKIAl9CgotCXByaXYgPSBrbXMt
PmRldi0+ZGV2X3ByaXZhdGU7CiAJbWVtc2V0KCZzdGF0dXMsIDAsIHNpemVvZihzdHJ1Y3QgZHB1
X2Rhbmdlcl9zYWZlX3N0YXR1cykpOwoKIAlwbV9ydW50aW1lX2dldF9zeW5jKCZrbXMtPnBkZXYt
PmRldik7CkBAIC0yODAsNyArMjc4LDYgQEAgc3RhdGljIHZvaWQgZHB1X2ttc19wcmVwYXJlX2Nv
bW1pdChzdHJ1Y3QgbXNtX2ttcyAqa21zLAogCQlzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3Rh
dGUpCiB7CiAJc3RydWN0IGRwdV9rbXMgKmRwdV9rbXM7Ci0Jc3RydWN0IG1zbV9kcm1fcHJpdmF0
ZSAqcHJpdjsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2OwogCXN0cnVjdCBkcm1fY3J0YyAqY3J0
YzsKIAlzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3RhdGU7CkBAIC0yOTQsNyArMjkxLDYg
QEAgc3RhdGljIHZvaWQgZHB1X2ttc19wcmVwYXJlX2NvbW1pdChzdHJ1Y3QgbXNtX2ttcyAqa21z
LAoKIAlpZiAoIWRldiB8fCAhZGV2LT5kZXZfcHJpdmF0ZSkKIAkJcmV0dXJuOwotCXByaXYgPSBk
ZXYtPmRldl9wcml2YXRlOwoKIAkvKiBDYWxsIHByZXBhcmVfY29tbWl0IGZvciBhbGwgYWZmZWN0
ZWQgZW5jb2RlcnMgKi8KIAlmb3JfZWFjaF9uZXdfY3J0Y19pbl9zdGF0ZShzdGF0ZSwgY3J0Yywg
Y3J0Y19zdGF0ZSwgaSkgewotLQoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
