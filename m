Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EAA56408
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07FC6E2C1;
	Wed, 26 Jun 2019 08:12:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net
 [194.109.24.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62B76E131
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 14:45:17 +0000 (UTC)
Received: from cobaltpc1.rd.cisco.com
 ([IPv6:2001:420:44c1:2579:b032:593c:25fc:ff9b])
 by smtp-cloud9.xs4all.net with ESMTPA
 id fmh4hQwJSSfvXfmhBhHp0d; Tue, 25 Jun 2019 16:45:17 +0200
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCHv9 11/13] tda9950: use cec_notifier_cec_adap_(un)register
Date: Tue, 25 Jun 2019 16:45:08 +0200
Message-Id: <20190625144510.122214-12-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625144510.122214-1-hverkuil-cisco@xs4all.nl>
References: <20190625144510.122214-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfIo22fLBIrqLMrXisr54Oz7ccU5U7XrkX5DqS6e4gjZCJDJZRwR7HVkEE6n7qWgdpxc4gdVprEUsxmIO7u7A4kSJm1ZMYKCM9GPw4XNwYWyQ+Yy206sO
 8UOAgAhk2FID2WCfrssWt2OuksRbq/48El4w9eIkWbzZOD5di6vBRkkL0fJAaPA6KJGO0jDFY6McPqSDGQ1vgv3TBj1bvljUvLVCq3SBaXB4pIfT7mBmBEFn
 EJsZDAkB/wkU88ekHbdFfvLcrLiVt/xlTF/6Svej/c7UAtEOmfOW9g91mLRz6JgxP90TrHaHLf/mh3cXLf/04ILJvo/77mQOiwliRa/+EKmLkuo258l2WAuP
 cQRujG7QhQEvHiym9xGYBJXIZfyp27/4N/GZpDbUdehbVYPqSmOkJB8xCaw8oEBetoqYoi0p
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
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

RnJvbTogRGFyaXVzeiBNYXJjaW5raWV3aWN6IDxkYXJla21AZ29vZ2xlLmNvbT4KClVzZSB0aGUg
bmV3IGNlY19ub3RpZmllcl9jZWNfYWRhcF8odW4pcmVnaXN0ZXIoKSBmdW5jdGlvbnMgdG8KKHVu
KXJlZ2lzdGVyIHRoZSBub3RpZmllciBmb3IgdGhlIENFQyBhZGFwdGVyLgoKU2lnbmVkLW9mZi1i
eTogRGFyaXVzeiBNYXJjaW5raWV3aWN6IDxkYXJla21AZ29vZ2xlLmNvbT4KU2lnbmVkLW9mZi1i
eTogSGFucyBWZXJrdWlsIDxodmVya3VpbC1jaXNjb0B4czRhbGwubmw+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2kyYy90ZGE5OTUwLmMgfCAxMSArKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTJjL3RkYTk5NTAuYyBiL2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk1MC5jCmluZGV4IDI1
MGI1ZTAyYTMxNC4uMmYzMzgxZjBiMmJmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTJj
L3RkYTk5NTAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5NTAuYwpAQCAtNDIzLDcg
KzQyMyw3IEBAIHN0YXRpYyBpbnQgdGRhOTk1MF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xp
ZW50LAogCQlwcml2LT5oZG1pID0gZ2x1ZS0+cGFyZW50OwogCiAJcHJpdi0+YWRhcCA9IGNlY19h
bGxvY2F0ZV9hZGFwdGVyKCZ0ZGE5OTUwX2NlY19vcHMsIHByaXYsICJ0ZGE5OTUwIiwKLQkJCQkJ
ICBDRUNfQ0FQX0RFRkFVTFRTLAorCQkJCQkgIENFQ19DQVBfREVGQVVMVFMgfCBDRUNfQ0FQX0NP
Tk5FQ1RPUl9JTkZPLAogCQkJCQkgIENFQ19NQVhfTE9HX0FERFJTKTsKIAlpZiAoSVNfRVJSKHBy
aXYtPmFkYXApKQogCQlyZXR1cm4gUFRSX0VSUihwcml2LT5hZGFwKTsKQEAgLTQ2MCwxMyArNDYw
LDE0IEBAIHN0YXRpYyBpbnQgdGRhOTk1MF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50
LAogCWlmIChyZXQgPCAwKQogCQlyZXR1cm4gcmV0OwogCi0JcHJpdi0+bm90aWZ5ID0gY2VjX25v
dGlmaWVyX2dldChwcml2LT5oZG1pKTsKKwlwcml2LT5ub3RpZnkgPSBjZWNfbm90aWZpZXJfY2Vj
X2FkYXBfcmVnaXN0ZXIocHJpdi0+aGRtaSwgTlVMTCwKKwkJCQkJCSAgICAgIHByaXYtPmFkYXAp
OwogCWlmICghcHJpdi0+bm90aWZ5KQogCQlyZXR1cm4gLUVOT01FTTsKIAogCXJldCA9IGNlY19y
ZWdpc3Rlcl9hZGFwdGVyKHByaXYtPmFkYXAsIHByaXYtPmhkbWkpOwogCWlmIChyZXQgPCAwKSB7
Ci0JCWNlY19ub3RpZmllcl9wdXQocHJpdi0+bm90aWZ5KTsKKwkJY2VjX25vdGlmaWVyX2NlY19h
ZGFwX3VucmVnaXN0ZXIocHJpdi0+bm90aWZ5KTsKIAkJcmV0dXJuIHJldDsKIAl9CiAKQEAgLTQ3
Niw4ICs0NzcsNiBAQCBzdGF0aWMgaW50IHRkYTk5NTBfcHJvYmUoc3RydWN0IGkyY19jbGllbnQg
KmNsaWVudCwKIAkgKi8KIAlkZXZtX3JlbW92ZV9hY3Rpb24oZGV2LCB0ZGE5OTUwX2NlY19kZWws
IHByaXYpOwogCi0JY2VjX3JlZ2lzdGVyX2NlY19ub3RpZmllcihwcml2LT5hZGFwLCBwcml2LT5u
b3RpZnkpOwotCiAJcmV0dXJuIDA7CiB9CiAKQEAgLTQ4NSw4ICs0ODQsOCBAQCBzdGF0aWMgaW50
IHRkYTk5NTBfcmVtb3ZlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCiB7CiAJc3RydWN0IHRk
YTk5NTBfcHJpdiAqcHJpdiA9IGkyY19nZXRfY2xpZW50ZGF0YShjbGllbnQpOwogCisJY2VjX25v
dGlmaWVyX2NlY19hZGFwX3VucmVnaXN0ZXIocHJpdi0+bm90aWZ5KTsKIAljZWNfdW5yZWdpc3Rl
cl9hZGFwdGVyKHByaXYtPmFkYXApOwotCWNlY19ub3RpZmllcl9wdXQocHJpdi0+bm90aWZ5KTsK
IAogCXJldHVybiAwOwogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
