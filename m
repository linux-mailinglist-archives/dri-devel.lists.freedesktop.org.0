Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA618A2533C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 08:53:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29BF10E06E;
	Mon,  3 Feb 2025 07:53:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GdzDDw+T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8C610E06E
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 07:53:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3A1DAA40EAA;
 Mon,  3 Feb 2025 07:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D18AC4CEE2;
 Mon,  3 Feb 2025 07:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738569188;
 bh=98P8X6HMfcm3Oxb2BZKVpxuLvrRbMpgR2GrkKyq4mkM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GdzDDw+TQ2RB5QCOljApbh1Dlc8hoYjvO4lSQ/49lsQ6ZVV2A4k2pJaVsWI+FbVNo
 VJ0yLHPv9e01G669yA0cuIG1WK5T0WTiUegMwrtsOhcnUeitdHku8VcHPoepnDJlw8
 nKJqcmFLJrGplgm03KhG48/AI5d0XlKpajVGrFIv7SBLqq6QE05rpho4o4HNhHNnXr
 d8pLn1baGWmyQ7nL3QgzE6t+29sl0NIKOwo3GOwMGDtBM0fK9eXa7LqHDX5ggldgBy
 NAhtDZ4dmKbGXZwVM37OEtQwAQvLvyAJXI61czxKGZ0rwcFHOkR0idtiPKZFfgURMR
 VVlgiT8sUR8Pg==
Date: Mon, 3 Feb 2025 08:53:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Andi Shyti <andi.shyti@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
 Vivek Gautam <gautam.vivek@samsung.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 Sergey Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH 02/34] dt-bindings: hwinfo: samsung,exynos-chipid: add
 exynos7870-chipid compatible
Message-ID: <20250203-roadrunner-of-unnatural-wind-54bddf@krzk-bin>
References: <20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org>
 <20250202190353.14572-1-kauschluss@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250202190353.14572-1-kauschluss@disroot.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 03, 2025 at 12:33:53AM +0530, Kaustabh Chakraborty wrote:
> Add the compatible string "samsung,exynos7870-chipid" to the documentation,
> with a fallback to "samsung,exynos4210-chipid".

This we see from the diff. Say something not obvious about hardware
instead of repeating redudundantly subject and diff. Otherwise what you
said is equivalent in just few words: "Document Exynos7870 ChipID."
instead of two lines of text. Instead say whether device is or is not
compatible.

Best regards,
Krzysztof

