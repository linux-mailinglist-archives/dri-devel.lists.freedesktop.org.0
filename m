Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5BD78619
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 09:18:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9ED89CB3;
	Mon, 29 Jul 2019 07:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829976ED7C;
 Fri, 26 Jul 2019 14:01:22 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4C8AA138C88EDF28DD48;
 Fri, 26 Jul 2019 22:01:13 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Fri, 26 Jul 2019
 22:01:03 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <oded.gabbay@gmail.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <David1.Zhou@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
Subject: [PATCH] drm/amdkfd: remove set but not used variable 'pdd'
Date: Fri, 26 Jul 2019 22:00:54 +0800
Message-ID: <20190726140054.31388-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:16:44 +0000
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
Cc: dri-devel@lists.freedesktop.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvLi4vYW1ka2ZkL2tmZF9wcm9jZXNzLmM6IEluIGZ1bmN0aW9uIHJl
c3RvcmVfcHJvY2Vzc193b3JrZXI6CmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2FtZGtm
ZC9rZmRfcHJvY2Vzcy5jOjk0OToyOTogd2FybmluZzoKIHZhcmlhYmxlIHBkZCBzZXQgYnV0IG5v
dCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKSXQgaXMgbm90IHVzZWQgc2luY2UK
Y29tbWl0IDViODcyNDVmYWY1NyAoImRybS9hbWRrZmQ6IFNpbXBsaWZ5IGtmZDJrZ2QgaW50ZXJm
YWNlIikKClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KU2lnbmVk
LW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzLmMgfCAxMSAtLS0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1ka2ZkL2tmZF9wcm9jZXNzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
cHJvY2Vzcy5jCmluZGV4IDhmMTA3NmMuLjI0MGJmNjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX3Byb2Nlc3MuYwpAQCAtMTA0Miw3ICsxMDQyLDYgQEAgc3RhdGljIHZvaWQgcmVz
dG9yZV9wcm9jZXNzX3dvcmtlcihzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCiB7CiAJc3RydWN0
IGRlbGF5ZWRfd29yayAqZHdvcms7CiAJc3RydWN0IGtmZF9wcm9jZXNzICpwOwotCXN0cnVjdCBr
ZmRfcHJvY2Vzc19kZXZpY2UgKnBkZDsKIAlpbnQgcmV0ID0gMDsKIAogCWR3b3JrID0gdG9fZGVs
YXllZF93b3JrKHdvcmspOwpAQCAtMTA1MSwxNiArMTA1MCw2IEBAIHN0YXRpYyB2b2lkIHJlc3Rv
cmVfcHJvY2Vzc193b3JrZXIoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQogCSAqIGxpZmV0aW1l
IG9mIHRoaXMgdGhyZWFkLCBrZmRfcHJvY2VzcyBwIHdpbGwgYmUgdmFsaWQKIAkgKi8KIAlwID0g
Y29udGFpbmVyX29mKGR3b3JrLCBzdHJ1Y3Qga2ZkX3Byb2Nlc3MsIHJlc3RvcmVfd29yayk7Ci0K
LQkvKiBDYWxsIHJlc3RvcmVfcHJvY2Vzc19ib3Mgb24gdGhlIGZpcnN0IEtHRCBkZXZpY2UuIFRo
aXMgZnVuY3Rpb24KLQkgKiB0YWtlcyBjYXJlIG9mIHJlc3RvcmluZyB0aGUgd2hvbGUgcHJvY2Vz
cyBpbmNsdWRpbmcgb3RoZXIgZGV2aWNlcy4KLQkgKiBSZXN0b3JlIGNhbiBmYWlsIGlmIGVub3Vn
aCBtZW1vcnkgaXMgbm90IGF2YWlsYWJsZS4gSWYgc28sCi0JICogcmVzY2hlZHVsZSBhZ2Fpbi4K
LQkgKi8KLQlwZGQgPSBsaXN0X2ZpcnN0X2VudHJ5KCZwLT5wZXJfZGV2aWNlX2RhdGEsCi0JCQkg
ICAgICAgc3RydWN0IGtmZF9wcm9jZXNzX2RldmljZSwKLQkJCSAgICAgICBwZXJfZGV2aWNlX2xp
c3QpOwotCiAJcHJfZGVidWcoIlN0YXJ0ZWQgcmVzdG9yaW5nIHBhc2lkICVkXG4iLCBwLT5wYXNp
ZCk7CiAKIAkvKiBTZXR0aW5nIGxhc3RfcmVzdG9yZV90aW1lc3RhbXAgYmVmb3JlIHN1Y2Nlc3Nm
dWwgcmVzdG9yYXRpb24uCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
