Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C73621BF18F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 09:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C876EB74;
	Thu, 30 Apr 2020 07:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA226E445;
 Thu, 30 Apr 2020 02:19:58 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 981A8DF9313ABED9D2D9;
 Thu, 30 Apr 2020 10:19:54 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Thu, 30 Apr 2020
 10:19:44 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amdgpu: remove set but not used variable 'priority'
Date: Thu, 30 Apr 2020 10:26:51 +0800
Message-ID: <20200430022653.46365-2-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
In-Reply-To: <20200430022653.46365-1-zhengbin13@huawei.com>
References: <20200430022653.46365-1-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 30 Apr 2020 07:31:56 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmM6MTIxMToyNjogd2FybmluZzogdmFyaWFibGUg
4oCYcHJpb3JpdHnigJkgc2V0IGJ1dCBub3QgdXNlZAoKSXQgaXMgbm90IHVzZWQgc2luY2UgY29t
bWl0IDMzYWJjYjFmNWExNyAoImRybS9hbWRncHU6CnNldCBjb21wdXRlIHF1ZXVlIHByaW9yaXR5
IGF0IG1xZF9pbml0IikKClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNv
bT4KU2lnbmVkLW9mZi1ieTogWmhlbmcgQmluIDx6aGVuZ2JpbjEzQGh1YXdlaS5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgfCAyIC0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfY3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5j
CmluZGV4IDc2NTNmNjJiMWIyZC4uMTkwNzAyMjZhOTQ1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfY3MuYwpAQCAtMTIwOCw3ICsxMjA4LDYgQEAgc3RhdGljIGludCBhbWRncHVf
Y3Nfc3VibWl0KHN0cnVjdCBhbWRncHVfY3NfcGFyc2VyICpwLAogewogCXN0cnVjdCBhbWRncHVf
ZnByaXYgKmZwcml2ID0gcC0+ZmlscC0+ZHJpdmVyX3ByaXY7CiAJc3RydWN0IGRybV9zY2hlZF9l
bnRpdHkgKmVudGl0eSA9IHAtPmVudGl0eTsKLQllbnVtIGRybV9zY2hlZF9wcmlvcml0eSBwcmlv
cml0eTsKIAlzdHJ1Y3QgYW1kZ3B1X2JvX2xpc3RfZW50cnkgKmU7CiAJc3RydWN0IGFtZGdwdV9q
b2IgKmpvYjsKIAl1aW50NjRfdCBzZXE7CkBAIC0xMjU4LDcgKzEyNTcsNiBAQCBzdGF0aWMgaW50
IGFtZGdwdV9jc19zdWJtaXQoc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnAsCgogCXRyYWNlX2Ft
ZGdwdV9jc19pb2N0bChqb2IpOwogCWFtZGdwdV92bV9ib190cmFjZV9jcygmZnByaXYtPnZtLCAm
cC0+dGlja2V0KTsKLQlwcmlvcml0eSA9IGpvYi0+YmFzZS5zX3ByaW9yaXR5OwogCWRybV9zY2hl
ZF9lbnRpdHlfcHVzaF9qb2IoJmpvYi0+YmFzZSwgZW50aXR5KTsKCiAJYW1kZ3B1X3ZtX21vdmVf
dG9fbHJ1X3RhaWwocC0+YWRldiwgJmZwcml2LT52bSk7Ci0tCjIuMjYuMC4xMDYuZzlmYWRlZGQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
