Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E02A925D6A3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 12:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973826EB33;
	Fri,  4 Sep 2020 10:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 32A416EB33;
 Fri,  4 Sep 2020 10:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id F3BAA2A6042;
 Fri,  4 Sep 2020 12:43:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id byfuQlbav8bw; Fri,  4 Sep 2020 12:43:05 +0200 (CEST)
Received: from kaveri (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 5537A2A6016;
 Fri,  4 Sep 2020 12:43:05 +0200 (CEST)
Received: from daenzer by kaveri with local (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1kE9BQ-000Ak1-Jz; Fri, 04 Sep 2020 12:43:04 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: Leo Li <sunpeng.li@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Subject: [PATCH v2] drm/amdgpu/dc: Require primary plane to be enabled
 whenever the CRTC is
Date: Fri,  4 Sep 2020 12:43:04 +0200
Message-Id: <20200904104304.41246-1-michel@daenzer.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200821165758.1106210-1-michel@daenzer.net>
References: <20200821165758.1106210-1-michel@daenzer.net>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWljaGVsIETDpG56ZXIgPG1kYWVuemVyQHJlZGhhdC5jb20+CgpEb24ndCBjaGVjayBk
cm1fY3J0Y19zdGF0ZTo6YWN0aXZlIGZvciB0aGlzIGVpdGhlciwgcGVyIGl0cwpkb2N1bWVudGF0
aW9uIGluIGluY2x1ZGUvZHJtL2RybV9jcnRjLmg6CgogKiBIZW5jZSBkcml2ZXJzIG11c3Qgbm90
IGNvbnN1bHQgQGFjdGl2ZSBpbiB0aGVpciB2YXJpb3VzCiAqICZkcm1fbW9kZV9jb25maWdfZnVu
Y3MuYXRvbWljX2NoZWNrIGNhbGxiYWNrIHRvIHJlamVjdCBhbiBhdG9taWMKICogY29tbWl0LgoK
YXRvbWljX3JlbW92ZV9mYiBkaXNhYmxlcyB0aGUgQ1JUQyBhcyBuZWVkZWQgZm9yIGRpc2FibGlu
ZyB0aGUgcHJpbWFyeQpwbGFuZS4KClRoaXMgcHJldmVudHMgYXQgbGVhc3QgdGhlIGZvbGxvd2lu
ZyBwcm9ibGVtcyBpZiB0aGUgcHJpbWFyeSBwbGFuZSBnZXRzCmRpc2FibGVkIChlLmcuIGR1ZSB0
byBkZXN0cm95aW5nIHRoZSBGQiBhc3NpZ25lZCB0byB0aGUgcHJpbWFyeSBwbGFuZSwKYXMgaGFw
cGVucyBlLmcuIHdpdGggbXV0dGVyIGluIFdheWxhbmQgbW9kZSk6CgoqIFRoZSBsZWdhY3kgY3Vy
c29yIGlvY3RsIHJldHVybmVkIEVJTlZBTCBmb3IgYSBub24tMCBjdXJzb3IgRkIgSUQKICAod2hp
Y2ggZW5hYmxlcyB0aGUgY3Vyc29yIHBsYW5lKS4KKiBJZiB0aGUgY3Vyc29yIHBsYW5lIHdhcyBl
bmFibGVkLCBjaGFuZ2luZyB0aGUgbGVnYWN5IERQTVMgcHJvcGVydHkKICB2YWx1ZSBmcm9tIG9m
ZiB0byBvbiByZXR1cm5lZCBFSU5WQUwuCgp2MjoKKiBNaW5vciBjaGFuZ2VzIHRvIGNvZGUgY29t
bWVudCBhbmQgY29tbWl0IGxvZywgcGVyIHJldmlldyBmZWVkYmFjay4KCkdpdExhYjogaHR0cHM6
Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL211dHRlci8tL2lzc3Vlcy8xMTA4CkdpdExhYjogaHR0
cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL211dHRlci8tL2lzc3Vlcy8xMTY1CkdpdExhYjog
aHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL211dHRlci8tL2lzc3Vlcy8xMzQ0ClN1Z2dl
c3RlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KU2lnbmVkLW9m
Zi1ieTogTWljaGVsIETDpG56ZXIgPG1kYWVuemVyQHJlZGhhdC5jb20+Ci0tLQogLi4uL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMzIgKysrKysrLS0tLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
CmluZGV4IDQ1ZjVmNGI3MDI0ZC4uYzVmOTQ1MjQ5MGQ2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTUyNjksMTkgKzUyNjks
NiBAQCBzdGF0aWMgdm9pZCBkbV9jcnRjX2hlbHBlcl9kaXNhYmxlKHN0cnVjdCBkcm1fY3J0YyAq
Y3J0YykKIHsKIH0KIAotc3RhdGljIGJvb2wgZG9lc19jcnRjX2hhdmVfYWN0aXZlX2N1cnNvcihz
dHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm5ld19jcnRjX3N0YXRlKQotewotCXN0cnVjdCBkcm1fZGV2
aWNlICpkZXYgPSBuZXdfY3J0Y19zdGF0ZS0+Y3J0Yy0+ZGV2OwotCXN0cnVjdCBkcm1fcGxhbmUg
KnBsYW5lOwotCi0JZHJtX2Zvcl9lYWNoX3BsYW5lX21hc2socGxhbmUsIGRldiwgbmV3X2NydGNf
c3RhdGUtPnBsYW5lX21hc2spIHsKLQkJaWYgKHBsYW5lLT50eXBlID09IERSTV9QTEFORV9UWVBF
X0NVUlNPUikKLQkJCXJldHVybiB0cnVlOwotCX0KLQotCXJldHVybiBmYWxzZTsKLX0KLQogc3Rh
dGljIGludCBjb3VudF9jcnRjX2FjdGl2ZV9wbGFuZXMoc3RydWN0IGRybV9jcnRjX3N0YXRlICpu
ZXdfY3J0Y19zdGF0ZSkKIHsKIAlzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUgPSBuZXdf
Y3J0Y19zdGF0ZS0+c3RhdGU7CkBAIC01MzQ1LDE5ICs1MzMyLDIwIEBAIHN0YXRpYyBpbnQgZG1f
Y3J0Y19oZWxwZXJfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAkJcmV0dXJu
IHJldDsKIAl9CiAKLQkvKiBJbiBzb21lIHVzZSBjYXNlcywgbGlrZSByZXNldCwgbm8gc3RyZWFt
IGlzIGF0dGFjaGVkICovCi0JaWYgKCFkbV9jcnRjX3N0YXRlLT5zdHJlYW0pCi0JCXJldHVybiAw
OwotCiAJLyoKLQkgKiBXZSB3YW50IGF0IGxlYXN0IG9uZSBoYXJkd2FyZSBwbGFuZSBlbmFibGVk
IHRvIHVzZQotCSAqIHRoZSBzdHJlYW0gd2l0aCBhIGN1cnNvciBlbmFibGVkLgorCSAqIFdlIHJl
cXVpcmUgdGhlIHByaW1hcnkgcGxhbmUgdG8gYmUgZW5hYmxlZCB3aGVuZXZlciB0aGUgQ1JUQyBp
cywgb3RoZXJ3aXNlCisJICogZHJtX21vZGVfY3Vyc29yX3VuaXZlcnNhbCBtYXkgZW5kIHVwIHRy
eWluZyB0byBlbmFibGUgdGhlIGN1cnNvciBwbGFuZSB3aGlsZSBhbGwgb3RoZXIKKwkgKiBwbGFu
ZXMgYXJlIGRpc2FibGVkLCB3aGljaCBpcyBub3Qgc3VwcG9ydGVkIGJ5IHRoZSBoYXJkd2FyZS4g
QW5kIHRoZXJlIGlzIGxlZ2FjeQorCSAqIHVzZXJzcGFjZSB3aGljaCBzdG9wcyB1c2luZyB0aGUg
SFcgY3Vyc29yIGFsdG9nZXRoZXIgaW4gcmVzcG9uc2UgdG8gdGhlIHJlc3VsdGluZyBFSU5WQUwu
CiAJICovCi0JaWYgKHN0YXRlLT5lbmFibGUgJiYgc3RhdGUtPmFjdGl2ZSAmJgotCSAgICBkb2Vz
X2NydGNfaGF2ZV9hY3RpdmVfY3Vyc29yKHN0YXRlKSAmJgotCSAgICBkbV9jcnRjX3N0YXRlLT5h
Y3RpdmVfcGxhbmVzID09IDApCisJaWYgKHN0YXRlLT5lbmFibGUgJiYKKwkgICAgIShzdGF0ZS0+
cGxhbmVfbWFzayAmIGRybV9wbGFuZV9tYXNrKGNydGMtPnByaW1hcnkpKSkKIAkJcmV0dXJuIC1F
SU5WQUw7CiAKKwkvKiBJbiBzb21lIHVzZSBjYXNlcywgbGlrZSByZXNldCwgbm8gc3RyZWFtIGlz
IGF0dGFjaGVkICovCisJaWYgKCFkbV9jcnRjX3N0YXRlLT5zdHJlYW0pCisJCXJldHVybiAwOwor
CiAJaWYgKGRjX3ZhbGlkYXRlX3N0cmVhbShkYywgZG1fY3J0Y19zdGF0ZS0+c3RyZWFtKSA9PSBE
Q19PSykKIAkJcmV0dXJuIDA7CiAKLS0gCjIuMjguMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
