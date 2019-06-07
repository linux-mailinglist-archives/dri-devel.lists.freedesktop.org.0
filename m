Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F1D394AC
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 20:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157AA89DA5;
	Fri,  7 Jun 2019 18:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC9789DA5
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 18:52:18 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id a14so2505144edv.12
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 11:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d0VvsM6lUq9c6iYj1zsqk8KDui6sbDx5ayG1ePD2BUc=;
 b=JCyNoLUOoyjmTfkc+sldZYb1PHF4wf1y8Beidp9QENERbJKXNXb6urKawLnOzS9Hd4
 QQBYuRsha7QqJN8c2bk57r3HUt0s6QxbhKqVjBQ/QkqvDarcjXdbDf08vzYFKXBHD2zO
 dO064TAXPrvekfggqXxFBMdgMrG8+LhqHqg8fknUbYIh9Oa7NnVD1r/qD27HgTdrLGLP
 n/JH0IX+UWnPZca9ZKEKIlt/ZxNES55zhtV11Foy+XWlYspWTX3+94LxFEcwPwr/yjHI
 Ock2Ug+tBXgDrRepNzndWgJeMx6LBaIvZvOGhBg4inb5SgG1zE4aprH8ixB/jH3Ey5sC
 Z7lQ==
X-Gm-Message-State: APjAAAWJpl0aRP+m6ZX+ZXgYrfRYDXRWTaozs8/6RFyVysCDEHG4o/9i
 xhYndz6EdrM+31naUAP3gJKL+T5CKnc=
X-Google-Smtp-Source: APXvYqy7JzsD77M3nAfy2u03QaUdxF13KNg5mD+R78Vl32rHzzIoTnhVH3DxGFW46k+7R1hUgrVqeA==
X-Received: by 2002:a50:a5e3:: with SMTP id b32mr20825334edc.169.1559933537266; 
 Fri, 07 Jun 2019 11:52:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id t54sm728527edd.17.2019.06.07.11.52.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 07 Jun 2019 11:52:16 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/fb-helper: Unexport cmdline helpers
Date: Fri,  7 Jun 2019 20:52:11 +0200
Message-Id: <20190607185211.25040-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d0VvsM6lUq9c6iYj1zsqk8KDui6sbDx5ayG1ePD2BUc=;
 b=AbiaP61WHOwbXcepSec5WGSf0e1ns1pDoDc0Zv78mMdRBWn9T2P61bpvZ49Pvfunac
 1d3M0rE4JZh5JzneBxuUc3q5b6EHeDxMg82+6kiaIl5GRAYLWYmVuaZgn41uWEHMK6Gl
 D7KXhiP2D0ipEhYh4oF43QEwOWGJn3Jii6VHo=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gbG9uZ2VyIG5lZWRlZCBzaW5jZSB0aGUgaTkxNSBpbml0aWFsIGNvbmZpZyBsb2dpYyB3YXMg
