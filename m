Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 559DB7860A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 09:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B644889C6B;
	Mon, 29 Jul 2019 07:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4476C6EE57
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 20:25:23 +0000 (UTC)
Received: from pd9ef1cb8.dip0.t-ipconnect.de ([217.239.28.184] helo=nanos)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1hr6mH-000248-0f; Fri, 26 Jul 2019 22:25:21 +0200
Date: Fri, 26 Jul 2019 22:25:20 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i810: Use CONFIG_PREEMPTION
Message-ID: <alpine.DEB.2.21.1907262223280.1791@nanos.tec.linutronix.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:16:44 +0000
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
Cc: David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q09ORklHX1BSRUVNUFRJT04gaXMgc2VsZWN0ZWQgYnkgQ09ORklHX1BSRUVNUFQgYW5kIGJ5CkNP
TkZJR19QUkVFTVBUX1JULiBCb3RoIFBSRUVNUFQgYW5kIFBSRUVNUFRfUlQgcmVxdWlyZSB0aGUg
c2FtZQpmdW5jdGlvbmFsaXR5IHdoaWNoIHRvZGF5IGRlcGVuZHMgb24gQ09ORklHX1BSRUVNUFQu
CgpDaGFuZ2UgdGhlIEtjb25maWcgZGVwZW5kZW5jeSBvZiBpODEwIHRvICFDT05GSUdfUFJFRU1Q
VElPTiBzbyB0aGUgZHJpdmVyCmlzIG5vdCBhY2NpZGVudGFsbHkgYnVpbHQgb24gYSBSVCBrZXJu
ZWwuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4K
Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0
IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL0tjb25maWcgfCAgICAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnCkBAIC0zOTQsNyArMzk0LDcgQEAgY29uZmlnIERS
TV9SMTI4CiBjb25maWcgRFJNX0k4MTAKIAl0cmlzdGF0ZSAiSW50ZWwgSTgxMCIKIAkjICFQUkVF
TVBUIGJlY2F1c2Ugb2YgbWlzc2luZyBpb2N0bCBsb2NraW5nCi0JZGVwZW5kcyBvbiBEUk0gJiYg
QUdQICYmIEFHUF9JTlRFTCAmJiAoIVBSRUVNUFQgfHwgQlJPS0VOKQorCWRlcGVuZHMgb24gRFJN
ICYmIEFHUCAmJiBBR1BfSU5URUwgJiYgKCFQUkVFTVBUSU9OIHx8IEJST0tFTikKIAloZWxwCiAJ
ICBDaG9vc2UgdGhpcyBvcHRpb24gaWYgeW91IGhhdmUgYW4gSW50ZWwgSTgxMCBncmFwaGljcyBj
YXJkLiAgSWYgTSBpcwogCSAgc2VsZWN0ZWQsIHRoZSBtb2R1bGUgd2lsbCBiZSBjYWxsZWQgaTgx
MC4gIEFHUCBzdXBwb3J0IGlzIHJlcXVpcmVkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
