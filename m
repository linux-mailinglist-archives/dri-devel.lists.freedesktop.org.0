Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC45504B2
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 10:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C4B89872;
	Mon, 24 Jun 2019 08:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0496D89872
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 08:40:21 +0000 (UTC)
X-Originating-IP: 90.88.16.156
Received: from localhost (aaubervilliers-681-1-41-156.w90-88.abo.wanadoo.fr
 [90.88.16.156]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 952601C0012;
 Mon, 24 Jun 2019 08:40:17 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH] drm/connector: Fix warning in debug message
Date: Mon, 24 Jun 2019 10:40:16 +0200
Message-Id: <20190624084016.12937-1-maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
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
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 kbuild test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNvbW1pdCAzYWVlYjEzZDg5OTYgKCJkcm0vbW9kZXM6IFN1cHBvcnQgbW9kZXMgbmFtZXMg
b24gdGhlIGNvbW1hbmQKbGluZSIpIGFkZGVkIG5hbWUgc3VwcG9ydCB0byB0aGUgRFJNIG1vZGVz
LCBhbmQgYWRkZWQgdGhhdCBuYW1lIHRvIHRoZQpkZWJ1ZyBtZXNzYWdlLgoKSG93ZXZlciwgdGhh
dCBjb2RlIHRlc3RzIGZvciB3aGV0aGVyIG9yIG5vdCB0aGUgbmFtZSB2YXJpYWJsZSBpcyBOVUxM
IGFuZApvbmx5IHByaW50cyBpdCBpZiBpdCdzIG5vdC4gRXhjZXB0IHRoYXQgdGhhdCB2YXJpYWJs
ZSBpcyBhbiBhcnJheSwgc28gaXQKd2lsbCBuZXZlciBiZSBOVUxMLgoKVGhlIG9yaWdpbmFsIGlu
dGVudCB3YXMgdG8gcHJpbnQgaXQgb25seSB3aGVuIHRoZSBuYW1lIGhhcyBiZWVuIHNwZWNpZmll
ZC4KSnVzdCBwcmludGluZyB0aGUgYXJyYXkgZGlyZWN0bHkgd2lsbCBhY2hpZXZlIHRoZSBzYW1l
IHRoaW5nIHNpbmNlIHRoZQpkcm1fY21kbGluZV9tb2RlIHN0cnVjdHVyZSB0aGF0IGhvbGRzIGl0
IGlzIGl0c2VsZiBjb250YWluZWQgaW4KZHJtX2Nvbm5lY3RvciwgdGhhdCBpcyBhbGxvY2F0ZWQg
d2l0aCBpdHMgd2hvbGUgY29udGVudCB6ZXJvJ2QuCgpUaGF0IG1lYW5zIHRoYXQgaWYgdGhlIG5h
bWUgaXMgbm90IGRlY2xhcmVkLCB0aGUgYXJyYXkgd2lsbCBiZSBhbGwgemVyb3MsCndoaWNoIHdp
bGwgbm90IHByaW50IGFueXRoaW5nLgoKQ2M6IE5pY2sgRGVzYXVsbmllcnMgPG5kZXNhdWxuaWVy
c0Bnb29nbGUuY29tPgpSZXBvcnRlZC1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5j
b20+CkZpeGVzOiAzYWVlYjEzZDg5OTYgKCJkcm0vbW9kZXM6IFN1cHBvcnQgbW9kZXMgbmFtZXMg
b24gdGhlIGNvbW1hbmQgbGluZSIpClNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGlt
ZS5yaXBhcmRAYm9vdGxpbi5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3Iu
YyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fY29ubmVjdG9yLmMKaW5kZXggM2FmZWQ1Njc3OTQ2Li4wNjhkNGIwNWYxYmUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwpAQCAtMTQwLDggKzE0MCw3IEBAIHN0YXRpYyB2b2lk
IGRybV9jb25uZWN0b3JfZ2V0X2NtZGxpbmVfbW9kZShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
bmVjdG9yKQogCX0KIAogCURSTV9ERUJVR19LTVMoImNtZGxpbmUgbW9kZSBmb3IgY29ubmVjdG9y
ICVzICVzICVkeCVkQCVkSHolcyVzJXNcbiIsCi0JCSAgICAgIGNvbm5lY3Rvci0+bmFtZSwKLQkJ
ICAgICAgbW9kZS0+bmFtZSA/IG1vZGUtPm5hbWUgOiAiIiwKKwkJICAgICAgY29ubmVjdG9yLT5u
YW1lLCBtb2RlLT5uYW1lLAogCQkgICAgICBtb2RlLT54cmVzLCBtb2RlLT55cmVzLAogCQkgICAg
ICBtb2RlLT5yZWZyZXNoX3NwZWNpZmllZCA/IG1vZGUtPnJlZnJlc2ggOiA2MCwKIAkJICAgICAg
bW9kZS0+cmIgPyAiIHJlZHVjZWQgYmxhbmtpbmciIDogIiIsCi0tIAoyLjIxLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
