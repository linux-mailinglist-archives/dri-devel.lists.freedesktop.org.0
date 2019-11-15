Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C57FF932
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:46:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E556E48B;
	Sun, 17 Nov 2019 11:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3536E323
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 14:19:55 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 1CD60E7474DC08F6532E;
 Fri, 15 Nov 2019 22:19:51 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Fri, 15 Nov 2019
 22:19:44 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <patrik.r.jakobsson@gmail.com>, <daniel.vetter@ffwll.ch>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/gma500: remove set but not used variable 'error'
Date: Fri, 15 Nov 2019 22:27:06 +0800
Message-ID: <1573828027-122323-3-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573828027-122323-1-git-send-email-zhengbin13@huawei.com>
References: <1573828027-122323-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 17 Nov 2019 11:44:18 +0000
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
cHUvZHJtL2dtYTUwMC9wc2JfaXJxLmM6IEluIGZ1bmN0aW9uIHBzYl9zZ3hfaW50ZXJydXB0Ogpk
cml2ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9pcnEuYzoyMTA6Njogd2FybmluZzogdmFyaWFibGUg
ZXJyb3Igc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCkl0IGlz
IGludHJvZHVjZWQgYnkgY29tbWl0IDY0YTRhZmYyODNhYyAoImRybS9nbWE1MDA6CkFkZCBzdXBw
b3J0IGZvciBTR1ggaW50ZXJydXB0cyIpLCBidXQgbmV2ZXIgdXNlZCwgc28gcmVtb3ZlIGl0LgoK
UmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5
OiB6aGVuZ2JpbiA8emhlbmdiaW4xM0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9n
bWE1MDAvcHNiX2lycS5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2JfaXJxLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZ21hNTAwL3BzYl9pcnEuYwppbmRleCBlNjI2NWZiLi5kYzZhNzNhIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9pcnEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
Z21hNTAwL3BzYl9pcnEuYwpAQCAtMTk0LDcgKzE5NCw2IEBAIHN0YXRpYyB2b2lkIHBzYl9zZ3hf
aW50ZXJydXB0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHUzMiBzdGF0XzEsIHUzMiBzdGF0XzIp
CiB7CiAJc3RydWN0IGRybV9wc2JfcHJpdmF0ZSAqZGV2X3ByaXYgPSBkZXYtPmRldl9wcml2YXRl
OwogCXUzMiB2YWwsIGFkZHI7Ci0JaW50IGVycm9yID0gZmFsc2U7CgogCWlmIChzdGF0XzEgJiBf
UFNCX0NFX1RXT0RfQ09NUExFVEUpCiAJCXZhbCA9IFBTQl9SU0dYMzIoUFNCX0NSXzJEX0JMSVRf
U1RBVFVTKTsKQEAgLTIyOSw3ICsyMjgsNiBAQCBzdGF0aWMgdm9pZCBwc2Jfc2d4X2ludGVycnVw
dChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1MzIgc3RhdF8xLCB1MzIgc3RhdF8yKQoKIAkJCURS
TV9FUlJPUigiXHRNTVUgZmFpbGluZyBhZGRyZXNzIGlzIDB4JTA4eC5cbiIsCiAJCQkJICAodW5z
aWduZWQgaW50KWFkZHIpOwotCQkJZXJyb3IgPSB0cnVlOwogCQl9CiAJfQoKLS0KMi43LjQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
