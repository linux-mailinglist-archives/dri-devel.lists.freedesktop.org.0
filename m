Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7B7BCD9F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D306EAA1;
	Tue, 24 Sep 2019 16:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5C56EA9F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 16:48:52 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4B06221D7E;
 Tue, 24 Sep 2019 16:48:51 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 02/50] drm/bridge: adv7511: Attach to DSI host at
 probe time
Date: Tue, 24 Sep 2019 12:47:59 -0400
Message-Id: <20190924164847.27780-2-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164847.27780-1-sashal@kernel.org>
References: <20190924164847.27780-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343732;
 bh=eQQX1mrwjoz4wTwPLvSAkqRdOPfl9X+kxA550T8b/II=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aAkS63XNwZoegXuRfTRkGwdD/8V1m5kr+V7izCMt2zGDRrjIy1cgybWdjFdbAlR4F
 K2EwiGv4tvv7ST/2qm4LVs+t1c5hdeYCij3G9ArDhMiAkRV4dW2OW2zjoohbCn7AG8
 GElqFksapJpF5fpDuHBvaJjehjcR0XC+5Bxsovt0=
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
Cc: Sasha Levin <sashal@kernel.org>, Matt Redfearn <matt.redfearn@thinci.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWF0dCBSZWRmZWFybiA8bWF0dC5yZWRmZWFybkB0aGluY2kuY29tPgoKWyBVcHN0cmVh
bSBjb21taXQgODNmMzViYzNhODUyZjFjMzg5MmM3NDc0OTk4YzVjZWM3MDdjN2JhMyBdCgpJbiBj
b250cmFzdCB0byBhbGwgb2YgdGhlIERTSSBwYW5lbCBkcml2ZXJzIGluIGRyaXZlcnMvZ3B1L2Ry
bS9wYW5lbAp3aGljaCBhdHRhY2ggdG8gdGhlIERTSSBob3N0IHZpYSBtaXBpX2RzaV9hdHRhY2go
KSBhdCBwcm9iZSB0aW1lLCB0aGUKQURWNzUzMyBicmlkZ2UgZGV2aWNlIGRvZXMgbm90LiBJbnN0
ZWFkIGl0IGRlZmVycyB0aGlzIHRvIHRoZSBwb2ludCB0aGF0CnRoZSB1cHN0cmVhbSBkZXZpY2Ug
Y29ubmVjdHMgdG8gaXRzIGJyaWRnZSB2aWEgZHJtX2JyaWRnZV9hdHRhY2goKS4KVGhlIGdlbmVy
aWMgU3lub3BzeXMgTUlQSSBEU0kgaG9zdCBkcml2ZXIgZG9lcyBub3QgcmVnaXN0ZXIgaXQncyBv
d24KZHJtX2JyaWRnZSB1bnRpbCB0aGUgTUlQSSBEU0kgaGFzIGF0dGFjaGVkLiBCdXQgaXQgZG9l
cyBub3QgY2FsbApkcm1fYnJpZGdlX2F0dGFjaCgpIG9uIHRoZSBkb3duc3RyZWFtIGRldmljZSB1
bnRpbCB0aGUgdXBzdHJlYW0gZGV2aWNlCmhhcyBhdHRhY2hlZC4gVGhpcyBsZWFkcyB0byBhIGNo
aWNrZW4gYW5kIHRoZSBlZ2cgZmFpbHVyZSBhbmQgdGhlIERSTQpwaXBlbGluZSBkb2VzIG5vdCBj
b21wbGV0ZS4KU2luY2UgYWxsIG90aGVyIG1pcGlfZHNpX2RldmljZSBkcml2ZXJzIGNhbGwgbWlw
aV9kc2lfYXR0YWNoKCkgaW4KcHJvYmUoKSwgbWFrZSB0aGUgYWR2NzUzMyBtaXBpX2RzaV9kZXZp
Y2UgZG8gdGhlIHNhbWUuIFRoaXMgZW5zdXJlcyB0aGF0CnRoZSBTeW5vcHN5cyBNSVBJIERTSSBo
b3N0IHJlZ2lzdGVycyBpdCdzIGJyaWRnZSBzdWNoIHRoYXQgaXQgaXMKYXZhaWxhYmxlIGZvciB0
aGUgdXBzdHJlYW0gZGV2aWNlIHRvIGNvbm5lY3QgdG8uCgpTaWduZWQtb2ZmLWJ5OiBNYXR0IFJl
ZGZlYXJuIDxtYXR0LnJlZGZlYXJuQHRoaW5jaS5jb20+ClNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWog
SGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Ckxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVk
ZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MDYyNzE1MTc0MC4yMjc3LTEtbWF0dC5yZWRmZWFy
bkB0aGluY2kuY29tClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9y
Zz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYyB8IDEy
ICsrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUx
MV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jCmlu
ZGV4IGU3ZGRkM2UzZGI5MjAuLjgwNzgyN2JkOTEwZTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jCkBAIC04NzQsOSArODc0LDYgQEAgc3RhdGljIGlu
dCBhZHY3NTExX2JyaWRnZV9hdHRhY2goc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKIAkJCQkg
JmFkdjc1MTFfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7CiAJZHJtX2Nvbm5lY3Rvcl9hdHRhY2hf
ZW5jb2RlcigmYWR2LT5jb25uZWN0b3IsIGJyaWRnZS0+ZW5jb2Rlcik7CiAKLQlpZiAoYWR2LT50
eXBlID09IEFEVjc1MzMpCi0JCXJldCA9IGFkdjc1MzNfYXR0YWNoX2RzaShhZHYpOwotCiAJaWYg
KGFkdi0+aTJjX21haW4tPmlycSkKIAkJcmVnbWFwX3dyaXRlKGFkdi0+cmVnbWFwLCBBRFY3NTEx
X1JFR19JTlRfRU5BQkxFKDApLAogCQkJICAgICBBRFY3NTExX0lOVDBfSFBEKTsKQEAgLTEyMjIs
OCArMTIxOSwxNyBAQCBzdGF0aWMgaW50IGFkdjc1MTFfcHJvYmUoc3RydWN0IGkyY19jbGllbnQg
KmkyYywgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmlkKQogCWRybV9icmlkZ2VfYWRkKCZh
ZHY3NTExLT5icmlkZ2UpOwogCiAJYWR2NzUxMV9hdWRpb19pbml0KGRldiwgYWR2NzUxMSk7CisK
KwlpZiAoYWR2NzUxMS0+dHlwZSA9PSBBRFY3NTMzKSB7CisJCXJldCA9IGFkdjc1MzNfYXR0YWNo
X2RzaShhZHY3NTExKTsKKwkJaWYgKHJldCkKKwkJCWdvdG8gZXJyX3JlbW92ZV9icmlkZ2U7CisJ
fQorCiAJcmV0dXJuIDA7CiAKK2Vycl9yZW1vdmVfYnJpZGdlOgorCWRybV9icmlkZ2VfcmVtb3Zl
KCZhZHY3NTExLT5icmlkZ2UpOwogZXJyX3VucmVnaXN0ZXJfY2VjOgogCWkyY191bnJlZ2lzdGVy
X2RldmljZShhZHY3NTExLT5pMmNfY2VjKTsKIAlpZiAoYWR2NzUxMS0+Y2VjX2NsaykKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
