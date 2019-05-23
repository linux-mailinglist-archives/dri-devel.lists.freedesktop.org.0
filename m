Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3D927EF3
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 16:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0429689EB1;
	Thu, 23 May 2019 14:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E86189EB1;
 Thu, 23 May 2019 14:00:16 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B777F2133D;
 Thu, 23 May 2019 14:00:14 +0000 (UTC)
Date: Thu, 23 May 2019 10:00:13 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [RFC][PATCH] kernel.h: Add generic roundup_64() macro
Message-ID: <20190523100013.52a8d2a6@gandalf.local.home>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkZyb206IFN0ZXZlbiBSb3N0ZWR0IChWTXdhcmUpIDxyb3N0ZWR0QGdvb2RtaXMub3JnPgoKSW4g
ZGlzY3Vzc2luZyBhIGJ1aWxkIGZhaWx1cmUgb24geDg2XzMyIGR1ZSB0byB0aGUgdXNlIG9mIHJv
dW5kdXAoKSBvbgphIDY0IGJpdCBudW1iZXIsIEkgcmVhbGl6ZWQgdGhhdCB0aGVyZSdzIG5vIGdl
bmVyaWMgZXF1aXZhbGVudApyb3VuZHVwXzY0KCkuIEl0IGlzIGltcGxlbWVudGVkIGluIHR3byBz
ZXBhcmF0ZSBwbGFjZXMgaW4gdGhlIGtlcm5lbCwKYnV0IHRoZXJlIHJlYWxseSBzaG91bGQgYmUg
anVzdCBvbmUgdGhhdCBhbGwgY2FuIHVzZS4KCkFsdGhvdWdoIHRoZSBvdGhlciBpbXBsZW1lbnRh
dGlvbnMgYXJlIGEgc3RhdGljIGlubGluZSBmdW5jdGlvbiwgdGhpcwppbXBsZW1lbnRhdGlvbiBp
cyBhIG1hY3JvIHRvIGFsbG93IHRoZSB1c2Ugb2YgdHlwZW9mKHgpIHRvIGRlbm90ZSB0aGUKdHlw
ZSB0aGF0IGlzIGJlaW5nIHVzZWQuIElmIHRoZSBidWlsZCBpcyBvbiBhIDY0IGJpdCBtYWNoaW5l
LCB0aGVuIHRoZQpyb3VuZHVwXzY0KCkgbWFjcm8gd2lsbCBqdXN0IGRlZmF1bHQgYmFjayB0byBy
b3VuZHVwKCkuIEJ1dCBmb3IgMzIgYml0Cm1hY2hpbmVzLCBpdCB3aWxsIHVzZSB0aGUgdmVyc2lv
biB0aGF0IGlzIHdpbGwgbm90IGNhdXNlIGlzc3VlcyB3aXRoCmRpdmlkaW5nIGEgNjQgYml0IG51
bWJlciBvbiBhIDMyIGJpdCBtYWNoaW5lLgoKTGluazogaHR0cDovL2xrbWwua2VybmVsLm9yZy9y
LzIwMTkwNTIyMTQ1NDUwLjI1ZmY0ODNkQGdhbmRhbGYubG9jYWwuaG9tZQoKU2lnbmVkLW9mZi1i
eTogU3RldmVuIFJvc3RlZHQgKFZNd2FyZSkgPHJvc3RlZHRAZ29vZG1pcy5vcmc+Ci0tLQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jIGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCmluZGV4IDM0YTk5ODAxMmJmNi4uY2RhY2ZlMWY3
MzJjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCkBAIC0xNDMsMTQgKzE0Myw2
IEBAIG5vdXZlYXVfYm9fZGVsX3R0bShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQogCWtm
cmVlKG52Ym8pOwogfQogCi1zdGF0aWMgaW5saW5lIHU2NAotcm91bmR1cF82NCh1NjQgeCwgdTMy
IHkpCi17Ci0JeCArPSB5IC0gMTsKLQlkb19kaXYoeCwgeSk7Ci0JcmV0dXJuIHggKiB5OwotfQot
CiBzdGF0aWMgdm9pZAogbm91dmVhdV9ib19maXh1cF9hbGlnbihzdHJ1Y3Qgbm91dmVhdV9ibyAq
bnZibywgdTMyIGZsYWdzLAogCQkgICAgICAgaW50ICphbGlnbiwgdTY0ICpzaXplKQpkaWZmIC0t
Z2l0IGEvZnMveGZzL3hmc19saW51eC5oIGIvZnMveGZzL3hmc19saW51eC5oCmluZGV4IGVkYmQ1
YTIxMGRmMi4uMTNkZTlkNDliZDUyIDEwMDY0NAotLS0gYS9mcy94ZnMveGZzX2xpbnV4LmgKKysr
IGIvZnMveGZzL3hmc19saW51eC5oCkBAIC0yMDcsMTMgKzIwNyw2IEBAIHN0YXRpYyBpbmxpbmUg
eGZzX2Rldl90IGxpbnV4X3RvX3hmc19kZXZfdChkZXZfdCBkZXYpCiAjZGVmaW5lIHhmc19zb3J0
KGEsbixzLGZuKQlzb3J0KGEsbixzLGZuLE5VTEwpCiAjZGVmaW5lIHhmc19zdGFja190cmFjZSgp
CWR1bXBfc3RhY2soKQogCi1zdGF0aWMgaW5saW5lIHVpbnQ2NF90IHJvdW5kdXBfNjQodWludDY0
X3QgeCwgdWludDMyX3QgeSkKLXsKLQl4ICs9IHkgLSAxOwotCWRvX2Rpdih4LCB5KTsKLQlyZXR1
cm4geCAqIHk7Ci19Ci0KIHN0YXRpYyBpbmxpbmUgdWludDY0X3QgaG93bWFueV82NCh1aW50NjRf
dCB4LCB1aW50MzJfdCB5KQogewogCXggKz0geSAtIDE7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L2tlcm5lbC5oIGIvaW5jbHVkZS9saW51eC9rZXJuZWwuaAppbmRleCA3NGIxZWU5MDI3ZjUu
LmNkMDA2MzYyOTM1NyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9rZXJuZWwuaAorKysgYi9p
bmNsdWRlL2xpbnV4L2tlcm5lbC5oCkBAIC0xMTUsNiArMTE1LDIwIEBACiAJKCgoeCkgKyAoX195
IC0gMSkpIC8gX195KSAqIF9feTsJCVwKIH0JCQkJCQkJXAogKQorCisjaWYgQklUU19QRVJfTE9O
RyA9PSAzMgorIyBkZWZpbmUgcm91bmR1cF82NCh4LCB5KSAoCQkJCVwKK3sJCQkJCQkJXAorCXR5
cGVvZih5KSBfX3kgPSB5OwkJCQlcCisJdHlwZW9mKHgpIF9feCA9ICh4KSArIChfX3kgLSAxKTsJ
CVwKKwlkb19kaXYoX194LCBfX3kpOwkJCQlcCisJX194ICogX195OwkJCQkJXAorfQkJCQkJCQlc
CispCisjZWxzZQorIyBkZWZpbmUgcm91bmR1cF82NCh4LCB5KQlyb3VuZHVwKHgsIHkpCisjZW5k
aWYKKwogLyoqCiAgKiByb3VuZGRvd24gLSByb3VuZCBkb3duIHRvIG5leHQgc3BlY2lmaWVkIG11
bHRpcGxlCiAgKiBAeDogdGhlIHZhbHVlIHRvIHJvdW5kCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
