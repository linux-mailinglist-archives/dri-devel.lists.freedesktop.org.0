Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AE9B31C86
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 16:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFDF10EB37;
	Fri, 22 Aug 2025 14:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BgQ4QtKN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3012B10EB37
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 14:48:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CF42D4461D;
 Fri, 22 Aug 2025 14:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87789C4CEED;
 Fri, 22 Aug 2025 14:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755874097;
 bh=n4JvEFi7K9Gnd4LcwTA0bUtIPMP+X5TsCejUHnwhR34=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BgQ4QtKN0Hrlp+tukqXWm1mhlAR7cmdX5V73Oyrmx/LUNmbGl7mcWKEc8K0JS3PnU
 cZsf1QxRdJYiqT/ljbvr2pdN3lqlaBFwrmaXY9/OTYKDRaFBEdkm4ee6gxhixeeX3Y
 SbwaSRu6YR6PW3QOwwIcYj+KxYEYIRorQUlLaTQ6f7ycze9l1TJ9fTVgauCJF6SrLR
 0kpHfu5WZqx4qRoy2M7MnF6/fC8KBVd7adWJ05/3hqBP4BhXQBTsHdseuAcO8dbQhs
 F5aNMKlX91su9yhj4W+inDZWQhuaIbLsWKeu6rBkRVK3GFyFhOzoxotW3hqt0BRZcM
 hud/qTNt6vaEQ==
Date: Fri, 22 Aug 2025 09:48:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Simona Vetter <simona@ffwll.ch>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, devicetree@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Robert Foss <rfoss@kernel.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Jonas Karlman <jonas@kwiboo.se>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: ingenic,jz4780-hdmi: Add
 missing clock-names
Message-ID: <175587409204.3789906.17191769934979803832.robh@kernel.org>
References: <20250820-dt-bindings-display-v2-0-91e2ccba3d4e@linaro.org>
 <20250820-dt-bindings-display-v2-1-91e2ccba3d4e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-dt-bindings-display-v2-1-91e2ccba3d4e@linaro.org>
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


On Wed, 20 Aug 2025 16:17:36 +0200, Krzysztof Kozlowski wrote:
> The binding references synopsys,dw-hdmi.yaml schema which defines both
> 'clocks' and 'clock-names' with variable length, therefore we need here
> also same constraint for 'clock-names' as for 'clocks'.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml        | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks!

