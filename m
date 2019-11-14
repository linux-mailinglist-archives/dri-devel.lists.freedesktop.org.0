Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1425FC694
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 13:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95D56E265;
	Thu, 14 Nov 2019 12:51:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679E66E266
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 12:51:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 10E55AC90;
 Thu, 14 Nov 2019 12:51:09 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch,
 b.zolnierkie@samsung.com, noralf@tronnes.org, kraxel@redhat.com,
 sam@ravnborg.org, emil.velikov@collabora.com
Subject: [PATCH v5 2/3] drm/fb-helper: Remove drm_fb_helper_unlink_fbi()
Date: Thu, 14 Nov 2019 13:51:05 +0100
Message-Id: <20191114125106.28347-3-tzimmermann@suse.de>
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

VGhlcmUgYXJlIG5vIGNhbGxlcnMgb2YgZHJtX2ZiX2hlbHBlcl91bmxpbmtfZmJpKCkgbGVmdC4g
UmVtb3ZlIHRoZQpmdW5jdGlvbi4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPgpSZXZpZXdlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZA
dHJvbm5lcy5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyB8IDE2ICst
LS0tLS0tLS0tLS0tLS0KIGluY2x1ZGUvZHJtL2RybV9mYl9oZWxwZXIuaCAgICAgfCAgNiAtLS0t
LS0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIxIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2ZiX2hlbHBlci5jCmluZGV4IDEwMzhhMmYwNjM5ZS4uZWI5N2YzNGExNWVhIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZmJfaGVscGVyLmMKQEAgLTU2Myw4ICs1NjMsNyBAQCBFWFBPUlRfU1lNQk9MKGRy
bV9mYl9oZWxwZXJfdW5yZWdpc3Rlcl9mYmkpOwogICogZHJtX2ZiX2hlbHBlcl9maW5pIC0gZmlu
aWFsaXplIGEgJnN0cnVjdCBkcm1fZmJfaGVscGVyCiAgKiBAZmJfaGVscGVyOiBkcml2ZXItYWxs
b2NhdGVkIGZiZGV2IGhlbHBlciwgY2FuIGJlIE5VTEwKICAqCi0gKiBUaGlzIGNsZWFucyB1cCBh
bGwgcmVtYWluaW5nIHJlc291cmNlcyBhc3NvY2lhdGVkIHdpdGggQGZiX2hlbHBlci4gTXVzdCBi
ZQotICogY2FsbGVkIGFmdGVyIGRybV9mYl9oZWxwZXJfdW5saW5rX2ZiaSgpIHdhcyBjYWxsZWQu
CisgKiBUaGlzIGNsZWFucyB1cCBhbGwgcmVtYWluaW5nIHJlc291cmNlcyBhc3NvY2lhdGVkIHdp
dGggQGZiX2hlbHBlci4KICAqLwogdm9pZCBkcm1fZmJfaGVscGVyX2Zpbmkoc3RydWN0IGRybV9m
Yl9oZWxwZXIgKmZiX2hlbHBlcikKIHsKQEAgLTYwNCwxOSArNjAzLDYgQEAgdm9pZCBkcm1fZmJf
aGVscGVyX2Zpbmkoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlcikKIH0KIEVYUE9SVF9T
WU1CT0woZHJtX2ZiX2hlbHBlcl9maW5pKTsKIAotLyoqCi0gKiBkcm1fZmJfaGVscGVyX3VubGlu
a19mYmkgLSB3cmFwcGVyIGFyb3VuZCB1bmxpbmtfZnJhbWVidWZmZXIKLSAqIEBmYl9oZWxwZXI6
IGRyaXZlci1hbGxvY2F0ZWQgZmJkZXYgaGVscGVyLCBjYW4gYmUgTlVMTAotICoKLSAqIEEgd3Jh
cHBlciBhcm91bmQgdW5saW5rX2ZyYW1lYnVmZmVyIGltcGxlbWVudGVkIGJ5IGZiZGV2IGNvcmUK
LSAqLwotdm9pZCBkcm1fZmJfaGVscGVyX3VubGlua19mYmkoc3RydWN0IGRybV9mYl9oZWxwZXIg
KmZiX2hlbHBlcikKLXsKLQlpZiAoZmJfaGVscGVyICYmIGZiX2hlbHBlci0+ZmJkZXYpCi0JCXVu
bGlua19mcmFtZWJ1ZmZlcihmYl9oZWxwZXItPmZiZGV2KTsKLX0KLUVYUE9SVF9TWU1CT0woZHJt
X2ZiX2hlbHBlcl91bmxpbmtfZmJpKTsKLQogc3RhdGljIGJvb2wgZHJtX2ZiZGV2X3VzZV9zaGFk
b3dfZmIoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlcikKIHsKIAlzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2ID0gZmJfaGVscGVyLT5kZXY7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1f
ZmJfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZmJfaGVscGVyLmgKaW5kZXggZTNhNzVmZjA3
MzkwLi4xYzJlMGMzY2Y4NTcgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9mYl9oZWxwZXIu
aAorKysgYi9pbmNsdWRlL2RybS9kcm1fZmJfaGVscGVyLmgKQEAgLTIzMSw4ICsyMzEsNiBAQCB2
b2lkIGRybV9mYl9oZWxwZXJfZmlsbF9pbmZvKHN0cnVjdCBmYl9pbmZvICppbmZvLAogCQkJICAg
ICBzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqZmJfaGVscGVyLAogCQkJICAgICBzdHJ1Y3QgZHJtX2Zi
X2hlbHBlcl9zdXJmYWNlX3NpemUgKnNpemVzKTsKIAotdm9pZCBkcm1fZmJfaGVscGVyX3VubGlu
a19mYmkoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlcik7Ci0KIHZvaWQgZHJtX2ZiX2hl
bHBlcl9kZWZlcnJlZF9pbyhzdHJ1Y3QgZmJfaW5mbyAqaW5mbywKIAkJCSAgICAgICBzdHJ1Y3Qg
bGlzdF9oZWFkICpwYWdlbGlzdCk7CiAKQEAgLTM1NiwxMCArMzU0LDYgQEAgc3RhdGljIGlubGlu
ZSBpbnQgZHJtX2ZiX2hlbHBlcl9pb2N0bChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgdW5zaWduZWQg
aW50IGNtZCwKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGlubGluZSB2b2lkIGRybV9mYl9oZWxw
ZXJfdW5saW5rX2ZiaShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqZmJfaGVscGVyKQotewotfQotCiBz
dGF0aWMgaW5saW5lIHZvaWQgZHJtX2ZiX2hlbHBlcl9kZWZlcnJlZF9pbyhzdHJ1Y3QgZmJfaW5m
byAqaW5mbywKIAkJCQkJICAgICBzdHJ1Y3QgbGlzdF9oZWFkICpwYWdlbGlzdCkKIHsKLS0gCjIu
MjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
