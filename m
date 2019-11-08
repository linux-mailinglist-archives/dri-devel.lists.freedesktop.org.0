Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E67F2F4BA4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 13:33:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3CB16E09A;
	Fri,  8 Nov 2019 12:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4525D6E09A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 12:33:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B0C89B28F;
 Fri,  8 Nov 2019 12:33:36 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch,
 b.zolnierkie@samsung.com, noralf@tronnes.org, kraxel@redhat.com,
 sam@ravnborg.org, emil.velikov@collabora.com
Subject: [PATCH 2/4] drm/udl: Remove udl implementation of GEM's free_object()
Date: Fri,  8 Nov 2019 13:33:31 +0100
Message-Id: <20191108123333.25274-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108123333.25274-1-tzimmermann@suse.de>
References: <20191108123333.25274-1-tzimmermann@suse.de>
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

VWRsIHVzZWQgdG8gaGF2ZSBhIGN1c3RvbSBpbXBsZW1lbnRhdGlvbiBmb3IgZnJlZV9vYmplY3Qo
KSBvZgpzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MuIEl0IHVubWFwcGVkIHRoZSBtZW1vcnkg
YnVmZmVyIG9mCnRoZSBmYmRldiBlbXVsYXRpb24uIFdpdGggdGhlIHN3aXRjaCB0byBnZW5lcmlj
IGZiZGV2IGVtdWxhdGlvbiwKdGhpcyBpcyBub3cgaGFuZGxlZCBieSB0aGUgZmJkZXYgY29kZSBp
bnRlcm5hbGx5LgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZ2VtLmMgfCAxOCArLS0tLS0t
LS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTcgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZ2VtLmMgYi9kcml2ZXJz
L2dwdS9kcm0vdWRsL3VkbF9nZW0uYwppbmRleCA2ZWFkZTZiNGIwZGMuLmI2ZTI2Zjk4YWEwYSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZ2VtLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3VkbC91ZGxfZ2VtLmMKQEAgLTE3LDIyICsxNyw2IEBACiAgKiBHRU0gb2JqZWN0IGZ1
bmNzCiAgKi8KIAotc3RhdGljIHZvaWQgdWRsX2dlbV9vYmplY3RfZnJlZV9vYmplY3Qoc3RydWN0
IGRybV9nZW1fb2JqZWN0ICpvYmopCi17Ci0Jc3RydWN0IGRybV9nZW1fc2htZW1fb2JqZWN0ICpz
aG1lbSA9IHRvX2RybV9nZW1fc2htZW1fb2JqKG9iaik7Ci0KLQkvKiBGYmRldiBlbXVsYXRpb24g
dm1hcHMgdGhlIGJ1ZmZlci4gVW5tYXAgaXQgaGVyZSBmb3IgY29uc2lzdGVuY3kKLQkgKiB3aXRo
IHRoZSBvcmlnaW5hbCB1ZGwgR0VNIGNvZGUuCi0JICoKLQkgKiBUT0RPOiBTd2l0Y2ggdG8gZ2Vu
ZXJpYyBmYmRldiBlbXVsYXRpb24gYW5kIHJlbGVhc2UgdGhlCi0JICogICAgICAgR0VNIG9iamVj
dCB3aXRoIGRybV9nZW1fc2htZW1fZnJlZV9vYmplY3QoKS4KLQkgKi8KLQlpZiAoc2htZW0tPnZh
ZGRyKQotCQlkcm1fZ2VtX3NobWVtX3Z1bm1hcChvYmosIHNobWVtLT52YWRkcik7Ci0KLQlkcm1f
Z2VtX3NobWVtX2ZyZWVfb2JqZWN0KG9iaik7Ci19Ci0KIHN0YXRpYyBpbnQgdWRsX2dlbV9vYmpl
Y3RfbW1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwKIAkJCSAgICAgICBzdHJ1Y3Qgdm1f
YXJlYV9zdHJ1Y3QgKnZtYSkKIHsKQEAgLTkxLDcgKzc1LDcgQEAgc3RhdGljIHZvaWQgKnVkbF9n
ZW1fb2JqZWN0X3ZtYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCiB9CiAKIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MgdWRsX2dlbV9vYmplY3RfZnVuY3MgPSB7
Ci0JLmZyZWUgPSB1ZGxfZ2VtX29iamVjdF9mcmVlX29iamVjdCwKKwkuZnJlZSA9IGRybV9nZW1f
c2htZW1fZnJlZV9vYmplY3QsCiAJLnByaW50X2luZm8gPSBkcm1fZ2VtX3NobWVtX3ByaW50X2lu
Zm8sCiAJLnBpbiA9IGRybV9nZW1fc2htZW1fcGluLAogCS51bnBpbiA9IGRybV9nZW1fc2htZW1f
dW5waW4sCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
