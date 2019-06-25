Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC2F56434
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CC16E2F7;
	Wed, 26 Jun 2019 08:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A8B6E0C9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 10:24:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 69E98288E1F
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm: Include ddc adapter pointer in struct
 drm_connector
Date: Tue, 25 Jun 2019 12:24:40 +0200
Message-Id: <ef88f682401ae863a91e6c885d83a2756ae20b85.1561458051.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1561458051.git.andrzej.p@collabora.com>
References: <20190625101655.n246vbwtupb4eoyz@shell.armlinux.org.uk>
 <cover.1561458051.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1561458051.git.andrzej.p@collabora.com>
References: <cover.1561458051.git.andrzej.p@collabora.com>
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
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
Cc: linux-samsung-soc@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, David Airlie <airlied@linux.ie>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 kernel@collabora.com, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGdlbmVyaWMgY29kZSB3aGljaCBjcmVhdGVzIHN5bWJvbGljIGxpbmtzIGluIHN5c2ZzLCBw
b2ludGluZyB0byBkZGMKaW50ZXJmYWNlIHVzZWQgYnkgYSBwYXJ0aWN1bGFyIHZpZGVvIG91dHB1
dC4gRm9yIGV4YW1wbGU6CgpscyAtbCAvc3lzL2NsYXNzL2RybS9jYXJkMC1IRE1JLUEtMS9kZGMK
bHJ3eHJ3eHJ3eCAxIHJvb3Qgcm9vdCAwIEp1biAyNCAxMDo0MiAvc3lzL2NsYXNzL2RybS9jYXJk
MC1IRE1JLUEtMS9kZGMgXAoJLT4gLi4vLi4vLi4vLi4vc29jLzEzODgwMDAwLmkyYy9pMmMtMgoK
VGhpcyBtYWtlcyBpdCBlYXN5IGZvciB1c2VyIHRvIGFzc29jaWF0ZSBhIGRpc3BsYXkgd2l0aCBp
dHMgZGRjIGFkYXB0ZXIKYW5kIHVzZSBlLmcuIGRkY3V0aWwgdG8gY29udHJvbCB0aGUgY2hvc2Vu
IG1vbml0b3IuCgpUaGlzIHBhdGNoIGFkZHMgYW4gaTJjX2FkYXB0ZXIgcG9pbnRlciB0byBzdHJ1
Y3QgZHJtX2Nvbm5lY3Rvci4gUGFydGljdWxhcgpkcml2ZXJzIGNhbiB0aGVuIHVzZSBpdCBpbnN0
ZWFkIG9mIHVzaW5nIHRoZWlyIG93biBwcml2YXRlIGluc3RhbmNlLiBJZiBhCmNvbm5lY3RvciBj
b250YWlucyBhIGRkYywgdGhlbiBjcmVhdGUgYSBzeW1ib2xpYyBsaW5rIGluIHN5c2ZzLgoKU2ln
bmVkLW9mZi1ieTogQW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBAY29sbGFib3JhLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMgfCAgNyArKysrKysrCiBpbmNsdWRl
L2RybS9kcm1fY29ubmVjdG9yLmggfCAxMSArKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAx
OCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5jCmluZGV4IGFkMTA4MTBiYzk3Mi4uMjZkMzU5
YjM5Nzg1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9zeXNmcy5jCkBAIC0yOTQsNiArMjk0LDkgQEAgaW50IGRybV9zeXNm
c19jb25uZWN0b3JfYWRkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiAJLyogTGV0
IHVzZXJzcGFjZSBrbm93IHdlIGhhdmUgYSBuZXcgY29ubmVjdG9yICovCiAJZHJtX3N5c2ZzX2hv
dHBsdWdfZXZlbnQoZGV2KTsKIAorCWlmIChjb25uZWN0b3ItPmRkYykKKwkJcmV0dXJuIHN5c2Zz
X2NyZWF0ZV9saW5rKCZjb25uZWN0b3ItPmtkZXYtPmtvYmosCisJCQkJICZjb25uZWN0b3ItPmRk
Yy0+ZGV2LmtvYmosICJkZGMiKTsKIAlyZXR1cm4gMDsKIH0KIApAQCAtMzAxLDYgKzMwNCwxMCBA
QCB2b2lkIGRybV9zeXNmc19jb25uZWN0b3JfcmVtb3ZlKHN0cnVjdCBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3IpCiB7CiAJaWYgKCFjb25uZWN0b3ItPmtkZXYpCiAJCXJldHVybjsKKworCWlmIChj
b25uZWN0b3ItPmRkYykKKwkJc3lzZnNfcmVtb3ZlX2xpbmsoJmNvbm5lY3Rvci0+a2Rldi0+a29i
aiwgImRkYyIpOworCiAJRFJNX0RFQlVHKCJyZW1vdmluZyBcIiVzXCIgZnJvbSBzeXNmc1xuIiwK
IAkJICBjb25uZWN0b3ItPm5hbWUpOwogCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fY29u
bmVjdG9yLmggYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKaW5kZXggY2E3NDVkOWZlYWY1
Li4xYWQzZDFkNTRiYTcgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAor
KysgYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKQEAgLTIzLDYgKzIzLDcgQEAKICNpZm5k
ZWYgX19EUk1fQ09OTkVDVE9SX0hfXwogI2RlZmluZSBfX0RSTV9DT05ORUNUT1JfSF9fCiAKKyNp
bmNsdWRlIDxsaW51eC9pMmMuaD4KICNpbmNsdWRlIDxsaW51eC9saXN0Lmg+CiAjaW5jbHVkZSA8
bGludXgvbGxpc3QuaD4KICNpbmNsdWRlIDxsaW51eC9jdHlwZS5oPgpAQCAtMTMwOCw2ICsxMzA5
LDE2IEBAIHN0cnVjdCBkcm1fY29ubmVjdG9yIHsKIAkgKiBbMF06IHByb2dyZXNzaXZlLCBbMV06
IGludGVybGFjZWQKIAkgKi8KIAlpbnQgYXVkaW9fbGF0ZW5jeVsyXTsKKworCS8qKgorCSAqIEBk
ZGM6IGFzc29jaWF0ZWQgZGRjIGFkYXB0ZXIuCisJICogQSBjb25uZWN0b3IgdXN1YWxseSBoYXMg
aXRzIGFzc29jaWF0ZWQgZGRjIGFkYXB0ZXIuIElmIGEgZHJpdmVyIHVzZXMKKwkgKiB0aGlzIGZp
ZWxkLCB0aGVuIGFuIGFwcHJvcHJpYXRlIHN5bWJvbGljIGxpbmsgaXMgY3JlYXRlZCBpbiBjb25u
ZWN0b3IKKwkgKiBzeXNmcyBkaXJlY3RvcnkgdG8gbWFrZSBpdCBlYXN5IGZvciB0aGUgdXNlciB0
byB0ZWxsIHdoaWNoIGkyYworCSAqIGFkYXB0ZXIgaXMgZm9yIGEgcGFydGljdWxhciBkaXNwbGF5
LgorCSAqLworCXN0cnVjdCBpMmNfYWRhcHRlciAqZGRjOworCiAJLyoqCiAJICogQG51bGxfZWRp
ZF9jb3VudGVyOiB0cmFjayBzaW5rcyB0aGF0IGdpdmUgdXMgYWxsIHplcm9zIGZvciB0aGUgRURJ
RC4KIAkgKiBOZWVkZWQgdG8gd29ya2Fyb3VuZCBzb21lIEhXIGJ1Z3Mgd2hlcmUgd2UgZ2V0IGFs
bCAwcwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
