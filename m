Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9380D1299A
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 10:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC8189885;
	Fri,  3 May 2019 08:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8599289885
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 08:13:10 +0000 (UTC)
X-Originating-IP: 90.88.149.145
Received: from localhost.localdomain
 (aaubervilliers-681-1-29-145.w90-88.abo.wanadoo.fr [90.88.149.145])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id CA50E2000C;
 Fri,  3 May 2019 08:13:06 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/4] drm/vc4: Reformat and the binner bo allocation helper
Date: Fri,  3 May 2019 10:12:39 +0200
Message-Id: <20190503081242.29039-2-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190503081242.29039-1-paul.kocialkowski@bootlin.com>
References: <20190503081242.29039-1-paul.kocialkowski@bootlin.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Eben Upton <eben@raspberrypi.org>, David Airlie <airlied@linux.ie>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gcHJlcGFyYXRpb24gZm9yIHdyYXBwaW5nIHRoZSBiaW5uZXIgYm8gYWxsb2NhdGlvbiBoZWxw
ZXIgd2l0aApwdXQvZ2V0IGhlbHBlcnMsIHBhc3MgdGhlIHZjNCBkZXYgZGlyZWN0bHkgYW5kIGRy
b3AgdGhlIHZjNCBwcmVmaXguCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIEtvY2lhbGtvd3NraSA8cGF1
bC5rb2NpYWxrb3dza2lAYm9vdGxpbi5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRf
djNkLmMgfCAxMSArKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
NiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF92M2Qu
YyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3YzZC5jCmluZGV4IGE0YjY4NTllM2FmNi4uN2M0
OTAxMDZlMTg1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF92M2QuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF92M2QuYwpAQCAtMjEzLDcgKzIxMyw3IEBAIGludCB2
YzRfdjNkX2dldF9iaW5fc2xvdChzdHJ1Y3QgdmM0X2RldiAqdmM0KQogfQogCiAvKioKLSAqIHZj
NF9hbGxvY2F0ZV9iaW5fYm8oKSAtIGFsbG9jYXRlcyB0aGUgbWVtb3J5IHRoYXQgd2lsbCBiZSB1
c2VkIGZvcgorICogYmluX2JvX2FsbG9jKCkgLSBhbGxvY2F0ZXMgdGhlIG1lbW9yeSB0aGF0IHdp
bGwgYmUgdXNlZCBmb3IKICAqIHRpbGUgYmlubmluZy4KICAqCiAgKiBUaGUgYmlubmVyIGhhcyBh
IGxpbWl0YXRpb24gdGhhdCB0aGUgYWRkcmVzc2VzIGluIHRoZSB0aWxlIHN0YXRlCkBAIC0yMzQs
OSArMjM0LDggQEAgaW50IHZjNF92M2RfZ2V0X2Jpbl9zbG90KHN0cnVjdCB2YzRfZGV2ICp2YzQp
CiAgKiBvdmVyYWxsIENNQSBwb29sIGJlZm9yZSB0aGV5IG1ha2Ugc2NlbmVzIGNvbXBsaWNhdGVk
IGVub3VnaCB0byBydW4KICAqIG91dCBvZiBiaW4gc3BhY2UuCiAgKi8KLXN0YXRpYyBpbnQgdmM0
X2FsbG9jYXRlX2Jpbl9ibyhzdHJ1Y3QgZHJtX2RldmljZSAqZHJtKQorc3RhdGljIGludCBiaW5f
Ym9fYWxsb2Moc3RydWN0IHZjNF9kZXYgKnZjNCkKIHsKLQlzdHJ1Y3QgdmM0X2RldiAqdmM0ID0g
dG9fdmM0X2Rldihkcm0pOwogCXN0cnVjdCB2YzRfdjNkICp2M2QgPSB2YzQtPnYzZDsKIAl1aW50
MzJfdCBzaXplID0gMTYgKiAxMDI0ICogMTAyNDsKIAlpbnQgcmV0ID0gMDsKQEAgLTI1MSw3ICsy
NTAsNyBAQCBzdGF0aWMgaW50IHZjNF9hbGxvY2F0ZV9iaW5fYm8oc3RydWN0IGRybV9kZXZpY2Ug
KmRybSkKIAlJTklUX0xJU1RfSEVBRCgmbGlzdCk7CiAKIAl3aGlsZSAodHJ1ZSkgewotCQlzdHJ1
Y3QgdmM0X2JvICpibyA9IHZjNF9ib19jcmVhdGUoZHJtLCBzaXplLCB0cnVlLAorCQlzdHJ1Y3Qg
dmM0X2JvICpibyA9IHZjNF9ib19jcmVhdGUodmM0LT5kZXYsIHNpemUsIHRydWUsCiAJCQkJCQkg
IFZDNF9CT19UWVBFX0JJTik7CiAKIAkJaWYgKElTX0VSUihibykpIHsKQEAgLTMzMyw3ICszMzIs
NyBAQCBzdGF0aWMgaW50IHZjNF92M2RfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2
KQogCXN0cnVjdCB2YzRfZGV2ICp2YzQgPSB2M2QtPnZjNDsKIAlpbnQgcmV0OwogCi0JcmV0ID0g
dmM0X2FsbG9jYXRlX2Jpbl9ibyh2YzQtPmRldik7CisJcmV0ID0gYmluX2JvX2FsbG9jKHZjNCk7
CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIApAQCAtNDAzLDcgKzQwMiw3IEBAIHN0YXRpYyBp
bnQgdmM0X3YzZF9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVy
LCB2b2lkICpkYXRhKQogCWlmIChyZXQgIT0gMCkKIAkJcmV0dXJuIHJldDsKIAotCXJldCA9IHZj
NF9hbGxvY2F0ZV9iaW5fYm8oZHJtKTsKKwlyZXQgPSBiaW5fYm9fYWxsb2ModmM0KTsKIAlpZiAo
cmV0KSB7CiAJCWNsa19kaXNhYmxlX3VucHJlcGFyZSh2M2QtPmNsayk7CiAJCXJldHVybiByZXQ7
Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
