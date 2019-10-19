Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7179CDDBA2
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 02:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5207A89CB5;
	Sun, 20 Oct 2019 00:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D4C89FCA;
 Sat, 19 Oct 2019 03:17:30 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 42DCD11FC222B208D682;
 Sat, 19 Oct 2019 11:17:27 +0800 (CST)
Received: from RH5885H-V3.huawei.com (10.90.53.225) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.439.0; Sat, 19 Oct 2019 11:17:21 +0800
From: Chen Wandun <chenwandun@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <Bhawanpreet.Lakha@amd.com>, <David.Francis@amd.com>,
 <Tony.Cheng@amd.com>, <abdoulaye.berthe@amd.com>, <Thomas.Lim@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/amd/display: remove gcc warning Wunused-but-set-variable
Date: Sat, 19 Oct 2019 11:23:51 +0800
Message-ID: <1571455431-104881-1-git-send-email-chenwandun@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 20 Oct 2019 00:06:45 +0000
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
Cc: chenwandun@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hlbndhbmR1biA8Y2hlbndhbmR1bkBodWF3ZWkuY29tPgoKZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYXV4LmM6IEluIGZ1bmN0aW9uIGRjZV9hdXhfY29uZmln
dXJlX3RpbWVvdXQ6CmRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5j
OiB3YXJuaW5nOiB2YXJpYWJsZSB0aW1lb3V0IHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1
dC1zZXQtdmFyaWFibGVdCgpTaWduZWQtb2ZmLWJ5OiBDaGVud2FuZHVuIDxjaGVud2FuZHVuQGh1
YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYXV4
LmMgfCA1IC0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXguYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5jCmluZGV4IDk3NmJkNDkuLjczOWY4
ZTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1
eC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5jCkBA
IC00MzIsNyArNDMyLDYgQEAgc3RhdGljIGJvb2wgZGNlX2F1eF9jb25maWd1cmVfdGltZW91dChz
dHJ1Y3QgZGRjX3NlcnZpY2UgKmRkYywKIHsKIAl1aW50MzJfdCBtdWx0aXBsaWVyID0gMDsKIAl1
aW50MzJfdCBsZW5ndGggPSAwOwotCXVpbnQzMl90IHRpbWVvdXQgPSAwOwogCXN0cnVjdCBkZGMg
KmRkY19waW4gPSBkZGMtPmRkY19waW47CiAJc3RydWN0IGRjZV9hdXggKmF1eF9lbmdpbmUgPSBk
ZGMtPmN0eC0+ZGMtPnJlc19wb29sLT5lbmdpbmVzW2RkY19waW4tPnBpbl9kYXRhLT5lbl07CiAJ
c3RydWN0IGF1eF9lbmdpbmVfZGNlMTEwICphdXgxMTAgPSBGUk9NX0FVWF9FTkdJTkUoYXV4X2Vu
Z2luZSk7CkBAIC00NDYsMjUgKzQ0NSwyMSBAQCBzdGF0aWMgYm9vbCBkY2VfYXV4X2NvbmZpZ3Vy
ZV90aW1lb3V0KHN0cnVjdCBkZGNfc2VydmljZSAqZGRjLAogCQlsZW5ndGggPSB0aW1lb3V0X2lu
X3VzL1RJTUVfT1VUX01VTFRJUExJRVJfODsKIAkJaWYgKHRpbWVvdXRfaW5fdXMgJSBUSU1FX09V
VF9NVUxUSVBMSUVSXzggIT0gMCkKIAkJCWxlbmd0aCsrOwotCQl0aW1lb3V0ID0gbGVuZ3RoICog
VElNRV9PVVRfTVVMVElQTElFUl84OwogCX0gZWxzZSBpZiAodGltZW91dF9pbl91cyA8PSAyICog
VElNRV9PVVRfSU5DUkVNRU5UKSB7CiAJCW11bHRpcGxpZXIgPSAxOwogCQlsZW5ndGggPSB0aW1l
b3V0X2luX3VzL1RJTUVfT1VUX01VTFRJUExJRVJfMTY7CiAJCWlmICh0aW1lb3V0X2luX3VzICUg
VElNRV9PVVRfTVVMVElQTElFUl8xNiAhPSAwKQogCQkJbGVuZ3RoKys7Ci0JCXRpbWVvdXQgPSBs
ZW5ndGggKiBUSU1FX09VVF9NVUxUSVBMSUVSXzE2OwogCX0gZWxzZSBpZiAodGltZW91dF9pbl91
cyA8PSA0ICogVElNRV9PVVRfSU5DUkVNRU5UKSB7CiAJCW11bHRpcGxpZXIgPSAyOwogCQlsZW5n
dGggPSB0aW1lb3V0X2luX3VzL1RJTUVfT1VUX01VTFRJUExJRVJfMzI7CiAJCWlmICh0aW1lb3V0
X2luX3VzICUgVElNRV9PVVRfTVVMVElQTElFUl8zMiAhPSAwKQogCQkJbGVuZ3RoKys7Ci0JCXRp
bWVvdXQgPSBsZW5ndGggKiBUSU1FX09VVF9NVUxUSVBMSUVSXzMyOwogCX0gZWxzZSBpZiAodGlt
ZW91dF9pbl91cyA+IDQgKiBUSU1FX09VVF9JTkNSRU1FTlQpIHsKIAkJbXVsdGlwbGllciA9IDM7
CiAJCWxlbmd0aCA9IHRpbWVvdXRfaW5fdXMvVElNRV9PVVRfTVVMVElQTElFUl82NDsKIAkJaWYg
KHRpbWVvdXRfaW5fdXMgJSBUSU1FX09VVF9NVUxUSVBMSUVSXzY0ICE9IDApCiAJCQlsZW5ndGgr
KzsKLQkJdGltZW91dCA9IGxlbmd0aCAqIFRJTUVfT1VUX01VTFRJUExJRVJfNjQ7CiAJfQogCiAJ
bGVuZ3RoID0gKGxlbmd0aCA8IE1BWF9USU1FT1VUX0xFTkdUSCkgPyBsZW5ndGggOiBNQVhfVElN
RU9VVF9MRU5HVEg7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
