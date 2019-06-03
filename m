Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E0833FBA
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1C089624;
	Tue,  4 Jun 2019 07:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B0F89295
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 15:31:32 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v4 3/3] drm/panel: simple: Add Sharp LS020B1DD01D panel support
Date: Mon,  3 Jun 2019 17:31:20 +0200
Message-Id: <20190603153120.23947-3-paul@crapouillou.net>
In-Reply-To: <20190603153120.23947-1-paul@crapouillou.net>
References: <20190603153120.23947-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 04 Jun 2019 07:14:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1559575890; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qpPjjVPcvPAwJQGYcUpfDZwk6ryVkd8SjEitvpuus/w=;
 b=s6s9XT3X819O48mzKCUZ4wQ252SfJTDSKNcQxzjEgFjPJ3loZD4GrRq6g8BjELWpZ7PnEv
 w1r+ARw13Xxay1XA4XXdKTT1oyYrWuL3JJfAcnHIOZYXOT3CFe7P9yk8zX8qo+fA4uvBTG
 MluADHEbZdnyMxF54/liEKC288s9QoQ=
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
Cc: devicetree@vger.kernel.org, Artur Rojek <contact@artur-rojek.eu>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, od@zcrc.me
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFNoYXJwIExTMDIwQjFERDAxRCBpcyBhIHNpbXBsZSAyLjAiIDI0MHgxNjAgMTYtYml0IFRG
VCBwYW5lbC4KClNpZ25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3Uu
bmV0PgpUZXN0ZWQtYnk6IEFydHVyIFJvamVrIDxjb250YWN0QGFydHVyLXJvamVrLmV1PgotLS0K
Ck5vdGVzOgogICAgdjI6IE5vIGNoYW5nZQogICAgCiAgICB2MzogQWRkIERSTV9CVVNfRkxBR19T
SEFSUF9TSUdOQUxTIHRvIHRoZSBidXMgZmxhZ3MKICAgIAogICAgdjQ6IFJlYmFzZSBvbiBkcm0t
bWlzYy1uZXh0IChiMjMyZDRlZDkyZWEpCgogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNp
bXBsZS5jIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDMwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFu
ZWwtc2ltcGxlLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKaW5kZXgg
NWE5M2M0ZWRmMWU0Li41MDQ5ZjAwOTlmZGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1zaW1wbGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2lt
cGxlLmMKQEAgLTI0NTQsNiArMjQ1NCwzMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rl
c2Mgc2hhcnBfbHExNTB4MWxnMTEgPSB7CiAJLmJ1c19mb3JtYXQgPSBNRURJQV9CVVNfRk1UX1JH
QjU2NV8xWDE2LAogfTsKIAorc3RhdGljIGNvbnN0IHN0cnVjdCBkaXNwbGF5X3RpbWluZyBzaGFy
cF9sczAyMGIxZGQwMWRfdGltaW5nID0geworCS5waXhlbGNsb2NrID0geyAyMDAwMDAwLCA0MjAw
MDAwLCA1MDAwMDAwIH0sCisJLmhhY3RpdmUgPSB7IDI0MCwgMjQwLCAyNDAgfSwKKwkuaGZyb250
X3BvcmNoID0geyA2NiwgNjYsIDY2IH0sCisJLmhiYWNrX3BvcmNoID0geyAxLCAxLCAxIH0sCisJ
LmhzeW5jX2xlbiA9IHsgMSwgMSwgMSB9LAorCS52YWN0aXZlID0geyAxNjAsIDE2MCwgMTYwIH0s
CisJLnZmcm9udF9wb3JjaCA9IHsgNTIsIDUyLCA1MiB9LAorCS52YmFja19wb3JjaCA9IHsgNiwg
NiwgNiB9LAorCS52c3luY19sZW4gPSB7IDEwLCAxMCwgMTAgfSwKKwkuZmxhZ3MgPSBESVNQTEFZ
X0ZMQUdTX0hTWU5DX0hJR0ggfCBESVNQTEFZX0ZMQUdTX1ZTWU5DX0xPVywKK307CisKK3N0YXRp
YyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBzaGFycF9sczAyMGIxZGQwMWQgPSB7CisJLnRpbWlu
Z3MgPSAmc2hhcnBfbHMwMjBiMWRkMDFkX3RpbWluZywKKwkubnVtX3RpbWluZ3MgPSAxLAorCS5i
cGMgPSA2LAorCS5zaXplID0geworCQkud2lkdGggPSA0MiwKKwkJLmhlaWdodCA9IDI4LAorCX0s
CisJLmJ1c19mb3JtYXQgPSBNRURJQV9CVVNfRk1UX1JHQjU2NV8xWDE2LAorCS5idXNfZmxhZ3Mg
PSBEUk1fQlVTX0ZMQUdfREVfSElHSAorCQkgICB8IERSTV9CVVNfRkxBR19QSVhEQVRBX05FR0VE
R0UKKwkJICAgfCBEUk1fQlVTX0ZMQUdfU0hBUlBfU0lHTkFMUywKK307CisKIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBzaGVsbHlfc2NhMDcwMTBfYmZuX2xubl9tb2RlID0g
ewogCS5jbG9jayA9IDMzMzAwLAogCS5oZGlzcGxheSA9IDgwMCwKQEAgLTMwMTQsNiArMzA0MSw5
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHBsYXRmb3JtX29mX21hdGNoW10g
PSB7CiAJfSwgewogCQkuY29tcGF0aWJsZSA9ICJzaGFycCxscTE1MHgxbGcxMSIsCiAJCS5kYXRh
ID0gJnNoYXJwX2xxMTUweDFsZzExLAorCX0sIHsKKwkJLmNvbXBhdGlibGUgPSAic2hhcnAsbHMw
MjBiMWRkMDFkIiwKKwkJLmRhdGEgPSAmc2hhcnBfbHMwMjBiMWRkMDFkLAogCX0sIHsKIAkJLmNv
bXBhdGlibGUgPSAic2hlbGx5LHNjYTA3MDEwLWJmbi1sbm4iLAogCQkuZGF0YSA9ICZzaGVsbHlf
c2NhMDcwMTBfYmZuX2xubiwKLS0gCjIuMjEuMC41OTMuZzUxMWVjMzQ1ZTE4CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
