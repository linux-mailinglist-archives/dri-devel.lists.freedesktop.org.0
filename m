Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1057728A2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 08:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB626E46E;
	Wed, 24 Jul 2019 06:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45966E41A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 01:41:03 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 71246B0D356AE83596C3;
 Wed, 24 Jul 2019 09:41:00 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Wed, 24 Jul 2019 09:40:54 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH -next] drm/mga: remove set but not used variable 'buf_priv'
Date: Wed, 24 Jul 2019 01:46:19 +0000
Message-ID: <20190724014619.32665-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 24 Jul 2019 06:54:25 +0000
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
Cc: kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL21nYS9tZ2Ffc3RhdGUuYzogSW4gZnVuY3Rpb24gJ21nYV9kbWFfaWxvYWQnOgpkcml2
ZXJzL2dwdS9kcm0vbWdhL21nYV9zdGF0ZS5jOjk0NToyMjogd2FybmluZzoKIHZhcmlhYmxlICdi
dWZfcHJpdicgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCkl0
IGlzIG5ldmVyIHVzZWQsIHNvIGNhbiBiZSByZW1vdmVkLgoKUmVwb3J0ZWQtYnk6IEh1bGsgUm9i
b3QgPGh1bGtjaUBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWli
aW5nQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21nYS9tZ2Ffc3RhdGUuYyB8IDIg
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tZ2EvbWdhX3N0YXRlLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWdhL21nYV9zdGF0ZS5j
CmluZGV4IDc3YTBiMDA2ZjA2Ni4uMGRlYzQwNjJlNWEyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWdhL21nYV9zdGF0ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2EvbWdhX3N0YXRl
LmMKQEAgLTk0Miw3ICs5NDIsNiBAQCBzdGF0aWMgaW50IG1nYV9kbWFfaWxvYWQoc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwgc3RydWN0IGRybV9maWxlICpmaQogCXN0cnVjdCBk
cm1fZGV2aWNlX2RtYSAqZG1hID0gZGV2LT5kbWE7CiAJZHJtX21nYV9wcml2YXRlX3QgKmRldl9w
cml2ID0gZGV2LT5kZXZfcHJpdmF0ZTsKIAlzdHJ1Y3QgZHJtX2J1ZiAqYnVmOwotCWRybV9tZ2Ff
YnVmX3ByaXZfdCAqYnVmX3ByaXY7CiAJZHJtX21nYV9pbG9hZF90ICppbG9hZCA9IGRhdGE7CiAJ
RFJNX0RFQlVHKCJcbiIpOwogCkBAIC05NTksNyArOTU4LDYgQEAgc3RhdGljIGludCBtZ2FfZG1h
X2lsb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsIHN0cnVjdCBkcm1fZmls
ZSAqZmkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKIAlidWYgPSBkbWEtPmJ1Zmxpc3RbaWxvYWQtPmlk
eF07Ci0JYnVmX3ByaXYgPSBidWYtPmRldl9wcml2YXRlOwogCiAJaWYgKG1nYV92ZXJpZnlfaWxv
YWQoZGV2X3ByaXYsIGlsb2FkLT5kc3RvcmcsIGlsb2FkLT5sZW5ndGgpKSB7CiAJCW1nYV9mcmVl
bGlzdF9wdXQoZGV2LCBidWYpOwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
