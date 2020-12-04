Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 135AD2CE9D8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5356E187;
	Fri,  4 Dec 2020 08:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E126E0E9
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 01:23:18 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CnFLq4YnWz15X9y;
 Fri,  4 Dec 2020 09:22:43 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Fri, 4 Dec 2020 09:23:07 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] drm/hisilicon: Deletted unused local parameters
Date: Fri, 4 Dec 2020 09:23:17 +0800
Message-ID: <1607044999-47666-12-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607044999-47666-1-git-send-email-tiantao6@hisilicon.com>
References: <1607044999-47666-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:34 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZGVsZXR0ZWQgdW51c2VkIHZhcmlhYmxlIOKAmHByaXbigJkuCgpTaWduZWQtb2ZmLWJ5OiBUaWFu
IFRhbyA8dGlhbnRhbzZAaGlzaWxpY29uLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxp
Y29uL2hpYm1jL2hpYm1jX2RybV9kcnYuYyB8IDUgKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGlj
b24vaGlibWMvaGlibWNfZHJtX2Rydi5jCmluZGV4IDA0ZmVlMTguLjhhMDQwMTQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jCkBAIC0yMzcs
MTIgKzIzNyw5IEBAIHN0YXRpYyBpbnQgaGlibWNfaHdfaW5pdChzdHJ1Y3QgaGlibWNfZHJtX3By
aXZhdGUgKnByaXYpCiAKIHN0YXRpYyBpbnQgaGlibWNfdW5sb2FkKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYpCiB7Ci0Jc3RydWN0IGhpYm1jX2RybV9wcml2YXRlICpwcml2ID0gdG9faGlibWNfZHJt
X3ByaXZhdGUoZGV2KTsKLQogCWRybV9hdG9taWNfaGVscGVyX3NodXRkb3duKGRldik7Ci0KIAlw
Y2lfZGlzYWJsZV9tc2koZGV2LT5wZGV2KTsKLQlkZXYtPmRldl9wcml2YXRlID0gTlVMTDsKKwog
CXJldHVybiAwOwogfQogCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
