Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7630810687E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 10:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8209B6F4F2;
	Fri, 22 Nov 2019 09:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7966F4D4;
 Fri, 22 Nov 2019 03:35:41 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3CF438082EE43D7D736E;
 Fri, 22 Nov 2019 11:35:38 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Fri, 22 Nov 2019
 11:35:30 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <rex.zhu@amd.com>, <evan.quan@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: Use ARRAY_SIZE for sos_old_versions
Date: Fri, 22 Nov 2019 11:42:52 +0800
Message-ID: <1574394172-18216-3-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574394172-18216-1-git-send-email-zhengbin13@huawei.com>
References: <1574394172-18216-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 22 Nov 2019 09:00:44 +0000
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

Rml4ZXMgY29jY2ljaGVjayB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNw
X3YzXzEuYzoxODI6NDAtNDE6IFdBUk5JTkc6IFVzZSBBUlJBWV9TSVpFCgpSZXBvcnRlZC1ieTog
SHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IHpoZW5nYmluIDx6
aGVuZ2JpbjEzQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNw
X3YzXzEuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92M18xLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjNfMS5jCmluZGV4IGI0ZDY0MjcuLjcz
NWM0M2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92M18xLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YzXzEuYwpAQCAtMTc5LDcgKzE3
OSw3IEBAIHN0YXRpYyBib29sIHBzcF92M18xX21hdGNoX3ZlcnNpb24oc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsIHVpbnQzMl90IHZlcikKIAkgKiBEb3VibGUgY2hlY2sgaWYgdGhlIGxhdGVz
dCBmb3VyIGxlZ2FjeSB2ZXJzaW9ucy4KIAkgKiBJZiB5ZXMsIGl0IGlzIHN0aWxsIHRoZSByaWdo
dCB2ZXJzaW9uLgogCSAqLwotCWZvciAoaSA9IDA7IGkgPCBzaXplb2Yoc29zX29sZF92ZXJzaW9u
cykgLyBzaXplb2YodWludDMyX3QpOyBpKyspIHsKKwlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0la
RShzb3Nfb2xkX3ZlcnNpb25zKTsgaSsrKSB7CiAJCWlmIChzb3Nfb2xkX3ZlcnNpb25zW2ldID09
IGFkZXYtPnBzcC5zb3NfZndfdmVyc2lvbikKIAkJCXJldHVybiB0cnVlOwogCX0KLS0KMi43LjQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
