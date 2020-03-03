Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F832177023
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 08:31:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD6D6E9A4;
	Tue,  3 Mar 2020 07:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17ED6E9A4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 07:31:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4E004ABF4;
 Tue,  3 Mar 2020 07:31:39 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, ville.syrjala@linux.intel.com
Subject: [PATCH] drm/vblank: Fix documentation of VBLANK timestamp helper
Date: Tue,  3 Mar 2020 08:31:35 +0100
Message-Id: <20200303073135.10605-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGVyLUNSVEMgVkJMQU5LIGluZm9ybWF0aW9uIHVzZWQgdG8gYmUgYWRkcmVzc2VkIGJ5IGRldmlj
ZSBhbmQgcGlwZQppbmRleC4gQSBjYWxsIGRybV9jcnRjX3ZibGFua19oZWxwZXJfZ2V0X3ZibGFu
a190aW1lc3RhbXBfaW50ZXJuYWwoKQpyZWNlaXZlcyBhIHBvaW50ZXIgdG8gdGhlIENSVEMgaW5z
dGVhZC4gRml4IHRoZSBkb2N1bWVudGF0aW9uLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+ClJlcG9ydGVkLWJ5OiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+CkZpeGVzOiBmMWUyYjYzNzFjMTIgKCJkcm06IEFkZCBnZXRfc2Nhbm91
dF9wb3NpdGlvbigpIHRvIHN0cnVjdCBkcm1fY3J0Y19oZWxwZXJfZnVuY3MiKQpDYzogVGhvbWFz
IFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0
ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRA
a2VybmVsLm9yZz4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jIHwgMyArLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwpp
bmRleCA0N2ZjNDMzOWVjN2YuLmRhN2IwYjBjMTA5MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV92YmxhbmsuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jCkBAIC01
OTIsOCArNTkyLDcgQEAgRVhQT1JUX1NZTUJPTChkcm1fY2FsY190aW1lc3RhbXBpbmdfY29uc3Rh
bnRzKTsKIC8qKgogICogZHJtX2NydGNfdmJsYW5rX2hlbHBlcl9nZXRfdmJsYW5rX3RpbWVzdGFt
cF9pbnRlcm5hbCAtIHByZWNpc2UgdmJsYW5rCiAgKiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGltZXN0YW1wIGhlbHBlcgotICogQGRldjog
RFJNIGRldmljZQotICogQHBpcGU6IGluZGV4IG9mIENSVEMgd2hvc2UgdmJsYW5rIHRpbWVzdGFt
cCB0byByZXRyaWV2ZQorICogQGNydGM6IENSVEMgd2hvc2UgdmJsYW5rIHRpbWVzdGFtcCB0byBy
ZXRyaWV2ZQogICogQG1heF9lcnJvcjogRGVzaXJlZCBtYXhpbXVtIGFsbG93YWJsZSBlcnJvciBp
biB0aW1lc3RhbXBzIChuYW5vc2VjcykKICAqICAgICAgICAgICAgIE9uIHJldHVybiBjb250YWlu
cyB0cnVlIG1heGltdW0gZXJyb3Igb2YgdGltZXN0YW1wCiAgKiBAdmJsYW5rX3RpbWU6IFBvaW50
ZXIgdG8gdGltZSB3aGljaCBzaG91bGQgcmVjZWl2ZSB0aGUgdGltZXN0YW1wCi0tIAoyLjI1LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
