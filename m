Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D20C48605
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 16:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B9E892E2;
	Mon, 17 Jun 2019 14:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CB7892E2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 14:51:45 +0000 (UTC)
X-Originating-IP: 90.88.23.150
Received: from localhost (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr
 [90.88.23.150]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 140A3FF802;
 Mon, 17 Jun 2019 14:51:40 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v5 01/12] drm/connector: Add documentation for drm_cmdline_mode
Date: Mon, 17 Jun 2019 16:51:28 +0200
Message-Id: <963c893c16c6a25fc469b53c726f493d99bdc578.1560783090.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.5190d070d1439d762d7ab273f4ae2573087fee20.1560783090.git-series.maxime.ripard@bootlin.com>
References: <cover.5190d070d1439d762d7ab273f4ae2573087fee20.1560783090.git-series.maxime.ripard@bootlin.com>
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
IGxldCdzIGRvIHRoYXQuCgpSZXZpZXdlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJv
bm5lcy5vcmc+ClNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9v
dGxpbi5jb20+Ci0tLQogaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oIHwgODYgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA4NCBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9jb25u
ZWN0b3IuaCBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAppbmRleCBjNmY4NDg2ZDhiOGYu
LmM4MDI3ODBiMGJmYyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCisr
KyBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaApAQCAtOTIzLDE4ICs5MjMsMTAwIEBAIHN0
cnVjdCBkcm1fY29ubmVjdG9yX2Z1bmNzIHsKIAkJCQkgICBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5l
Y3Rvcl9zdGF0ZSAqc3RhdGUpOwogfTsKIAotLyogbW9kZSBzcGVjaWZpZWQgb24gdGhlIGNvbW1h
bmQgbGluZSAqLworLyoqCisgKiBzdHJ1Y3QgZHJtX2NtZGxpbmVfbW9kZSAtIERSTSBNb2RlIHBh
c3NlZCB0aHJvdWdoIHRoZSBrZXJuZWwgY29tbWFuZC1saW5lCisgKgorICogRWFjaCBjb25uZWN0
b3IgY2FuIGhhdmUgYW4gaW5pdGlhbCBtb2RlIHdpdGggYWRkaXRpb25hbCBvcHRpb25zCisgKiBw
YXNzZWQgdGhyb3VnaCB0aGUga2VybmVsIGNvbW1hbmQgbGluZS4gVGhpcyBzdHJ1Y3R1cmUgYWxs
b3dzIHRvCisgKiBleHByZXNzIHRob3NlIHBhcmFtZXRlcnMgYW5kIHdpbGwgYmUgZmlsbGVkIGJ5
IHRoZSBjb21tYW5kLWxpbmUKKyAqIHBhcnNlci4KKyAqLwogc3RydWN0IGRybV9jbWRsaW5lX21v
ZGUgeworCS8qKgorCSAqIEBzcGVjaWZpZWQ6CisJICoKKwkgKiBIYXMgYSBtb2RlIGJlZW4gcmVh
ZCBmcm9tIHRoZSBjb21tYW5kLWxpbmU/CisJICovCiAJYm9vbCBzcGVjaWZpZWQ7CisKKwkvKioK
KwkgKiBAcmVmcmVzaF9zcGVjaWZpZWQ6CisJICoKKwkgKiBEaWQgdGhlIG1vZGUgaGF2ZSBhIHBy
ZWZlcnJlZCByZWZyZXNoIHJhdGU/CisJICovCiAJYm9vbCByZWZyZXNoX3NwZWNpZmllZDsKKwor
CS8qKgorCSAqIEBicHBfc3BlY2lmaWVkOgorCSAqCisJICogRGlkIHRoZSBtb2RlIGhhdmUgYSBw
cmVmZXJyZWQgQlBQPworCSAqLwogCWJvb2wgYnBwX3NwZWNpZmllZDsKLQlpbnQgeHJlcywgeXJl
czsKKworCS8qKgorCSAqIEB4cmVzOgorCSAqCisJICogQWN0aXZlIHJlc29sdXRpb24gb24gdGhl
IFggYXhpcywgaW4gcGl4ZWxzLgorCSAqLworCWludCB4cmVzOworCisJLyoqCisJICogQHlyZXM6
CisJICoKKwkgKiBBY3RpdmUgcmVzb2x1dGlvbiBvbiB0aGUgWSBheGlzLCBpbiBwaXhlbHMuCisJ
ICovCisJaW50IHlyZXM7CisKKwkvKioKKwkgKiBAYnBwOgorCSAqCisJICogQml0cyBwZXIgcGl4
ZWxzIGZvciB0aGUgbW9kZS4KKwkgKi8KIAlpbnQgYnBwOworCisJLyoqCisJICogQHJlZnJlc2g6
CisJICoKKwkgKiBSZWZyZXNoIHJhdGUsIGluIEhlcnR6LgorCSAqLwogCWludCByZWZyZXNoOwor
CisJLyoqCisJICogQHJiOgorCSAqCisJICogRG8gd2UgbmVlZCB0byB1c2UgcmVkdWNlZCBibGFu
a2luZz8KKwkgKi8KIAlib29sIHJiOworCisJLyoqCisJICogQGludGVybGFjZToKKwkgKgorCSAq
IFRoZSBtb2RlIGlzIGludGVybGFjZWQuCisJICovCiAJYm9vbCBpbnRlcmxhY2U7CisKKwkvKioK
KwkgKiBAY3Z0OgorCSAqCisJICogVGhlIHRpbWluZ3Mgd2lsbCBiZSBjYWxjdWxhdGVkIHVzaW5n
IHRoZSBWRVNBIENvb3JkaW5hdGVkCisJICogVmlkZW8gVGltaW5ncyBpbnN0ZWFkIG9mIGxvb2tp
bmcgdXAgdGhlIG1vZGUgZnJvbSBhIHRhYmxlLgorCSAqLwogCWJvb2wgY3Z0OworCisJLyoqCisJ
ICogQG1hcmdpbnM6CisJICoKKwkgKiBBZGQgbWFyZ2lucyB0byB0aGUgbW9kZSBjYWxjdWxhdGlv
biAoMS44JSBvZiB4cmVzIHJvdW5kZWQKKwkgKiBkb3duIHRvIDggcGl4ZWxzIGFuZCAxLjglIG9m
IHlyZXMpLgorCSAqLwogCWJvb2wgbWFyZ2luczsKKworCS8qKgorCSAqIEBmb3JjZToKKwkgKgor
CSAqIElnbm9yZSB0aGUgaG90cGx1ZyBzdGF0ZSBvZiB0aGUgY29ubmVjdG9yLCBhbmQgZm9yY2Ug
aXRzCisJICogc3RhdGUgdG8gb25lIG9mIHRoZSBEUk1fRk9SQ0VfKiB2YWx1ZXMuCisJICovCiAJ
ZW51bSBkcm1fY29ubmVjdG9yX2ZvcmNlIGZvcmNlOwogfTsKIAotLSAKZ2l0LXNlcmllcyAwLjku
MQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
