Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 163D2FF910
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:45:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058966E30D;
	Sun, 17 Nov 2019 11:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3E16E323
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 14:19:53 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 48B2128A7E5B34BA403A;
 Fri, 15 Nov 2019 22:19:51 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Fri, 15 Nov 2019
 22:19:45 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <patrik.r.jakobsson@gmail.com>, <daniel.vetter@ffwll.ch>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/gma500: remove set but not used variable 'is_hdmi',
 'is_crt'
Date: Fri, 15 Nov 2019 22:27:07 +0800
Message-ID: <1573828027-122323-4-git-send-email-zhengbin13@huawei.com>
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
cHUvZHJtL2dtYTUwMC9jZHZfaW50ZWxfZGlzcGxheS5jOiBJbiBmdW5jdGlvbiBjZHZfaW50ZWxf
Y3J0Y19tb2RlX3NldDoKZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9jZHZfaW50ZWxfZGlzcGxheS5j
OjU5NDo3OiB3YXJuaW5nOiB2YXJpYWJsZSBpc19oZG1pIHNldCBidXQgbm90IHVzZWQgWy1XdW51
c2VkLWJ1dC1zZXQtdmFyaWFibGVdCmRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvY2R2X2ludGVsX2Rp
c3BsYXkuYzogSW4gZnVuY3Rpb24gY2R2X2ludGVsX2NydGNfbW9kZV9zZXQ6CmRyaXZlcnMvZ3B1
L2RybS9nbWE1MDAvY2R2X2ludGVsX2Rpc3BsYXkuYzo1OTM6Nzogd2FybmluZzogdmFyaWFibGUg
aXNfY3J0IHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpUaGV5
IGFyZSBub3QgdXNlZCBzaW5jZSBjb21taXQgYWNkN2VmOTI3ZTA2ICgiZ21hNTAwOgpVcGRhdGUg
dGhlIENlZGFydmlldyBjbG9jayBoYW5kbGluZyIpCgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8
aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IHpoZW5nYmluIDx6aGVuZ2JpbjEzQGh1
YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9jZHZfaW50ZWxfZGlzcGxheS5j
IHwgNyArKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvY2R2X2ludGVsX2Rpc3Bs
YXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvY2R2X2ludGVsX2Rpc3BsYXkuYwppbmRleCA4
Yjc4NDk0Li4zMzRhMjAzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2Nkdl9p
bnRlbF9kaXNwbGF5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9jZHZfaW50ZWxfZGlz
cGxheS5jCkBAIC01ODIsOCArNTgyLDggQEAgc3RhdGljIGludCBjZHZfaW50ZWxfY3J0Y19tb2Rl
X3NldChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJc3RydWN0IGdtYV9jbG9ja190IGNsb2NrOwog
CXUzMiBkcGxsID0gMCwgZHNwY250ciwgcGlwZWNvbmY7CiAJYm9vbCBvazsKLQlib29sIGlzX2Ny
dCA9IGZhbHNlLCBpc19sdmRzID0gZmFsc2UsIGlzX3R2ID0gZmFsc2U7Ci0JYm9vbCBpc19oZG1p
ID0gZmFsc2UsIGlzX2RwID0gZmFsc2U7CisJYm9vbCBpc19sdmRzID0gZmFsc2UsIGlzX3R2ID0g
ZmFsc2U7CisJYm9vbCBpc19kcCA9IGZhbHNlOwogCXN0cnVjdCBkcm1fbW9kZV9jb25maWcgKm1v
ZGVfY29uZmlnID0gJmRldi0+bW9kZV9jb25maWc7CiAJc3RydWN0IGRybV9jb25uZWN0b3IgKmNv
bm5lY3RvcjsKIAljb25zdCBzdHJ1Y3QgZ21hX2xpbWl0X3QgKmxpbWl0OwpAQCAtNjA3LDEwICs2
MDcsNyBAQCBzdGF0aWMgaW50IGNkdl9pbnRlbF9jcnRjX21vZGVfc2V0KHN0cnVjdCBkcm1fY3J0
YyAqY3J0YywKIAkJCWlzX3R2ID0gdHJ1ZTsKIAkJCWJyZWFrOwogCQljYXNlIElOVEVMX09VVFBV
VF9BTkFMT0c6Ci0JCQlpc19jcnQgPSB0cnVlOwotCQkJYnJlYWs7CiAJCWNhc2UgSU5URUxfT1VU
UFVUX0hETUk6Ci0JCQlpc19oZG1pID0gdHJ1ZTsKIAkJCWJyZWFrOwogCQljYXNlIElOVEVMX09V
VFBVVF9ESVNQTEFZUE9SVDoKIAkJCWlzX2RwID0gdHJ1ZTsKLS0KMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
