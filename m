Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0264860B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 16:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5809C892FA;
	Mon, 17 Jun 2019 14:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5230892FA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 14:52:08 +0000 (UTC)
X-Originating-IP: 90.88.23.150
Received: from localhost (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr
 [90.88.23.150]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id CFC634000B;
 Mon, 17 Jun 2019 14:51:57 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v5 02/12] drm/client: Restrict the plane_state scope
Date: Mon, 17 Jun 2019 16:51:29 +0200
Message-Id: <8bd9696ea915a4ad08be6d93a4d9565e8d6aa2f3.1560783090.git-series.maxime.ripard@bootlin.com>
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

VGhlIGRybV9jbGllbnRfbW9kZXNldF9jb21taXRfYXRvbWljIGZ1bmN0aW9uIHVzZXMgdHdvIHRp
bWVzIHRoZQpwbGFuZV9zdGF0ZSB2YXJpYWJsZSBpbiBpbm5lciBibG9ja3Mgb2YgY29kZSwgYnV0
IHRoZSB2YXJpYWJsZSBoYXMgYSBzY29wZQpnbG9iYWwgdG8gdGhpcyBmdW5jdGlvbi4KClRoaXMg
d2lsbCBsZWFkIHRvIGluYWR2ZXJ0ZW50IGRldnMgdG8gcmV1c2UgdGhlIHZhcmlhYmxlIGluIHRo
ZSBzZWNvbmQKYmxvY2sgd2l0aCB0aGUgdmFsdWUgbGVmdCBieSB0aGUgZmlyc3QsIHdpdGhvdXQg
YW55IHdhcm5pbmcgZnJvbSB0aGUKY29tcGlsZXIgc2luY2UgdmFsdWUgd291bGQgaGF2ZSBiZWVu
IGluaXRpYWxpemVkLgoKRml4IHRoaXMgYnkgbW92aW5nIHRoZSB2YXJpYWJsZSBkZWNsYXJhdGlv
biB0byB0aGUgcHJvcGVyIHNjb3BlLgoKUmV2aWV3ZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9y
YWxmQHRyb25uZXMub3JnPgpTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlw
YXJkQGJvb3RsaW4uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQu
YyB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudF9tb2Rlc2V0LmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudF9tb2Rlc2V0LmMKaW5kZXggMDA2YmY3MzkwZTdkLi44
MjY0YzNhNzMyYjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVz
ZXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudF9tb2Rlc2V0LmMKQEAgLTg2MSw3
ICs4NjEsNiBAQCBFWFBPUlRfU1lNQk9MKGRybV9jbGllbnRfcGFuZWxfcm90YXRpb24pOwogc3Rh
dGljIGludCBkcm1fY2xpZW50X21vZGVzZXRfY29tbWl0X2F0b21pYyhzdHJ1Y3QgZHJtX2NsaWVu
dF9kZXYgKmNsaWVudCwgYm9vbCBhY3RpdmUpCiB7CiAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9
IGNsaWVudC0+ZGV2OwotCXN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlOwogCXN0
cnVjdCBkcm1fcGxhbmUgKnBsYW5lOwogCXN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZTsK
IAlzdHJ1Y3QgZHJtX21vZGVzZXRfYWNxdWlyZV9jdHggY3R4OwpAQCAtODc5LDYgKzg3OCw4IEBA
IHN0YXRpYyBpbnQgZHJtX2NsaWVudF9tb2Rlc2V0X2NvbW1pdF9hdG9taWMoc3RydWN0IGRybV9j
bGllbnRfZGV2ICpjbGllbnQsIGJvb2wgCiAJc3RhdGUtPmFjcXVpcmVfY3R4ID0gJmN0eDsKIHJl
dHJ5OgogCWRybV9mb3JfZWFjaF9wbGFuZShwbGFuZSwgZGV2KSB7CisJCXN0cnVjdCBkcm1fcGxh
bmVfc3RhdGUgKnBsYW5lX3N0YXRlOworCiAJCXBsYW5lX3N0YXRlID0gZHJtX2F0b21pY19nZXRf
cGxhbmVfc3RhdGUoc3RhdGUsIHBsYW5lKTsKIAkJaWYgKElTX0VSUihwbGFuZV9zdGF0ZSkpIHsK
IAkJCXJldCA9IFBUUl9FUlIocGxhbmVfc3RhdGUpOwpAQCAtOTAxLDYgKzkwMiw4IEBAIHN0YXRp
YyBpbnQgZHJtX2NsaWVudF9tb2Rlc2V0X2NvbW1pdF9hdG9taWMoc3RydWN0IGRybV9jbGllbnRf
ZGV2ICpjbGllbnQsIGJvb2wgCiAJCXVuc2lnbmVkIGludCByb3RhdGlvbjsKIAogCQlpZiAoZHJt
X2NsaWVudF9wYW5lbF9yb3RhdGlvbihtb2RlX3NldCwgJnJvdGF0aW9uKSkgeworCQkJc3RydWN0
IGRybV9wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGU7CisKIAkJCS8qIENhbm5vdCBmYWlsIGFzIHdl
J3ZlIGFscmVhZHkgZ290dGVuIHRoZSBwbGFuZSBzdGF0ZSBhYm92ZSAqLwogCQkJcGxhbmVfc3Rh
dGUgPSBkcm1fYXRvbWljX2dldF9uZXdfcGxhbmVfc3RhdGUoc3RhdGUsIHByaW1hcnkpOwogCQkJ
cGxhbmVfc3RhdGUtPnJvdGF0aW9uID0gcm90YXRpb247Ci0tIApnaXQtc2VyaWVzIDAuOS4xCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
