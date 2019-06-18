Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FC24AAB3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 21:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D486E221;
	Tue, 18 Jun 2019 19:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D576E221
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 19:06:06 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D046120863;
 Tue, 18 Jun 2019 19:06:00 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kukjin Kim <kgene@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Olof Johansson <olof@lixom.net>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [RFT 04/10] ARM: dts: exynos: Add GPU/Mali 400 node to Exynos3250
Date: Tue, 18 Jun 2019 21:05:28 +0200
Message-Id: <20190618190534.4951-5-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190618190534.4951-1-krzk@kernel.org>
References: <20190618190534.4951-1-krzk@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560884766;
 bh=35ajcQTUrxjhUeXGGlOA1kiwWji+OcuqCXHhS9a7WH0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T7w5ttuvQ4w9b92ajtdfWfQj6WKG7vlWqJxB1TCMLmAgCmSFEDE5jZz4f6R4oIr3n
 dOWw8Tn8H2720hRCgy6q+C/ZC1eIJPdmrcNC9kMfon6FnaW3gcwGhPfwzj/EVzH00E
 fsY6RwT71OTtp1wyqQzGD1TTrmU595jVJ1rYxCM8=
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIG5vZGVzIGZvciBHUFUgKE1hbGkgNDAwKSB0byBFeHlub3MzMjUwLiAgVGhpcyBpcyBzdGls
bCBsaW1pdGVkIGFuZApub3QgdGVzdGVkOgoxLiBObyBkeW5hbWljIHZvbHRhZ2UgYW5kIGZyZXF1
ZW5jeSBzY2FsaW5nLAoyLiBOb3Qgc3VyZSB3aGF0IHRvIGRvIHdpdGggQ0xLX0czRCBjbG9jayBy
ZXNwb25zaWJsZSBmb3IgZ2F0aW5nIGVudGlyZQogICBJUCBibG9jayAoaXQgaXMgbm93IGJlaW5n
IGRpc2FibGVkIGFzIHVudXNlZCkuCgpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnprQGtlcm5lbC5vcmc+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zMzI1MC1hcnRp
azUuZHRzaSB8ICA1ICsrKysKIGFyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczMyNTAtbW9uay5kdHMg
ICAgfCAgNSArKysrCiBhcmNoL2FybS9ib290L2R0cy9leHlub3MzMjUwLXJpbmF0by5kdHMgIHwg
IDUgKysrKwogYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zMzI1MC5kdHNpICAgICAgICB8IDMzICsr
KysrKysrKysrKysrKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zMzI1MC1hcnRpazUuZHRzaSBi
L2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczMyNTAtYXJ0aWs1LmR0c2kKaW5kZXggYWNlNTBlMTk0
YTQ1Li5kZWUzNWUzYTVjNGIgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczMy
NTAtYXJ0aWs1LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zMzI1MC1hcnRpazUu
ZHRzaQpAQCAtNTksNiArNTksMTEgQEAKIAljcHUwLXN1cHBseSA9IDwmYnVjazJfcmVnPjsKIH07
CiAKKyZncHUgeworCW1hbGktc3VwcGx5ID0gPCZidWNrM19yZWc+OworCXN0YXR1cyA9ICJva2F5
IjsKK307CisKICZpMmNfMCB7CiAJI2FkZHJlc3MtY2VsbHMgPSA8MT47CiAJI3NpemUtY2VsbHMg
PSA8MD47CmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9leHlub3MzMjUwLW1vbmsuZHRz
IGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zMzI1MC1tb25rLmR0cwppbmRleCBlMjU3NjU1MDBl
OTkuLjI0OGJkMzcyZmU3MCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zMzI1
MC1tb25rLmR0cworKysgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3MzMjUwLW1vbmsuZHRzCkBA
IC0xNzIsNiArMTcyLDExIEBACiAJc3RhdHVzID0gIm9rYXkiOwogfTsKIAorJmdwdSB7CisJbWFs
aS1zdXBwbHkgPSA8JmJ1Y2szX3JlZz47CisJc3RhdHVzID0gIm9rYXkiOworfTsKKwogJmhzb3Rn
IHsKIAl2dXNiX2Qtc3VwcGx5ID0gPCZsZG8xNV9yZWc+OwogCXZ1c2JfYS1zdXBwbHkgPSA8Jmxk
bzEyX3JlZz47CmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9leHlub3MzMjUwLXJpbmF0
by5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3MzMjUwLXJpbmF0by5kdHMKaW5kZXggNzQ3
OTk5Mzc1NWRhLi44NmMyNmE0ZWRmZDcgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4
eW5vczMyNTAtcmluYXRvLmR0cworKysgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3MzMjUwLXJp
bmF0by5kdHMKQEAgLTI0NCw2ICsyNDQsMTEgQEAKIAl9OwogfTsKIAorJmdwdSB7CisJbWFsaS1z
dXBwbHkgPSA8JmJ1Y2szX3JlZz47CisJc3RhdHVzID0gIm9rYXkiOworfTsKKwogJmkyY18wIHsK
IAkjYWRkcmVzcy1jZWxscyA9IDwxPjsKIAkjc2l6ZS1jZWxscyA9IDwwPjsKZGlmZiAtLWdpdCBh
L2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczMyNTAuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4
eW5vczMyNTAuZHRzaQppbmRleCA4Y2UzYTc3ODZiMTkuLmM1ZjM3NjE4ZjMyOSAxMDA2NDQKLS0t
IGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zMzI1MC5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL2V4eW5vczMyNTAuZHRzaQpAQCAtMTI2LDYgKzEyNiwzOSBAQAogCQl9OwogCX07CiAKKwln
cHU6IGdwdUAxMzAwMDAwMCB7CisJCWNvbXBhdGlibGUgPSAic2Ftc3VuZyxleHlub3MzMjUwLW1h
bGkiLCAiYXJtLG1hbGktNDAwIjsKKwkJcmVnID0gPDB4MTMwMDAwMDAgMHgxMDAwMD47CisJCWlu
dGVycnVwdHMgPSA8R0lDX1NQSSAxODcgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkgICAgIDxH
SUNfU1BJIDE4MiBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKwkJCSAgICAgPEdJQ19TUEkgMTgzIElS
UV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJICAgICA8R0lDX1NQSSAxNzggSVJRX1RZUEVfTEVWRUxf
SElHSD4sCisJCQkgICAgIDxHSUNfU1BJIDE4NCBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKwkJCSAg
ICAgPEdJQ19TUEkgMTc5IElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJICAgICA8R0lDX1NQSSAx
ODUgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkgICAgIDxHSUNfU1BJIDE4MCBJUlFfVFlQRV9M
RVZFTF9ISUdIPiwKKwkJCSAgICAgPEdJQ19TUEkgMTg2IElSUV9UWVBFX0xFVkVMX0hJR0g+LAor
CQkJICAgICA8R0lDX1NQSSAxODEgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkgICAgIDxHSUNf
U1BJIDE3NyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJaW50ZXJydXB0LW5hbWVzID0gImdwIiwK
KwkJCQkgICJncG1tdSIsCisJCQkJICAicHAwIiwKKwkJCQkgICJwcG1tdTAiLAorCQkJCSAgInBw
MSIsCisJCQkJICAicHBtbXUxIiwKKwkJCQkgICJwcDIiLAorCQkJCSAgInBwbW11MiIsCisJCQkJ
ICAicHAzIiwKKwkJCQkgICJwcG1tdTMiLAorCQkJCSAgInBtdSI7CisJCWNsb2NrcyA9IDwmY211
IENMS19BU1lOQ19HM0Q+LAorCQkJIDwmY211IENMS19TQ0xLX0czRD47CisJCWNsb2NrLW5hbWVz
ID0gImJ1cyIsICJjb3JlIjsKKwkJcG93ZXItZG9tYWlucyA9IDwmcGRfZzNkPjsKKwkJc3RhdHVz
ID0gImRpc2FibGVkIjsKKwkJLyogVE9ETzogb3BlcmF0aW5nIHBvaW50cyBmb3IgRFZGUyAqLwor
CX07CisKIAlwbXUgewogCQljb21wYXRpYmxlID0gImFybSxjb3J0ZXgtYTctcG11IjsKIAkJaW50
ZXJydXB0cyA9IDxHSUNfU1BJIDE4IElSUV9UWVBFX0xFVkVMX0hJR0g+LAotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