cHVsbGVkIGludG8KdGhlIHNoYXJlZCBoZWxwZXIgYnkgTm9yYWxmLgoKU3BvdHRlZCB3aGlsZSBy
ZXZpZXdpbmcgcGF0Y2hlcyBmcm9tIFZpbGxlLgoKQ2M6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxm
QHRyb25uZXMub3JnPgpDYzogVmlsbGUgU3lyamFsYSA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRl
bC5jb20+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgfCA5ICsrKysrLS0tLQog
aW5jbHVkZS9kcm0vZHJtX2ZiX2hlbHBlci5oICAgICB8IDUgLS0tLS0KIDIgZmlsZXMgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZmJfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5j
CmluZGV4IGI5YjdjMDZjYmM0Zi4uOTUwNzlkNWMwN2I4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2ZiX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVy
LmMKQEAgLTIxMzgsNyArMjEzOCw5IEBAIHN0YXRpYyBpbnQgZHJtX2ZiX2hlbHBlcl9wcm9iZV9j
b25uZWN0b3JfbW9kZXMoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlciwKIAlyZXR1cm4g
Y291bnQ7CiB9CiAKLXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpkcm1faGFzX3ByZWZlcnJlZF9t
b2RlKHN0cnVjdCBkcm1fZmJfaGVscGVyX2Nvbm5lY3RvciAqZmJfY29ubmVjdG9yLCBpbnQgd2lk
dGgsIGludCBoZWlnaHQpCitzdGF0aWMgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKgorZHJtX2hh
c19wcmVmZXJyZWRfbW9kZShzdHJ1Y3QgZHJtX2ZiX2hlbHBlcl9jb25uZWN0b3IgKmZiX2Nvbm5l
Y3RvciwKKwkJICAgICAgIGludCB3aWR0aCwgaW50IGhlaWdodCkKIHsKIAlzdHJ1Y3QgZHJtX2Rp
c3BsYXlfbW9kZSAqbW9kZTsKIApAQCAtMjE1MSwxNCArMjE1MywxNCBAQCBzdHJ1Y3QgZHJtX2Rp
c3BsYXlfbW9kZSAqZHJtX2hhc19wcmVmZXJyZWRfbW9kZShzdHJ1Y3QgZHJtX2ZiX2hlbHBlcl9j
b25uZWN0b3IgKgogCX0KIAlyZXR1cm4gTlVMTDsKIH0KLUVYUE9SVF9TWU1CT0woZHJtX2hhc19w
cmVmZXJyZWRfbW9kZSk7CiAKIHN0YXRpYyBib29sIGRybV9oYXNfY21kbGluZV9tb2RlKHN0cnVj
dCBkcm1fZmJfaGVscGVyX2Nvbm5lY3RvciAqZmJfY29ubmVjdG9yKQogewogCXJldHVybiBmYl9j
b25uZWN0b3ItPmNvbm5lY3Rvci0+Y21kbGluZV9tb2RlLnNwZWNpZmllZDsKIH0KIAotc3RydWN0
IGRybV9kaXNwbGF5X21vZGUgKmRybV9waWNrX2NtZGxpbmVfbW9kZShzdHJ1Y3QgZHJtX2ZiX2hl
bHBlcl9jb25uZWN0b3IgKmZiX2hlbHBlcl9jb25uKQorc3RhdGljIHN0cnVjdCBkcm1fZGlzcGxh
eV9tb2RlICoKK2RybV9waWNrX2NtZGxpbmVfbW9kZShzdHJ1Y3QgZHJtX2ZiX2hlbHBlcl9jb25u
ZWN0b3IgKmZiX2hlbHBlcl9jb25uKQogewogCXN0cnVjdCBkcm1fY21kbGluZV9tb2RlICpjbWRs
aW5lX21vZGU7CiAJc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGU7CkBAIC0yMjA4LDcgKzIy
MTAsNiBAQCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqZHJtX3BpY2tfY21kbGluZV9tb2RlKHN0
cnVjdCBkcm1fZmJfaGVscGVyX2Nvbm5lY3RvciAqZgogCWxpc3RfYWRkKCZtb2RlLT5oZWFkLCAm
ZmJfaGVscGVyX2Nvbm4tPmNvbm5lY3Rvci0+bW9kZXMpOwogCXJldHVybiBtb2RlOwogfQotRVhQ
T1JUX1NZTUJPTChkcm1fcGlja19jbWRsaW5lX21vZGUpOwogCiBzdGF0aWMgYm9vbCBkcm1fY29u
bmVjdG9yX2VuYWJsZWQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwgYm9vbCBzdHJp
Y3QpCiB7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZmJfaGVscGVyLmggYi9pbmNsdWRl
L2RybS9kcm1fZmJfaGVscGVyLmgKaW5kZXggNmIzMzRmNGQ4YTIyLi41YTdlNWQxMzE5MTMgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9mYl9oZWxwZXIuaAorKysgYi9pbmNsdWRlL2RybS9k
cm1fZmJfaGVscGVyLmgKQEAgLTI4OSwxMSArMjg5LDYgQEAgaW50IGRybV9mYl9oZWxwZXJfaW5p
dGlhbF9jb25maWcoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlciwgaW50IGJwcF9zZWwp
OwogaW50IGRybV9mYl9oZWxwZXJfc2luZ2xlX2FkZF9hbGxfY29ubmVjdG9ycyhzdHJ1Y3QgZHJt
X2ZiX2hlbHBlciAqZmJfaGVscGVyKTsKIGludCBkcm1fZmJfaGVscGVyX2RlYnVnX2VudGVyKHN0
cnVjdCBmYl9pbmZvICppbmZvKTsKIGludCBkcm1fZmJfaGVscGVyX2RlYnVnX2xlYXZlKHN0cnVj
dCBmYl9pbmZvICppbmZvKTsKLXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICoKLWRybV9oYXNfcHJl
ZmVycmVkX21vZGUoc3RydWN0IGRybV9mYl9oZWxwZXJfY29ubmVjdG9yICpmYl9jb25uZWN0b3Is
Ci0JCQlpbnQgd2lkdGgsIGludCBoZWlnaHQpOwotc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKgot
ZHJtX3BpY2tfY21kbGluZV9tb2RlKHN0cnVjdCBkcm1fZmJfaGVscGVyX2Nvbm5lY3RvciAqZmJf
aGVscGVyX2Nvbm4pOwogCiBpbnQgZHJtX2ZiX2hlbHBlcl9hZGRfb25lX2Nvbm5lY3RvcihzdHJ1
Y3QgZHJtX2ZiX2hlbHBlciAqZmJfaGVscGVyLCBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yKTsKIGludCBkcm1fZmJfaGVscGVyX3JlbW92ZV9vbmVfY29ubmVjdG9yKHN0cnVjdCBkcm1f
ZmJfaGVscGVyICpmYl9oZWxwZXIsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
