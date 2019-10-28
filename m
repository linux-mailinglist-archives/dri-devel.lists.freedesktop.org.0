Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B9BE757B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 16:49:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD65D6E946;
	Mon, 28 Oct 2019 15:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05026E94D
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 15:49:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EBE10B59B;
 Mon, 28 Oct 2019 15:49:30 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, sam@ravnborg.org,
 chen@aspeedtech.com
Subject: [PATCH 1/9] drm/ast: Remove last traces of struct ast_gem_object
Date: Mon, 28 Oct 2019 16:49:20 +0100
Message-Id: <20191028154928.4058-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028154928.4058-1-tzimmermann@suse.de>
References: <20191028154928.4058-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGFzdCBkcml2ZXIgaGFzIHN3aXRjaGVkIHRvIHN0cnVjdCBkcm1fdnJhbV9nZW1fb2JqZWN0
IGEgd2hpbGUgYWdvLgpUaGlzIHBhdGNoIHJlbW92ZXMgYSBmdW5jdGlvbiBhbmQgZm9yd2FyZCBk
ZWNsYXJhdGlvbiB0aGF0IHdlcmUgZm9yZ290dGVuCmJlZm9yZS4KClNpZ25lZC1vZmYtYnk6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hc3QvYXN0X2Rydi5oICB8ICA2IC0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFp
bi5jIHwgMjQgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDMwIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5oIGIv
ZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmgKaW5kZXggZmYxNjFiZDYyMmYzLi5mNDQxNTBm
ZjU0ODMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5oCkBAIC0xMzcsOCArMTM3LDYgQEAgc3RydWN0IGFz
dF9wcml2YXRlIHsKIGludCBhc3RfZHJpdmVyX2xvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwg
dW5zaWduZWQgbG9uZyBmbGFncyk7CiB2b2lkIGFzdF9kcml2ZXJfdW5sb2FkKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYpOwogCi1zdHJ1Y3QgYXN0X2dlbV9vYmplY3Q7Ci0KICNkZWZpbmUgQVNUX0lP
X0FSX1BPUlRfV1JJVEUJCSgweDQwKQogI2RlZmluZSBBU1RfSU9fTUlTQ19QT1JUX1dSSVRFCQko
MHg0MikKICNkZWZpbmUgQVNUX0lPX1ZHQV9FTkFCTEVfUE9SVAkJKDB4NDMpCkBAIC0yODksMTAg
KzI4Nyw2IEBAIGV4dGVybiB2b2lkIGFzdF9tb2RlX2Zpbmkoc3RydWN0IGRybV9kZXZpY2UgKmRl
dik7CiBpbnQgYXN0X21tX2luaXQoc3RydWN0IGFzdF9wcml2YXRlICphc3QpOwogdm9pZCBhc3Rf
bW1fZmluaShzdHJ1Y3QgYXN0X3ByaXZhdGUgKmFzdCk7CiAKLWludCBhc3RfZ2VtX2NyZWF0ZShz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LAotCQkgICB1MzIgc2l6ZSwgYm9vbCBpc2tlcm5lbCwKLQkJ
ICAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICoqb2JqKTsKLQogLyogYXN0IHBvc3QgKi8KIHZvaWQg
YXN0X2VuYWJsZV92Z2Eoc3RydWN0IGRybV9kZXZpY2UgKmRldik7CiB2b2lkIGFzdF9lbmFibGVf
bW1pbyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hc3QvYXN0X21haW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYwppbmRleCAy
MTcxNWQ2YTliNTYuLjNhOWI0Y2I3M2YyZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Fz
dC9hc3RfbWFpbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYwpAQCAtNTM1
LDI3ICs1MzUsMyBAQCB2b2lkIGFzdF9kcml2ZXJfdW5sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYpCiAJcGNpX2lvdW5tYXAoZGV2LT5wZGV2LCBhc3QtPnJlZ3MpOwogCWtmcmVlKGFzdCk7CiB9
Ci0KLWludCBhc3RfZ2VtX2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAotCQkgICB1MzIg
c2l6ZSwgYm9vbCBpc2tlcm5lbCwKLQkJICAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICoqb2JqKQot
ewotCXN0cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0ICpnYm87Ci0JaW50IHJldDsKLQotCSpvYmog
PSBOVUxMOwotCi0Jc2l6ZSA9IHJvdW5kdXAoc2l6ZSwgUEFHRV9TSVpFKTsKLQlpZiAoc2l6ZSA9
PSAwKQotCQlyZXR1cm4gLUVJTlZBTDsKLQotCWdibyA9IGRybV9nZW1fdnJhbV9jcmVhdGUoZGV2
LCAmZGV2LT52cmFtX21tLT5iZGV2LCBzaXplLCAwLCBmYWxzZSk7Ci0JaWYgKElTX0VSUihnYm8p
KSB7Ci0JCXJldCA9IFBUUl9FUlIoZ2JvKTsKLQkJaWYgKHJldCAhPSAtRVJFU1RBUlRTWVMpCi0J
CQlEUk1fRVJST1IoImZhaWxlZCB0byBhbGxvY2F0ZSBHRU0gb2JqZWN0XG4iKTsKLQkJcmV0dXJu
IHJldDsKLQl9Ci0JKm9iaiA9ICZnYm8tPmJvLmJhc2U7Ci0JcmV0dXJuIDA7Ci19Ci0tIAoyLjIz
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
