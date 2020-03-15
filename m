Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32836186079
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 00:19:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1756E2ED;
	Sun, 15 Mar 2020 23:19:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B166E102
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 04:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=IqXEYpa5QgkSb9VlNMgtVjJmY+6NusNQBweUhfnvqp0=; b=st8Z+DASEhH4MF2YEy3O7Q3W6m
 ieV0AF3sEphRQ+YXwVyizUW9BSHyPlTmuG/DzO7MH8nomb+B1zTjDCZSwMvkiLS8Mk8RkVNdAQ71p
 V7luiwLAvDw+HuTGnjQmE4H/c2kXZjO/pcQf7bj3blBtaJ0yp7vpys1hzD45B1/Ck00vNmgzY0Bt6
 yafwZtkt191zuX5YXonoA3ibN5E/NwTcqCUsmuPwXQClA1M8wvNN1GZVl2InBCE+f/IXwjPUGM3az
 9S/aaUKIhT+SyGg0/H/RWEA36kqpaZZG8RQLp24OqUsuSh8nf56D+8lc8isZ0hvLWnptgSP7/fQt9
 +uvaIZIg==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDKbG-0003dY-Rq; Sun, 15 Mar 2020 04:10:06 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] fbdev: via: fix -Wextra build warning and format warning
Date: Sat, 14 Mar 2020 21:10:02 -0700
Message-Id: <20200315041002.24473-7-rdunlap@infradead.org>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200315041002.24473-1-rdunlap@infradead.org>
References: <20200315041002.24473-1-rdunlap@infradead.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 15 Mar 2020 23:19:06 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiAnVklBRkJfREVCVUcnIGFuZCAnVklBRkJfV0FSTicgYXJlIG5vdCBkZWZpbmVkLCBtb2Rp
ZnkgdGhlCkRFQlVHX01TRygpICZXQVJOX01TRygpIG1hY3JvcyB0byB1c2UgdGhlIG5vX3ByaW50
aygpIG1hY3JvIGluc3RlYWQgb2YKdXNpbmcgPGVtcHR5Pi4KVGhpcyBmaXhlcyBhIGJ1aWxkIHdh
cm5pbmcgd2hlbiAtV2V4dHJhIGlzIHVzZWQgYW5kIHByb3ZpZGVzCnByaW50ayBmb3JtYXQgY2hl
Y2tpbmc6CgouLi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3ZpYS9pb2N0bC5jOjg4OjQ3OiB3YXJuaW5n
OiBzdWdnZXN0IGJyYWNlcyBhcm91bmQgZW1wdHkgYm9keSBpbiBhbiDigJhlbHNl4oCZIHN0YXRl
bWVudCBbLVdlbXB0eS1ib2R5XQoKQWxzbyB1c2UgJWx1IHRvIHByaW50IGFuIHVuc2lnbmVkIGxv
bmcgaW5zdGVhZCBvZiBqdXN0ICVsLCB0byBmaXgKYSBwcmludGsgZm9ybWF0IHdhcm5pbmc6Cgou
Li9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3ZpYS92aWFmYmRldi5jOiBJbiBmdW5jdGlvbiDigJh2aWFm
Yl9kdnAwX3Byb2Nfd3JpdGXigJk6Ci4uL2RyaXZlcnMvdmlkZW8vZmJkZXYvdmlhL3ZpYWZiZGV2
LmM6MTE0ODoxNDogd2FybmluZzogdW5rbm93biBjb252ZXJzaW9uIHR5cGUgY2hhcmFjdGVyIOKA
mF3igJkgaW4gZm9ybWF0IFstV2Zvcm1hdD1dCiAgICBERUJVR19NU0coIkRWUDA6cmVnX3ZhbFsl
bF09OiV4XG4iLCBpLAoKU2lnbmVkLW9mZi1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJh
ZGVhZC5vcmc+CkNjOiBGbG9yaWFuIFRvYmlhcyBTY2hhbmRpbmF0IDxGbG9yaWFuU2NoYW5kaW5h
dEBnbXguZGU+CkNjOiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ft
c3VuZy5jb20+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1m
YmRldkB2Z2VyLmtlcm5lbC5vcmcKLS0tCkFsdGVybmF0aXZlOiB1c2UgcHJfZGVidWcoKSBzbyB0
aGF0IENPTkZJR19EWU5BTUlDX0RFQlVHIGNhbiBiZSB1c2VkCmF0IHRoZXNlIHNpdGVzLgoKIGRy
aXZlcnMvdmlkZW8vZmJkZXYvdmlhL2RlYnVnLmggICAgfCAgICA2ICsrKystLQogZHJpdmVycy92
aWRlby9mYmRldi92aWEvdmlhZmJkZXYuYyB8ICAgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKLS0tIGxpbnV4LW5leHQtMjAyMDAzMTMub3Jp
Zy9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3ZpYS9kZWJ1Zy5oCisrKyBsaW51eC1uZXh0LTIwMjAwMzEz
L2RyaXZlcnMvdmlkZW8vZmJkZXYvdmlhL2RlYnVnLmgKQEAgLTcsNiArNyw4IEBACiAjaWZuZGVm
IF9fREVCVUdfSF9fCiAjZGVmaW5lIF9fREVCVUdfSF9fCiAKKyNpbmNsdWRlIDxsaW51eC9wcmlu
dGsuaD4KKwogI2lmbmRlZiBWSUFGQl9ERUJVRwogI2RlZmluZSBWSUFGQl9ERUJVRyAwCiAjZW5k
aWYKQEAgLTE0LDE0ICsxNiwxNCBAQAogI2lmIFZJQUZCX0RFQlVHCiAjZGVmaW5lIERFQlVHX01T
RyhmLCBhLi4uKSAgIHByaW50ayhmLCAjIyBhKQogI2Vsc2UKLSNkZWZpbmUgREVCVUdfTVNHKGYs
IGEuLi4pCisjZGVmaW5lIERFQlVHX01TRyhmLCBhLi4uKSAgIG5vX3ByaW50ayhmLCAjIyBhKQog
I2VuZGlmCiAKICNkZWZpbmUgVklBRkJfV0FSTiAwCiAjaWYgVklBRkJfV0FSTgogI2RlZmluZSBX
QVJOX01TRyhmLCBhLi4uKSAgIHByaW50ayhmLCAjIyBhKQogI2Vsc2UKLSNkZWZpbmUgV0FSTl9N
U0coZiwgYS4uLikKKyNkZWZpbmUgV0FSTl9NU0coZiwgYS4uLikgICBub19wcmludGsoZiwgIyMg
YSkKICNlbmRpZgogCiAjZW5kaWYgLyogX19ERUJVR19IX18gKi8KLS0tIGxpbnV4LW5leHQtMjAy
MDAzMTMub3JpZy9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3ZpYS92aWFmYmRldi5jCisrKyBsaW51eC1u
ZXh0LTIwMjAwMzEzL2RyaXZlcnMvdmlkZW8vZmJkZXYvdmlhL3ZpYWZiZGV2LmMKQEAgLTExNDQs
NyArMTE0NCw3IEBAIHN0YXRpYyBzc2l6ZV90IHZpYWZiX2R2cDBfcHJvY193cml0ZShzdHIKIAkJ
aWYgKHZhbHVlICE9IE5VTEwpIHsKIAkJCWlmIChrc3RydG91OCh2YWx1ZSwgMCwgJnJlZ192YWwp
IDwgMCkKIAkJCQlyZXR1cm4gLUVJTlZBTDsKLQkJCURFQlVHX01TRyhLRVJOX0lORk8gIkRWUDA6
cmVnX3ZhbFslbF09OiV4XG4iLCBpLAorCQkJREVCVUdfTVNHKEtFUk5fSU5GTyAiRFZQMDpyZWdf
dmFsWyVsdV09OiV4XG4iLCBpLAogCQkJCSAgcmVnX3ZhbCk7CiAJCQlzd2l0Y2ggKGkpIHsKIAkJ
CWNhc2UgMDoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
