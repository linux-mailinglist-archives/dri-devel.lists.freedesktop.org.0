Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D16B7EE8CA
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 20:35:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909196E84F;
	Mon,  4 Nov 2019 19:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A516E428;
 Mon,  4 Nov 2019 13:20:13 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 85936DDBF7F52DD8DC5E;
 Mon,  4 Nov 2019 21:20:09 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Mon, 4 Nov 2019
 21:20:03 +0800
From: yu kuai <yukuai3@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Jammy.Zhou@amd.com>, <tianci.yin@amd.com>, <sam@ravnborg.org>,
 <luben.tuikov@amd.com>
Subject: [PATCH 2/7] drm/amdgpu: add function parameter description in
 'amdgpu_device_set_cg_state'
Date: Mon, 4 Nov 2019 21:27:21 +0800
Message-ID: <1572874046-30996-3-git-send-email-yukuai3@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572874046-30996-1-git-send-email-yukuai3@huawei.com>
References: <1572874046-30996-1-git-send-email-yukuai3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 04 Nov 2019 19:35:10 +0000
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

Rml4ZXMgZ2NjIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2
aWNlLmM6MTk1NDogd2FybmluZzogRnVuY3Rpb24KcGFyYW1ldGVyIG9yIG1lbWJlciAnc3RhdGUn
IG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdwdV9kZXZpY2Vfc2V0X2NnX3N0YXRlJwoKRml4ZXM6IGUz
ZWNkZmZhYzljYyAoImRybS9hbWRncHU6IGFkZCBkb2N1bWVudGF0aW9uIGZvciBhbWRncHVfZGV2
aWNlLmMiKQpTaWduZWQtb2ZmLWJ5OiB5dSBrdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGV2aWNlLmMKaW5kZXggYjRmYjZkOC4uMjZjNDNlNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpAQCAtMTk0MSw2ICsxOTQxLDcgQEAgc3RhdGljIGJv
b2wgYW1kZ3B1X2RldmljZV9jaGVja192cmFtX2xvc3Qoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCiAgKiBhbWRncHVfZGV2aWNlX3NldF9jZ19zdGF0ZSAtIHNldCBjbG9ja2dhdGluZyBmb3Ig
YW1kZ3B1IGRldmljZQogICoKICAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKKyAqIEBz
dGF0ZTogY2xvY2tnYXRpbmcgc3RhdGUgKGdhdGUgb3IgdW5nYXRlKQogICoKICAqIFRoZSBsaXN0
IG9mIGFsbCB0aGUgaGFyZHdhcmUgSVBzIHRoYXQgbWFrZSB1cCB0aGUgYXNpYyBpcyB3YWxrZWQg
YW5kIHRoZQogICogc2V0X2Nsb2NrZ2F0aW5nX3N0YXRlIGNhbGxiYWNrcyBhcmUgcnVuLgotLSAK
Mi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
