Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0316DCCB48
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 18:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7E86E3AA;
	Sat,  5 Oct 2019 16:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3870B6E2FF;
 Sat,  5 Oct 2019 04:26:47 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id E55E75A52B0DBFFE5013;
 Sat,  5 Oct 2019 12:26:44 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Sat, 5 Oct 2019
 12:26:38 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <jsanka@codeaurora.org>, <jcrouse@codeaurora.org>,
 <gregkh@linuxfoundation.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: [PATCH 2/6] drm/msm/dpu: Remove set but not used variable 'priv' in
 dpu_encoder_phys_vid.c
Date: Sat, 5 Oct 2019 12:33:45 +0800
Message-ID: <1570250029-67639-3-git-send-email-zhengbin13@huawei.com>
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
cHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXJfcGh5c192aWQuYzogSW4gZnVuY3Rpb24g
ZHB1X2VuY29kZXJfcGh5c192aWRfZGlzYWJsZToKZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2Rw
dTEvZHB1X2VuY29kZXJfcGh5c192aWQuYzo1NjY6MjY6IHdhcm5pbmc6IHZhcmlhYmxlIHByaXYg
c2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCkl0IGlzIG5vdCB1
c2VkIHNpbmNlIGNvbW1pdCAyNWZkZDU5MzNlNGMgKCJkcm0vbXNtOgpBZGQgU0RNODQ1IERQVSBz
dXBwb3J0IikKClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KU2ln
bmVkLW9mZi1ieTogemhlbmdiaW4gPHpoZW5nYmluMTNAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlcl9waHlzX3ZpZC5jIHwgMiAtLQogMSBm
aWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXJfcGh5c192aWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyX3BoeXNfdmlkLmMKaW5kZXggYjljODRmYi4uYzdhM2Y0
YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXJf
cGh5c192aWQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rl
cl9waHlzX3ZpZC5jCkBAIC01NjYsNyArNTY2LDYgQEAgc3RhdGljIHZvaWQgZHB1X2VuY29kZXJf
cGh5c192aWRfcHJlcGFyZV9mb3Jfa2lja29mZigKCiBzdGF0aWMgdm9pZCBkcHVfZW5jb2Rlcl9w
aHlzX3ZpZF9kaXNhYmxlKHN0cnVjdCBkcHVfZW5jb2Rlcl9waHlzICpwaHlzX2VuYykKIHsKLQlz
dHJ1Y3QgbXNtX2RybV9wcml2YXRlICpwcml2OwogCXVuc2lnbmVkIGxvbmcgbG9ja19mbGFnczsK
IAlpbnQgcmV0OwoKQEAgLTU3NSw3ICs1NzQsNiBAQCBzdGF0aWMgdm9pZCBkcHVfZW5jb2Rlcl9w
aHlzX3ZpZF9kaXNhYmxlKHN0cnVjdCBkcHVfZW5jb2Rlcl9waHlzICpwaHlzX2VuYykKIAkJRFBV
X0VSUk9SKCJpbnZhbGlkIGVuY29kZXIvZGV2aWNlXG4iKTsKIAkJcmV0dXJuOwogCX0KLQlwcml2
ID0gcGh5c19lbmMtPnBhcmVudC0+ZGV2LT5kZXZfcHJpdmF0ZTsKCiAJaWYgKCFwaHlzX2VuYy0+
aHdfaW50ZiB8fCAhcGh5c19lbmMtPmh3X2N0bCkgewogCQlEUFVfRVJST1IoImludmFsaWQgaHdf
aW50ZiAlZCBod19jdGwgJWRcbiIsCi0tCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
