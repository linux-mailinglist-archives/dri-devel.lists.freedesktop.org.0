Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C05C66F9F1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 09:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193F789B06;
	Mon, 22 Jul 2019 07:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32FC689A8C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 05:57:38 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E75CC2E21CA5AA7E315C;
 Mon, 22 Jul 2019 13:57:35 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Mon, 22 Jul 2019
 13:57:26 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <james.qian.wang@arm.com>, <liviu.dudau@arm.com>, <brian.starkey@arm.com>, 
 <airlied@linux.ie>
Subject: [PATCH v2 -next] drm/komeda: remove set but not used variable 'old'
Date: Mon, 22 Jul 2019 13:56:27 +0800
Message-ID: <20190722055627.38008-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20190709135808.56388-1-yuehaibing@huawei.com>
References: <20190709135808.56388-1-yuehaibing@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 22 Jul 2019 07:08:15 +0000
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
aS5jb20+Ci0tLQp2MjogZml4IGNvbXBpbGUgZXJyCi0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYyB8IDQgKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jCmluZGV4IGMwOTVhZjEuLjk4ZTkxNWUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5l
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUu
YwpAQCAtMTU4LDcgKzE1OCw3IEBAIHN0YXRpYyB2b2lkIGtvbWVkYV9wbGFuZV9yZXNldChzdHJ1
Y3QgZHJtX3BsYW5lICpwbGFuZSkKIHN0YXRpYyBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICoKIGtv
bWVkYV9wbGFuZV9hdG9taWNfZHVwbGljYXRlX3N0YXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5l
KQogewotCXN0cnVjdCBrb21lZGFfcGxhbmVfc3RhdGUgKm5ldywgKm9sZDsKKwlzdHJ1Y3Qga29t
ZWRhX3BsYW5lX3N0YXRlICpuZXc7CiAKIAlpZiAoV0FSTl9PTighcGxhbmUtPnN0YXRlKSkKIAkJ
cmV0dXJuIE5VTEw7CkBAIC0xNjksOCArMTY5LDYgQEAga29tZWRhX3BsYW5lX2F0b21pY19kdXBs
aWNhdGVfc3RhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUpCiAKIAlfX2RybV9hdG9taWNfaGVs
cGVyX3BsYW5lX2R1cGxpY2F0ZV9zdGF0ZShwbGFuZSwgJm5ldy0+YmFzZSk7CiAKLQlvbGQgPSB0
b19rcGxhbmVfc3QocGxhbmUtPnN0YXRlKTsKLQogCXJldHVybiAmbmV3LT5iYXNlOwogfQogCi0t
IAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
