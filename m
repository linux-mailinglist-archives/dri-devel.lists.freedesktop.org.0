Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 776C1EE8CB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 20:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0396E850;
	Mon,  4 Nov 2019 19:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E866E431;
 Mon,  4 Nov 2019 13:20:18 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id A4006B8CACFE10F20411;
 Mon,  4 Nov 2019 21:20:14 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Mon, 4 Nov 2019
 21:20:05 +0800
From: yu kuai <yukuai3@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Jammy.Zhou@amd.com>, <tianci.yin@amd.com>, <sam@ravnborg.org>,
 <luben.tuikov@amd.com>
Subject: [PATCH 7/7] drm/amdgpu: remove set but not used variable
 'mc_shared_chmap'
Date: Mon, 4 Nov 2019 21:27:26 +0800
Message-ID: <1572874046-30996-8-git-send-email-yukuai3@huawei.com>
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

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYzogSW4gZnVuY3Rpb24K4oCYZ2Z4X3Y4XzBfZ3B1
X2Vhcmx5X2luaXTigJk6CmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmM6MTcx
Mzo2OiB3YXJuaW5nOiB2YXJpYWJsZQrigJhtY19zaGFyZWRfY2htYXDigJkgc2V0IGJ1dCBub3Qg
dXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCkZpeGVzOiAwYmRlM2E5NWVhYTkgKCJk
cm0vYW1kZ3B1OiBzcGxpdCBnZng4IGdwdSBpbml0IGludG8gc3cgYW5kIGh3IHBhcnRzIikKU2ln
bmVkLW9mZi1ieTogeXUga3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92OF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjhf
MC5jCmluZGV4IGU0YzY0NWQuLjgwYjc5NTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92OF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4
X3Y4XzAuYwpAQCAtMTcxMCw3ICsxNzEwLDcgQEAgc3RhdGljIGludCBnZnhfdjhfMF9kb19lZGNf
Z3ByX3dvcmthcm91bmRzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogc3RhdGljIGludCBn
ZnhfdjhfMF9ncHVfZWFybHlfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKIAl1
MzIgZ2JfYWRkcl9jb25maWc7Ci0JdTMyIG1jX3NoYXJlZF9jaG1hcCwgbWNfYXJiX3JhbWNmZzsK
Kwl1MzIgbWNfYXJiX3JhbWNmZzsKIAl1MzIgZGltbTAwX2FkZHJfbWFwLCBkaW1tMDFfYWRkcl9t
YXAsIGRpbW0xMF9hZGRyX21hcCwgZGltbTExX2FkZHJfbWFwOwogCXUzMiB0bXA7CiAJaW50IHJl
dDsKQEAgLTE4NTAsNyArMTg1MCw2IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y4XzBfZ3B1X2Vhcmx5X2lu
aXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCWJyZWFrOwogCX0KIAotCW1jX3NoYXJl
ZF9jaG1hcCA9IFJSRUczMihtbU1DX1NIQVJFRF9DSE1BUCk7CiAJYWRldi0+Z2Z4LmNvbmZpZy5t
Y19hcmJfcmFtY2ZnID0gUlJFRzMyKG1tTUNfQVJCX1JBTUNGRyk7CiAJbWNfYXJiX3JhbWNmZyA9
IGFkZXYtPmdmeC5jb25maWcubWNfYXJiX3JhbWNmZzsKIAotLSAKMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
