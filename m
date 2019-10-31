Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEF5EBEF3
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 09:10:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0241A6F764;
	Fri,  1 Nov 2019 08:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E666EE8D
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 13:34:12 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 60A4CAD7228A53DCD853;
 Thu, 31 Oct 2019 21:34:09 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Thu, 31 Oct 2019
 21:34:00 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <linux-graphics-maintainer@vmware.com>, <thellstrom@vmware.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/vmwgfx: remove set but not used variable 'srf'
Date: Thu, 31 Oct 2019 21:41:24 +0800
Message-ID: <1572529284-88089-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 01 Nov 2019 08:09:55 +0000
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
cHUvZHJtL3Ztd2dmeC92bXdnZnhfc3VyZmFjZS5jOiBJbiBmdW5jdGlvbiB2bXdfaHdfc3VyZmFj
ZV9kZXN0cm95Ogpkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9zdXJmYWNlLmM6MzM1OjIy
OiB3YXJuaW5nOiB2YXJpYWJsZSBzcmYgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNl
dC12YXJpYWJsZV0KCkl0IGlzIGludHJvZHVjZWQgYnkgY29tbWl0IDU0MzgzMWNmYzk3NiAoImRy
bS92bXdnZng6CkJyZWFrIG91dCBzdXJmYWNlIGFuZCBjb250ZXh0IG1hbmFnZW1lbnQgdG8gc2Vw
YXJhdGUgZmlsZXMiKSwKYnV0IG5ldmVyIHVzZWQsIHNvIHJlbW92ZSBpdC4KClJlcG9ydGVkLWJ5
OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogemhlbmdiaW4g
PHpoZW5nYmluMTNAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9zdXJmYWNlLmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9zdXJmYWNlLmMgYi9kcml2ZXJz
L2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9zdXJmYWNlLmMKaW5kZXggMjlkODc5NC4uZGUwNTMwYiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfc3VyZmFjZS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3N1cmZhY2UuYwpAQCAtMzM2LDcgKzMzNiw2
IEBAIHN0YXRpYyB2b2lkIHZtd19od19zdXJmYWNlX2Rlc3Ryb3koc3RydWN0IHZtd19yZXNvdXJj
ZSAqcmVzKQogewoKIAlzdHJ1Y3Qgdm13X3ByaXZhdGUgKmRldl9wcml2ID0gcmVzLT5kZXZfcHJp
djsKLQlzdHJ1Y3Qgdm13X3N1cmZhY2UgKnNyZjsKIAl2b2lkICpjbWQ7CgogCWlmIChyZXMtPmZ1
bmMtPmRlc3Ryb3kgPT0gdm13X2diX3N1cmZhY2VfZGVzdHJveSkgewpAQCAtMzYwLDcgKzM1OSw2
IEBAIHN0YXRpYyB2b2lkIHZtd19od19zdXJmYWNlX2Rlc3Ryb3koc3RydWN0IHZtd19yZXNvdXJj
ZSAqcmVzKQogCQkgKi8KCiAJCW11dGV4X2xvY2soJmRldl9wcml2LT5jbWRidWZfbXV0ZXgpOwot
CQlzcmYgPSB2bXdfcmVzX3RvX3NyZihyZXMpOwogCQlkZXZfcHJpdi0+dXNlZF9tZW1vcnlfc2l6
ZSAtPSByZXMtPmJhY2t1cF9zaXplOwogCQltdXRleF91bmxvY2soJmRldl9wcml2LT5jbWRidWZf
bXV0ZXgpOwogCX0KLS0KMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
