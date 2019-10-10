Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 482E7D398A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 08:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD8C6EB9D;
	Fri, 11 Oct 2019 06:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC1F6EA95;
 Thu, 10 Oct 2019 06:48:06 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 36984C152B3317FBD424;
 Thu, 10 Oct 2019 14:48:02 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Thu, 10 Oct 2019
 14:47:56 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <robdclark@chromium.org>, <sean@poorly.run>, <airlied@linux.ie>,
 <bjorn.andersson@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/msm/mdp5: Remove set but not used variable 'fmt'
Date: Thu, 10 Oct 2019 14:55:03 +0800
Message-ID: <1570690506-83287-2-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570690506-83287-1-git-send-email-zhengbin13@huawei.com>
References: <1570690506-83287-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 11 Oct 2019 06:48:21 +0000
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
cHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9zbXAuYzogSW4gZnVuY3Rpb24gbWRwNV9zbXBfY2Fs
Y3VsYXRlOgpkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X3NtcC5jOjEzNDo2OiB3
YXJuaW5nOiB2YXJpYWJsZSBmbXQgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12
YXJpYWJsZV0KCkl0IGlzIG5vdCB1c2VkIHNpbmNlIGNvbW1pdCAyNGM0NzhlYWQwYmYgKCJkcm0v
Zm91cmNjOgpQYXNzIHRoZSBmb3JtYXRfaW5mbyBwb2ludGVyIHRvIGRybV9mb3JtYXRfcGxhbmVf
Y3BwIikKClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KU2lnbmVk
LW9mZi1ieTogemhlbmdiaW4gPHpoZW5nYmluMTNAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X3NtcC5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUv
bWRwNV9zbXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfc21wLmMKaW5k
ZXggYjMxY2ZiNS4uZDdmYTJjNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNw
L21kcDUvbWRwNV9zbXAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1
X3NtcC5jCkBAIC0xMjEsNyArMTIxLDYgQEAgdWludDMyX3QgbWRwNV9zbXBfY2FsY3VsYXRlKHN0
cnVjdCBtZHA1X3NtcCAqc21wLAogCXN0cnVjdCBtZHA1X2ttcyAqbWRwNV9rbXMgPSBnZXRfa21z
KHNtcCk7CiAJaW50IHJldiA9IG1kcDVfY2ZnX2dldF9od19yZXYobWRwNV9rbXMtPmNmZyk7CiAJ
aW50IGksIGhzdWIsIG5wbGFuZXMsIG5saW5lczsKLQl1MzIgZm10ID0gZm9ybWF0LT5iYXNlLnBp
eGVsX2Zvcm1hdDsKIAl1aW50MzJfdCBibGtjZmcgPSAwOwoKIAlucGxhbmVzID0gaW5mby0+bnVt
X3BsYW5lczsKQEAgLTEzNSw3ICsxMzQsNiBAQCB1aW50MzJfdCBtZHA1X3NtcF9jYWxjdWxhdGUo
c3RydWN0IG1kcDVfc21wICpzbXAsCiAJICogdGhlbSB0b2dldGhlciwgd3JpdGVzIHRvIFNNUCB1
c2luZyBhIHNpbmdsZSBjbGllbnQuCiAJICovCiAJaWYgKChyZXYgPiAwKSAmJiAoZm9ybWF0LT5j
aHJvbWFfc2FtcGxlID4gQ0hST01BX0ZVTEwpKSB7Ci0JCWZtdCA9IERSTV9GT1JNQVRfTlYyNDsK
IAkJbnBsYW5lcyA9IDI7CgogCQkvKiBpZiBkZWNpbWF0aW9uIGlzIGVuYWJsZWQsIEhXIGRlY2lt
YXRlcyBsZXNzIG9uIHRoZQotLQoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
