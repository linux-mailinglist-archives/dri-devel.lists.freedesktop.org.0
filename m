Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF3D460FF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 16:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA8989971;
	Fri, 14 Jun 2019 14:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EA389971
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 14:39:14 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hbnMF-0006G2-Pz; Fri, 14 Jun 2019 14:39:11 +0000
From: Colin King <colin.king@canonical.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/mgag200: add in missing { } around if block
Date: Fri, 14 Jun 2019 15:39:11 +0100
Message-Id: <20190614143911.21806-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZXJlIGlz
IGFuIGlmIGJsb2NrIHRoYXQgaXMgbWlzc2luZyB0aGUgeyB9IGN1cmx5IGJyYWNrZXRzLiBBZGQK
dGhlc2UgaW4uCgpBZGRyZXNzZXMtQ292ZXJpdHk6ICgiU3RydWN0dXJhbGx5IGRlYWQgY29kZSIp
CkZpeGVzOiA5NGRjNTdiMTAzOTkgKCJkcm0vbWdhZzIwMDogUmV3cml0ZSBjdXJzb3IgaGFuZGxp
bmciKQpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfY3Vyc29yLmMgfCAzICsr
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfY3Vyc29yLmMgYi9kcml2ZXJz
L2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2N1cnNvci5jCmluZGV4IGYwYzYxYTkyMzUxYy4uMTE3
ZWFlZGVjN2FhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2N1
cnNvci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfY3Vyc29yLmMKQEAg
LTk5LDEwICs5OSwxMSBAQCBpbnQgbWdhX2NydGNfY3Vyc29yX3NldChzdHJ1Y3QgZHJtX2NydGMg
KmNydGMsCiAKIAkvKiBQaW4gYW5kIG1hcCB1cC1jb21pbmcgYnVmZmVyIHRvIHdyaXRlIGNvbG91
ciBpbmRpY2VzICovCiAJcmV0ID0gZHJtX2dlbV92cmFtX3BpbihwaXhlbHNfbmV4dCwgMCk7Ci0J
aWYgKHJldCkKKwlpZiAocmV0KSB7CiAJCWRldl9lcnIoJmRldi0+cGRldi0+ZGV2LAogCQkJImZh
aWxlZCB0byBwaW4gY3Vyc29yIGJ1ZmZlcjogJWRcbiIsIHJldCk7CiAJCWdvdG8gZXJyX2RybV9n
ZW1fdnJhbV9rdW5tYXBfc3JjOworCX0KIAlkc3QgPSBkcm1fZ2VtX3ZyYW1fa21hcChwaXhlbHNf
bmV4dCwgdHJ1ZSwgTlVMTCk7CiAJaWYgKElTX0VSUihkc3QpKSB7CiAJCXJldCA9IFBUUl9FUlIo
ZHN0KTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
