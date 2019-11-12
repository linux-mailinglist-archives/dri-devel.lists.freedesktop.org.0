Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D8BFAB66
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 08:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5BD6E456;
	Wed, 13 Nov 2019 07:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F176E0C6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 12:51:22 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 42DE32382CC2C805B117;
 Tue, 12 Nov 2019 20:51:19 +0800 (CST)
Received: from localhost.localdomain (10.90.53.225) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Tue, 12 Nov 2019 20:51:09 +0800
From: Chen Wandun <chenwandun@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: remove variable 'result' set but not used
 warning
Date: Tue, 12 Nov 2019 20:58:14 +0800
Message-ID: <1573563494-129617-1-git-send-email-chenwandun@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 13 Nov 2019 07:55:45 +0000
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
Cc: chenwandun@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvLi4vcG93ZXJwbGF5L3NtdW1nci9maWppX3NtdW1nci5jOiBJbiBm
dW5jdGlvbiBmaWppX3BvcHVsYXRlX3NtY19ib290X2xldmVsOgpkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS8uLi9wb3dlcnBsYXkvc211bWdyL2Zpamlfc211bWdyLmM6MTYwNTo2OiB3YXJuaW5n
OiB2YXJpYWJsZSByZXN1bHQgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJp
YWJsZV0KClNpZ25lZC1vZmYtYnk6IENoZW4gV2FuZHVuIDxjaGVud2FuZHVuQGh1YXdlaS5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL2Zpamlfc211bWdyLmMg
fCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdW1nci9maWpp
X3NtdW1nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL2Zpamlfc211
bWdyLmMKaW5kZXggMzJlYmIzOC4uNmRmNWFmMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvc211bWdyL2Zpamlfc211bWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvc211bWdyL2Zpamlfc211bWdyLmMKQEAgLTE2MDIsMTggKzE2MDIsMTcg
QEAgc3RhdGljIGludCBmaWppX3BvcHVsYXRlX3NtY191dmRfbGV2ZWwoc3RydWN0IHBwX2h3bWdy
ICpod21nciwKIHN0YXRpYyBpbnQgZmlqaV9wb3B1bGF0ZV9zbWNfYm9vdF9sZXZlbChzdHJ1Y3Qg
cHBfaHdtZ3IgKmh3bWdyLAogCQlzdHJ1Y3QgU01VNzNfRGlzY3JldGVfRHBtVGFibGUgKnRhYmxl
KQogewotCWludCByZXN1bHQgPSAwOwogCXN0cnVjdCBzbXU3X2h3bWdyICpkYXRhID0gKHN0cnVj
dCBzbXU3X2h3bWdyICopKGh3bWdyLT5iYWNrZW5kKTsKIAogCXRhYmxlLT5HcmFwaGljc0Jvb3RM
ZXZlbCA9IDA7CiAJdGFibGUtPk1lbW9yeUJvb3RMZXZlbCA9IDA7CiAKIAkvKiBmaW5kIGJvb3Qg
bGV2ZWwgZnJvbSBkcG0gdGFibGUgKi8KLQlyZXN1bHQgPSBwaG1fZmluZF9ib290X2xldmVsKCYo
ZGF0YS0+ZHBtX3RhYmxlLnNjbGtfdGFibGUpLAorCXBobV9maW5kX2Jvb3RfbGV2ZWwoJihkYXRh
LT5kcG1fdGFibGUuc2Nsa190YWJsZSksCiAJCQlkYXRhLT52Ymlvc19ib290X3N0YXRlLnNjbGtf
Ym9vdHVwX3ZhbHVlLAogCQkJKHVpbnQzMl90ICopJih0YWJsZS0+R3JhcGhpY3NCb290TGV2ZWwp
KTsKIAotCXJlc3VsdCA9IHBobV9maW5kX2Jvb3RfbGV2ZWwoJihkYXRhLT5kcG1fdGFibGUubWNs
a190YWJsZSksCisJcGhtX2ZpbmRfYm9vdF9sZXZlbCgmKGRhdGEtPmRwbV90YWJsZS5tY2xrX3Rh
YmxlKSwKIAkJCWRhdGEtPnZiaW9zX2Jvb3Rfc3RhdGUubWNsa19ib290dXBfdmFsdWUsCiAJCQko
dWludDMyX3QgKikmKHRhYmxlLT5NZW1vcnlCb290TGV2ZWwpKTsKIAotLSAKMi43LjQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
