Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 769D65192A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 18:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709AE89D56;
	Mon, 24 Jun 2019 16:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id D5B9789CF1;
 Mon, 24 Jun 2019 16:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 8D9DB2A6045;
 Mon, 24 Jun 2019 18:54:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id kbtblKDTY9YE; Mon, 24 Jun 2019 18:54:08 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 6826D2A604C;
 Mon, 24 Jun 2019 18:54:07 +0200 (CEST)
Received: from daenzer by thor with local (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hfSEI-0003Ze-KH; Mon, 24 Jun 2019 18:54:06 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH libdrm 3/9] amdgpu: Rename fd_mutex/list to dev_mutex/list
Date: Mon, 24 Jun 2019 18:54:00 +0200
Message-Id: <20190624165406.13682-4-michel@daenzer.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624165406.13682-1-michel@daenzer.net>
References: <20190624165406.13682-1-michel@daenzer.net>
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWljaGVsIETDpG56ZXIgPG1pY2hlbC5kYWVuemVyQGFtZC5jb20+CgpTZWVtcyB0byBi
ZXR0ZXIgcmVmbGVjdCB3aGF0IHRoZXkncmUgZm9yLgoKU2lnbmVkLW9mZi1ieTogTWljaGVsIETD
pG56ZXIgPG1pY2hlbC5kYWVuemVyQGFtZC5jb20+Ci0tLQogYW1kZ3B1L2FtZGdwdV9kZXZpY2Uu
YyB8IDMwICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE1
IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FtZGdwdS9hbWRn
cHVfZGV2aWNlLmMgYi9hbWRncHUvYW1kZ3B1X2RldmljZS5jCmluZGV4IDM2MjQ5NGIxLi43NmI0
ZTVlYiAxMDA2NDQKLS0tIGEvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYworKysgYi9hbWRncHUvYW1k
Z3B1X2RldmljZS5jCkBAIC00Myw4ICs0Myw4IEBACiAKICNkZWZpbmUgUFRSX1RPX1VJTlQoeCkg
KCh1bnNpZ25lZCkoKGludHB0cl90KSh4KSkpCiAKLXN0YXRpYyBwdGhyZWFkX211dGV4X3QgZmRf
bXV0ZXggPSBQVEhSRUFEX01VVEVYX0lOSVRJQUxJWkVSOwotc3RhdGljIGFtZGdwdV9kZXZpY2Vf
aGFuZGxlIGZkX2xpc3Q7CitzdGF0aWMgcHRocmVhZF9tdXRleF90IGRldl9tdXRleCA9IFBUSFJF
QURfTVVURVhfSU5JVElBTElaRVI7CitzdGF0aWMgYW1kZ3B1X2RldmljZV9oYW5kbGUgZGV2X2xp
c3Q7CiAKIHN0YXRpYyBpbnQgZmRfY29tcGFyZShpbnQgZmQxLCBpbnQgZmQyKQogewpAQCAtOTUs
MTMgKzk1LDEzIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2dldF9hdXRoKGludCBmZCwgaW50ICphdXRo
KQogCiBzdGF0aWMgdm9pZCBhbWRncHVfZGV2aWNlX2ZyZWVfaW50ZXJuYWwoYW1kZ3B1X2Rldmlj
ZV9oYW5kbGUgZGV2KQogewotCWFtZGdwdV9kZXZpY2VfaGFuZGxlICpub2RlID0gJmZkX2xpc3Q7
CisJYW1kZ3B1X2RldmljZV9oYW5kbGUgKm5vZGUgPSAmZGV2X2xpc3Q7CiAKLQlwdGhyZWFkX211
dGV4X2xvY2soJmZkX211dGV4KTsKKwlwdGhyZWFkX211dGV4X2xvY2soJmRldl9tdXRleCk7CiAJ
d2hpbGUgKCpub2RlICE9IGRldiAmJiAoKm5vZGUpLT5uZXh0KQogCQlub2RlID0gJigqbm9kZSkt
Pm5leHQ7CiAJKm5vZGUgPSAoKm5vZGUpLT5uZXh0OwotCXB0aHJlYWRfbXV0ZXhfdW5sb2NrKCZm
ZF9tdXRleCk7CisJcHRocmVhZF9tdXRleF91bmxvY2soJmRldl9tdXRleCk7CiAKIAljbG9zZShk
ZXYtPmZkKTsKIAlpZiAoKGRldi0+ZmxpbmtfZmQgPj0gMCkgJiYgKGRldi0+ZmQgIT0gZGV2LT5m
bGlua19mZCkpCkBAIC0xNTUsMTYgKzE1NSwxNiBAQCBkcm1fcHVibGljIGludCBhbWRncHVfZGV2
aWNlX2luaXRpYWxpemUoaW50IGZkLAogCiAJKmRldmljZV9oYW5kbGUgPSBOVUxMOwogCi0JcHRo
cmVhZF9tdXRleF9sb2NrKCZmZF9tdXRleCk7CisJcHRocmVhZF9tdXRleF9sb2NrKCZkZXZfbXV0
ZXgpOwogCXIgPSBhbWRncHVfZ2V0X2F1dGgoZmQsICZmbGFnX2F1dGgpOwogCWlmIChyKSB7CiAJ
CWZwcmludGYoc3RkZXJyLCAiJXM6IGFtZGdwdV9nZXRfYXV0aCAoMSkgZmFpbGVkICglaSlcbiIs
CiAJCQlfX2Z1bmNfXywgcik7Ci0JCXB0aHJlYWRfbXV0ZXhfdW5sb2NrKCZmZF9tdXRleCk7CisJ
CXB0aHJlYWRfbXV0ZXhfdW5sb2NrKCZkZXZfbXV0ZXgpOwogCQlyZXR1cm4gcjsKIAl9CiAKLQlm
b3IgKGRldiA9IGZkX2xpc3Q7IGRldjsgZGV2ID0gZGV2LT5uZXh0KQorCWZvciAoZGV2ID0gZGV2
X2xpc3Q7IGRldjsgZGV2ID0gZGV2LT5uZXh0KQogCQlpZiAoZmRfY29tcGFyZShkZXYtPmZkLCBm
ZCkgPT0gMCkKIAkJCWJyZWFrOwogCkBAIC0xNzMsNyArMTczLDcgQEAgZHJtX3B1YmxpYyBpbnQg
YW1kZ3B1X2RldmljZV9pbml0aWFsaXplKGludCBmZCwKIAkJaWYgKHIpIHsKIAkJCWZwcmludGYo
c3RkZXJyLCAiJXM6IGFtZGdwdV9nZXRfYXV0aCAoMikgZmFpbGVkICglaSlcbiIsCiAJCQkJX19m
dW5jX18sIHIpOwotCQkJcHRocmVhZF9tdXRleF91bmxvY2soJmZkX211dGV4KTsKKwkJCXB0aHJl
YWRfbXV0ZXhfdW5sb2NrKCZkZXZfbXV0ZXgpOwogCQkJcmV0dXJuIHI7CiAJCX0KIAkJaWYgKChm
bGFnX2F1dGgpICYmICghZmxhZ19hdXRoZXhpc3QpKSB7CkBAIC0xODIsMTQgKzE4MiwxNCBAQCBk
cm1fcHVibGljIGludCBhbWRncHVfZGV2aWNlX2luaXRpYWxpemUoaW50IGZkLAogCQkqbWFqb3Jf
dmVyc2lvbiA9IGRldi0+bWFqb3JfdmVyc2lvbjsKIAkJKm1pbm9yX3ZlcnNpb24gPSBkZXYtPm1p
bm9yX3ZlcnNpb247CiAJCWFtZGdwdV9kZXZpY2VfcmVmZXJlbmNlKGRldmljZV9oYW5kbGUsIGRl
dik7Ci0JCXB0aHJlYWRfbXV0ZXhfdW5sb2NrKCZmZF9tdXRleCk7CisJCXB0aHJlYWRfbXV0ZXhf
dW5sb2NrKCZkZXZfbXV0ZXgpOwogCQlyZXR1cm4gMDsKIAl9CiAKIAlkZXYgPSBjYWxsb2MoMSwg
c2l6ZW9mKHN0cnVjdCBhbWRncHVfZGV2aWNlKSk7CiAJaWYgKCFkZXYpIHsKIAkJZnByaW50Zihz
dGRlcnIsICIlczogY2FsbG9jIGZhaWxlZFxuIiwgX19mdW5jX18pOwotCQlwdGhyZWFkX211dGV4
X3VubG9jaygmZmRfbXV0ZXgpOworCQlwdGhyZWFkX211dGV4X3VubG9jaygmZGV2X211dGV4KTsK
IAkJcmV0dXJuIC1FTk9NRU07CiAJfQogCkBAIC0yNjUsOSArMjY1LDkgQEAgZHJtX3B1YmxpYyBp
bnQgYW1kZ3B1X2RldmljZV9pbml0aWFsaXplKGludCBmZCwKIAkqbWFqb3JfdmVyc2lvbiA9IGRl
di0+bWFqb3JfdmVyc2lvbjsKIAkqbWlub3JfdmVyc2lvbiA9IGRldi0+bWlub3JfdmVyc2lvbjsK
IAkqZGV2aWNlX2hhbmRsZSA9IGRldjsKLQlkZXYtPm5leHQgPSBmZF9saXN0OwotCWZkX2xpc3Qg
PSBkZXY7Ci0JcHRocmVhZF9tdXRleF91bmxvY2soJmZkX211dGV4KTsKKwlkZXYtPm5leHQgPSBk
ZXZfbGlzdDsKKwlkZXZfbGlzdCA9IGRldjsKKwlwdGhyZWFkX211dGV4X3VubG9jaygmZGV2X211
dGV4KTsKIAogCXJldHVybiAwOwogCkBAIC0yNzUsNyArMjc1LDcgQEAgY2xlYW51cDoKIAlpZiAo
ZGV2LT5mZCA+PSAwKQogCQljbG9zZShkZXYtPmZkKTsKIAlmcmVlKGRldik7Ci0JcHRocmVhZF9t
dXRleF91bmxvY2soJmZkX211dGV4KTsKKwlwdGhyZWFkX211dGV4X3VubG9jaygmZGV2X211dGV4
KTsKIAlyZXR1cm4gcjsKIH0KIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
