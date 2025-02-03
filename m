Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0E9A25345
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 08:54:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E17D10E3E1;
	Mon,  3 Feb 2025 07:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BxlFIwf1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDC110E3E1
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 07:54:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5405FA40EB8;
 Mon,  3 Feb 2025 07:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF66C4CEE2;
 Mon,  3 Feb 2025 07:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738569265;
 bh=h2Tgk866PVTB33WTwVVqd9bu13KATTuNBIINA6qpSEo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BxlFIwf1m1t7UrcDrBKcGXvWYHcpnk81A5FScAehD+Bz6Tp+Ejot0cpnnuwnOVmyo
 TO00GpHeFpiNDIh0D9EsLiEl3s6wLJVLXG0hawuTCQjt7+wNPC7kXv3T1FLCdIzG5h
 C7wzXDXz26V9RSI2UDe5bYJ7t/Vn2xVjntg7+PwTOPTlu+bqgPSMs6rc0Qh+26UnKE
 plWs82UTbwcd1ejVM+vS6Rv44R8xbRgYCjY4msr2nzzVYHvUe1PPlfQg7FF+3jCSN5
 uTc/4H11eQGEkwnxYuijm8S6CWEP5hYDArY6FOlDqK/E/XBMt8Tis9+N2oFjppYhFo
 P4BP+IWAUgpYA==
Date: Mon, 3 Feb 2025 08:54:22 +0100
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
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Sergey Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH 01/33] dt-bindings: hwinfo: samsung,exynos-chipid: add
 exynos7870-chipid compatible
Message-ID: <20250203-slim-jovial-dinosaur-3d7afe@krzk-bin>
References: <20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org>
 <20250203-exynos7870-v1-1-2b6df476a3f0@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203-exynos7870-v1-1-2b6df476a3f0@disroot.org>
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

On Mon, Feb 03, 2025 at 12:06:34AM +0530, Kaustabh Chakraborty wrote:
> Add the compatible string "samsung,exynos7870-chipid" to the documentation,
> with a fallback to "samsung,exynos4210-chipid".
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

That's mess, how could you have two same commits in Git log? The only
answer I see is that you did not create it on top of git repo. That's
not how you should work. Use either b4 or git format-patch
--cover-letter, not some other methods.

Best regards,
Krzysztof

