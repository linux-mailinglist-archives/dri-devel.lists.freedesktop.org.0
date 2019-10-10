Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE20D398F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 08:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADE66EBA8;
	Fri, 11 Oct 2019 06:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E67C6EA9B;
 Thu, 10 Oct 2019 06:48:09 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4C858EB0C575B4513E8B;
 Thu, 10 Oct 2019 14:48:07 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Thu, 10 Oct 2019
 14:47:57 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <robdclark@chromium.org>, <sean@poorly.run>, <airlied@linux.ie>,
 <bjorn.andersson@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/msm/dsi: Remove set but not used variable 'lpx'
Date: Thu, 10 Oct 2019 14:55:05 +0800
Message-ID: <1570690506-83287-4-git-send-email-zhengbin13@huawei.com>
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
cHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHkuYzogSW4gZnVuY3Rpb24gbXNtX2RzaV9kcGh5X3Rp
bWluZ19jYWxjX3YyOgpkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeS5jOjE1Njox
Nzogd2FybmluZzogdmFyaWFibGUgbHB4IHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1z
ZXQtdmFyaWFibGVdCmRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmM6IEluIGZ1
bmN0aW9uIG1zbV9kc2lfZHBoeV90aW1pbmdfY2FsY192MzoKZHJpdmVycy9ncHUvZHJtL21zbS9k
c2kvcGh5L2RzaV9waHkuYzoyNzM6MTc6IHdhcm5pbmc6IHZhcmlhYmxlIGxweCBzZXQgYnV0IG5v
dCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKJ2xweCcgaW4gbXNtX2RzaV9kcGh5
X3RpbWluZ19jYWxjX3YyIGlzIG5vdCB1c2VkIHNpbmNlIGNvbW1pdCBhNGRmNjhmYTIzMmUKKCJk
cm0vbXNtL2RzaTogQWRkIG5ldyBtZXRob2QgdG8gY2FsY3VsYXRlIDE0bm0gUEhZIHRpbWluZ3Mi
KQoKJ2xweCcgaW4gbXNtX2RzaV9kcGh5X3RpbWluZ19jYWxjX3YzIGlzIG5vdCB1c2VkIHNpbmNl
IGNvbW1pdCBmMWZhN2ZmNDQwNTYKKCJkcm0vbXNtL2RzaTogaW1wbGVtZW50IGF1dG8gUEhZIHRp
bWluZyBjYWxjdWxhdG9yIGZvciAxMG5tIFBIWSIpCgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8
aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IHpoZW5nYmluIDx6aGVuZ2JpbjEzQGh1
YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHkuYyB8IDYg
KystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmMgYi9kcml2
ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeS5jCmluZGV4IDM1MjI4NjMuLmFhMjJjM2Eg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHkuYwpAQCAtMTQ1LDcgKzE0NSw3IEBA
IGludCBtc21fZHNpX2RwaHlfdGltaW5nX2NhbGNfdjIoc3RydWN0IG1zbV9kc2lfZHBoeV90aW1p
bmcgKnRpbWluZywKIHsKIAljb25zdCB1bnNpZ25lZCBsb25nIGJpdF9yYXRlID0gY2xrX3JlcS0+
Yml0Y2xrX3JhdGU7CiAJY29uc3QgdW5zaWduZWQgbG9uZyBlc2NfcmF0ZSA9IGNsa19yZXEtPmVz
Y2Nsa19yYXRlOwotCXMzMiB1aSwgdWlfeDgsIGxweDsKKwlzMzIgdWksIHVpX3g4OwogCXMzMiB0
bWF4LCB0bWluOwogCXMzMiBwY250MCA9IDUwOwogCXMzMiBwY250MSA9IDUwOwpAQCAtMTc1LDcg
KzE3NSw2IEBAIGludCBtc21fZHNpX2RwaHlfdGltaW5nX2NhbGNfdjIoc3RydWN0IG1zbV9kc2lf
ZHBoeV90aW1pbmcgKnRpbWluZywKCiAJdWkgPSBtdWx0X2ZyYWMoTlNFQ19QRVJfTVNFQywgY29l
ZmYsIGJpdF9yYXRlIC8gMTAwMCk7CiAJdWlfeDggPSB1aSA8PCAzOwotCWxweCA9IG11bHRfZnJh
YyhOU0VDX1BFUl9NU0VDLCBjb2VmZiwgZXNjX3JhdGUgLyAxMDAwKTsKCiAJdGVtcCA9IFNfRElW
X1JPVU5EX1VQKDM4ICogY29lZmYgLSB2YWxfY2tsbiAqIHVpLCB1aV94OCk7CiAJdG1pbiA9IG1h
eF90KHMzMiwgdGVtcCwgMCk7CkBAIC0yNjIsNyArMjYxLDcgQEAgaW50IG1zbV9kc2lfZHBoeV90
aW1pbmdfY2FsY192MyhzdHJ1Y3QgbXNtX2RzaV9kcGh5X3RpbWluZyAqdGltaW5nLAogewogCWNv
bnN0IHVuc2lnbmVkIGxvbmcgYml0X3JhdGUgPSBjbGtfcmVxLT5iaXRjbGtfcmF0ZTsKIAljb25z
dCB1bnNpZ25lZCBsb25nIGVzY19yYXRlID0gY2xrX3JlcS0+ZXNjY2xrX3JhdGU7Ci0JczMyIHVp
LCB1aV94OCwgbHB4OworCXMzMiB1aSwgdWlfeDg7CiAJczMyIHRtYXgsIHRtaW47CiAJczMyIHBj
bnQwID0gNTA7CiAJczMyIHBjbnQxID0gNTA7CkBAIC0yODQsNyArMjgzLDYgQEAgaW50IG1zbV9k
c2lfZHBoeV90aW1pbmdfY2FsY192MyhzdHJ1Y3QgbXNtX2RzaV9kcGh5X3RpbWluZyAqdGltaW5n
LAoKIAl1aSA9IG11bHRfZnJhYyhOU0VDX1BFUl9NU0VDLCBjb2VmZiwgYml0X3JhdGUgLyAxMDAw
KTsKIAl1aV94OCA9IHVpIDw8IDM7Ci0JbHB4ID0gbXVsdF9mcmFjKE5TRUNfUEVSX01TRUMsIGNv
ZWZmLCBlc2NfcmF0ZSAvIDEwMDApOwoKIAl0ZW1wID0gU19ESVZfUk9VTkRfVVAoMzggKiBjb2Vm
ZiwgdWlfeDgpOwogCXRtaW4gPSBtYXhfdChzMzIsIHRlbXAsIDApOwotLQoyLjcuNAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
