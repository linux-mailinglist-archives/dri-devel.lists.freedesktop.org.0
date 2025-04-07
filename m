Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B59EA7E81A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 19:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8919210E539;
	Mon,  7 Apr 2025 17:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="oFbmJpme";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com
 [91.218.175.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90FB110E539
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 17:25:36 +0000 (UTC)
Message-ID: <874b566f-8e19-4af8-bb6b-e0e5eff7b5f5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1744046734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZHM7lHGP8muDGkPak7XcuoIV5Sq2eECb4HN6J4ncuwY=;
 b=oFbmJpme/vhWb25/PtxCTNlmlE6Hk9GVpsnEPaiQJLu8+l+zEXJJylVSYilpIDBtgvKrJL
 zqA5IYo0qDxuil41M7QAZv6h0NLWQVwBZEPcTJPyktDGGmv2QAVAAY5/ncNBe+XlGQ6YHO
 OANqbYgjV/bFKBPaC9OlMrhqhjy8dUQ=
Date: Mon, 7 Apr 2025 22:54:41 +0530
MIME-Version: 1.0
Subject: Re: [PATCH v2 05/18] phy: cdns-dphy: Remove leftover code
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>,
 Devarsh Thakkar <devarsht@ti.com>
References: <20250402-cdns-dsi-impro-v2-0-4a093eaa5e27@ideasonboard.com>
 <20250402-cdns-dsi-impro-v2-5-4a093eaa5e27@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20250402-cdns-dsi-impro-v2-5-4a093eaa5e27@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi Tomi,

Thank you for the patches!

On 02/04/25 19:00, Tomi Valkeinen wrote:
> The code in cdns-dphy has probably been part of a DSI driver in the
> past. Remove DSI defines and variables which are not used or do not
> actually do anything. Also rename cdns_dsi_get_dphy_pll_cfg() to
> cdns_get_dphy_pll_cfg(), i.e. drop the "dsi", as it's not relevant here.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/phy/cadence/cdns-dphy.c | 19 ++++---------------
>  1 file changed, 4 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/phy/cadence/cdns-dphy.c b/drivers/phy/cadence/cdns-dphy.c
> index f79ec4fab409..7f8b70ec10c5 100644
> --- a/drivers/phy/cadence/cdns-dphy.c
> +++ b/drivers/phy/cadence/cdns-dphy.c
> @@ -55,14 +55,6 @@
>  #define DPHY_PSM_CFG_FROM_REG		BIT(0)
>  #define DPHY_PSM_CLK_DIV(x)		((x) << 1)
>  
> -#define DSI_HBP_FRAME_OVERHEAD		12
> -#define DSI_HSA_FRAME_OVERHEAD		14
> -#define DSI_HFP_FRAME_OVERHEAD		6
> -#define DSI_HSS_VSS_VSE_FRAME_OVERHEAD	4
> -#define DSI_BLANKING_FRAME_OVERHEAD	6
> -#define DSI_NULL_FRAME_OVERHEAD		6
> -#define DSI_EOT_PKT_SIZE		4
> -
>  #define DPHY_TX_J721E_WIZ_PLL_CTRL	0xF04
>  #define DPHY_TX_J721E_WIZ_STATUS	0xF08
>  #define DPHY_TX_J721E_WIZ_RST_CTRL	0xF0C
> @@ -117,10 +109,9 @@ static const unsigned int tx_bands[] = {
>  	870, 950, 1000, 1200, 1400, 1600, 1800, 2000, 2200, 2500
>  };
>  
> -static int cdns_dsi_get_dphy_pll_cfg(struct cdns_dphy *dphy,
> -				     struct cdns_dphy_cfg *cfg,
> -				     struct phy_configure_opts_mipi_dphy *opts,
> -				     unsigned int *dsi_hfp_ext)
> +static int cdns_get_dphy_pll_cfg(struct cdns_dphy *dphy,

nit: cdns_dphy_get_pll_cfg seems more appropriate. We even have a
cdns_dphy_set_pll_cfg.

> +				 struct cdns_dphy_cfg *cfg,
> +				 struct phy_configure_opts_mipi_dphy *opts)
>  {
>  	unsigned long pll_ref_hz = clk_get_rate(dphy->pll_ref_clk);
>  	u64 dlane_bps;
> @@ -289,15 +280,13 @@ static int cdns_dphy_config_from_opts(struct phy *phy,
>  				      struct cdns_dphy_cfg *cfg)
>  {
>  	struct cdns_dphy *dphy = phy_get_drvdata(phy);
> -	unsigned int dsi_hfp_ext = 0;
>  	int ret;
>  
>  	ret = phy_mipi_dphy_config_validate(opts);
>  	if (ret)
>  		return ret;
>  
> -	ret = cdns_dsi_get_dphy_pll_cfg(dphy, cfg,
> -					opts, &dsi_hfp_ext);
> +	ret = cdns_get_dphy_pll_cfg(dphy, cfg, opts);
>  	if (ret)
>  		return ret;
>  
> 

Apart from the small comment above,

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

