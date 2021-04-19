Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC57A363AD0
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 07:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E6589ECD;
	Mon, 19 Apr 2021 05:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2D789ECD
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 05:02:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 65BC961078;
 Mon, 19 Apr 2021 05:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618808539;
 bh=srAR5o/oGq5ioibP/eXNEOXMJgehSJWXVDMJHT8j86M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q2aSyWKadyluHjWWN1SwyxF3iNnBxBRV4eFwfMyHPgeuOCbx3zVu4VA/PQblKt1mX
 LG/8Qa12wOxexoPdM1AtRUqEwffA6hhUzg5XvoNYf5i8CVaEzIb5aHKsxdmdIZ0VNh
 EB/GtCUOovxwGQ5QiY5CwzbiGBepA6YRCHaOc9bFp2O+m0lnHel/QMKuqas1XJG+Ml
 vece3azY0OPvilnrF9TxEM4Y2QEUh42RCB/qgDYU4n+IIRFMdKunRACTXFpDc2oJTx
 Tw4u0mxUHQNeAMruPlzpJF4CCm1VJVvyur9NU2SbLDowYlZY9RFqgpKroyAxadDiZV
 1t4tD3zjj0ZKQ==
Date: Mon, 19 Apr 2021 08:02:15 +0300
From: Leon Romanovsky <leon@kernel.org>
To: "Alice Guo (OSS)" <alice.guo@oss.nxp.com>
Subject: Re: [RFC v1 PATCH 3/3] driver: update all the code that use
 soc_device_match
Message-ID: <YH0O1104YEdjY9mb@unreal>
References: <20210419042722.27554-1-alice.guo@oss.nxp.com>
 <20210419042722.27554-4-alice.guo@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210419042722.27554-4-alice.guo@oss.nxp.com>
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
Cc: ulf.hansson@linaro.org, aymen.sghaier@nxp.com, geert+renesas@glider.be,
 rafael@kernel.org, airlied@linux.ie, mturquette@baylibre.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 a.hajda@samsung.com, netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 will@kernel.org, linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 wim@linux-watchdog.org, herbert@gondor.apana.org.au, horia.geanta@nxp.com,
 khilman@baylibre.com, joro@8bytes.org, narmstrong@baylibre.com,
 linux-staging@lists.linux.dev, iommu@lists.linux-foundation.org,
 peter.ujfalusi@gmail.com, kishon@ti.com, tony@atomide.com,
 linux-omap@vger.kernel.org, stern@rowland.harvard.edu, kuba@kernel.org,
 linux@roeck-us.net, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Roy.Pledge@nxp.com, linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, edubezval@gmail.com, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, ssantosh@kernel.org,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, balbi@kernel.org, tomba@kernel.org,
 sboyd@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, adrian.hunter@intel.com, robert.foss@linaro.org,
 leoyang.li@nxp.com, linux@prisktech.co.nz, vkoul@kernel.org,
 linux-crypto@vger.kernel.org, j-keerthy@ti.com, dmaengine@vger.kernel.org,
 jyri.sarha@iki.fi, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 19, 2021 at 12:27:22PM +0800, Alice Guo (OSS) wrote:
