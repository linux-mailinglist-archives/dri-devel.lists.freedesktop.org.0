Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4566E59D9E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 16:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565C36E92E;
	Fri, 28 Jun 2019 14:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0AFE6E92B
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 14:17:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 67BF4284CF8
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 2/2] Revert "drm/vblank: Do not update vblank count if
 interrupts are already disabled."
Date: Fri, 28 Jun 2019 15:15:36 +0100
Message-Id: <3f4e42ee5250ce8697f4ad2fa6b57ef8bd5b9663.1561729581.git.bob.beckett@collabora.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1561729581.git.bob.beckett@collabora.com>
References: <cover.1561729581.git.bob.beckett@collabora.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 David Airlie <airlied@linux.ie>,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgaW50ZXJydXB0cyBhcmUgYWxyZWFkeSBkaXNhYmxlZCwgdGhlbiB0aGUgdGltZXN0YW1wIGZv
ciB0aGUgdmJsYW5rCmRvZXMgbm90IGdldCB1cGRhdGVkLCBjYXVzaW5nIGEgc3RhbGUgdGltZXN0
YW1wIHRvIGJlIHJlcG9ydGVkIHRvCnVzZXJsYW5kIHdoaWxlIGRpc2FibGluZyBjcnRjcy4KClRo
aXMgcmV2ZXJ0cyBjb21taXQgNjgwMzZiMDhiOTFiYzQ5MWNjYzMwOGY5MDI2MTZhNTcwYTQ5MjI3
Yy4KClNpZ25lZC1vZmYtYnk6IFJvYmVydCBCZWNrZXR0IDxib2IuYmVja2V0dEBjb2xsYWJvcmEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMgfCAxOCArKysrKysrKy0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX3ZibGFuay5jCmluZGV4IDkzOTViOGM2OTBiOC4uZDcxYzQ5OTgzYmUzIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fdmJsYW5rLmMKQEAgLTM3MSwyNSArMzcxLDIzIEBAIHZvaWQgZHJtX3ZibGFua19kaXNhYmxl
X2FuZF9zYXZlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBwaXBlKQogCXNw
aW5fbG9ja19pcnFzYXZlKCZkZXYtPnZibGFua190aW1lX2xvY2ssIGlycWZsYWdzKTsKIAogCS8q
Ci0JICogVXBkYXRlIHZibGFuayBjb3VudCBhbmQgZGlzYWJsZSB2YmxhbmsgaW50ZXJydXB0cyBv
bmx5IGlmIHRoZQotCSAqIGludGVycnVwdHMgd2VyZSBlbmFibGVkLiBUaGlzIGF2b2lkcyBjYWxs
aW5nIHRoZSAtPmRpc2FibGVfdmJsYW5rKCkKLQkgKiBvcGVyYXRpb24gaW4gYXRvbWljIGNvbnRl
eHQgd2l0aCB0aGUgaGFyZHdhcmUgcG90ZW50aWFsbHkgcnVudGltZQotCSAqIHN1c3BlbmRlZC4K
KwkgKiBPbmx5IGRpc2FibGUgdmJsYW5rIGludGVycnVwdHMgaWYgdGhleSdyZSBlbmFibGVkLiBU
aGlzIGF2b2lkcworCSAqIGNhbGxpbmcgdGhlIC0+ZGlzYWJsZV92YmxhbmsoKSBvcGVyYXRpb24g
aW4gYXRvbWljIGNvbnRleHQgd2l0aCB0aGUKKwkgKiBoYXJkd2FyZSBwb3RlbnRpYWxseSBydW50
aW1lIHN1c3BlbmRlZC4KIAkgKi8KLQlpZiAoIXZibGFuay0+ZW5hYmxlZCkKLQkJZ290byBvdXQ7
CisJaWYgKHZibGFuay0+ZW5hYmxlZCkgeworCQlfX2Rpc2FibGVfdmJsYW5rKGRldiwgcGlwZSk7
CisJCXZibGFuay0+ZW5hYmxlZCA9IGZhbHNlOworCX0KIAogCS8qCi0JICogVXBkYXRlIHRoZSBj
b3VudCBhbmQgdGltZXN0YW1wIHRvIG1haW50YWluIHRoZQorCSAqIEFsd2F5cyB1cGRhdGUgdGhl
IGNvdW50IGFuZCB0aW1lc3RhbXAgdG8gbWFpbnRhaW4gdGhlCiAJICogYXBwZWFyYW5jZSB0aGF0
IHRoZSBjb3VudGVyIGhhcyBiZWVuIHRpY2tpbmcgYWxsIGFsb25nIHVudGlsCiAJICogdGhpcyB0
aW1lLiBUaGlzIG1ha2VzIHRoZSBjb3VudCBhY2NvdW50IGZvciB0aGUgZW50aXJlIHRpbWUKIAkg
KiBiZXR3ZWVuIGRybV9jcnRjX3ZibGFua19vbigpIGFuZCBkcm1fY3J0Y192Ymxhbmtfb2ZmKCku
CiAJICovCiAJZHJtX3VwZGF0ZV92YmxhbmtfY291bnQoZGV2LCBwaXBlLCBmYWxzZSk7Ci0JX19k
aXNhYmxlX3ZibGFuayhkZXYsIHBpcGUpOwotCXZibGFuay0+ZW5hYmxlZCA9IGZhbHNlOwogCi1v
dXQ6CiAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZGV2LT52YmxhbmtfdGltZV9sb2NrLCBpcnFm
bGFncyk7CiB9CiAKLS0gCjIuMTguMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
