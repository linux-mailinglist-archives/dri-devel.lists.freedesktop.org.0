Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED012862EA
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 18:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDF86E93E;
	Wed,  7 Oct 2020 16:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5AE6E93C;
 Wed,  7 Oct 2020 16:00:14 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E79C920789;
 Wed,  7 Oct 2020 16:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602086414;
 bh=l3rN8L44AMXr0k7n8yBVUG4uvWHnJ/3s48bP7J/pDdA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=futr1neV1dsv3jHdiLh1vpEzXiG5oXcmHbYybFfRUz0UPxrOsEWnZtrTEchFAHpMt
 xXypdeA5y1TSOM5hLcbs+4mhkmNkjQn3qbY6ZC3Q9pp7fyUUK1wxlagCkJRjPnPRtT
 4G86bvPmwJSjQjD8A3TPfTMGzNm6N6J9rPwdkiKU=
Date: Wed, 7 Oct 2020 11:06:14 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 06/14] drm/amd/pm: Replace one-element array with
 flexible-array in struct phm_phase_shedding_limits_table
Message-ID: <c3584841a052b031fe9dd963b5d6effe65aae640.1602020074.git.gustavoars@kernel.org>
References: <cover.1602020074.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1602020074.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, amd-gfx@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUgaXMgYSByZWd1bGFyIG5lZWQgaW4gdGhlIGtlcm5lbCB0byBwcm92aWRlIGEgd2F5IHRv
IGRlY2xhcmUgaGF2aW5nCmEgZHluYW1pY2FsbHkgc2l6ZWQgc2V0IG9mIHRyYWlsaW5nIGVsZW1l
bnRzIGluIGEgc3RydWN0dXJlLiBLZXJuZWwgY29kZQpzaG91bGQgYWx3YXlzIHVzZSDigJxmbGV4
aWJsZSBhcnJheSBtZW1iZXJz4oCdWzFdIGZvciB0aGVzZSBjYXNlcy4gVGhlIG9sZGVyCnN0eWxl
IG9mIG9uZS1lbGVtZW50IG9yIHplcm8tbGVuZ3RoIGFycmF5cyBzaG91bGQgbm8gbG9uZ2VyIGJl
IHVzZWRbMl0uCgpSZWZhY3RvciB0aGUgY29kZSBhY2NvcmRpbmcgdG8gdGhlIHVzZSBvZiBhIGZs
ZXhpYmxlLWFycmF5IG1lbWJlciBpbgpzdHJ1Y3QgcGhtX3BoYXNlX3NoZWRkaW5nX2xpbWl0c190
YWJsZSwgaW5zdGVhZCBvZiBhIG9uZS1lbGVtZW50IGFycmF5LAphbmQgdXNlIHRoZSBzdHJ1Y3Rf
c2l6ZSgpIGhlbHBlciB0byBjYWxjdWxhdGUgdGhlIHNpemUgZm9yIHRoZSBhbGxvY2F0aW9uLgoK
QWxzbywgc2F2ZSBzb21lIGhlYXAgc3BhY2UgYXMgdGhlIG9yaWdpbmFsIGNvZGUgaXMgbXVsdGlw
bHlpbmcKcHRhYmxlLT51Y051bUVudHJpZXMgYnkgc2l6ZW9mKHN0cnVjdCBwaG1fcGhhc2Vfc2hl
ZGRpbmdfbGltaXRzX3RhYmxlKQp3aGVuIGl0IHNob3VsZCBoYXZlIG11bHRpcGxpZWQgaXQgYnkg
c2l6ZW9mKHN0cnVjdCBwaG1fcGhhc2Vfc2hlZGRpbmdfbGltaXRzX3JlY29yZCkKaW5zdGVhZC4K
ClsxXSBodHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9GbGV4aWJsZV9hcnJheV9tZW1iZXIK
WzJdIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvdjUuOS1yYzEvcHJvY2Vzcy9kZXBy
ZWNhdGVkLmh0bWwjemVyby1sZW5ndGgtYW5kLW9uZS1lbGVtZW50LWFycmF5cwoKQnVpbGQtdGVz
dGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KTGluazogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGttbC81ZjdjNWQzNi42UFN0VVpwMkhSeEF6N0lNJTI1bGtwQGludGVs
LmNvbS8KU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b2Fyc0BrZXJu
ZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vaW5jL2h3bWdyLmggICAgICAgICAg
ICAgICAgICAgfCAgMiArLQogLi4uL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9wcm9j
ZXNzcHB0YWJsZXMuYyB8IDEyICsrKystLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wbS9pbmMvaHdtZ3IuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vaW5jL2h3bWdyLmgKaW5k
ZXggMzYxY2IxMTI1MzUxLi5hZDYxNGUzMjA3OWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG0vaW5jL2h3bWdyLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9pbmMvaHdt
Z3IuaApAQCAtMTYxLDcgKzE2MSw3IEBAIHN0cnVjdCBwaG1fdmNlX2Nsb2NrX3ZvbHRhZ2VfZGVw
ZW5kZW5jeV9yZWNvcmQgewogCiBzdHJ1Y3QgcGhtX3BoYXNlX3NoZWRkaW5nX2xpbWl0c190YWJs
ZSB7CiAJdWludDMyX3QgICAgICAgICAgICAgICAgICAgICAgICAgICBjb3VudDsKLQlzdHJ1Y3Qg
cGhtX3BoYXNlX3NoZWRkaW5nX2xpbWl0c19yZWNvcmQgIGVudHJpZXNbMV07CisJc3RydWN0IHBo
bV9waGFzZV9zaGVkZGluZ19saW1pdHNfcmVjb3JkICBlbnRyaWVzW107CiB9OwogCiBzdHJ1Y3Qg
cGhtX3ZjZWNsb2NrX3ZvbHRhZ2VfZGVwZW5kZW5jeV90YWJsZSB7CmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9wcm9jZXNzcHB0YWJsZXMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3Byb2Nlc3NwcHRhYmxlcy5jCmlu
ZGV4IGExYjE5ODA0NTk3OC4uYjJlZjc2NTgwYzZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9wcm9jZXNzcHB0YWJsZXMuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9wcm9jZXNzcHB0YWJsZXMuYwpAQCAtMTUz
MCwxNiArMTUzMCwxMiBAQCBzdGF0aWMgaW50IGluaXRfcGhhc2Vfc2hlZGRpbmdfdGFibGUoc3Ry
dWN0IHBwX2h3bWdyICpod21nciwKIAkJCQkoKCh1bnNpZ25lZCBsb25nKXBvd2VycGxheV90YWJs
ZTQpICsKIAkJCQlsZTE2X3RvX2NwdShwb3dlcnBsYXlfdGFibGU0LT51c1ZkZGNQaGFzZVNoZWRM
aW1pdHNUYWJsZU9mZnNldCkpOwogCQkJc3RydWN0IHBobV9waGFzZV9zaGVkZGluZ19saW1pdHNf
dGFibGUgKnRhYmxlOwotCQkJdW5zaWduZWQgbG9uZyBzaXplLCBpOworCQkJdW5zaWduZWQgbG9u
ZyBpOwogCiAKLQkJCXNpemUgPSBzaXplb2YodW5zaWduZWQgbG9uZykgKwotCQkJCShzaXplb2Yo
c3RydWN0IHBobV9waGFzZV9zaGVkZGluZ19saW1pdHNfdGFibGUpICoKLQkJCQlwdGFibGUtPnVj
TnVtRW50cmllcyk7Ci0KLQkJCXRhYmxlID0ga3phbGxvYyhzaXplLCBHRlBfS0VSTkVMKTsKLQot
CQkJaWYgKHRhYmxlID09IE5VTEwpCisJCQl0YWJsZSA9IGt6YWxsb2Moc3RydWN0X3NpemUodGFi
bGUsIGVudHJpZXMsIHB0YWJsZS0+dWNOdW1FbnRyaWVzKSwKKwkJCQkJR0ZQX0tFUk5FTCk7CisJ
CQlpZiAoIXRhYmxlKQogCQkJCXJldHVybiAtRU5PTUVNOwogCiAJCQl0YWJsZS0+Y291bnQgPSAo
dW5zaWduZWQgbG9uZylwdGFibGUtPnVjTnVtRW50cmllczsKLS0gCjIuMjcuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
