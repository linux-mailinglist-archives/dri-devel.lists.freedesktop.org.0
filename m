Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5469DAC99A
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2019 23:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555AC89119;
	Sat,  7 Sep 2019 21:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53C189119;
 Sat,  7 Sep 2019 21:50:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7191E10576C3;
 Sat,  7 Sep 2019 20:32:42 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7106D600D1;
 Sat,  7 Sep 2019 20:32:40 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>
Subject: [PATCH] drm/radeon: Bail earlier when radeon.cik_/si_support=0 is
 passed
Date: Sat,  7 Sep 2019 22:32:38 +0200
Message-Id: <20190907203238.232005-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Sat, 07 Sep 2019 20:32:42 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QmFpbCBmcm9tIHRoZSBwY2lfZHJpdmVyIHByb2JlIGZ1bmN0aW9uIGluc3RlYWQgb2YgZnJvbSB0
aGUgZHJtX2RyaXZlcgpsb2FkIGZ1bmN0aW9uLgoKVGhpcyBhdm9pZCAvZGV2L2RyaS9jYXJkMCB0
ZW1wb3JhcmlseSBnZXR0aW5nIHJlZ2lzdGVyZWQgYW5kIHRoZW4KdW5yZWdpc3RlcmVkIGFnYWlu
LCBzZW5kaW5nIHVud2FudGVkIGFkZCAvIHJlbW92ZSB1ZGV2IGV2ZW50cyB0bwp1c2Vyc3BhY2Uu
CgpTcGVjaWZpY2FsbHkgdGhpcyBhdm9pZHMgdHJpZ2dlcmluZyB0aGUgKHVzZXJzcGFjZSkgYnVn
IGZpeGVkIGJ5IHRoaXMKcGx5bW91dGggbWVyZ2UtcmVxdWVzdDoKaHR0cHM6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL3BseW1vdXRoL3BseW1vdXRoL21lcmdlX3JlcXVlc3RzLzU5CgpOb3RlIHRo
YXQgZGVzcGl0ZSB0aGF0IGJlaW5nIGFuIHVzZXJzcGFjZSBidWcsIG5vdCBzZW5kaW5nIHVubmVj
ZXNzYXJ5CnVkZXYgZXZlbnRzIGlzIGEgZ29vZCBpZGVhIGluIGdlbmVyYWwuCgpCdWdMaW5rOiBo
dHRwczovL2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTE0OTA0OTAKU2lnbmVk
LW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYyB8IDMxICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9rbXMuYyB8IDI1IC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDI1IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Ry
di5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMKaW5kZXggYTZjYmUxMWY3
OWM2Li43MDMzZjNhMzhjODcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jCkBAIC0z
MjUsOCArMzI1LDM5IEBAIGJvb2wgcmFkZW9uX2RldmljZV9pc192aXJ0dWFsKHZvaWQpOwogc3Rh
dGljIGludCByYWRlb25fcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LAogCQkJICAgIGNv
bnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICplbnQpCiB7CisJdW5zaWduZWQgbG9uZyBmbGFncyA9
IDA7CiAJaW50IHJldDsKIAorCWlmICghZW50KQorCQlyZXR1cm4gLUVOT0RFVjsgLyogQXZvaWQg
TlVMTC1wdHIgZGVyZWYgaW4gZHJtX2dldF9wY2lfZGV2ICovCisKKwlmbGFncyA9IGVudC0+ZHJp
dmVyX2RhdGE7CisKKwlpZiAoIXJhZGVvbl9zaV9zdXBwb3J0KSB7CisJCXN3aXRjaCAoZmxhZ3Mg
JiBSQURFT05fRkFNSUxZX01BU0spIHsKKwkJY2FzZSBDSElQX1RBSElUSToKKwkJY2FzZSBDSElQ
X1BJVENBSVJOOgorCQljYXNlIENISVBfVkVSREU6CisJCWNhc2UgQ0hJUF9PTEFORDoKKwkJY2Fz
ZSBDSElQX0hBSU5BTjoKKwkJCWRldl9pbmZvKCZwZGV2LT5kZXYsCisJCQkJICJTSSBzdXBwb3J0
IGRpc2FibGVkIGJ5IG1vZHVsZSBwYXJhbVxuIik7CisJCQlyZXR1cm4gLUVOT0RFVjsKKwkJfQor
CX0KKwlpZiAoIXJhZGVvbl9jaWtfc3VwcG9ydCkgeworCQlzd2l0Y2ggKGZsYWdzICYgUkFERU9O
X0ZBTUlMWV9NQVNLKSB7CisJCWNhc2UgQ0hJUF9LQVZFUkk6CisJCWNhc2UgQ0hJUF9CT05BSVJF
OgorCQljYXNlIENISVBfSEFXQUlJOgorCQljYXNlIENISVBfS0FCSU5JOgorCQljYXNlIENISVBf
TVVMTElOUzoKKwkJCWRldl9pbmZvKCZwZGV2LT5kZXYsCisJCQkJICJDSUsgc3VwcG9ydCBkaXNh
YmxlZCBieSBtb2R1bGUgcGFyYW1cbiIpOworCQkJcmV0dXJuIC1FTk9ERVY7CisJCX0KKwl9CisK
IAlpZiAodmdhX3N3aXRjaGVyb29fY2xpZW50X3Byb2JlX2RlZmVyKHBkZXYpKQogCQlyZXR1cm4g
LUVQUk9CRV9ERUZFUjsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9rbXMuYwppbmRleCAwN2Y3
YWNlNDJjNGIuLmU4NWM1NTRlZWFhOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fa21zLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fa21zLmMK
QEAgLTEwMCwzMSArMTAwLDYgQEAgaW50IHJhZGVvbl9kcml2ZXJfbG9hZF9rbXMoc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwgdW5zaWduZWQgbG9uZyBmbGFncykKIAlzdHJ1Y3QgcmFkZW9uX2Rldmlj
ZSAqcmRldjsKIAlpbnQgciwgYWNwaV9zdGF0dXM7CiAKLQlpZiAoIXJhZGVvbl9zaV9zdXBwb3J0
KSB7Ci0JCXN3aXRjaCAoZmxhZ3MgJiBSQURFT05fRkFNSUxZX01BU0spIHsKLQkJY2FzZSBDSElQ
X1RBSElUSToKLQkJY2FzZSBDSElQX1BJVENBSVJOOgotCQljYXNlIENISVBfVkVSREU6Ci0JCWNh
c2UgQ0hJUF9PTEFORDoKLQkJY2FzZSBDSElQX0hBSU5BTjoKLQkJCWRldl9pbmZvKGRldi0+ZGV2
LAotCQkJCSAiU0kgc3VwcG9ydCBkaXNhYmxlZCBieSBtb2R1bGUgcGFyYW1cbiIpOwotCQkJcmV0
dXJuIC1FTk9ERVY7Ci0JCX0KLQl9Ci0JaWYgKCFyYWRlb25fY2lrX3N1cHBvcnQpIHsKLQkJc3dp
dGNoIChmbGFncyAmIFJBREVPTl9GQU1JTFlfTUFTSykgewotCQljYXNlIENISVBfS0FWRVJJOgot
CQljYXNlIENISVBfQk9OQUlSRToKLQkJY2FzZSBDSElQX0hBV0FJSToKLQkJY2FzZSBDSElQX0tB
QklOSToKLQkJY2FzZSBDSElQX01VTExJTlM6Ci0JCQlkZXZfaW5mbyhkZXYtPmRldiwKLQkJCQkg
IkNJSyBzdXBwb3J0IGRpc2FibGVkIGJ5IG1vZHVsZSBwYXJhbVxuIik7Ci0JCQlyZXR1cm4gLUVO
T0RFVjsKLQkJfQotCX0KLQogCXJkZXYgPSBremFsbG9jKHNpemVvZihzdHJ1Y3QgcmFkZW9uX2Rl
dmljZSksIEdGUF9LRVJORUwpOwogCWlmIChyZGV2ID09IE5VTEwpIHsKIAkJcmV0dXJuIC1FTk9N
RU07Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
