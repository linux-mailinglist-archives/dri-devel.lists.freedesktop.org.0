Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B74DB4AAC9
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 21:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9816E227;
	Tue, 18 Jun 2019 19:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8C36E227
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 19:06:29 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 64BD12147A;
 Tue, 18 Jun 2019 19:06:24 +0000 (UTC)
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
Subject: [RFT 08/10] ARM: multi_v7_defconfig: Enable Panfrost and LIMA drivers
Date: Tue, 18 Jun 2019 21:05:32 +0200
Message-Id: <20190618190534.4951-9-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190618190534.4951-1-krzk@kernel.org>
References: <20190618190534.4951-1-krzk@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560884789;
 bh=BuN4m7TCvsIHxw5rluKI30v0FDM5a8sAs/69N80hZis=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vk/3iyv2fjeTYjDbv6hTp/CcA1L+m9C8OSjKDsOTRGbw+GOFxWyV+QMql7MD+EiYk
 LIT+upk8J0tFo7v3AFqPkVcrZla3ZGyx39VKq+Kt9mAMcA8xa7+5ue36a/wIXWrpE7
 hZQVmgljgFsg+lfB1isIJlAhOe7CQye2M+5zplpk=
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
eHlub3M1NDJ4KS4KCkFzIE1hbGkgR1BVIGlzIHF1aXRlIHBvcHVsYXIgYW1vbmcgQVJNIHZlbmRv
cnMsIG90aGVyIHBsYXRmb3JtcyB3aWxsCmJlbmVmaXQgYXMgd2VsbC4KClNpZ25lZC1vZmYtYnk6
IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KLS0tCiBhcmNoL2FybS9jb25m
aWdzL211bHRpX3Y3X2RlZmNvbmZpZyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vY29uZmlncy9tdWx0
aV92N19kZWZjb25maWcgYi9hcmNoL2FybS9jb25maWdzL211bHRpX3Y3X2RlZmNvbmZpZwppbmRl
eCA2Yjc0OGYyMTRlYWUuLjI2ODE2MTkxMWZjOSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vY29uZmln
cy9tdWx0aV92N19kZWZjb25maWcKKysrIGIvYXJjaC9hcm0vY29uZmlncy9tdWx0aV92N19kZWZj
b25maWcKQEAgLTY1Niw2ICs2NTYsOCBAQCBDT05GSUdfRFJNX1ZDND1tCiBDT05GSUdfRFJNX0VU
TkFWSVY9bQogQ09ORklHX0RSTV9NWFNGQj1tCiBDT05GSUdfRFJNX1BMMTExPW0KK0NPTkZJR19E
Uk1fTElNQT1tCitDT05GSUdfRFJNX1BBTkZST1NUPW0KIENPTkZJR19GQl9FRkk9eQogQ09ORklH
X0ZCX1dNODUwNT15CiBDT05GSUdfRkJfU0hfTU9CSUxFX0xDREM9eQpAQCAtOTQwLDcgKzk0Miw2
IEBAIENPTkZJR19BUkNIX1RFR1JBXzJ4X1NPQz15CiBDT05GSUdfQVJDSF9URUdSQV8zeF9TT0M9
eQogQ09ORklHX0FSQ0hfVEVHUkFfMTE0X1NPQz15CiBDT05GSUdfQVJDSF9URUdSQV8xMjRfU09D
PXkKLUNPTkZJR19QTV9ERVZGUkVRPXkKIENPTkZJR19BUk1fVEVHUkFfREVWRlJFUT1tCiBDT05G
SUdfVElfQUVNSUY9eQogQ09ORklHX0lJTz15Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
