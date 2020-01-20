Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B67142B75
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 14:04:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973946E945;
	Mon, 20 Jan 2020 13:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E716E945
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 13:04:10 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00KD46lY079041;
 Mon, 20 Jan 2020 07:04:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1579525446;
 bh=ItlXxfvFqN86feRVM1/s/Fi+wNsFA84t0RI7ZpiCwMk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=uehzQ3hGgJC+c+wqcVC2f+/3m17dG/82ITuWTNpgnDtCNVWYHBaKF/I/+TCp6zhDy
 aT4KU2OtcchC5/sgZeG6fpl5c9xLOikXlmPXQqEmSnm3qlh/huc/PyNG6d88Gj6/P1
 lVbaRJgQ9iqsPpYY1DOUWE5mZJQ9Ib8enoDgJMj8=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00KD46hf014202
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 20 Jan 2020 07:04:06 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 20
 Jan 2020 07:04:05 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 20 Jan 2020 07:04:05 -0600
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id 00KD45E3033233;
 Mon, 20 Jan 2020 07:04:05 -0600
Date: Mon, 20 Jan 2020 07:07:54 -0600
From: Benoit Parrot <bparrot@ti.com>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v7 4/5] drm/tidss: New driver for TI Keystone platform
 Display SubSystem
Message-ID: <20200120130753.tbectccc3qemiavg@ti.com>
References: <cover.1579202260.git.jsarha@ti.com>
 <357b1aa13f28dba5fcb9f769bdac6d0d5ff966b3.1579202260.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <357b1aa13f28dba5fcb9f769bdac6d0d5ff966b3.1579202260.git.jsarha@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: devicetree@vger.kernel.org, yamonkar@cadence.com, praneeth@ti.com,
 sjakhade@cadence.com, dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com,
 robh+dt@kernel.org, tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com,
 subhajit_paul@ti.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jyri Sarha <jsarha@ti.com> wrote on Fri [2020-Jan-17 00:09:29 +0200]:
> This patch adds a new DRM driver for Texas Instruments DSS IPs used on
> Texas Instruments Keystone K2G, AM65x, and J721e SoCs. The new DSS IP is
> a major change to the older DSS IP versions, which are supported by
> the omapdrm driver. While on higher level the Keystone DSS resembles
> the older DSS versions, the registers are completely different and the
> internal pipelines differ a lot.
> 
> DSS IP found on K2G is an "ultra-light" version, and has only a single
> plane and a single output. The K3 DSS IPs are found on AM65x and J721E
> SoCs. AM65x DSS has two video ports, one full video plane, and another
> "lite" plane without scaling support. J721E has 4 video ports, 2 video
> planes and 2 lite planes. AM65x DSS has also an integrated OLDI (LVDS)
> output.
> 
> Version history:
> 
> v2: - rebased on top of drm-next-2019-11-27
>     - sort all include lines in all files
>     - remove all include <drm/drmP.h>
>     - remove select "select VIDEOMODE_HELPERS"
>     - call dispc_vp_setup() later in tidss_crtc_atomic_flush() (there is no
>       to call it in new modeset case as it is also called in vp_enable())
>     - change probe sequence and drm_device allocation (follow example in
>       drm_drv.c)
>     - use __maybe_unused instead of #ifdef for pm functions
>     - remove "struct drm_fbdev_cma *fbdev;" from driver data
>     - check panel connector type before connecting it
> 
> v3: no change
> 
> v4: no change
> 
> v5: - remove fifo underflow irq handling, it is not an error and
>       it should be used for debug purposes only
>     - memory tuning, prefetch plane fifo up to high-threshold value to
>       minimize possibility of underflows.
> 
> v6: - Check CTM and gamma support from dispc_features when creating crtc
>     - Implement CTM support for k2g and fix k3 CTM implementation
>     - Remove gamma property persistence and always write color properties
>       in a new modeset
> 
> v7: - Fix checkpatch.pl --strict issues
>     - Rebase on top of drm-misc-next-2020-01-10
> 
> Co-developed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---

<snip>

