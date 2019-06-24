Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E9852468
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB97989FA9;
	Tue, 25 Jun 2019 07:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Mon, 24 Jun 2019 16:10:46 UTC
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net
 [194.109.24.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AB089CDE
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 16:10:46 +0000 (UTC)
Received: from tschai.fritz.box ([46.9.252.75])
 by smtp-cloud7.xs4all.net with ESMTPA
 id fRRKhHRxHF85OfRRQhZaa6; Mon, 24 Jun 2019 18:03:36 +0200
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCHv8 01/13] cec-notifier: rename variable, check kstrdup
Date: Mon, 24 Jun 2019 18:03:18 +0200
Message-Id: <20190624160330.38048-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
References: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfM5cfxY3qb1mJIOEfAgwxyzmneGu3DOIaGPtL1rXLfi9ZKPJS+IAvic+bCsU2HYwU9mQ1Jj1vHvFgU1ggcDsS/Y2kgf9iITUsRBXY3PD2phToQDCc7VC
 D9qy5VUksdVPfDlhsMqkQ4ta3+MCDxaWUKQ6XF5uM0Pgj8Uzc7q7Z4+g7+bpnB84Bzr3ImR4/G2lpXfhExjbQs/zQ97F56agQHKYWaPCoJmGfuiZ99gNPSLK
 xMJH1wmKXksLI0BBia8s4T9UWN9fi3EdUobR/y8KiTA3A0PzNCZXkjLgBIpfyRqz/hqiWNfSRoqggyZF2UVHrUoIBaIJIgyVr8uN0djZrO4=
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
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
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dariusz Marcinkiewicz <darekm@google.com>, dri-devel@lists.freedesktop.org,
 Cheng-yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZGV2IC0+IGhkbWlfZGV2CmNvbm4gLT4gY29ubl9uYW1lCgpBbHNvIGNoZWNrIHRoZSByZXN1bHQg