> From: Alice Guo <alice.guo@nxp.com>
> 
> Update all the code that use soc_device_match because add support for
> soc_device_match returning -EPROBE_DEFER.
> 
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
>  drivers/bus/ti-sysc.c                         |  2 +-
>  drivers/clk/renesas/r8a7795-cpg-mssr.c        |  4 +++-
>  drivers/clk/renesas/rcar-gen2-cpg.c           |  2 +-
>  drivers/clk/renesas/rcar-gen3-cpg.c           |  2 +-
>  drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c       |  7 ++++++-
>  drivers/dma/ti/k3-psil.c                      |  3 +++
>  drivers/dma/ti/k3-udma.c                      |  2 +-
>  drivers/gpu/drm/bridge/nwl-dsi.c              |  2 +-
>  drivers/gpu/drm/meson/meson_drv.c             |  4 +++-
>  drivers/gpu/drm/omapdrm/dss/dispc.c           |  2 +-
>  drivers/gpu/drm/omapdrm/dss/dpi.c             |  4 +++-
>  drivers/gpu/drm/omapdrm/dss/dsi.c             |  3 +++
>  drivers/gpu/drm/omapdrm/dss/dss.c             |  3 +++
>  drivers/gpu/drm/omapdrm/dss/hdmi4_core.c      |  3 +++
>  drivers/gpu/drm/omapdrm/dss/venc.c            |  4 +++-
>  drivers/gpu/drm/omapdrm/omap_drv.c            |  3 +++
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  4 +++-
>  drivers/gpu/drm/rcar-du/rcar_lvds.c           |  2 +-
>  drivers/gpu/drm/tidss/tidss_dispc.c           |  4 +++-
>  drivers/iommu/ipmmu-vmsa.c                    |  7 +++++--
>  drivers/media/platform/rcar-vin/rcar-core.c   |  2 +-
>  drivers/media/platform/rcar-vin/rcar-csi2.c   |  2 +-
>  drivers/media/platform/vsp1/vsp1_uif.c        |  4 +++-
>  drivers/mmc/host/renesas_sdhi_core.c          |  2 +-
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c |  2 +-
>  drivers/mmc/host/sdhci-of-esdhc.c             | 21 ++++++++++++++-----
>  drivers/mmc/host/sdhci-omap.c                 |  2 +-
>  drivers/mmc/host/sdhci_am654.c                |  2 +-
>  drivers/net/ethernet/renesas/ravb_main.c      |  4 +++-
>  drivers/net/ethernet/ti/am65-cpsw-nuss.c      |  2 +-
>  drivers/net/ethernet/ti/cpsw.c                |  2 +-
>  drivers/net/ethernet/ti/cpsw_new.c            |  2 +-
>  drivers/phy/ti/phy-omap-usb2.c                |  4 +++-
>  drivers/pinctrl/renesas/core.c                |  2 +-
>  drivers/pinctrl/renesas/pfc-r8a7790.c         |  5 ++++-
>  drivers/pinctrl/renesas/pfc-r8a7794.c         |  5 ++++-
>  drivers/soc/fsl/dpio/dpio-driver.c            | 13 ++++++++----
>  drivers/soc/renesas/r8a774c0-sysc.c           |  5 ++++-
>  drivers/soc/renesas/r8a7795-sysc.c            |  2 +-
>  drivers/soc/renesas/r8a77990-sysc.c           |  5 ++++-
>  drivers/soc/ti/k3-ringacc.c                   |  2 +-
>  drivers/staging/mt7621-pci/pci-mt7621.c       |  2 +-
>  drivers/thermal/rcar_gen3_thermal.c           |  4 +++-
>  drivers/thermal/ti-soc-thermal/ti-bandgap.c   | 10 +++++++--
>  drivers/usb/gadget/udc/renesas_usb3.c         |  2 +-
>  drivers/usb/host/ehci-platform.c              |  4 +++-
>  drivers/usb/host/xhci-rcar.c                  |  2 +-
>  drivers/watchdog/renesas_wdt.c                |  2 +-
>  48 files changed, 131 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> index 5fae60f8c135..00c59aa217c1 100644
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -2909,7 +2909,7 @@ static int sysc_init_soc(struct sysc *ddata)
>  	}
>  
>  	match = soc_device_match(sysc_soc_feat_match);
> -	if (!match)
> +	if (!match || IS_ERR(match))
>  		return 0;
>  
>  	if (match->data)
> diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> index c32d2c678046..90a18336a4c3 100644
> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> @@ -439,6 +439,7 @@ static const unsigned int r8a7795es2_mod_nullify[] __initconst = {
>  
>  static int __init r8a7795_cpg_mssr_init(struct device *dev)
>  {
> +	const struct soc_device_attribute *match;
>  	const struct rcar_gen3_cpg_pll_config *cpg_pll_config;
>  	u32 cpg_mode;
>  	int error;
> @@ -453,7 +454,8 @@ static int __init r8a7795_cpg_mssr_init(struct device *dev)
>  		return -EINVAL;
>  	}
>  
> -	if (soc_device_match(r8a7795es1)) {
> +	match = soc_device_match(r8a7795es1);
> +	if (!IS_ERR(match) && match) {

"if (!IS_ERR_OR_NULL(match))" in all places.

Thanks
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
