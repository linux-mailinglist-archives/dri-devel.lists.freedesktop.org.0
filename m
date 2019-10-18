Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0386CDDB98
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 02:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE4589C96;
	Sun, 20 Oct 2019 00:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76976EBA8
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 18:46:47 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6F3CFF60="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.28.1 DYNA|AUTH)
 with ESMTPSA id R0b2a8v9IIkXDLF
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Fri, 18 Oct 2019 20:46:33 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>
Subject: [PATCH 4/7] ARM: DTS: omap3: add sgx gpu child node
Date: Fri, 18 Oct 2019 20:46:27 +0200
Message-Id: <ebc994aa9e1a5669c2c79a8452562eae10419291.1571424390.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1571424390.git.hns@goldelico.com>
References: <cover.1571424390.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 20 Oct 2019 00:06:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1571424405; 
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=ePGzYHaP9Bqb+GVhBLa6uE50M8Noh8VJjTLNEr2egSs=;
 b=hki+J4SQELVyOEy8BAttU0u96zP1kSeN9nkvex7GmZDHjFDUAH5gxiStV5E8+VdQvP
 xkNv0W7V5+ppnE6FRF5O0yhrWBbnRha2pR4E5EGRPcbURPAo2LkHEiej9f8TA/TaTgoC
 VPDRC025i0+n82l23ke9KrxAnUZFHtQjEzZNAjrXOuWHPBGzUEZYWgDfF0//q1UkbXa/
 jcgb6ylqMefhyZzuYsKqHSYpCoGBs7ZydaajFcqpmTxcTNI4b4rK6hgyzFFaIXGu0A9G
 iPhOQwcYZ5ogtNLQriQW5LW/y4PXuDM5TVvgqvVYuopPBr1YEv6RLh1a9Cdlg1CUM5Tg
 3PWA==
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
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
 "H. Nikolaus Schaller" <hns@goldelico.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YW5kIGFkZCB0aW1lciBhbmQgaW50ZXJydXB0CgpUZXN0ZWQgb24gT3BlblBhbmRvcmEgNjAwIE1I
ei4KClNpZ25lZC1vZmYtYnk6IEguIE5pa29sYXVzIFNjaGFsbGVyIDxobnNAZ29sZGVsaWNvLmNv
bT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9vbWFwMzR4eC5kdHNpIHwgMTMgKysrKysrKystLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9vbWFwMzR4eC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9k
dHMvb21hcDM0eHguZHRzaQppbmRleCA3YjA5Y2JlZThiYjguLjI4ZDVjNzdkNmQ2YyAxMDA2NDQK
LS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvb21hcDM0eHguZHRzaQorKysgYi9hcmNoL2FybS9ib290
L2R0cy9vbWFwMzR4eC5kdHNpCkBAIC0xMTEsNyArMTExLDcgQEAKIAkJICogYXJlIGFsc28gZGlm
ZmVyZW50IGNsb2NrcywgYnV0IHdlIGRvIG5vdCBoYXZlIGFueSBkdHMgdXNlcnMKIAkJICogZm9y
IGl0LgogCQkgKi8KLQkJc2d4X21vZHVsZTogdGFyZ2V0LW1vZHVsZUA1MDAwMDAwMCB7CisJCXRh
cmdldC1tb2R1bGVANTAwMDAwMDAgewogCQkJY29tcGF0aWJsZSA9ICJ0aSxzeXNjLW9tYXAyIiwg
InRpLHN5c2MiOwogCQkJcmVnID0gPDB4NTAwMDAwMTQgMHg0PjsKIAkJCXJlZy1uYW1lcyA9ICJy
ZXYiOwpAQCAtMTIxLDEwICsxMjEsMTMgQEAKIAkJCSNzaXplLWNlbGxzID0gPDE+OwogCQkJcmFu
Z2VzID0gPDAgMHg1MDAwMDAwMCAweDQwMDA+OwogCi0JCQkvKgotCQkJICogQ2xvc2VkIHNvdXJj
ZSBQb3dlclZSIGRyaXZlciwgbm8gY2hpbGQgZGV2aWNlCi0JCQkgKiBiaW5kaW5nIG9yIGRyaXZl
ciBpbiBtYWlubGluZQotCQkJICovCisJCQlzZ3g6IHNneEAwIHsKKwkJCQljb21wYXRpYmxlID0g
ImltZyxzZ3g1MzAtMTIxIiwgImltZyxzZ3g1MzAiLCAidGksb21hcC1vbWFwMy1zZ3g1MzAtMTIx
IjsKKwkJCQlyZWcgPSA8MHgwIDB4NDAwMD47CS8qIDY0a0IgKi8KKwkJCQlyZWctbmFtZXMgPSAi
c2d4IjsKKwkJCQlpbnRlcnJ1cHRzID0gPDIxPjsKKwkJCQl0aW1lciA9IDwmdGltZXIxMT47CisJ
CQl9OwogCQl9OwogCX07CiAKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
