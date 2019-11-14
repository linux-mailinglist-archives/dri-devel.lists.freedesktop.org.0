Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71923FC4CA
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 11:57:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84426E79E;
	Thu, 14 Nov 2019 10:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A882A6E79B
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 10:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id D09893F7F2;
 Thu, 14 Nov 2019 11:56:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GjVKRJW0TCpt; Thu, 14 Nov 2019 11:56:56 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 399C63F773;
 Thu, 14 Nov 2019 11:56:55 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id CAF583601A7;
 Thu, 14 Nov 2019 11:56:54 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org,
	linux-graphics-maintainer@vmware.com
Subject: [PATCH 2/3] drm/vmwgfx: Remove the restrict_dma_mask module parameter
Date: Thu, 14 Nov 2019 11:56:44 +0100
Message-Id: <20191114105645.41578-3-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191114105645.41578-1-thomas_os@shipmail.org>
References: <20191114105645.41578-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1573729014; bh=AJaJrljk29gEbDTFffVqko6PpJ2DtlgjxTfPqyQO/EU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SyelVUUbwxic9mXFVelZheWBhgNZk0D4rI+9o15Z08wUqxMswiZTzv4LAx9szKvUG
 0AZjcWZ4lCilPH+A+P47SrgyJOAP93qaVSexPifybTZ2jgEGeFJU6z7OVe1dav4O9P
 UE90VY7aV0dSjE3fPX0W75p2nWaxLjzkmKF0hkkM=
X-Mailman-Original-Authentication-Results: ste-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=SyelVUUb; 
 dkim-atps=neutral
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKVGhlIHJlc3Ry
aWN0X2RtYV9tYXNrIHdhcyBtYWlubHkgdXNlZCBmb3IgaW9tbXUgZnVuY3Rpb25hbGl0eSBkZWJ1
Z2dpbmcKYW5kIGhhcyBubyB1c2UgYW55bW9yZS4gUmVtb3ZlIGl0LgoKU2lnbmVkLW9mZi1ieTog
VGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jIHwgNSArLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMK
aW5kZXggNjBlZjAzMTIwOTE3Li44ZDQ3OWE0MTFjZGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X2Rydi5jCkBAIC0yNTUsNyArMjU1LDYgQEAgc3RhdGljIGludCBlbmFibGVfZmJkZXYgPSBJ
U19FTkFCTEVEKENPTkZJR19EUk1fVk1XR0ZYX0ZCQ09OKTsKIHN0YXRpYyBpbnQgdm13X2ZvcmNl
X2lvbW11Owogc3RhdGljIGludCB2bXdfcmVzdHJpY3RfaW9tbXU7CiBzdGF0aWMgaW50IHZtd19m
b3JjZV9jb2hlcmVudDsKLXN0YXRpYyBpbnQgdm13X3Jlc3RyaWN0X2RtYV9tYXNrOwogc3RhdGlj
IGludCB2bXdfYXNzdW1lXzE2YnBwOwogCiBzdGF0aWMgaW50IHZtd19wcm9iZShzdHJ1Y3QgcGNp
X2RldiAqLCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqKTsKQEAgLTI3MCw4ICsyNjksNiBA
QCBNT0RVTEVfUEFSTV9ERVNDKHJlc3RyaWN0X2lvbW11LCAiVHJ5IHRvIGxpbWl0IElPTU1VIHVz
YWdlIGZvciBUVE0gcGFnZXMiKTsKIG1vZHVsZV9wYXJhbV9uYW1lZChyZXN0cmljdF9pb21tdSwg
dm13X3Jlc3RyaWN0X2lvbW11LCBpbnQsIDA2MDApOwogTU9EVUxFX1BBUk1fREVTQyhmb3JjZV9j
b2hlcmVudCwgIkZvcmNlIGNvaGVyZW50IFRUTSBwYWdlcyIpOwogbW9kdWxlX3BhcmFtX25hbWVk
KGZvcmNlX2NvaGVyZW50LCB2bXdfZm9yY2VfY29oZXJlbnQsIGludCwgMDYwMCk7Ci1NT0RVTEVf
UEFSTV9ERVNDKHJlc3RyaWN0X2RtYV9tYXNrLCAiUmVzdHJpY3QgRE1BIG1hc2sgdG8gNDQgYml0
cyB3aXRoIElPTU1VIik7Ci1tb2R1bGVfcGFyYW1fbmFtZWQocmVzdHJpY3RfZG1hX21hc2ssIHZt
d19yZXN0cmljdF9kbWFfbWFzaywgaW50LCAwNjAwKTsKIE1PRFVMRV9QQVJNX0RFU0MoYXNzdW1l
XzE2YnBwLCAiQXNzdW1lIDE2LWJwcCB3aGVuIGZpbHRlcmluZyBtb2RlcyIpOwogbW9kdWxlX3Bh
cmFtX25hbWVkKGFzc3VtZV8xNmJwcCwgdm13X2Fzc3VtZV8xNmJwcCwgaW50LCAwNjAwKTsKIApA
QCAtNTk3LDcgKzU5NCw3IEBAIHN0YXRpYyBpbnQgdm13X2RtYV9tYXNrcyhzdHJ1Y3Qgdm13X3By
aXZhdGUgKmRldl9wcml2KQogCWludCByZXQgPSAwOwogCiAJcmV0ID0gZG1hX3NldF9tYXNrX2Fu
ZF9jb2hlcmVudChkZXYtPmRldiwgRE1BX0JJVF9NQVNLKDY0KSk7Ci0JaWYgKHNpemVvZih1bnNp
Z25lZCBsb25nKSA9PSA0IHx8IHZtd19yZXN0cmljdF9kbWFfbWFzaykgeworCWlmIChzaXplb2Yo
dW5zaWduZWQgbG9uZykgPT0gNCkgewogCQlEUk1fSU5GTygiUmVzdHJpY3RpbmcgRE1BIGFkZHJl
c3NlcyB0byA0NCBiaXRzLlxuIik7CiAJCXJldHVybiBkbWFfc2V0X21hc2tfYW5kX2NvaGVyZW50
KGRldi0+ZGV2LCBETUFfQklUX01BU0soNDQpKTsKIAl9Ci0tIAoyLjIxLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
