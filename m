Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5138BC01A8
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 11:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE446EEB9;
	Fri, 27 Sep 2019 09:03:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95B66EEBA
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 09:03:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 14A31AFCC;
 Fri, 27 Sep 2019 09:03:12 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com, sam@ravnborg.org,
 yc_chen@aspeedtech.com
Subject: [PATCH v3 1/5] drm/ast: Don't call ast_show_cursor() from
 ast_cursor_move()
Date: Fri, 27 Sep 2019 11:03:05 +0200
Message-Id: <20190927090309.10254-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190927090309.10254-1-tzimmermann@suse.de>
References: <20190927090309.10254-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2VwYXJhdGluZyB0aGUgY3Vyc29yJ3MgbW92ZSgpIGZ1bmN0aW9uIGZyb20gdGhlIHNob3coKSBm
dW5jdGlvbiBpbgpwcmVwYXJhdGlvbiBvZiBmdXJ0aGVyIHJld29yayBvZiB0aGUgY3Vyc29yIHVw
ZGF0ZSBjb2RlLgoKJ1Nob3dpbmcnIHRoZSBjdXJzb3IgZnJvbSB3aXRoaW4gdGhlIG1vdmUoKSBm
dW5jdGlvbiBpcyByZXF1aXJlZCB0bwp1cGRhdGUgdGhlIGN1cnNvciBwb3NpdGlvbi4KClNpZ25l
ZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYXN0L2FzdF9tb2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMKaW5kZXgg
NmNhYTZlYmZlYWE4Li5hNGNiZjJkNWVlMGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
c3QvYXN0X21vZGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMKQEAgLTEy
MzYsNiArMTIzNiw3IEBAIHN0YXRpYyBpbnQgYXN0X2N1cnNvcl9tb3ZlKHN0cnVjdCBkcm1fY3J0
YyAqY3J0YywKIAlzdHJ1Y3QgYXN0X3ByaXZhdGUgKmFzdCA9IGNydGMtPmRldi0+ZGV2X3ByaXZh
dGU7CiAJaW50IHhfb2Zmc2V0LCB5X29mZnNldDsKIAl1OCAqc2lnOworCXU4IGpyZWc7CiAKIAlz
aWcgPSBkcm1fZ2VtX3ZyYW1fa21hcChkcm1fZ2VtX3ZyYW1fb2ZfZ2VtKGFzdC0+Y3Vyc29yX2Nh
Y2hlKSwKIAkJCQlmYWxzZSwgTlVMTCk7CkBAIC0xMjYyLDcgKzEyNjMsOSBAQCBzdGF0aWMgaW50
IGFzdF9jdXJzb3JfbW92ZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJYXN0X3NldF9pbmRleF9y
ZWcoYXN0LCBBU1RfSU9fQ1JUQ19QT1JULCAweGM3LCAoKHkgPj4gOCkgJiAweDA3KSk7CiAKIAkv
KiBkdW1teSB3cml0ZSB0byBmaXJlIEhXQyAqLwotCWFzdF9zaG93X2N1cnNvcihjcnRjKTsKKwlq
cmVnID0gMHgwMiB8CisJICAgICAgIDB4MDE7IC8qIGVuYWJsZSBBUkdCNDQ0NCBjdXJzb3IgKi8K
Kwlhc3Rfc2V0X2luZGV4X3JlZ19tYXNrKGFzdCwgQVNUX0lPX0NSVENfUE9SVCwgMHhjYiwgMHhm
YywganJlZyk7CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
