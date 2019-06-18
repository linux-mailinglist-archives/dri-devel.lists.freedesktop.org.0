Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4746F4AACA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 21:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85876E228;
	Tue, 18 Jun 2019 19:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E956E228
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 19:06:34 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E5AA521530;
 Tue, 18 Jun 2019 19:06:29 +0000 (UTC)
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
Subject: [RFT 09/10] ARM: exynos_defconfig: Enable Panfrost and LIMA drivers
Date: Tue, 18 Jun 2019 21:05:33 +0200
Message-Id: <20190618190534.4951-10-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190618190534.4951-1-krzk@kernel.org>
References: <20190618190534.4951-1-krzk@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560884794;
 bh=tKuxna/c/tPIwWl1WEp9bAthDvfo4BrsL1N8qcs17h4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b4uMAxQv22mXkzeQdF8lt4/9t4lWbHJD4LXhNOCdcCsbDuW1PDrvBxMWrPrNwRE4c
 jPdhEkVBWANBLW7n/II52Scd5EQVKsFMZ3ZzvHIUQaqL14nbTFWGLuXetPCaXmmkTl
 BuebAaWOYZIC/6f2+FmBKxd0j+OIjBRn4ShWoD2M=
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

RW5hYmxlIHN1cHBvcnQgZm9yIE1hbGkgR1BVIHdpdGggUGFuZnJvc3QgYW5kIExJTUEgZHJpdmVy
cy4gIE1vc3Qgb2YKRXh5bm9zIGNoaXBzZXRzIGNvbWUgd2l0aCBNYWxpIEdQVXM6CjEuIE1hbGkg
NDAwIChFeHlub3MzMjUwLCBFeHlub3M0MjEwLCBFeHlub3M0NDEyKSwKMi4gTWFsaSBUN3h4IChF
eHlub3M1NDJ4KS4KClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2Vy
bmVsLm9yZz4KLS0tCiBhcmNoL2FybS9jb25maWdzL2V4eW5vc19kZWZjb25maWcgfCAzICsrLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2FyY2gvYXJtL2NvbmZpZ3MvZXh5bm9zX2RlZmNvbmZpZyBiL2FyY2gvYXJtL2NvbmZpZ3Mv
ZXh5bm9zX2RlZmNvbmZpZwppbmRleCA4ZDA4ZWVkOTlhYTEuLmYxNDA1MzJkZGNhNyAxMDA2NDQK
LS0tIGEvYXJjaC9hcm0vY29uZmlncy9leHlub3NfZGVmY29uZmlnCisrKyBiL2FyY2gvYXJtL2Nv
bmZpZ3MvZXh5bm9zX2RlZmNvbmZpZwpAQCAtMjEyLDYgKzIxMiw4IEBAIENPTkZJR19EUk1fTlhQ
X1BUTjM0NjA9eQogQ09ORklHX0RSTV9QQVJBREVfUFM4NjIyPXkKIENPTkZJR19EUk1fU0lJOTIz
ND15CiBDT05GSUdfRFJNX1RPU0hJQkFfVEMzNTg3NjQ9eQorQ09ORklHX0RSTV9MSU1BPXkKK0NP
TkZJR19EUk1fUEFORlJPU1Q9eQogQ09ORklHX0xDRF9DTEFTU19ERVZJQ0U9eQogQ09ORklHX0xD
RF9QTEFURk9STT15CiBDT05GSUdfQkFDS0xJR0hUX1BXTT15CkBAIC0yODQsNyArMjg2LDYgQEAg
Q09ORklHX0NST1NfRUNfU1BJPXkKIENPTkZJR19DT01NT05fQ0xLX01BWDc3Njg2PXkKIENPTkZJ
R19DT01NT05fQ0xLX1MyTVBTMTE9eQogQ09ORklHX0VYWU5PU19JT01NVT15Ci1DT05GSUdfUE1f
REVWRlJFUT15CiBDT05GSUdfREVWRlJFUV9HT1ZfUEVSRk9STUFOQ0U9eQogQ09ORklHX0RFVkZS
RVFfR09WX1BPV0VSU0FWRT15CiBDT05GSUdfREVWRlJFUV9HT1ZfVVNFUlNQQUNFPXkKLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
