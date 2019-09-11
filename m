Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6411AFB23
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 13:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DEB16EA8F;
	Wed, 11 Sep 2019 11:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9196B6EA8B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 11:09:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BB7E4AF23;
 Wed, 11 Sep 2019 11:09:18 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, kraxel@redhat.com, airlied@linux.ie, corbet@lwn.net,
 z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 hdegoede@redhat.com, sam@ravnborg.org, yc_chen@aspeedtech.com
Subject: [PATCH v2 0/4] Merge VRAM MM and GEM VRAM source files
Date: Wed, 11 Sep 2019 13:09:06 +0200
Message-Id: <20190911110910.30698-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
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
Cc: virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VlJBTSBNTSBhbmQgR0VNIFZSQU0gYXJlIG9ubHkgdXNlZCB3aXRoIGVhY2ggb3RoZXIuIFRoaXMg
cGF0Y2ggc2V0Cm1vdmVzIFZSQU0gTU0gaW50byBHRU0gVlJBTSBzb3VyY2UgZmlsZXMgYW5kIGNs
ZWFucyB1cCB0aGUgaGVscGVyJ3MKcHVibGljIGludGVyZmFjZS4KClZlcnNpb24gMiBvZiB0aGUg
cGF0Y2ggc2V0IGRvZXNuJ3QgY29udGFpbiBmdW5jdGlvbmFsIGNoYW5nZXMuIEknbQpyZXBvc3Rp
bmcgZHVlIHRvIHRoZSByZWJhc2luZyBvbnRvIHRoZSBkZWJ1Z2ZzIHBhdGNoZXMuCgp2MjoKCSog
dXBkYXRlZCBmb3IgZGVidWdmcyBzdXBwb3J0CgkqIGZpeGVkIHR5cG9zIGluIGNvbW1lbnRzCgpU
aG9tYXMgWmltbWVybWFubiAoNCk6CiAgZHJtL3ZyYW06IE1vdmUgVlJBTSBtZW1vcnkgbWFuYWdl
ciB0byBHRU0gVlJBTSBpbXBsZW1lbnRhdGlvbgogIGRybS92cmFtOiBIYXZlIFZSQU0gTU0gY2Fs
bCBHRU0gVlJBTSBmdW5jdGlvbnMgZGlyZWN0bHkKICBkcm0vdnJhbTogVW5leHBvcnQgaW50ZXJu
YWwgZnVuY3Rpb25zIG9mIFZSQU0gTU0KICBkcm0vdnJhbTogVW5jb25kaXRvbmFsbHkgc2V0IEJP
IGNhbGwtYmFjayBmdW5jdGlvbnMKCiBEb2N1bWVudGF0aW9uL2dwdS9kcm0tbW0ucnN0ICAgICAg
ICAgICAgICAgICAgfCAgMTIgLQogZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlICAgICAgICAgICAg
ICAgICAgICAgIHwgICAzICstCiBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYyAgICAgICAg
ICAgICAgICAgfCAgIDEgLQogZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jICAgICAgICAg
ICAgICAgIHwgICAxIC0KIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X3R0bS5jICAgICAgICAgICAg
ICAgICB8ICAgMyArLQogZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzLmggICAgICAgICAgICAg
ICAgIHwgICAxIC0KIGRyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19tbS5jICAgICAgICAgICAg
ICB8ICAgMyArLQogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYyAgICAgICAg
IHwgNDA2ICsrKysrKysrKysrKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL2RybV92cmFtX2hlbHBl
cl9jb21tb24uYyAgICAgIHwgICA4ICstCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3ZyYW1fbW1faGVs
cGVyLmMgICAgICAgICAgfCAzNTMgLS0tLS0tLS0tLS0tLS0tCiAuLi4vZ3B1L2RybS9oaXNpbGlj
b24vaGlibWMvaGlibWNfZHJtX2Rydi5jICAgfCAgIDEgLQogZHJpdmVycy9ncHUvZHJtL2hpc2ls
aWNvbi9oaWJtYy9oaWJtY190dG0uYyAgIHwgICAzICstCiBkcml2ZXJzL2dwdS9kcm0vbWdhZzIw
MC9tZ2FnMjAwX2Rydi5oICAgICAgICAgfCAgIDEgLQogZHJpdmVycy9ncHUvZHJtL21nYWcyMDAv
bWdhZzIwMF90dG0uYyAgICAgICAgIHwgICAzICstCiBkcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVv
L3Zib3hfZHJ2LmggICAgICAgICAgfCAgIDIgLQogZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92
Ym94X3R0bS5jICAgICAgICAgIHwgICAzICstCiBpbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVs
cGVyLmggICAgICAgICAgICAgfCAgOTIgKysrLQogaW5jbHVkZS9kcm0vZHJtX3ZyYW1fbW1faGVs
cGVyLmggICAgICAgICAgICAgIHwgMTA5IC0tLS0tCiAxOCBmaWxlcyBjaGFuZ2VkLCA0MjEgaW5z
ZXJ0aW9ucygrKSwgNTg0IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
Z3B1L2RybS9kcm1fdnJhbV9tbV9oZWxwZXIuYwogZGVsZXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUv
ZHJtL2RybV92cmFtX21tX2hlbHBlci5oCgotLQoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
