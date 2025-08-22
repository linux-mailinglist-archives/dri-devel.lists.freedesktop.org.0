Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CA2B31C8C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 16:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A68710EB3C;
	Fri, 22 Aug 2025 14:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V4YRcrn7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB59010EB3C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 14:48:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 125E760206;
 Fri, 22 Aug 2025 14:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C6FC4CEED;
 Fri, 22 Aug 2025 14:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755874122;
 bh=ooHxYeuqSlm0Lf7mTP8oPP3GNMH5wQGxRznp5cQihXI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V4YRcrn7MAkBEsW92XCJqFP0QJf2758UgsZPB/3N2tnPDuIJ02iRgH0kP6qkiN6X7
 vzPknftZUjtwtZURBWtOkdnvupxFjYIgPcFz1ZTmxdPwhHGHB3uKU0ijlG19Y4X1Io
 lBhQZhI6440fN316kLn06tsLLkSksK+bSP5AjzlLnU6A/ZM1S7yGPhN9Pe/zoegCfK
 t1r+OF5KZWh37SexS82xmytQxZZ0cwnNuBGc+n7ZsxoU7MF53+4XUVqiY+KgkthLQ/
 SVvkhzz2StS7ISJqLqRXQgvIFLJcUIUr69TNMlEZYRFDmj9asKpIreCP20oU4ncsHO
 pTeNBPGHQg7Fw==
Date: Fri, 22 Aug 2025 09:48:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonas Karlman <jonas@kwiboo.se>, Sandy Huang <hjc@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 linux-rockchip@lists.infradead.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: display: rockchip,dw-mipi-dsi:
 Narrow clocks for rockchip,rk3288-mipi-dsi
Message-ID: <175587411947.3790873.4860739653450800146.robh@kernel.org>
References: <20250820-dt-bindings-display-v2-0-91e2ccba3d4e@linaro.org>
 <20250820-dt-bindings-display-v2-3-91e2ccba3d4e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-dt-bindings-display-v2-3-91e2ccba3d4e@linaro.org>
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


On Wed, 20 Aug 2025 16:17:38 +0200, Krzysztof Kozlowski wrote:
> The binding allows in top-level from one to four clocks and each variant
> narrows the choice, but rockchip,rk3288-mipi-dsi missed the minItems.
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Fix subject typo
> 2. Rb tag
> ---
>  .../devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml      | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!

