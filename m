Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C421E45C56
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 14:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB87896EB;
	Fri, 14 Jun 2019 12:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE49A896EB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 12:13:34 +0000 (UTC)
X-Originating-IP: 90.88.23.150
Received: from localhost (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr
 [90.88.23.150]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 62FB2FF805;
 Fri, 14 Jun 2019 12:13:26 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 01/12] drm/connector: Add documentation for drm_cmdline_mode
Date: Fri, 14 Jun 2019 14:13:08 +0200
Message-Id: <19279b675ec213f8011def396b43bad2420e2992.1560514379.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.5fc7840dc8fb24744516c13acb8c8aa18e44c0d0.1560514379.git-series.maxime.ripard@bootlin.com>
References: <cover.5fc7840dc8fb24744516c13acb8c8aa18e44c0d0.1560514379.git-series.maxime.ripard@bootlin.com>
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
Cc: eben@raspberrypi.org, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHN0cnVjdCBkcm1fY21kbGluZV9tb2RlIGhvbGRzIHRoZSByZXN1bHQgb2YgdGhlIGNvbW1h
bmQgbGluZSBwYXJzZXJzLgpIb3dldmVyLCBpdCB3YXNuJ3QgZG9jdW1lbnRlZCBzbyBmYXIsIHNv
IGxldCdzIGRvIHRoYXQuCgpTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlw
YXJkQGJvb3RsaW4uY29tPgotLS0KIGluY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaCB8IDg2ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgODQg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9k
cm1fY29ubmVjdG9yLmggYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKaW5kZXggNDdlNzQ5
Yjc0ZTVmLi5mOWNmYTk2ZjVkN2UgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0
b3IuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKQEAgLTkwNCwxOCArOTA0LDEw
MCBAQCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcyB7CiAJCQkJICAgY29uc3Qgc3RydWN0IGRy
bV9jb25uZWN0b3Jfc3RhdGUgKnN0YXRlKTsKIH07CiAKLS8qIG1vZGUgc3BlY2lmaWVkIG9uIHRo
ZSBjb21tYW5kIGxpbmUgKi8KKy8qKgorICogc3RydWN0IGRybV9jbWRsaW5lX21vZGUgLSBEUk0g
TW9kZSBwYXNzZWQgdGhyb3VnaCB0aGUga2VybmVsIGNvbW1hbmQtbGluZQorICoKKyAqIEVhY2gg
Y29ubmVjdG9yIGNhbiBoYXZlIGFuIGluaXRpYWwgbW9kZSB3aXRoIGFkZGl0aW9uYWwgb3B0aW9u
cworICogcGFzc2VkIHRocm91Z2ggdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUuIFRoaXMgc3RydWN0
dXJlIGFsbG93cyB0bworICogZXhwcmVzcyB0aG9zZSBwYXJhbWV0ZXJzIGFuZCB3aWxsIGJlIGZp
bGxlZCBieSB0aGUgY29tbWFuZC1saW5lCisgKiBwYXJzZXIuCisgKi8KIHN0cnVjdCBkcm1fY21k
bGluZV9tb2RlIHsKKwkvKioKKwkgKiBAc3BlY2lmaWVkOgorCSAqCisJICogSGFzIGEgbW9kZSBi
ZWVuIHJlYWQgZnJvbSB0aGUgY29tbWFuZC1saW5lPworCSAqLwogCWJvb2wgc3BlY2lmaWVkOwor
CisJLyoqCisJICogQHJlZnJlc2hfc3BlY2lmaWVkOgorCSAqCisJICogRGlkIHRoZSBtb2RlIGhh
cyBhIHByZWZlcnJlZCByZWZyZXNoIHJhdGU/CisJICovCiAJYm9vbCByZWZyZXNoX3NwZWNpZmll
ZDsKKworCS8qKgorCSAqIEBicHBfc3BlY2lmaWVkOgorCSAqCisJICogRGlkIHRoZSBtb2RlIGhh
cyBhIHByZWZlcnJlZCBCUFA/CisJICovCiAJYm9vbCBicHBfc3BlY2lmaWVkOwotCWludCB4cmVz
LCB5cmVzOworCisJLyoqCisJICogQHhyZXM6CisJICoKKwkgKiBBY3RpdmUgcmVzb2x1dGlvbiBv
biB0aGUgWCBheGlzLCBpbiBwaXhlbHMuCisJICovCisJaW50IHhyZXM7CisKKwkvKioKKwkgKiBA
eXJlczoKKwkgKgorCSAqIEFjdGl2ZSByZXNvbHV0aW9uIG9uIHRoZSBZIGF4aXMsIGluIHBpeGVs
cy4KKwkgKi8KKwlpbnQgeXJlczsKKworCS8qKgorCSAqIEBicHA6CisJICoKKwkgKiBCaXRzIHBl
ciBwaXhlbHMgZm9yIHRoZSBtb2RlLgorCSAqLwogCWludCBicHA7CisKKwkvKioKKwkgKiBAcmVm
cmVzaDoKKwkgKgorCSAqIFJlZnJlc2ggcmF0ZSwgaW4gSGVydHouCisJICovCiAJaW50IHJlZnJl
c2g7CisKKwkvKioKKwkgKiBAcmI6CisJICoKKwkgKiBEbyB3ZSBuZWVkIHRvIHVzZSByZWR1Y2Vk
IGJsYW5raW5nPworCSAqLwogCWJvb2wgcmI7CisKKwkvKioKKwkgKiBAaW50ZXJsYWNlOgorCSAq
CisJICogVGhlIG1vZGUgaXMgaW50ZXJsYWNlZC4KKwkgKi8KIAlib29sIGludGVybGFjZTsKKwor
CS8qKgorCSAqIEBjdnQ6CisJICoKKwkgKiBUaGUgdGltaW5ncyB3aWxsIGJlIGNhbGN1bGF0ZWQg
dXNpbmcgdGhlIFZFU0EgQ29vcmRpbmF0ZWQKKwkgKiBWaWRlbyBUaW1pbmdzIGluc3RlYWQgb2Yg
bG9va2luZyB1cCB0aGUgbW9kZSBmcm9tIGEgdGFibGUuCisJICovCiAJYm9vbCBjdnQ7CisKKwkv
KioKKwkgKiBAbWFyZ2luczoKKwkgKgorCSAqIEFkZCBtYXJnaW5zIHRvIHRoZSBtb2RlIGNhbGN1
bGF0aW9uICgxLjglIG9mIHhyZXMgcm91bmRlZAorCSAqIGRvd24gdG8gOCBwaXhlbHMgYW5kIDEu
OCUgb2YgeXJlcykuCisJICovCiAJYm9vbCBtYXJnaW5zOworCisJLyoqCisJICogQGZvcmNlOgor
CSAqCisJICogSWdub3JlIHRoZSBob3RwbHVnIHN0YXRlIG9mIHRoZSBjb25uZWN0b3IsIGFuZCBm
b3JjZSBpdHMKKwkgKiBzdGF0ZSB0byBvbmUgb2YgdGhlIERSTV9GT1JDRV8qIHZhbHVlcy4KKwkg
Ki8KIAllbnVtIGRybV9jb25uZWN0b3JfZm9yY2UgZm9yY2U7CiB9OwogCi0tIApnaXQtc2VyaWVz
IDAuOS4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
