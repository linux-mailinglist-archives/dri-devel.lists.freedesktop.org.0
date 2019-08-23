Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A51379C6CD
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5674789A88;
	Mon, 26 Aug 2019 00:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net
 [194.109.24.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF92189CC9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 11:24:33 +0000 (UTC)
Received: from tschai.fritz.box ([46.9.232.237])
 by smtp-cloud7.xs4all.net with ESMTPA
 id 17gBikVExThuu17gFiolqX; Fri, 23 Aug 2019 13:24:32 +0200
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCH 1/3] drm/vc4/vc4_hdmi: fill in connector info
Date: Fri, 23 Aug 2019 13:24:25 +0200
Message-Id: <20190823112427.42394-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190823112427.42394-1-hverkuil-cisco@xs4all.nl>
References: <20190823112427.42394-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfGFE4NH+mS+hq0jRHj36UTNmU2gUS9qgz/Zv1ssR/aVMa28g+KX37hJzsioRxyHt8cEQkJqR3qQh1lNbVV9tOxb2Au9FsG2kPqdWTym8oD4X8g+dh8ts
 ln5rZ72YV6saavbgYlGUQvtHyTUJkflvXjT3BmHR65XXlIxXbPtedf3YN7sLBUEfuz8CC6FTUSevvNvexNhjQ15wxxBiw47W5QUeRMf7zD4VgezlydfMAOaF
 yXBp5bw2wHsjSAhYaSlGFr+MCR2UmmGb0bfxEp1M8DicDLB4gTN04uUC8t25zOhRJxuhbb527b3/IHvmI2qXjlCRCK3s5oIRV0pr9Lq8ZODN6HtuMyasXp9m
 n80GWpkI8Ou5lZcutrZitM9wRMuco2aH4eXXvN5AvGnJS4z3/QYQuuuZAhuRb/mwLpInhTwIHOkhvJFLIQwDC9t6bKjuFg==
X-Mailman-Approved-At: Mon, 26 Aug 2019 00:18:57 +0000
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGFyaXVzeiBNYXJjaW5raWV3aWN6IDxkYXJla21AZ29vZ2xlLmNvbT4KCkZpbGwgaW4g
dGhlIGNvbm5lY3RvciBpbmZvLCBhbGxvd2luZyB1c2Vyc3BhY2UgdG8gYXNzb2NpYXRlCnRoZSBD
RUMgZGV2aWNlIHdpdGggdGhlIGRybSBjb25uZWN0b3IuCgpUZXN0ZWQgb24gYSBSYXNwYmVycnkg
UGkgM0IuCgpTaWduZWQtb2ZmLWJ5OiBEYXJpdXN6IE1hcmNpbmtpZXdpY3ogPGRhcmVrbUBnb29n
bGUuY29tPgpTaWduZWQtb2ZmLWJ5OiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsLWNpc2NvQHhzNGFs
bC5ubD4KVGVzdGVkLWJ5OiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsLWNpc2NvQHhzNGFsbC5ubD4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMgfCAxMyArKysrKysrKystLS0tCiAx
IGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS92YzQv
dmM0X2hkbWkuYwppbmRleCBlZTdkNGU3YjBlZTMuLjA4NTNiOTgwYmNiMyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92YzQv
dmM0X2hkbWkuYwpAQCAtMTI4NSw2ICsxMjg1LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjZWNf
YWRhcF9vcHMgdmM0X2hkbWlfY2VjX2FkYXBfb3BzID0gewogCiBzdGF0aWMgaW50IHZjNF9oZG1p
X2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsIHZvaWQgKmRh
dGEpCiB7CisjaWZkZWYgQ09ORklHX0RSTV9WQzRfSERNSV9DRUMKKwlzdHJ1Y3QgY2VjX2Nvbm5l
Y3Rvcl9pbmZvIGNvbm5faW5mbzsKKyNlbmRpZgogCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYgPSB0b19wbGF0Zm9ybV9kZXZpY2UoZGV2KTsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtID0g
ZGV2X2dldF9kcnZkYXRhKG1hc3Rlcik7CiAJc3RydWN0IHZjNF9kZXYgKnZjNCA9IGRybS0+ZGV2
X3ByaXZhdGU7CkBAIC0xNDAzLDEzICsxNDA2LDE1IEBAIHN0YXRpYyBpbnQgdmM0X2hkbWlfYmlu
ZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkK
ICNpZmRlZiBDT05GSUdfRFJNX1ZDNF9IRE1JX0NFQwogCWhkbWktPmNlY19hZGFwID0gY2VjX2Fs
bG9jYXRlX2FkYXB0ZXIoJnZjNF9oZG1pX2NlY19hZGFwX29wcywKIAkJCQkJICAgICAgdmM0LCAi
dmM0IiwKLQkJCQkJICAgICAgQ0VDX0NBUF9UUkFOU01JVCB8Ci0JCQkJCSAgICAgIENFQ19DQVBf
TE9HX0FERFJTIHwKLQkJCQkJICAgICAgQ0VDX0NBUF9QQVNTVEhST1VHSCB8Ci0JCQkJCSAgICAg
IENFQ19DQVBfUkMsIDEpOworCQkJCQkgICAgICBDRUNfQ0FQX0RFRkFVTFRTIHwKKwkJCQkJICAg
ICAgQ0VDX0NBUF9DT05ORUNUT1JfSU5GTywgMSk7CiAJcmV0ID0gUFRSX0VSUl9PUl9aRVJPKGhk
bWktPmNlY19hZGFwKTsKIAlpZiAocmV0IDwgMCkKIAkJZ290byBlcnJfZGVzdHJveV9jb25uOwor
CisJY2VjX2ZpbGxfY29ubl9pbmZvX2Zyb21fZHJtKCZjb25uX2luZm8sIGhkbWktPmNvbm5lY3Rv
cik7CisJY2VjX3NfY29ubl9pbmZvKGhkbWktPmNlY19hZGFwLCAmY29ubl9pbmZvKTsKKwogCUhE
TUlfV1JJVEUoVkM0X0hETUlfQ1BVX01BU0tfU0VULCAweGZmZmZmZmZmKTsKIAl2YWx1ZSA9IEhE
TUlfUkVBRChWQzRfSERNSV9DRUNfQ05UUkxfMSk7CiAJdmFsdWUgJj0gflZDNF9IRE1JX0NFQ19E
SVZfQ0xLX0NOVF9NQVNLOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
