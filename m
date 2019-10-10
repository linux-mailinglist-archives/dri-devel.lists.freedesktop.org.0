Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB55D27F4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 13:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0478D6EB06;
	Thu, 10 Oct 2019 11:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C689A6EB06
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 11:29:29 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/plane: Clarify our expectations for src/dst rectangles
Date: Thu, 10 Oct 2019 13:29:17 +0200
Message-Id: <20191010112918.15724-1-maarten.lankhorst@linux.intel.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHJlY3RhbmdsZXMgYXJlIHVzdWFsbHkgY2xpcHBlZCwgYnV0IGl0IGNhbiBiZSB1c2VmdWwg
dG8gaGF2ZQp0aGVtIHVuY2xpcHBlZCwgZm9yIGV4YW1wbGUgZm9yIGN1cnNvciBwbGFuZXMuCgpT
aWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXgu
aW50ZWwuY29tPgotLS0KIGluY2x1ZGUvZHJtL2RybV9wbGFuZS5oIHwgMjIgKysrKysrKysrKysr
KysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX3BsYW5lLmggYi9pbmNsdWRlL2RybS9k
cm1fcGxhbmUuaAppbmRleCBjZDU5MDNhZDMzZjcuLjk0YmJiZjIxNTEwMCAxMDA2NDQKLS0tIGEv
aW5jbHVkZS9kcm0vZHJtX3BsYW5lLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX3BsYW5lLmgKQEAg
LTE4Myw4ICsxODMsMjYgQEAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSB7CiAJICovCiAJc3RydWN0
IGRybV9wcm9wZXJ0eV9ibG9iICpmYl9kYW1hZ2VfY2xpcHM7CiAKLQkvKiogQHNyYzogY2xpcHBl
ZCBzb3VyY2UgY29vcmRpbmF0ZXMgb2YgdGhlIHBsYW5lIChpbiAxNi4xNikgKi8KLQkvKiogQGRz
dDogY2xpcHBlZCBkZXN0aW5hdGlvbiBjb29yZGluYXRlcyBvZiB0aGUgcGxhbmUgKi8KKwkvKioK
KwkgKiBAc3JjOgorCSAqCisJICogc291cmNlIGNvb3JkaW5hdGVzIG9mIHRoZSBwbGFuZSAoaW4g
MTYuMTYpLgorCSAqCisJICogV2hlbiB1c2luZyBkcm1fYXRvbWljX2hlbHBlcl9jaGVja19wbGFu
ZV9zdGF0ZSgpLAorCSAqIHRoZSBjb29yZGluYXRlcyBhcmUgY2xpcHBlZCwgYnV0IHRoZSBkcml2
ZXIgbWF5IGNob29zZQorCSAqIHRvIHVzZSB1bmNsaXBwZWQgY29vcmRpbmF0ZXMgaW5zdGVhZC4K
KwkgKgorCSAqIFRoaXMgY2FuIGJlIHVzZWZ1bCB3aGVuIHVzaW5nIGEgaGFyZGNvZGVkIHNpemUg
aW4gYSBjdXJzb3IgcGxhbmUuCisJICovCisJLyoqCisJICogQGRzdDoKKwkgKgorCSAqIFdoZW4g
dXNpbmcgZHJtX2F0b21pY19oZWxwZXJfY2hlY2tfcGxhbmVfc3RhdGUoKSwKKwkgKiB0aGUgY29v
cmRpbmF0ZXMgYXJlIGNsaXBwZWQsIGJ1dCB0aGUgZHJpdmVyIG1heSBjaG9vc2UKKwkgKiB0byB1
c2UgdW5jbGlwcGVkIGNvb3JkaW5hdGVzIGluc3RlYWQuCisJICoKKwkgKiBUaGlzIGNhbiBiZSB1
c2VmdWwgd2hlbiB1c2luZyBhIGhhcmRjb2RlZCBzaXplIGluIGEgY3Vyc29yIHBsYW5lLgorCSAq
LwogCXN0cnVjdCBkcm1fcmVjdCBzcmMsIGRzdDsKIAogCS8qKgotLSAKMi4yMy4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
