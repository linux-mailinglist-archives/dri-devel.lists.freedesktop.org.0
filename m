Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F81109C2F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 11:19:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14976E2DE;
	Tue, 26 Nov 2019 10:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7746E2DE
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 10:19:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C5023B05D;
 Tue, 26 Nov 2019 10:19:52 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, john.p.donnelly@oracle.com,
 kraxel@redhat.com, sam@ravnborg.org
Subject: [PATCH v2] drm/mgag200: Add module parameter to pin all buffers at
 offset 0
Date: Tue, 26 Nov 2019 11:19:50 +0100
Message-Id: <20191126101950.11989-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIGhhcmR3YXJlIHRoYXQgZG9lcyBub3QgaW50ZXJwcmV0IHRoZSBzdGFydGFkZCBmaWVsZCBj
b3JyZWN0bHksCmFkZCB0aGUgbW9kdWxlIHBhcmFtZXRlciAnaHdfYnVnX25vX3N0YXJ0YWRkJywg
d2hpY2ggZW5hYmxlcyB0aGUKd29ya2Fyb3VuZC4KCnYyOgoJKiBhc2sgdXNlciBmb3IgZmVlZGJh
Y2sgaWYgdGhlIG9wdGlvbiBpcyBhY3RpdmUKClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBmZndsbC5jaD4KQ2M6IEpvaG4gRG9ubmVsbHkgPGpvaG4ucC5kb25uZWxseUBv
cmFjbGUuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMgfCAx
MyArKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5jCmluZGV4IGQ0Mzk1MWNhZWVhMC4uMjg0ZDU4YWY4
ZDQ1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMKQEAgLTI3LDYgKzI3LDEw
IEBAIGludCBtZ2FnMjAwX21vZGVzZXQgPSAtMTsKIE1PRFVMRV9QQVJNX0RFU0MobW9kZXNldCwg
IkRpc2FibGUvRW5hYmxlIG1vZGVzZXR0aW5nIik7CiBtb2R1bGVfcGFyYW1fbmFtZWQobW9kZXNl
dCwgbWdhZzIwMF9tb2Rlc2V0LCBpbnQsIDA0MDApOwogCitpbnQgbWdhZzIwMF9od19idWdfbm9f
c3RhcnRhZGQgPSAtMTsKK01PRFVMRV9QQVJNX0RFU0MobW9kZXNldCwgIkhXIGRvZXMgbm90IGlu
dGVycHJldCBzY2Fub3V0LWJ1ZmZlciBzdGFydCBhZGRyZXNzIGNvcnJlY3RseSIpOworbW9kdWxl
X3BhcmFtX25hbWVkKGh3X2J1Z19ub19zdGFydGFkZCwgbWdhZzIwMF9od19idWdfbm9fc3RhcnRh
ZGQsIGludCwgMDQwMCk7CisKIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBkcml2ZXI7CiAKIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBwY2lpZGxpc3RbXSA9IHsKQEAgLTY0LDYg
KzY4LDE1IEBAIERFRklORV9EUk1fR0VNX0ZPUFMobWdhZzIwMF9kcml2ZXJfZm9wcyk7CiAKIHN0
YXRpYyBib29sIG1nYWcyMDBfcGluX2JvX2F0XzAoY29uc3Qgc3RydWN0IG1nYV9kZXZpY2UgKm1k
ZXYpCiB7CisJaWYgKG1nYWcyMDBfaHdfYnVnX25vX3N0YXJ0YWRkID4gMCkgeworCQlEUk1fV0FS
Tl9PTkNFKCJPcHRpb24gaHdfYnVnX25vX3N0YXJ0ZWRkIGlzIGVuYWJsZWQuIFBsZWFzZSAiCisJ
CQkgICAgICAicmVwb3J0IHRoZSBvdXRwdXQgb2YgJ2xzcGNpIC12dm5uJyB0byAiCisJCQkgICAg
ICAiPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+IGlmIHRoaXMgIgorCQkJICAgICAg
Im9wdGlvbiBpcyByZXF1aXJlZCB0byBtYWtlIG1nYWcyMDAgd29yayAiCisJCQkgICAgICAiY29y
cmVjdGx5IG9uIHlvdXIgc3lzdGVtLlxuIik7CisJCXJldHVybiB0cnVlOworCX0gZWxzZSBpZiAo
IW1nYWcyMDBfaHdfYnVnX25vX3N0YXJ0YWRkKQorCQlyZXR1cm4gZmFsc2U7CiAJcmV0dXJuIG1k
ZXYtPmZsYWdzICYgTUdBRzIwMF9GTEFHX0hXX0JVR19OT19TVEFSVEFERDsKIH0KIAotLSAKMi4y
My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
