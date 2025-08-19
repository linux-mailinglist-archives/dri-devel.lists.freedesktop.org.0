Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0E6B2CDC2
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 22:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F4C10E20D;
	Tue, 19 Aug 2025 20:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pmCFTRj3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BF210E20D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 20:27:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 87C8A613EF;
 Tue, 19 Aug 2025 20:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166F6C4CEF1;
 Tue, 19 Aug 2025 20:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755635243;
 bh=oIDpHueO9zGTm/sfs/uw7A7+IqTRVGpRNQrkAMXBRsk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pmCFTRj3iZCCkzA57BGea3AnymZmNXaIgJtP0674gt4uZi6udBFgB8yVncHIR7+Ke
 pIgNDFO1IJi9rf3m2tnECTQ6YY2zQBPPLeKDGzBAnqTKtRxfCMB8cpEVItQLdjo8SH
 wHONffK+o4aqaRMEUXiGaFgeuLHVWfxOD2GoakCdmi06QMXdGE6K5KF6iIMz97nC1G
 jnBGlEfBr49Ae10eKlKgXjHv6E1xEcvq18BPlIpq7yfp5uM+HvUYy36KbwBP3kf7Mr
 DJMx/i+tW6w0FNinu33Pdly+YTqdhMtGe9/A11KzN2Kgv2lHIlAalqpLRg2ygW6JVZ
 6ApwOp+YhQLAA==
Date: Tue, 19 Aug 2025 15:27:22 -0500
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
Subject: Re: [PATCH v1 04/19] dt-bindings: display: tegra: document Tegra30 VIP
Message-ID: <20250819202722.GA1264491-robh@kernel.org>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-5-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819121631.84280-5-clamor95@gmail.com>
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

On Tue, Aug 19, 2025 at 03:16:16PM +0300, Svyatoslav Ryhel wrote:
> Parallel VI interface found in Tegra30 is exactly the same as Tegra20 has.

That's not what the compatible schema says. 'exactly the same' implies a 
fallback to whatever it is exactly the same as.

> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml    | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
> index 14294edb8d8c..39e9b3297dbd 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
> @@ -13,6 +13,7 @@ properties:
>    compatible:
>      enum:
>        - nvidia,tegra20-vip
> +      - nvidia,tegra30-vip
>  
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
> -- 
> 2.48.1
> 
