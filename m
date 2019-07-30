Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6477A3F1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 11:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056C26E45D;
	Tue, 30 Jul 2019 09:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471A76E45D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 09:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 5D9C4FB03
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 11:23:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RsIhlcF1Pp08 for <dri-devel@lists.freedesktop.org>;
 Tue, 30 Jul 2019 11:23:30 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 34C1646BB5; Tue, 30 Jul 2019 11:23:30 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] tests/util: Add mxsfb-drm driver
Date: Tue, 30 Jul 2019 11:23:30 +0200
Message-Id: <f3b731eb935c7cadd43e9b2da8e73a7630414b50.1564478491.git.agx@sigxcpu.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBtYWtlcyB0aGUgdGVzdCB1dGlsaXRpZXMgd29yayB3aXRoIHRoZSBteHNmYiBkcml2ZXIg
d2l0aG91dCB0aGUKbmVjZXNzaXR5IG9mIHVzaW5nIHRoZSAtTSBhcmd1bWVudC4KClNpZ25lZC1v
ZmYtYnk6IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+Ci0tLQogdGVzdHMvdXRpbC9r
bXMuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEv
dGVzdHMvdXRpbC9rbXMuYyBiL3Rlc3RzL3V0aWwva21zLmMKaW5kZXggZGQxYmJlZTMuLmE4NmJh
ZDc4IDEwMDY0NAotLS0gYS90ZXN0cy91dGlsL2ttcy5jCisrKyBiL3Rlc3RzL3V0aWwva21zLmMK
QEAgLTEzMyw2ICsxMzMsNyBAQCBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IG1vZHVsZXNbXSA9
IHsKIAkiZXh5bm9zIiwKIAkidGlsY2RjIiwKIAkibXNtIiwKKwkibXhzZmItZHJtIiwKIAkic3Rp
IiwKIAkidGVncmEiLAogCSJpbXgtZHJtIiwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
