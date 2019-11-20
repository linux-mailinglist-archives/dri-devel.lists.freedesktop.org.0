Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61108103BA4
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 14:36:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3086E9A4;
	Wed, 20 Nov 2019 13:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F95C6E9A4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 13:36:29 +0000 (UTC)
Received: from localhost.localdomain (unknown [118.189.143.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 72CB221939;
 Wed, 20 Nov 2019 13:36:27 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mgag200: Fix Kconfig indentation
Date: Wed, 20 Nov 2019 21:36:24 +0800
Message-Id: <20191120133625.11478-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574256989;
 bh=tdDe4FJ44sifbvlkacqGnDR4fXNE5uA2pA1WmEudtB8=;
 h=From:To:Cc:Subject:Date:From;
 b=vo6IomQVGpPauYHWJ90F0M/5NY3rABfWNIK8ejuC3lGCyiwHNPYSYwJpQq2JQwPfM
 7d3SHjlrqYO70+1BUoXDYvO6c6KIO1S6vbaPoGzPjX56YQ7Zgn6KTSPuLcTxiINh23
 b2TmUtb92BKSHbXEfOoWU0ZYmYsm1m2xWBrINrV0=
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
Cc: David Airlie <airlied@linux.ie>, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRqdXN0IGluZGVudGF0aW9uIGZyb20gc3BhY2VzIHRvIHRhYiAoK29wdGlvbmFsIHR3byBzcGFj
ZXMpIGFzIGluCmNvZGluZyBzdHlsZSB3aXRoIGNvbW1hbmQgbGlrZToKCSQgc2VkIC1lICdzL14g
ICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL0tjb25m
aWcgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL0tjb25maWcgYi9k
cml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9LY29uZmlnCmluZGV4IGFlZDExZjRmNGM1NS4uZDYwYWE0
YjljY2Q0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9LY29uZmlnCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL0tjb25maWcKQEAgLTgsOCArOCw4IEBAIGNvbmZpZyBE
Uk1fTUdBRzIwMAogCXNlbGVjdCBEUk1fVFRNX0hFTFBFUgogCWhlbHAKIAkgVGhpcyBpcyBhIEtN
UyBkcml2ZXIgZm9yIHRoZSBNR0EgRzIwMCBzZXJ2ZXIgY2hpcHMsIGl0Ci0gICAgICAgICBkb2Vz
IG5vdCBzdXBwb3J0IHRoZSBvcmlnaW5hbCBNR0EgRzIwMCBvciBhbnkgb2YgdGhlIGRlc2t0b3AK
LSAgICAgICAgIGNoaXBzLiBJdCByZXF1aXJlcyAwLjMuMCBvZiB0aGUgbW9kZXNldHRpbmcgdXNl
cnNwYWNlIGRyaXZlciwKLSAgICAgICAgIGFuZCBhIHZlcnNpb24gb2YgbWdhIGRyaXZlciB0aGF0
IHdpbGwgZmFpbCBvbiBLTVMgZW5hYmxlZAotICAgICAgICAgZGV2aWNlcy4KKwkgZG9lcyBub3Qg
c3VwcG9ydCB0aGUgb3JpZ2luYWwgTUdBIEcyMDAgb3IgYW55IG9mIHRoZSBkZXNrdG9wCisJIGNo
aXBzLiBJdCByZXF1aXJlcyAwLjMuMCBvZiB0aGUgbW9kZXNldHRpbmcgdXNlcnNwYWNlIGRyaXZl
ciwKKwkgYW5kIGEgdmVyc2lvbiBvZiBtZ2EgZHJpdmVyIHRoYXQgd2lsbCBmYWlsIG9uIEtNUyBl
bmFibGVkCisJIGRldmljZXMuCiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
