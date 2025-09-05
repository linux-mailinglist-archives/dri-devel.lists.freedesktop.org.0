Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C99B46198
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 20:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0864810EC1B;
	Fri,  5 Sep 2025 18:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oKnc1VSQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F2610EC1B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 18:00:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2C948601AA;
 Fri,  5 Sep 2025 18:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9860C4CEF1;
 Fri,  5 Sep 2025 18:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757095240;
 bh=pgmvmFb/8kCCNlf55iLem9HEzp6mMHv7i0NyicdLw3k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oKnc1VSQDVaKcv7LYjjc1Ax66S7zi9xjI8eoRSSKLtpWLpad1IwKwL139iPbJqw8d
 /nw9jsxo++HfXkc05NrCuh8O4ih+0u3T9MBJprmNBQavnpW94hXOXlnwOH0ZbjizZh
 /0qrQK6UiwlrIq90H5Wlo7TrhMfhNYSurii0sxqgcB+TayNk8pNtLefUFR7fynA6l4
 IaOg+V19WQig0hjz8wtWOVdX2Oxv27tm2/zPsP1z6moVQOAUfs5vfVWxZ32cEsn8t9
 P2/ehrXLbgkj7lGWD01R6w9twLiQbR29b8bEQOGgwXWwjJp8o4zeDoOhDZoYEIvguh
 IX/FMnpfZzOtg==
Date: Fri, 5 Sep 2025 13:00:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, Liu Ying <victor.liu@nxp.com>,
 Maxime Ripard <mripard@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Phong LE <ple@baylibre.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: Reference DAI common schema
Message-ID: <175709523857.1011984.7960625628072770929.robh@kernel.org>
References: <20250904083816.48076-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904083816.48076-2-krzysztof.kozlowski@linaro.org>
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


On Thu, 04 Sep 2025 10:38:17 +0200, Krzysztof Kozlowski wrote:
> Several display bridges (e.g. LVDS to HDMI converters) are used as sound
> Digital Audio Interface (DAI) and have '#sound-dai-cells', thus they
> should reference dai-common.yaml schema to allow common properties, like
> DAI name.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/display/bridge/ite,it6263.yaml       | 1 +
>  .../devicetree/bindings/display/bridge/ite,it66121.yaml      | 5 ++++-
>  .../devicetree/bindings/display/bridge/lontium,lt9611.yaml   | 5 ++++-
>  .../devicetree/bindings/display/bridge/nxp,tda998x.yaml      | 5 ++++-
>  .../devicetree/bindings/display/bridge/sil,sii9022.yaml      | 5 ++++-
>  5 files changed, 17 insertions(+), 4 deletions(-)
> 

Applied, thanks!

