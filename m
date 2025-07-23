Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A453B0E97F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 06:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D49510E744;
	Wed, 23 Jul 2025 04:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="THC1ndyP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D64710E743
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 04:14:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CEE01A53CCC;
 Wed, 23 Jul 2025 04:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61B4FC4CEE7;
 Wed, 23 Jul 2025 04:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753244064;
 bh=068U/3dDptn488fVfNI5p67qmkycirBJvcbEN1F+XJc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=THC1ndyP2UGYfBCIVUWwFaz+1yFzznPLRhhgpkTwTMB2X9BapuDAO3Equa57tdCI3
 gWYyIxnAc1eoSMg9fbt9MYsAmXfJOVQDTQQG/lsMcQGZYNzLTr/6qpnm/SoiB4uo+b
 Xqs3SBatmCVbuFMwwFsvbhYCpAPYfkplKpGmz6gX3C7EytaPK0GoPZKooNBMSlmQcL
 vssP0BW98eH/Qn3lurKWjwGPRQRqrfvXGbhWYAqSpkHs5RFiKHJrFkj+VTaA4jJcoh
 rvRas4q7Y76u15bx6yiHHtSYUFqhhR+sRlIZPDKa0J04JM610pJlw/eKwQNpH1Dxyw
 R9dCd32hpD6aw==
Date: Tue, 22 Jul 2025 23:14:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Airlie <airlied@gmail.com>,
 Kevin Tang <kevin.tang@unisoc.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 2/2] dt-bindings: display: sprd,sharkl3-dsi-host: Fix
 missing clocks constraints
Message-ID: <175324406286.1120502.4383159624545428520.robh@kernel.org>
References: <20250720123003.37662-3-krzysztof.kozlowski@linaro.org>
 <20250720123003.37662-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720123003.37662-4-krzysztof.kozlowski@linaro.org>
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


On Sun, 20 Jul 2025 14:30:05 +0200, Krzysztof Kozlowski wrote:
> 'minItems' alone does not impose upper bound, unlike 'maxItems' which
> implies lower bound.  Add missing clock constraint so the list will have
> exact number of items (clocks).
> 
> Fixes: 2295bbd35edb ("dt-bindings: display: add Unisoc's mipi dsi controller bindings")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

