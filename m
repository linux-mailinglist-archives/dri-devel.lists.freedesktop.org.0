Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7849FC02A3
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 11:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F616EEDC;
	Fri, 27 Sep 2019 09:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFCA6EEDC
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 09:47:14 +0000 (UTC)
Received: from ramsan ([84.194.98.4]) by laurent.telenet-ops.be with bizsmtp
 id 6ZnA2100Q05gfCL01ZnA3C; Fri, 27 Sep 2019 11:47:10 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iDmqE-0000jM-A5; Fri, 27 Sep 2019 11:47:10 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iDmqE-00031E-70; Fri, 27 Sep 2019 11:47:10 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2] fbdev: c2p: Fix link failure on non-inlining
Date: Fri, 27 Sep 2019 11:47:08 +0200
Message-Id: <20190927094708.11563-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-fbdev@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiB0aGUgY29tcGlsZXIgZGVjaWRlcyBub3QgdG8gaW5saW5lIHRoZSBDaHVua3ktdG8tUGxh
bmFyIGNvcmUKZnVuY3Rpb25zLCB0aGUgYnVpbGQgZmFpbHMgd2l0aDoKCiAgICBjMnBfcGxhbmFy
LmM6KC50ZXh0KzB4ZDYpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBjMnBfdW5zdXBwb3J0ZWQn
CiAgICBjMnBfcGxhbmFyLmM6KC50ZXh0KzB4MWRjKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBg
YzJwX3Vuc3VwcG9ydGVkJwogICAgYzJwX2lwbGFuMi5jOigudGV4dCsweGM0KTogdW5kZWZpbmVk
IHJlZmVyZW5jZSB0byBgYzJwX3Vuc3VwcG9ydGVkJwogICAgYzJwX2lwbGFuMi5jOigudGV4dCsw
eDE1MCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGMycF91bnN1cHBvcnRlZCcKCkZpeCB0aGlz
IGJ5IG1hcmtpbmcgdGhlIGZ1bmN0aW9ucyBfX2Fsd2F5c19pbmxpbmUuCgpXaGlsZSB0aGlzIGNv
dWxkIGJlIHRyaWdnZXJlZCBiZWZvcmUgYnkgbWFudWFsbHkgZW5hYmxpbmcgYm90aApDT05GSUdf
T1BUSU1JWkVfSU5MSU5JTkcgYW5kIENPTkZJR19DQ19PUFRJTUlaRV9GT1JfU0laRSwgaXQgd2Fz
IGV4cG9zZWQKaW4gdGhlIG02OGsgZGVmY29uZmlnIGJ5IGNvbW1pdCBhYzdjM2U0ZmY0MDFiMzA0
ICgiY29tcGlsZXI6IGVuYWJsZQpDT05GSUdfT1BUSU1JWkVfSU5MSU5JTkcgZm9yY2libHkiKS4K
CkZpeGVzOiA5MDEyZDAxMTY2MGVhNWNmICgiY29tcGlsZXI6IGFsbG93IGFsbCBhcmNoZXMgdG8g
ZW5hYmxlIENPTkZJR19PUFRJTUlaRV9JTkxJTklORyIpClJlcG9ydGVkLWJ5OiBub3JlcGx5QGVs
bGVybWFuLmlkLmF1ClNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGlu
dXgtbTY4ay5vcmc+ClJldmlld2VkLWJ5OiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGly
b0Bzb2Npb25leHQuY29tPgotLS0KVGhpcyBpcyBhIGZpeCBmb3IgdjUuNC1yYzEuCgp2MjoKICAt
IEFkZCBSZXZpZXdlZC1ieSwKICAtIEZpeCBGaXhlcywKICAtIEFkZCBtb3JlIGV4cGxhbmF0aW9u
LgotLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvYzJwX2NvcmUuaCB8IDggKysrKy0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy92aWRlby9mYmRldi9jMnBfY29yZS5oIGIvZHJpdmVycy92aWRlby9mYmRldi9jMnBf
Y29yZS5oCmluZGV4IGUxMDM1YTg2NWZiOTQ1ZjAuLjQ1YTZkODk1YTdkNzIwOGUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvYzJwX2NvcmUuaAorKysgYi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2MycF9jb3JlLmgKQEAgLTI5LDcgKzI5LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIF90cmFu
c3AodTMyIGRbXSwgdW5zaWduZWQgaW50IGkxLCB1bnNpZ25lZCBpbnQgaTIsCiAKIGV4dGVybiB2
b2lkIGMycF91bnN1cHBvcnRlZCh2b2lkKTsKIAotc3RhdGljIGlubGluZSB1MzIgZ2V0X21hc2so
dW5zaWduZWQgaW50IG4pCitzdGF0aWMgX19hbHdheXNfaW5saW5lIHUzMiBnZXRfbWFzayh1bnNp
Z25lZCBpbnQgbikKIHsKIAlzd2l0Y2ggKG4pIHsKIAljYXNlIDE6CkBAIC01Nyw3ICs1Nyw3IEBA
IHN0YXRpYyBpbmxpbmUgdTMyIGdldF9tYXNrKHVuc2lnbmVkIGludCBuKQogICAgICAqICBUcmFu
c3Bvc2Ugb3BlcmF0aW9ucyBvbiA4IDMyLWJpdCB3b3JkcwogICAgICAqLwogCi1zdGF0aWMgaW5s
aW5lIHZvaWQgdHJhbnNwOCh1MzIgZFtdLCB1bnNpZ25lZCBpbnQgbiwgdW5zaWduZWQgaW50IG0p
CitzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgdHJhbnNwOCh1MzIgZFtdLCB1bnNpZ25lZCBp
bnQgbiwgdW5zaWduZWQgaW50IG0pCiB7CiAJdTMyIG1hc2sgPSBnZXRfbWFzayhuKTsKIApAQCAt
OTksNyArOTksNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdHJhbnNwOCh1MzIgZFtdLCB1bnNpZ25l
ZCBpbnQgbiwgdW5zaWduZWQgaW50IG0pCiAgICAgICogIFRyYW5zcG9zZSBvcGVyYXRpb25zIG9u
IDQgMzItYml0IHdvcmRzCiAgICAgICovCiAKLXN0YXRpYyBpbmxpbmUgdm9pZCB0cmFuc3A0KHUz
MiBkW10sIHVuc2lnbmVkIGludCBuLCB1bnNpZ25lZCBpbnQgbSkKK3N0YXRpYyBfX2Fsd2F5c19p
bmxpbmUgdm9pZCB0cmFuc3A0KHUzMiBkW10sIHVuc2lnbmVkIGludCBuLCB1bnNpZ25lZCBpbnQg
bSkKIHsKIAl1MzIgbWFzayA9IGdldF9tYXNrKG4pOwogCkBAIC0xMjYsNyArMTI2LDcgQEAgc3Rh
dGljIGlubGluZSB2b2lkIHRyYW5zcDQodTMyIGRbXSwgdW5zaWduZWQgaW50IG4sIHVuc2lnbmVk
IGludCBtKQogICAgICAqICBUcmFuc3Bvc2Ugb3BlcmF0aW9ucyBvbiA0IDMyLWJpdCB3b3JkcyAo
cmV2ZXJzZSBvcmRlcikKICAgICAgKi8KIAotc3RhdGljIGlubGluZSB2b2lkIHRyYW5zcDR4KHUz
MiBkW10sIHVuc2lnbmVkIGludCBuLCB1bnNpZ25lZCBpbnQgbSkKK3N0YXRpYyBfX2Fsd2F5c19p
bmxpbmUgdm9pZCB0cmFuc3A0eCh1MzIgZFtdLCB1bnNpZ25lZCBpbnQgbiwgdW5zaWduZWQgaW50
IG0pCiB7CiAJdTMyIG1hc2sgPSBnZXRfbWFzayhuKTsKIAotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
