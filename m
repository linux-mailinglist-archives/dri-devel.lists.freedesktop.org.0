Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F1B112C85
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 14:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E29B6F463;
	Wed,  4 Dec 2019 13:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6ECC6F463
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 13:24:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 018AEB133;
 Wed,  4 Dec 2019 13:24:33 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.velikov@collabora.com, noralf@tronnes.org, zboszor@pr.hu
Subject: [PATCH 1/7] drm/udl: Remove unused statistics counters
Date: Wed,  4 Dec 2019 14:24:24 +0100
Message-Id: <20191204132430.16874-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191204132430.16874-1-tzimmermann@suse.de>
References: <20191204132430.16874-1-tzimmermann@suse.de>
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

Tm9uZSBvZiB0aGUgdWRsIGRyaXZlcidzIHN0YXRpc3RpY3MgY291bnRlcnMgaXMgdXNlZCBhbnl3
aGVyZS4gUmVtb3ZlCnRoZW0uCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuaCB8ICA0
IC0tLS0KIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2ZiLmMgIHwgMTQgKy0tLS0tLS0tLS0tLS0K
IDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDE3IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL3Vk
bC91ZGxfZHJ2LmgKaW5kZXggNjZjYmUwNGY4MzJhLi40MjQyNjQwN2MzMTggMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwv
dWRsX2Rydi5oCkBAIC02NiwxMCArNjYsNiBAQCBzdHJ1Y3QgdWRsX2RldmljZSB7CiAKIAljaGFy
IG1vZGVfYnVmWzEwMjRdOwogCXVpbnQzMl90IG1vZGVfYnVmX2xlbjsKLQlhdG9taWNfdCBieXRl
c19yZW5kZXJlZDsgLyogcmF3IHBpeGVsLWJ5dGVzIGRyaXZlciBhc2tlZCB0byByZW5kZXIgKi8K
LQlhdG9taWNfdCBieXRlc19pZGVudGljYWw7IC8qIHNhdmVkIGVmZm9ydCB3aXRoIGJhY2tidWZm
ZXIgY29tcGFyaXNvbiAqLwotCWF0b21pY190IGJ5dGVzX3NlbnQ7IC8qIHRvIHVzYiwgYWZ0ZXIg
Y29tcHJlc3Npb24gaW5jbHVkaW5nIG92ZXJoZWFkICovCi0JYXRvbWljX3QgY3B1X2tjeWNsZXNf
dXNlZDsgLyogdHJhbnNwaXJlZCBkdXJpbmcgcGl4ZWwgcHJvY2Vzc2luZyAqLwogfTsKIAogI2Rl
ZmluZSB0b191ZGwoeCkgY29udGFpbmVyX29mKHgsIHN0cnVjdCB1ZGxfZGV2aWNlLCBkcm0pCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9mYi5jIGIvZHJpdmVycy9ncHUvZHJt
L3VkbC91ZGxfZmIuYwppbmRleCBjMTk5NmFjNzNhMWYuLmJjMDMzNzc5ZjZlNCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZmIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdWRs
L3VkbF9mYi5jCkBAIC02OCw3ICs2OCw2IEBAIGludCB1ZGxfaGFuZGxlX2RhbWFnZShzdHJ1Y3Qg
ZHJtX2ZyYW1lYnVmZmVyICpmYiwgaW50IHgsIGludCB5LAogCXN0cnVjdCB1ZGxfZGV2aWNlICp1
ZGwgPSB0b191ZGwoZGV2KTsKIAlpbnQgaSwgcmV0OwogCWNoYXIgKmNtZDsKLQljeWNsZXNfdCBz
dGFydF9jeWNsZXMsIGVuZF9jeWNsZXM7CiAJaW50IGJ5dGVzX3NlbnQgPSAwOwogCWludCBieXRl
c19pZGVudGljYWwgPSAwOwogCXN0cnVjdCB1cmIgKnVyYjsKQEAgLTEwNSw4ICsxMDQsNiBAQCBp
bnQgdWRsX2hhbmRsZV9kYW1hZ2Uoc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsIGludCB4LCBp
bnQgeSwKIAkJZ290byBlcnJfZHJtX2dlbV9zaG1lbV92dW5tYXA7CiAJfQogCi0Jc3RhcnRfY3lj
bGVzID0gZ2V0X2N5Y2xlcygpOwotCiAJdXJiID0gdWRsX2dldF91cmIoZGV2KTsKIAlpZiAoIXVy
YikKIAkJZ290byBvdXQ7CkBAIC0xMjAsNyArMTE3LDcgQEAgaW50IHVkbF9oYW5kbGVfZGFtYWdl
KHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLCBpbnQgeCwgaW50IHksCiAJCQkJICAgICAmY21k
LCBieXRlX29mZnNldCwgZGV2X2J5dGVfb2Zmc2V0LAogCQkJCSAgICAgd2lkdGggPDwgbG9nX2Jw
cCwKIAkJCQkgICAgICZieXRlc19pZGVudGljYWwsICZieXRlc19zZW50KSkKLQkJCWdvdG8gZXJy
b3I7CisJCQlnb3RvIG91dDsKIAl9CiAKIAlpZiAoY21kID4gKGNoYXIgKikgdXJiLT50cmFuc2Zl
cl9idWZmZXIpIHsKQEAgLTEzNCwxNSArMTMxLDYgQEAgaW50IHVkbF9oYW5kbGVfZGFtYWdlKHN0
cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLCBpbnQgeCwgaW50IHksCiAJfSBlbHNlCiAJCXVkbF91
cmJfY29tcGxldGlvbih1cmIpOwogCi1lcnJvcjoKLQlhdG9taWNfYWRkKGJ5dGVzX3NlbnQsICZ1
ZGwtPmJ5dGVzX3NlbnQpOwotCWF0b21pY19hZGQoYnl0ZXNfaWRlbnRpY2FsLCAmdWRsLT5ieXRl
c19pZGVudGljYWwpOwotCWF0b21pY19hZGQoKHdpZHRoICogaGVpZ2h0KSA8PCBsb2dfYnBwLCAm
dWRsLT5ieXRlc19yZW5kZXJlZCk7Ci0JZW5kX2N5Y2xlcyA9IGdldF9jeWNsZXMoKTsKLQlhdG9t
aWNfYWRkKCgodW5zaWduZWQgaW50KSAoKGVuZF9jeWNsZXMgLSBzdGFydF9jeWNsZXMpCi0JCSAg
ICA+PiAxMCkpLCAvKiBLY3ljbGVzICovCi0JCSAgICZ1ZGwtPmNwdV9rY3ljbGVzX3VzZWQpOwot
CiBvdXQ6CiAJZHJtX2dlbV9zaG1lbV92dW5tYXAoZmItPm9ialswXSwgdmFkZHIpOwogCi0tIAoy
LjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
