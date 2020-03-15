Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3D2186076
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 00:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D566E2D1;
	Sun, 15 Mar 2020 23:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151206E102
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 04:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=GNC8Sm1AlFB7BS88maKHyPxziY/VU/zokv/Jjy4PIQ4=; b=XAQtqekKRTzL+RabbcoToO8+Pb
 3np37/P21Ced4oj36Wl0MV+8yLB1fraYDdERnsakSucNF62N9JhQqt3yx6Ud09mbgDRb+H6QWe6DT
 bBXo5+mjzZr2S/bhQCNBTYFA0AnVT8qrzUyJLObxctj0vzABBwYIO+2aQjHp0c9XEHT5xzfJbs8VQ
 rtfcGFAiDuelgNF5rQQ7kCCKXgqPUMS+EfbFxZu825mtGTd+VXUzSnjHBGj/dcXw0eeAcrRcXYTUK
 TeVfRNtMOLJaWvGtLXjZkM7hKNlnP8iBqFOxsEKnFy3P/Clt7GHEC8B086MFnJizDK02opXuzOcj+
 7rSoS4+Q==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDKbG-0003dY-Da; Sun, 15 Mar 2020 04:10:06 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] fbdev: pm[23]fb.c: fix -Wextra build warnings and errors
Date: Sat, 14 Mar 2020 21:10:01 -0700
Message-Id: <20200315041002.24473-6-rdunlap@infradead.org>
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