> +
> +int dispc_init(struct tidss_device *tidss)
> +{
> +	struct device *dev = tidss->dev;
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct dispc_device *dispc;
> +	const struct dispc_features *feat;
> +	unsigned int i, num_fourccs;
> +	int r = 0;
> +
> +	dev_dbg(dev, "%s\n", __func__);
> +
> +	feat = tidss->feat;
> +
> +	if (feat->subrev != DISPC_K2G) {
> +		r = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(48));
> +		if (r)
> +			dev_warn(dev, "cannot set DMA masks to 48-bit\n");
> +	}
> +
> +	dispc = devm_kzalloc(dev, sizeof(*dispc), GFP_KERNEL);
> +	if (!dispc)
> +		return -ENOMEM;
> +
> +	dispc->fourccs = devm_kcalloc(dev, ARRAY_SIZE(dispc_color_formats),
> +				      sizeof(*dispc->fourccs), GFP_KERNEL);
> +	if (!dispc->fourccs)
> +		return -ENOMEM;
> +
> +	num_fourccs = 0;
> +	for (i = 0; i < ARRAY_SIZE(dispc_color_formats); ++i) {
> +		if (feat->errata.i2000 &&
> +		    dispc_fourcc_is_yuv(dispc_color_formats[i].fourcc))
> +			continue;
> +		dispc->fourccs[num_fourccs++] = dispc_color_formats[i].fourcc;
> +	}
> +	dispc->num_fourccs = num_fourccs;
> +	dispc->tidss = tidss;
> +	dispc->dev = dev;
> +	dispc->feat = feat;
> +
> +	dispc_common_regmap = dispc->feat->common_regs;
> +
> +	r = dispc_iomap_resource(pdev, dispc->feat->common,
> +				 &dispc->base_common);
> +	if (r)
> +		return r;
> +
> +	for (i = 0; i < dispc->feat->num_planes; i++) {
> +		r = dispc_iomap_resource(pdev, dispc->feat->vid_name[i],
> +					 &dispc->base_vid[i]);
> +		dev_dbg(dev, "%s: %u %s %d\n", __func__,
> +			i, dispc->feat->vid_name[i], r);

dispc_iomap_resource() already print an error trace when something is
wrong. Not sure this dev_dbg add any info.

> +		if (r)
> +			return r;
> +	}
> +
> +	for (i = 0; i < dispc->feat->num_vps; i++) {
> +		u32 gamma_size = dispc->feat->vp_feat.color.gamma_size;
> +		u32 *gamma_table;
> +		struct clk *clk;
> +
> +		r = dispc_iomap_resource(pdev, dispc->feat->ovr_name[i],
> +					 &dispc->base_ovr[i]);
> +		dev_dbg(dev, "%s: %u %s %d\n", __func__,
> +			i, dispc->feat->ovr_name[i], r);

Same here.

> +		if (r)
> +			return r;
> +
> +		r = dispc_iomap_resource(pdev, dispc->feat->vp_name[i],
> +					 &dispc->base_vp[i]);
> +		dev_dbg(dev, "%s: %u %s %d\n", __func__,
> +			i, dispc->feat->vp_name[i], r);

And here.

But with or without this change

Reviewed-by: Benoit Parrot <bparrot@ti.com>

> +		if (r)
> +			return r;
> +
> +		clk = devm_clk_get(dev, dispc->feat->vpclk_name[i]);
> +		if (IS_ERR(clk)) {
> +			dev_err(dev, "%s: Failed to get clk %s:%ld\n", __func__,
> +				dispc->feat->vpclk_name[i], PTR_ERR(clk));
> +			return PTR_ERR(clk);
> +		}
> +		dispc->vp_clk[i] = clk;
> +
> +		gamma_table = devm_kmalloc_array(dev, gamma_size,
> +						 sizeof(*gamma_table),
> +						 GFP_KERNEL);
> +		if (!gamma_table)
> +			return -ENOMEM;
> +		dispc->vp_data[i].gamma_table = gamma_table;
> +	}
> +
> +	if (feat->subrev == DISPC_AM65X) {
> +		r = dispc_init_am65x_oldi_io_ctrl(dev, dispc);
> +		if (r)
> +			return r;
> +	}
> +
> +	dispc->fclk = devm_clk_get(dev, "fck");
> +	if (IS_ERR(dispc->fclk)) {
> +		dev_err(dev, "%s: Failed to get fclk: %ld\n",
> +			__func__, PTR_ERR(dispc->fclk));
> +		return PTR_ERR(dispc->fclk);
> +	}
> +	dev_dbg(dev, "DSS fclk %lu Hz\n", clk_get_rate(dispc->fclk));
> +
> +	of_property_read_u32(dispc->dev->of_node, "max-memory-bandwidth",
> +			     &dispc->memory_bandwidth_limit);
> +
> +	tidss->dispc = dispc;
> +
> +	return 0;
> +}
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
