Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FAEB2CDD9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 22:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D164910E668;
	Tue, 19 Aug 2025 20:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="evk13QPM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F88B10E21B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 20:30:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 21B3A5C5BD5;
 Tue, 19 Aug 2025 20:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E42CC4CEF1;
 Tue, 19 Aug 2025 20:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755635408;
 bh=ZR2C8Q08ABDZQ88UJtSosGwmMAl53VIxN5VzyU/juXw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=evk13QPMGD+oT9KokhawGFp/+Z/Fucf/SyvYEV+8YhumHAA2weEBBUVoDt5tAdcvM
 nVR88XBOqLRsTVhXJeEwhZf5F376YoLKPmmGxTY+XL2Yo1L2XZYgaOlIJVEkXJ42Qt
 3uNLB/DiIZgCXR+zTJY+R68PcSkExfyNNdZdV798hpROEhq3Q5l085149ns0eHc8Tj
 ambGWSAuR6X9ytxpfCBxxh8wDfwgIgb348eqoWqJ0CHjsnuxmmQjqOityJJVWfyVEk
 jqOYh6XPR1hxOVJAiAPHOM8mvB+cm/KO/KGtKxAWaTxEGK2GUmYm6KeD1iX8mUGzcH
 FaVJSYdn2jGsQ==
Date: Tue, 19 Aug 2025 15:30:07 -0500
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
Subject: Re: [PATCH v1 17/19] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
Message-ID: <20250819203007.GA1266319-robh@kernel.org>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-18-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819121631.84280-18-clamor95@gmail.com>
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

On Tue, Aug 19, 2025 at 03:16:29PM +0300, Svyatoslav Ryhel wrote:
> Document CSI hw block found in Tegra20 and Tegra30 SoC.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra210-csi.yaml    | 78 +++++++++++++++----
>  1 file changed, 63 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
> index fa07a40d1004..a5669447a33b 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
> @@ -16,30 +16,78 @@ properties:
>  
>    compatible:
>      enum:
> +      - nvidia,tegra20-csi
> +      - nvidia,tegra30-csi
>        - nvidia,tegra210-csi
>  
>    reg:
>      maxItems: 1
>  
> -  clocks:
> -    items:
> -      - description: module clock
> -      - description: A/B lanes clock
> -      - description: C/D lanes clock
> -      - description: E lane clock
> -      - description: test pattern generator clock
> -
> -  clock-names:
> -    items:
> -      - const: csi
> -      - const: cilab
> -      - const: cilcd
> -      - const: cile
> -      - const: csi_tpg
> +  clocks: true
> +  clock-names: true
>  
>    power-domains:
>      maxItems: 1
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra20-csi
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: module clock
> +
> +        clock-names:
> +          items:
> +            - const: csi
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra30-csi
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: module clock
> +            - description: PAD A clock
> +            - description: PAD B clock
> +
> +        clock-names:
> +          items:
> +            - const: csi
> +            - const: csia_pad
> +            - const: csib_pad
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra210-csi
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: module clock
> +            - description: A/B lanes clock
> +            - description: C/D lanes clock
> +            - description: E lane clock
> +            - description: test pattern generator clock
> +
> +        clock-names:
> +          items:
> +            - const: csi
> +            - const: cilab
> +            - const: cilcd
> +            - const: cile
> +            - const: csi_tpg
> +

This is longer that what's the same. I think this should be a separate 
schema doc.

Rob