V2hlbiAnREVCVUcnIGlzIG5vdCBkZWZpbmVkLCBtb2RpZnkgdGhlIERQUklOVEsoKSBtYWNybyB0
byB1c2UgdGhlCm5vX3ByaW50aygpIG1hY3JvIGluc3RlYWQgb2YgdXNpbmcgPGVtcHR5Pi4KVGhp
cyBmaXhlcyBidWlsZCB3YXJuaW5ncyB3aGVuIC1XZXh0cmEgaXMgdXNlZCBhbmQgcHJvdmlkZXMK
cHJpbnRrIGZvcm1hdCBjaGVja2luZzoKCi4uL2RyaXZlcnMvdmlkZW8vZmJkZXYvcG0yZmIuYzoy
Mjc6Mzg6IHdhcm5pbmc6IHN1Z2dlc3QgYnJhY2VzIGFyb3VuZCBlbXB0eSBib2R5IGluIGFuIOKA
mGlm4oCZIHN0YXRlbWVudCBbLVdlbXB0eS1ib2R5XQouLi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3Bt
M2ZiLmM6MTAzOTozMzogd2FybmluZzogc3VnZ2VzdCBicmFjZXMgYXJvdW5kIGVtcHR5IGJvZHkg
aW4gYW4g4oCYZWxzZeKAmSBzdGF0ZW1lbnQgWy1XZW1wdHktYm9keV0KCkFsc28gZHJvcCBvbmUg
YXJndW1lbnQgaW4gdHdvIERQUklOVEsoKSBtYWNybyB1c2VzIHRvIHByb3ZpZGUgdGhlCmNvcnJl
Y3QgbnVtYmVyIG9mIGFyZ3VtZW50cyBhbmQgdXNlIHRoZSBjb3JyZWN0IGZpZWxkIGluIG9uZSBj
YXNlCnRvIGZpeCBhIGJ1aWxkIGVycm9yOgoKLi4vZHJpdmVycy92aWRlby9mYmRldi9wbTNmYi5j
OjM1Mzo5OiBlcnJvcjog4oCYc3RydWN0IGZiX2luZm/igJkgaGFzIG5vIG1lbWJlciBuYW1lZCDi
gJhjdXJyZW50X3BhcuKAmQogICAgIGluZm8tPmN1cnJlbnRfcGFyLT5kZXB0aCk7CgpTaWduZWQt
b2ZmLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4KQ2M6IEJhcnRsb21p
ZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KQ2M6IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwot
LS0KQWx0ZXJuYXRpdmU6IHVzZSBwcl9kZWJ1ZygpIHNvIHRoYXQgQ09ORklHX0RZTkFNSUNfREVC
VUcgY2FuIGJlIHVzZWQKYXQgdGhlc2Ugc2l0ZXMuCgogZHJpdmVycy92aWRlby9mYmRldi9wbTJm
Yi5jIHwgICAgMiArLQogZHJpdmVycy92aWRlby9mYmRldi9wbTNmYi5jIHwgICAgOCArKysrLS0t
LQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgotLS0g
bGludXgtbmV4dC0yMDIwMDMxMy5vcmlnL2RyaXZlcnMvdmlkZW8vZmJkZXYvcG0yZmIuYworKysg
bGludXgtbmV4dC0yMDIwMDMxMy9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3BtMmZiLmMKQEAgLTU0LDcg
KzU0LDcgQEAKICNkZWZpbmUgRFBSSU5USyhhLCBiLi4uKQlcCiAJcHJpbnRrKEtFUk5fREVCVUcg
InBtMmZiOiAlczogIiBhLCBfX2Z1bmNfXyAsICMjIGIpCiAjZWxzZQotI2RlZmluZSBEUFJJTlRL
KGEsIGIuLi4pCisjZGVmaW5lIERQUklOVEsoYSwgYi4uLikJbm9fcHJpbnRrKGEsICMjYikKICNl
bmRpZgogCiAjZGVmaW5lIFBNMl9QSVhNQVBfU0laRQkoMTYwMCAqIDQpCi0tLSBsaW51eC1uZXh0
LTIwMjAwMzEzLm9yaWcvZHJpdmVycy92aWRlby9mYmRldi9wbTNmYi5jCisrKyBsaW51eC1uZXh0
LTIwMjAwMzEzL2RyaXZlcnMvdmlkZW8vZmJkZXYvcG0zZmIuYwpAQCAtNDQsNyArNDQsNyBAQAog
I2RlZmluZSBEUFJJTlRLKGEsIGIuLi4pCVwKIAlwcmludGsoS0VSTl9ERUJVRyAicG0zZmI6ICVz
OiAiIGEsIF9fZnVuY19fICwgIyMgYikKICNlbHNlCi0jZGVmaW5lIERQUklOVEsoYSwgYi4uLikK
KyNkZWZpbmUgRFBSSU5USyhhLCBiLi4uKQlub19wcmludGsoYSwgIyNiKQogI2VuZGlmCiAKICNk
ZWZpbmUgUE0zX1BJWE1BUF9TSVpFCSgyMDQ4ICogNCkKQEAgLTMwNiw3ICszMDYsNyBAQCBzdGF0
aWMgdm9pZCBwbTNmYl9pbml0X2VuZ2luZShzdHJ1Y3QgZmJfCiAJCQkJCSAgIFBNM1BpeGVsU2l6
ZV9HTE9CQUxfMzJCSVQpOwogCQkJYnJlYWs7CiAJCWRlZmF1bHQ6Ci0JCQlEUFJJTlRLKDEsICJV
bnN1cHBvcnRlZCBkZXB0aCAlZFxuIiwKKwkJCURQUklOVEsoIlVuc3VwcG9ydGVkIGRlcHRoICVk
XG4iLAogCQkJCWluZm8tPnZhci5iaXRzX3Blcl9waXhlbCk7CiAJCQlicmVhazsKIAkJfQpAQCAt
MzQ5LDggKzM0OSw4IEBAIHN0YXRpYyB2b2lkIHBtM2ZiX2luaXRfZW5naW5lKHN0cnVjdCBmYl8K
IAkJCQkJICAgKDEgPDwgMTApIHwgKDAgPDwgMykpOwogCQkJYnJlYWs7CiAJCWRlZmF1bHQ6Ci0J
CQlEUFJJTlRLKDEsICJVbnN1cHBvcnRlZCBkZXB0aCAlZFxuIiwKLQkJCQlpbmZvLT5jdXJyZW50
X3Bhci0+ZGVwdGgpOworCQkJRFBSSU5USygiVW5zdXBwb3J0ZWQgZGVwdGggJWRcbiIsCisJCQkJ
aW5mby0+dmFyLmJpdHNfcGVyX3BpeGVsKTsKIAkJCWJyZWFrOwogCQl9CiAJfQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
