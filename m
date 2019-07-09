Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA67642AF
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E33989B9F;
	Wed, 10 Jul 2019 07:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CC16E05A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 13:58:27 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id A9C93614EF8499F1F427;
 Tue,  9 Jul 2019 21:58:22 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Tue, 9 Jul 2019
 21:58:11 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <james.qian.wang@arm.com>, <liviu.dudau@arm.com>, <brian.starkey@arm.com>, 
 <airlied@linux.ie>
Subject: [PATCH -next] drm/komeda: remove set but not used variable 'old'
Date: Tue, 9 Jul 2019 21:58:08 +0800
Message-ID: <20190709135808.56388-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 10 Jul 2019 07:25:20 +0000
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
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYzoKIEluIGZ1bmN0aW9uIGtv
bWVkYV9wbGFuZV9hdG9taWNfZHVwbGljYXRlX3N0YXRlOgpkcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jOjE2MTozNToKIHdhcm5pbmc6IHZhcmlhYmxlIG9s
ZCBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlCgpJdCBpcyBub3Qg
dXNlZCBzaW5jZSBjb21taXQgOTkwZGVlM2FhNDU2ICgiZHJtL2tvbWVkYToKQ29tcHV0aW5nIGlt
YWdlIGVuaGFuY2VyIGludGVybmFsbHkiKQoKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtj
aUBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdl
aS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxh
bmUuYyB8IDQgLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMKaW5kZXggYzA5
NWFmMS4uYzEzODFhYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfcGxhbmUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9wbGFuZS5jCkBAIC0xNTgsOCArMTU4LDYgQEAgc3RhdGljIHZvaWQga29tZWRh
X3BsYW5lX3Jlc2V0KHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lKQogc3RhdGljIHN0cnVjdCBkcm1f
cGxhbmVfc3RhdGUgKgoga29tZWRhX3BsYW5lX2F0b21pY19kdXBsaWNhdGVfc3RhdGUoc3RydWN0
IGRybV9wbGFuZSAqcGxhbmUpCiB7Ci0Jc3RydWN0IGtvbWVkYV9wbGFuZV9zdGF0ZSAqbmV3LCAq
b2xkOwotCiAJaWYgKFdBUk5fT04oIXBsYW5lLT5zdGF0ZSkpCiAJCXJldHVybiBOVUxMOwogCkBA
IC0xNjksOCArMTY3LDYgQEAga29tZWRhX3BsYW5lX2F0b21pY19kdXBsaWNhdGVfc3RhdGUoc3Ry
dWN0IGRybV9wbGFuZSAqcGxhbmUpCiAKIAlfX2RybV9hdG9taWNfaGVscGVyX3BsYW5lX2R1cGxp
Y2F0ZV9zdGF0ZShwbGFuZSwgJm5ldy0+YmFzZSk7CiAKLQlvbGQgPSB0b19rcGxhbmVfc3QocGxh
bmUtPnN0YXRlKTsKLQogCXJldHVybiAmbmV3LT5iYXNlOwogfQogCi0tIAoyLjcuNAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
