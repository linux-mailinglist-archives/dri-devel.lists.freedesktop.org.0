Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61718B47A15
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 11:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A6610E187;
	Sun,  7 Sep 2025 09:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K3f13eRG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CFA10E187
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Sep 2025 09:34:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9CE7F44134;
 Sun,  7 Sep 2025 09:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E01CCC4CEF0;
 Sun,  7 Sep 2025 09:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757237665;
 bh=cTNJvTaQR5rsTZCwNQVxZGskkL+S1GYnFsvsI7XSLbo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K3f13eRG2O4rA8PbNf/SO+UCluTEqSyo948VS10WjA7Okpz2v4rK13blezNsXzfgR
 dHHbjP68SjFFDwWzayno8FDptVHwYUySS7RC1XhYQSZnkDRsZGvR8uO46vrjyJy49y
 DCAfrMG+XJTcOilz8o8ol+9YTEQrmru6ZTZihJ0thh7qEVVLUYpz1iA9Kuzqg8ONBI
 3pf232/YQ1Scc2pDzk9pmRvxsKONmN42Tth6W3EYjeXayMXANINWw9kfxD3ygcDlBI
 s/aLCpS35on2GYxoCw21l0nJehnntEaNh4GNPqMlNJbRYeW4J3XZrSzYAi303BRBaL
 QmFe203OTEobQ==
Date: Sun, 7 Sep 2025 11:34:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
 Thierry Reding <treding@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dmitry Osipenko <digetx@gmail.com>,
 Jonas =?utf-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>, 
 Charan Pedumuru <charan.pedumuru@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 02/23] dt-bindings: clock: tegra30: Add IDs for CSI
 pad clocks
Message-ID: <20250907-arboreal-aquatic-gopher-686643@kuoka>
References: <20250906135345.241229-1-clamor95@gmail.com>
 <20250906135345.241229-3-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250906135345.241229-3-clamor95@gmail.com>
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

On Sat, Sep 06, 2025 at 04:53:23PM +0300, Svyatoslav Ryhel wrote:
> Tegra30 has CSI pad clock enable bits embedded into PLLD/PLLD2 registers.
> Add ids for these clocks. Additionally, move TEGRA30_CLK_CLK_MAX into
> clk-tegra30 source.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/clk/tegra/clk-tegra30.c         | 1 +
>  include/dt-bindings/clock/tegra30-car.h | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
> index ca367184e185..ca738bc64615 100644
> --- a/drivers/clk/tegra/clk-tegra30.c
> +++ b/drivers/clk/tegra/clk-tegra30.c
> @@ -53,6 +53,7 @@
>  #define SYSTEM_CLK_RATE 0x030
>  
>  #define TEGRA30_CLK_PERIPH_BANKS	5
> +#define TEGRA30_CLK_CLK_MAX		311

Unused define drop.

Also, don't mix bindings and drivers. You cannot create such
dependencies.

Best regards,
Krzysztof

