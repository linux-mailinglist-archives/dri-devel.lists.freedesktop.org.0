Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE54C3F7B43
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 19:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552BD8994A;
	Wed, 25 Aug 2021 17:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D961789811
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 17:11:26 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 73dc3883-05c7-11ec-aa7e-0050568cd888;
 Wed, 25 Aug 2021 17:11:14 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 641C3194B34;
 Wed, 25 Aug 2021 19:11:29 +0200 (CEST)
Date: Wed, 25 Aug 2021 19:11:20 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Philip Chen <philipchen@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, swboyd@chromium.org,
 dianders@chromium.org, Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/bridge: parade-ps8640: Reorg the macros
Message-ID: <YSZ5uE+BEkk6gQ0p@ravnborg.org>
References: <20210824181140.v2.1.I8ead7431357409f2526e5739ec5bc3ddfd242243@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824181140.v2.1.I8ead7431357409f2526e5739ec5bc3ddfd242243@changeid>
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

On Tue, Aug 24, 2021 at 06:11:55PM -0700, Philip Chen wrote:
> Reorg the macros as follows:
> (1) Group the registers on the same page together.
> (2) Group the register and its bit operation together while indenting
> the macros of the bit operation with one space.
> 
> Also fix a misnomer for the number of mipi data lanes.
> 
> Signed-off-by: Philip Chen <philipchen@chromium.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> 
> Changes in v2:
> - Fix the double sign-off lines
> 
>  drivers/gpu/drm/bridge/parade-ps8640.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 7bd0affa057a..685e9c38b2db 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -18,16 +18,18 @@
>  #include <drm/drm_print.h>
>  
>  #define PAGE2_GPIO_H		0xa7
> -#define PS_GPIO9		BIT(1)
> +#define  PS_GPIO9		BIT(1)
>  #define PAGE2_I2C_BYPASS	0xea
> -#define I2C_BYPASS_EN		0xd0
> +#define  I2C_BYPASS_EN		0xd0
>  #define PAGE2_MCS_EN		0xf3
> -#define MCS_EN			BIT(0)
> +#define  MCS_EN			BIT(0)
> +
>  #define PAGE3_SET_ADD		0xfe
> -#define VDO_CTL_ADD		0x13
> -#define VDO_DIS			0x18
> -#define VDO_EN			0x1c
> -#define DP_NUM_LANES		4
> +#define  VDO_CTL_ADD		0x13
> +#define  VDO_DIS		0x18
> +#define  VDO_EN			0x1c
> +
> +#define NUM_MIPI_LANES		4
>  
>  /*
>   * PS8640 uses multiple addresses:
> @@ -254,7 +256,7 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
>  			  MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
> -	dsi->lanes = DP_NUM_LANES;
> +	dsi->lanes = NUM_MIPI_LANES;
>  	ret = mipi_dsi_attach(dsi);
>  	if (ret)
>  		goto err_dsi_attach;
> -- 
> 2.33.0.rc2.250.ged5fa647cd-goog
