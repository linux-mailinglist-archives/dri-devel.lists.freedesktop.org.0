Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 610615246B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B7089FEA;
	Tue, 25 Jun 2019 07:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net
 [194.109.24.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E9289CD3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 16:10:47 +0000 (UTC)
Received: from tschai.fritz.box ([46.9.252.75])
 by smtp-cloud7.xs4all.net with ESMTPA
 id fRRKhHRxHF85OfRRVhZacp; Mon, 24 Jun 2019 18:03:41 +0200
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCHv8 13/13] drm/vc4/vc4_hdmi: fill in connector info
Date: Mon, 24 Jun 2019 18:03:30 +0200
Message-Id: <20190624160330.38048-14-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
References: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfOIEYMngRDIwgK74lnlvOXIt+9xy5ZfdkyY50fEwdUfHLW3a6HQUX9qOjaoewFZqmrrw97CMmILYvYcruHFXffRTdMS8h1EKdAXjyCM+KJiPP3i3kA/l
 qbLIqY3uC0qPtLV/o7kL0awPNFc9OKys1ntf6O23b4W7fj04WjYHw2DGvGepT6Wik/vmWq4BwiW315yaB2gGUOKXRc8N0MHw9k57P8wa91Rnj6J8J37y2RfB
 SONLuSvtwaGLT4XJDRjRQQmP0X9/oh3fYjonz8QEg5cTYANXwxJc9mU2sj2fXQYYNde+ac6na/uTLAwU7nBVKiVT2g5DREcVczC7BpIllgQ=
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
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
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dariusz Marcinkiewicz <darekm@google.com>, dri-devel@lists.freedesktop.org,
 Cheng-yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGFyaXVzeiBNYXJjaW5raWV3aWN6IDxkYXJla21AZ29vZ2xlLmNvbT4KCkZpbGwgaW4g
dGhlIGNvbm5lY3RvciBpbmZvLCBhbGxvd2luZyB1c2Vyc3BhY2UgdG8gYXNzb2NpYXRlCnRoZSBD
RUMgZGV2aWNlIHdpdGggdGhlIGRybSBjb25uZWN0b3IuCgpTaWduZWQtb2ZmLWJ5OiBEYXJpdXN6
IE1hcmNpbmtpZXdpY3ogPGRhcmVrbUBnb29nbGUuY29tPgpTaWduZWQtb2ZmLWJ5OiBIYW5zIFZl
cmt1aWwgPGh2ZXJrdWlsLWNpc2NvQHhzNGFsbC5ubD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmM0
L3ZjNF9oZG1pLmMgfCAxMyArKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92YzQv
dmM0X2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYwppbmRleCA5OWZjODU2
OWUwZjUuLmE5OThiYjM1YjM3NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRf
aGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYwpAQCAtMTI3OSw2ICsx
Mjc5LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjZWNfYWRhcF9vcHMgdmM0X2hkbWlfY2VjX2Fk
YXBfb3BzID0gewogCiBzdGF0aWMgaW50IHZjNF9oZG1pX2JpbmQoc3RydWN0IGRldmljZSAqZGV2
LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsIHZvaWQgKmRhdGEpCiB7CisjaWZkZWYgQ09ORklHX0RS
TV9WQzRfSERNSV9DRUMKKwlzdHJ1Y3QgY2VjX2Nvbm5lY3Rvcl9pbmZvIGNvbm5faW5mbzsKKyNl
bmRpZgogCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYgPSB0b19wbGF0Zm9ybV9kZXZpY2Uo
ZGV2KTsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtID0gZGV2X2dldF9kcnZkYXRhKG1hc3Rlcik7
CiAJc3RydWN0IHZjNF9kZXYgKnZjNCA9IGRybS0+ZGV2X3ByaXZhdGU7CkBAIC0xMzk3LDEzICsx
NDAwLDE1IEBAIHN0YXRpYyBpbnQgdmM0X2hkbWlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0
cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkKICNpZmRlZiBDT05GSUdfRFJNX1ZDNF9I
RE1JX0NFQwogCWhkbWktPmNlY19hZGFwID0gY2VjX2FsbG9jYXRlX2FkYXB0ZXIoJnZjNF9oZG1p
X2NlY19hZGFwX29wcywKIAkJCQkJICAgICAgdmM0LCAidmM0IiwKLQkJCQkJICAgICAgQ0VDX0NB
UF9UUkFOU01JVCB8Ci0JCQkJCSAgICAgIENFQ19DQVBfTE9HX0FERFJTIHwKLQkJCQkJICAgICAg
Q0VDX0NBUF9QQVNTVEhST1VHSCB8Ci0JCQkJCSAgICAgIENFQ19DQVBfUkMsIDEpOworCQkJCQkg
ICAgICBDRUNfQ0FQX0RFRkFVTFRTIHwKKwkJCQkJICAgICAgQ0VDX0NBUF9DT05ORUNUT1JfSU5G
TywgMSk7CiAJcmV0ID0gUFRSX0VSUl9PUl9aRVJPKGhkbWktPmNlY19hZGFwKTsKIAlpZiAocmV0
IDwgMCkKIAkJZ290byBlcnJfZGVzdHJveV9jb25uOworCisJY2VjX2ZpbGxfY29ubl9pbmZvX2Zy
b21fZHJtKCZjb25uX2luZm8sIGhkbWktPmNvbm5lY3Rvcik7CisJY2VjX3NfY29ubl9pbmZvKGhk
bWktPmNlY19hZGFwLCAmY29ubl9pbmZvKTsKKwogCUhETUlfV1JJVEUoVkM0X0hETUlfQ1BVX01B
U0tfU0VULCAweGZmZmZmZmZmKTsKIAl2YWx1ZSA9IEhETUlfUkVBRChWQzRfSERNSV9DRUNfQ05U
UkxfMSk7CiAJdmFsdWUgJj0gflZDNF9IRE1JX0NFQ19ESVZfQ0xLX0NOVF9NQVNLOwotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
