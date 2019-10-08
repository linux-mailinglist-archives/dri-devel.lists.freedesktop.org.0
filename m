Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7670D0807
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:13:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A15C6E903;
	Wed,  9 Oct 2019 07:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881056E115;
 Tue,  8 Oct 2019 11:36:02 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iHnma-0007Yt-I5; Tue, 08 Oct 2019 12:36:00 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iHnma-0007hg-6Z; Tue, 08 Oct 2019 12:36:00 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/nouveau/gr/gf100-: make undeclared symbols static
Date: Tue,  8 Oct 2019 12:35:55 +0100
Message-Id: <20191008113559.29569-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:12:50 +0000
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
Cc: David Airlie <airlied@linux.ie>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZvbGxvd2luZyBmdW5jdGlvbnMgYXJlIG5vdCBkZWNsYXJlZCBvdXRzaWRlIG9mIHRoZQpm
aWxlIHRoZXkgYXJlIGluLCBzbyBtYWtlIHRoZW0gc3RhdGljIHRvIGF2b2lkIHRoZXNlCndhcm5p
bmdzOgoKZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZ3IvZ2YxMDAuYzo3NDU6
MTogd2FybmluZzogc3ltYm9sICdnZjEwMF9ncl9mZWNzX3N0YXJ0X2N0eHN3JyB3YXMgbm90IGRl
Y2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwpkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmtt
L2VuZ2luZS9nci9nZjEwMC5jOjc2MDoxOiB3YXJuaW5nOiBzeW1ib2wgJ2dmMTAwX2dyX2ZlY3Nf
c3RvcF9jdHhzdycgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZ3IvZ2YxMDAuYzoyMDcxOjE6IHdhcm5pbmc6
IHN5bWJvbCAnZ2YxMDBfZ3JfY3Rvcl9md19sZWdhY3knIHdhcyBub3QgZGVjbGFyZWQuIFNob3Vs
ZCBpdCBiZSBzdGF0aWM/CgpTaWduZWQtb2ZmLWJ5OiBCZW4gRG9va3MgPGJlbi5kb29rc0Bjb2Rl
dGhpbmsuY28udWs+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZ3Iv
Z2YxMDAuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5n
aW5lL2dyL2dmMTAwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9nci9n
ZjEwMC5jCmluZGV4IGM1NzhkZWI1ODY3YS4uZjFkMTE3NGNlNjdhIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9nci9nZjEwMC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2dyL2dmMTAwLmMKQEAgLTc0MSw3ICs3NDEsNyBA
QCBnZjEwMF9ncl9mZWNzX2N0cmxfY3R4c3coc3RydWN0IGdmMTAwX2dyICpnciwgdTMyIG10aGQp
CiAJcmV0dXJuIC1FVElNRURPVVQ7CiB9CiAKLWludAorc3RhdGljIGludAogZ2YxMDBfZ3JfZmVj
c19zdGFydF9jdHhzdyhzdHJ1Y3QgbnZrbV9nciAqYmFzZSkKIHsKIAlzdHJ1Y3QgZ2YxMDBfZ3Ig
KmdyID0gZ2YxMDBfZ3IoYmFzZSk7CkBAIC03NTYsNyArNzU2LDcgQEAgZ2YxMDBfZ3JfZmVjc19z
dGFydF9jdHhzdyhzdHJ1Y3QgbnZrbV9nciAqYmFzZSkKIAlyZXR1cm4gcmV0OwogfQogCi1pbnQK
K3N0YXRpYyBpbnQKIGdmMTAwX2dyX2ZlY3Nfc3RvcF9jdHhzdyhzdHJ1Y3QgbnZrbV9nciAqYmFz
ZSkKIHsKIAlzdHJ1Y3QgZ2YxMDBfZ3IgKmdyID0gZ2YxMDBfZ3IoYmFzZSk7CkBAIC0yMDY3LDcg
KzIwNjcsNyBAQCBnZjEwMF9ncl8gPSB7CiAJLmN0eHN3Lmluc3QgPSBnZjEwMF9ncl9jdHhzd19p
bnN0LAogfTsKIAotaW50CitzdGF0aWMgaW50CiBnZjEwMF9ncl9jdG9yX2Z3X2xlZ2FjeShzdHJ1
Y3QgZ2YxMDBfZ3IgKmdyLCBjb25zdCBjaGFyICpmd25hbWUsCiAJCQlzdHJ1Y3QgZ2YxMDBfZ3Jf
ZnVjICpmdWMsIGludCByZXQpCiB7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
