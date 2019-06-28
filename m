Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE63F59DD2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 16:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE046E935;
	Fri, 28 Jun 2019 14:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1CA6E935;
 Fri, 28 Jun 2019 14:33:23 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hgrwH-000836-12; Fri, 28 Jun 2019 14:33:21 +0000
From: Colin King <colin.king@canonical.com>
To: Hawking Zhang <Hawking.Zhang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: fix a missing break in a switch statement
Date: Fri, 28 Jun 2019 15:33:20 +0100
Message-Id: <20190628143320.5182-1-colin.king@canonical.com>
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KCkN1cnJlbnRs
eSBmb3IgdGhlIEFNREdQVV9JUlFfU1RBVEVfRElTQUJMRSB0aGVyZSBpcyBhIG1pc3NpbmcgYnJl
YWsKY2F1c2luZyB0aGUgY29kZSB0byBmYWxsIHRocm91Z2ggdG8gdGhlIEFNREdQVV9JUlFfU1RB
VEVfRU5BQkxFIGNhc2UuCkZpeCB0aGlzIGJ5IGFkZGluZyBpbiB0aGUgbWlzc2luZyBicmVhayBz
dGF0ZW1lbnQuCgpBZGRyZXNzZXMtQ292ZXJpdHk6ICgiTWlzc2luZyBicmVhayBpbiBzd2l0Y2gi
KQpGaXhlczogYTY0NGQ4NWE1Y2Q0ICgiZHJtL2FtZGdwdTogYWRkIGdmeCB2MTAgaW1wbGVtZW50
YXRpb24gKHYxMCkiKQpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0Bj
YW5vbmljYWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5j
IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dmeF92MTBfMC5jCmluZGV4IDI5MzJhZGU3ZGJkMC4uYzE2NTIwMDM2MWIyIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwpAQCAtNDYwOCw2ICs0NjA4LDcgQEAg
Z2Z4X3YxMF8wX3NldF9nZnhfZW9wX2ludGVycnVwdF9zdGF0ZShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKIAkJY3BfaW50X2NudGwgPSBSRUdfU0VUX0ZJRUxEKGNwX2ludF9jbnRsLCBDUF9J
TlRfQ05UTF9SSU5HMCwKIAkJCQkJICAgIFRJTUVfU1RBTVBfSU5UX0VOQUJMRSwgMCk7CiAJCVdS
RUczMihjcF9pbnRfY250bF9yZWcsIGNwX2ludF9jbnRsKTsKKwkJYnJlYWs7CiAJY2FzZSBBTURH
UFVfSVJRX1NUQVRFX0VOQUJMRToKIAkJY3BfaW50X2NudGwgPSBSUkVHMzIoY3BfaW50X2NudGxf
cmVnKTsKIAkJY3BfaW50X2NudGwgPSBSRUdfU0VUX0ZJRUxEKGNwX2ludF9jbnRsLCBDUF9JTlRf
Q05UTF9SSU5HMCwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
