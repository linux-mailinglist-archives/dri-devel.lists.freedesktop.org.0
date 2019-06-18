Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2279B4AABD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 21:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D45B6E223;
	Tue, 18 Jun 2019 19:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8704A6E223
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 19:06:18 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 001EF20863;
 Tue, 18 Jun 2019 19:06:12 +0000 (UTC)
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
Subject: [RFT 06/10] arm64: dts: exynos: Add GPU/Mali T760 node to Exynos5433
Date: Tue, 18 Jun 2019 21:05:30 +0200
Message-Id: <20190618190534.4951-7-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190618190534.4951-1-krzk@kernel.org>
References: <20190618190534.4951-1-krzk@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560884778;
 bh=LkRvvcttoJNDSKrNrdMMav77ZqbcaMUvQH3Jz5hTWcY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j1vVpE1EGeSmNFa3mwdOVVNIgWI7vFcXQyL4hgaC7+vyZzPqaI7ezBj5zsfqOzA6X
 b6RLRbGyb+uKjxOZbIE5f8knTPRBv3BJjXsn4ektLwdQ56d5gue7Xwt0nXz1kplSVq
 x5iYr6U4bPLJhxg4O+BE0WERjGXOYF/Z0ve/pB08=
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

QWRkIG5vZGVzIGZvciBHUFUgKE1hbGkgVDc2MCkgdG8gRXh5bm9zNTQzMy4gIE1pc3NpbmcgZWxl
bWVudCBpcyB0aGUKY29vbGluZyBkZXZpY2UuICBOb3QgdGVzdGVkIG9uIEhXLgoKU2lnbmVkLW9m
Zi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgotLS0KIC4uLi9kdHMv
ZXh5bm9zL2V4eW5vczU0MzMtdG0yLWNvbW1vbi5kdHNpICAgICB8ICA1ICsrCiBhcmNoL2FybTY0
L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLmR0c2kgICAgfCA1MSArKysrKysrKysrKysrKysr
KysrCiAyIGZpbGVzIGNoYW5nZWQsIDU2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi1jb21tb24uZHRzaSBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvZXh5bm9zL2V4eW5vczU0MzMtdG0yLWNvbW1vbi5kdHNpCmluZGV4IGQy
ZGUxNjY0NWUxMC4uNmY5MGIwZTYyY2JhIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRz
L2V4eW5vcy9leHlub3M1NDMzLXRtMi1jb21tb24uZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi1jb21tb24uZHRzaQpAQCAtMzUwLDYgKzM1MCwxMSBA
QAogCXBpbmN0cmwtMCA9IDwmdGVfaXJxPjsKIH07CiAKKyZncHUgeworCW1hbGktc3VwcGx5ID0g
PCZidWNrNl9yZWc+OworCXN0YXR1cyA9ICJva2F5IjsKK307CisKICZoZG1pIHsKIAlocGQtZ3Bp
b3MgPSA8JmdwYTMgMCBHUElPX0FDVElWRV9ISUdIPjsKIAlzdGF0dXMgPSAib2theSI7CmRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLmR0c2kgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLmR0c2kKaW5kZXggZDI5ZDEzZjQ2OTRm
Li5hNzZmNjIwZjdmMzUgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZXh5bm9zL2V4
eW5vczU0MzMuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMz
LmR0c2kKQEAgLTI0OSw2ICsyNDksNTcgQEAKIAkJfTsKIAl9OwogCisJZ3B1OiBncHVAMTRhYzAw
MDAgeworCQljb21wYXRpYmxlID0gInNhbXN1bmcsZXh5bm9zNTQzMy1tYWxpIiwgImFybSxtYWxp
LXQ3NjAiOworCQlyZWcgPSA8MHgxNGFjMDAwMCAweDUwMDA+OworCQlpbnRlcnJ1cHRzID0gPEdJ
Q19TUEkgMjgyIElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJICAgICA8R0lDX1NQSSAyODMgSVJR
X1RZUEVfTEVWRUxfSElHSD4sCisJCQkgICAgIDxHSUNfU1BJIDI4MSBJUlFfVFlQRV9MRVZFTF9I
SUdIPjsKKwkJaW50ZXJydXB0LW5hbWVzID0gImpvYiIsICJtbXUiLCAiZ3B1IjsKKwkJY2xvY2tz
ID0gPCZjbXVfZzNkIENMS19BQ0xLX0czRD47CisJCWNsb2NrLW5hbWVzID0gImNvcmUiOworCQlw
b3dlci1kb21haW5zID0gPCZwZF9nM2Q+OworCQlvcGVyYXRpbmctcG9pbnRzLXYyID0gPCZncHVf
b3BwX3RhYmxlPjsKKwkJc3RhdHVzID0gImRpc2FibGVkIjsKKworCQlncHVfb3BwX3RhYmxlOiBv
cHBfdGFibGUgeworCQkJY29tcGF0aWJsZSA9ICJvcGVyYXRpbmctcG9pbnRzLXYyIjsKKworCQkJ
b3BwLTE2MDAwMDAwMCB7CisJCQkJb3BwLWh6ID0gL2JpdHMvIDY0IDwxNjAwMDAwMDA+OworCQkJ
CW9wcC1taWNyb3ZvbHQgPSA8MTAwMDAwMD47CisJCQl9OworCQkJb3BwLTI2NzAwMDAwMCB7CisJ
CQkJb3BwLWh6ID0gL2JpdHMvIDY0IDwyNjcwMDAwMDA+OworCQkJCW9wcC1taWNyb3ZvbHQgPSA8
MTAwMDAwMD47CisJCQl9OworCQkJb3BwLTM1MDAwMDAwMCB7CisJCQkJb3BwLWh6ID0gL2JpdHMv
IDY0IDwzNTAwMDAwMDA+OworCQkJCW9wcC1taWNyb3ZvbHQgPSA8MTAyNTAwMD47CisJCQl9Owor
CQkJb3BwLTQyMDAwMDAwMCB7CisJCQkJb3BwLWh6ID0gL2JpdHMvIDY0IDw0MjAwMDAwMDA+Owor
CQkJCW9wcC1taWNyb3ZvbHQgPSA8MTAyNTAwMD47CisJCQl9OworCQkJb3BwLTUwMDAwMDAwMCB7
CisJCQkJb3BwLWh6ID0gL2JpdHMvIDY0IDw1MDAwMDAwMDA+OworCQkJCW9wcC1taWNyb3ZvbHQg
PSA8MTA3NTAwMD47CisJCQl9OworCQkJb3BwLTU1MDAwMDAwMCB7CisJCQkJb3BwLWh6ID0gL2Jp
dHMvIDY0IDw1NTAwMDAwMDA+OworCQkJCW9wcC1taWNyb3ZvbHQgPSA8MTEyNTAwMD47CisJCQl9
OworCQkJb3BwLTYwMDAwMDAwMCB7CisJCQkJb3BwLWh6ID0gL2JpdHMvIDY0IDw2MDAwMDAwMDA+
OworCQkJCW9wcC1taWNyb3ZvbHQgPSA8MTE1MDAwMD47CisJCQl9OworCQkJb3BwLTcwMDAwMDAw
MCB7CisJCQkJb3BwLWh6ID0gL2JpdHMvIDY0IDw3MDAwMDAwMDA+OworCQkJCW9wcC1taWNyb3Zv
bHQgPSA8MTE1MDAwMD47CisJCQl9OworCQl9OworCX07CisKIAlwc2NpIHsKIAkJY29tcGF0aWJs
ZSA9ICJhcm0scHNjaSI7CiAJCW1ldGhvZCA9ICJzbWMiOwotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
