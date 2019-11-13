Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86276FB00F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 12:53:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD2C6ECEE;
	Wed, 13 Nov 2019 11:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1AC6ECEE
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 11:52:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 581A2B2EE;
 Wed, 13 Nov 2019 11:52:39 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch,
 b.zolnierkie@samsung.com, noralf@tronnes.org, kraxel@redhat.com,
 sam@ravnborg.org, emil.velikov@collabora.com
Subject: [PATCH v4 3/3] fbdev: Unexport unlink_framebuffer()
Date: Wed, 13 Nov 2019 12:52:33 +0100
Message-Id: <20191113115233.18483-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191113115233.18483-1-tzimmermann@suse.de>
References: <20191113115233.18483-1-tzimmermann@suse.de>
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
eTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Ci0tLQogZHJpdmVycy92
aWRlby9mYmRldi9jb3JlL2ZibWVtLmMgfCAzICstLQogaW5jbHVkZS9saW51eC9mYi5oICAgICAg
ICAgICAgICAgfCAxIC0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMgYi9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYwppbmRleCA5NWMzMjk1MmZhOGEuLjg2YjA2
YTU5OWY5NiAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMKKysr
IGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMKQEAgLTE2NzMsNyArMTY3Myw3IEBA
IHN0YXRpYyB2b2lkIHVuYmluZF9jb25zb2xlKHN0cnVjdCBmYl9pbmZvICpmYl9pbmZvKQogCWNv
bnNvbGVfdW5sb2NrKCk7CiB9CiAKLXZvaWQgdW5saW5rX2ZyYW1lYnVmZmVyKHN0cnVjdCBmYl9p
bmZvICpmYl9pbmZvKQorc3RhdGljIHZvaWQgdW5saW5rX2ZyYW1lYnVmZmVyKHN0cnVjdCBmYl9p
bmZvICpmYl9pbmZvKQogewogCWludCBpOwogCkBAIC0xNjkyLDcgKzE2OTIsNiBAQCB2b2lkIHVu
bGlua19mcmFtZWJ1ZmZlcihzdHJ1Y3QgZmJfaW5mbyAqZmJfaW5mbykKIAogCWZiX2luZm8tPmRl
diA9IE5VTEw7CiB9Ci1FWFBPUlRfU1lNQk9MKHVubGlua19mcmFtZWJ1ZmZlcik7CiAKIHN0YXRp
YyB2b2lkIGRvX3VucmVnaXN0ZXJfZnJhbWVidWZmZXIoc3RydWN0IGZiX2luZm8gKmZiX2luZm8p
CiB7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2ZiLmggYi9pbmNsdWRlL2xpbnV4L2ZiLmgK
aW5kZXggNDFlMDA2OWVjYTBhLi5hNmFkNTI4OTkwZGUgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGlu
dXgvZmIuaAorKysgYi9pbmNsdWRlL2xpbnV4L2ZiLmgKQEAgLTYwNiw3ICs2MDYsNiBAQCBleHRl
cm4gc3NpemVfdCBmYl9zeXNfd3JpdGUoc3RydWN0IGZiX2luZm8gKmluZm8sIGNvbnN0IGNoYXIg
X191c2VyICpidWYsCiAvKiBkcml2ZXJzL3ZpZGVvL2ZibWVtLmMgKi8KIGV4dGVybiBpbnQgcmVn
aXN0ZXJfZnJhbWVidWZmZXIoc3RydWN0IGZiX2luZm8gKmZiX2luZm8pOwogZXh0ZXJuIHZvaWQg
dW5yZWdpc3Rlcl9mcmFtZWJ1ZmZlcihzdHJ1Y3QgZmJfaW5mbyAqZmJfaW5mbyk7Ci1leHRlcm4g
dm9pZCB1bmxpbmtfZnJhbWVidWZmZXIoc3RydWN0IGZiX2luZm8gKmZiX2luZm8pOwogZXh0ZXJu
IGludCByZW1vdmVfY29uZmxpY3RpbmdfcGNpX2ZyYW1lYnVmZmVycyhzdHJ1Y3QgcGNpX2RldiAq
cGRldiwKIAkJCQkJICAgICAgIGNvbnN0IGNoYXIgKm5hbWUpOwogZXh0ZXJuIGludCByZW1vdmVf
Y29uZmxpY3RpbmdfZnJhbWVidWZmZXJzKHN0cnVjdCBhcGVydHVyZXNfc3RydWN0ICphLAotLSAK
Mi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
