Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF00884A376
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 20:19:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5CF10FBF9;
	Mon,  5 Feb 2024 19:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qtKVLMrt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D4710FBF9
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 19:19:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AC509CE0F20;
 Mon,  5 Feb 2024 19:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B54C433C7;
 Mon,  5 Feb 2024 19:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707160758;
 bh=IQgAhNiM9Q3k0p3uoVL7JBB79afL2zsOoVNpWvCcKl4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qtKVLMrtkrK2hMUJn94uioxTjvRe0KKC3dIcgh4mWv/uMQK3iM7kyMimKmR0kBweM
 2VyhcNFlxjudSEn7ZKDga6Mtcj1PmYaCjnQFrlqWdldeavwXGpUYuoDcwR4yBaNjiy
 Vzadv3oNb0ObugFg5PT+JoDxRMND8EDRg7B5lwsMO46Hk6UHv2DjiL4MxyrpoRIn6q
 By68DuMz4rjTBxnWm8gPnpvcEAUo/aihoZ1X+SRyNWC2OPCZWE6k5XiZoULWw41D6Y
 ovLAm/Bievxa7cZT8ZStH2zGyjQkg3JLZMFlG62kCiyCS/cdypB2ZQ5vFFk3cqqcyR
 uze7Hi4MG6BQg==
Date: Mon, 5 Feb 2024 19:19:15 +0000
From: Rob Herring <robh@kernel.org>
To: Adam Ford <aford173@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 frieder.schrempf@kontron.de, alexander.stein@ew.tq-group.com,
 Maxime Ripard <mripard@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Lucas Stach <l.stach@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, marex@denx.de,
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Liu Ying <victor.liu@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-pm@vger.kernel.org
Subject: Re: [PATCH V8 03/12] dt-bindings: soc: imx: add missing clock and
 power-domains to imx8mp-hdmi-blk-ctrl
Message-ID: <170716075503.138486.15196612878281167365.robh@kernel.org>
References: <20240203165307.7806-1-aford173@gmail.com>
 <20240203165307.7806-4-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240203165307.7806-4-aford173@gmail.com>
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


On Sat, 03 Feb 2024 10:52:43 -0600, Adam Ford wrote:
> Per guidance from the NXP downstream kernel, if the clock is
> disabled before HDMI/LCDIF probe, LCDIF will not get pixel
> clock from HDMI PHY and throw an error:
> 
> [CRTC:39:crtc-2] vblank wait timed out
>     WARNING: CPU: 2 PID: 9 at drivers/gpu/drm/drm_atomic_helper.c:
>         1634 drm_atomic_helper_wait_for_vblanks.part.0+0x23c/0x260
> 
> Fix this by adding the fdcc clock to the hdmi_blk_ctrl.  This
> should be safe, since neither this power domain nor the dependent
> HDMI and LCDIF drivers been enabled or added to the SoC device
> tree yet.
> 
> According to Sandor Yu from NXP, "the FDCC clock is not for HDMITX
> in desgin, but it is part of HDMI domain that needed by HDMITX.
> So I think it is reasonable added it to the power domain driver."
> 
> The driver also supports two power domains which are missing from the binding
> that also fix an issue with resuming from suspend.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
> V2:  Update commit message to both show error and give a bit more
>      background.
>      Add missing power domains hdcp and hdrv as pointed out by Marek Vasut
> ---
>  .../soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml     | 22 ++++++++++++-------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

