Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 159A69CE003
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 14:32:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4447F10E2D0;
	Fri, 15 Nov 2024 13:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="x/yKgXzt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029DC10E2D0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 13:32:38 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9F1578933F;
 Fri, 15 Nov 2024 14:32:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1731677557;
 bh=H+qj7oh9KNg4cPkW2m+Q2tqwjODFyQtNZoavOVJ3o1s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=x/yKgXzt5wXdAhX1heSr54ECEMtwnb7KeIjmhCnEFKsCmW55rEtnTUDRTOYa6DgOl
 1q4lxu/oPO0lQDqPj+7YqFaNctKqkC00ktQpuyapcEsphRjU/baM0WTsMMrkZEq+YA
 J912rP2jKFVOMTK4V5tEQmqdbkZlr9rvC6QDxgsqFr3gCYfBGDm5fh/7qrf2Bugb81
 exqm5vFPCgl6dyhT9hNJYpZyr0FU6OZXzfOR1dLJO7L+Bf6BnXGmp03BYdgi6iqUBQ
 83EefnCuEz9o3BwHN6cmXG155y1UAHVRX4OsR7mWlhJxRzelXyltN/PZJJu7O9K6Fy
 8FID/dPGlBYww==
Message-ID: <df6ebdde-65f8-4aad-93c7-b1df695bd2ef@denx.de>
Date: Fri, 15 Nov 2024 13:31:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/7] Revert "clk: imx: clk-imx8mp: Allow media_disp
 pixel clock reconfigure parent rate"
To: Liu Ying <victor.liu@nxp.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
 sboyd@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com
References: <20241114065759.3341908-1-victor.liu@nxp.com>
 <20241114065759.3341908-3-victor.liu@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241114065759.3341908-3-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

On 11/14/24 7:57 AM, Liu Ying wrote:
> This reverts commit ff06ea04e4cf3ba2f025024776e83bfbdfa05155.
> 
> media_disp1_pix clock is the pixel clock of the first i.MX8MP LCDIFv3
> display controller, while media_disp2_pix clock is the pixel clock of
> the second i.MX8MP LCDIFv3 display controller.  The two display
> controllers connect with Samsung MIPI DSI controller and LVDS Display
> Bridge(LDB) respectively.  Since the two display controllers are driven
> by separate DRM driver instances and the two pixel clocks may be derived
> from the same video_pll1_out clock(sys_pll3_out clock could be already
> used to derive audio_axi clock), there is no way to negotiate a dynamically
> changeable video_pll1_out clock rate to satisfy both of the two display
> controllers.  In this case, the only solution to drive them with the
> single video_pll1_out clock is to assign a sensible/unchangeable clock
> rate for video_pll1_out clock.  Thus, there is no need to set the
> CLK_SET_RATE_PARENT flag for media_disp{1,2}_pix clocks, drop it then.
> 
> Fixes: ff06ea04e4cf ("clk: imx: clk-imx8mp: Allow media_disp pixel clock reconfigure parent rate")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
Uh, I almost missed this revert between all the LDB patches.

This revert will break my usecase on MX8MP where I need to operate two 
disparate panels attached to LVDS and TC358767 DSI-to-DP bridge and I 
need accurate pixel clock for both. Not being able to configure accurate 
pixel clock will make the displays not work, so from my side, this is a 
NAK, sorry.

There has to be some better solution which still allows the PLL 
reconfiguration to achieve accurate pixel clock.
