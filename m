Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA751B31A72
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 15:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261B210E0AE;
	Fri, 22 Aug 2025 13:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Oql5owlm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B46010E0AE
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 13:59:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4636F5C5868;
 Fri, 22 Aug 2025 13:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60790C4CEED;
 Fri, 22 Aug 2025 13:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755871187;
 bh=vF6UXEx1CvSqyULo0+SKbfNfqLebuAIYDBy0BZCSBqw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oql5owlmcyx+BtwqvAi5GNGg9qm9vBnVSEn2f0jRS26a3SeZj0JBsp/LnJVG4zlS6
 cV0IHBQXod3IyCSnjpNp52TnugZ0Ae/TxQIHeIplpjtOs16hCMfKO4SuD+ZWO0wxdk
 M2jtnZRCZ1KPeMFE+g3u7ZUdhtm4/KQwwvB7gn8AFpb/ccYscIMCfgCVt5w+7MyjXL
 rWWB0No9Hij2ezNybwvWiU05oWck6fGhUR0MQCuk5vDAXgetXpgcYVzepFC4mN17ol
 A+8tKbYl3umXuDh6elee9tD+PTZ6h+dmmGAjseozWjwYll97fZtAIfeNV0sXYRM7vg
 924cqC0pf792g==
Date: Fri, 22 Aug 2025 08:59:46 -0500
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 02/19] dt-bindings: clock: tegra20: Add IDs for CSI
 PAD clocks
Message-ID: <20250822135946.GA3492270-robh@kernel.org>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-3-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819121631.84280-3-clamor95@gmail.com>
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

On Tue, Aug 19, 2025 at 03:16:14PM +0300, Svyatoslav Ryhel wrote:
> Tegra30 has CSI PAD clock enable bits embedded into PLLD/PLLD2 registers.
> Add ids for these clocks.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  include/dt-bindings/clock/tegra30-car.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/clock/tegra30-car.h b/include/dt-bindings/clock/tegra30-car.h
> index f193663e6f28..14b83e90a0fc 100644
> --- a/include/dt-bindings/clock/tegra30-car.h
> +++ b/include/dt-bindings/clock/tegra30-car.h
> @@ -271,6 +271,8 @@
>  #define TEGRA30_CLK_AUDIO3_MUX 306
>  #define TEGRA30_CLK_AUDIO4_MUX 307
>  #define TEGRA30_CLK_SPDIF_MUX 308
> -#define TEGRA30_CLK_CLK_MAX 309
> +#define TEGRA30_CLK_CSIA_PAD 309
> +#define TEGRA30_CLK_CSIB_PAD 310
> +#define TEGRA30_CLK_CLK_MAX 311

Please drop the MAX. This header is ABI and if a define can change, then 
it's not ABI.

Rob
