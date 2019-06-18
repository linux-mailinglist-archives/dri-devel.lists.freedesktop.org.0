Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 460524AABF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 21:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA776E225;
	Tue, 18 Jun 2019 19:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F14E6E225
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 19:06:24 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 11A9620B1F;
 Tue, 18 Jun 2019 19:06:18 +0000 (UTC)
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
Subject: [RFT 07/10] arm64: dts: exynos: Add GPU/Mali T760 node to Exynos7
Date: Tue, 18 Jun 2019 21:05:31 +0200
Message-Id: <20190618190534.4951-8-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190618190534.4951-1-krzk@kernel.org>
References: <20190618190534.4951-1-krzk@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560884783;
 bh=U1Sq2C8IHuHyw6zehGQwxbLEKHLGFo/rZxykEE20tJc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GOJlh6xX8RowOZwKzGM/sZj/b6cHPgAWKCLHuKqSgWi7kuEA9bODYFmGFXib7vcqK
 pCu42ENT2P9W/tfQUVbFMlTmg6xdX+tSo1xo0abbKciDKR1Zzkd9zl442fInpXrqOz
 3NI8uy35FQ1m7j+pAZEGBT23Tpar+4JgO5oZa0jg=
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

QWRkIG5vZGVzIGZvciBHUFUgKE1hbGkgVDc2MCkgdG8gRXh5bm9zNy4gIEN1cnJlbnQgc3VwcG9y
dCBmb3IgRXh5bm9zNwptaXNzZXMgYSBsb3QsIGluY2x1ZGluZyBwcm9wZXIgY2xvY2tzLCBwb3dl
ciBkb21haW5zLCBmcmVxdWVuY3kgYW5kCnZvbHRhZ2Ugc2NhbGluZyBhbmQgY29vbGluZy4gIEhv
d2V2ZXIgdGhpcyBzdGlsbCBjYW4gcHJvdmlkZSBiYXNpYyBHUFUKZGVzY3JpcHRpb24uICBOb3Qg
dGVzdGVkIG9uIEhXLgoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0Br
ZXJuZWwub3JnPgotLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvZXh5bm9zL2V4eW5vczctZXNwcmVz
c28uZHRzIHwgIDUgKysrKysKIGFyY2gvYXJtNjQvYm9vdC9kdHMvZXh5bm9zL2V4eW5vczcuZHRz
aSAgICAgICAgIHwgMTEgKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZXh5bm9zL2V4eW5vczctZXNw
cmVzc28uZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNy1lc3ByZXNzby5k
dHMKaW5kZXggMDBkZDg5YjkyYjQyLi4wODBlMGY1NmUxMDggMTAwNjQ0Ci0tLSBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvZXh5bm9zL2V4eW5vczctZXNwcmVzc28uZHRzCisrKyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvZXh5bm9zL2V4eW5vczctZXNwcmVzc28uZHRzCkBAIC01OSw2ICs1OSwxMSBAQAog
CWNsb2NrLWZyZXF1ZW5jeSA9IDwyNDAwMDAwMD47CiB9OwogCismZ3B1IHsKKwltYWxpLXN1cHBs
eSA9IDwmYnVjazZfcmVnPjsKKwlzdGF0dXMgPSAib2theSI7Cit9OworCiAmc2VyaWFsXzIgewog
CXN0YXR1cyA9ICJva2F5IjsKIH07CmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2V4
eW5vcy9leHlub3M3LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M3LmR0
c2kKaW5kZXggMDc3ZDIzNDc4OTAxLi5iY2I5ZDhjZWUyNjcgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvZXh5bm9zL2V4eW5vczcuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L2V4eW5vcy9leHlub3M3LmR0c2kKQEAgLTc4LDYgKzc4LDE3IEBACiAJCX07CiAJfTsKIAorCWdw
dTogZ3B1QDE0YWMwMDAwIHsKKwkJY29tcGF0aWJsZSA9ICJzYW1zdW5nLGV4eW5vczU0MzMtbWFs
aSIsICJhcm0sbWFsaS10NzYwIjsKKwkJcmVnID0gPDB4MTRhYzAwMDAgMHg1MDAwPjsKKwkJaW50
ZXJydXB0cyA9IDxHSUNfU1BJIDI0MSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKwkJCSAgICAgPEdJ
Q19TUEkgMjQyIElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJICAgICA8R0lDX1NQSSAyNDAgSVJR
X1RZUEVfTEVWRUxfSElHSD47CisJCWludGVycnVwdC1uYW1lcyA9ICJqb2IiLCAibW11IiwgImdw
dSI7CisJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCS8qIFRPRE86IG9wZXJhdGluZyBwb2ludHMg
Zm9yIERWRlMsIGNvb2xpbmcgZGV2aWNlICovCisJfTsKKwogCXBzY2kgewogCQljb21wYXRpYmxl
ID0gImFybSxwc2NpLTAuMiI7CiAJCW1ldGhvZCA9ICJzbWMiOwotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
