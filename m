Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C37511444D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 17:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98F46E8A6;
	Thu,  5 Dec 2019 16:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED506E8A6
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 16:01:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D8A14AE57;
 Thu,  5 Dec 2019 16:01:44 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, noralf@tronnes.org,
 rong.a.chen@intel.com, ying.huang@intel.com, ville.syrjala@linux.intel.com,
 sam@ravnborg.org, emil.velikov@collabora.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v3 2/4] drm/mgag200: Rename constant MGAREG_Status to
 MGAREG_STATUS
Date: Thu,  5 Dec 2019 17:01:40 +0100
Message-Id: <20191205160142.3588-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191205160142.3588-1-tzimmermann@suse.de>
References: <20191205160142.3588-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVnaXN0ZXIgY29uc3RhbnRzIGFyZSB1cHBlciBjYXNlLiBGaXggTUdBUkVHX1N0YXR1cyBhY2Nv
cmRpbmdseS4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPgpSZXZpZXdlZC1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMgfCA2ICsrKy0tLQogZHJp
dmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9yZWcuaCAgfCAyICstCiAyIGZpbGVzIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAw
L21nYWcyMDBfbW9kZS5jCmluZGV4IDYyYThlOWNjYjE2ZC4uOWM0NDQwZDdiN2I0IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYwpAQCAtNzksMTIgKzc5LDEyIEBAIHN0YXRp
YyBpbmxpbmUgdm9pZCBtZ2Ffd2FpdF92c3luYyhzdHJ1Y3QgbWdhX2RldmljZSAqbWRldikKIAl1
bnNpZ25lZCBpbnQgc3RhdHVzID0gMDsKIAogCWRvIHsKLQkJc3RhdHVzID0gUlJFRzMyKE1HQVJF
R19TdGF0dXMpOworCQlzdGF0dXMgPSBSUkVHMzIoTUdBUkVHX1NUQVRVUyk7CiAJfSB3aGlsZSAo
KHN0YXR1cyAmIDB4MDgpICYmIHRpbWVfYmVmb3JlKGppZmZpZXMsIHRpbWVvdXQpKTsKIAl0aW1l
b3V0ID0gamlmZmllcyArIEhaLzEwOwogCXN0YXR1cyA9IDA7CiAJZG8gewotCQlzdGF0dXMgPSBS
UkVHMzIoTUdBUkVHX1N0YXR1cyk7CisJCXN0YXR1cyA9IFJSRUczMihNR0FSRUdfU1RBVFVTKTsK
IAl9IHdoaWxlICghKHN0YXR1cyAmIDB4MDgpICYmIHRpbWVfYmVmb3JlKGppZmZpZXMsIHRpbWVv
dXQpKTsKIH0KIApAQCAtOTMsNyArOTMsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgbWdhX3dhaXRf
YnVzeShzdHJ1Y3QgbWdhX2RldmljZSAqbWRldikKIAl1bnNpZ25lZCBsb25nIHRpbWVvdXQgPSBq
aWZmaWVzICsgSFo7CiAJdW5zaWduZWQgaW50IHN0YXR1cyA9IDA7CiAJZG8gewotCQlzdGF0dXMg
PSBSUkVHOChNR0FSRUdfU3RhdHVzICsgMik7CisJCXN0YXR1cyA9IFJSRUc4KE1HQVJFR19TVEFU
VVMgKyAyKTsKIAl9IHdoaWxlICgoc3RhdHVzICYgMHgwMSkgJiYgdGltZV9iZWZvcmUoamlmZmll
cywgdGltZW91dCkpOwogfQogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9t
Z2FnMjAwX3JlZy5oIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9yZWcuaAppbmRl
eCBjMDk2YTlkNmJjYmMuLjZjNDYwZDlhMjE0MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21nYWcyMDAvbWdhZzIwMF9yZWcuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2Fn
MjAwX3JlZy5oCkBAIC0xMDEsNyArMTAxLDcgQEAKICNkZWZpbmUgTUdBUkVHX0VYRUMJCTB4MDEw
MAogCiAjZGVmaW5lCU1HQVJFR19GSUZPU1RBVFVTCTB4MWUxMAotI2RlZmluZQlNR0FSRUdfU3Rh
dHVzCQkweDFlMTQKKyNkZWZpbmUJTUdBUkVHX1NUQVRVUwkJMHgxZTE0CiAjZGVmaW5lIE1HQVJF
R19DQUNIRUZMVVNIICAgICAgIDB4MWZmZgogI2RlZmluZQlNR0FSRUdfSUNMRUFSCQkweDFlMTgK
ICNkZWZpbmUJTUdBUkVHX0lFTgkJMHgxZTFjCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
