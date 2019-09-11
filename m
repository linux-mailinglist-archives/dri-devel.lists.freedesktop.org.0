Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB926AF895
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 11:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978CC6EA67;
	Wed, 11 Sep 2019 09:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1930B6EA67
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 09:12:30 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1i7yfr-0004Aq-NU; Wed, 11 Sep 2019 09:12:27 +0000
From: Colin King <colin.king@canonical.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/selftests: fix spelling mistake "misssing" -> "missing"
Date: Wed, 11 Sep 2019 10:12:27 +0100
Message-Id: <20190911091227.5710-1-colin.king@canonical.com>
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
IGEgc3BlbGxpbmcgbWlzdGFrZSBpbiBhIGxpdGVyYWwgc3RyaW5nLCBmaXggaXQuCgpTaWduZWQt
b2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fZnJhbWVidWZmZXIuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fZnJhbWVidWZmZXIuYyBiL2RyaXZl
cnMvZ3B1L2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fZnJhbWVidWZmZXIuYwppbmRleCA3NGQ1NTYx
YTg2MmIuLjJkMjllYTZmOTJlMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0
cy90ZXN0LWRybV9mcmFtZWJ1ZmZlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMv
dGVzdC1kcm1fZnJhbWVidWZmZXIuYwpAQCAtMTI2LDcgKzEyNiw3IEBAIHN0YXRpYyBzdHJ1Y3Qg
ZHJtX2ZyYW1lYnVmZmVyX3Rlc3QgY3JlYXRlYnVmZmVyX3Rlc3RzW10gPSB7CiAJCSAuaGFuZGxl
cyA9IHsgMSwgMSwgMCB9LCAucGl0Y2hlcyA9IHsgTUFYX1dJRFRILCBNQVhfV0lEVEggLSAxLCAw
IH0sCiAJfQogfSwKLXsgLmJ1ZmZlcl9jcmVhdGVkID0gMCwgLm5hbWUgPSAiTlYxMiBJbnZhbGlk
IG1vZGlmaWVyL21pc3NzaW5nIERSTV9NT0RFX0ZCX01PRElGSUVSUyBmbGFnIiwKK3sgLmJ1ZmZl
cl9jcmVhdGVkID0gMCwgLm5hbWUgPSAiTlYxMiBJbnZhbGlkIG1vZGlmaWVyL21pc3NpbmcgRFJN
X01PREVfRkJfTU9ESUZJRVJTIGZsYWciLAogCS5jbWQgPSB7IC53aWR0aCA9IE1BWF9XSURUSCwg
LmhlaWdodCA9IE1BWF9IRUlHSFQsIC5waXhlbF9mb3JtYXQgPSBEUk1fRk9STUFUX05WMTIsCiAJ
CSAuaGFuZGxlcyA9IHsgMSwgMSwgMCB9LCAubW9kaWZpZXIgPSB7IERSTV9GT1JNQVRfTU9EX1NB
TVNVTkdfNjRfMzJfVElMRSwgMCwgMCB9LAogCQkgLnBpdGNoZXMgPSB7IE1BWF9XSURUSCwgTUFY
X1dJRFRILCAwIH0sCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
