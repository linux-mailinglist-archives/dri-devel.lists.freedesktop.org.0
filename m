Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBB4A7D465
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 08:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8112C10E2C1;
	Mon,  7 Apr 2025 06:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PtQo/Lm2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D6010E2CA
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 06:43:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5836644048;
 Mon,  7 Apr 2025 06:43:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45AF2C4CEE8;
 Mon,  7 Apr 2025 06:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744008200;
 bh=gnBFumum9PP+8xhx0Y/DA+stQr0WbR+RKX2uP2j/1Nk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PtQo/Lm2yeKEZ5c+E6SJuXZi2DWesmqvHyQQaiSX5+vmJsQc8YKn+GEkrVlRj4mrx
 0Egkpwkk8Jeg7sDEp7oDvqxFFTURmbuNQioyThDP2uXhKD3OPq5CazopBNoVlafp+M
 xnwyQlarGlNd6uM60mclp2MMfZV9ZSHqapDKrEcxGXbSBs0kpgWZg3BpqhPxXLS3QZ
 wJ17rTuinzWXLbvDxTMiC/lZqx/wgZU1E6ldOAD/pa3QbA3mTJjVbLCuOGXs2kXcS6
 WLTBvuMIt+XrGA4T8QNqct0YQ6aQhIDsWb4Fdynfb30FHkbAECo14nDyC5Miq7Cnv7
 NwJN4+tFO6c4w==
Date: Mon, 7 Apr 2025 08:43:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
 biju.das.jz@bp.renesas.com, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: gpu: mali-bifrost: Add compatible for
 RZ/G3E SoC
Message-ID: <20250407-weightless-sincere-beetle-d1986e@shite>
References: <20250402131142.1270701-1-tommaso.merciai.xr@bp.renesas.com>
 <20250402131142.1270701-3-tommaso.merciai.xr@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250402131142.1270701-3-tommaso.merciai.xr@bp.renesas.com>
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

On Wed, Apr 02, 2025 at 03:11:39PM GMT, Tommaso Merciai wrote:
> Add a compatible string for the Renesas RZ/G3E SoC variants that
> include a Mali-G52 GPU. These variants share the same restrictions on
> interrupts, clocks, and power domains as the RZ/G2L SoC, so extend
> the existing schema validation accordingly.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

