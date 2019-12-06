Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9A3114DDC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 10:00:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467FD6F97C;
	Fri,  6 Dec 2019 09:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360E86EBA8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 08:59:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 89299B01D;
 Fri,  6 Dec 2019 08:59:57 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.velikov@collabora.com, noralf@tronnes.org, zboszor@pr.hu
Subject: [PATCH v2 1/7] drm/udl: Remove unused statistics counters
Date: Fri,  6 Dec 2019 09:59:48 +0100
Message-Id: <20191206085954.9697-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191206085954.9697-1-tzimmermann@suse.de>
References: <20191206085954.9697-1-tzimmermann@suse.de>
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
bW1lcm1hbm5Ac3VzZS5kZT4KUmV2aWV3ZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292
QGNvbGxhYm9yYS5jb20+CkFja2VkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuaCB8ICA0IC0tLS0KIGRyaXZlcnMv
Z3B1L2RybS91ZGwvdWRsX2ZiLmMgIHwgMTQgKy0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDE3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS91ZGwvdWRsX2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmgKaW5k
ZXggNjZjYmUwNGY4MzJhLi40MjQyNjQwN2MzMTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS91ZGwvdWRsX2Rydi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5oCkBAIC02
NiwxMCArNjYsNiBAQCBzdHJ1Y3QgdWRsX2RldmljZSB7CiAKIAljaGFyIG1vZGVfYnVmWzEwMjRd
OwogCXVpbnQzMl90IG1vZGVfYnVmX2xlbjsKLQlhdG9taWNfdCBieXRlc19yZW5kZXJlZDsgLyog
cmF3IHBpeGVsLWJ5dGVzIGRyaXZlciBhc2tlZCB0byByZW5kZXIgKi8KLQlhdG9taWNfdCBieXRl
c19pZGVudGljYWw7IC8qIHNhdmVkIGVmZm9ydCB3aXRoIGJhY2tidWZmZXIgY29tcGFyaXNvbiAq
LwotCWF0b21pY190IGJ5dGVzX3NlbnQ7IC8qIHRvIHVzYiwgYWZ0ZXIgY29tcHJlc3Npb24gaW5j
bHVkaW5nIG92ZXJoZWFkICovCi0JYXRvbWljX3QgY3B1X2tjeWNsZXNfdXNlZDsgLyogdHJhbnNw
aXJlZCBkdXJpbmcgcGl4ZWwgcHJvY2Vzc2luZyAqLwogfTsKIAogI2RlZmluZSB0b191ZGwoeCkg
Y29udGFpbmVyX29mKHgsIHN0cnVjdCB1ZGxfZGV2aWNlLCBkcm0pCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vdWRsL3VkbF9mYi5jIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZmIuYwpp
bmRleCBjMTk5NmFjNzNhMWYuLmJjMDMzNzc5ZjZlNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3VkbC91ZGxfZmIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9mYi5jCkBAIC02
OCw3ICs2OCw2IEBAIGludCB1ZGxfaGFuZGxlX2RhbWFnZShzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVy
ICpmYiwgaW50IHgsIGludCB5LAogCXN0cnVjdCB1ZGxfZGV2aWNlICp1ZGwgPSB0b191ZGwoZGV2
KTsKIAlpbnQgaSwgcmV0OwogCWNoYXIgKmNtZDsKLQljeWNsZXNfdCBzdGFydF9jeWNsZXMsIGVu
ZF9jeWNsZXM7CiAJaW50IGJ5dGVzX3NlbnQgPSAwOwogCWludCBieXRlc19pZGVudGljYWwgPSAw
OwogCXN0cnVjdCB1cmIgKnVyYjsKQEAgLTEwNSw4ICsxMDQsNiBAQCBpbnQgdWRsX2hhbmRsZV9k
YW1hZ2Uoc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsIGludCB4LCBpbnQgeSwKIAkJZ290byBl
cnJfZHJtX2dlbV9zaG1lbV92dW5tYXA7CiAJfQogCi0Jc3RhcnRfY3ljbGVzID0gZ2V0X2N5Y2xl
cygpOwotCiAJdXJiID0gdWRsX2dldF91cmIoZGV2KTsKIAlpZiAoIXVyYikKIAkJZ290byBvdXQ7
CkBAIC0xMjAsNyArMTE3LDcgQEAgaW50IHVkbF9oYW5kbGVfZGFtYWdlKHN0cnVjdCBkcm1fZnJh
bWVidWZmZXIgKmZiLCBpbnQgeCwgaW50IHksCiAJCQkJICAgICAmY21kLCBieXRlX29mZnNldCwg
ZGV2X2J5dGVfb2Zmc2V0LAogCQkJCSAgICAgd2lkdGggPDwgbG9nX2JwcCwKIAkJCQkgICAgICZi
eXRlc19pZGVudGljYWwsICZieXRlc19zZW50KSkKLQkJCWdvdG8gZXJyb3I7CisJCQlnb3RvIG91
dDsKIAl9CiAKIAlpZiAoY21kID4gKGNoYXIgKikgdXJiLT50cmFuc2Zlcl9idWZmZXIpIHsKQEAg
LTEzNCwxNSArMTMxLDYgQEAgaW50IHVkbF9oYW5kbGVfZGFtYWdlKHN0cnVjdCBkcm1fZnJhbWVi
dWZmZXIgKmZiLCBpbnQgeCwgaW50IHksCiAJfSBlbHNlCiAJCXVkbF91cmJfY29tcGxldGlvbih1
cmIpOwogCi1lcnJvcjoKLQlhdG9taWNfYWRkKGJ5dGVzX3NlbnQsICZ1ZGwtPmJ5dGVzX3NlbnQp
OwotCWF0b21pY19hZGQoYnl0ZXNfaWRlbnRpY2FsLCAmdWRsLT5ieXRlc19pZGVudGljYWwpOwot
CWF0b21pY19hZGQoKHdpZHRoICogaGVpZ2h0KSA8PCBsb2dfYnBwLCAmdWRsLT5ieXRlc19yZW5k
ZXJlZCk7Ci0JZW5kX2N5Y2xlcyA9IGdldF9jeWNsZXMoKTsKLQlhdG9taWNfYWRkKCgodW5zaWdu
ZWQgaW50KSAoKGVuZF9jeWNsZXMgLSBzdGFydF9jeWNsZXMpCi0JCSAgICA+PiAxMCkpLCAvKiBL
Y3ljbGVzICovCi0JCSAgICZ1ZGwtPmNwdV9rY3ljbGVzX3VzZWQpOwotCiBvdXQ6CiAJZHJtX2dl
bV9zaG1lbV92dW5tYXAoZmItPm9ialswXSwgdmFkZHIpOwogCi0tIAoyLjIzLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
