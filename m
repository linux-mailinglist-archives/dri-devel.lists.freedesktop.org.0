Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E49FA1FB43D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 16:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED83B6E8D5;
	Tue, 16 Jun 2020 14:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADFC6E8D5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 14:26:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5F062ABE4;
 Tue, 16 Jun 2020 14:26:49 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, emil.velikov@collabora.com,
 sam@ravnborg.org, kraxel@redhat.com, rong.a.chen@intel.com
Subject: [PATCH] drm/mgag200: Don't set <rammapen> in MISC
Date: Tue, 16 Jun 2020 16:26:30 +0200
Message-Id: <20200616142630.20129-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: John Donnelly <john.p.donnelly@Oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG9yaWdpbmFsIG1vZGVzZXR0aW5nIGNvZGUgc2V0IE1JU0MgdG8gMHgyZCwgd2hpY2ggaXMg
PGhwZ29kZGV2PiwKPGNsa3NlbD4gYW5kIDxpb2FkZHNlbD4KCldpdGggdGhlIGNvbnZlcnNpb24g
dG8gYXRvbWljIG1vZGVzZXR0aW5nLCA8cmFtbWFwZW4+IGFjY2lkZW50YWxseQpnb3QgZW5hYmxl
ZCBhcyB3ZWxsLiBSZXZlcnQgdGhpcyBjaGFuZ2UgYW5kIGluaXRpYWxpemUgTUlTQyB3aXRoIGEK
Y29uc3RhbnQgdmFsdWUgb2YgPGhnb2RkZXY+IGFuZCA8aW9hZGRzZWw+LiBUaGUgPGNsa3NlbD4g
Yml0cyBhcmUgc2V0CmluIG1nYV9jcnRjX3NldF9wbGxzKCksIHN5bmMgZmxhZ3MgYXJlIHNldCBp
biBtZ2FnMjAwX3NldF9tb2RlX3JlZ3MoKS4KCldoaWxlIGF0IGl0LCBhbHNvIHJlbmFtZSB0aGUg
ZmxhZyBjb25zdGFudCB0byBtYXRjaCB0aGUgbmFtZWluZyBpbgp0aGUgTUdBIFByb2dyYW1taW5n
IE1hbnVhbC4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPgpSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPHJvbmcuYS5jaGVuQGludGVs
LmNvbT4KU3VnZ2VzdGVkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxpa292QGdtYWlsLmNv
bT4KRml4ZXM6IGRiMDVmOGQzZGM4NyAoImRybS9tZ2FnMjAwOiBTcGxpdCBNSVNDIHJlZ2lzdGVy
IHVwZGF0ZSBpbnRvIFBMTCBzZWxlY3Rpb24sIFNZTkMgYW5kIEkvTyIpCkNjOiBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5i
b3JnLm9yZz4KQ2M6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+CkNj
OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBmZndsbC5jaD4KQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29t
PgpDYzogIkpvc8OpIFJvYmVydG8gZGUgU291emEiIDxqb3NlLnNvdXphQGludGVsLmNvbT4KQ2M6
IEFuZHJ6ZWogUGlldHJhc2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9yYS5jb20+CkNjOiBSb25n
IENoZW4gPHJvbmcuYS5jaGVuQGludGVsLmNvbT4KQ2M6IEpvaG4gRG9ubmVsbHkgPGpvaG4ucC5k
b25uZWxseUBPcmFjbGUuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBf
bW9kZS5jIHwgNiArKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfcmVnLmgg
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMgYi9k
cml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYwppbmRleCBmMTZiZDI3OGFiN2U0
Li4zYjcyMzViZDBiY2JhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2Fn
MjAwX21vZGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYwpA
QCAtMTAxOCwxMCArMTAxOCw4IEBAIHN0YXRpYyB2b2lkIG1nYWcyMDBfaW5pdF9yZWdzKHN0cnVj
dCBtZ2FfZGV2aWNlICptZGV2KQogCWlmIChtZGV2LT50eXBlID09IEcyMDBfRVczKQogCQlXUkVH
X0VDUlQoMHgzNCwgMHg1KTsKIAotCW1pc2MgPSBSUkVHOChNR0FfTUlTQ19JTik7Ci0JbWlzYyB8
PSBNR0FSRUdfTUlTQ19JT0FEU0VMIHwKLQkJTUdBUkVHX01JU0NfUkFNTUFQRU4gfAotCQlNR0FS
RUdfTUlTQ19ISUdIX1BHX1NFTDsKKwltaXNjID0gTUdBUkVHX01JU0NfSFBHT0RERVYgfAorCSAg
ICAgICBNR0FSRUdfTUlTQ19JT0FEU0VMOwogCVdSRUc4KE1HQV9NSVNDX09VVCwgbWlzYyk7CiB9
CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfcmVnLmggYi9k
cml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX3JlZy5oCmluZGV4IDI5ZjcxOTRmYWFkYzAu
LmY2NjI5ZTBkNGJkZjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcy
MDBfcmVnLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9yZWcuaApAQCAt
MjI4LDcgKzIyOCw3IEBACiAjZGVmaW5lIE1HQVJFR19NSVNDX0NMS19TRUxfTUdBX1BJWAkoMHgy
IDw8IDIpCiAjZGVmaW5lIE1HQVJFR19NSVNDX0NMS19TRUxfTUdBX01TSwkoMHgzIDw8IDIpCiAj
ZGVmaW5lIE1HQVJFR19NSVNDX1ZJREVPX0RJUwkoMHgxIDw8IDQpCi0jZGVmaW5lIE1HQVJFR19N
SVNDX0hJR0hfUEdfU0VMCSgweDEgPDwgNSkKKyNkZWZpbmUgTUdBUkVHX01JU0NfSFBHT0RERVYJ
CUJJVCg1KQogI2RlZmluZSBNR0FSRUdfTUlTQ19IU1lOQ1BPTAkJQklUKDYpCiAjZGVmaW5lIE1H
QVJFR19NSVNDX1ZTWU5DUE9MCQlCSVQoNykKIAotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
