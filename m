Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB66275292
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 09:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0381E6E457;
	Wed, 23 Sep 2020 07:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2DD89F8E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 11:39:30 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 8BB2694415709ABAFF86;
 Tue, 22 Sep 2020 19:39:28 +0800 (CST)
Received: from huawei.com (10.175.104.57) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Tue, 22 Sep 2020
 19:39:25 +0800
From: Li Heng <liheng40@huawei.com>
To: <eric@anholt.net>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH -next] drm/v3d: Remove set but not used variable
Date: Tue, 22 Sep 2020 19:39:24 +0800
Message-ID: <1600774764-50332-1-git-send-email-liheng40@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.175.104.57]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 23 Sep 2020 07:53:19 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRyZXNzZXMgdGhlIGZvbGxvd2luZyBnY2Mgd2FybmluZyB3aXRoICJtYWtlIFc9MSI6
Cgpkcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9kcnYuYzo3MzozMjogd2FybmluZzoK4oCYdjNkX3Yz
ZF9wbV9vcHPigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxl
PV0KClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KU2lnbmVkLW9m
Zi1ieTogTGkgSGVuZyA8bGloZW5nNDBAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
djNkL3YzZF9kcnYuYyB8IDQgLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZHJ2LmMgYi9kcml2ZXJzL2dwdS9k
cm0vdjNkL3YzZF9kcnYuYwppbmRleCA5ZjdjMjYxLi4wNTE0MGRiIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdjNkL3YzZF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9k
cnYuYwpAQCAtNzAsMTAgKzcwLDYgQEAgc3RhdGljIGludCB2M2RfcnVudGltZV9yZXN1bWUoc3Ry
dWN0IGRldmljZSAqZGV2KQogfQogI2VuZGlmCgotc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1f
b3BzIHYzZF92M2RfcG1fb3BzID0gewotCVNFVF9SVU5USU1FX1BNX09QUyh2M2RfcnVudGltZV9z
dXNwZW5kLCB2M2RfcnVudGltZV9yZXN1bWUsIE5VTEwpCi19OwotCiBzdGF0aWMgaW50IHYzZF9n
ZXRfcGFyYW1faW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAkJCSAg
ICAgICBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdikKIHsKLS0KMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
