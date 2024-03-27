Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE33488ECB6
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 18:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D680C10FE4D;
	Wed, 27 Mar 2024 17:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HswMO7Dh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EEAA10FE4D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 17:33:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5D98760BA0;
 Wed, 27 Mar 2024 17:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1591C433F1;
 Wed, 27 Mar 2024 17:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711560811;
 bh=XcISWJmiP1jYqJUIUhyT8r1VsuUqiY1gK8gvy6LLjU4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HswMO7Dh++iQsFShyRLIWJ8dAKKMGV9SwB+Zkp8RfWzkNV/aksMVeBechXf6+yGAm
 nxGO0uBjsWVRcTYD4w8T9aZ0/R4ofuWlkdzJIVwV5Q1R4wmIZbSTD/hslco8t0e8Pe
 jqsFrYGwleZia8Fx8QlspHSX1UpTvNstm7AG3DHR5cbsttX4HsjURyOUZkwAyaq4uy
 Lqc3qeSOQ5j+vwXRSB1tF43QFM4pqIgJn2YyHJZ3+ul1fs3N8KR6/8oA6eAKs/YYg7
 0MddWO3+wbOq1nkQUsg9FCDZqrIUvK+ABoLxABGS3sFLIaRNywvYbNXTRZnovtKbMF
 8Z6VdhHo1N2Jg==
Date: Wed, 27 Mar 2024 12:33:28 -0500
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Robert Foss <rfoss@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2] dt-bindings: display: bridge: it6505: Add
 #sound-dai-cells
Message-ID: <171156080808.3681700.13600868771478432605.robh@kernel.org>
References: <20240327085250.3427496-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327085250.3427496-1-wenst@chromium.org>
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


On Wed, 27 Mar 2024 16:52:48 +0800, Chen-Yu Tsai wrote:
> The ITE IT6505 display bridge can take one I2S input and transmit it
> over the DisplayPort link.
> 
> Add #sound-dai-cells (= 0) to the binding for it.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1 [1]:
> - Reference /schemas/sound/dai-common.yaml
> - Change "additionalProperties: false" to "unevaluatedProperties: false"
> 
> The driver side changes [2] are still being worked on.
> 
> [1] https://lore.kernel.org/dri-devel/20240126073511.2708574-1-wenst@chromium.org/
> [2] https://lore.kernel.org/linux-arm-kernel/20230730180803.22570-4-jiaxin.yu@mediatek.com/
> ---
>  .../devicetree/bindings/display/bridge/ite,it6505.yaml    | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

