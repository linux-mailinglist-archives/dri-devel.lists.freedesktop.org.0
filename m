Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53482BEF57
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 12:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402C66ED4C;
	Thu, 26 Sep 2019 10:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D0C6ED4C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 10:13:19 +0000 (UTC)
Received: from ramsan ([84.194.98.4]) by albert.telenet-ops.be with bizsmtp
 id 6ADF2100505gfCL06ADF4l; Thu, 26 Sep 2019 12:13:15 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iDQlu-0001q2-Ar; Thu, 26 Sep 2019 12:13:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iDQlu-0008ON-8M; Thu, 26 Sep 2019 12:13:14 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH -next] fbdev: c2p: Fix link failure on non-inlining
Date: Thu, 26 Sep 2019 12:13:12 +0200
Message-Id: <20190926101312.32218-1-geert@linux-m68k.org>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-fbdev@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
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
IGJ5IG1hcmtpbmcgdGhlIGZ1bmN0aW9ucyBfX2Fsd2F5c19pbmxpbmUuCgpSZXBvcnRlZC1ieTog
bm9yZXBseUBlbGxlcm1hbi5pZC5hdQpTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4g
PGdlZXJ0QGxpbnV4LW02OGsub3JnPgotLS0KRml4ZXM6IDAyNWYwNzJlNTgyMzk0N2MgKCJjb21w
aWxlcjogZW5hYmxlIENPTkZJR19PUFRJTUlaRV9JTkxJTklORyBmb3JjaWJseSIpCgpBcyB0aGlz
IGlzIGEgcGF0Y2ggaW4gYWtwbSdzIHRyZWUsIHRoZSBjb21taXQgSUQgaW4gdGhlIEZpeGVzIHRh
ZyBpcyBub3QKc3RhYmxlLgotLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvYzJwX2NvcmUuaCB8IDgg
KysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9jMnBfY29yZS5oIGIvZHJpdmVycy92
aWRlby9mYmRldi9jMnBfY29yZS5oCmluZGV4IGUxMDM1YTg2NWZiOTQ1ZjAuLjQ1YTZkODk1YTdk
NzIwOGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvYzJwX2NvcmUuaAorKysgYi9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L2MycF9jb3JlLmgKQEAgLTI5LDcgKzI5LDcgQEAgc3RhdGljIGlu
bGluZSB2b2lkIF90cmFuc3AodTMyIGRbXSwgdW5zaWduZWQgaW50IGkxLCB1bnNpZ25lZCBpbnQg
aTIsCiAKIGV4dGVybiB2b2lkIGMycF91bnN1cHBvcnRlZCh2b2lkKTsKIAotc3RhdGljIGlubGlu
ZSB1MzIgZ2V0X21hc2sodW5zaWduZWQgaW50IG4pCitzdGF0aWMgX19hbHdheXNfaW5saW5lIHUz
MiBnZXRfbWFzayh1bnNpZ25lZCBpbnQgbikKIHsKIAlzd2l0Y2ggKG4pIHsKIAljYXNlIDE6CkBA
IC01Nyw3ICs1Nyw3IEBAIHN0YXRpYyBpbmxpbmUgdTMyIGdldF9tYXNrKHVuc2lnbmVkIGludCBu
KQogICAgICAqICBUcmFuc3Bvc2Ugb3BlcmF0aW9ucyBvbiA4IDMyLWJpdCB3b3JkcwogICAgICAq
LwogCi1zdGF0aWMgaW5saW5lIHZvaWQgdHJhbnNwOCh1MzIgZFtdLCB1bnNpZ25lZCBpbnQgbiwg
dW5zaWduZWQgaW50IG0pCitzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgdHJhbnNwOCh1MzIg
ZFtdLCB1bnNpZ25lZCBpbnQgbiwgdW5zaWduZWQgaW50IG0pCiB7CiAJdTMyIG1hc2sgPSBnZXRf
bWFzayhuKTsKIApAQCAtOTksNyArOTksNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdHJhbnNwOCh1
MzIgZFtdLCB1bnNpZ25lZCBpbnQgbiwgdW5zaWduZWQgaW50IG0pCiAgICAgICogIFRyYW5zcG9z
ZSBvcGVyYXRpb25zIG9uIDQgMzItYml0IHdvcmRzCiAgICAgICovCiAKLXN0YXRpYyBpbmxpbmUg
dm9pZCB0cmFuc3A0KHUzMiBkW10sIHVuc2lnbmVkIGludCBuLCB1bnNpZ25lZCBpbnQgbSkKK3N0
YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCB0cmFuc3A0KHUzMiBkW10sIHVuc2lnbmVkIGludCBu
LCB1bnNpZ25lZCBpbnQgbSkKIHsKIAl1MzIgbWFzayA9IGdldF9tYXNrKG4pOwogCkBAIC0xMjYs
NyArMTI2LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIHRyYW5zcDQodTMyIGRbXSwgdW5zaWduZWQg
aW50IG4sIHVuc2lnbmVkIGludCBtKQogICAgICAqICBUcmFuc3Bvc2Ugb3BlcmF0aW9ucyBvbiA0
IDMyLWJpdCB3b3JkcyAocmV2ZXJzZSBvcmRlcikKICAgICAgKi8KIAotc3RhdGljIGlubGluZSB2
b2lkIHRyYW5zcDR4KHUzMiBkW10sIHVuc2lnbmVkIGludCBuLCB1bnNpZ25lZCBpbnQgbSkKK3N0
YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCB0cmFuc3A0eCh1MzIgZFtdLCB1bnNpZ25lZCBpbnQg
biwgdW5zaWduZWQgaW50IG0pCiB7CiAJdTMyIG1hc2sgPSBnZXRfbWFzayhuKTsKIAotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
