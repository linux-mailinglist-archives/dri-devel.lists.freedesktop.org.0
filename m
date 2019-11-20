Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C46C3104D0C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 09:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50CEC6EB7F;
	Thu, 21 Nov 2019 08:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475136E443;
 Wed, 20 Nov 2019 12:54:24 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 8F512BC4B6B6A5AB39FE;
 Wed, 20 Nov 2019 20:54:19 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Wed, 20 Nov 2019
 20:54:11 +0800
From: yu kuai <yukuai3@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Jammy.Zhou@amd.com>, <tianci.yin@amd.com>, <sam@ravnborg.org>,
 <luben.tuikov@amd.com>
Subject: [PATCH 1/2] drm/amd/display: remove set but not used variable
 'dc_fixpt_e' and 'dc_fixpt_pi'
Date: Wed, 20 Nov 2019 21:15:32 +0800
Message-ID: <20191120131533.12720-2-yukuai3@huawei.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20191120131533.12720-1-yukuai3@huawei.com>
References: <20191120131533.12720-1-yukuai3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 21 Nov 2019 07:59:20 +0000
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
Cc: yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhengbin13@huawei.com,
 amd-gfx@lists.freedesktop.org, yukuai3@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

J2RjX2ZpeHB0X2UnIGFuZCAnZGNfZml4cHRfcGknIGFyZSBzZXQgaW4gJ2ZpeGVkMzFfMzIuaCcu
IEhvd2V2ZXIsIHRoZXkKYXJlIG5ldmVyIHVzZWQgYW5kIHNvIGNhbiBiZSByZW1vdmVkLgoKRml4
ZXM6IGViMGU1MTU0NjRlNCAoImRybS9hbWQvZGlzcGxheTogZ2V0IHJpZCBvZiAzMi4zMiB1bnNp
Z25lZCBmaXhlZCBwb2ludCIpClNpZ25lZC1vZmYtYnk6IHl1IGt1YWkgPHl1a3VhaTNAaHVhd2Vp
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9maXhlZDMxXzMy
LmggfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9maXhlZDMxXzMyLmggYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9maXhlZDMxXzMyLmgKaW5kZXggODllZjlmNjg2
MGU1Li4yOTEyMTUzNjJlM2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9pbmNsdWRlL2ZpeGVkMzFfMzIuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
aW5jbHVkZS9maXhlZDMxXzMyLmgKQEAgLTY5LDkgKzY5LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBmaXhlZDMxXzMyIGRjX2ZpeHB0X2Vwc2lsb24gPSB7IDFMTCB9Owogc3RhdGljIGNvbnN0IHN0
cnVjdCBmaXhlZDMxXzMyIGRjX2ZpeHB0X2hhbGYgPSB7IDB4ODAwMDAwMDBMTCB9Owogc3RhdGlj
IGNvbnN0IHN0cnVjdCBmaXhlZDMxXzMyIGRjX2ZpeHB0X29uZSA9IHsgMHgxMDAwMDAwMDBMTCB9
OwogCi1zdGF0aWMgY29uc3Qgc3RydWN0IGZpeGVkMzFfMzIgZGNfZml4cHRfcGkgPSB7IDEzNDkz
MDM3NzA1TEwgfTsKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZml4ZWQzMV8zMiBkY19maXhwdF90d29f
cGkgPSB7IDI2OTg2MDc1NDA5TEwgfTsKLXN0YXRpYyBjb25zdCBzdHJ1Y3QgZml4ZWQzMV8zMiBk
Y19maXhwdF9lID0geyAxMTY3NDkzMTU1NUxMIH07CiBzdGF0aWMgY29uc3Qgc3RydWN0IGZpeGVk
MzFfMzIgZGNfZml4cHRfbG4yID0geyAyOTc3MDQ0NDcxTEwgfTsKIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgZml4ZWQzMV8zMiBkY19maXhwdF9sbjJfZGl2XzIgPSB7IDE0ODg1MjIyMzZMTCB9OwogCi0t
IAoyLjE3LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
