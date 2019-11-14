Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DC2FC692
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 13:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB526E221;
	Thu, 14 Nov 2019 12:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3976E265
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 12:51:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 110F9AD54;
 Thu, 14 Nov 2019 12:51:09 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch,
 b.zolnierkie@samsung.com, noralf@tronnes.org, kraxel@redhat.com,
 sam@ravnborg.org, emil.velikov@collabora.com
Subject: [PATCH v5 3/3] fbdev: Unexport unlink_framebuffer()
Date: Thu, 14 Nov 2019 13:51:06 +0100
Message-Id: <20191114125106.28347-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191114125106.28347-1-tzimmermann@suse.de>
References: <20191114125106.28347-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUgYXJlIG5vIGV4dGVybmFsIGNhbGxlcnMgb2YgdW5saW5rX2ZyYW1lYnVmZmVyKCkgbGVm
dC4gTWFrZSB0aGUKZnVuY3Rpb24gYW4gaW50ZXJuYWwgaW50ZXJmYWNlLgoKU2lnbmVkLW9mZi1i
eTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+ClJldmlld2VkLWJ5OiBO
b3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KLS0tCiBkcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2NvcmUvZmJtZW0uYyB8IDMgKy0tCiBpbmNsdWRlL2xpbnV4L2ZiLmggICAgICAgICAgICAg
ICB8IDEgLQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYyBiL2RyaXZlcnMv
dmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jCmluZGV4IDk1YzMyOTUyZmE4YS4uODZiMDZhNTk5Zjk2
IDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYworKysgYi9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYwpAQCAtMTY3Myw3ICsxNjczLDcgQEAgc3RhdGlj
IHZvaWQgdW5iaW5kX2NvbnNvbGUoc3RydWN0IGZiX2luZm8gKmZiX2luZm8pCiAJY29uc29sZV91
bmxvY2soKTsKIH0KIAotdm9pZCB1bmxpbmtfZnJhbWVidWZmZXIoc3RydWN0IGZiX2luZm8gKmZi
X2luZm8pCitzdGF0aWMgdm9pZCB1bmxpbmtfZnJhbWVidWZmZXIoc3RydWN0IGZiX2luZm8gKmZi
X2luZm8pCiB7CiAJaW50IGk7CiAKQEAgLTE2OTIsNyArMTY5Miw2IEBAIHZvaWQgdW5saW5rX2Zy
YW1lYnVmZmVyKHN0cnVjdCBmYl9pbmZvICpmYl9pbmZvKQogCiAJZmJfaW5mby0+ZGV2ID0gTlVM
TDsKIH0KLUVYUE9SVF9TWU1CT0wodW5saW5rX2ZyYW1lYnVmZmVyKTsKIAogc3RhdGljIHZvaWQg
ZG9fdW5yZWdpc3Rlcl9mcmFtZWJ1ZmZlcihzdHJ1Y3QgZmJfaW5mbyAqZmJfaW5mbykKIHsKZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZmIuaCBiL2luY2x1ZGUvbGludXgvZmIuaAppbmRleCA0
MWUwMDY5ZWNhMGEuLmE2YWQ1Mjg5OTBkZSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9mYi5o
CisrKyBiL2luY2x1ZGUvbGludXgvZmIuaApAQCAtNjA2LDcgKzYwNiw2IEBAIGV4dGVybiBzc2l6
ZV90IGZiX3N5c193cml0ZShzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgY29uc3QgY2hhciBfX3VzZXIg
KmJ1ZiwKIC8qIGRyaXZlcnMvdmlkZW8vZmJtZW0uYyAqLwogZXh0ZXJuIGludCByZWdpc3Rlcl9m
cmFtZWJ1ZmZlcihzdHJ1Y3QgZmJfaW5mbyAqZmJfaW5mbyk7CiBleHRlcm4gdm9pZCB1bnJlZ2lz
dGVyX2ZyYW1lYnVmZmVyKHN0cnVjdCBmYl9pbmZvICpmYl9pbmZvKTsKLWV4dGVybiB2b2lkIHVu
bGlua19mcmFtZWJ1ZmZlcihzdHJ1Y3QgZmJfaW5mbyAqZmJfaW5mbyk7CiBleHRlcm4gaW50IHJl
bW92ZV9jb25mbGljdGluZ19wY2lfZnJhbWVidWZmZXJzKHN0cnVjdCBwY2lfZGV2ICpwZGV2LAog
CQkJCQkgICAgICAgY29uc3QgY2hhciAqbmFtZSk7CiBleHRlcm4gaW50IHJlbW92ZV9jb25mbGlj
dGluZ19mcmFtZWJ1ZmZlcnMoc3RydWN0IGFwZXJ0dXJlc19zdHJ1Y3QgKmEsCi0tIAoyLjIzLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
