Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB61C1C411
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 09:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23FC189247;
	Tue, 14 May 2019 07:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id B146189E26
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 14:33:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A11A341;
 Mon, 13 May 2019 07:33:08 -0700 (PDT)
Received: from e112269-lin.arm.com (e112269-lin.cambridge.arm.com
 [10.1.196.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E0153F71E;
 Mon, 13 May 2019 07:33:06 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Rob Herring <robh@kernel.org>,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH] drm/panfrost: Use drm_gem_dump_map_offset()
Date: Mon, 13 May 2019 15:32:44 +0100
Message-Id: <20190513143244.16478-1-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 May 2019 07:40:44 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cGFuZnJvc3RfaW9jdGxfbW1hcF9ibygpIGNvbnRhaW5zIGEgcmVpbXBsZW1lbnRhdGlvbiBvZgpk
cm1fZ2VtX2R1bXBfbWFwX29mZnNldCgpIGJ1dCB3aXRoIGEgYnVnIC0gaXQgYWxsb3dzIG1hcHBp
bmcgaW1wb3J0ZWQKb2JqZWN0cyAod2l0aG91dCBnb2luZyB0aHJvdWdoIHRoZSBleHBvcnRlciku
IEZpeCB0aGlzIGJ5IHN3aXRjaGluZyB0bwp1c2UgdGhlIGdlbmVyaWMgZHJtX2dlbV9kdW1wX21h
cF9vZmZzZXQoKSBmdW5jdGlvbiBpbnN0ZWFkIHdoaWNoIGhhcyB0aGUKYm9udXMgb2Ygc2ltcGxp
ZnlpbmcgdGhlIGNvZGUuCgpDQzogQWx5c3NhIFJvc2VuendlaWcgPGFseXNzYUByb3Nlbnp3ZWln
LmlvPgpTaWduZWQtb2ZmLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYyB8IDE2ICsrLS0tLS0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYyBi
L2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYwppbmRleCA5NGIwODE5YWQ1
MGIuLmQwNDgyNTBhZDhhYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3Bh
bmZyb3N0X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYu
YwpAQCAtMjU0LDI2ICsyNTQsMTQgQEAgc3RhdGljIGludCBwYW5mcm9zdF9pb2N0bF9tbWFwX2Jv
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJCSAgICAgIHN0cnVjdCBkcm1f
ZmlsZSAqZmlsZV9wcml2KQogewogCXN0cnVjdCBkcm1fcGFuZnJvc3RfbW1hcF9ibyAqYXJncyA9
IGRhdGE7Ci0Jc3RydWN0IGRybV9nZW1fb2JqZWN0ICpnZW1fb2JqOwotCWludCByZXQ7CiAKIAlp
ZiAoYXJncy0+ZmxhZ3MgIT0gMCkgewogCQlEUk1fSU5GTygidW5rbm93biBtbWFwX2JvIGZsYWdz
OiAlZFxuIiwgYXJncy0+ZmxhZ3MpOwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAKLQlnZW1fb2Jq
ID0gZHJtX2dlbV9vYmplY3RfbG9va3VwKGZpbGVfcHJpdiwgYXJncy0+aGFuZGxlKTsKLQlpZiAo
IWdlbV9vYmopIHsKLQkJRFJNX0RFQlVHKCJGYWlsZWQgdG8gbG9vayB1cCBHRU0gQk8gJWRcbiIs
IGFyZ3MtPmhhbmRsZSk7Ci0JCXJldHVybiAtRU5PRU5UOwotCX0KLQotCXJldCA9IGRybV9nZW1f
Y3JlYXRlX21tYXBfb2Zmc2V0KGdlbV9vYmopOwotCWlmIChyZXQgPT0gMCkKLQkJYXJncy0+b2Zm
c2V0ID0gZHJtX3ZtYV9ub2RlX29mZnNldF9hZGRyKCZnZW1fb2JqLT52bWFfbm9kZSk7Ci0JZHJt
X2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKGdlbV9vYmopOwotCi0JcmV0dXJuIHJldDsKKwlyZXR1
cm4gZHJtX2dlbV9kdW1iX21hcF9vZmZzZXQoZmlsZV9wcml2LCBkZXYsIGFyZ3MtPmhhbmRsZSwK
KwkJCQkgICAgICAgJmFyZ3MtPm9mZnNldCk7CiB9CiAKIHN0YXRpYyBpbnQgcGFuZnJvc3RfaW9j
dGxfZ2V0X2JvX29mZnNldChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
