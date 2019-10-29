Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 993CCE97D3
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 09:14:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0FE76ECAE;
	Wed, 30 Oct 2019 08:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139086E44D
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 15:48:47 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2005)
 id CD4CE68D0D; Tue, 29 Oct 2019 16:39:56 +0100 (CET)
In-Reply-To: <20191029153815.C631668C4E@verein.lst.de>
References: <20191029153815.C631668C4E@verein.lst.de>
From: Torsten Duwe <duwe@lst.de>
Date: Tue, 29 Oct 2019 13:16:57 +0100
Subject: [PATCH v4 7/7] arm64: dts: allwinner: a64: enable ANX6345 bridge on
 Teres-I
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Harald Geyer <harald@ccbib.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>
Message-Id: <20191029153956.CD4CE68D0D@verein.lst.de>
X-Mailman-Approved-At: Wed, 30 Oct 2019 08:14:00 +0000
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
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGVyZXMtSSBoYXMgYW4gYW54NjM0NSBicmlkZ2UgY29ubmVjdGVkIHRvIHRoZSBSR0I2NjYgTENE
IG91dHB1dCwgYW5kCnRoZSBJMkMgY29udHJvbGxpbmcgc2lnbmFscyBhcmUgY29ubmVjdGVkIHRv
IEkyQzAgYnVzLgoKRW5hYmxlIGl0IGluIHRoZSBkZXZpY2UgdHJlZSwgYW5kIGVuYWJsZSB0aGUg
ZGlzcGxheSBlbmdpbmUsIHZpZGVvIG1peGVyCmFuZCB0Y29uMCBhcyB3ZWxsLgoKU2lnbmVkLW9m
Zi1ieTogSWNlbm93eSBaaGVuZyA8aWNlbm93eUBhb3NjLmlvPgpTaWduZWQtb2ZmLWJ5OiBUb3Jz
dGVuIER1d2UgPGR1d2VAc3VzZS5kZT4KLS0tCiAuLi4vYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUw
aS1hNjQtdGVyZXMtaS5kdHMgICAgICB8IDQ1ICsrKysrKysrKysrKysrKysrKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQtdGVyZXMtaS5kdHMgYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LXRlcmVzLWkuZHRzCmluZGV4
IDEwNjllNzAxMmM5Yy4uOTcwNDE1MTA2ZGNmIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LXRlcmVzLWkuZHRzCisrKyBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQtdGVyZXMtaS5kdHMKQEAgLTEwMCwxOCArMTAwLDQx
IEBACiAJc3RhdHVzID0gIm9rYXkiOwogfTsKIAorJmRlIHsKKwlzdGF0dXMgPSAib2theSI7Cit9
OworCiAmZWhjaTEgewogCXN0YXR1cyA9ICJva2F5IjsKIH07CiAKIAotLyogVGhlIEFOWDYzNDUg
ZURQLWJyaWRnZSBpcyBvbiBpMmMwLiBUaGVyZSBpcyBubyBsaW51eCAobWFpbmxpbmUpCi0gKiBk
cml2ZXIgZm9yIHRoaXMgY2hpcCBhdCB0aGUgbW9tZW50LCB0aGUgYm9vdGxvYWRlciBpbml0aWFs
aXplcyBpdC4KLSAqIEhvd2V2ZXIgaXQgY2FuIGJlIGFjY2Vzc2VkIHdpdGggdGhlIGkyYy1kZXYg
ZHJpdmVyIGZyb20gdXNlciBzcGFjZS4KLSAqLwogJmkyYzAgewogCWNsb2NrLWZyZXF1ZW5jeSA9
IDwxMDAwMDA+OwogCXN0YXR1cyA9ICJva2F5IjsKKworCWFueDYzNDU6IGFueDYzNDVAMzggewor
CQljb21wYXRpYmxlID0gImFuYWxvZ2l4LGFueDYzNDUiOworCQlyZWcgPSA8MHgzOD47CisJCXJl
c2V0LWdwaW9zID0gPCZwaW8gMyAyNCBHUElPX0FDVElWRV9MT1c+OyAvKiBQRDI0ICovCisJCWR2
ZGQyNS1zdXBwbHkgPSA8JnJlZ19kbGRvMj47CisJCWR2ZGQxMi1zdXBwbHkgPSA8JnJlZ19kbGRv
Mz47CisKKwkJcG9ydHMgeworCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCQkjc2l6ZS1jZWxs
cyA9IDwwPjsKKworCQkJcG9ydEAwIHsKKwkJCQlhbng2MzQ1X2luOiBlbmRwb2ludCB7CisJCQkJ
CXJlbW90ZS1lbmRwb2ludCA9IDwmdGNvbjBfb3V0X2FueDYzNDU+OworCQkJCX07CisJCQl9Owor
CQl9OworCX07Cit9OworCismbWl4ZXIwIHsKKwlzdGF0dXMgPSAib2theSI7CiB9OwogCiAmbW1j
MCB7CkBAIC0zMTksNiArMzQyLDIwIEBACiAJc3RhdHVzID0gIm9rYXkiOwogfTsKIAorJnRjb24w
IHsKKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOworCXBpbmN0cmwtMCA9IDwmbGNkX3JnYjY2
Nl9waW5zPjsKKworCXN0YXR1cyA9ICJva2F5IjsKK307CisKKyZ0Y29uMF9vdXQgeworCXRjb24w
X291dF9hbng2MzQ1OiBlbmRwb2ludEAwIHsKKwkJcmVnID0gPDA+OworCQlyZW1vdGUtZW5kcG9p
bnQgPSA8JmFueDYzNDVfaW4+OworCX07Cit9OworCiAmdWFydDAgewogCXBpbmN0cmwtbmFtZXMg
PSAiZGVmYXVsdCI7CiAJcGluY3RybC0wID0gPCZ1YXJ0MF9wYl9waW5zPjsKLS0gCjIuMTYuNAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
