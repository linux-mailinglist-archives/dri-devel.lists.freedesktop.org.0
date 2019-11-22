Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64687106999
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 11:06:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556166EEB5;
	Fri, 22 Nov 2019 10:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C3B6EEA4
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 10:05:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6670CAFDF;
 Fri, 22 Nov 2019 10:05:47 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 1/6] drm/gma500: Remove addr_space field from psb_framebuffer
Date: Fri, 22 Nov 2019 11:05:40 +0100
Message-Id: <20191122100545.16812-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191122100545.16812-1-tzimmermann@suse.de>
References: <20191122100545.16812-1-tzimmermann@suse.de>
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

VGhlIGZpZWxkICdhZGRyX3NwYWNlJyBpbiBzdHJ1Y3QgcHNiX2ZyYW1lYnVmZmVyIHNlcnZlcyBu
bwpwdXJwb3NlLiBSZW1vdmUgaXQuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2ZyYW1lYnVm
ZmVyLmMgfCAyIC0tCiBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2ZyYW1lYnVmZmVyLmggfCAxIC0K
IDIgZmlsZXMgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZ21hNTAwL2ZyYW1lYnVmZmVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2ZyYW1l
YnVmZmVyLmMKaW5kZXggMjE4ZjNiYjE1Mjc2Li41OThkYzUxZDllMjQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9nbWE1MDAvZnJhbWVidWZmZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
Z21hNTAwL2ZyYW1lYnVmZmVyLmMKQEAgLTE1Myw4ICsxNTMsNiBAQCBzdGF0aWMgaW50IHBzYmZi
X21tYXAoc3RydWN0IGZiX2luZm8gKmluZm8sIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQog
CWlmICh2bWEtPnZtX3Bnb2ZmID4gKH4wVUwgPj4gUEFHRV9TSElGVCkpCiAJCXJldHVybiAtRUlO
VkFMOwogCi0JaWYgKCFwc2JmYi0+YWRkcl9zcGFjZSkKLQkJcHNiZmItPmFkZHJfc3BhY2UgPSB2
bWEtPnZtX2ZpbGUtPmZfbWFwcGluZzsKIAkvKgogCSAqIElmIHRoaXMgaXMgYSBHRU0gb2JqZWN0
IHRoZW4gaW5mby0+c2NyZWVuX2Jhc2UgaXMgdGhlIHZpcnR1YWwKIAkgKiBrZXJuZWwgcmVtYXBw
aW5nIG9mIHRoZSBvYmplY3QuIEZJWE1FOiBSZXZpZXcgaWYgdGhpcyBpcwpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9mcmFtZWJ1ZmZlci5oIGIvZHJpdmVycy9ncHUvZHJtL2dt
YTUwMC9mcmFtZWJ1ZmZlci5oCmluZGV4IGFlOGEwMjYzOWZkOS4uYTJkNjhkZDc0YzEyIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2ZyYW1lYnVmZmVyLmgKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2dtYTUwMC9mcmFtZWJ1ZmZlci5oCkBAIC0xNSw3ICsxNSw2IEBACiAKIHN0cnVj
dCBwc2JfZnJhbWVidWZmZXIgewogCXN0cnVjdCBkcm1fZnJhbWVidWZmZXIgYmFzZTsKLQlzdHJ1
Y3QgYWRkcmVzc19zcGFjZSAqYWRkcl9zcGFjZTsKIAlzdHJ1Y3QgZmJfaW5mbyAqZmJkZXY7CiB9
OwogCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
