Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FC04AAD2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 21:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D666E21D;
	Tue, 18 Jun 2019 19:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8796E21D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 19:06:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4296B215EA;
 Tue, 18 Jun 2019 19:06:35 +0000 (UTC)
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
Subject: [RFT 10/10] arm64: defconfig: Enable Panfrost driver
Date: Tue, 18 Jun 2019 21:05:34 +0200
Message-Id: <20190618190534.4951-11-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190618190534.4951-1-krzk@kernel.org>
References: <20190618190534.4951-1-krzk@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560884800;
 bh=8Pg1RVM5aZ3oBKkDdus18bslAtYlcoTCIBdsEfOp1J8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vk8uLH50kEOnB6d+lSctcgXbT/0T5J440YyatXboLJSV1EBGNGlMnCIzatFDPkfmV
 Eeyxb5SHQYUwqqOAvh9A/ZEVR+9/m/lhzp+bWeU0OBIzSGtjK8zVj8XfOcR58ibPUY
 uqK940pnUfzEPj6JfiIL4HZohgjI/JcKeSOuSXh0=
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

RW5hYmxlIHN1cHBvcnQgZm9yIE1hbGkgR1BVIHdpdGggUGFuZnJvc3QgZHJpdmVyLCBlLmcuIGZv
ciBFeHlub3M1NDMzCmFuZCBFeHlub3M3IChoYXZpbmcgTWFsaSBUNzYwKS4KClNpZ25lZC1vZmYt
Ynk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KLS0tCiBhcmNoL2FybTY0
L2NvbmZpZ3MvZGVmY29uZmlnIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZp
ZyBiL2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcKaW5kZXggNmI0ZjVjZjIzMzI0Li45NzJi
MTcyMzlmMTMgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcKKysrIGIv
YXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZpZwpAQCAtNTE3LDYgKzUxNyw3IEBAIENPTkZJR19E
Uk1fSElTSV9ISUJNQz1tCiBDT05GSUdfRFJNX0hJU0lfS0lSSU49bQogQ09ORklHX0RSTV9NRVNP
Tj1tCiBDT05GSUdfRFJNX1BMMTExPW0KK0NPTkZJR19EUk1fUEFORlJPU1Q9bQogQ09ORklHX0ZC
PXkKIENPTkZJR19GQl9NT0RFX0hFTFBFUlM9eQogQ09ORklHX0JBQ0tMSUdIVF9HRU5FUklDPW0K
QEAgLTcxNyw3ICs3MTgsNiBAQCBDT05GSUdfQVJDSF9URUdSQV8xOTRfU09DPXkKIENPTkZJR19B
UkNIX0szX0FNNl9TT0M9eQogQ09ORklHX1NPQ19UST15CiBDT05GSUdfVElfU0NJX1BNX0RPTUFJ
TlM9eQotQ09ORklHX0RFVkZSRVFfR09WX1NJTVBMRV9PTkRFTUFORD15CiBDT05GSUdfRVhUQ09O
X1VTQl9HUElPPXkKIENPTkZJR19FWFRDT05fVVNCQ19DUk9TX0VDPXkKIENPTkZJR19NRU1PUlk9
eQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
