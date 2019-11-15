Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DB1FF8FE
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:44:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D600F6E301;
	Sun, 17 Nov 2019 11:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F736E323
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 14:19:54 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 1251D6127A1D929F32F4;
 Fri, 15 Nov 2019 22:19:51 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Fri, 15 Nov 2019
 22:19:44 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <patrik.r.jakobsson@gmail.com>, <daniel.vetter@ffwll.ch>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/gma500: remove set but not used variable 'htotal'
Date: Fri, 15 Nov 2019 22:27:05 +0800
Message-ID: <1573828027-122323-2-git-send-email-zhengbin13@huawei.com>
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
cHUvZHJtL2dtYTUwMC9vYWt0cmFpbF9oZG1pLmM6IEluIGZ1bmN0aW9uIGh0b3RhbF9jYWxjdWxh
dGU6CmRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvb2FrdHJhaWxfaGRtaS5jOjE2MDo2OiB3YXJuaW5n
OiB2YXJpYWJsZSBodG90YWwgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJp
YWJsZV0KCkl0IGlzIGludHJvZHVjZWQgYnkgY29tbWl0IDM5ZWM3NDhmNzE3NCAoImdtYTYwMDog
RW5hYmxlIEhETUkgc3VwcG9ydCIpLApidXQgbmV2ZXIgdXNlZCwgc28gcmVtb3ZlIGl0LgoKUmVw
b3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiB6
aGVuZ2JpbiA8emhlbmdiaW4xM0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9nbWE1
MDAvb2FrdHJhaWxfaGRtaS5jIHwgNCArLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9v
YWt0cmFpbF9oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL29ha3RyYWlsX2hkbWkuYwpp
bmRleCBmNGM1MjA4Li5mNDM3MDIzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAw
L29ha3RyYWlsX2hkbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL29ha3RyYWlsX2hk
bWkuYwpAQCAtMTU5LDkgKzE1OSw3IEBAIHN0YXRpYyB2b2lkIG9ha3RyYWlsX2hkbWlfYXVkaW9f
ZGlzYWJsZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQoKIHN0YXRpYyB1bnNpZ25lZCBpbnQgaHRv
dGFsX2NhbGN1bGF0ZShzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKIHsKLQl1MzIgaHRv
dGFsLCBuZXdfY3J0Y19odG90YWw7Ci0KLQlodG90YWwgPSAobW9kZS0+Y3J0Y19oZGlzcGxheSAt
IDEpIHwgKChtb2RlLT5jcnRjX2h0b3RhbCAtIDEpIDw8IDE2KTsKKwl1MzIgbmV3X2NydGNfaHRv
dGFsOwoKIAkvKgogCSAqIDEwMjQgeCA3NjggIG5ld19jcnRjX2h0b3RhbCA9IDB4MTAyNDsKLS0K
Mi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
