Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F7EDCD8
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 09:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263B089204;
	Mon, 29 Apr 2019 07:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56568893A2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2019 16:42:30 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id ACA57BAFC13D27132B9F;
 Sat, 27 Apr 2019 00:42:22 +0800 (CST)
Received: from localhost (10.177.31.96) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Sat, 27 Apr 2019
 00:42:09 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <james.qian.wang@arm.com>, <liviu.dudau@arm.com>, <brian.starkey@arm.com>, 
 <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH -next] drm/komeda: remove set but not used variable 'kcrtc'
Date: Sat, 27 Apr 2019 00:42:02 +0800
Message-ID: <20190426164202.34932-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 29 Apr 2019 07:28:44 +0000
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

RnJvbTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgoKRml4ZXMgZ2NjICctV3Vu
dXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYzogSW4gZnVuY3Rpb24ga29tZWRhX3BsYW5lX2F0b21p
Y19jaGVjazoKZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUu
Yzo0OToyMjogd2FybmluZzogdmFyaWFibGUga2NydGMgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVz
ZWQtYnV0LXNldC12YXJpYWJsZV0KCkl0IGlzIG5ldmVyIHVzZWQgc2luY2UgaW50cm9kdWN0aW9u
IGluCmNvbW1pdCA3ZDMxYjllN2E1NTAgKCJkcm0va29tZWRhOiBBZGQga29tZWRhX3BsYW5lL3Bs
YW5lX2hlbHBlcl9mdW5jcyIpCgpTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5n
QGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfcGxhbmUuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jCmluZGV4
IDA3ZWQwY2MuLjA3NTM4OTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX3BsYW5lLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfcGxhbmUuYwpAQCAtNTUsNyArNTUsNiBAQCBrb21lZGFfcGxhbmVfYXRv
bWljX2NoZWNrKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAogCXN0cnVjdCBrb21lZGFfcGxhbmVf
c3RhdGUgKmtwbGFuZV9zdCA9IHRvX2twbGFuZV9zdChzdGF0ZSk7CiAJc3RydWN0IGtvbWVkYV9s
YXllciAqbGF5ZXIgPSBrcGxhbmUtPmxheWVyOwogCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0
Y19zdDsKLQlzdHJ1Y3Qga29tZWRhX2NydGMgKmtjcnRjOwogCXN0cnVjdCBrb21lZGFfY3J0Y19z
dGF0ZSAqa2NydGNfc3Q7CiAJc3RydWN0IGtvbWVkYV9kYXRhX2Zsb3dfY2ZnIGRmbG93OwogCWlu
dCBlcnI7CkBAIC03Myw3ICs3Miw2IEBAIGtvbWVkYV9wbGFuZV9hdG9taWNfY2hlY2soc3RydWN0
IGRybV9wbGFuZSAqcGxhbmUsCiAJaWYgKCFjcnRjX3N0LT5hY3RpdmUpCiAJCXJldHVybiAwOwog
Ci0Ja2NydGMgPSB0b19rY3J0YyhzdGF0ZS0+Y3J0Yyk7CiAJa2NydGNfc3QgPSB0b19rY3J0Y19z
dChjcnRjX3N0KTsKIAogCWVyciA9IGtvbWVkYV9wbGFuZV9pbml0X2RhdGFfZmxvdyhzdGF0ZSwg
JmRmbG93KTsKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