b2Yga3N0cmR1cCwgYW5kIGNsZWFuIHVwIG9uIGVycm9yLgoKU2lnbmVkLW9mZi1ieTogSGFucyBW
ZXJrdWlsIDxodmVya3VpbC1jaXNjb0B4czRhbGwubmw+Ci0tLQogZHJpdmVycy9tZWRpYS9jZWMv
Y2VjLW5vdGlmaWVyLmMgfCAyNiArKysrKysrKysrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tZWRpYS9jZWMvY2VjLW5vdGlmaWVyLmMgYi9kcml2ZXJzL21lZGlhL2NlYy9jZWMtbm90
aWZpZXIuYwppbmRleCA5NTk4Yzc3Nzg4NzEuLmNlMTBkZmQ0MDBiYiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9tZWRpYS9jZWMvY2VjLW5vdGlmaWVyLmMKKysrIGIvZHJpdmVycy9tZWRpYS9jZWMvY2Vj
LW5vdGlmaWVyLmMKQEAgLTIxLDggKzIxLDggQEAgc3RydWN0IGNlY19ub3RpZmllciB7CiAJc3Ry
dWN0IG11dGV4IGxvY2s7CiAJc3RydWN0IGxpc3RfaGVhZCBoZWFkOwogCXN0cnVjdCBrcmVmIGty
ZWY7Ci0Jc3RydWN0IGRldmljZSAqZGV2OwotCWNvbnN0IGNoYXIgKmNvbm47CisJc3RydWN0IGRl
dmljZSAqaGRtaV9kZXY7CisJY29uc3QgY2hhciAqY29ubl9uYW1lOwogCXN0cnVjdCBjZWNfYWRh
cHRlciAqY2VjX2FkYXA7CiAJdm9pZCAoKmNhbGxiYWNrKShzdHJ1Y3QgY2VjX2FkYXB0ZXIgKmFk
YXAsIHUxNiBwYSk7CiAKQEAgLTMyLDE0ICszMiwxNSBAQCBzdHJ1Y3QgY2VjX25vdGlmaWVyIHsK
IHN0YXRpYyBMSVNUX0hFQUQoY2VjX25vdGlmaWVycyk7CiBzdGF0aWMgREVGSU5FX01VVEVYKGNl
Y19ub3RpZmllcnNfbG9jayk7CiAKLXN0cnVjdCBjZWNfbm90aWZpZXIgKmNlY19ub3RpZmllcl9n
ZXRfY29ubihzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKmNvbm4pCitzdHJ1Y3QgY2Vj
X25vdGlmaWVyICoKK2NlY19ub3RpZmllcl9nZXRfY29ubihzdHJ1Y3QgZGV2aWNlICpoZG1pX2Rl
diwgY29uc3QgY2hhciAqY29ubl9uYW1lKQogewogCXN0cnVjdCBjZWNfbm90aWZpZXIgKm47CiAK
IAltdXRleF9sb2NrKCZjZWNfbm90aWZpZXJzX2xvY2spOwogCWxpc3RfZm9yX2VhY2hfZW50cnko
biwgJmNlY19ub3RpZmllcnMsIGhlYWQpIHsKLQkJaWYgKG4tPmRldiA9PSBkZXYgJiYKLQkJICAg
ICghY29ubiB8fCAhc3RyY21wKG4tPmNvbm4sIGNvbm4pKSkgeworCQlpZiAobi0+aGRtaV9kZXYg
PT0gaGRtaV9kZXYgJiYKKwkJICAgICghY29ubl9uYW1lIHx8ICFzdHJjbXAobi0+Y29ubl9uYW1l
LCBjb25uX25hbWUpKSkgewogCQkJa3JlZl9nZXQoJm4tPmtyZWYpOwogCQkJbXV0ZXhfdW5sb2Nr
KCZjZWNfbm90aWZpZXJzX2xvY2spOwogCQkJcmV0dXJuIG47CkBAIC00OCwxMCArNDksMTcgQEAg
c3RydWN0IGNlY19ub3RpZmllciAqY2VjX25vdGlmaWVyX2dldF9jb25uKHN0cnVjdCBkZXZpY2Ug
KmRldiwgY29uc3QgY2hhciAqY29ubikKIAluID0ga3phbGxvYyhzaXplb2YoKm4pLCBHRlBfS0VS
TkVMKTsKIAlpZiAoIW4pCiAJCWdvdG8gdW5sb2NrOwotCW4tPmRldiA9IGRldjsKLQlpZiAoY29u
bikKLQkJbi0+Y29ubiA9IGtzdHJkdXAoY29ubiwgR0ZQX0tFUk5FTCk7CisJbi0+aGRtaV9kZXYg
PSBoZG1pX2RldjsKKwlpZiAoY29ubl9uYW1lKSB7CisJCW4tPmNvbm5fbmFtZSA9IGtzdHJkdXAo
Y29ubl9uYW1lLCBHRlBfS0VSTkVMKTsKKwkJaWYgKCFuLT5jb25uX25hbWUpIHsKKwkJCWtmcmVl
KG4pOworCQkJbiA9IE5VTEw7CisJCQlnb3RvIHVubG9jazsKKwkJfQorCX0KIAluLT5waHlzX2Fk
ZHIgPSBDRUNfUEhZU19BRERSX0lOVkFMSUQ7CisKIAltdXRleF9pbml0KCZuLT5sb2NrKTsKIAlr
cmVmX2luaXQoJm4tPmtyZWYpOwogCWxpc3RfYWRkX3RhaWwoJm4tPmhlYWQsICZjZWNfbm90aWZp
ZXJzKTsKQEAgLTY3LDcgKzc1LDcgQEAgc3RhdGljIHZvaWQgY2VjX25vdGlmaWVyX3JlbGVhc2Uo
c3RydWN0IGtyZWYgKmtyZWYpCiAJCWNvbnRhaW5lcl9vZihrcmVmLCBzdHJ1Y3QgY2VjX25vdGlm
aWVyLCBrcmVmKTsKIAogCWxpc3RfZGVsKCZuLT5oZWFkKTsKLQlrZnJlZShuLT5jb25uKTsKKwlr
ZnJlZShuLT5jb25uX25hbWUpOwogCWtmcmVlKG4pOwogfQogCi0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
