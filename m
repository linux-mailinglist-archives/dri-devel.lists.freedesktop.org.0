Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B15AFD796
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 09:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37836E0D6;
	Fri, 15 Nov 2019 08:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDBCA6E22C;
 Thu, 14 Nov 2019 12:29:17 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A4F6593F2003AFA9F635;
 Thu, 14 Nov 2019 20:29:14 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Thu, 14 Nov 2019
 20:29:03 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/amd/display: remove set but not used variable
 'old_plane_crtc'
Date: Thu, 14 Nov 2019 20:36:24 +0800
Message-ID: <1573734987-119703-2-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573734987-119703-1-git-send-email-zhengbin13@huawei.com>
References: <1573734987-119703-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 15 Nov 2019 08:05:26 +0000
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
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYzogSW4gZnVuY3Rpb24gZG1f
ZGV0ZXJtaW5lX3VwZGF0ZV90eXBlX2Zvcl9jb21taXQ6CmRyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmM6NjUxNjozNjogd2FybmluZzogdmFyaWFibGUgb2xk
X3BsYW5lX2NydGMgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0K
Ckl0IGlzIGludHJvZHVjZWQgYnkgY29tbWl0IGE4N2ZhOTkzODc0OSAoImRybS9hbWQvZGlzcGxh
eToKQnVpbGQgc3RyZWFtIHVwZGF0ZSBhbmQgcGxhbmUgdXBkYXRlcyBpbiBkbSIpLCBidXQgbmV2
ZXIgdXNlZCwKc28gcmVtb3ZlIGl0LgoKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBo
dWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiB6aGVuZ2JpbiA8emhlbmdiaW4xM0BodWF3ZWkuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMg
fCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
CmluZGV4IGMyNzAwYmMuLjcwMGNiZDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAtNzYxMSw3ICs3NjExLDcgQEAgZG1fZGV0
ZXJtaW5lX3VwZGF0ZV90eXBlX2Zvcl9jb21taXQoc3RydWN0IGFtZGdwdV9kaXNwbGF5X21hbmFn
ZXIgKmRtLAogCWludCBpLCBqLCBudW1fcGxhbmUsIHJldCA9IDA7CiAJc3RydWN0IGRybV9wbGFu
ZV9zdGF0ZSAqb2xkX3BsYW5lX3N0YXRlLCAqbmV3X3BsYW5lX3N0YXRlOwogCXN0cnVjdCBkbV9w
bGFuZV9zdGF0ZSAqbmV3X2RtX3BsYW5lX3N0YXRlLCAqb2xkX2RtX3BsYW5lX3N0YXRlOwotCXN0
cnVjdCBkcm1fY3J0YyAqbmV3X3BsYW5lX2NydGMsICpvbGRfcGxhbmVfY3J0YzsKKwlzdHJ1Y3Qg
ZHJtX2NydGMgKm5ld19wbGFuZV9jcnRjOwogCXN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lOwoKIAlz
dHJ1Y3QgZHJtX2NydGMgKmNydGM7CkBAIC03NjU3LDcgKzc2NTcsNiBAQCBkbV9kZXRlcm1pbmVf
dXBkYXRlX3R5cGVfZm9yX2NvbW1pdChzdHJ1Y3QgYW1kZ3B1X2Rpc3BsYXlfbWFuYWdlciAqZG0s
CiAJCQl1aW50NjRfdCB0aWxpbmdfZmxhZ3M7CgogCQkJbmV3X3BsYW5lX2NydGMgPSBuZXdfcGxh
bmVfc3RhdGUtPmNydGM7Ci0JCQlvbGRfcGxhbmVfY3J0YyA9IG9sZF9wbGFuZV9zdGF0ZS0+Y3J0
YzsKIAkJCW5ld19kbV9wbGFuZV9zdGF0ZSA9IHRvX2RtX3BsYW5lX3N0YXRlKG5ld19wbGFuZV9z
dGF0ZSk7CiAJCQlvbGRfZG1fcGxhbmVfc3RhdGUgPSB0b19kbV9wbGFuZV9zdGF0ZShvbGRfcGxh
bmVfc3RhdGUpOwoKLS0KMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
