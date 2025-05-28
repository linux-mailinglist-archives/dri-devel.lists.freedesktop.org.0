Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B556AC69CB
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 14:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4AFC10E1FF;
	Wed, 28 May 2025 12:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KIKZgbMn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED4310E2C3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 12:52:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 30E1A61F1C;
 Wed, 28 May 2025 12:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20C1C4CEEF;
 Wed, 28 May 2025 12:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748436726;
 bh=Tx1soG5xi0/OQ1HgMXSwNaV5R2DfipanGqwLWjiDG/k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KIKZgbMnYKb8Uv9YpuRtgDyLrpcxf3WqxH0bcjyAmyP5j0Vwn9w3Fntx6TuM6FRL5
 /zO0qR/R+ZQODy223sQh4EHiH7xNJ2OcweKJDZK1udEcdDHJvyLhMq33eUq/YWdPVq
 IJ7Kl+QNOvi4oAw0Nvrgtvzyazif2lJg1UtYvfumUBxcYeq9SLrHOKi5HH/es1n4eb
 eCgtvZKGQTyCaYv2EwD+/bjFbyJu53Rpe6G2tJYaTcx+PvunQgHiAveBhzGvxlHZwQ
 AWmH8iXLM/nhowb+OaD/PwPtGyrJy8JH9VoFmynLEncQ4VNiaQiaAnFJwiRk62VHRV
 Zmb5qa25Ks0Mw==
Date: Wed, 28 May 2025 07:52:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 biju.das.jz@bp.renesas.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>, tomm.merciai@gmail.com,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] dt-bindings: gpu: mali-bifrost: Add compatible
 for RZ/G3E SoC
Message-ID: <174843671875.3661556.2233132513679539264.robh@kernel.org>
References: <20250528073040.904033-1-tommaso.merciai.xr@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528073040.904033-1-tommaso.merciai.xr@bp.renesas.com>
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


On Wed, 28 May 2025 09:30:40 +0200, Tommaso Merciai wrote:
> Add a compatible string for the Renesas RZ/G3E SoC variants that
> include a Mali-G52 GPU. These variants share the same restrictions on
> interrupts, clocks, and power domains as the RZ/G2L SoC, so extend
> the existing schema validation accordingly.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!

