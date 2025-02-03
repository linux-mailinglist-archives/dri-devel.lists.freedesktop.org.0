Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6C2A2534F
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 08:55:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC9910E3EA;
	Mon,  3 Feb 2025 07:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZwVLYWoR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B3310E3EA
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 07:54:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 49945A40C61;
 Mon,  3 Feb 2025 07:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE47C4CEE2;
 Mon,  3 Feb 2025 07:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738569297;
 bh=Vjg/ZcQVDN+Ca75e3lqacBpyaOhpu24vEZ6rdbWC6RQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZwVLYWoRQW3nmevqdQ0qxAVrjkFjwL1Ke44rdKWjOxT9tqVrylYJJwCxcRE+rn3FE
 GHLrKA99WxFYPkUjRtqI7SMSDajq+zX7rDBIQ0LqUBciA3E7+drheu+4Xwg0xL4mbP
 48HpVZy9TiQlPk6sVf0J0y67ml0DV69SPIwZJf+9u4hOd0dVlEDOhqrj9K6GOnafGA
 fbDrMV0SAiOdd6QpOTtOiPj0wAcJ7irBGalEw4dJNjmqDLaytiyKDbahVYnyO2HENj
 XHK2fF1D1cfADmWqh0mtF8h8+nvvspM/1yfR11facw7Wu9yU62TF9rowkcPEX3xQ4x
 fFjGjnIF/wlyw==
Date: Mon, 3 Feb 2025 08:54:54 +0100
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
Subject: Re: [PATCH 02/33] dt-bindings: clock: add clock definitions for
 exynos7870 CMU
Message-ID: <20250203-enigmatic-remarkable-beagle-709955@krzk-bin>
References: <20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org>
 <20250202190758.14986-1-kauschluss@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250202190758.14986-1-kauschluss@disroot.org>
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

On Mon, Feb 03, 2025 at 12:37:58AM +0530, Kaustabh Chakraborty wrote:
> From: Sergey Lisov <sleirsgoevy@gmail.com>
> 
> Add unique identifiers for exynos7870 clocks for every bank. It adds all
> clocks of CMU_MIF, CMU_DISPAUD, CMU_G3D, CMU_ISP, CMU_MFCMSCL, and
> CMU_PERI.
> 
> Signed-off-by: Sergey Lisov <sleirsgoevy@gmail.com>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  include/dt-bindings/clock/exynos7870.h | 324 +++++++++++++++++++++++++
>  1 file changed, 324 insertions(+)

Look at git log - that's never a separate commit.

Best regards,
Krzysztof

