Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1139A103B83
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 14:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C52B6E8F5;
	Wed, 20 Nov 2019 13:33:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490286E8F5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 13:33:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [118.189.143.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 35B55224D2;
 Wed, 20 Nov 2019 13:33:38 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] vga: Fix Kconfig indentation
Date: Wed, 20 Nov 2019 21:33:27 +0800
Message-Id: <20191120133327.6519-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574256821;
 bh=cOotmQubac+hlg5XwFL6eDrG6qS2WHwDNCPh0I8Yv2M=;
 h=From:To:Cc:Subject:Date:From;
 b=Kwx0VXSwxVuOk9ra6cINVTrWcI4mfqI2arjb5skO8aXw2G6yns3U+1Cgu1Zn1ZnsN
 veAXE8DxpJZHdubMqxjbhMKFJASzLlfrCKo/iac67EXh2IIR9GQLYS3moyhtOWE0Ot
 +gVenIYPDbJ9gZWQhE5cu2Tv0/hfxbS/DRoCKTds=
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRqdXN0IGluZGVudGF0aW9uIGZyb20gc3BhY2VzIHRvIHRhYiAoK29wdGlvbmFsIHR3byBzcGFj
ZXMpIGFzIGluCmNvZGluZyBzdHlsZSB3aXRoIGNvbW1hbmQgbGlrZToKCSQgc2VkIC1lICdzL14g
ICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L3ZnYS9LY29uZmlnIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvdmdhL0tjb25maWcgYi9kcml2ZXJzL2dwdS92Z2EvS2NvbmZpZwpp
bmRleCBjOGM3NzBiMDVlZDkuLjFhZDRjNGVmMGI1ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
dmdhL0tjb25maWcKKysrIGIvZHJpdmVycy9ncHUvdmdhL0tjb25maWcKQEAgLTI4LDYgKzI4LDYg
QEAgY29uZmlnIFZHQV9TV0lUQ0hFUk9PCiAJaGVscAogCSAgTWFueSBsYXB0b3BzIHJlbGVhc2Vk
IGluIDIwMDgvOS8xMCBoYXZlIHR3byBHUFVzIHdpdGggYSBtdWx0aXBsZXhlcgogCSAgdG8gc3dp
dGNoIGJldHdlZW4gdGhlbS4gVGhpcyBhZGRzIHN1cHBvcnQgZm9yIGR5bmFtaWMgc3dpdGNoaW5n
IHdoZW4KLSAgICAgICAgICBYIGlzbid0IHJ1bm5pbmcgYW5kIGRlbGF5ZWQgc3dpdGNoaW5nIHVu
dGlsIHRoZSBuZXh0IGxvZ29mZi4gVGhpcworCSAgWCBpc24ndCBydW5uaW5nIGFuZCBkZWxheWVk
IHN3aXRjaGluZyB1bnRpbCB0aGUgbmV4dCBsb2dvZmYuIFRoaXMKIAkgIGZlYXR1cmUgaXMgY2Fs
bGVkIGh5YnJpZCBncmFwaGljcywgQVRJIFBvd2VyWHByZXNzLCBhbmQgTnZpZGlhCiAJICBIeWJy
aWRQb3dlci4KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
